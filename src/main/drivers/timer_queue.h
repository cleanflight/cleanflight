 #pragma once

struct timerQueueRec_s;
typedef void timerQueueCallbackFn(struct timerQueueRec_s *self);

typedef struct timerQueueRec_s {
    uint16_t time;                     // time to call callback. Entries are ordered by this field in priority heap
    uint16_t timeISR;                  // we can't use time directly, it will break heap property
    uint8_t queuePos;                  // position in timerQueue heap (1 based), 0 if not queued 
    uint8_t inIsrQueue;                // use separate byte for flag modified at TIMER priority
    timerQueueCallbackFn *callbackFn;
} timerQueueRec_t;

void timerQueue_Init(void);
void timerQueue_Config(timerQueueRec_t *self, timerQueueCallbackFn *callbackFn);
void timerQueue_Release(timerQueueRec_t *self);
void timerQueue_Start(timerQueueRec_t *self, int16_t timeout);
