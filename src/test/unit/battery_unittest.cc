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

#include <limits.h>
#include "sensors/battery.h"

#include "unittest_macros.h"
#include "gtest/gtest.h"

typedef struct batteryAdcToVoltageExpectation_s {
    uint16_t adcReading;
    uint16_t expectedVoltageInDeciVoltSteps;
} batteryAdcToVoltageExpectation_t;

#define ELEVEN_TO_ONE_VOLTAGE_DIVIDER 110 // (10k:1k) * 10 for 0.1V

TEST(BatteryTest, BatteryADCToVoltage)
{
    // given

    batteryConfig_t batteryConfig;
    batteryConfig.vbatscale = ELEVEN_TO_ONE_VOLTAGE_DIVIDER;

    batteryInit(&batteryConfig);

    batteryAdcToVoltageExpectation_t batteryAdcToVoltageExpectations[] = {
            {1420, 125},
            {1430, 126},
            {1440, 127},
            {1890, 167},
            {1900, 168},
            {1910, 169}
    };
    uint8_t testIterationCount = sizeof(batteryAdcToVoltageExpectations) / sizeof(batteryAdcToVoltageExpectation_t);

    // expect

    for (uint8_t index = 0; index < testIterationCount; index ++) {
        batteryAdcToVoltageExpectation_t *batteryAdcToVoltageExpectation = &batteryAdcToVoltageExpectations[index];
        printf("adcReading: %d\n", batteryAdcToVoltageExpectation->adcReading);

        uint16_t pointOneVoltSteps = batteryAdcToVoltage(batteryAdcToVoltageExpectation->adcReading);

        EXPECT_EQ(pointOneVoltSteps, batteryAdcToVoltageExpectation->expectedVoltageInDeciVoltSteps);
    }
}

// STUBS

uint16_t adcGetChannel(uint8_t channel)
{
    UNUSED(channel);
    return 0;
}

void delay(uint32_t ms)
{
    UNUSED(ms);
    return;
}
