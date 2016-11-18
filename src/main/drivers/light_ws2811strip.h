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

typedef enum {
    RGB,
    RGBW
} ledType_e;

typedef struct ledType_s {
    ledType_e t;
} ledType_t;

#define WS2811_LED_STRIP_LENGTH 32

#define WS2811_BITS_PER_LED_RGBW 32
#define WS2811_DELAY_BUFFER_LENGTH_RGBW 1 // oscilloscope shows 8500탎 interframe delay when using 1

#define WS2811_BITS_PER_LED_RGB 24
#define WS2811_DELAY_BUFFER_LENGTH_RGB 42


#define WS2811_DATA_BUFFER_SIZE_RGB (WS2811_BITS_PER_LED_RGB * WS2811_LED_STRIP_LENGTH)
#define WS2811_DATA_BUFFER_SIZE_RGBW (WS2811_BITS_PER_LED_RGBW * WS2811_LED_STRIP_LENGTH)

#define WS2811_DMA_BUFFER_SIZE_RGB (WS2811_DATA_BUFFER_SIZE_RGB + WS2811_DELAY_BUFFER_LENGTH_RGB)   // number of bytes needed is #LEDs * 24 bytes + 42 trailing bytes)
#define WS2811_DMA_BUFFER_SIZE_RGBW (WS2811_DATA_BUFFER_SIZE_RGBW + WS2811_DELAY_BUFFER_LENGTH_RGBW)   // number of bytes needed is #LEDs * 24 bytes + 42 trailing bytes)

#define BIT_COMPARE_1 17     // timer compare value for logical 1 // 0.6/0.6탎
#define BIT_COMPARE_0_RGB 9  // timer compare value for logical 0 // 0.3/0.9탎
#define BIT_COMPARE_0_RGBW 8 // timer compare value for logical 0 // 0.3/0.9탎

#ifdef RGBW
#define WS2811_DMA_BUFFER_SIZE WS2811_DMA_BUFFER_SIZE_RGBW
#define BIT_COMPARE_0 BIT_COMPARE_0_RGBW
#else
#define WS2811_DMA_BUFFER_SIZE WS2811_DMA_BUFFER_SIZE_RGB
#define BIT_COMPARE_0 BIT_COMPARE_0_RGB
#endif

void ws2811LedStripInit(ledType_e ledType);

void ws2811LedStripHardwareInit(void);
void ws2811LedStripDMAEnable(void);

void ws2811UpdateStrip(void);

void setLedHsv(int index, const hsvColor_t *color);
void getLedHsv(int index, hsvColor_t *color);

void scaleLedValue(int index, const uint8_t scalePercent);
void setLedValue(int index, const uint8_t value);

void setStripColor(const hsvColor_t *color);
void setStripColors(const hsvColor_t *colors);

bool isWS2811LedStripReady(void);

extern uint8_t ledStripDMABuffer[WS2811_DMA_BUFFER_SIZE];

extern volatile uint8_t ws2811LedDataTransferInProgress;
extern ledType_e ws2811LedType;
