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
#include <string.h>

#include <math.h>

#include "common/axis.h"
#include "common/maths.h"

#include "config/config.h"
#include "config/runtime_config.h"

#include "flight/flight.h"

#include "drivers/accgyro.h"

#include "sensors/sensors.h"
#include "sensors/gyro.h"
#include "sensors/acceleration.h"

#include "io/gps.h"
#include "mw.h"

#include "rx/rx.h"
#include "io/rc_controls.h"


int16_t rcCommand[4];           // interval [1000;2000] for THROTTLE and [-500;+500] for ROLL/PITCH/YAW

bool areSticksInApModePosition(uint16_t ap_mode)
{
    return abs(rcCommand[ROLL]) < ap_mode && abs(rcCommand[PITCH]) < ap_mode;
}

throttleStatus_e calculateThrottleStatus(rxConfig_t *rxConfig, uint16_t deadband3d_throttle)
{
    if (feature(FEATURE_3D) && (rcData[THROTTLE] > (rxConfig->midrc - deadband3d_throttle) && rcData[THROTTLE] < (rxConfig->midrc + deadband3d_throttle)))
        return THROTTLE_LOW;
    else if (!feature(FEATURE_3D) && (rcData[THROTTLE] < rxConfig->mincheck))
        return THROTTLE_LOW;

    return THROTTLE_HIGH;
}

void processRcStickPositions(rxConfig_t *rxConfig, throttleStatus_e throttleStatus, uint32_t *activate, bool retarded_arm)
{
    static uint8_t rcDelayCommand;      // this indicates the number of time (multiple of RC measurement at 50Hz) the sticks must be maintained to run or switch off motors
    static uint8_t rcSticks;            // this hold sticks position for command combos
    uint8_t stTmp = 0;
    int i;

    // ------------------ STICKS COMMAND HANDLER --------------------
    // checking sticks positions
    for (i = 0; i < 4; i++) {
        stTmp >>= 2;
        if (rcData[i] > rxConfig->mincheck)
            stTmp |= 0x80;  // check for MIN
        if (rcData[i] < rxConfig->maxcheck)
            stTmp |= 0x40;  // check for MAX
    }
    if (stTmp == rcSticks) {
        if (rcDelayCommand < 250)
            rcDelayCommand++;
    } else
        rcDelayCommand = 0;
    rcSticks = stTmp;

    // perform actions
    if (throttleStatus == THROTTLE_LOW) {
        if (activate[BOXARM] > 0) { // Arming via ARM BOX
            if (rcOptions[BOXARM] && f.OK_TO_ARM)
                mwArm();
        }
    }

    if (activate[BOXARM] > 0) { // Disarming via ARM BOX
        if (!rcOptions[BOXARM] && f.ARMED) {
            mwDisarm();
        }
    }

    if (rcDelayCommand != 20) {
        return;
    }

    if (f.ARMED) {      // actions during armed
        // Disarm on throttle down + yaw
        if (activate[BOXARM] == 0 && (rcSticks == THR_LO + YAW_LO + PIT_CE + ROL_CE))
            mwDisarm();
        // Disarm on roll (only when retarded_arm is enabled)
        if (retarded_arm && activate[BOXARM] == 0 && (rcSticks == THR_LO + YAW_CE + PIT_CE + ROL_LO))
            mwDisarm();

        return;
    }

    // actions during not armed
    i = 0;

    if (rcSticks == THR_LO + YAW_LO + PIT_LO + ROL_CE) {
        // GYRO calibration
        gyroSetCalibrationCycles(CALIBRATING_GYRO_CYCLES);

#ifdef GPS
        if (feature(FEATURE_GPS)) {
            GPS_reset_home_position();
        }
#endif

#ifdef BARO
        if (sensors(SENSOR_BARO))
            baroSetCalibrationCycles(10); // calibrate baro to new ground level (10 * 25 ms = ~250 ms non blocking)
#endif

        if (!sensors(SENSOR_MAG))
            heading = 0; // reset heading to zero after gyro calibration

        return;
    }

    if (feature(FEATURE_INFLIGHT_ACC_CAL) && (rcSticks == THR_LO + YAW_LO + PIT_HI + ROL_HI)) {
        // Inflight ACC Calibration
        handleInflightCalibrationStickPosition();
        return;
    }

    // Multiple configuration profiles
    if (rcSticks == THR_LO + YAW_LO + PIT_CE + ROL_LO)          // ROLL left  -> Profile 1
        i = 1;
    else if (rcSticks == THR_LO + YAW_LO + PIT_HI + ROL_CE)     // PITCH up   -> Profile 2
        i = 2;
    else if (rcSticks == THR_LO + YAW_LO + PIT_CE + ROL_HI)     // ROLL right -> Profile 3
        i = 3;
    if (i) {
        changeProfile(i - 1);
        return;
    }

    if (activate[BOXARM] == 0 && (rcSticks == THR_LO + YAW_HI + PIT_CE + ROL_CE)) {
        // Arm via YAW
        mwArm();
        return;
    }

    if (retarded_arm && activate[BOXARM] == 0 && (rcSticks == THR_LO + YAW_CE + PIT_CE + ROL_HI)) {
        // Arm via ROLL
        mwArm();
        return;
    }

    if (rcSticks == THR_HI + YAW_LO + PIT_LO + ROL_CE) {
        // Calibrating Acc
        accSetCalibrationCycles(CALIBRATING_ACC_CYCLES);
        return;
    }


    if (rcSticks == THR_HI + YAW_HI + PIT_LO + ROL_CE) {
        // Calibrating Mag
        f.CALIBRATE_MAG = 1;
        return;
    }


    // Accelerometer Trim

    rollAndPitchTrims_t accelerometerTrimsDelta;
    memset(&accelerometerTrimsDelta, 0, sizeof(accelerometerTrimsDelta));

    bool shouldApplyRollAndPitchTrimDelta = false;
    if (rcSticks == THR_HI + YAW_CE + PIT_HI + ROL_CE) {
        accelerometerTrimsDelta.values.pitch = 2;
        shouldApplyRollAndPitchTrimDelta = true;
    } else if (rcSticks == THR_HI + YAW_CE + PIT_LO + ROL_CE) {
        accelerometerTrimsDelta.values.pitch = -2;
        shouldApplyRollAndPitchTrimDelta = true;
    } else if (rcSticks == THR_HI + YAW_CE + PIT_CE + ROL_HI) {
        accelerometerTrimsDelta.values.roll = 2;
        shouldApplyRollAndPitchTrimDelta = true;
    } else if (rcSticks == THR_HI + YAW_CE + PIT_CE + ROL_LO) {
        accelerometerTrimsDelta.values.roll = -2;
        shouldApplyRollAndPitchTrimDelta = true;
    }
    if (shouldApplyRollAndPitchTrimDelta) {
        applyAndSaveAccelerometerTrimsDelta(&accelerometerTrimsDelta);
        rcDelayCommand = 0; // allow autorepetition
        return;
    }
}
