#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "platform.h"
#include "common/utils.h"
#include "common/atomic.h"

#include "callback.h"
#include "nvic.h"
#include "system.h"

#include "timer.h"
#include "timer_queue.h"

#define TIMERQUEUE_QUEUE_LEN 8
#define TIMERQUEUE_ISRQUEUE_LEN 8

#define TIMERQUEUE_TIMER_FREQ 1000000

#define TIMERQUEUE_EVENT_SOURCE_TIMCCR     1
#define TIMERQUEUE_EVENT_SOURCE_SYSTICK    2

#ifdef TIME_USE_TIMER
# define TIMERQUEUE_EVENT_SOURCE TIMERQUEUE_EVENT_SOURCE_SYSTICK
#else
# define TIMERQUEUE_EVENT_SOURCE TIMERQUEUE_EVENT_SOURCE_TIMCCR
#endif

struct {
    timerQueueRec_t* heap[TIMERQUEUE_QUEUE_LEN];
    unsigned heapLen;
    timerQueueRec_t* isr[TIMERQUEUE_ISRQUEUE_LEN];
    unsigned isrHead, isrTail;
    volatile timCNT_t *timCNT;
#if TIMERQUEUE_EVENT_SOURCE == TIMERQUEUE_EVENT_SOURCE_TIMCCR
    volatile timCCR_t *timCCR;
    timerCCHandlerRec_t compareCb;
#endif
    callbackRec_t callback;
} timerQueue;

#if TIMERQUEUE_EVENT_SOURCE == TIMERQUEUE_EVENT_SOURCE_SYSTICK
unsigned sysTicksPerUs;
#endif

#if TIMERQUEUE_EVENT_SOURCE == TIMERQUEUE_EVENT_SOURCE_TIMCCR
void timerQueue_TimerCompareEvent(timerCCHandlerRec_t* self_, uint16_t compare);
#endif
void timerQueue_CallbackEvent(callbackRec_t *cb);
static void timerQueue_Run(void);
static void timerQueue_EnqueuePending(void);
static int timerQueue_QueueInsert(timerQueueRec_t *rec);
static void timerQueue_QueueDelete(timerQueueRec_t *rec);
static void timerQueue_QueueDeleteIdx(unsigned parent);

void timerQueue_Init(void)
{
    timerQueue.heapLen = 0;
    timerQueue.isrHead = timerQueue.isrTail = 0;
#if TIMERQUEUE_EVENT_SOURCE == TIMERQUEUE_EVENT_SOURCE_TIMCCR
    const timerHardware_t * timHw = &timerHardware[TIMER_QUEUE_CHANNEL];
    timerQueue.timCCR = timerChCCR(timHw);
    timerQueue.timCNT = timerChCNT(timHw);
    timerChInit(timHw, TYPE_TIMER, RESOURCE_TIMER, NVIC_PRIO_TIMER, TIMERQUEUE_TIMER_FREQ);
    timerChConfigOC(timHw, false, false);
    timerChCCHandlerInit(&timerQueue.compareCb, timerQueue_TimerCompareEvent);
    timerChConfigCallbacks(timHw, &timerQueue.compareCb, NULL);
#elif TIMERQUEUE_EVENT_SOURCE == TIMERQUEUE_EVENT_SOURCE_SYSTICK
    timerQueue.timCNT = &TIME_TIMER->CNT;
    NVIC_SetPriority (SysTick_IRQn, NVIC_PRIO_SYSTICK >> (8 - __NVIC_PRIO_BITS));  /* set Priority for Systick Interrupt */
    SysTick->LOAD  = 0xffffff;
    SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk | SysTick_CTRL_ENABLE_Msk;                    /* Enable SysTick IRQ and SysTick Timer */
    sysTicksPerUs = SystemCoreClock / 1000000;
#else
# error "Unknown time source"
#endif
    callbackRegister(&timerQueue.callback, timerQueue_CallbackEvent);
}

// compare circular timestamps.
// result is negative when a<b, positive when a>b and zero if times are equal ..
// this can be improved by considering shorter 'history' interval (return int, add 2^16 if result is < CONST)
static inline int16_t tq_cmp_val(uint16_t a, uint16_t b)
{
    return a - b;
}

static inline int16_t tq_cmp(const timerQueueRec_t *a, timerQueueRec_t *b)
{
    return tq_cmp_val(a->time, b->time);
}

void timerQueue_Config(timerQueueRec_t *self, timerQueueCallbackFn *callbackFn)
{
    self->callbackFn = callbackFn;
    self->queuePos = 0;
    self->inIsrQueue = 0;
}

// this function must not interrupt CALLBACK isr (but can be called from callback handler)
// also make sure timerQueue_Start is not called after calling release (trom higher priority ISR)
void timerQueue_Release(timerQueueRec_t *self)
{
    ATOMIC_BLOCK(NVIC_PRIO_CALLBACK) {
        timerQueue_EnqueuePending();             // make sure this timer not in ISR queue. Is is simpler that explicit check
        if(self->queuePos)
            timerQueue_QueueDelete(self);
    }
}

// this will mark timer to be inserted into queue. Insertion will be done from callback
// TODO - implemenet absolute time variant
// this function can be safely called from interrupt
void timerQueue_Start(timerQueueRec_t *self, int16_t timeout)
{
    ATOMIC_BLOCK_NB(NVIC_PRIO_TIMER) {
        ATOMIC_BARRIER(*self);
        ATOMIC_BARRIER(timerQueue);
        // update time if called multiple times
        self->timeISR = *timerQueue.timCNT + timeout;
        if(!self->inIsrQueue) {
            timerQueue.isr[timerQueue.isrHead] = self;
            timerQueue.isrHead = (timerQueue.isrHead + 1) % TIMERQUEUE_ISRQUEUE_LEN;
            self->inIsrQueue = true;
        }
    }
    callbackTrigger(&timerQueue.callback);
}

// insert record into priority queue
// return position where new record was inserted
// caller must be at CALLBACK priority
static int timerQueue_QueueInsert(timerQueueRec_t *rec)
{
    unsigned parent, child;
    child = ++timerQueue.heapLen;
    while(child > 1) {
        parent = child / 2;
        if(tq_cmp(timerQueue.heap[parent - 1], rec) <= 0) break;
        timerQueue.heap[child - 1] = timerQueue.heap[parent - 1];
        timerQueue.heap[child - 1]->queuePos = child;
        child = parent;
    }
    timerQueue.heap[child - 1] = rec;
    timerQueue.heap[child - 1]->queuePos = child;
    return child;
}

// delete record from priority queue
// caller must be at CALLBACK priority
static void timerQueue_QueueDelete(timerQueueRec_t *rec)
{
    if(rec->queuePos)
        timerQueue_QueueDeleteIdx(rec->queuePos);
}

// remove element at given index from queue
// caller must be at CALLBACK priority
static void timerQueue_QueueDeleteIdx(unsigned position)
{
    if(timerQueue.heapLen == 0) return;
    unsigned child, parent = position;
    timerQueueRec_t *last = timerQueue.heap[--timerQueue.heapLen];
    timerQueue.heap[parent - 1]->queuePos = 0;
    while ((child = 2 * parent) <= timerQueue.heapLen) {
        if (child < timerQueue.heapLen         // equivalent to child + 1 <= ...
            && tq_cmp(timerQueue.heap[child - 1], timerQueue.heap[child + 1 - 1]) >= 0)
            ++child;
        if(tq_cmp(last, timerQueue.heap[child - 1]) <= 0)
            break;
        timerQueue.heap[parent - 1] = timerQueue.heap[child - 1];
        timerQueue.heap[parent - 1]->queuePos = parent;
        parent = child;
    }
    timerQueue.heap[parent - 1] = last;
    timerQueue.heap[parent - 1]->queuePos = parent;
}

#if TIMERQUEUE_EVENT_SOURCE == TIMERQUEUE_EVENT_SOURCE_TIMCCR

void timerQueue_TimerCompareEvent(timerCCHandlerRec_t *self_, uint16_t compare)
{
    UNUSED(self_);
    UNUSED(compare);
    // Only trigger callback here. Queue operations may be slow
    callbackTrigger(&timerQueue.callback);
}
#endif

#if TIMERQUEUE_EVENT_SOURCE == TIMERQUEUE_EVENT_SOURCE_SYSTICK
// handle systick here
// SysTick has same priority as callback, so we can invoke processing directly, avoiding callback trampoline
void SysTick_Handler(void)
{
    timerQueue_EnqueuePending();
    timerQueue_Run();
}
#else
#error !
#endif

// callback function for timer queue
// - enqueue new handlers
// - trigger expired handlers
// - prepare new timer compare event
// this function must be called on CALLBBAK priority.  It is not reentrant
void timerQueue_CallbackEvent(callbackRec_t *cb)
{
    UNUSED(cb);
    timerQueue_EnqueuePending();
    timerQueue_Run();
}

// enqueue all timers started in ISR
// must be called at CALLBACK priority
static void timerQueue_EnqueuePending(void)
{
    // TODO - use linked list stored in timerQueueRec to handle this
    //   but that will need protection on TIMER priority ...
    while(timerQueue.isrHead != timerQueue.isrTail) {
        timerQueueRec_t *t = timerQueue.isr[timerQueue.isrTail];
        if(t->queuePos)
            timerQueue_QueueDelete(t);
        t->time = t->timeISR;
        timerQueue.isrTail = (timerQueue.isrTail + 1) % TIMERQUEUE_ISRQUEUE_LEN;
        t->inIsrQueue = false;
        timerQueue_QueueInsert(t);
    }
}

// must be called at CALLBACK priority
static void timerQueue_Run(void)
{
check_again:
    // trigger all due timers, removing them from queue
    while(timerQueue.heapLen
          && tq_cmp_val(timerQueue.heap[0]->time, *timerQueue.timCNT) < 0) {
        timerQueueRec_t *rec = timerQueue.heap[0];
        timerQueue_QueueDeleteIdx(1);                              // remove timer from queue first, so it is posible reinsert it in callback function
        rec->callbackFn(rec);                                      // call regitered function
    }
    // replan timer
#if TIMERQUEUE_EVENT_SOURCE == TIMERQUEUE_EVENT_SOURCE_TIMCCR
    if(timerQueue.heapLen) {
        timerChClearCCFlag(&timerHardware[TIMER_QUEUE_CHANNEL]);   // honour compare match flag from here if interrupt is enabled later
        *timerQueue.timCCR = timerQueue.heap[0]->time;
        if(tq_cmp_val(timerQueue.heap[0]->time, *timerQueue.timCNT) < 0) {
            // it is possible that we filled CCR too late. Run callbacks again immediately
            goto check_again;
        }
        timerChITConfig(&timerHardware[TIMER_QUEUE_CHANNEL], ENABLE);
    } else {
        timerChITConfig(&timerHardware[TIMER_QUEUE_CHANNEL], DISABLE);
    }
#elif TIMERQUEUE_EVENT_SOURCE == TIMERQUEUE_EVENT_SOURCE_SYSTICK
    if(timerQueue.heapLen) {
        int delta = tq_cmp_val(timerQueue.heap[0]->time, *timerQueue.timCNT);
        if(delta <= 0)
            goto check_again;
        delta *= sysTicksPerUs;
        if(delta > 0xffffff)          // bound to maximum reload value
            delta = 0xffffff;
        SysTick->LOAD = delta;
        SysTick->VAL = 0;             // force reload
        SysTick->LOAD = 0xffffff;     // reload big value after trigger so systick will trigger only once
    } else {
        SysTick->LOAD = 0xffffff;
        SysTick->VAL = 0;             // systick after ~230ms
    }
#endif

}
