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

#include <stdbool.h>
#include <stdint.h>

#define VTX_RTC6705_MIN_BAND 1
#define VTX_RTC6705_MAX_BAND 5
#define VTX_RTC6705_MIN_CHAN 1
#define VTX_RTC6705_MAX_CHAN 8

#define VTX_RTC6705_BAND_COUNT (VTX_RTC6705_MAX_BAND - VTX_RTC6705_MIN_BAND + 1)
#define VTX_RTC6705_CHAN_COUNT (VTX_RTC6705_MAX_CHAN - VTX_RTC6705_MIN_CHAN + 1)

#ifdef RTC6705_POWER_PIN
#define VTX_RTC6705_POWER_COUNT 3
#define VTX_RTC6705_DEFAULT_POWER 1
#else
#define VTX_RTC6705_POWER_COUNT 2
#define VTX_RTC6705_DEFAULT_POWER 0
#endif

extern const char * const rtc6705PowerNames[VTX_RTC6705_POWER_COUNT];

void vtxRTC6705Configure(void);
bool vtxRTC6705Init();
