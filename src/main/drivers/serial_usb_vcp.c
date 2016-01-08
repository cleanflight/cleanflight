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

#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

#include "platform.h"

#include "build_config.h"

#include "usb_core.h"
#include "usb_init.h"
#include "vcp/hw_config.h"
#include "usb_regs.h"
#include "usb_mem.h"

#include "common/utils.h"
#include "common/atomic.h"
#include "common/maths.h"

#include "drivers/system.h"
#include "drivers/nvic.h"

#include "serial.h"
#include "serial_usb_vcp.h"


#define USB_TIMEOUT  50

static usbVcpPort_t vcpPort;

static void vcpTryTx(usbVcpPort_t* self);
static void vcpRx(usbVcpPort_t* self);

void usbVcpSetBaudRate(serialPort_t *instance, uint32_t baudRate)
{
    UNUSED(instance);
    UNUSED(baudRate);
}

void usbVcpSetMode(serialPort_t *instance, portMode_t mode)
{
    UNUSED(instance);
    UNUSED(mode);
}

bool isUsbVcpTransmitBufferEmpty(serialPort_t *instance)
{
    return instance->txBufferHead == instance->txBufferTail;
}

uint8_t usbVcpAvailable(serialPort_t *instance)
{
    int ret = instance->rxBufferHead - instance->rxBufferTail;
    if(ret < 0)
        ret += instance->rxBufferSize;
    return ret;
}

uint8_t usbVcpRead(serialPort_t *instance)
{
    if (instance->rxBufferHead == instance->rxBufferTail) {
        return -1;
    }

    uint8_t ch = instance->rxBuffer[instance->rxBufferTail];
    instance->rxBufferTail = (instance->rxBufferTail + 1 >= instance->rxBufferSize) ? 0 : instance->rxBufferTail + 1;
    return ch;
}

void usbVcpWrite(serialPort_t *instance, uint8_t c)
{
    if (!(usbIsConnected() && usbIsConfigured())) {
        return;
    }

    usbVcpPort_t *self = container_of(instance, usbVcpPort_t, port);

    uint16_t nxt = (self->port.txBufferHead + 1 >= self->port.txBufferSize) ? 0 : self->port.txBufferHead + 1;
    if(nxt == self->port.txBufferTail) {
        // buffer full. Discard byte now
    } else {
        self->port.txBuffer[self->port.txBufferHead] = c;
        self->port.txBufferHead = nxt;
        ATOMIC_BLOCK_NB(NVIC_PRIO_USB) {
            ATOMIC_BARRIER(*self);
            vcpTryTx(self);
        }
    }
}

uint8_t usbTxBytesFree(serialPort_t *instance) {
    int bytesUsed;
    if (instance->txBufferHead >= instance->txBufferTail) {
        bytesUsed = instance->txBufferHead - instance->txBufferTail;
    } else {
        bytesUsed = instance->txBufferSize + instance->txBufferHead - instance->txBufferTail;
    }
    return (instance->txBufferSize - 1) - bytesUsed;
}

const struct serialPortVTable usbVTable =
{ usbVcpWrite, usbVcpAvailable, usbTxBytesFree, usbVcpRead, usbVcpSetBaudRate, isUsbVcpTransmitBufferEmpty, usbVcpSetMode };

serialPort_t *usbVcpOpen(void)
{
    usbVcpPort_t *self = &vcpPort;

    self->port.vTable = &usbVTable;

    self->port.rxBuffer = self->rxBuffer;
    self->port.rxBufferSize = VCP_BUFFER_SIZE;
    self->port.rxBufferTail = 0;
    self->port.rxBufferHead = 0;

    self->port.txBuffer = self->txBuffer;
    self->port.txBufferSize = VCP_BUFFER_SIZE;
    self->port.txBufferTail = 0;
    self->port.txBufferHead = 0;

    self->txPending = false;

    Set_System();
    Set_USBClock();
    USB_Interrupts_Config();
    USB_Init();

    return &self->port;
}

// this function must be called on USB basepri
// it is not reentrant
static void vcpTryTx(usbVcpPort_t* self) {
    if(!self->txPending) {
        // transmit endpoint is empty, send new data
        int txLen;
        if (self->port.txBufferHead >= self->port.txBufferTail) {
            txLen = self->port.txBufferHead - self->port.txBufferTail;
        } else {
            txLen = self->port.txBufferSize - self->port.txBufferTail;
        }
        if(txLen == 0)
            return;  // nothing to send now
        // We can only put 64 bytes in the buffer ( /2 is copied from pervious code, check it?)
        txLen = MIN(txLen, 64 / 2);

        self->txPending = true;
        UserToPMABufferCopy(self->port.txBuffer + self->port.txBufferTail, ENDP1_TXADDR, txLen);
        SetEPTxCount(ENDP1, txLen);
        SetEPTxValid(ENDP1);

        unsigned nxt = self->port.txBufferTail + txLen;
        if(nxt >= self->port.txBufferSize)
            nxt = 0;
        self->port.txBufferTail = nxt;
    }
}

// this function must be called on USB basepri
static void vcpRx(usbVcpPort_t* self)
{
    int rxLen = GetEPRxCount(ENDP3);
    int rxOfs = ENDP3_RXADDR;

    while(rxLen > 0) {
        int rxChunk;
        if (self->port.rxBufferHead >= self->port.rxBufferTail) {
            // space up to end of buffer
            rxChunk = self->port.rxBufferSize - self->port.rxBufferHead;
        } else {
            // space to tail - 1
            rxChunk = self->port.rxBufferTail - 1 - self->port.rxBufferHead;
        }
        if(!rxChunk) {
            // receive bufer if full
            break;
        }
        rxChunk = MIN(rxChunk, rxLen);
        PMAToUserBufferCopy(self->port.rxBuffer + self->port.rxBufferHead, rxOfs, rxChunk);
        rxLen -= rxChunk; rxOfs += rxChunk;
        unsigned nxt = self->port.rxBufferHead + rxChunk;
        if(nxt >= self->port.rxBufferSize)
            nxt = 0;
        self->port.rxBufferHead = nxt;
    }
    SetEPRxCount(ENDP3, 64);
    SetEPRxStatus(ENDP3, EP_RX_VALID);
}

// EP1 in callback - transmission finished
void EP1_IN_Callback(void)
{
    vcpPort.txPending = false;
    vcpTryTx(&vcpPort);
}

// EP3 out callback - data received
void EP3_OUT_Callback(void)
{
    vcpRx(&vcpPort);
}
