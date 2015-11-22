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

#include "drivers/gpio.h"
#include "drivers/inverter.h"

#include "drivers/serial.h"
#include "drivers/serial_uart.h"
#include "io/serial.h"

#include "rx/rx.h"
#include "rx/sbus.h"

/*
 * Observations
 *
 * FrSky X8R
 * time between frames: 6ms.
 * time to send frame: 3ms.
*
 * Futaba R6208SB/R6303SB
 * time between frames: 11ms.
 * time to send frame: 3ms.
 */

#define SBUS_TIME_NEEDED_PER_FRAME 3000

#ifndef CJMCU
//#define DEBUG_SBUS_PACKETS
#endif

#ifdef DEBUG_SBUS_PACKETS
static uint16_t sbusStateFlags = 0;

#define SBUS_STATE_FAILSAFE (1 << 0)
#define SBUS_STATE_SIGNALLOSS (1 << 1)

#endif

#define SBUS_MAX_CHANNEL 18
#define SBUS_FRAME_SIZE 25

#define SBUS_FRAME_BEGIN_BYTE 0x0F

#define SBUS_BAUDRATE 100000
#define SBUS_PORT_OPTIONS (SERIAL_STOPBITS_2 | SERIAL_PARITY_EVEN | SERIAL_INVERTED)

#define SBUS_DIGITAL_CHANNEL_MIN 173
#define SBUS_DIGITAL_CHANNEL_MAX 1812

static bool sbusFrameDone = false;
static void sbusDataReceive(uint16_t c);
static uint16_t sbusReadRawRC(rxRuntimeConfig_t *rxRuntimeConfig, uint8_t chan);

static uint32_t sbusChannelData[SBUS_MAX_CHANNEL];

bool sbusInit(rxConfig_t *rxConfig, rxRuntimeConfig_t *rxRuntimeConfig, rcReadRawDataPtr *callback)
{
    int b;
    for (b = 0; b < SBUS_MAX_CHANNEL; b++)
        sbusChannelData[b] = (16 * rxConfig->midrc) / 10 - 1408;
    if (callback)
        *callback = sbusReadRawRC;
    rxRuntimeConfig->channelCount = SBUS_MAX_CHANNEL;

    serialPortConfig_t *portConfig = findSerialPortConfig(FUNCTION_RX_SERIAL);
    if (!portConfig) {
        return false;
    }

    serialPort_t *sBusPort = openSerialPort(portConfig->identifier, FUNCTION_RX_SERIAL, sbusDataReceive, SBUS_BAUDRATE, MODE_RX, SBUS_PORT_OPTIONS);

    return sBusPort != NULL;
}

#define SBUS_FLAG_CHANNEL_17        (1 << 0)
#define SBUS_FLAG_CHANNEL_18        (1 << 1)
#define SBUS_FLAG_SIGNAL_LOSS       (1 << 2)
#define SBUS_FLAG_FAILSAFE_ACTIVE   (1 << 3)

/**
 * The last byte is 0x00 on FrSky and some futaba RX's, on Some SBUS2 RX's the value indicates the telemetry byte that is sent after every 4th sbus frame.
 *
 * See https://github.com/cleanflight/cleanflight/issues/590#issuecomment-101027349
 * and
 * https://github.com/cleanflight/cleanflight/issues/590#issuecomment-101706023
 */

static uint8_t sbusFrame[SBUS_FRAME_SIZE];
static bool    sbusFrameProccessing;
static bool    sbusFrameIgnore;

// Receive ISR callback
static void sbusDataReceive(uint16_t c)
{
    static uint8_t sbusFramePosition = 0;
    static uint32_t sbusFrameStartAt = 0;
    uint32_t now = micros();

    int32_t sbusFrameTime = now - sbusFrameStartAt;

    if (sbusFrameTime > (long)(SBUS_TIME_NEEDED_PER_FRAME + 500)) {
        sbusFramePosition = 0;
        sbusFrameIgnore   = false;
    }

    if (sbusFrameProccessing) {
        sbusFrameIgnore = true;
    }

    if (!sbusFrameIgnore) {
        if( sbusFramePosition >= 25 ){
            printf("!\n");
        }
        sbusFrame[sbusFramePosition] = (uint8_t)c;
    }


    if (sbusFramePosition == 0) {
        if (c != SBUS_FRAME_BEGIN_BYTE) {
            return;
        }
        sbusFrameStartAt = now;
    }

    sbusFramePosition++;

    if (sbusFramePosition == SBUS_FRAME_SIZE) {
        // endByte currently ignored

        sbusFramePosition = 0;
        sbusFrameDone     = true;

#ifdef DEBUG_SBUS_PACKETS
        debug[2] = sbusFrameTime;
#endif
    } else {
        sbusFrameDone = false;
    }
}

uint8_t sbusFrameStatus(void)
{
    if (!sbusFrameDone) {
        return SERIAL_RX_FRAME_PENDING;
    }

#ifdef DEBUG_SBUS_PACKETS
    sbusStateFlags = 0;
    debug[1] = sbusFrame.frame.flags;
#endif

    sbusFrameProccessing = true;

    for( uint8_t bit=8 , ch=0 ; ch < 16 ; ch++ ){
        uint16_t value  = 0;
        uint8_t  length = 0;

        do{
            value  |=  (sbusFrame[bit>>3] >> (bit&7)) << length;

            uint8_t step = 8 - (bit&7);
            length += step;
            bit    += step;

        }while( length < 11 );

        bit -= length - 11;

        sbusChannelData[ch] = value & 0x07FF;
    }

    uint8_t flags = sbusFrame[23];

    sbusFrameProccessing = false;
    sbusFrameDone        = false;

    if (flags & SBUS_FLAG_CHANNEL_17) {
        sbusChannelData[16] = SBUS_DIGITAL_CHANNEL_MAX;
    } else {
        sbusChannelData[16] = SBUS_DIGITAL_CHANNEL_MIN;
    }

    if (flags & SBUS_FLAG_CHANNEL_18) {
        sbusChannelData[17] = SBUS_DIGITAL_CHANNEL_MAX;
    } else {
        sbusChannelData[17] = SBUS_DIGITAL_CHANNEL_MIN;
    }

    if (flags & SBUS_FLAG_SIGNAL_LOSS) {
#ifdef DEBUG_SBUS_PACKETS
        sbusStateFlags |= SBUS_STATE_SIGNALLOSS;
        debug[0] = sbusStateFlags;
#endif
    }
    if (flags & SBUS_FLAG_FAILSAFE_ACTIVE) {
        // internal failsafe enabled and rx failsafe flag set
#ifdef DEBUG_SBUS_PACKETS
        sbusStateFlags |= SBUS_STATE_FAILSAFE;
        debug[0] = sbusStateFlags;
#endif
        // RX *should* still be sending valid channel data, so use it.
        return SERIAL_RX_FRAME_COMPLETE | SERIAL_RX_FRAME_FAILSAFE;
    }

#ifdef DEBUG_SBUS_PACKETS
    debug[0] = sbusStateFlags;
#endif
    return SERIAL_RX_FRAME_COMPLETE;
}

static uint16_t sbusReadRawRC(rxRuntimeConfig_t *rxRuntimeConfig, uint8_t chan)
{
    UNUSED(rxRuntimeConfig);
    // Linear fitting values read from OpenTX-ppmus and comparing with values received by X4R
    // http://www.wolframalpha.com/input/?i=linear+fit+%7B173%2C+988%7D%2C+%7B1812%2C+2012%7D%2C+%7B993%2C+1500%7D
    return (0.625f * sbusChannelData[chan]) + 880;
}
