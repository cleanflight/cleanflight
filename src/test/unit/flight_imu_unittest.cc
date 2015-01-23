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
    #include "common/axis.h"
    #include "common/maths.h"
    #include "flight/flight.h"

    #include "sensors/sensors.h"
    #include "drivers/sensor.h"
    #include "drivers/accgyro.h"
    #include "drivers/compass.h"
    #include "sensors/gyro.h"
    #include "sensors/compass.h"
    #include "sensors/acceleration.h"
    #include "sensors/barometer.h"

    #include "config/runtime_config.h"

    #include "flight/mixer.h"
    #include "flight/imu.h"
}

#include "unittest_macros.h"
#include "gtest/gtest.h"

#define DOWNWARDS_THRUST true
#define UPWARDS_THRUST false

void testConstrain(void)
{
    // Within bounds.
    EXPECT_EQ(constrain(1, 0, 2), 1);

    // Equal to bottom bound.
    EXPECT_EQ(constrain(1, 1, 2), 1);
    // Equal to top bound.
    EXPECT_EQ(constrain(1, 0, 1), 1);

    // Equal to both bottom and top bound.
    EXPECT_EQ(constrain(1, 1, 1), 1);

    // Above top bound.
    EXPECT_EQ(constrain(2, 0, 1), 1);
    // Below bottom bound.
    EXPECT_EQ(constrain(0, 1, 2), 1);

    // Above bouth bounds.
    EXPECT_EQ(constrain(2, 0, 1), 1);
    // Below bouth bounds.
    EXPECT_EQ(constrain(0, 1, 2), 1);
}

void testDegreesToRadians(void)
{
    EXPECT_EQ(degreesToRadians(0), 0.0f);
    EXPECT_EQ(degreesToRadians(90), 0.5f * M_PIf);
    EXPECT_EQ(degreesToRadians(180), M_PIf);
    EXPECT_EQ(degreesToRadians(-180), - M_PIf);
}

void testConstrainf(void)
{
    // Within bounds.
    EXPECT_EQ(constrainf(1.0f, 0.0f, 2.0f), 1.0f);

    // Equal to bottom bound.
    EXPECT_EQ(constrainf(1.0f, 1.0f, 2.0f), 1.0f);
    // Equal to top bound.
    EXPECT_EQ(constrainf(1.0f, 0.0f, 1.0f), 1.0f);

    // Equal to both bottom and top bound.
    EXPECT_EQ(constrainf(1.0f, 1.0f, 1.0f), 1.0f);

    // Above top bound.
    EXPECT_EQ(constrainf(2.0f, 0.0f, 1.0f), 1.0f);
    // Below bottom bound.
    EXPECT_EQ(constrainf(0, 1.0f, 2.0f), 1.0f);

    // Above bouth bounds.
    EXPECT_EQ(constrainf(2.0f, 0.0f, 1.0f), 1.0f);
    // Below bouth bounds.
    EXPECT_EQ(constrainf(0, 1.0f, 2.0f), 1.0f);
}

void testApplyDeadband(void)
{
    EXPECT_EQ(applyDeadband(0, 0), 0);
    EXPECT_EQ(applyDeadband(1, 0), 1);
    EXPECT_EQ(applyDeadband(-1, 0), -1);

    EXPECT_EQ(applyDeadband(0, 10), 0);
    EXPECT_EQ(applyDeadband(1, 10), 0);
    EXPECT_EQ(applyDeadband(10, 10), 0);

    EXPECT_EQ(applyDeadband(11, 10), 1);
    EXPECT_EQ(applyDeadband(-11, 10), -1);
}

void expectVectorsAreEqual(struct fp_vector *a, struct fp_vector *b)
{
    EXPECT_EQ(a->X, b->X);
    EXPECT_EQ(a->Y, b->Y);
    EXPECT_EQ(a->Z, b->Z);
}

void testRotateVNoAngle()
{
    fp_vector vector = {1.0f, 0.0f, 0.0f};
    fp_angles_t euler_angles = {.raw={0.0f, 0.0f, 0.0f}};

    rotateV(&vector, &euler_angles);
    fp_vector expected_result = {1.0f, 0.0f, 0.0f};

    expectVectorsAreEqual(&vector, &expected_result);
}

void testRotateVAroundAxis()
{
    // Each time we rotate a vector <1, 0, 0> around an axis.
    // Rotating 90 degrees around the X axis should do nothing.
    fp_vector vector = {1.0f, 0.0f, 0.0f};
    fp_angles_t euler_angles = {.raw={90.0f, 0.0f, 0.0f}};

    rotateV(&vector, &euler_angles);
    fp_vector expected_result = {1.0f, 0.0f, 0.0f};

    expectVectorsAreEqual(&vector, &expected_result);
}

void testRotateV()
{
    testRotateVNoAngle();
    testRotateVAroundAxis();
}

void testMaths(void)
{
    testConstrain();
    testConstrainf();
    testApplyDeadband();
    testDegreesToRadians();
    testRotateV();
}

TEST(FlightImuTest, Placeholder)
{
    // TODO test things
    EXPECT_EQ(true, true);
    testMaths();
}

// STUBS

extern "C" {
uint32_t rcModeActivationMask;
int16_t rcCommand[4];

uint16_t acc_1G;
int16_t heading;
gyro_t gyro;
int16_t magADC[XYZ_AXIS_COUNT];
int32_t BaroAlt;
int16_t debug[4];

uint8_t stateFlags;
uint16_t flightModeFlags;
uint8_t armingFlags;

int32_t sonarAlt;


void gyroGetADC(void) {};
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
bool isBaroCalibrationComplete(void) { return true; }
void performBaroCalibrationCycle(void) {}
int32_t baroCalculateAltitude(void) { return 0; }
}
