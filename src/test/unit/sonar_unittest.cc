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
#include <math.h>

extern "C" {
    #include "build_config.h"
    #include "drivers/sonar_hcsr04.h"
    #include "sensors/sonar.h"
    extern int32_t measurement;
    extern int16_t sonarMaxTiltDeciDegrees;
    void sonarInit(const sonarHardware_t *sonarHardware);
}

#include "unittest_macros.h"
#include "gtest/gtest.h"

#define DECIDEGREES_TO_RADIANS(angle) (((angle) / 10.0f) * 0.0174532925f)

TEST(SonarUnittest, TestConstants)
{
    sonarInit(0);
    // SONAR_OUT_OF_RANGE must be negative
    EXPECT_LE(SONAR_OUT_OF_RANGE, 0);
    // Check against gross errors in max range constants
    EXPECT_GT(HCSR04_MAX_RANGE_CM, 100);
}

TEST(SonarUnittest, TestSonarInit)
{
    sonarInit(0);
    EXPECT_EQ(sonarMaxRangeCm, HCSR04_MAX_RANGE_CM);
    // Check against gross errors in max range values
    EXPECT_GE(sonarMaxAltWithTiltCm, 100);
    EXPECT_LE(sonarMaxAltWithTiltCm, sonarMaxRangeCm);
    EXPECT_GE(sonarCfAltCm, 100);
    EXPECT_LE(sonarCfAltCm, sonarMaxRangeCm);
    EXPECT_LE(sonarCfAltCm, sonarMaxAltWithTiltCm);
    // Check reasonable values for maximum tilt
    EXPECT_GE(sonarMaxTiltDeciDegrees, 0);
    EXPECT_LE(sonarMaxTiltDeciDegrees, 450);
}

TEST(SonarUnittest, TestDistance)
{
    // Check sonar pulse time converted correctly to cm
    const int echoMicroSecondsPerCm = 59;
    measurement =  0;
    EXPECT_EQ(hcsr04_get_distance(), 0);

    measurement =  echoMicroSecondsPerCm;
    EXPECT_EQ(hcsr04_get_distance(), 1);

    measurement =  10 * echoMicroSecondsPerCm;
    EXPECT_EQ(hcsr04_get_distance(), 10);

    measurement =  HCSR04_MAX_RANGE_CM * echoMicroSecondsPerCm;
    EXPECT_EQ(hcsr04_get_distance(), HCSR04_MAX_RANGE_CM);
}

TEST(SonarUnittest, TestAltitude)
{
    sonarInit(0);
    // Check distance not modified if no tilt
    EXPECT_EQ(sonarCalculateAltitude(0, cosf(DECIDEGREES_TO_RADIANS(0))), 0);
    EXPECT_EQ(sonarGetLatestAltitude(), 0);
    EXPECT_EQ(sonarCalculateAltitude(100, cosf(DECIDEGREES_TO_RADIANS(0))), 100);
    EXPECT_EQ(sonarGetLatestAltitude(), 100);

    // Check that out of range is returned if tilt is too large
    EXPECT_EQ(sonarCalculateAltitude(0, cosf(DECIDEGREES_TO_RADIANS(sonarMaxTiltDeciDegrees+1))), SONAR_OUT_OF_RANGE);
    EXPECT_EQ(sonarGetLatestAltitude(), SONAR_OUT_OF_RANGE);

    // Check distance at various roll angles
    // distance 400, 5 degrees of roll
    EXPECT_EQ(sonarCalculateAltitude(400, cosf(DECIDEGREES_TO_RADIANS(50))), 398);
    EXPECT_EQ(sonarGetLatestAltitude(), 398);
    // distance 400, 10 degrees of roll
    EXPECT_EQ(sonarCalculateAltitude(400, cosf(DECIDEGREES_TO_RADIANS(100))), 393);
    EXPECT_EQ(sonarGetLatestAltitude(), 393);
    // distance 400, 15 degrees of roll, this corresponds to HC-SR04 specified max detection angle
    EXPECT_EQ(sonarCalculateAltitude(400, cosf(DECIDEGREES_TO_RADIANS(150))), 386);
    EXPECT_EQ(sonarGetLatestAltitude(), 386);
    // distance 400, 20 degrees of roll
    EXPECT_EQ(sonarCalculateAltitude(400, cosf(DECIDEGREES_TO_RADIANS(200))), 375);
    EXPECT_EQ(sonarGetLatestAltitude(), 375);
    // distance 400, 22.4 degrees of roll, this corresponds to HC-SR04 effective max detection angle
    EXPECT_EQ(sonarCalculateAltitude(400, cosf(DECIDEGREES_TO_RADIANS(224))), 369);
    EXPECT_EQ(sonarGetLatestAltitude(), 369);
    // Check limits at max range max tilt, need to deal with rounding errors in cosf calculation
    EXPECT_NEAR(sonarCalculateAltitude(sonarMaxRangeCm, cosf(DECIDEGREES_TO_RADIANS(sonarMaxTiltDeciDegrees - 1))), sonarMaxAltWithTiltCm, 1);
    EXPECT_NEAR(sonarGetLatestAltitude(), sonarMaxAltWithTiltCm, 1);
}

// STUBS
extern "C" {
void sensorsSet(uint32_t mask) {UNUSED(mask);}
}

