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
#include "string.h"

#include <platform.h>
#include "build/build_config.h"

#include "common/maths.h"
#include "common/utils.h"
#include "common/filter.h"

#include "drivers/adc.h"
#include "drivers/system.h"

#include "config/parameter_group.h"
#include "config/parameter_group_ids.h"
#include "config/config_reset.h"

#include "sensors/current.h"
#include "sensors/esc_sensor.h"

const uint8_t currentMeterIds[] = {
    CURRENT_METER_ID_BATTERY_1,
#ifdef USE_VIRTUAL_CURRENT_METER
    CURRENT_METER_ID_VIRTUAL_1,
#endif
#ifdef USE_ESC_SENSOR
    CURRENT_METER_ID_ESC_COMBINED_1,
    CURRENT_METER_ID_ESC_MOTOR_1,
    CURRENT_METER_ID_ESC_MOTOR_2,
    CURRENT_METER_ID_ESC_MOTOR_3,
    CURRENT_METER_ID_ESC_MOTOR_4,
    CURRENT_METER_ID_ESC_MOTOR_5,
    CURRENT_METER_ID_ESC_MOTOR_6,
    CURRENT_METER_ID_ESC_MOTOR_7,
    CURRENT_METER_ID_ESC_MOTOR_8,
    CURRENT_METER_ID_ESC_MOTOR_9,
    CURRENT_METER_ID_ESC_MOTOR_10,
    CURRENT_METER_ID_ESC_MOTOR_11,
    CURRENT_METER_ID_ESC_MOTOR_12,
#endif
#ifdef USE_MSP_CURRENT_METER
    CURRENT_METER_ID_MSP_1,
#endif
};

const uint8_t supportedCurrentMeterCount = ARRAYLEN(currentMeterIds);

//
// ADC/Virtual/ESC/MSP shared
//

void currentMeterReset(currentMeter_t *meter)
{
    meter->amperage = 0;
    meter->amperageLatest = 0;
    meter->mAhDrawn = 0;
}

//
// ADC/Virtual shared
//

#define ADCVREF 3300   // in mV

#define IBAT_LPF_FREQ  0.4f
static biquadFilter_t adciBatFilter;

#ifndef CURRENT_METER_SCALE_DEFAULT
#define CURRENT_METER_SCALE_DEFAULT 400 // for Allegro ACS758LCB-100U (40mV/A)
#endif

#ifndef CURRENT_METER_OFFSET_DEFAULT
#define CURRENT_METER_OFFSET_DEFAULT 0
#endif

PG_REGISTER_WITH_RESET_TEMPLATE(currentSensorADCConfig_t, currentSensorADCConfig, PG_CURRENT_SENSOR_ADC_CONFIG, 0);

PG_RESET_TEMPLATE(currentSensorADCConfig_t, currentSensorADCConfig,
    .scale = CURRENT_METER_SCALE_DEFAULT,
    .offset = CURRENT_METER_OFFSET_DEFAULT,
);

#ifdef USE_VIRTUAL_CURRENT_METER
PG_REGISTER(currentSensorVirtualConfig_t, currentSensorVirtualConfig, PG_CURRENT_SENSOR_VIRTUAL_CONFIG, 0);
#endif

static int32_t currentMeterADCToCentiamps(const uint16_t src)
{

    const currentSensorADCConfig_t *config = currentSensorADCConfig();

    int32_t millivolts = ((uint32_t)src * ADCVREF) / 4096;
    millivolts -= config->offset;

    return (millivolts * 1000) / (int32_t)config->scale; // current in 0.01A steps
}

static void updateCurrentmAhDrawnState(currentMeterMAhDrawnState_t *state, int32_t amperageLatest, int32_t lastUpdateAt)
{
    state->mAhDrawnF = state->mAhDrawnF + (amperageLatest * lastUpdateAt / (100.0f * 1000 * 3600));
    state->mAhDrawn = state->mAhDrawnF;
}

//
// ADC
//

currentMeterADCState_t currentMeterADCState;

void currentMeterADCInit(void)
{
    memset(&currentMeterADCState, 0, sizeof(currentMeterADCState_t));
    biquadFilterInitLPF(&adciBatFilter, IBAT_LPF_FREQ, 50000); //50HZ Update
}

void currentMeterADCRefresh(int32_t lastUpdateAt)
{
    const uint16_t iBatSample = adcGetChannel(ADC_CURRENT);
    currentMeterADCState.amperageLatest = currentMeterADCToCentiamps(iBatSample);
    currentMeterADCState.amperage = currentMeterADCToCentiamps(biquadFilterApply(&adciBatFilter, iBatSample));

    updateCurrentmAhDrawnState(&currentMeterADCState.mahDrawnState, currentMeterADCState.amperageLatest, lastUpdateAt);
}

void currentMeterADCRead(currentMeter_t *meter)
{
    meter->amperageLatest = currentMeterADCState.amperageLatest;
    meter->amperage = currentMeterADCState.amperage;
    meter->mAhDrawn = currentMeterADCState.mahDrawnState.mAhDrawn;
}

//
// VIRTUAL
//

#ifdef USE_VIRTUAL_CURRENT_METER
currentSensorVirtualState_t currentMeterVirtualState;

void currentMeterVirtualInit(void)
{
    memset(&currentMeterVirtualState, 0, sizeof(currentSensorVirtualState_t));
}

void currentMeterVirtualRefresh(int32_t lastUpdateAt, bool armed, bool throttleLowAndMotorStop, int32_t throttleOffset)
{
    currentMeterVirtualState.amperage = (int32_t)currentSensorVirtualConfig()->offset;
    if (armed) {
        if (throttleLowAndMotorStop) {
            throttleOffset = 0;
        }

        int throttleFactor = throttleOffset + (throttleOffset * throttleOffset / 50); // FIXME magic number 50,  50hz?
        currentMeterVirtualState.amperage += throttleFactor * (int32_t)currentSensorVirtualConfig()->scale / 1000;
    }
    updateCurrentmAhDrawnState(&currentMeterVirtualState.mahDrawnState, currentMeterVirtualState.amperage, lastUpdateAt);
}

void currentMeterVirtualRead(currentMeter_t *meter)
{
    meter->amperageLatest = currentMeterVirtualState.amperage;
    meter->amperage = currentMeterVirtualState.amperage;
    meter->mAhDrawn = currentMeterVirtualState.mahDrawnState.mAhDrawn;
}
#endif

//
// ESC
//

#ifdef USE_ESC_SENSOR
currentMeterESCState_t currentMeterESCState;

void currentMeterESCInit(void)
{
    memset(&currentMeterESCState, 0, sizeof(currentMeterESCState_t));
}

void currentMeterESCRefresh(int32_t lastUpdateAt)
{
    UNUSED(lastUpdateAt);

    escSensorData_t *escData = getEscSensorData(ESC_SENSOR_COMBINED);
    if (escData->dataAge <= ESC_BATTERY_AGE_MAX) {
        currentMeterESCState.amperage = escData->current;
        currentMeterESCState.mAhDrawn = escData->consumption;
    } else {
        currentMeterESCState.amperage = 0;
        currentMeterESCState.mAhDrawn = 0;
    }
}

void currentMeterESCReadCombined(currentMeter_t *meter)
{
    meter->amperageLatest = currentMeterESCState.amperage;
    meter->amperage = currentMeterESCState.amperage;
    meter->mAhDrawn = currentMeterESCState.mAhDrawn;
    currentMeterReset(meter);
}

void currentMeterESCReadMotor(uint8_t motorNumber, currentMeter_t *meter)
{
    escSensorData_t *escData = getEscSensorData(motorNumber);
    if (escData && escData->dataAge <= ESC_BATTERY_AGE_MAX) {
        meter->amperage = escData->current;
        meter->amperageLatest = escData->current;
        meter->mAhDrawn = escData->consumption;
    } else {
        currentMeterReset(meter);
    }
}
#endif


#ifdef USE_MSP_CURRENT_METER
#include "common/streambuf.h"
#include "msp/msp_protocol.h"
#include "msp/msp_serial.h"
#include "msp/msp_stream.h"

currentMeterMSPState_t currentMeterMSPState;

#ifdef USE_MSP_STREAM
void currentMeterMSPSendStreamRequest()
{
#if 0
    static const mspStreamEntry_t streamEntries[] = {
        {
            .flags = MSP_STREAM_ENTRY_VALUE,
            .id = MSP_STREAM_VALUE_ID_AMPERAGE_BATTERY,
            .hz = 10
        }
    };
#else
    static const mspStreamEntry_t streamEntries[] = {
        {
            .flags = MSP_STREAM_ENTRY_COMMAND,
            .id = MSP_ANALOG,
            .hz = 10
        }
    };
#endif

    uint8_t payload[32]; // needs to be large enough to hold the stream entries, flags, etc.
    sbuf_t buf = { .ptr = payload, .end = ARRAYEND(payload), };
    sbufWriteU8(&buf, MSP_STREAM_FLAG_BEGIN);
    sbufWriteU8(&buf, ARRAYLEN(streamEntries));
    sbufWriteData(&buf, &streamEntries, sizeof(streamEntries));

    mspSerialPush(MSP_SET_STREAM, payload, ARRAYLEN(payload) - sbufBytesRemaining(&buf), MSP_DIRECTION_REQUEST);
}
#endif

void currentMeterMSPSet(uint16_t amperage, uint16_t mAhDrawn)
{
    currentMeterMSPState.amperage = amperage;
    currentMeterMSPState.mAhDrawn = mAhDrawn;
}

void currentMeterMSPInit(void)
{
    memset(&currentMeterMSPState, 0, sizeof(currentMeterMSPState_t));

#ifdef USE_MSP_STREAM
    currentMeterMSPSendStreamRequest();
#endif
}

void currentMeterMSPRefresh(timeUs_t currentTimeUs)
{
#ifdef USE_MSP_STREAM
    // periodically re-request the stream
    // alternatively we could check to see if we haven't received the stream for a while and then request it.
    static timeUs_t streamRequestAt = 0;
    if (cmp32(currentTimeUs, streamRequestAt) > 0) {
        streamRequestAt = currentTimeUs + (5 * 1000 * 1000); // 5 seconds

        currentMeterMSPSendStreamRequest();
    }
#else
    // periodically request MSP_ANALOG
    // alternatively we could check to see if we haven't received the stream for a while and then request it.
    static timeUs_t streamRequestAt = 0;
    if (cmp32(currentTimeUs, streamRequestAt) > 0) {
        streamRequestAt = currentTimeUs + ((1000 * 1000) / 10); // 10hz

        mspSerialPush(MSP_ANALOG, NULL, 0, MSP_DIRECTION_REQUEST);
    }
#endif
}

void currentMeterMSPRead(currentMeter_t *meter)
{
    meter->amperageLatest = currentMeterMSPState.amperage;
    meter->amperage = currentMeterMSPState.amperage;
    meter->mAhDrawn = currentMeterMSPState.mAhDrawn;
}
#endif

//
// API for current meters using IDs
//
// This API is used by MSP, for configuration/status.
//

void currentMeterRead(currentMeterId_e id, currentMeter_t *meter)
{
    if (id == CURRENT_METER_ID_BATTERY_1) {
        currentMeterADCRead(meter);
    }
#ifdef USE_VIRTUAL_CURRENT_METER
    else if (id == CURRENT_METER_ID_VIRTUAL_1) {
        currentMeterVirtualRead(meter);
    }
#endif
#ifdef USE_MSP_CURRENT_METER
    else if (id == CURRENT_METER_ID_MSP_1) {
        currentMeterMSPRead(meter);
    }
#endif
#ifdef USE_ESC_SENSOR
    else if (id == CURRENT_METER_ID_ESC_COMBINED_1) {
        currentMeterESCReadCombined(meter);
    }
    else if (id >= CURRENT_METER_ID_ESC_MOTOR_1 && id <= CURRENT_METER_ID_ESC_MOTOR_20 ) {
        int motor = id - CURRENT_METER_ID_ESC_MOTOR_1;
        currentMeterESCReadMotor(motor, meter);
    }
#endif
    else {
        currentMeterReset(meter);
    }
}
