#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "platform.h"
#include "common/utils.h"
#include "common/atomic.h"
#include "callback.h"
#include "system.h"
#include "nvic.h"
#include "pin_debug.h"

#include "timer.h"
#include "timer_queue.h"
#include "timer_input.h"

/* timer input fast handler. Input signal generates capture events,
   captured times are stored in receive queue
*/
void timerIn_timerCaptureEvent(timerCCHandlerRec_t *self_, uint16_t capture);
void timerIn_dualCaptureEventStart(timerCCHandlerRec_t *self_, uint16_t capture);
void timerIn_dualCaptureEventStore( timerCCHandlerRec_t *self_, uint16_t capture);

struct timerQueueRec_s;

// check buffer length assumption
#if TIMERIN_QUEUE_LEN & (TIMERIN_QUEUE_LEN - 1)
# error "TIMERIN_QUEUE_LEN must be power of 2"
#endif

void timerIn_Config(timerInputRec_t* self, const timerHardware_t* timHw, channelType_t owner, int priority, callbackRec_t *callback, struct timerQueueRec_s* timer, uint16_t flags)
{
    self->timHw = timHw;
    self->tim = timHw->tim;
    self->flags = flags;
    self->callback = callback;
    self->timer = timer;
    self->timeout = 0;
    if(self->flags & TIMERIN_QUEUE_DUALTIMER) {
        timerChInit(timHw, owner, RESOURCE_INPUT | RESOURCE_TIMER | RESOURCE_TIMER_DUAL, priority, 1000000);
        self->CCR = timerChCCRLo(timHw);
        timerChCCHandlerInit(&self->edgeLoCb, timerIn_dualCaptureEventStart);
        timerChCCHandlerInit(&self->edgeHiCb, timerIn_dualCaptureEventStore);
    } else {
        timerChInit(timHw, owner, RESOURCE_INPUT | RESOURCE_TIMER, priority, 1000000);
        self->CCR = timerChCCR(timHw);
        timerChCCHandlerInit(&self->edgeLoCb, timerIn_timerCaptureEvent);
    }
    timerIn_Restart(self);
}

void timerIn_Release(timerInputRec_t* self)
{
    if(self->flags & TIMERIN_QUEUE_DUALTIMER)
        timerChConfigCallbacksDual(self->timHw, NULL, NULL, NULL);
    else
        timerChConfigCallbacks(self->timHw, NULL, NULL);
}

void timerIn_Restart(timerInputRec_t* self)
{
    const timerHardware_t* timHw = self->timHw;

    if(self->flags & TIMERIN_QUEUE_DUALTIMER) {
        timerChConfigICDual(timHw, self->flags & TIMERIN_RISING, 42*72);  // halfbit interval for 115200. Safe for PWM/PPM input. This should be probably configurable in future
        timerChConfigGPIO(timHw, (self->flags & TIMERIN_PIN_IPU) ? Mode_IPU : Mode_IPD);
        timerChConfigCallbacksDual(timHw, &self->edgeLoCb, &self->edgeHiCb, NULL);
    } else {
        if(self->flags & TIMERIN_RISING)
            ATOMIC_AND(&self->flags, ~TIMERIN_FLAG_HIGH);
        else
            ATOMIC_OR(&self->flags, TIMERIN_FLAG_HIGH);
        timerChConfigIC(timHw, self->flags & TIMERIN_RISING, 42*72);
        timerChConfigGPIO(timHw, (self->flags & TIMERIN_PIN_IPU) ? Mode_IPU : Mode_IPD);
        timerChConfigCallbacks(timHw, &self->edgeLoCb, NULL);
    }
}

// this handler can't be interrupted by any timer code
void timerIn_timerCaptureEvent(timerCCHandlerRec_t *self_, uint16_t capture) {
    timerInputRec_t* self = container_of(self_, timerInputRec_t, edgeLoCb);

    // check buffer space first
    unsigned nxt = (self->qhead + 1) % TIMERIN_QUEUE_LEN;
    if(nxt == self->qtail) {
        // do not change polarity if queue is full. Next edge (with oposite direction) will be ignored
        // this way buffer stays synchronized
        return;
    }
    // toggle polarity if requested
    if(self->flags & TIMERIN_POLARITY_TOGGLE) {
        self->flags ^= TIMERIN_FLAG_HIGH;
        timerChICPolarity(self->timHw, !(self->flags & TIMERIN_FLAG_HIGH));
    }
    // store received value into buffer
    self->queue[self->qhead] = capture;
    self->qhead = nxt;

    // start timer if requested
    if(self->flags & TIMERIN_TIMEOUT_ON_EDGE) {
        self->flags &= ~TIMERIN_TIMEOUT_ON_EDGE;
        pinDbgHi(DBP_TIMERINPUT_EDGEDELAY);
        timerQueue_Start(self->timer, (capture - self->tim->CNT) + self->timeout);
    }
    if(!(self->flags & TIMERIN_QUEUE_BUFFER)
       || (((self->qhead - self->qtail) & (TIMERIN_QUEUE_LEN - 1)) > TIMERIN_QUEUE_HIGH) ) {   // flush only if queue is getting full
        callbackTrigger(self->callback);
    }
}

// this handler can't be interrupted by any timer code
void timerIn_dualCaptureEventStart(timerCCHandlerRec_t *self_, uint16_t capture) {
    timerInputRec_t* self = container_of(self_, timerInputRec_t, edgeLoCb);
    if(self->flags & TIMERIN_TIMEOUT_ON_EDGE) {
        self->flags &= ~TIMERIN_TIMEOUT_ON_EDGE;
        pinDbgHi(DBP_TIMERINPUT_EDGEDELAY);
        timerQueue_Start(self->timer, (capture - self->tim->CNT) + self->timeout);
        timerChITConfigDualLo(self->timHw, DISABLE);  // timer started, nothind else to do
    }
}

// this handler can't be interrupted by any timer code
void timerIn_dualCaptureEventStore(timerCCHandlerRec_t *self_, uint16_t capture) {
    timerInputRec_t* self = container_of(self_, timerInputRec_t, edgeHiCb);
    // two captured values are ready now
    unsigned nxt = (self->qhead + 2) % TIMERIN_QUEUE_LEN;
    if(nxt == (self->qtail & ~1)) {
        // both edges are discarded, so queue stays consistent
        // wake receiver, queue is full
        callbackTrigger(self->callback);
        return;
    }
    self->queue[self->qhead] = *self->CCR;
    self->queue[self->qhead + 1] = capture;  // or use self->CCR+offset ...
    self->qhead = nxt;

    if(!(self->flags & TIMERIN_QUEUE_BUFFER)
       || (((self->qhead - self->qtail) & (TIMERIN_QUEUE_LEN - 1)) > TIMERIN_QUEUE_HIGH) ) {   // flush only if queue is getting full
        callbackTrigger(self->callback);
    }
}

// prepare input timeout
// DUALTIMER - triggered by first edgeLo transition
// normal mode - triggered by first captured edge (setup trigger accordingly)
// return true if timeout is armed, false is something already happened and caller should check again

bool timerIn_ArmEdgeTimeout(timerInputRec_t* self)
{
    ATOMIC_BLOCK_NB(NVIC_PRIO_TIMER) {
        ATOMIC_BARRIER(*self);
        if(self->qhead == self->qtail) { // wait only if queue is empty
            self->flags |= TIMERIN_TIMEOUT_ON_EDGE;
            if(self->flags & TIMERIN_QUEUE_DUALTIMER)
                timerChITConfigDualLo(self->timHw, ENABLE);
            // IT flag must be set if first edge was already captured in dualtimer mode
            // it is cleared by reading corresponding CCR on store
            // keep this in mind when modifying this code
            return true;
        }
    }
    return false;
}

void timerIn_Reset(timerInputRec_t* self)
{
    ATOMIC_BLOCK(NVIC_PRIO_TIMER) {
        if(!(self->flags & TIMERIN_QUEUE_DUALTIMER)) {
            if(self->flags & TIMERIN_RISING)
                self->flags &= ~TIMERIN_FLAG_HIGH;
            else
                self->flags |= TIMERIN_FLAG_HIGH;
            timerChICPolarity(self->timHw, !(self->flags & TIMERIN_FLAG_HIGH));
        }
        self->qhead = self->qtail = 0;
        // we assume that caller knows that qtail will jump.
        // Use self->qhead=self->qtail if there are multiple consumers
    }
}

// only on/off implemented now
void timerIn_SetBuffering(timerInputRec_t *self, short buffer) {
    if(buffer) {
        ATOMIC_OR(&self->flags, TIMERIN_QUEUE_BUFFER);
    } else {
        ATOMIC_AND(&self->flags, ~TIMERIN_QUEUE_BUFFER);
    }
}


bool timerIn_QPeek(timerInputRec_t* self, uint16_t* capture, uint16_t* flags)
{
    if(self->qhead == self->qtail)
        return false;
    *capture = self->queue[self->qtail];
    *flags = (self->qtail & 1) ? 0 : TIMERIN_FLAG_HIGH;
    self->qtail = (self->qtail + 1) % TIMERIN_QUEUE_LEN;
    return true;
}

void timerIn_QPop(timerInputRec_t* self)
{
    self->qtail = (self->qtail + 1) % TIMERIN_QUEUE_LEN;
}

// queue position must be always even when using these functions
// will return true and undefined value in capture2 if only only half-pulse is in queue
bool timerIn_QPeek2(timerInputRec_t* self, uint16_t* capture1, uint16_t* capture2)
{
    if(self->qhead == self->qtail)
        return false;
    *capture1 = self->queue[self->qtail];
    *capture2 = self->queue[self->qtail + 1];  // access is aligned, so this is OK
    return true;
}

void timerIn_QPop2(timerInputRec_t* self)
{
    self->qtail = (self->qtail + 2) % TIMERIN_QUEUE_LEN;
}

int timerIn_QLen(timerInputRec_t* self) {
    return (self->qhead - self->qtail) & (TIMERIN_QUEUE_LEN - 1);
}

uint16_t timerIn_getTimCNT(timerInputRec_t *self) {
    return self->tim->CNT;
}

