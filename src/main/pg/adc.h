/*
 * This file is part of Cleanflight.
 *
 * Cleanflight is free software. You can redistribute
 * this software and/or modify this software under the terms of the
 * GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option)
 * any later version.
 *
 * Cleanflight is distributed in the hope that it
 * will be useful, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this software.
 *
 * If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#include <stdint.h>
#include <stdbool.h>

#include "pg/pg.h"
#include "drivers/adc.h"
#include "drivers/io_types.h"
#include "drivers/dma_reqmap.h"

#if defined(STM32F1)
#define MAX_ADC_SUPPORTED 1
#elif defined(STM32F3)
#define MAX_ADC_SUPPORTED 4
#elif defined(STM32F4) || defined(STM32F7) || defined(STM32H7)
#define MAX_ADC_SUPPORTED 3
#elif defined(STM32G4)
#define MAX_ADC_SUPPORTED 5
#elif defined(UNIT_TEST)
#define MAX_ADC_SUPPORTED 5
#else
#error Missing MCU ADC configuration
#endif

typedef struct adcChannelConfig_t {
    bool enabled;
    ioTag_t ioTag;
} adcChannelConfig_t;

typedef struct adcConfig_s {
    adcChannelConfig_t vbat;
    adcChannelConfig_t rssi;
    adcChannelConfig_t current;
    adcChannelConfig_t external1;
    int8_t device; // ADCDevice

    uint16_t vrefIntCalibration;
    uint16_t tempSensorCalibration1;
    uint16_t tempSensorCalibration2;

    int8_t dmaopt[MAX_ADC_SUPPORTED]; // One per ADCDEV_x
} adcConfig_t;

PG_DECLARE(adcConfig_t, adcConfig);
