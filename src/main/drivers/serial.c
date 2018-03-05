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

#include "platform.h"

#include "serial.h"
#include "time.h"

void serialPrint(serialPort_t *instance, const char *str)
{
    uint8_t ch;
    while ((ch = *(str++)) != 0) {
        serialWrite(instance, ch);
    }
}

uint32_t serialGetBaudRate(serialPort_t *instance)
{
    return instance->baudRate;
}

void serialWrite(serialPort_t *instance, uint8_t ch)
{
    instance->vTable->serialWrite(instance, ch);
}


void serialWriteBuf(serialPort_t *instance, const uint8_t *data, int count)
{
    if (instance->vTable->writeBuf) {
        instance->vTable->writeBuf(instance, data, count);
    } else {
        for (const uint8_t *p = data; count > 0; count--, p++) {

            while (!serialTxBytesFree(instance)) {
            };

            serialWrite(instance, *p);
        }
    }
}

uint32_t serialRxBytesWaiting(const serialPort_t *instance)
{
    return instance->vTable->serialTotalRxWaiting(instance);
}

uint32_t serialTxBytesFree(const serialPort_t *instance)
{
    return instance->vTable->serialTotalTxFree(instance);
}

uint8_t serialRead(serialPort_t *instance)
{
    return instance->vTable->serialRead(instance);
}

void serialSetBaudRate(serialPort_t *instance, uint32_t baudRate)
{
    instance->vTable->serialSetBaudRate(instance, baudRate);
}

bool isSerialTransmitBufferEmpty(const serialPort_t *instance)
{
    return instance->vTable->isSerialTransmitBufferEmpty(instance);
}

void serialSetMode(serialPort_t *instance, portMode_e mode)
{
    instance->vTable->setMode(instance, mode);
}

void serialWriteBufShim(void *instance, const uint8_t *data, int count)
{
    int remainingBytes = count;
    int packetSize = 0;
    while (remainingBytes > 0) {
        if (remainingBytes > 20) {
            packetSize = 20;
            serialWriteBuf((serialPort_t *)instance, data + (count - remainingBytes), packetSize);
        } else {
            packetSize = remainingBytes;
            serialWriteBuf((serialPort_t *)instance, data + (count - remainingBytes), packetSize);
        }

        // sleep 10 ms, it's safe for the BLE transfer speed limit
        timeMs_t timeout = millis() + 10;
        while (millis() < timeout) {
        }

        remainingBytes -= packetSize;
    }
}

void serialBeginWrite(serialPort_t *instance)
{
    if (instance->vTable->beginWrite)
        instance->vTable->beginWrite(instance);
}

void serialEndWrite(serialPort_t *instance)
{
    if (instance->vTable->endWrite)
        instance->vTable->endWrite(instance);
}
