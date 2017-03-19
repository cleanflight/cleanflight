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

#include "platform.h"

#include "build/debug.h"

#include "common/filter.h"
#include "common/maths.h"
#include "common/utils.h"

#include "config/feature.h"
#include "config/parameter_group.h"
#include "config/parameter_group_ids.h"

#include "drivers/adc.h"
#include "drivers/system.h"

#include "fc/runtime_config.h"
#include "fc/config.h"
#include "fc/rc_controls.h"

#include "io/beeper.h"

#include "sensors/battery.h"

/**
 * terminology: meter vs sensors
 *
 * voltage and current sensors are used to collect data.
 * - e.g. voltage at an MCU ADC input pin, value from an ESC sensor.
 *   sensors require very specific configuration, such as resistor values.
 * voltage and current meters are used to process and expose data collected from sensors to the rest of the system.
 * - e.g. a meter exposes normalized, and often filtered, values from a sensor.
 *   meters require different or little configuration.
 *   meters also have different precision concerns, and may use different units to the sensors.
 *
 */

static void batteryUpdateConsumptionState(void); // temporary forward reference

#define VBAT_STABLE_MAX_DELTA 2

// Battery monitoring stuff
uint8_t batteryCellCount; // Note: this can be 0 when no battery is detected or when the battery voltage sensor is missing or disabled.
uint16_t batteryWarningVoltage;
uint16_t batteryCriticalVoltage;
//
static currentMeter_t currentMeter;
static voltageMeter_t voltageMeter;

static batteryState_e batteryState;
static batteryState_e voltageState;
static batteryState_e consumptionState;

#ifdef BOARD_HAS_CURRENT_SENSOR
#define DEFAULT_CURRENT_METER_SOURCE CURRENT_METER_ADC
#else
#define DEFAULT_CURRENT_METER_SOURCE CURRENT_METER_VIRTUAL
#endif

#ifdef BOARD_HAS_VOLTAGE_DIVIDER
#define DEFAULT_VOLTAGE_METER_SOURCE VOLTAGE_METER_ADC
#else
#define DEFAULT_VOLTAGE_METER_SOURCE VOLTAGE_METER_NONE
#endif

PG_REGISTER_WITH_RESET_TEMPLATE(batteryConfig_t, batteryConfig, PG_BATTERY_CONFIG, 1);

PG_RESET_TEMPLATE(batteryConfig_t, batteryConfig,
    // voltage
    .vbatmaxcellvoltage = 43,
    .vbatmincellvoltage = 33,
    .vbatwarningcellvoltage = 35,
    .batteryNotPresentLevel = 55, // VBAT below 5.5 V will be ignored
    .voltageMeterSource = DEFAULT_VOLTAGE_METER_SOURCE,

    // current
    .batteryCapacity = 0,
    .currentMeterSource = DEFAULT_VOLTAGE_METER_SOURCE,

    // warnings / alerts
    .useVBatAlerts = true,
    .useConsumptionAlerts = false,
    .consumptionWarningPercentage = 10,
    .vbathysteresis = 1
);

void batteryUpdateVoltage(timeUs_t currentTimeUs)
{
    UNUSED(currentTimeUs);

    switch(batteryConfig()->voltageMeterSource) {
#ifdef USE_ESC_SENSOR
        case VOLTAGE_METER_ESC:
            if (feature(FEATURE_ESC_SENSOR)) {
                voltageMeterESCRefresh();
                voltageMeterESCReadCombined(&voltageMeter);
            }
            break;
#endif
        case VOLTAGE_METER_ADC:
            voltageMeterADCRefresh();
            voltageMeterADCRead(ADC_BATTERY, &voltageMeter);
            break;

        default:
        case VOLTAGE_METER_NONE:
            voltageMeterReset(&voltageMeter);
            break;
    }

    if (debugMode == DEBUG_BATTERY) {
        debug[0] = voltageMeter.unfiltered;
        debug[1] = voltageMeter.filtered;
    }
}

static void updateBatteryBeeperAlert(void)
{
    switch(getBatteryState()) {
        case BATTERY_WARNING:
            beeper(BEEPER_BAT_LOW);

            break;
        case BATTERY_CRITICAL:
            beeper(BEEPER_BAT_CRIT_LOW);

            break;
        case BATTERY_OK:
        case BATTERY_NOT_PRESENT:
            break;
    }
}

void batteryUpdatePresence(void)
{
    static uint16_t previousVoltage = 0;

    bool isVoltageStable = (
        previousVoltage > 0
        && ABS(voltageMeter.filtered - previousVoltage) <= VBAT_STABLE_MAX_DELTA
    );

    if (
        voltageState == BATTERY_NOT_PRESENT
        && voltageMeter.filtered > batteryConfig()->batteryNotPresentLevel
        && isVoltageStable
    ) {
        /* battery has just been connected - calculate cells, warning voltages and reset state */


        unsigned cells = (voltageMeter.filtered / batteryConfig()->vbatmaxcellvoltage) + 1;
        if (cells > 8) {
            // something is wrong, we expect 8 cells maximum (and autodetection will be problematic at 6+ cells)
            cells = 8;
        }

        consumptionState = voltageState = BATTERY_OK;
        batteryCellCount = cells;
        batteryWarningVoltage = batteryCellCount * batteryConfig()->vbatwarningcellvoltage;
        batteryCriticalVoltage = batteryCellCount * batteryConfig()->vbatmincellvoltage;
    } else if (
        voltageState != BATTERY_NOT_PRESENT
        && voltageMeter.filtered <= batteryConfig()->batteryNotPresentLevel
        && isVoltageStable
    ) {
        /* battery has been disconnected - can take a while for filter cap to disharge so we use a threshold of batteryConfig()->batterynotpresentlevel */

        consumptionState = voltageState = BATTERY_NOT_PRESENT;

        batteryCellCount = 0;
        batteryWarningVoltage = 0;
        batteryCriticalVoltage = 0;
    }

    if (debugMode == DEBUG_BATTERY) {
        debug[2] = voltageState;
        debug[3] = batteryCellCount;
    }

    previousVoltage = voltageMeter.filtered; // record the current value so we can detect voltage stabilisation next the presence needs updating.
}

static void batteryUpdateVoltageState(void)
{
    // alerts are currently used by beeper, osd and other subsystems
    switch(voltageState) {
        case BATTERY_OK:
            if (voltageMeter.filtered <= (batteryWarningVoltage - batteryConfig()->vbathysteresis)) {
                voltageState = BATTERY_WARNING;
            }
            break;

        case BATTERY_WARNING:
            if (voltageMeter.filtered <= (batteryCriticalVoltage - batteryConfig()->vbathysteresis)) {
                voltageState = BATTERY_CRITICAL;
            } else if (voltageMeter.filtered > batteryWarningVoltage) {
                voltageState = BATTERY_OK;
            }
            break;

        case BATTERY_CRITICAL:
            if (voltageMeter.filtered > batteryCriticalVoltage) {
                voltageState = BATTERY_WARNING;
            }
            break;

        default:
            break;
    }
}

void batteryUpdateStates(void)
{
    batteryUpdateVoltageState();
    batteryUpdateConsumptionState();

    batteryState = MAX(voltageState, consumptionState);
}

batteryState_e getBatteryState(void)
{
    return batteryState;
}

const char * const batteryStateStrings[] = {"OK", "WARNING", "CRITICAL", "NOT PRESENT"};

const char * getBatteryStateString(void)
{
    return batteryStateStrings[getBatteryState()];
}

void batteryInit(void)
{
    //
    // presence
    //
    batteryState = BATTERY_NOT_PRESENT;
    batteryCellCount = 0;

    //
    // voltage
    //
    voltageState = BATTERY_NOT_PRESENT;
    batteryWarningVoltage = 0;
    batteryCriticalVoltage = 0;

    voltageMeterReset(&voltageMeter);
    switch(batteryConfig()->voltageMeterSource) {
        case VOLTAGE_METER_ESC:
#ifdef USE_ESC_SENSOR
            voltageMeterESCInit();
#endif
            break;

        case VOLTAGE_METER_ADC:
            voltageMeterADCInit();
            break;

        default:
            break;
    }

    //
    // current
    //
    consumptionState = BATTERY_OK;
    currentMeterReset(&currentMeter);
    switch(batteryConfig()->currentMeterSource) {
        case CURRENT_METER_ADC:
            currentMeterADCInit();
            break;

        case CURRENT_METER_VIRTUAL:
            currentMeterVirtualInit();
            break;

        case CURRENT_METER_ESC:
            currentMeterESCInit();
            break;

        default:
            break;
    }

}

static void batteryUpdateConsumptionState(void)
{
    if (batteryConfig()->useConsumptionAlerts && batteryConfig()->batteryCapacity > 0 && batteryCellCount > 0) {
        uint8_t batteryPercentageRemaining = calculateBatteryPercentageRemaining();

        if (batteryPercentageRemaining == 0) {
            consumptionState = BATTERY_CRITICAL;
        } else if (batteryPercentageRemaining <= batteryConfig()->consumptionWarningPercentage) {
            consumptionState = BATTERY_WARNING;
        } else {
            consumptionState = BATTERY_OK;
        }
    }
}

void batteryUpdateCurrentMeter(timeUs_t currentTimeUs)
{
    UNUSED(currentTimeUs);
    if (batteryCellCount == 0) {
        currentMeterReset(&currentMeter);
        return;
    }

    static uint32_t ibatLastServiced = 0;
    const int32_t lastUpdateAt = cmp32(currentTimeUs, ibatLastServiced);
    ibatLastServiced = currentTimeUs;

    switch(batteryConfig()->currentMeterSource) {
        case CURRENT_METER_ADC:
            currentMeterADCRefresh(lastUpdateAt);
            currentMeterADCRead(&currentMeter);
            break;

        case CURRENT_METER_VIRTUAL: {
            throttleStatus_e throttleStatus = calculateThrottleStatus();
            bool throttleLowAndMotorStop = (throttleStatus == THROTTLE_LOW && feature(FEATURE_MOTOR_STOP));
            int32_t throttleOffset = (int32_t)rcCommand[THROTTLE] - 1000;

            currentMeterVirtualRefresh(lastUpdateAt, ARMING_FLAG(ARMED), throttleLowAndMotorStop, throttleOffset);
            currentMeterVirtualRead(&currentMeter);
            break;
        }

        case CURRENT_METER_ESC:
#ifdef USE_ESC_SENSOR
            if (feature(FEATURE_ESC_SENSOR)) {
                currentMeterESCRefresh(lastUpdateAt);
                currentMeterESCReadCombined(&currentMeter);
            }
#endif
            break;

        default:
        case CURRENT_METER_NONE:
            currentMeterReset(&currentMeter);
            break;
    }
}

float calculateVbatPidCompensation(void) {
    float batteryScaler =  1.0f;
    if (batteryConfig()->voltageMeterSource != VOLTAGE_METER_NONE && batteryCellCount > 0) {
        // Up to 33% PID gain. Should be fine for 4,2to 3,3 difference
        batteryScaler =  constrainf((( (float)batteryConfig()->vbatmaxcellvoltage * batteryCellCount ) / (float) voltageMeter.filtered), 1.0f, 1.33f);
    }
    return batteryScaler;
}

uint8_t calculateBatteryPercentageRemaining(void)
{
    uint8_t batteryPercentage = 0;
    if (batteryCellCount > 0) {
        uint16_t batteryCapacity = batteryConfig()->batteryCapacity;

        if (batteryCapacity > 0) {
            batteryPercentage = constrain(((float)batteryCapacity - currentMeter.mAhDrawn) * 100 / batteryCapacity, 0, 100);
        } else {
            batteryPercentage = constrain((((uint32_t)voltageMeter.filtered - (batteryConfig()->vbatmincellvoltage * batteryCellCount)) * 100) / ((batteryConfig()->vbatmaxcellvoltage - batteryConfig()->vbatmincellvoltage) * batteryCellCount), 0, 100);
        }
    }

    return batteryPercentage;
}

void batteryUpdateAlarms(void)
{
    // use the state to trigger beeper alerts
    if (batteryConfig()->useVBatAlerts) {
        updateBatteryBeeperAlert();
    }
}

uint16_t getBatteryVoltage(void)
{
    return voltageMeter.filtered;
}

uint16_t getBatteryVoltageLatest(void)
{
    return voltageMeter.unfiltered;
}

uint8_t getBatteryCellCount(void)
{
    return batteryCellCount;
}


int32_t getAmperage(void) {
    return currentMeter.amperage;
}

int32_t getAmperageLatest(void)
{
    return currentMeter.amperageLatest;
}

int32_t getMAhDrawn(void)
{
    return currentMeter.mAhDrawn;
}
