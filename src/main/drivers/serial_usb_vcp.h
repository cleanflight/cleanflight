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

#pragma once

#include "serial.h"

typedef struct {
    serialPort_t port;

    // Buffer used during bulk writes.
    uint8_t txBuf[20];
    uint8_t txAt;
    // Set if the port is in bulk write mode and can buffer.
    bool buffering;
} vcpPort_t;
extern __IO uint32_t receiveLength;  
serialPort_t *usbVcpOpen(void);
uint32_t usbVcpGetBaudRate(serialPort_t *instance);

/*
static void usbVcpWrite(serialPort_t *instance, uint8_t c);
static uint8_t usbVcpAvailable(serialPort_t *instance);
uint8_t usbTxBytesFree(void);
static uint8_t usbVcpRead(serialPort_t *instance);
static void usbVcpSetBaudRate(serialPort_t *instance, uint32_t baudRate);
static bool isUsbVcpTransmitBufferEmpty(serialPort_t *instance);
static void usbVcpSetMode(serialPort_t *instance, portMode_t mode);

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
};*/