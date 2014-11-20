/*
 * This file is part of Cleanflight.
 *
 * Cleanflight is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Cleanflight is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Cleanflight.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include "platform.h"

#if defined(USE_SOFTSERIAL1) || defined(USE_SOFTSERIAL2)

#include "build_config.h"

#include "common/utils.h"
#include "common/atomic.h"

#include "nvic.h"
#include "system.h"
#include "gpio.h"
#include "timer.h"
#include "callback.h"
#include "pin_debug.h"
#include "timer.h"


#include "pwm_mapping.h"

#include "serial.h"
#include "serial_softserial.h"

#define SYM_DATA_BITS        8
#define SYM_TOTAL_BITS       (1 + SYM_DATA_BITS + 1)          // start/data/stop
#define SYM_TOTAL_BITS_SBUS  (1 + SYM_DATA_BITS + 1 + 2)      // start/data/parity/stop

#if defined(USE_SOFTSERIAL1) && defined(USE_SOFTSERIAL2)
#define MAX_SOFTSERIAL_PORTS 2
#else
#define MAX_SOFTSERIAL_PORTS 1
#endif

#define SOFTSERIAL_TIMER_FREQ 1000000
// edges are processed after whole symbol was reveived. Aditional delay is addded after stopbit
// before processing is triggered. Processing is a bit faster when next startbit edge is received
// before this time, but reception of last byte is also delayed by this amount.
#define SOFTSERIAL_RXPROCESS_DELAY 50

extern const struct serialPortVTable softSerialVTable;

softSerial_t softSerialPorts[MAX_SOFTSERIAL_PORTS];

void softSerialTxCallback(callbackRec_t *cb);
void softSerialRxCallback(callbackRec_t *cb);
void softSerialTryTx(softSerial_t* self);
void softSerialRxTimeoutEvent(timerQueueRec_t *tq_ref);

static void resetBuffers(softSerial_t *self)
{
    self->port.rxBuffer = self->rxBuffer;
    self->port.rxBufferSize = SOFTSERIAL_BUFFER_SIZE;
    self->port.rxBufferTail = 0;
    self->port.rxBufferHead = 0;

    self->port.txBuffer = self->txBuffer;
    self->port.txBufferSize = SOFTSERIAL_BUFFER_SIZE;
    self->port.txBufferTail = 0;
    self->port.txBufferHead = 0;
}

serialPort_t *openSoftSerial(softSerialPortIndex_e portIndex, serialReceiveCallback *callback, uint32_t baud, serialInversion_e inversion)
{
    softSerial_t *self = &(softSerialPorts[portIndex]);
#ifdef USE_SOFTSERIAL1
    if (portIndex == SOFTSERIAL1) {
        self->rxTimerHardware = &(timerHardware[SOFTSERIAL_1_TIMER_RX_HARDWARE]);
        self->txTimerHardware = &(timerHardware[SOFTSERIAL_1_TIMER_TX_HARDWARE]);
    }
#endif

#ifdef USE_SOFTSERIAL2
    if (portIndex == SOFTSERIAL2) {
        self->rxTimerHardware = &(timerHardware[SOFTSERIAL_2_TIMER_RX_HARDWARE]);
        self->txTimerHardware = &(timerHardware[SOFTSERIAL_2_TIMER_TX_HARDWARE]);
    }
#endif
    self->port.vTable = &softSerialVTable;
// MIGRATION
    self->port.inversion = inversion;
    serialPortConfig_t config;
    config.baudRate = baud;
    config.mode = MODE_RXTX | (self->port.inversion ? MODE_INVERTED : 0);
    config.rxCallback = callback;
// ---
    softSerialConfigure(&self->port, &config);
    return &self->port;
}

void softSerialConfigure(serialPort_t *serial, const serialPortConfig_t *config)
{
    softSerial_t *self = container_of(serial, softSerial_t, port);

    uint32_t baud = config->baudRate;
    portMode_t mode = config->mode;
    portState_t state = 0;

    if(mode == 0)   // prevent reconfiguration with empty config
        return;
// MIGRATION
    if(self->port.mode & MODE_RXTX) {
        // release port if configure is called again
        softSerialRelease(&self->port);
    }
// ---

    // fix mode if caller got it wrong
    if((mode & MODE_RXTX) == MODE_RXTX && self->txTimerHardware == self->rxTimerHardware)
        mode |= MODE_SINGLEWIRE;
    if(mode & MODE_SINGLEWIRE) {
        self->rxTimerHardware = self->txTimerHardware;  // use TX pin only in singlewire mode (TX is used for singlewire on USART)
        mode |= MODE_HALFDUPLEX;
    }
    if(mode & MODE_HALFDUPLEX) {
        mode |= MODE_RXTX;         // force RxTX mode if halfduplex is specified to limit possible mode combinations
    }

    // collision with self
    if(mode & MODE_S_DUALTIMER
       && !(mode & MODE_HALFDUPLEX)
       && timerChFindDualChannel(self->rxTimerHardware) == self->txTimerHardware)
        mode &= ~MODE_S_DUALTIMER;

    // channel is already allocated
    if(mode & MODE_S_DUALTIMER
       && timerChGetUsedResources(timerChFindDualChannel(self->rxTimerHardware)) & RESOURCE_TIMER)
        mode &= ~MODE_S_DUALTIMER;

    // halfduplex on channel pair
    if(mode & MODE_HALFDUPLEX
       && timerChFindDualChannel(self->rxTimerHardware) == self->txTimerHardware)
        mode |= MODE_S_DUALTIMER;     // we have two channels, so use them

    // we do not check if direct pins/timer channels are free now..

    // there is possibility that we claim dual channel that will be neccesary for something else (two serial ports on channel pair)
    // one possibility is to use week channel allocation and enable dualtimer only after all initialization is done
    // we can also reclaim channel from other softserial port (release/configure it without dualtimer mode)
    // for now just remember this when selecting channels

    self->port.baudRate = baud;
    self->port.mode = mode;
    self->port.rxCallback = config->rxCallback;

    resetBuffers(self);

    self->transmissionErrors = 0;
    self->receiveErrors = 0;

    self->bitTime = (SOFTSERIAL_TIMER_FREQ << 8) / baud;                             // fractional number of timer ticks per bit, 24.8 fixed point
    self->invBitTime = ((long long)baud << 16) / SOFTSERIAL_TIMER_FREQ;              // 16.16 scaled inverse bit time. Used to to get bit number (multiplication is faster)
    int symbolBits = mode & MODE_SBUS ? SYM_TOTAL_BITS_SBUS : SYM_TOTAL_BITS;
    self->symbolLength = (self->bitTime * (2 * symbolBits - 1) / 2) >> 8;            //  symbol ends in middle of last stopbit; in timer ticks

    if(mode & MODE_TX) {
        callbackRegister(&self->txCallback, softSerialTxCallback);
        timerOut_Config(&self->txTimerCh,
                        self->txTimerHardware, (mode & MODE_SINGLEWIRE) ? TYPE_SOFTSERIAL_RXTX : TYPE_SOFTSERIAL_TX, NVIC_PRIO_TIMER,
                        &self->txCallback,
                        ((mode & MODE_INVERTED) ? 0 : TIMEROUT_IDLE_HI)
                        | ((mode & MODE_SINGLEWIRE) ? TIMEROUT_RELEASEMODE_INPUT : 0)
                        | TIMEROUT_WAKEONEMPTY | TIMEROUT_WAKEONLOW);
        state |= STATE_TX;
    }
    if(mode & MODE_HALFDUPLEX) {
        // release tx channel in halfduplex mode before configuring RX (timer may be shared)
        timerOut_Release(&self->txTimerCh);
        state &= ~STATE_TX;
    }
    if(mode & MODE_RX) {
        callbackRegister(&self->rxCallback, softSerialRxCallback);
        timerQueue_Config(&self->rxTimerQ, softSerialRxTimeoutEvent);
        timerIn_Config(&self->rxTimerCh,
                       self->rxTimerHardware,  (mode & MODE_SINGLEWIRE) ? TYPE_SOFTSERIAL_RXTX : TYPE_SOFTSERIAL_RX, NVIC_PRIO_TIMER,
                       &self->rxCallback, &self->rxTimerQ,
                       ((mode & MODE_INVERTED) ? TIMERIN_RISING : 0)
                       | ((mode & MODE_S_DUALTIMER) ? TIMERIN_QUEUE_DUALTIMER : TIMERIN_POLARITY_TOGGLE)
                       | ((mode & MODE_INVERTED) ? 0 : TIMERIN_PIN_IPU)
                       | TIMERIN_QUEUE_BUFFER);
        self->rxTimerCh.timeout = self->symbolLength + SOFTSERIAL_RXPROCESS_DELAY;
        state |= STATE_RX;
        self->port.state = state;                                                   // we need RX in callback
        callbackTrigger(&self->rxCallback);                                         // rxCallback will setup timeouts if neccessary
    }
    self->port.state = state;
}

void softSerialRelease(serialPort_t *serial)
{
    softSerial_t *self = container_of(serial, softSerial_t, port);

    portMode_t mode = self->port.mode;

    softSerialUpdateState(&self->port, 0, 0);  // disable RX and TX first
    self->port.state = 0;

    if(mode & MODE_TX) {
        callbackRelease(&self->txCallback);
    }
    if(mode & MODE_RX) {
        callbackRelease(&self->rxCallback);
        timerQueue_Release(&self->rxTimerQ);
    }
    self->port.mode = 0;
}

void softSerialGetConfig(serialPort_t *serial, serialPortConfig_t* config)
{
    softSerial_t* self = container_of(serial, softSerial_t, port);
    config->baudRate = (1000000 << 8) / self->bitTime;
    config->mode = self->port.mode;
    config->rxCallback = self->port.rxCallback;
}


// update state of port. Masks are passed to this function so atomic update is possible and
// caller does not need to care about locking
void softSerialUpdateState(serialPort_t *serial, portState_t andMask, portState_t orMask)
{
    softSerial_t* self = container_of(serial, softSerial_t, port);

    // elevate priority to CALLBACK to prevent race with serial handlers
    ATOMIC_BLOCK(NVIC_PRIO_CALLBACK) {
        portState_t newState = (self->port.state & andMask) | orMask;
        if(newState & STATE_RX_WHENTXDONE) {
            // first check if transmission is finished and end TX immediately in that case
            // it is possible to prepare data first, then enable STATE_RX_WHENTXDONE and enable TX
            if(isSoftSerialTransmitBufferEmpty(&self->port) && timerOut_IsIdle(&self->txTimerCh)) {
                // Return to RX immediately
                newState &= ~STATE_TX;
                newState |= STATE_RX;
            } else {
                self->directionRxOnDone = true;
            }
        }

        // release channels first
        if(!(newState & STATE_TX) && (self->port.state & STATE_TX)) {
            timerOut_Release(&self->txTimerCh);
            self->port.state &= ~STATE_TX;
        }
        if(!(newState & STATE_RX) && (self->port.state & STATE_RX)) {
            timerIn_Release(&self->rxTimerCh);
            self->port.state &= ~STATE_RX;
        }

        // and setup newly enabled direction
        if((newState & STATE_RX) && !(self->port.state & STATE_RX)) {
            timerIn_Restart(&self->rxTimerCh);
            self->directionRxOnDone = false;
            self->port.state |= STATE_RX;
        }
        if((newState & STATE_TX) && !(self->port.state & STATE_TX)) {
            timerOut_Restart(&self->txTimerCh);
            self->port.state |= STATE_TX;
            // if we have something in buffer, start transmission immediately
            softSerialTryTx(self);
        }
    }
}

void softSerialTxCallback(callbackRec_t *cb)
{
    softSerial_t *self = container_of(cb, softSerial_t, txCallback);;
    softSerialTryTx(self);

    if(self->directionRxOnDone && timerOut_IsIdle(&self->txTimerCh)) {
        softSerialUpdateState(&self->port, ~STATE_RXTX, STATE_RX);
    }
}

// this function must be called on CALLBACK basepri
void softSerialTryTx(softSerial_t* self) {
    while((self->port.state & STATE_TX)                              // do nothing if TX is not enabled
          && !isSoftSerialTransmitBufferEmpty(&self->port)           // do we have something to send?
          && timerOut_QSpace(&self->txTimerCh) > ((self->port.mode & MODE_SBUS) ? SYM_TOTAL_BITS_SBUS : SYM_TOTAL_BITS)) {  // we need space for whole byte
        uint16_t byteToSend = self->port.txBuffer[self->port.txBufferTail];
        self->port.txBufferTail = (self->port.txBufferTail + 1) & (self->port.txBufferSize - 1);

        if(self->port.mode & MODE_SBUS) {
            byteToSend |= (__builtin_parity(byteToSend)) << SYM_DATA_BITS;       // parity bit
            byteToSend |= 0x03 << (SYM_DATA_BITS + 1);                           // 2x stopbit
            byteToSend <<= 1;                                                    // startbit
        } else {
            byteToSend |= 1 << SYM_DATA_BITS;                                    // stopbit
            byteToSend <<= 1;                                                    // startbit
        }

        // we need to enque odd number of intervals
        // there is toggle on start of each interval, first interval starts in idle state
        unsigned bitPos = 0;
        uint16_t lastEdgePos = 0;
        while(byteToSend) {          // stopbit is always 1, so correct number of bits is always sent
            unsigned bitcnt = (byteToSend & 1) ? __builtin_ctz(~byteToSend ) : __builtin_ctz(byteToSend);
            byteToSend >>= bitcnt;
            bitPos += bitcnt;
            uint16_t edgePos = (bitPos * self->bitTime) >> 8;
            timerOut_QPush(&self->txTimerCh, edgePos - lastEdgePos, 0);
            lastEdgePos = edgePos;
        }
        timerOut_QCommit(&self->txTimerCh);   // this will start transmission if necessary
    }
}

#define STARTBIT_MASK 0x0001
#define STOPBIT_MASK ((0xffff << (SYM_DATA_BITS + 1)) & 0xffff)   // check event 'virtual' stopbits, useful to signal errors

#define STOPBIT_MASK_SBUS ((0xffff << (SYM_DATA_BITS + 1 + 1)) & 0xffff)
#define PARITY_MASK_SBUS ((~(STOPBIT_MASK_SBUS | STARTBIT_MASK)) & 0xffff)

void softSerialStoreByte(softSerial_t *self, uint16_t shiftRegister) {
    if(self->port.mode & MODE_SBUS) {
        if((shiftRegister & (STARTBIT_MASK | STOPBIT_MASK_SBUS)) != (0 | STOPBIT_MASK_SBUS)
           || __builtin_parity(shiftRegister & PARITY_MASK_SBUS) != 0) {
            self->receiveErrors++;
            return;
        }
    } else {
        if((shiftRegister & (STARTBIT_MASK | STOPBIT_MASK)) != (0 | STOPBIT_MASK)) {
            self->receiveErrors++;
            return;
        }
    }
    uint8_t byte = shiftRegister >> 1; // shift startbit out

    if (self->port.rxCallback) {
        self->port.rxCallback(byte);
    } else {
        unsigned nxt = (self->port.rxBufferHead + 1) & (self->port.rxBufferSize - 1);
        if(nxt != self->port.rxBufferTail) {
            self->port.rxBuffer[self->port.rxBufferHead] = byte;
            self->port.rxBufferHead = nxt;
        } else {
            self->receiveErrors++;
            return;
        }
    }
}

static inline int16_t cmp16(uint16_t a, uint16_t b)
{
    return a - b;
}


void softSerialRxProcess(softSerial_t *self)
{
    uint16_t capture0, capture1, symbolStart, symbolEnd;
    PIN_DBG_BLOCK(DBP_SOFTSERIAL_RXPROCESS);
    if(!(self->port.state & STATE_RX))    // check if RX is enabled to be sure
        return;
    do { // return here if late edge was caught
        // always process whole symbol; first captured edge must be startbit
        while(timerIn_QPeek2(&self->rxTimerCh, &symbolStart, &capture1)) {
            // maybe capture1 is invalid here, but if enough time passed, it means wrong symbol (break) anyway
            symbolEnd = symbolStart + self->symbolLength;                          // symbolLength is time to center of last stopbit
            if(timerIn_QLen(&self->rxTimerCh) < SYM_TOTAL_BITS_SBUS                // process data if enough bits for symbol is waiting to prevent problems with cmp16 overflow
               && cmp16(timerIn_getTimCNT(&self->rxTimerCh), symbolEnd) < 0) {
                pinDbgHi(DBP_SOFTSERIAL_RXWAIT_SYMBOL);
                timerQueue_Start(&self->rxTimerQ, symbolEnd - timerIn_getTimCNT(&self->rxTimerCh) + SOFTSERIAL_RXPROCESS_DELAY);
                return;   // symbol is not finished yet
            }
            if(timerIn_QLen(&self->rxTimerCh) > 1) {       // continue only if second edge was found
                symbolStart -= ((self->bitTime / 2) >> 8); // offset startbit edge to get correct rounding
                uint16_t rxShiftRegister = 0xffff;
                int bitIdxLast = -1;
                int bitIdx0 = 0;                           // edge from 1 to 0 (and position of startbit)
                int bitIdx1;                               // edge from 0 to 1
                // jump inside loop - startbit is always at known position
                timerIn_QPop2(&self->rxTimerCh);
                goto edge1;
                while(timerIn_QPeek2(&self->rxTimerCh, &capture0, &capture1)) {
                    if(cmp16(capture0, symbolEnd)>0) {
                        // this edge is in next symbol, all bits for current symbol are processed
                        break;
                    }
                    timerIn_QPop2(&self->rxTimerCh);
                    bitIdx0 = ((unsigned long)((capture0 - symbolStart) & 0xffff) * self->invBitTime) >> 16;
                edge1:
                    bitIdx1 = ((unsigned long)((capture1 - symbolStart) & 0xffff) * self->invBitTime) >> 16;

                    if(bitIdxLast >= bitIdx0 || bitIdx0 >= bitIdx1) {
                        // invalid bit interval or repeated edge in same bit
                        rxShiftRegister &= ~0x8000;  // non-transmitted bits are used as error flags, TODO - use symbolic constants
                        break;
                    }
                    bitIdxLast = bitIdx1;
                    rxShiftRegister &= ~(0xffff << bitIdx0);   // clear all bits >= bitIdx0
                    rxShiftRegister |= 0xffff << bitIdx1;      // set all bits >= bitIdx1
                }
                softSerialStoreByte(self, rxShiftRegister);
            } else {
                // only one edge in queue, it must be break condition (RX is still low)
                // dualtimer mode is not active (dualtimer triggers on 0->1 edge)
                // we can't simply ArmEdgeTimeout() here - input is still in wrong state, there is edge in queue
                // so reset input queue (and setup trigger edge). We can discard edge here, but that should not hurt
                // anything (sender must assume we need short time after break to recover from break condition)
                timerIn_Reset(&self->rxTimerCh);
                softSerialStoreByte(self, 0);    // TODO - pass BREAK condition here
                // check queue again, then arm (correct) timeout
            }
        }
    } while(!timerIn_ArmEdgeTimeout(&self->rxTimerCh));   // maybe goto will be more readable here ...
}

void softSerialRxCallback(callbackRec_t *cb)
{
    softSerial_t *self = container_of(cb, softSerial_t, rxCallback);
    softSerialRxProcess(self);
}

void softSerialRxTimeoutEvent(timerQueueRec_t *tq_ref)
{
    softSerial_t* self = container_of(tq_ref, softSerial_t, rxTimerQ);
    pinDbgLo(DBP_SOFTSERIAL_RXWAIT_SYMBOL);
    softSerialRxProcess(self);
}

// interface implementation below

bool isSoftSerialTransmitBufferEmpty(serialPort_t *instance)
{
    return instance->txBufferHead == instance->txBufferTail;
}

void softSerialWrite(serialPort_t *instance, uint8_t ch)
{
    softSerial_t *self = container_of(instance, softSerial_t, port);
    uint16_t nxt = (self->port.txBufferHead + 1) & (self->port.txBufferSize - 1);
    if(nxt == self->port.txBufferTail) {
        // buffer is full ...  we could wait (if outside of isr), but that could break something important.
        // only log error end discard character now
        self->transmissionErrors++;
    } else {
        self->port.txBuffer[self->port.txBufferHead] = ch;
        self->port.txBufferHead = nxt;
        // elevate priority to callback level
        ATOMIC_BLOCK_NB(NVIC_PRIO_CALLBACK) {
            ATOMIC_BARRIER(*self);
            softSerialTryTx(self);
        }
    }
}

// MIGRATION
void softSerialSetBaudRate(serialPort_t *instance, uint32_t baud)
{
    serialPortConfig_t config;
    softSerialGetConfig(instance, &config);
    softSerialRelease(instance);
    config.baudRate = baud;
    softSerialConfigure(instance, &config);
}

void softSerialSetMode(serialPort_t *instance, portMode_t mode)
{
    serialPortConfig_t config;
    softSerialGetConfig(instance, &config);
    softSerialRelease(instance);
    config.mode = mode | (instance->inversion ? MODE_INVERTED : 0);
    softSerialConfigure(instance, &config);
}
// ---

int softSerialTotalBytesWaiting(serialPort_t *instance)
{
    return (instance->rxBufferHead - instance->rxBufferTail) & (instance->rxBufferSize - 1);
}

int softSerialRead(serialPort_t *instance)
{
    uint8_t ch;

    softSerial_t *s = container_of(instance, softSerial_t, port);
    if (s->port.rxBufferHead == s->port.rxBufferTail) {
        return -1;
    }

    ch = instance->rxBuffer[instance->rxBufferTail];
    instance->rxBufferTail = (instance->rxBufferTail + 1) & (instance->rxBufferSize - 1);
    return ch;
}

const struct serialPortVTable softSerialVTable = {
        softSerialWrite,
        (uint8_t (*)(serialPort_t *instance))softSerialTotalBytesWaiting, // MIGRATION, cast is safe
        (uint8_t (*)(serialPort_t *instance))softSerialRead,              // MIGRATION, cast is safe
        softSerialSetBaudRate,
        isSoftSerialTransmitBufferEmpty,
        softSerialSetMode,
};

#endif
