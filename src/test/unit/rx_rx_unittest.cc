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

#define TEST_MAX_RC_HISTORY_ITEMS 4

extern "C" {
    #include "platform.h"

    #include "rx/rx.h"
    #include "io/rc_controls.h"
    #include "common/maths.h"

    uint32_t rcModeActivationMask;


    extern uint16_t rcHistory[MAX_SUPPORTED_RC_CHANNEL_COUNT][TEST_MAX_RC_HISTORY_ITEMS];


    void rxInit(rxConfig_t *rxConfig, modeActivationCondition_t *modeActivationConditions);
    void rxResetFlightChannelStatus(void);
    bool rxHaveValidFlightChannels(void);
    bool isPulseValid(uint16_t pulseDuration);
    void rxUpdateFlightChannelStatus(uint8_t channel, uint16_t pulseDuration);
}

#include "unittest_macros.h"
#include "gtest/gtest.h"

#define DE_ACTIVATE_ALL_BOXES   0

typedef struct testData_s {
    bool isPPMDataBeingReceived;
    bool isPWMDataBeingReceived;
} testData_t;

static testData_t testData;

TEST(RxTest, TestValidFlightChannels)
{
    // given
    memset(&testData, 0, sizeof(testData));
    rcModeActivationMask = DE_ACTIVATE_ALL_BOXES;   // BOXFAILSAFE must be OFF

    // and
    rxConfig_t rxConfig;
    modeActivationCondition_t modeActivationConditions[MAX_MODE_ACTIVATION_CONDITION_COUNT];

    memset(&rxConfig, 0, sizeof(rxConfig));
    rxConfig.rx_min_usec = 1000;
    rxConfig.rx_max_usec = 2000;

    memset(&modeActivationConditions, 0, sizeof(modeActivationConditions));
    modeActivationConditions[0].auxChannelIndex = 0;
    modeActivationConditions[0].modeId = BOXARM;
    modeActivationConditions[0].range.startStep = CHANNEL_VALUE_TO_STEP(CHANNEL_RANGE_MIN);
    modeActivationConditions[0].range.endStep = CHANNEL_VALUE_TO_STEP(1600);

    // when
    rxInit(&rxConfig, modeActivationConditions);

    // then (ARM channel should be positioned just 1 step above active range to init to OFF)
    EXPECT_EQ(1625, rcData[modeActivationConditions[0].auxChannelIndex +  NON_AUX_CHANNEL_COUNT]);

    // given
    rxResetFlightChannelStatus();

    // and
    for (uint8_t channelIndex = 0; channelIndex < MAX_SUPPORTED_RC_CHANNEL_COUNT; channelIndex++) {
        bool validPulse = isPulseValid(1500);
        rxUpdateFlightChannelStatus(channelIndex, validPulse);
    }

    // then
    EXPECT_TRUE(rxHaveValidFlightChannels());
}

TEST(RxTest, TestInvalidFlightChannels)
{
    // given
    memset(&testData, 0, sizeof(testData));

    // and
    rxConfig_t rxConfig;
    modeActivationCondition_t modeActivationConditions[MAX_MODE_ACTIVATION_CONDITION_COUNT];

    memset(&rxConfig, 0, sizeof(rxConfig));
    rxConfig.rx_min_usec = 1000;
    rxConfig.rx_max_usec = 2000;

    memset(&modeActivationConditions, 0, sizeof(modeActivationConditions));
    modeActivationConditions[0].auxChannelIndex = 0;
    modeActivationConditions[0].modeId = BOXARM;
    modeActivationConditions[0].range.startStep = CHANNEL_VALUE_TO_STEP(1400);
    modeActivationConditions[0].range.endStep = CHANNEL_VALUE_TO_STEP(CHANNEL_RANGE_MAX);

    // and
    uint16_t channelPulses[MAX_SUPPORTED_RC_CHANNEL_COUNT];
    memset(&channelPulses, 1500, sizeof(channelPulses));

    // and
    rxInit(&rxConfig, modeActivationConditions);

    // then (ARM channel should be positioned just 1 step below active range to init to OFF)
    EXPECT_EQ(1375, rcData[modeActivationConditions[0].auxChannelIndex +  NON_AUX_CHANNEL_COUNT]);

    // and
    for (uint8_t stickChannelIndex = 0; stickChannelIndex < STICK_CHANNEL_COUNT; stickChannelIndex++) {

        // given
        rxResetFlightChannelStatus();

        for (uint8_t otherStickChannelIndex = 0; otherStickChannelIndex < STICK_CHANNEL_COUNT; otherStickChannelIndex++) {
            channelPulses[otherStickChannelIndex] = rxConfig.rx_min_usec;
        }
        channelPulses[stickChannelIndex] = rxConfig.rx_min_usec - 1;

        // when
        for (uint8_t channelIndex = 0; channelIndex < MAX_SUPPORTED_RC_CHANNEL_COUNT; channelIndex++) {
            bool validPulse = isPulseValid(channelPulses[channelIndex]);
            rxUpdateFlightChannelStatus(channelIndex, validPulse);
        }

        // then
        EXPECT_FALSE(rxHaveValidFlightChannels());

        // given
        rxResetFlightChannelStatus();

        for (uint8_t otherStickChannelIndex = 0; otherStickChannelIndex < STICK_CHANNEL_COUNT; otherStickChannelIndex++) {
            channelPulses[otherStickChannelIndex] = rxConfig.rx_max_usec;
        }
        channelPulses[stickChannelIndex] = rxConfig.rx_max_usec + 1;

        // when
        for (uint8_t channelIndex = 0; channelIndex < MAX_SUPPORTED_RC_CHANNEL_COUNT; channelIndex++) {
            bool validPulse = isPulseValid(channelPulses[channelIndex]);
            rxUpdateFlightChannelStatus(channelIndex, validPulse);
        }

        // then
        EXPECT_FALSE(rxHaveValidFlightChannels());
    }
}

TEST(RxTest, TestChannelStabilityLowToMediumTransition)
{
    // given low stability history
    memset(&rcHistory, 0, sizeof(rcHistory));

    uint16_t lowStabilityRcHistory[TEST_MAX_RC_HISTORY_ITEMS] = { 1474, 1500, 1526, 1500 };
    for (uint8_t channelIndex = 0; channelIndex < MAX_SUPPORTED_RC_CHANNEL_COUNT; channelIndex++) {
        memcpy(rcHistory[channelIndex], lowStabilityRcHistory, sizeof(lowStabilityRcHistory));
    }

    // given low stability channels
    memset(&rcChannelStability, 0, sizeof(rcChannelStability));
    for (uint8_t channelIndex = 0; channelIndex < MAX_SUPPORTED_RC_CHANNEL_COUNT; channelIndex++) {
        rcChannelStability[channelIndex] = RX_CHANNEL_STABILITY_LOW;
    }

    // when rc channel is data unchanged (With MAX_RC_HISTORY_ITEMS set to 4 ( + 1 for the new reading) that works out at 100ms at 50hz, or less with Serial RX receivers.
    uint16_t rcChannelStream[TEST_MAX_RC_HISTORY_ITEMS + 1] = {1500, 1475, 1500, 1525, 1500};

    for (uint8_t index = 0; index < TEST_MAX_RC_HISTORY_ITEMS + 1; index++) {

        for (uint8_t channelIndex = 0; channelIndex < MAX_SUPPORTED_RC_CHANNEL_COUNT; channelIndex++) {
            EXPECT_EQ(RX_CHANNEL_STABILITY_LOW, rcChannelStability[channelIndex]);

            rcData[channelIndex] = rcChannelStream[index];
        }
        updateChannelStability();
    }

    // then
    for (uint8_t channelIndex = 0; channelIndex < MAX_SUPPORTED_RC_CHANNEL_COUNT; channelIndex++) {
        EXPECT_EQ(RX_CHANNEL_STABILITY_MEDIUM, rcChannelStability[channelIndex]);
    }
}

TEST(RxTest, TestChannelStabilityMediumToHighTransition)
{
    // given medium stability history
    memset(&rcHistory, 0, sizeof(rcHistory));

    uint16_t mediumStabilityRcHistory[TEST_MAX_RC_HISTORY_ITEMS] = { 1475, 1500, 1525, 1500 };
    for (uint8_t channelIndex = 0; channelIndex < MAX_SUPPORTED_RC_CHANNEL_COUNT; channelIndex++) {
        memcpy(rcHistory[channelIndex], mediumStabilityRcHistory, sizeof(mediumStabilityRcHistory));
    }

    // given medium stability channels
    memset(&rcChannelStability, 0, sizeof(rcChannelStability));
    for (uint8_t channelIndex = 0; channelIndex < MAX_SUPPORTED_RC_CHANNEL_COUNT; channelIndex++) {
        rcChannelStability[channelIndex] = RX_CHANNEL_STABILITY_MEDIUM;
    }

    // when rc channel is data unchanged (With MAX_RC_HISTORY_ITEMS set to 4 ( + 1 for the new reading) that works out at 100ms at 50hz, or less with Serial RX receivers.
    uint16_t rcChannelStream[TEST_MAX_RC_HISTORY_ITEMS + 1] = {1500, 1490, 1500, 1510, 1500};

    for (uint8_t index = 0; index < TEST_MAX_RC_HISTORY_ITEMS + 1; index++) {

        for (uint8_t channelIndex = 0; channelIndex < MAX_SUPPORTED_RC_CHANNEL_COUNT; channelIndex++) {
            EXPECT_EQ(RX_CHANNEL_STABILITY_MEDIUM, rcChannelStability[channelIndex]);

            rcData[channelIndex] = rcChannelStream[index];
        }
        updateChannelStability();
    }

    // then
    for (uint8_t channelIndex = 0; channelIndex < MAX_SUPPORTED_RC_CHANNEL_COUNT; channelIndex++) {
        EXPECT_EQ(RX_CHANNEL_STABILITY_HIGH, rcChannelStability[channelIndex]);
    }
}

// STUBS

extern "C" {
    void failsafeOnValidDataFailed() {}
    void failsafeOnValidDataReceived() {}

    void failsafeOnRxSuspend(uint32_t ) {}
    void failsafeOnRxResume(void) {}

    uint32_t micros(void) { return 0; }
    uint32_t millis(void) { return 0; }

    bool feature(uint32_t mask) {
        UNUSED(mask);
        return false;
    }

    bool isPPMDataBeingReceived(void) {
        return testData.isPPMDataBeingReceived;
    }

    bool isPWMDataBeingReceived(void) {
        return testData.isPWMDataBeingReceived;
    }

    void resetPPMDataReceivedState(void) {}

    bool rxMspFrameComplete(void) { return false; }

    void rxMspInit(rxConfig_t *, rxRuntimeConfig_t *, rcReadRawDataPtr *) {}

    void rxPwmInit(rxRuntimeConfig_t *, rcReadRawDataPtr *) {}
}
