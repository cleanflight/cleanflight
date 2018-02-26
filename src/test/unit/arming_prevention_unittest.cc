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

extern "C" {
    #include "blackbox/blackbox.h"
    #include "build/debug.h"
    #include "common/maths.h"
    #include "config/parameter_group.h"
    #include "config/parameter_group_ids.h"
    #include "fc/config.h"
    #include "fc/controlrate_profile.h"
    #include "fc/fc_core.h"
    #include "fc/rc_controls.h"
    #include "fc/rc_modes.h"
    #include "fc/runtime_config.h"
    #include "flight/imu.h"
    #include "flight/mixer.h"
    #include "flight/pid.h"
    #include "flight/servos.h"
    #include "io/beeper.h"
    #include "io/gps.h"
    #include "rx/rx.h"
    #include "scheduler/scheduler.h"
    #include "sensors/acceleration.h"
    #include "sensors/gyro.h"
    #include "telemetry/telemetry.h"

    PG_REGISTER(accelerometerConfig_t, accelerometerConfig, PG_ACCELEROMETER_CONFIG, 0);
    PG_REGISTER(blackboxConfig_t, blackboxConfig, PG_BLACKBOX_CONFIG, 0);
    PG_REGISTER(gyroConfig_t, gyroConfig, PG_GYRO_CONFIG, 0);
    PG_REGISTER(mixerConfig_t, mixerConfig, PG_MIXER_CONFIG, 0);
    PG_REGISTER(pidConfig_t, pidConfig, PG_PID_CONFIG, 0);
    PG_REGISTER(rxConfig_t, rxConfig, PG_RX_CONFIG, 0);
    PG_REGISTER(servoConfig_t, servoConfig, PG_SERVO_CONFIG, 0);
    PG_REGISTER(systemConfig_t, systemConfig, PG_SYSTEM_CONFIG, 0);
    PG_REGISTER(telemetryConfig_t, telemetryConfig, PG_TELEMETRY_CONFIG, 0);

    float rcCommand[4];
    int16_t rcData[MAX_SUPPORTED_RC_CHANNEL_COUNT];
    uint16_t averageSystemLoadPercent = 0;
    uint8_t cliMode = 0;
    uint8_t debugMode = 0;
    int16_t debug[DEBUG16_VALUE_COUNT];
    pidProfile_t *currentPidProfile;
    controlRateConfig_t *currentControlRateProfile;
    attitudeEulerAngles_t attitude;
    gpsSolutionData_t gpsSol;
    uint32_t targetPidLooptime;
    bool cmsInMenu = false;
}

uint32_t simulationFeatureFlags = 0;
uint32_t simulationTime = 0;
bool gyroCalibDone = false;
bool simulationHaveRx = false;

#include "gtest/gtest.h"

TEST(ArmingPreventionTest, CalibrationPowerOnGraceAngleThrottleArmSwitch)
{
    // given
    simulationTime = 0;
    gyroCalibDone = false;

    // and
    modeActivationConditionsMutable(0)->auxChannelIndex = 0;
    modeActivationConditionsMutable(0)->modeId = BOXARM;
    modeActivationConditionsMutable(0)->range.startStep = CHANNEL_VALUE_TO_STEP(1750);
    modeActivationConditionsMutable(0)->range.endStep = CHANNEL_VALUE_TO_STEP(CHANNEL_RANGE_MAX);
    useRcControlsConfig(NULL);

    // and
    rxConfigMutable()->mincheck = 1050;

    // and
    // default channel positions
    rcData[THROTTLE] = 1400;
    rcData[4] = 1800;

    // and
    systemConfigMutable()->powerOnArmingGraceTime = 5;
    setArmingDisabled(ARMING_DISABLED_BOOT_GRACE_TIME);

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_BOOT_GRACE_TIME | ARMING_DISABLED_CALIBRATING | ARMING_DISABLED_ANGLE | ARMING_DISABLED_ARM_SWITCH | ARMING_DISABLED_THROTTLE, getArmingDisableFlags());

    // given
    // gyro calibration is done
    gyroCalibDone = true;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_BOOT_GRACE_TIME | ARMING_DISABLED_ANGLE | ARMING_DISABLED_ARM_SWITCH | ARMING_DISABLED_THROTTLE, getArmingDisableFlags());

    // given
    // quad is level
    ENABLE_STATE(SMALL_ANGLE);

    // when
    updateArmingStatus();

    // expect
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_BOOT_GRACE_TIME | ARMING_DISABLED_ARM_SWITCH | ARMING_DISABLED_THROTTLE, getArmingDisableFlags());

    // given
    rcData[THROTTLE] = 1000;

    // when
    updateArmingStatus();

    // expect
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_BOOT_GRACE_TIME | ARMING_DISABLED_ARM_SWITCH, getArmingDisableFlags());

    // given
    // arming grace time has elapsed
    simulationTime += systemConfig()->powerOnArmingGraceTime * 1e6;

    // when
    updateArmingStatus();

    // expect
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_ARM_SWITCH, getArmingDisableFlags());

    // given
    rcData[4] = 1000;

    // when
    // arm guard time elapses
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_EQ(0, getArmingDisableFlags());
    EXPECT_FALSE(isArmingDisabled());
}

TEST(ArmingPreventionTest, ArmingGuardRadioLeftOnAndArmed)
{
    // given
    simulationTime = 0;
    gyroCalibDone = false;

    // and
    modeActivationConditionsMutable(0)->auxChannelIndex = 0;
    modeActivationConditionsMutable(0)->modeId = BOXARM;
    modeActivationConditionsMutable(0)->range.startStep = CHANNEL_VALUE_TO_STEP(1750);
    modeActivationConditionsMutable(0)->range.endStep = CHANNEL_VALUE_TO_STEP(CHANNEL_RANGE_MAX);
    useRcControlsConfig(NULL);

    // and
    rxConfigMutable()->mincheck = 1050;

    // and
    rcData[THROTTLE] = 1000;
    ENABLE_STATE(SMALL_ANGLE);

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_CALIBRATING, getArmingDisableFlags());

    // given
    // arm channel takes a safe default value from the RX after power on
    rcData[4] = 1500;

    // and
    // a short time passes while calibration is in progress
    simulationTime += 1e6;

    // and
    // during calibration RF link is established and ARM switch is on
    rcData[4] = 1800;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_CALIBRATING | ARMING_DISABLED_ARM_SWITCH, getArmingDisableFlags());

    // given
    // calibration is done
    gyroCalibDone = true;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_ARM_SWITCH, getArmingDisableFlags());

    // given
    // arm switch is switched off by user
    rcData[4] = 1000;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    // arming enabled as arm switch has been off for sufficient time
    EXPECT_EQ(0, getArmingDisableFlags());
    EXPECT_FALSE(isArmingDisabled());
}

TEST(ArmingPreventionTest, Prearm)
{
    // given
    simulationTime = 0;

    // and
    modeActivationConditionsMutable(0)->auxChannelIndex = 0;
    modeActivationConditionsMutable(0)->modeId = BOXARM;
    modeActivationConditionsMutable(0)->range.startStep = CHANNEL_VALUE_TO_STEP(1750);
    modeActivationConditionsMutable(0)->range.endStep = CHANNEL_VALUE_TO_STEP(CHANNEL_RANGE_MAX);
    modeActivationConditionsMutable(1)->auxChannelIndex = 1;
    modeActivationConditionsMutable(1)->modeId = BOXPREARM;
    modeActivationConditionsMutable(1)->range.startStep = CHANNEL_VALUE_TO_STEP(1750);
    modeActivationConditionsMutable(1)->range.endStep = CHANNEL_VALUE_TO_STEP(CHANNEL_RANGE_MAX);
    useRcControlsConfig(NULL);

    // and
    rxConfigMutable()->mincheck = 1050;

    // given
    rcData[THROTTLE] = 1000;
    ENABLE_STATE(SMALL_ANGLE);

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_NOPREARM, getArmingDisableFlags());

    // given
    // prearm is enabled
    rcData[5] = 1800;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    // arming enabled as arm switch has been off for sufficient time
    EXPECT_EQ(0, getArmingDisableFlags());
    EXPECT_FALSE(isArmingDisabled());
}

TEST(ArmingPreventionTest, RadioTurnedOnAtAnyTimeArmed)
{
    // given
    simulationTime = 30e6; // 30 seconds after boot
    gyroCalibDone = true;

    // and
    modeActivationConditionsMutable(0)->auxChannelIndex = 0;
    modeActivationConditionsMutable(0)->modeId = BOXARM;
    modeActivationConditionsMutable(0)->range.startStep = CHANNEL_VALUE_TO_STEP(1750);
    modeActivationConditionsMutable(0)->range.endStep = CHANNEL_VALUE_TO_STEP(CHANNEL_RANGE_MAX);
    useRcControlsConfig(NULL);

    // and
    rxConfigMutable()->mincheck = 1050;

    // and
    rcData[THROTTLE] = 1000;
    ENABLE_STATE(SMALL_ANGLE);

    // and
    // RX has no link to radio
    simulationHaveRx = false;

    // and
    // arm channel has a safe default value
    rcData[4] = 1100;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_FALSE(isArmingDisabled());
    EXPECT_EQ(0, getArmingDisableFlags());

    // given
    // RF link is established and arm switch is turned on on radio
    simulationHaveRx = true;
    rcData[4] = 1800;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_BAD_RX_RECOVERY | ARMING_DISABLED_ARM_SWITCH, getArmingDisableFlags());

    // given
    // arm switch turned off by user
    rcData[4] = 1100;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_FALSE(isArmingDisabled());
    EXPECT_EQ(0, getArmingDisableFlags());
}

TEST(ArmingPreventionTest, In3DModeAllowArmingWhenEnteringThrottleDeadband)
{
    // given
    simulationFeatureFlags = FEATURE_3D; // Using 3D mode
    simulationTime = 30e6; // 30 seconds after boot
    gyroCalibDone = true;

    // and
    modeActivationConditionsMutable(0)->auxChannelIndex = 0;
    modeActivationConditionsMutable(0)->modeId = BOXARM;
    modeActivationConditionsMutable(0)->range.startStep = CHANNEL_VALUE_TO_STEP(1750);
    modeActivationConditionsMutable(0)->range.endStep = CHANNEL_VALUE_TO_STEP(CHANNEL_RANGE_MAX);
    useRcControlsConfig(NULL);

    // and
    rxConfigMutable()->midrc = 1500;
    flight3DConfigMutable()->deadband3d_throttle = 5;

    // and
    rcData[THROTTLE] = 1400;
    ENABLE_STATE(SMALL_ANGLE);
    simulationHaveRx = true;

    // and
    // arm channel has a safe default value
    rcData[4] = 1100;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_THROTTLE, getArmingDisableFlags());

    // given
    // attempt to arm
    rcData[4] = 1800;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_THROTTLE, getArmingDisableFlags());

    // given
    // throttle moved to centre
    rcData[THROTTLE] = 1496;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_FALSE(isArmingDisabled());
    EXPECT_EQ(0, getArmingDisableFlags());
}

TEST(ArmingPreventionTest, When3DModeDisabledThenNormalThrottleArmingConditionApplies)
{
    // given
    simulationFeatureFlags = FEATURE_3D; // Using 3D mode
    simulationTime = 30e6; // 30 seconds after boot
    gyroCalibDone = true;

    // and
    modeActivationConditionsMutable(0)->auxChannelIndex = 0;
    modeActivationConditionsMutable(0)->modeId = BOXARM;
    modeActivationConditionsMutable(0)->range.startStep = CHANNEL_VALUE_TO_STEP(1750);
    modeActivationConditionsMutable(0)->range.endStep = CHANNEL_VALUE_TO_STEP(CHANNEL_RANGE_MAX);
    modeActivationConditionsMutable(1)->auxChannelIndex = 1;
    modeActivationConditionsMutable(1)->modeId = BOX3DDISABLE;
    modeActivationConditionsMutable(1)->range.startStep = CHANNEL_VALUE_TO_STEP(1750);
    modeActivationConditionsMutable(1)->range.endStep = CHANNEL_VALUE_TO_STEP(CHANNEL_RANGE_MAX);
    useRcControlsConfig(NULL);

    // and
    rxConfigMutable()->mincheck = 1050;
    rxConfigMutable()->midrc = 1500;
    flight3DConfigMutable()->deadband3d_throttle = 5;

    // and
    // safe throttle value for 3D mode
    rcData[THROTTLE] = 1500;
    ENABLE_STATE(SMALL_ANGLE);
    simulationHaveRx = true;

    // and
    // arm channel has a safe default value
    rcData[4] = 1100;

    // and
    // disable 3D mode is off (i.e. 3D mode is on)
    rcData[5] = 1100;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    // ok to arm in 3D mode
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_FALSE(isArmingDisabled());
    EXPECT_EQ(0, getArmingDisableFlags());

    // given
    // disable 3D mode
    rcData[5] = 1800;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    // ok to arm in 3D mode
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_THROTTLE, getArmingDisableFlags());

    // given
    // attempt to arm
    rcData[4] = 1800;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_THROTTLE | ARMING_DISABLED_ARM_SWITCH, getArmingDisableFlags());

    // given
    // throttle moved low
    rcData[THROTTLE] = 1000;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_ARM_SWITCH, getArmingDisableFlags());

    // given
    // arm switch turned off
    rcData[4] = 1000;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_FALSE(isArmingDisabled());
    EXPECT_EQ(0, getArmingDisableFlags());
}

TEST(ArmingPreventionTest, WhenUsingSwitched3DModeThenNormalThrottleArmingConditionApplies)
{
    // given
    simulationFeatureFlags = FEATURE_3D; // Using 3D mode
    simulationTime = 30e6; // 30 seconds after boot
    gyroCalibDone = true;

    // and
    modeActivationConditionsMutable(0)->auxChannelIndex = 0;
    modeActivationConditionsMutable(0)->modeId = BOXARM;
    modeActivationConditionsMutable(0)->range.startStep = CHANNEL_VALUE_TO_STEP(1750);
    modeActivationConditionsMutable(0)->range.endStep = CHANNEL_VALUE_TO_STEP(CHANNEL_RANGE_MAX);
    useRcControlsConfig(NULL);

    // and
    rxConfigMutable()->mincheck = 1050;

    // and
    rcData[THROTTLE] = 1000;
    ENABLE_STATE(SMALL_ANGLE);
    simulationHaveRx = true;

    // and
    // arm channel has a safe default value
    rcData[4] = 1100;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    // ok to arm in 3D mode
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_FALSE(isArmingDisabled());
    EXPECT_EQ(0, getArmingDisableFlags());

    // given
    // raise throttle to unsafe position
    rcData[THROTTLE] = 1500;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    // ok to arm in 3D mode
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_THROTTLE, getArmingDisableFlags());

    // given
    // attempt to arm
    rcData[4] = 1800;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_THROTTLE | ARMING_DISABLED_ARM_SWITCH, getArmingDisableFlags());

    // given
    // throttle moved low
    rcData[THROTTLE] = 1000;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_TRUE(isArmingDisabled());
    EXPECT_EQ(ARMING_DISABLED_ARM_SWITCH, getArmingDisableFlags());

    // given
    // arm switch turned off
    rcData[4] = 1000;

    // when
    updateActivatedModes();
    updateArmingStatus();

    // expect
    EXPECT_FALSE(isUsingSticksForArming());
    EXPECT_FALSE(isArmingDisabled());
    EXPECT_EQ(0, getArmingDisableFlags());
}

// STUBS
extern "C" {
    uint32_t micros(void) { return simulationTime; }
    uint32_t millis(void) { return micros() / 1000; }
    bool rxIsReceivingSignal(void) { return simulationHaveRx; }

    bool feature(uint32_t f) { return simulationFeatureFlags & f; }
    void warningLedFlash(void) {}
    void warningLedDisable(void) {}
    void warningLedUpdate(void) {}
    void beeper(beeperMode_e) {}
    void beeperConfirmationBeeps(uint8_t) {}
    void beeperWarningBeeps(uint8_t) {}
    void beeperSilence(void) {}
    void systemBeep(bool) {}
    void saveConfigAndNotify(void) {}
    void blackboxFinish(void) {}
    bool isAccelerationCalibrationComplete(void) { return true; }
    bool isBaroCalibrationComplete(void) { return true; }
    bool isGyroCalibrationComplete(void) { return gyroCalibDone; }
    void gyroStartCalibration(bool) {}
    bool isFirstArmingGyroCalibrationRunning(void) { return false; }
    void pidController(const pidProfile_t *, const rollAndPitchTrims_t *, timeUs_t) {}
    void pidStabilisationState(pidStabilisationState_e) {}
    void mixTable(uint8_t) {};
    void writeMotors(void) {};
    void writeServos(void) {};
    void calculateRxChannelsAndUpdateFailsafe(timeUs_t) {}
    bool isMixerUsingServos(void) { return false; }
    void gyroUpdate(timeUs_t) {}
    timeDelta_t getTaskDeltaTime(cfTaskId_e) { return 0; }
    void updateRSSI(timeUs_t) {}
    bool failsafeIsMonitoring(void) { return false; }
    void failsafeStartMonitoring(void) {}
    void failsafeUpdateState(void) {}
    bool failsafeIsActive(void) { return false; }
    void pidResetErrorGyroState(void) {}
    void updateAdjustmentStates(void) {}
    void processRcAdjustments(controlRateConfig_t *) {}
    void updateGpsWaypointsAndMode(void) {}
    void releaseSharedTelemetryPorts(void) {}
    void telemetryCheckState(void) {}
    void mspSerialAllocatePorts(void) {}
    void gyroReadTemperature(void) {}
    void updateRcCommands(void) {}
    void applyAltHold(void) {}
    void resetYawAxis(void) {}
    int16_t calculateThrottleAngleCorrection(uint8_t) { return 0; }
    void processRcCommand(void) {}
    void updateGpsStateForHomeAndHoldMode(void) {}
    void blackboxUpdate(timeUs_t) {}
    void transponderUpdate(timeUs_t) {}
    void GPS_reset_home_position(void) {}
    void accSetCalibrationCycles(uint16_t) {}
    void baroSetCalibrationCycles(uint16_t) {}
    void changePidProfile(uint8_t) {}
    void dashboardEnablePageCycling(void) {}
    void dashboardDisablePageCycling(void) {}
    bool imuQuaternionHeadfreeOffsetSet(void) { return true; }
}
