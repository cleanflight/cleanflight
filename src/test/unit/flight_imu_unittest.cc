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

#include <stdint.h>
#include <stdbool.h>

#include <limits.h>

#define BARO

extern "C" {
    #include "debug.h"

    #include "common/axis.h"
    #include "common/maths.h"

    #include "sensors/sensors.h"
    #include "drivers/sensor.h"
    #include "drivers/accgyro.h"
    #include "drivers/compass.h"
    #include "sensors/gyro.h"
    #include "sensors/compass.h"
    #include "sensors/acceleration.h"
    #include "sensors/barometer.h"

    #include "config/runtime_config.h"

    #include "rx/rx.h"

    #include "flight/mixer.h"
    #include "flight/pid.h"
    #include "flight/imu.h"
}

#include "unittest_macros.h"
#include "gtest/gtest.h"

extern float q0, q1, q2, q3;
extern "C" { 
void imuComputeRotationMatrix(void);
void imuUpdateEulerAngles(void);
}

TEST(FlightImuTest, TestEulerAngleCalculation)
{
    q0 = 1; q1 = 0; q2 = 0; q3 = 0;
    imuComputeRotationMatrix();
    imuUpdateEulerAngles();
    EXPECT_FLOAT_EQ(attitude.values.roll, 0);
    EXPECT_FLOAT_EQ(attitude.values.pitch, 0);
    EXPECT_FLOAT_EQ(attitude.values.yaw, 0);

    q0 = -1; q1 = 0; q2 = 0; q3 = 0;
    imuComputeRotationMatrix();
    imuUpdateEulerAngles();
    EXPECT_FLOAT_EQ(attitude.values.roll, 0);
    EXPECT_FLOAT_EQ(attitude.values.pitch, 0);
    EXPECT_FLOAT_EQ(attitude.values.yaw, 0);

    q0 = 0.7071068; q1 = 0; q2 = 0.7071068; q3 = 0;
    imuComputeRotationMatrix();
    imuUpdateEulerAngles();
    EXPECT_FLOAT_EQ(attitude.values.roll, 1800);
    EXPECT_FLOAT_EQ(attitude.values.pitch, 0);
    EXPECT_FLOAT_EQ(attitude.values.yaw, 1800);

    q0 = -0.7071068; q1 = 0; q2 = -0.7071068; q3 = 0;
    imuComputeRotationMatrix();
    imuUpdateEulerAngles();
    EXPECT_FLOAT_EQ(attitude.values.roll, -1800);
    EXPECT_FLOAT_EQ(attitude.values.pitch, 0);
    EXPECT_FLOAT_EQ(attitude.values.yaw, 1800);

    q0 = 0; q1 = 0; q2 = 0; q3 = 1;
    imuComputeRotationMatrix();
    imuUpdateEulerAngles();
    EXPECT_FLOAT_EQ(attitude.values.roll, 0);
    EXPECT_FLOAT_EQ(attitude.values.pitch, 0);
    EXPECT_FLOAT_EQ(attitude.values.yaw, 1800);

    q0 = 0; q1 = 0; q2 = 0; q3 = -1;
    imuComputeRotationMatrix();
    imuUpdateEulerAngles();
    EXPECT_FLOAT_EQ(attitude.values.roll, 0);
    EXPECT_FLOAT_EQ(attitude.values.pitch, 0);
    EXPECT_FLOAT_EQ(attitude.values.yaw, 1800);
}

// STUBS

extern "C" {
uint32_t rcModeActivationMask;
int16_t rcCommand[4];
int16_t rcData[MAX_SUPPORTED_RC_CHANNEL_COUNT];

uint16_t acc_1G;
int16_t heading;
gyro_t gyro;
int16_t magADC[XYZ_AXIS_COUNT];
int32_t BaroAlt;
int16_t debug[DEBUG16_VALUE_COUNT];

uint8_t stateFlags;
uint16_t flightModeFlags;
uint8_t armingFlags;

int32_t sonarAlt;
int16_t sonarCfAltCm;
int16_t sonarMaxAltWithTiltCm;
int16_t accADC[XYZ_AXIS_COUNT];
int16_t gyroADC[XYZ_AXIS_COUNT];

int16_t GPS_speed;
int16_t GPS_ground_course;
int16_t GPS_numSat;
int16_t cycleTime = 2000;


uint16_t enableFlightMode(flightModeFlags_e mask)
{
    return flightModeFlags |= (mask);
}

uint16_t disableFlightMode(flightModeFlags_e mask)
{
    return flightModeFlags &= ~(mask);
}

void gyroUpdate(void) {};
bool sensors(uint32_t mask)
{
    UNUSED(mask);
    return false;
};
void updateAccelerationReadings(rollAndPitchTrims_t *rollAndPitchTrims)
{
    UNUSED(rollAndPitchTrims);
}

uint32_t micros(void) { return 0; }
uint32_t millis(void) { return 0; }
bool isBaroCalibrationComplete(void) { return true; }
void performBaroCalibrationCycle(void) {}
int32_t baroCalculateAltitude(void) { return 0; }
}
