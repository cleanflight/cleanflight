
#pragma once

#define TIMEROUT_QUEUE_LEN 32
#define TIMEROUT_QUEUE_LOW 5

#define TIMEROUT_RUNNING            0x0001          // timer is running (this bit gets cleared after end of last interval)
#define TIMEROUT_RESTART            0x0002          // interval was inserted in last period, restart transmission in IRQ
#define TIMEROUT_IDLE_HI            0x0200          // idle state is high (timer starts in idle mode, this mode is set on release, also used as pullup/pulldown)
#define TIMEROUT_RELEASEMODE_INPUT  0x0400          // set pin to input mode on release (set to PP when not set)
#define TIMEROUT_WAKEONEMPTY        0x0800          // wake caller when last interval ends
#define TIMEROUT_WAKEONLOW          0x1000          // wake caller when there is exactly TIMEROUT_QUEUE_LOW elements in queue


typedef struct timerOutputRec_s {
    uint16_t queue[TIMEROUT_QUEUE_LEN];
    unsigned qhead;                             // commited data (ISR will stop sending here)
    unsigned qheadUnc;                          // uncommitted data
    unsigned qtail;
    unsigned qtailWake;                         // queue index used to wake caller (compared after fetch in irq)
    uint16_t flags;
    const timerHardware_t* timHw;
    TIM_TypeDef *tim;
    volatile timCCR_t* timCCR;
    callbackRec_t *callback;
    timerCCHandlerRec_t compareCb;
} timerOutputRec_t;

void timerOut_Config(timerOutputRec_t *self, const timerHardware_t *timHw, channelType_t owner, int priority, callbackRec_t *callback, uint16_t tim_OCPolarity);
void timerOut_Release(timerOutputRec_t *self);
void timerOut_Restart(timerOutputRec_t *self);
bool timerOut_IsIdle(timerOutputRec_t *self);
short timerOut_QSpace(timerOutputRec_t *self);
short timerOut_QLen(timerOutputRec_t *self);
bool timerOut_QPush(timerOutputRec_t *self, uint16_t delta, uint16_t flags);
void timerOut_QCommit(timerOutputRec_t *self);
