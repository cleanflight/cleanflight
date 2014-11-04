/*
 * This file is part of baseflight
 * Licensed under GPL V3 or modified DCL - see https://github.com/multiwii/baseflight/blob/master/README.md
 */

#include "board.h"
#include "mw.h"

// driver for spektrum satellite receiver / sbus using UART2 (freeing up more motor outputs for stuff)

#define SPEK_2048_MAX_CHANNEL 8
#define SPEK_1024_MAX_CHANNEL 7
#define SPEK_FRAME_SIZE 16
static uint8_t spek_chan_shift;
static uint8_t spek_chan_mask;
static bool rcFrameComplete = false;
static bool spekHiRes = false;
static bool spekDataIncoming = false;
static GPIO_TypeDef *spekBindPort = NULL;
static USART_TypeDef *spekUart = NULL;
static uint16_t spekBindPin = 0;

volatile uint8_t spekFrame[SPEK_FRAME_SIZE];
static void spektrumDataReceive(uint16_t c);
static uint16_t spektrumReadRawRC(uint8_t chan);

// external vars (ugh)
extern int16_t failsafeCnt;

void spektrumInit(rcReadRawDataPtr *callback)
{
    switch (mcfg.serialrx_type) {
        case SERIALRX_SPEKTRUM2048:
            // 11 bit frames
            spek_chan_shift = 3;
            spek_chan_mask = 0x07;
            spekHiRes = true;
            core.numRCChannels = SPEK_2048_MAX_CHANNEL;
            break;
        case SERIALRX_SPEKTRUM1024:
            // 10 bit frames
            spek_chan_shift = 2;
            spek_chan_mask = 0x03;
            spekHiRes = false;
            core.numRCChannels = SPEK_1024_MAX_CHANNEL;
            break;
    }

    // spekUart is set by spektrumBind() which is called very early at startup
    core.rcvrport = uartOpen(spekUart, spektrumDataReceive, 115200, MODE_RX);

    if (callback)
        *callback = spektrumReadRawRC;
}

// Receive ISR callback
static void spektrumDataReceive(uint16_t c)
{
    uint32_t spekTime;
    static uint32_t spekTimeLast, spekTimeInterval;
    static uint8_t spekFramePosition;

    spekDataIncoming = true;
    spekTime = micros();
    spekTimeInterval = spekTime - spekTimeLast;
    spekTimeLast = spekTime;
    if (spekTimeInterval > 5000)
        spekFramePosition = 0;
    spekFrame[spekFramePosition] = (uint8_t)c;
    if (spekFramePosition == SPEK_FRAME_SIZE - 1) {
        rcFrameComplete = true;
        failsafeCnt = 0;   // clear FailSafe counter
    } else {
        spekFramePosition++;
    }
}

bool spektrumFrameComplete(void)
{
    return rcFrameComplete;
}

static uint16_t spektrumReadRawRC(uint8_t chan)
{
    uint16_t data;
    static uint32_t spekChannelData[SPEK_2048_MAX_CHANNEL];
    uint8_t b;

    if (rcFrameComplete) {
        for (b = 3; b < SPEK_FRAME_SIZE; b += 2) {
            uint8_t spekChannel = 0x0F & (spekFrame[b - 1] >> spek_chan_shift);
            if (spekChannel < core.numRCChannels)
                spekChannelData[spekChannel] = ((uint32_t)(spekFrame[b - 1] & spek_chan_mask) << 8) + spekFrame[b];
        }
        rcFrameComplete = false;
    }

    if (chan >= core.numRCChannels || !spekDataIncoming) {
        data = mcfg.midrc;
    } else {
        if (spekHiRes)
            data = 988 + (spekChannelData[mcfg.rcmap[chan]] >> 1);   // 2048 mode
        else
            data = 988 + spekChannelData[mcfg.rcmap[chan]];          // 1024 mode
    }

    return data;
}

/* spektrumBind function. It's used to bind satellite receiver to TX.
 * Function must be called immediately after startup so that we don't miss satellite bind window.
 * Known parameters. Tested with DSMX satellite and DX8 radio. Framerate (11ms or 22ms) must be selected from TX.
 * 9 = DSMX 11ms / DSMX 22ms
 * 5 = DSM2 11ms 2048 / DSM2 22ms 1024 
 */
void spektrumBind(void)
{
    int i;
    gpio_config_t gpio;

    if (mcfg.spektrum_sat_on_flexport) {
        // USART3, PB11
        spekBindPort = GPIOB;
        spekBindPin = Pin_11;
        spekUart = USART3;
    } else {
        // USART2, PA3
        spekBindPort = GPIOA;
        spekBindPin = Pin_3;
        spekUart = USART2;
    }

    if (mcfg.spektrum_sat_bind == 0 || mcfg.spektrum_sat_bind > 10)
        return;

    gpio.speed = Speed_2MHz;
    gpio.pin = spekBindPin;
    gpio.mode = Mode_Out_OD;
    gpioInit(spekBindPort, &gpio);
    // RX line, set high
    digitalHi(spekBindPort, spekBindPin);
    // Bind window is around 20-140ms after powerup
    delay(60);

    for (i = 0; i < mcfg.spektrum_sat_bind; i++) {
        // RX line, drive low for 120us
        digitalLo(spekBindPort, spekBindPin);
        delayMicroseconds(120);
        // RX line, drive high for 120us
        digitalHi(spekBindPort, spekBindPin);
        delayMicroseconds(120);
    }
}
