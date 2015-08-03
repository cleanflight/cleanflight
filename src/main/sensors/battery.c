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

#include "stdbool.h"
#include "stdint.h"
#include <math.h>

#include "common/maths.h"

#include "drivers/adc.h"
#include "drivers/system.h"

#include "config/runtime_config.h"
#include "config/config.h"

#include "sensors/battery.h"

#include "rx/rx.h"

#include "io/rc_controls.h"

// Battery monitoring stuff
uint8_t batteryCellCount = 3;       // cell count
uint16_t batteryMaxVoltage;
uint16_t batteryWarningVoltage;
uint16_t batteryCriticalVoltage;

uint8_t vbat = 0;                   // battery voltage in 0.1V steps
float vbatf = 0.0f;                 // battery voltage in 0.1V steps, but maintaining averaging resolution
uint16_t vbatLatestADC = 0;         // most recent unsmoothed raw reading from vbat ADC
uint16_t amperageLatestADC = 0;     // most recent raw reading from current ADC

int32_t amperage = 0;               // amperage read by current sensor in centiampere (1/100th A)
int32_t mAhDrawn = 0;               // milliampere hours drawn from the battery since start

batteryConfig_t *batteryConfig;

float batteryAdcToVoltageF(uint16_t src)
{
    // calculate battery voltage based on ADC reading
    // result is Vbatt in 0.1V steps. 3.3V = ADC Vref, 0xFFF = 12bit adc, 110 = 11:1 voltage divider (10k:1k) * 10 for 0.1V
    return ((uint32_t)src * batteryConfig->vbatscale * 3.3f) / 0xFFF;
}
// for the unit test
uint16_t batteryAdcToVoltage(uint16_t src)
{
  return lrintf(batteryAdcToVoltageF(src));
}
void updateBatteryVoltage(void)
{
    vbatLatestADC = adcGetChannel(ADC_BATTERY);
    vbatf = (vbatf * 0.98f) + (batteryAdcToVoltageF(vbatLatestADC) * 0.02f);
    vbat = (uint8_t)lrintf(vbatf);
}

batteryState_e calculateBatteryState(void)
{
    if (vbat <= batteryCriticalVoltage) {
        return BATTERY_CRITICAL;
    }
    if (vbat <= batteryWarningVoltage) {
        return BATTERY_WARNING;
    }
    return BATTERY_OK;
}

void batteryInit(batteryConfig_t *initialBatteryConfig)
{
    batteryConfig = initialBatteryConfig;

    uint32_t i;

    vbatf = batteryAdcToVoltageF(adcGetChannel(ADC_BATTERY));
    for (i = 0; i < 100; i++) {
        updateBatteryVoltage();
        delay(2);
    }

    unsigned cells = (vbat / batteryConfig->vbatmaxcellvoltage) + 1;
    if(cells > 8)            // something is wrong, we expect 8 cells maximum (and autodetection will be problematic at 6+ cells)
        cells = 8;
    batteryCellCount = cells;
    batteryWarningVoltage = batteryCellCount * batteryConfig->vbatwarningcellvoltage;
    batteryCriticalVoltage = batteryCellCount * batteryConfig->vbatmincellvoltage;
    batteryMaxVoltage = batteryCellCount * batteryConfig->vbatmaxcellvoltage;
}

#define ADCVREF 3300   // in mV
int32_t currentSensorToCentiamps(uint16_t src)
{
    int32_t millivolts;

    millivolts = ((uint32_t)src * ADCVREF) / 4096;
    millivolts -= batteryConfig->currentMeterOffset;

    return (millivolts * 1000) / (int32_t)batteryConfig->currentMeterScale; // current in 0.01A steps
}

void updateCurrentMeter(int32_t lastUpdateAt, rxConfig_t *rxConfig, uint16_t deadband3d_throttle)
{
    static int32_t amperageRaw = 0;
    static int64_t mAhdrawnRaw = 0;
    int32_t throttleOffset = (int32_t)rcCommand[THROTTLE] - 1000;
    int32_t throttleFactor = 0;

    switch(batteryConfig->currentMeterType) {
        case CURRENT_SENSOR_ADC:
            amperageRaw -= amperageRaw / 8;
            amperageRaw += (amperageLatestADC = adcGetChannel(ADC_CURRENT));
            amperage = currentSensorToCentiamps(amperageRaw / 8);
            break;
        case CURRENT_SENSOR_VIRTUAL:
            amperage = (int32_t)batteryConfig->currentMeterOffset;
            if(ARMING_FLAG(ARMED)) {
                throttleStatus_e throttleStatus = calculateThrottleStatus(rxConfig, deadband3d_throttle);
                if (throttleStatus == THROTTLE_LOW && feature(FEATURE_MOTOR_STOP))
                    throttleOffset = 0;
                throttleFactor = throttleOffset + (throttleOffset * throttleOffset / 50);
                amperage += throttleFactor * (int32_t)batteryConfig->currentMeterScale  / 1000;
            }
            break;
        case CURRENT_SENSOR_NONE:
            amperage = 0;
            break;
    }

    mAhdrawnRaw += (amperage * lastUpdateAt) / 1000;
    mAhDrawn = mAhdrawnRaw / (3600 * 100);
}

uint8_t calculateBatteryPercentage(void)
{
    return (((uint32_t)vbat - (batteryConfig->vbatmincellvoltage * batteryCellCount)) * 100) / ((batteryConfig->vbatmaxcellvoltage - batteryConfig->vbatmincellvoltage) * batteryCellCount);
}

uint8_t calculateBatteryCapacityRemainingPercentage(void)
{
    uint16_t batteryCapacity = batteryConfig->batteryCapacity;

    return constrain((batteryCapacity - constrain(mAhDrawn, 0, 0xFFFF)) * 100.0f / batteryCapacity , 0, 100);
}


#ifdef VBAT_SCALING
#include "common/axis.h"
#include "flight/pid.h"

float vbat_rpy_scale = 1.0f;
float vbat_th_scale = 1.0f;

void batteryScaleThrottleAndPIDs(uint16_t throttle_zero)
{
  // scale to have constant rpy gain through battery sag
  if (feature(FEATURE_VBAT))
  {
    vbat_rpy_scale = constrainf(batteryWarningVoltage / vbatf, 0.80f, 1.0f);
    vbat_th_scale = constrainf(batteryMaxVoltage / vbatf, 1.0f, 1.24f);
    //debug[0] = batteryMaxVoltage;
    //debug[1] = vbatf * 100;
    //debug[2] = (vbat_rpy_scale * 1000) - 1000;
    //debug[3] = (vbat_th_scale * 1000) - 1000;
    axisPID[PITCH] = axisPID[PITCH] * vbat_rpy_scale;
    axisPID[ROLL] = axisPID[ROLL] * vbat_rpy_scale;
    axisPID[YAW] = axisPID[YAW] * vbat_rpy_scale;

    rcCommand[THROTTLE] = throttle_zero + (vbat_th_scale * (rcCommand[THROTTLE] - throttle_zero));
  }
}
#endif