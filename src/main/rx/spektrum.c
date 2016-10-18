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

#include <platform.h>
#include "build/debug.h"

#include "config/parameter_group.h"

#include "drivers/dma.h"
#include "drivers/gpio.h"
#include "drivers/system.h"

#include "drivers/light_led.h"

#include "drivers/serial.h"
#include "drivers/serial_uart.h"
#include "io/serial.h"

#include "fc/config.h"

#include "rx/rx.h"
#include "rx/spektrum.h"

// driver for spektrum satellite receiver / sbus

#define SPEKTRUM_MAX_SUPPORTED_CHANNEL_COUNT 12
#define SPEKTRUM_2048_CHANNEL_COUNT 12
#define SPEKTRUM_1024_CHANNEL_COUNT 7

#define SPEK_FRAME_SIZE 16
#define SPEKTRUM_NEEDED_FRAME_INTERVAL 5000

#define SPEKTRUM_BAUDRATE 115200

static uint8_t initialPacket = 0;
static uint8_t frameLoss = 0;
static uint8_t spek_chan_shift;
static uint8_t spek_chan_mask;
static bool rcFrameComplete = false;
static bool spekHiRes = false;

static volatile uint8_t spekFrame[SPEK_FRAME_SIZE];

static void spektrumDataReceive(uint16_t c);
static uint16_t spektrumReadRawRC(const rxRuntimeConfig_t *rxRuntimeConfig, uint8_t chan);

static rxRuntimeConfig_t *rxRuntimeConfigPtr;

bool spektrumInit(rxRuntimeConfig_t *rxRuntimeConfig, rcReadRawDataPtr *callback)
{
    rxRuntimeConfigPtr = rxRuntimeConfig;

    switch (rxConfig()->serialrx_provider) {
        case SERIALRX_SPEKTRUM2048:
            // 11 bit frames
            spek_chan_shift = 3;
            spek_chan_mask = 0x07;
            spekHiRes = true;
            rxRuntimeConfig->channelCount = SPEKTRUM_2048_CHANNEL_COUNT;
            break;
        case SERIALRX_SPEKTRUM1024:
            // 10 bit frames
            spek_chan_shift = 2;
            spek_chan_mask = 0x03;
            spekHiRes = false;
            rxRuntimeConfig->channelCount = SPEKTRUM_1024_CHANNEL_COUNT;
            break;
    }

    if (callback)
        *callback = spektrumReadRawRC;

    serialPortConfig_t *portConfig = findSerialPortConfig(FUNCTION_RX_SERIAL);
    if (!portConfig) {
        return false;
    }

    serialPort_t *spektrumPort = openSerialPort(portConfig->identifier, FUNCTION_RX_SERIAL, spektrumDataReceive, SPEKTRUM_BAUDRATE, MODE_RX, SERIAL_NOT_INVERTED);

    return spektrumPort != NULL;
}

// Receive ISR callback
static void spektrumDataReceive(uint16_t c)
{
    uint32_t spekTime, spekTimeInterval;
    static uint32_t spekTimeLast = 0;
    static uint8_t spekFramePosition = 0;

    spekTime = micros();
    spekTimeInterval = spekTime - spekTimeLast;
    spekTimeLast = spekTime;

    if (spekTimeInterval > SPEKTRUM_NEEDED_FRAME_INTERVAL) {
        spekFramePosition = 0;
    }

    if (spekFramePosition < SPEK_FRAME_SIZE) {
        spekFrame[spekFramePosition++] = (uint8_t)c;
        if (spekFramePosition == SPEK_FRAME_SIZE) {
            rcFrameComplete = true;
        } else {
            rcFrameComplete = false;
        }
    }
}

static uint32_t spekChannelData[SPEKTRUM_MAX_SUPPORTED_CHANNEL_COUNT];

uint8_t spektrumFrameStatus(rxConfig_t *rxConfig, rxRuntimeConfig_t *rxRuntimeConfig)
{
    uint8_t b;

    if (!rcFrameComplete) {
        return SERIAL_RX_FRAME_PENDING;
    }

    rcFrameComplete = false;

	//Check for bind type in the first packet after startup. This is provided in the second byte in a data packet from the internal remote.
    //This packet wont contain any data if the remote was bound using a separate receiver (bound as external remote)
    if(!initialPacket){

        //save current resolution to variable in case remote rx is bound as external.
        //This will prevent the if statement (after the switch case) from setting the resolution to an incorrect value if no resolution data is received.
        uint8_t spmResolution = rxConfig->serialrx_provider;

        switch (spekFrame[1]){
            case 0xb2:       //11MS 2048 DSMX
                spmResolution = SERIALRX_SPEKTRUM2048;
                break;
            case 0xa2:  //22MS 2048 DSMX
                spmResolution = SERIALRX_SPEKTRUM2048;
                break;
            case 0x12:  //11MS 2048 DSM2
                spmResolution = SERIALRX_SPEKTRUM2048;
                break;
            case 0x01:  //22MS 1024 DSM2
                spmResolution = SERIALRX_SPEKTRUM1024;
                break;
        }

    if(rxConfig->serialrx_provider != spmResolution){
        rxConfig->serialrx_provider = spmResolution;
        saveConfigAndNotify();
    }
        //Immediately set the resolution settings so that a reboot isn't required after binding.
        switch (rxConfig->serialrx_provider) {
            case SERIALRX_SPEKTRUM2048:
                // 11 bit frames
                spek_chan_shift = 3;
                spek_chan_mask = 0x07;
                spekHiRes = true;
                rxRuntimeConfig->channelCount = SPEKTRUM_2048_CHANNEL_COUNT;
                break;
            case SERIALRX_SPEKTRUM1024:
                // 10 bit frames
                spek_chan_shift = 2;
                spek_chan_mask = 0x03;
                spekHiRes = false;
                rxRuntimeConfig->channelCount = SPEKTRUM_1024_CHANNEL_COUNT;
                break;
        }

        initialPacket=1;    //prevent this byte from being read every packet. It's only necessary to determine bind type at startup.
    }

    frameLoss = spekFrame[0];   //fades (or frame loss if single sat rx) is provided in the first byte of a sat rx packet

    for (b = 3; b < SPEK_FRAME_SIZE; b += 2) {
        uint8_t spekChannel = 0x0F & (spekFrame[b - 1] >> spek_chan_shift);
        if (spekChannel < rxRuntimeConfigPtr->channelCount && spekChannel < SPEKTRUM_MAX_SUPPORTED_CHANNEL_COUNT) {
            spekChannelData[spekChannel] = ((uint32_t)(spekFrame[b - 1] & spek_chan_mask) << 8) + spekFrame[b];
        }
    }

    return SERIAL_RX_FRAME_COMPLETE;
}

static uint16_t spektrumReadRawRC(const rxRuntimeConfig_t *rxRuntimeConfig, uint8_t chan)
{
    uint16_t data;

    if (chan >= rxRuntimeConfig->channelCount) {
        return 0;
    }

#ifdef SPEKTRUM_PROPER_SCALING //To match intended spektrum pulse range. This will allow consistent travel between ppm and serial rx's
    if (spekHiRes)
        data = 903 + (spekChannelData[chan]*.583);    // 2048 mode
    else
        data = 903 + (spekChannelData[chan]*1.166);   // 1024 mode
#else
    if (spekHiRes)
        data = 988 + (spekChannelData[chan] >> 1);      // 2048 mode
    else
        data = 988 + spekChannelData[chan];             // 1024 mode
#endif
    return data;
}

#ifdef SPEKTRUM_BIND

bool spekShouldBind(uint8_t spektrum_sat_bind)
{
#ifdef HARDWARE_BIND_PLUG
    gpio_config_t cfg = {
        BINDPLUG_PIN,
        Mode_IPU,
        Speed_2MHz
    };
    gpioInit(BINDPLUG_PORT, &cfg);

    // Check status of bind plug and exit if not active
    delayMicroseconds(10);  // allow configuration to settle
    if (digitalIn(BINDPLUG_PORT, BINDPLUG_PIN)) {
        return false;
    }
#endif

    return !(
        isMPUSoftReset() ||
        spektrum_sat_bind == SPEKTRUM_SAT_BIND_DISABLED ||
        spektrum_sat_bind > SPEKTRUM_SAT_BIND_MAX
    );
}
/* spektrumBind function ported from Baseflight. It's used to bind satellite receiver to TX.
 * Function must be called immediately after startup so that we don't miss satellite bind window.
 * Known parameters. Tested with DSMX satellite and DX8 radio. Framerate (11ms or 22ms) must be selected from TX.
 * 9 = DSMX 11ms / DSMX 22ms
 * 5 = DSM2 11ms 2048 / DSM2 22ms 1024
 */
void spektrumBind(rxConfig_t *rxConfig)
{
    int i;
    if (!spekShouldBind(rxConfig->spektrum_sat_bind)) {
        return;
    }

    LED1_ON;

    gpio_config_t cfg = {
        BIND_PIN,
        Mode_Out_OD,
        Speed_2MHz
    };
    gpioInit(BIND_PORT, &cfg);

    // RX line, set high
    digitalHi(BIND_PORT, BIND_PIN);

    // Bind window is around 20-140ms after powerup
    delay(60);
    LED1_OFF;

    for (i = 0; i < rxConfig->spektrum_sat_bind; i++) {

        LED0_OFF;
        LED2_OFF;
        // RX line, drive low for 120us
        digitalLo(BIND_PORT, BIND_PIN);
        delayMicroseconds(120);

        LED0_ON;
        LED2_ON;
        // RX line, drive high for 120us
        digitalHi(BIND_PORT, BIND_PIN);
        delayMicroseconds(120);

    }

#ifndef HARDWARE_BIND_PLUG
    // If we came here as a result of hard  reset (power up, with spektrum_sat_bind set), then reset it back to zero and write config
    // Don't reset if hardware bind plug is present
    if (!isMPUSoftReset()) {
        rxConfig->spektrum_sat_bind = 0;
        saveConfigAndNotify();
    }
#endif

}
#endif
