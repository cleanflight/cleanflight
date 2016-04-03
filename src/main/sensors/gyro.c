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
#include <math.h>

#include <platform.h>

#include "common/axis.h"
#include "common/maths.h"
#include "common/filter.h"

#include "drivers/sensor.h"
#include "drivers/accgyro.h"
#include "drivers/gyro_sync.h"
#include "sensors/sensors.h"
#include "io/beeper.h"
#include "io/statusindicator.h"
#include "sensors/boardalignment.h"

#include "sensors/gyro.h"

uint16_t calibratingG = 0;
int16_t gyroADCRaw[XYZ_AXIS_COUNT];
int32_t gyroADC[XYZ_AXIS_COUNT];
int32_t gyroZero[FD_INDEX_COUNT] = { 0, 0, 0 };

static gyroConfig_t *gyroConfig;
static biquad_t gyroFilterState[3];
static bool gyroFilterStateIsSet;
static float gyroLpfCutFreq;
int axis;

gyro_t gyro;                      // gyro access functions
sensor_align_e gyroAlign = 0;

void useGyroConfig(gyroConfig_t *gyroConfigToUse, float gyro_lpf_hz)
{
    gyroConfig = gyroConfigToUse;
    gyroLpfCutFreq = gyro_lpf_hz;
}

void initGyroFilterCoefficients(void) {
    if (gyroLpfCutFreq) {
        // Initialisation needs to happen once sampling rate is known
        for (axis = 0; axis < 3; axis++) {
            BiQuadNewLpf(gyroLpfCutFreq, &gyroFilterState[axis], targetLooptime);
        }

        gyroFilterStateIsSet = true;
    }
}

void gyroSetCalibrationCycles(uint16_t calibrationCyclesRequired)
{
    calibratingG = calibrationCyclesRequired;
}

bool isGyroCalibrationComplete(void)
{
    return calibratingG == 0;
}

bool isOnFinalGyroCalibrationCycle(void)
{
    return calibratingG == 1;
}

bool isOnFirstGyroCalibrationCycle(void)
{
    return calibratingG == CALIBRATING_GYRO_CYCLES;
}

static void performAcclerationCalibration(uint8_t gyroMovementCalibrationThreshold)
{
    int8_t axis;
    static int32_t g[3];
    static stdev_t var[3];

    for (axis = 0; axis < 3; axis++) {

        // Reset g[axis] at start of calibration
        if (isOnFirstGyroCalibrationCycle()) {
            g[axis] = 0;
            devClear(&var[axis]);
        }

        // Sum up CALIBRATING_GYRO_CYCLES readings
        g[axis] += gyroADC[axis];
        devPush(&var[axis], gyroADC[axis]);

        // Reset global variables to prevent other code from using un-calibrated data
        gyroADC[axis] = 0;
        gyroZero[axis] = 0;

        if (isOnFinalGyroCalibrationCycle()) {
            float dev = devStandardDeviation(&var[axis]);
            // check deviation and startover in case the model was moved
            if (gyroMovementCalibrationThreshold && dev > gyroMovementCalibrationThreshold) {
                gyroSetCalibrationCycles(CALIBRATING_GYRO_CYCLES);
                return;
            }
            gyroZero[axis] = (g[axis] + (CALIBRATING_GYRO_CYCLES / 2)) / CALIBRATING_GYRO_CYCLES;
        }
    }

    if (isOnFinalGyroCalibrationCycle()) {
        beeper(BEEPER_GYRO_CALIBRATED);
    }
    calibratingG--;

}

static void applyGyroZero(void)
{
    int8_t axis;
    for (axis = 0; axis < 3; axis++) {
        gyroADC[axis] -= gyroZero[axis];
    }
}

void gyroUpdate(void)
{
    // range: +/- 8192; +/- 2000 deg/sec
    if (!gyro.read(gyroADCRaw)) {
        return;
    }

    // Prepare a copy of int32_t gyroADC for mangling to prevent overflow
    for (axis = 0; axis < XYZ_AXIS_COUNT; axis++) {
        gyroADC[axis] = gyroADCRaw[axis];
    }

    alignSensors(gyroADC, gyroADC, gyroAlign);

    if (gyroLpfCutFreq) {
        if (!gyroFilterStateIsSet) {
            initGyroFilterCoefficients();
        }

        if (gyroFilterStateIsSet) {
            for (axis = 0; axis < XYZ_AXIS_COUNT; axis++) {
                gyroADC[axis] = lrintf(applyBiQuadFilter((float) gyroADC[axis], &gyroFilterState[axis]));
            }
        }
    }

    if (!isGyroCalibrationComplete()) {
        performAcclerationCalibration(gyroConfig->gyroMovementCalibrationThreshold);
    }

    applyGyroZero();
}
