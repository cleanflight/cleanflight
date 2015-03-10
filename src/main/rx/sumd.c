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

#include "build_config.h"

#include "drivers/system.h"

#include "drivers/serial.h"
#include "drivers/serial_uart.h"
#include "io/serial.h"

#include "rx/rx.h"
#include "rx/sumd.h"

// driver for SUMD receiver using UART2

// FIXME test support for more than 8 channels, should probably work up to 12 channels

#define SUMD_SYNCBYTE 0xA8
#define SUMD_MAX_CHANNEL 16
#define SUMD_BUFFSIZE (SUMD_MAX_CHANNEL * 2 + 5) // 6 channels + 5 = 17 bytes for 6 channels

#define SUMD_BAUDRATE 115200

static bool sumdFrameDone = false;
static uint32_t sumdChannels[SUMD_MAX_CHANNEL];

static void sumdDataReceive(uint16_t c);
static uint16_t sumdReadRawRC(rxRuntimeConfig_t *rxRuntimeConfig, uint8_t chan);

bool sumdInit(rxConfig_t *rxConfig, rxRuntimeConfig_t *rxRuntimeConfig, rcReadRawDataPtr *callback)
{
    UNUSED(rxConfig);

    if (callback)
        *callback = sumdReadRawRC;

    rxRuntimeConfig->channelCount = SUMD_MAX_CHANNEL;

    serialPortConfig_t *portConfig = findSerialPortConfig(FUNCTION_RX_SERIAL);
    if (!portConfig) {
        return false;
    }

    serialPort_t *sumdPort = openSerialPort(portConfig->identifier, FUNCTION_RX_SERIAL, sumdDataReceive, SUMD_BAUDRATE, MODE_RX, SERIAL_NOT_INVERTED);

    return sumdPort != NULL;
}

static uint8_t sumd[SUMD_BUFFSIZE] = { 0, };
static uint8_t sumdChannelCount;

// Receive ISR callback
static void sumdDataReceive(uint16_t c)
{
    uint32_t sumdTime;
    static uint32_t sumdTimeLast;
    static uint8_t sumdIndex;

    sumdTime = micros();
    if ((sumdTime - sumdTimeLast) > 4000)
        sumdIndex = 0;
    sumdTimeLast = sumdTime;

    if (sumdIndex == 0) {
        if (c != SUMD_SYNCBYTE)
            return;
        else
            sumdFrameDone = false; // lazy main loop didnt fetch the stuff
    }
    if (sumdIndex == 2)
        sumdChannelCount = (uint8_t)c;
    if (sumdIndex < SUMD_BUFFSIZE)
        sumd[sumdIndex] = (uint8_t)c;
    sumdIndex++;
    if (sumdIndex == sumdChannelCount * 2 + 5) {
        sumdIndex = 0;
        sumdFrameDone = true;
    }
}

#define SUMD_OFFSET_CHANNEL_1_HIGH 3
#define SUMD_OFFSET_CHANNEL_1_LOW 4
#define SUMD_BYTES_PER_CHANNEL 2


bool sumdFrameComplete(void)
{
    uint8_t channelIndex;

    if (!sumdFrameDone) {
        return false;
    }

    sumdFrameDone = false;

    if (sumd[1] != 0x01) {
        return false;
    }

    if (sumdChannelCount > SUMD_MAX_CHANNEL)
        sumdChannelCount = SUMD_MAX_CHANNEL;

    for (channelIndex = 0; channelIndex < sumdChannelCount; channelIndex++) {
        sumdChannels[channelIndex] = (
            (sumd[SUMD_BYTES_PER_CHANNEL * channelIndex + SUMD_OFFSET_CHANNEL_1_HIGH] << 8) |
            sumd[SUMD_BYTES_PER_CHANNEL * channelIndex + SUMD_OFFSET_CHANNEL_1_LOW]
        );
    }
    return true;
}

static uint16_t sumdReadRawRC(rxRuntimeConfig_t *rxRuntimeConfig, uint8_t chan)
{
    UNUSED(rxRuntimeConfig);
    return sumdChannels[chan] / 8;
}
