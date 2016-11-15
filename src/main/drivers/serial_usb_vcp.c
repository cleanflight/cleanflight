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

#include <platform.h>

#include "build/build_config.h"
#include "common/utils.h"

//#include "usb_core.h"
//#include "usb_init.h"
//#include "hw_config.h"

#include "drivers/system.h"

#include <drivers/serial.h>
#include <drivers/serial_uart.h>
#include "serial_usb_vcp.h"


#define USB_TIMEOUT  50

static vcpPort_t vcpPort;

static void usbVcpSetBaudRate(serialPort_t *instance, uint32_t baudRate)
{
    UNUSED(instance);
    UNUSED(baudRate);
    return;
    //does nothing for now
}

static void usbVcpSetMode(serialPort_t *instance, portMode_t mode)
{
    UNUSED(instance);
    UNUSED(mode);

    // TODO implement
}

static bool isUsbVcpTransmitBufferEmpty(serialPort_t *instance)
{
    UNUSED(instance);
    return true;
}

static uint8_t usbVcpAvailable(serialPort_t *instance)
{
    UNUSED(instance);

    return receiveLength & 0xFF; // FIXME use uint32_t return type everywhere
}

static uint8_t usbVcpRead(serialPort_t *instance)
{
    UNUSED(instance);

    uint8_t buf[1];

    int len = usbRead(buf, 1);

    return buf[0];
}

/*
static void usbVcpWriteBuf(serialPort_t *instance, void *data, int count)
{
    UNUSED(instance);


    if (!(usbIsConnected() && usbIsConfigured())) {
        return;
    }

    uint32_t start = millis();
    for (uint8_t *p = data; count > 0; ) {
        uint32_t txed = CDC_Send_DATA(p, count);
        count -= txed;
        p += txed;

        if (millis() - start > USB_TIMEOUT) {
            break;
        }
    }
}
*/
/*static bool usbVcpFlush(vcpPort_t *port)
{
    uint8_t count = port->txAt;
    port->txAt = 0;

    if (count == 0) {
        return true;
    }
    if (!usbIsConnected() || !usbIsConfigured()) {
        return false;
    }
    
    uint32_t txed;
    uint32_t start = millis();

    do {
        txed = CDC_Send_DATA(port->txBuf, count);
    } while (txed != count && (millis() - start < USB_TIMEOUT));

    return txed == count;
}*/

static void usbVcpWrite(serialPort_t *instance, uint8_t c)
{
    usbWrite(&c,1);
}

static void usbVcpBeginWrite(serialPort_t *instance)
{
    return;
}

uint8_t usbTxBytesFree()
{
    // Because we block upon transmit and don't buffer bytes, our "buffer" capacity is effectively unlimited.
    return 255;
}

/*static void usbVcpEndWrite(serialPort_t *instance)
{
    usb_txbuffer_flush(instance);
}
*/

static const struct serialPortVTable usbVTable[] = {
    {
        .serialWrite = usbVcpWrite,                                     //used
        .serialTotalRxWaiting = usbVcpAvailable,                        //not used
        .serialTotalTxFree = usbTxBytesFree,                            //not used
        .serialRead = usbVcpRead,                                       //used
        .serialSetBaudRate = usbVcpSetBaudRate,                         //used only in gps
        .isSerialTransmitBufferEmpty = isUsbVcpTransmitBufferEmpty,     //used
        .setMode = usbVcpSetMode,                                       //used, TBD
        .beginWrite = NULL,                                 //not needed
        .endWrite = NULL,                                     //not needed
        .writeBuf = NULL                                      //not needed
    }
};

serialPort_t* usbVcpOpen(void)
{
    serialPort_t *s = usbInit();

    return (serialPort_t *)s;
}

uint32_t usbVcpGetBaudRate(serialPort_t *instance)
{
    UNUSED(instance);
    return Virtual_Com_Port_GetBaudRate();
}
