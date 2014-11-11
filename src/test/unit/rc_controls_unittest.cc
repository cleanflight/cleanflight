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
extern "C" {
    #include "common/axis.h"
    #include "flight/flight.h"

    #include "rx/rx.h"
    #include "io/escservo.h"
    #include "io/rc_controls.h"
}
#include "unittest_macros.h"
#include "gtest/gtest.h"

extern "C" {
int constrain(int amt, int low, int high)
{
    if (amt < low)
        return low;
    else if (amt > high)
        return high;
    else
        return amt;
}
}

TEST(RcControlsTest, updateActivatedModesWithAllInputsAtMidde)
{
    // given
    modeActivationCondition_t modeActivationConditions[MAX_MODE_ACTIVATION_CONDITION_COUNT];
    memset(&modeActivationConditions, 0, sizeof(modeActivationConditions));

    // and
    rcModeActivationMask = 0;

    // and
    memset(&rxRuntimeConfig, 0, sizeof(rxRuntimeConfig_t));
    rxRuntimeConfig.auxChannelCount = MAX_SUPPORTED_RC_CHANNEL_COUNT - NON_AUX_CHANNEL_COUNT;

    // and
    uint8_t index;
    for (index = AUX1; index < MAX_SUPPORTED_RC_CHANNEL_COUNT; index++) {
        rcData[index] = PWM_RANGE_MIDDLE;
    }

    // when
    updateActivatedModes(modeActivationConditions);

    // then
    for (index = 0; index < CHECKBOX_ITEM_COUNT; index++) {
        printf("iteration: %d\n", index);
        EXPECT_EQ(false, IS_RC_MODE_ACTIVE(index));
    }
}

TEST(RcControlsTest, updateActivatedModesUsingValidAuxConfigurationAndRXValues)
{
    // given
    modeActivationCondition_t modeActivationConditions[MAX_MODE_ACTIVATION_CONDITION_COUNT];
    memset(&modeActivationConditions, 0, sizeof(modeActivationConditions));

    modeActivationConditions[0].modeId = (boxId_e)0;
    modeActivationConditions[0].auxChannelIndex = AUX1 - NON_AUX_CHANNEL_COUNT;
    modeActivationConditions[0].range.startStep = CHANNEL_VALUE_TO_STEP(1700);
    modeActivationConditions[0].range.endStep = CHANNEL_VALUE_TO_STEP(2100);

    modeActivationConditions[1].modeId = (boxId_e)1;
    modeActivationConditions[1].auxChannelIndex = AUX2 - NON_AUX_CHANNEL_COUNT;
    modeActivationConditions[1].range.startStep = CHANNEL_VALUE_TO_STEP(1300);
    modeActivationConditions[1].range.endStep = CHANNEL_VALUE_TO_STEP(1700);

    modeActivationConditions[2].modeId = (boxId_e)2;
    modeActivationConditions[2].auxChannelIndex = AUX3 - NON_AUX_CHANNEL_COUNT;
    modeActivationConditions[2].range.startStep = CHANNEL_VALUE_TO_STEP(900);
    modeActivationConditions[2].range.endStep = CHANNEL_VALUE_TO_STEP(1200);

    modeActivationConditions[3].modeId = (boxId_e)3;
    modeActivationConditions[3].auxChannelIndex = AUX4 - NON_AUX_CHANNEL_COUNT;
    modeActivationConditions[3].range.startStep = CHANNEL_VALUE_TO_STEP(900);
    modeActivationConditions[3].range.endStep = CHANNEL_VALUE_TO_STEP(2100);

    modeActivationConditions[4].modeId = (boxId_e)4;
    modeActivationConditions[4].auxChannelIndex = AUX5 - NON_AUX_CHANNEL_COUNT;
    modeActivationConditions[4].range.startStep = CHANNEL_VALUE_TO_STEP(900);
    modeActivationConditions[4].range.endStep = CHANNEL_VALUE_TO_STEP(925);

    EXPECT_EQ(0, modeActivationConditions[4].range.startStep);
    EXPECT_EQ(1, modeActivationConditions[4].range.endStep);

    modeActivationConditions[5].modeId = (boxId_e)5;
    modeActivationConditions[5].auxChannelIndex = AUX6 - NON_AUX_CHANNEL_COUNT;
    modeActivationConditions[5].range.startStep = CHANNEL_VALUE_TO_STEP(2075);
    modeActivationConditions[5].range.endStep = CHANNEL_VALUE_TO_STEP(2100);

    EXPECT_EQ(47, modeActivationConditions[5].range.startStep);
    EXPECT_EQ(48, modeActivationConditions[5].range.endStep);

    modeActivationConditions[6].modeId = (boxId_e)6;
    modeActivationConditions[6].auxChannelIndex = AUX7 - NON_AUX_CHANNEL_COUNT;
    modeActivationConditions[6].range.startStep = CHANNEL_VALUE_TO_STEP(925);
    modeActivationConditions[6].range.endStep = CHANNEL_VALUE_TO_STEP(950);

    EXPECT_EQ(1, modeActivationConditions[6].range.startStep);
    EXPECT_EQ(2, modeActivationConditions[6].range.endStep);

    // and
    rcModeActivationMask = 0;

    // and
    memset(&rxRuntimeConfig, 0, sizeof(rxRuntimeConfig_t));
    rxRuntimeConfig.auxChannelCount = MAX_SUPPORTED_RC_CHANNEL_COUNT - NON_AUX_CHANNEL_COUNT;

    // and
    uint8_t index;
    for (index = AUX1; index < MAX_SUPPORTED_RC_CHANNEL_COUNT; index++) {
        rcData[index] = PWM_RANGE_MIDDLE;
    }

    rcData[AUX1] = PWM_RANGE_MAX;
    rcData[AUX2] = PWM_RANGE_MIDDLE;
    rcData[AUX3] = PWM_RANGE_MIN;
    rcData[AUX4] = PWM_RANGE_MAX;
    rcData[AUX5] = 899; // value lower that range minimum should be treated the same as the lowest range value
    rcData[AUX6] = 2101; // value higher than the range maximum should be treated the same as the highest range value
    rcData[AUX7] = 950; // value equal to range step upper boundary should not activate the mode

    // and
    uint32_t expectedMask = 0;
    expectedMask |= (1 << 0);
    expectedMask |= (1 << 1);
    expectedMask |= (1 << 2);
    expectedMask |= (1 << 3);
    expectedMask |= (1 << 4);
    expectedMask |= (1 << 5);
    expectedMask |= (0 << 6);

    // when
    updateActivatedModes(modeActivationConditions);

    // then
    for (index = 0; index < CHECKBOX_ITEM_COUNT; index++) {
        printf("iteration: %d\n", index);
        EXPECT_EQ(expectedMask & (1 << index), rcModeActivationMask & (1 << index));
    }
}

enum {
    COUNTER_GENERATE_PITCH_ROLL_CURVE = 0,
    COUNTER_QUEUE_CONFIRMATION_BEEP,
    COUNTER_CHANGE_CONTROL_RATE_PROFILE
};
#define CALL_COUNT_ITEM_COUNT 3

static int callCounts[CALL_COUNT_ITEM_COUNT];

#define CALL_COUNTER(item) (callCounts[item])

extern "C" {
void generatePitchRollCurve(controlRateConfig_t *) {
    callCounts[COUNTER_GENERATE_PITCH_ROLL_CURVE]++;
}

void queueConfirmationBeep(uint8_t) {
    callCounts[COUNTER_QUEUE_CONFIRMATION_BEEP]++;
}

void changeControlRateProfile(uint8_t) {
    callCounts[COUNTER_CHANGE_CONTROL_RATE_PROFILE]++;
}

}

void resetCallCounters(void) {
    memset(&callCounts, 0, sizeof(callCounts));
}

uint32_t fixedMillis;

extern "C" {
uint32_t millis(void) {
    return fixedMillis;
}
}

void resetMillis(void) {
    fixedMillis = 0;
}

#define DEFAULT_MIN_CHECK 1100
#define DEFAULT_MAX_CHECK 1900

rxConfig_t rxConfig;

extern uint8_t adjustmentStateMask;
extern adjustmentState_t adjustmentStates[MAX_SIMULTANEOUS_ADJUSTMENT_COUNT];

static const adjustmentConfig_t rateAdjustmentConfig = {
    .adjustmentFunction = ADJUSTMENT_RC_RATE,
    .mode = ADJUSTMENT_MODE_STEP,
    .data = { { 1 } }
};

TEST(RcControlsTest, processRcAdjustmentsSticksInMiddle)
{
    // given
    controlRateConfig_t controlRateConfig = {
            .rcRate8 = 90,
            .rcExpo8 = 0,
            .thrMid8 = 0,
            .thrExpo8 = 0,
            .rollPitchRate = 0,
            .yawRate = 0,
            .dynThrPID = 0,
            .tpa_breakpoint = 0
    };

    // and
    memset(&rxConfig, 0, sizeof (rxConfig));
    rxConfig.mincheck = DEFAULT_MIN_CHECK;
    rxConfig.maxcheck = DEFAULT_MAX_CHECK;
    rxConfig.midrc = 1500;

    adjustmentStateMask = 0;
    memset(&adjustmentStates, 0, sizeof(adjustmentStates));
    configureAdjustment(0, AUX3 - NON_AUX_CHANNEL_COUNT, &rateAdjustmentConfig);

    // and
    uint8_t index;
    for (index = AUX1; index < MAX_SUPPORTED_RC_CHANNEL_COUNT; index++) {
        rcData[index] = PWM_RANGE_MIDDLE;
    }

    // and
    resetCallCounters();
    resetMillis();

    // when
    processRcAdjustments(&controlRateConfig, &rxConfig);

    // then
    EXPECT_EQ(controlRateConfig.rcRate8, 90);
    EXPECT_EQ(CALL_COUNTER(COUNTER_GENERATE_PITCH_ROLL_CURVE), 0);
    EXPECT_EQ(CALL_COUNTER(COUNTER_QUEUE_CONFIRMATION_BEEP), 0);
    EXPECT_EQ(adjustmentStateMask, 0);
}

TEST(RcControlsTest, processRcAdjustmentsWithRcRateFunctionSwitchUp)
{
    // given
    controlRateConfig_t controlRateConfig = {
            .rcRate8 = 90,
            .rcExpo8 = 0,
            .thrMid8 = 0,
            .thrExpo8 = 0,
            .rollPitchRate = 0,
            .yawRate = 0,
            .dynThrPID = 0,
            .tpa_breakpoint = 0
    };

    // and
    memset(&rxConfig, 0, sizeof (rxConfig));
    rxConfig.mincheck = DEFAULT_MIN_CHECK;
    rxConfig.maxcheck = DEFAULT_MAX_CHECK;
    rxConfig.midrc = 1500;

    // and
    adjustmentStateMask = 0;
    memset(&adjustmentStates, 0, sizeof(adjustmentStates));
    configureAdjustment(0, AUX3 - NON_AUX_CHANNEL_COUNT, &rateAdjustmentConfig);

    // and
    uint8_t index;
    for (index = AUX1; index < MAX_SUPPORTED_RC_CHANNEL_COUNT; index++) {
        rcData[index] = PWM_RANGE_MIDDLE;
    }

    // and
    resetCallCounters();
    resetMillis();

    // and
    rcData[AUX3] = PWM_RANGE_MAX;

    // and
    uint8_t expectedAdjustmentStateMask =
            (1 << 0);

    // and
    fixedMillis = 496;

    // when
    processRcAdjustments(&controlRateConfig, &rxConfig);

    // then
    EXPECT_EQ(controlRateConfig.rcRate8, 91);
    EXPECT_EQ(CALL_COUNTER(COUNTER_GENERATE_PITCH_ROLL_CURVE), 1);
    EXPECT_EQ(CALL_COUNTER(COUNTER_QUEUE_CONFIRMATION_BEEP), 1);
    EXPECT_EQ(adjustmentStateMask, expectedAdjustmentStateMask);


    //
    // now pretend a short amount of time has passed, but not enough time to allow the value to have been increased
    //

    // given
    fixedMillis = 497;

    // when
    processRcAdjustments(&controlRateConfig, &rxConfig);

    EXPECT_EQ(controlRateConfig.rcRate8, 91);
    EXPECT_EQ(adjustmentStateMask, expectedAdjustmentStateMask);


    //
    // moving the switch back to the middle should immediately reset the state flag without increasing the value
    //


    // given
    rcData[AUX3] = PWM_RANGE_MIDDLE;

    // and
    fixedMillis = 498;

    // and
    expectedAdjustmentStateMask = adjustmentStateMask &
            ~(1 << 0);

    // when
    processRcAdjustments(&controlRateConfig, &rxConfig);

    EXPECT_EQ(controlRateConfig.rcRate8, 91);
    EXPECT_EQ(adjustmentStateMask, expectedAdjustmentStateMask);


    //
    // flipping the switch again, before the state reset would have occurred, allows the value to be increased again

    // given
    rcData[AUX3] = PWM_RANGE_MAX;

    // and
    expectedAdjustmentStateMask =
            (1 << 0);

    // and
    fixedMillis = 499;

    // when
    processRcAdjustments(&controlRateConfig, &rxConfig);

    // then
    EXPECT_EQ(controlRateConfig.rcRate8, 92);
    EXPECT_EQ(CALL_COUNTER(COUNTER_GENERATE_PITCH_ROLL_CURVE), 2);
    EXPECT_EQ(CALL_COUNTER(COUNTER_QUEUE_CONFIRMATION_BEEP), 2);
    EXPECT_EQ(adjustmentStateMask, expectedAdjustmentStateMask);

    //
    // leaving the switch up, after the original timer would have reset the state should now NOT cause
    // the rate to increase, it should only increase after another 500ms from when the state was reset.
    //

    // given
    fixedMillis = 500;

    // when
    processRcAdjustments(&controlRateConfig, &rxConfig);

    // then
    EXPECT_EQ(controlRateConfig.rcRate8, 92);
    EXPECT_EQ(adjustmentStateMask, expectedAdjustmentStateMask);

    //
    // should still not be able to be increased
    //

    // given
    fixedMillis = 997;

    // when
    processRcAdjustments(&controlRateConfig, &rxConfig);

    // then
    EXPECT_EQ(controlRateConfig.rcRate8, 92);
    EXPECT_EQ(adjustmentStateMask, expectedAdjustmentStateMask);

    //
    // 500ms has now passed since the switch was returned to the middle, now that
    // switch is still in the UP position after the timer has elapses it should
    // be increased again.
    //

    // given
    fixedMillis = 998;

    // when
    processRcAdjustments(&controlRateConfig, &rxConfig);

    // then
    EXPECT_EQ(controlRateConfig.rcRate8, 93);
    EXPECT_EQ(CALL_COUNTER(COUNTER_GENERATE_PITCH_ROLL_CURVE), 3);
    EXPECT_EQ(CALL_COUNTER(COUNTER_QUEUE_CONFIRMATION_BEEP), 3);
    EXPECT_EQ(adjustmentStateMask, expectedAdjustmentStateMask);
}

static const adjustmentConfig_t rateProfileAdjustmentConfig = {
    .adjustmentFunction = ADJUSTMENT_RATE_PROFILE,
    .mode = ADJUSTMENT_MODE_SELECT,
    .data = { { 3 } }
};

TEST(RcControlsTest, processRcRateProfileAdjustments)
{
    // given
    controlRateConfig_t controlRateConfig = {
            .rcRate8 = 90,
            .rcExpo8 = 0,
            .thrMid8 = 0,
            .thrExpo8 = 0,
            .rollPitchRate = 0,
            .yawRate = 0,
            .dynThrPID = 0,
            .tpa_breakpoint = 0
    };

    // and
    memset(&rxConfig, 0, sizeof (rxConfig));
    rxConfig.mincheck = DEFAULT_MIN_CHECK;
    rxConfig.maxcheck = DEFAULT_MAX_CHECK;
    rxConfig.midrc = 1500;

    adjustmentStateMask = 0;
    memset(&adjustmentStates, 0, sizeof(adjustmentStates));

    int adjustmentIndex = 3;
    configureAdjustment(adjustmentIndex, AUX4 - NON_AUX_CHANNEL_COUNT, &rateProfileAdjustmentConfig);

    // and
    uint8_t index;
    for (index = AUX1; index < MAX_SUPPORTED_RC_CHANNEL_COUNT; index++) {
        rcData[index] = PWM_RANGE_MIDDLE;
    }

    // and
    resetCallCounters();
    resetMillis();

    // and
    rcData[AUX4] = PWM_RANGE_MAX;

    // and
    uint8_t expectedAdjustmentStateMask =
            (1 << adjustmentIndex);

    // when
    processRcAdjustments(&controlRateConfig, &rxConfig);

    // then
    EXPECT_EQ(CALL_COUNTER(COUNTER_QUEUE_CONFIRMATION_BEEP), 1);
    EXPECT_EQ(CALL_COUNTER(COUNTER_CHANGE_CONTROL_RATE_PROFILE), 1);
    EXPECT_EQ(adjustmentStateMask, expectedAdjustmentStateMask);
}

extern "C" {
void saveConfigAndNotify(void) {}
void generateThrottleCurve(controlRateConfig_t *, escAndServoConfig_t *) {}
void changeProfile(uint8_t) {}
void accSetCalibrationCycles(uint16_t) {}
void gyroSetCalibrationCycles(uint16_t) {}
void applyAndSaveAccelerometerTrimsDelta(rollAndPitchTrims_t*) {}
void handleInflightCalibrationStickPosition(void) {}
void mwArm(void) {}
void feature(uint32_t) {}
void sensors(uint32_t) {}
void mwDisarm(void) {}
uint8_t getCurrentControlRateProfile(void) {
    return 0;
}

uint8_t armingFlags = 0;
int16_t heading;
uint8_t stateFlags = 0;
int16_t rcData[MAX_SUPPORTED_RC_CHANNEL_COUNT];
rxRuntimeConfig_t rxRuntimeConfig;
}
