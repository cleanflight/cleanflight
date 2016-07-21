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
    RGBW_RED = 0,
    RGBW_GREEN,
    RGBW_BLUE,
    RGBW_WHITE,
} colorComponent_e;

#define RGB_COLOR_COMPONENT_COUNT (RGBW_BLUE + 1)
#define RGBW_COLOR_COMPONENT_COUNT (RGBW_WHITE + 1)

typedef union {
    struct {
        uint8_t r;
        uint8_t g;
        uint8_t b;
    } rgb;
    uint8_t raw[RGB_COLOR_COMPONENT_COUNT];
} rgbColor24bpp_t;

typedef union {
    struct {
        uint8_t r;
        uint8_t g;
        uint8_t b;
        uint8_t w;
    } rgbw;
    uint8_t raw[RGBW_COLOR_COMPONENT_COUNT];
} rgbwColor32bpp_t;

#define HSV_HUE_MAX 359
#define HSV_SATURATION_MAX 255
#define HSV_VALUE_MAX 255
typedef enum {
    HSV_HUE = 0,
    HSV_SATURATION,
    HSV_VALUE
} hsvColorComponent_e;

#define HSV_COLOR_COMPONENT_COUNT (HSV_VALUE + 1)
typedef struct hsvColor_s {
    uint16_t h; // 0 - 359
    uint8_t s; // 0 - 255
    uint8_t v; // 0 - 255
} hsvColor_t;
