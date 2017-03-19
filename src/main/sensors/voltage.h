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

#include "voltage_ids.h"

//
// meters
//

typedef enum {
    VOLTAGE_METER_NONE = 0,
    VOLTAGE_METER_ADC,
    VOLTAGE_METER_ESC
} voltageMeterSource_e;

// WARNING - do not mix usage of VOLTAGE_METER_* and VOLTAGE_SENSOR_*, they are separate concerns.

typedef struct voltageMeter_s {
    uint16_t filtered;                      // voltage in 0.1V steps
    uint16_t unfiltered;                    // voltage in 0.1V steps
} voltageMeter_t;


//
// sensors
//

typedef enum {
    VOLTAGE_SENSOR_TYPE_ADC_RESISTOR_DIVIDER = 0,
    VOLTAGE_SENSOR_TYPE_ESC
} voltageSensorType_e;


//
// adc sensors
//

#define VBAT_SCALE_MIN 0
#define VBAT_SCALE_MAX 255

#define VBATT_LPF_FREQ  1.0f

#ifndef MAX_VOLTAGE_SENSOR_ADC
#define MAX_VOLTAGE_SENSOR_ADC 1 // VBAT - some boards have external, 12V, 9V and 5V meters.
#endif

typedef enum {
    VOLTAGE_SENSOR_ADC_VBAT = 0,
    VOLTAGE_SENSOR_ADC_12V = 1,
    VOLTAGE_SENSOR_ADC_9V = 2,
    VOLTAGE_SENSOR_ADC_5V = 3
} voltageSensorADC_e; // see also voltageMeterADCtoIDMap


typedef struct voltageSensorADCConfig_s {
    uint8_t vbatscale;                      // adjust this to match battery voltage to reported value
    uint8_t vbatresdivval;                  // resistor divider R2 (default NAZE 10(K))
    uint8_t vbatresdivmultiplier;           // multiplier for scale (e.g. 2.5:1 ratio with multiplier of 4 can use '100' instead of '25' in ratio) to get better precision
} voltageSensorADCConfig_t;

PG_DECLARE_ARRAY(voltageSensorADCConfig_t, MAX_VOLTAGE_SENSOR_ADC, voltageSensorADCConfig);

//
// Main API
//
void voltageMeterReset(voltageMeter_t *voltageMeter);

void voltageMeterADCInit(void);
void voltageMeterADCRefresh(void);
void voltageMeterADCRead(voltageSensorADC_e adcChannel, voltageMeter_t *voltageMeter);

void voltageMeterESCInit(void);
void voltageMeterESCRefresh(void);
void voltageMeterESCReadCombined(voltageMeter_t *voltageMeter);
void voltageMeterESCReadMotor(uint8_t motor, voltageMeter_t *voltageMeter);


//
// API for reading/configuring current meters by id.
//
extern const uint8_t voltageMeterADCtoIDMap[MAX_VOLTAGE_SENSOR_ADC];

extern const uint8_t supportedVoltageMeterCount;
extern const uint8_t voltageMeterIds[];
void voltageMeterRead(voltageMeterId_e id, voltageMeter_t *voltageMeter);
