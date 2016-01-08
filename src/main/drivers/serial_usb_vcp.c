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

#include "vcp/usb_cdc.h"

#include "common/utils.h"
#include "common/atomic.h"
#include "common/maths.h"

#include "drivers/nvic.h"

#include "serial.h"
#include "serial_usb_vcp.h"


#define USB_TIMEOUT  50

#define VCP_BUFFER_SIZE 256

typedef struct usbVcpPort_s {
    serialPort_t port;
    uint8_t rxBuffer[VCP_BUFFER_SIZE];
    uint8_t txBuffer[VCP_BUFFER_SIZE];
} usbVcpPort_t;


usbVcpPort_t vcpPort;

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
    if (!USBCDC_IsConnected())
        return;

    usbVcpPort_t *self = container_of(instance, usbVcpPort_t, port);

    uint16_t nxt = (self->port.txBufferHead + 1 >= self->port.txBufferSize) ? 0 : self->port.txBufferHead + 1;
    if(nxt == self->port.txBufferTail) {
        // buffer is full. Discard byte now
    } else {
        self->port.txBuffer[self->port.txBufferHead] = c;
        self->port.txBufferHead = nxt;
        ATOMIC_BLOCK_NB(NVIC_PRIO_USB) {
            ATOMIC_BARRIER(*self);
            USBCDC_TryTx();
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

    USBCDC_Init();

    return &self->port;
}


// callback to get data to be transmitted to host
// return positive length if data available
// actual length used will be confirmed using Ack function
// called when last data was transmitted or during call of USBCDC_TryTx
// this routine is called on USB BASEPRI
int vcpGetTxData(usbVcpPort_t *self, uint8_t* *dataPtr)
{
    *dataPtr = self->port.txBuffer + self->port.txBufferTail;
    if (self->port.txBufferHead >= self->port.txBufferTail) {
        return self->port.txBufferHead - self->port.txBufferTail;
    } else {
        return self->port.txBufferSize - self->port.txBufferTail;
    }
}

// acknowledge data actually transmitted
// called after data has been copied from buffer
// do not assume that this is called immediatelly after vcpGetTxData
// this routine is called on USB BASEPRI
void vcpAckTxData(usbVcpPort_t *self, int txLen)
{
    unsigned nxt = self->port.txBufferTail + txLen;
    if(nxt >= self->port.txBufferSize)
        nxt = 0;
    self->port.txBufferTail = nxt;
}

// return buffer where to store received data and its length
// return 0 if there is no space in buffer (caller will discard data)
// vcpAckRxData will be called after data are stored in bufer
// this routine is called on USB BASEPRI
int vcpGetRxDataBuffer(usbVcpPort_t *self, uint8_t* *dataPtr)
{
    *dataPtr = self->port.rxBuffer + self->port.rxBufferHead;
    if (self->port.rxBufferHead >= self->port.rxBufferTail) {
        if(self->port.rxBufferHead == 0 && self->port.rxBufferTail == 0) {
            // one space must be always free to distinguish between full and empty buffer
            return self->port.rxBufferSize - 1;
        } else {
            // space up to end of buffer
            return self->port.rxBufferSize - self->port.rxBufferHead;
        }
    } else {
        // space to tail - 1
        return self->port.rxBufferTail - 1 - self->port.rxBufferHead;
    }
}

// len of data was stored in receive buffer by USB driver
// this routine is called on USB BASEPRI
void vcpAckRxData(usbVcpPort_t *self, int len)
{
    unsigned nxt = self->port.rxBufferHead + len;
    if(nxt >= self->port.rxBufferSize)
        nxt = 0;
    self->port.rxBufferHead = nxt;
}
