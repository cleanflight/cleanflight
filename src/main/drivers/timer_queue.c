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

struct {
    timerQueueRec_t* heap[TIMERQUEUE_QUEUE_LEN];
    unsigned heapLen;
    timerQueueRec_t* isr[TIMERQUEUE_ISRQUEUE_LEN];
    unsigned isrHead, isrTail;
    volatile timCCR_t *timCCR;
    volatile timCNT_t *timCNT;
    timerCCHandlerRec_t compareCb;
    callbackRec_t callback;
} timerQueue;

void timerQueue_TimerCompareEvent(timerCCHandlerRec_t* self_, uint16_t compare);
void timerQueue_CallbackEvent(callbackRec_t *cb);
static void timerQueue_Run(void);
static void timerQueue_EnqueuePending(void);
static int timerQueue_QueueInsert(timerQueueRec_t *rec);
static void timerQueue_QueueDelete(timerQueueRec_t *rec);
static void timerQueue_QueueDeleteIdx(unsigned parent);

void timerQueue_Init(void)
{
    const timerHardware_t * timHw = &timerHardware[TIMER_QUEUE_CHANNEL];
    timerQueue.heapLen = 0;
    timerQueue.isrHead = timerQueue.isrTail = 0;
    timerQueue.timCCR = timerChCCR(timHw);
    timerQueue.timCNT = timerChCNT(timHw);
    timerChInit(timHw, TYPE_TIMER, RESOURCE_TIMER, NVIC_PRIO_TIMER, TIMERQUEUE_TIMER_FREQ);
    timerChConfigOC(timHw, false, false);
    timerChCCHandlerInit(&timerQueue.compareCb, timerQueue_TimerCompareEvent);
    callbackRegister(&timerQueue.callback, timerQueue_CallbackEvent);
    timerChConfigCallbacks(timHw, &timerQueue.compareCb, NULL);
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

void timerQueue_TimerCompareEvent(timerCCHandlerRec_t *self_, uint16_t compare)
{
    UNUSED(self_);
    UNUSED(compare);
    // Only trigger callback here. Queue operations may be slow
    callbackTrigger(&timerQueue.callback);
}

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
    if(timerQueue.heapLen) {
        timerChClearCCFlag(&timerHardware[TIMER_QUEUE_CHANNEL]);   // honour compare match flag from here if interrupt is enabled later
        *timerQueue.timCCR = timerQueue.heap[0]->time;
        if(tq_cmp_val(timerQueue.heap[0]->time, *timerQueue.timCNT) < 0) {
            // it is possible that we filled CCR too late. Run callbacks again immediately
            // TODO - what happens when we write CNT into CCR regsiter?
            goto check_again;
        }
        timerChITConfig(&timerHardware[TIMER_QUEUE_CHANNEL], ENABLE);
    } else {
        timerChITConfig(&timerHardware[TIMER_QUEUE_CHANNEL], DISABLE);
    }
}
