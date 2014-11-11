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
    #include "flight/flight.h"

    #include "sensors/sensors.h"
    #include "drivers/accgyro.h"
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


TEST(FlightImuTest, Placeholder)
{
    // TODO test things
    EXPECT_EQ(true, true);
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

int32_t applyDeadband(int32_t, int32_t) { return 0; }

uint32_t micros(void) { return 0; }
bool isBaroCalibrationComplete(void) { return true; }
void performBaroCalibrationCycle(void) {}
int32_t baroCalculateAltitude(void) { return 0; }
int constrain(int amt, int low, int high)
{
    UNUSED(amt);
    UNUSED(low);
    UNUSED(high);
    return 0;
}

}
