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

//#define DEBUG_ALTITUDE_HOLD

#define BARO

extern "C" {
    #include "debug.h"
    #include "build_config.h"

    #include "config/config_unittest.h"

    #include "common/axis.h"
    #include "common/maths.h"

    #include "drivers/sensor.h"
    #include "drivers/accgyro.h"
    #include "drivers/sonar_hcsr04.h"

    #include "sensors/sensors.h"
    #include "sensors/acceleration.h"
    #include "sensors/barometer.h"
    #include "sensors/sonar.h"

    #include "io/escservo.h"
    #include "io/rc_controls.h"

    #include "rx/rx.h"

    #include "flight/mixer.h"
    #include "flight/pid.h"
    #include "flight/imu.h"
    #include "flight/altitudehold.h"

    #include "config/runtime_config.h"

    void calculateEstimatedAltitude(uint32_t currentTime);
    int32_t altitudeHoldGetEstimatedAltitude(void);
    void sonarInit(const sonarHardware_t *sonarHardware);
    extern int32_t hcsr04SonarPulseTravelTime;
    extern uint32_t unittest_calculateEstimatedAltitude_previousTime;
    extern float unittest_calculateEstimatedAltitude_vel;
    extern float unittest_calculateEstimatedAltitude_accAlt;
    extern float unittest_calculateEstimatedAltitude_vel_acc;
}

#include "unittest_macros.h"
#include "gtest/gtest.h"

#define DOWNWARDS_THRUST true
#define UPWARDS_THRUST false


extern "C" {
    bool isThrustFacingDownwards(attitudeEulerAngles_t * attitude);
    uint16_t calculateTiltAngle(attitudeEulerAngles_t * attitude);
}

typedef struct inclinationExpectation_s {
    attitudeEulerAngles_t attitude;
    bool expectDownwardsThrust;
} inclinationExpectation_t;

TEST(AltitudeHoldTest, IsThrustFacingDownwards)
{
    // given

    inclinationExpectation_t inclinationExpectations[] = {
            { {{    0,    0,    0 }}, DOWNWARDS_THRUST },
            { {{  799,  799,    0 }}, DOWNWARDS_THRUST },
            { {{  800,  799,    0 }}, UPWARDS_THRUST },
            { {{  799,  800,    0 }}, UPWARDS_THRUST },
            { {{  800,  800,    0 }}, UPWARDS_THRUST },
            { {{  801,  801,    0 }}, UPWARDS_THRUST },
            { {{ -799, -799,    0 }}, DOWNWARDS_THRUST },
            { {{ -800, -799,    0 }}, UPWARDS_THRUST },
            { {{ -799, -800,    0 }}, UPWARDS_THRUST },
            { {{ -800, -800,    0 }}, UPWARDS_THRUST },
            { {{ -801, -801,    0 }}, UPWARDS_THRUST }
    };
    uint8_t testIterationCount = sizeof(inclinationExpectations) / sizeof(inclinationExpectation_t);

    // expect

    for (uint8_t index = 0; index < testIterationCount; index ++) {
        inclinationExpectation_t *angleInclinationExpectation = &inclinationExpectations[index];
#ifdef DEBUG_ALTITUDE_HOLD
        printf("iteration: %d\n", index);
#endif
        bool result = isThrustFacingDownwards(&angleInclinationExpectation->attitude);
        EXPECT_EQ(angleInclinationExpectation->expectDownwardsThrust, result);
    }
}


#define UPDATE_INTERVAL_MICROS 25000 // 25000 microseconds corresponds to 40Hz

void testCalculateEstimatedAltitudeReset(void)
{
    unittest_calculateEstimatedAltitude_previousTime = 0;
    unittest_calculateEstimatedAltitude_vel = 0.0f;
    unittest_calculateEstimatedAltitude_accAlt = 0.0f;
    accTimeSum = UPDATE_INTERVAL_MICROS;
    accSumCount = 1;
    accVelScale = 1.0f;
    BaroAlt = 0;
    inclination.values.rollDeciDegrees = 0;
    inclination.values.pitchDeciDegrees = 0;
}

void resetBarometerConfig(barometerConfig_t *barometerConfig)
{
    barometerConfig->baro_sample_count = 21;
    barometerConfig->baro_noise_lpf = 0.6f;
    barometerConfig->baro_cf_vel = 1.0f; // 1.0f, so barometer values are disregarded by integrator
    barometerConfig->baro_cf_alt = 1.0f; // 1.0f, so barometer values are disregarded by integrator
}

TEST(AltitudeHoldTest, TestCalculateEstimatedAltitudeIntegrator)
{
    barometerConfig_t barometerConfig;
    pidProfile_t pidProfile;

    configureAltitudeHold(&pidProfile, &barometerConfig, 0, 0);
    resetBarometerConfig(&barometerConfig);

    testCalculateEstimatedAltitudeReset();
    calculateEstimatedAltitude(UPDATE_INTERVAL_MICROS - 1);
    // No updates, since update interval has not passed
    EXPECT_EQ(0, unittest_calculateEstimatedAltitude_previousTime);
    EXPECT_EQ(0, altitudeHoldGetEstimatedAltitude());

    testCalculateEstimatedAltitudeReset();
    calculateEstimatedAltitude(UPDATE_INTERVAL_MICROS);
    // altitude should not have changed since integrator variables are all zero
    EXPECT_EQ(0, altitudeHoldGetEstimatedAltitude());
    EXPECT_EQ(UPDATE_INTERVAL_MICROS, unittest_calculateEstimatedAltitude_previousTime);

    // minimal test of integrator
    testCalculateEstimatedAltitudeReset();
    accSum[Z] = 6;
    calculateEstimatedAltitude(UPDATE_INTERVAL_MICROS);
    // vel_acc is the z acceleration times the time interval
    EXPECT_FLOAT_EQ(accSum[Z] * UPDATE_INTERVAL_MICROS , unittest_calculateEstimatedAltitude_vel_acc);
    // vel has increased from 0 to vel_acc
    EXPECT_FLOAT_EQ(unittest_calculateEstimatedAltitude_vel_acc, unittest_calculateEstimatedAltitude_vel);
    // accAlt is 0.5 * vel_acc * timeInterval
    EXPECT_FLOAT_EQ(1875, unittest_calculateEstimatedAltitude_accAlt);
    // and finally, altitude has increased from 0 to accAlt
    EXPECT_EQ(unittest_calculateEstimatedAltitude_accAlt, altitudeHoldGetEstimatedAltitude());
}

TEST(AltitudeHoldTest, TestCalculateEstimatedAltitudeSonar)
{
    sonarInit(0);

    barometerConfig_t barometerConfig;
    pidProfile_t pidProfile;

    configureAltitudeHold(&pidProfile, &barometerConfig, 0, 0);
    resetBarometerConfig(&barometerConfig);

    testCalculateEstimatedAltitudeReset();
    accSumCount = 0;
    // force sonar to return altitude of 100cm
    hcsr04SonarPulseTravelTime =  SOUND_SPEED_MICROSECONDS_PER_CM * 100;
    // altitude should be updated with sonar altitude
    calculateEstimatedAltitude(UPDATE_INTERVAL_MICROS);
    EXPECT_EQ(100, altitudeHoldGetEstimatedAltitude());

    testCalculateEstimatedAltitudeReset();
    accSumCount = 0;
    // force sonar to return out of range altitude
    hcsr04SonarPulseTravelTime =  SOUND_SPEED_MICROSECONDS_PER_CM * (HCSR04_MAX_RANGE_CM + 1);
    // sonar out of range, so altitude should not be updated
    calculateEstimatedAltitude(UPDATE_INTERVAL_MICROS);
    EXPECT_EQ(0, altitudeHoldGetEstimatedAltitude());
}


// STUBS

extern "C" {

uint32_t rcModeActivationMask=0;
int16_t rcCommand[4];
int16_t rcData[MAX_SUPPORTED_RC_CHANNEL_COUNT];

int32_t BaroAlt=0;
uint32_t accTimeSum=0;        // keep track for integration of acc
int accSumCount=0;
float accVelScale=0;

attitudeEulerAngles_t attitude;

int32_t accSum[XYZ_AXIS_COUNT];
int16_t debug[DEBUG16_VALUE_COUNT];

uint8_t stateFlags;
uint16_t flightModeFlags;


void sensorsSet(uint32_t mask) {UNUSED(mask);}
uint16_t enableFlightMode(flightModeFlags_e mask) {return flightModeFlags |= (mask);}
uint16_t disableFlightMode(flightModeFlags_e mask) {return flightModeFlags &= ~(mask);}
void imuResetAccelerationSum(void) {};
bool isBaroCalibrationComplete(void) {return true;}
void performBaroCalibrationCycle(void) {}
int32_t baroCalculateAltitude(void) {return 0;}
}
