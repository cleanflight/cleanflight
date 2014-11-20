#pragma once

#include "callback.h"

// queue must be long enough to hold longest softserial symbol (~ 12 edges) and some reserve
#define TIMERIN_QUEUE_LEN 32
#define TIMERIN_QUEUE_HIGH (TIMERIN_QUEUE_LEN - 5 - 1)  // high mark for queue, wake handler if longer

#define TIMERIN_FLAG_HIGH          0x0001    // pin is currently high

#define TIMERIN_RISING             0x0100    // start capture on rising edge
#define TIMERIN_POLARITY_TOGGLE    0x0200    // capture both edges (toggle polarity on each capture)
#define TIMERIN_QUEUE_BUFFER       0x0400    // only wake processissing when buffer is above high mark
#define TIMERIN_PIN_IPU            0x0800    // configure input as pullup
#define TIMERIN_QUEUE_DUALTIMER    0x1000    // use two timers for capture
#define TIMERIN_TIMEOUT_ON_EDGE    0x2000    // start timeout on next edge and clear this flag

struct timerQueueRec_s;

typedef struct timerInputRec_s {
    uint16_t queue[TIMERIN_QUEUE_LEN];
    unsigned qhead;                         // don't use shorter type until gcc is fixed. 4.8.4 extends to 32bit before each operation
    unsigned qtail;                         // this value must be even in dualtimer mode
    uint32_t flags;
    const timerHardware_t* timHw;
    TIM_TypeDef *tim;
    callbackRec_t *callback;
    volatile timCCR_t *CCR;                 // lower CCR addres in dualtimer mode
    struct timerQueueRec_s *timer;
    timerCCHandlerRec_t edgeLoCb;
    timerCCHandlerRec_t edgeHiCb;
    uint16_t timeout;                       // timeout after edge capture, triggered by TIMERIN_TIMEOUT_ON_EDGE
} timerInputRec_t;

void timerIn_Config(timerInputRec_t *self, const timerHardware_t *timHw, channelType_t owner, int priority, callbackRec_t *callback, struct timerQueueRec_s *timer, uint16_t flags);
void timerIn_Release(timerInputRec_t *self);
void timerIn_Restart(timerInputRec_t *self);
void timerIn_Polarity(timerInputRec_t *self , uint16_t tim_ICPolarity);

bool timerIn_QPeek(timerInputRec_t *self, uint16_t *capture, uint16_t *flags);
void timerIn_QPop(timerInputRec_t *self);
bool timerIn_QPeek2(timerInputRec_t *self, uint16_t *capture1, uint16_t *capture2);
void timerIn_QPop2(timerInputRec_t *self);
int timerIn_QLen(timerInputRec_t* self);

void timerIn_SetBuffering(timerInputRec_t *self, short buffer);
bool timerIn_ArmEdgeTimeout(timerInputRec_t* self);
void timerIn_Reset(timerInputRec_t* self);

uint16_t timerIn_getTimCNT(timerInputRec_t *self);
