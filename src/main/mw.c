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
#include <stdlib.h>
#include <stdint.h>
#include <math.h>

#include <platform.h>
#include "scheduler.h"
#include "debug.h"

#include "common/maths.h"
#include "common/axis.h"
#include "common/color.h"
#include "common/utils.h"
#include "common/filter.h"

#include "drivers/sensor.h"
#include "drivers/accgyro.h"
#include "drivers/compass.h"
#include "drivers/light_led.h"

#include "drivers/gpio.h"
#include "drivers/system.h"
#include "drivers/serial.h"
#include "drivers/timer.h"
#include "drivers/pwm_rx.h"
#include "drivers/gyro_sync.h"

#include "io/rc_controls.h"

#include "sensors/sensors.h"
#include "sensors/boardalignment.h"
#include "sensors/sonar.h"
#include "sensors/compass.h"
#include "sensors/acceleration.h"
#include "sensors/barometer.h"
#include "sensors/gyro.h"
#include "sensors/battery.h"

#include "io/beeper.h"
#include "io/display.h"
#include "io/escservo.h"
#include "io/rc_curves.h"
#include "io/gimbal.h"
#include "io/gps.h"
#include "io/ledstrip.h"
#include "io/serial.h"
#include "io/serial_cli.h"
#include "io/serial_msp.h"
#include "io/statusindicator.h"
#include "io/asyncfatfs/asyncfatfs.h"
#include "io/transponder_ir.h"


#include "rx/rx.h"
#include "rx/msp.h"

#include "telemetry/telemetry.h"
#include "blackbox/blackbox.h"

#include "flight/mixer.h"
#include "flight/pid.h"
#include "flight/imu.h"
#include "flight/altitudehold.h"
#include "flight/failsafe.h"
#include "flight/gtune.h"
#include "flight/navigation.h"

#include "config/runtime_config.h"
#include "config/config.h"
#include "config/config_profile.h"
#include "config/config_master.h"

// June 2013     V2.2-dev

enum {
    ALIGN_GYRO = 0,
    ALIGN_ACCEL = 1,
    ALIGN_MAG = 2
};

/* VBAT monitoring interval (in microseconds) - 1s*/
#define VBATINTERVAL (6 * 3500)
/* IBat monitoring interval (in microseconds) - 6 default looptimes */
#define IBATINTERVAL (6 * 3500)
#define GYRO_WATCHDOG_DELAY 100  // Watchdog for boards without interrupt for gyro

uint16_t cycleTime = 0;         // this is the number in micro second to achieve a full loop, it can differ a little and is taken into account in the PID loop

float dT;

int16_t magHold;
int16_t headFreeModeHold;

uint8_t motorControlEnable = false;

int16_t telemTemperature1;      // gyro sensor temperature
static uint32_t disarmAt;     // Time of automatic disarm when "Don't spin the motors when armed" is enabled and auto_disarm_delay is nonzero

extern uint32_t currentTime;
extern uint8_t dynP8[3], dynI8[3], dynD8[3], PIDweight[3];

static bool isRXDataNew;
static filterStatePt1_t filteredCycleTimeState;
uint16_t filteredCycleTime;

typedef void (*pidControllerFuncPtr)(pidProfile_t *pidProfile, controlRateConfig_t *controlRateConfig,
        uint16_t max_angle_inclination, rollAndPitchTrims_t *angleTrim, rxConfig_t *rxConfig);            // pid controller function prototype

extern pidControllerFuncPtr pid_controller;

void applyAndSaveAccelerometerTrimsDelta(rollAndPitchTrims_t *rollAndPitchTrimsDelta)
{
    currentProfile->accelerometerTrims.values.roll += rollAndPitchTrimsDelta->values.roll;
    currentProfile->accelerometerTrims.values.pitch += rollAndPitchTrimsDelta->values.pitch;

    saveConfigAndNotify();
}

#ifdef GTUNE

void updateGtuneState(void)
{
    static bool GTuneWasUsed = false;

    if (IS_RC_MODE_ACTIVE(BOXGTUNE)) {
        if (!FLIGHT_MODE(GTUNE_MODE) && ARMING_FLAG(ARMED)) {
            ENABLE_FLIGHT_MODE(GTUNE_MODE);
            init_Gtune(&currentProfile->pidProfile);
            GTuneWasUsed = true;
        }
        if (!FLIGHT_MODE(GTUNE_MODE) && !ARMING_FLAG(ARMED) && GTuneWasUsed) {
            saveConfigAndNotify();
            GTuneWasUsed = false;
        }
    } else {
        if (FLIGHT_MODE(GTUNE_MODE) && ARMING_FLAG(ARMED)) {
            DISABLE_FLIGHT_MODE(GTUNE_MODE);
        }
    }
}
#endif

bool isCalibrating()
{
#ifdef BARO
    if (sensors(SENSOR_BARO) && !isBaroCalibrationComplete()) {
        return true;
    }
#endif

    // Note: compass calibration is handled completely differently, outside of the main loop, see f.CALIBRATE_MAG

    return (!isAccelerationCalibrationComplete() && sensors(SENSOR_ACC)) || (!isGyroCalibrationComplete());
}

void annexCode(void)
{
    int32_t tmp, tmp2;
    int32_t axis, prop1 = 0, prop2;

    // PITCH & ROLL only dynamic PID adjustment,  depending on throttle value
    if (rcData[THROTTLE] < currentControlRateProfile->tpa_breakpoint) {
        prop2 = 100;
    } else {
        if (rcData[THROTTLE] < 2000) {
            prop2 = 100 - (uint16_t)currentControlRateProfile->dynThrPID * (rcData[THROTTLE] - currentControlRateProfile->tpa_breakpoint) / (2000 - currentControlRateProfile->tpa_breakpoint);
        } else {
            prop2 = 100 - currentControlRateProfile->dynThrPID;
        }
    }

    for (axis = 0; axis < 3; axis++) {
        tmp = MIN(ABS(rcData[axis] - masterConfig.rxConfig.midrc), 500);
        if (axis == ROLL || axis == PITCH) {
            if (currentProfile->rcControlsConfig.deadband) {
                if (tmp > currentProfile->rcControlsConfig.deadband) {
                    tmp -= currentProfile->rcControlsConfig.deadband;
                } else {
                    tmp = 0;
                }
            }

            tmp2 = tmp / 100;
            rcCommand[axis] = lookupPitchRollRC[tmp2] + (tmp - tmp2 * 100) * (lookupPitchRollRC[tmp2 + 1] - lookupPitchRollRC[tmp2]) / 100;
            prop1 = 100 - (uint16_t)currentControlRateProfile->rates[axis] * tmp / 500;
            prop1 = (uint16_t)prop1 * prop2 / 100;
        } else if (axis == YAW) {
            if (currentProfile->rcControlsConfig.yaw_deadband) {
                if (tmp > currentProfile->rcControlsConfig.yaw_deadband) {
                    tmp -= currentProfile->rcControlsConfig.yaw_deadband;
                } else {
                    tmp = 0;
                }
            }
            tmp2 = tmp / 100;
            rcCommand[axis] = (lookupYawRC[tmp2] + (tmp - tmp2 * 100) * (lookupYawRC[tmp2 + 1] - lookupYawRC[tmp2]) / 100) * -masterConfig.yaw_control_direction;
            prop1 = 100 - (uint16_t)currentControlRateProfile->rates[axis] * ABS(tmp) / 500;
        }
        // FIXME axis indexes into pids.  use something like lookupPidIndex(rc_alias_e alias) to reduce coupling.
        dynP8[axis] = (uint16_t)currentProfile->pidProfile.P8[axis] * prop1 / 100;
        dynI8[axis] = (uint16_t)currentProfile->pidProfile.I8[axis] * prop1 / 100;
        dynD8[axis] = (uint16_t)currentProfile->pidProfile.D8[axis] * prop1 / 100;

        // non coupled PID reduction scaler used in PID controller 1 and PID controller 2. YAW TPA disabled. 100 means 100% of the pids
        if (axis == YAW) {
            PIDweight[axis] = 100;
        }
        else {
            PIDweight[axis] = prop2;
        }

        if (rcData[axis] < masterConfig.rxConfig.midrc)
            rcCommand[axis] = -rcCommand[axis];
    }

    tmp = constrain(rcData[THROTTLE], masterConfig.rxConfig.mincheck, PWM_RANGE_MAX);
    tmp = (uint32_t)(tmp - masterConfig.rxConfig.mincheck) * PWM_RANGE_MIN / (PWM_RANGE_MAX - masterConfig.rxConfig.mincheck);       // [MINCHECK;2000] -> [0;1000]
    tmp2 = tmp / 100;
    rcCommand[THROTTLE] = lookupThrottleRC[tmp2] + (tmp - tmp2 * 100) * (lookupThrottleRC[tmp2 + 1] - lookupThrottleRC[tmp2]) / 100;    // [0;1000] -> expo -> [MINTHROTTLE;MAXTHROTTLE]

    if (FLIGHT_MODE(HEADFREE_MODE)) {
        float radDiff = degreesToRadians(DECIDEGREES_TO_DEGREES(attitude.values.yaw) - headFreeModeHold);
        float cosDiff = cos_approx(radDiff);
        float sinDiff = sin_approx(radDiff);
        int16_t rcCommand_PITCH = rcCommand[PITCH] * cosDiff + rcCommand[ROLL] * sinDiff;
        rcCommand[ROLL] = rcCommand[ROLL] * cosDiff - rcCommand[PITCH] * sinDiff;
        rcCommand[PITCH] = rcCommand_PITCH;
    }

    if (ARMING_FLAG(ARMED)) {
        LED0_ON;
    } else {
        if (IS_RC_MODE_ACTIVE(BOXARM) == 0) {
            ENABLE_ARMING_FLAG(OK_TO_ARM);
        }

        if (!STATE(SMALL_ANGLE)) {
            DISABLE_ARMING_FLAG(OK_TO_ARM);
        }

        if (isCalibrating() || isSystemOverloaded()) {
            warningLedFlash();
            DISABLE_ARMING_FLAG(OK_TO_ARM);
        } else {
            if (ARMING_FLAG(OK_TO_ARM)) {
                warningLedDisable();
            } else {
                warningLedFlash();
            }
        }

        warningLedUpdate();
    }

    // Read out gyro temperature. can use it for something somewhere. maybe get MCU temperature instead? lots of fun possibilities.
    if (gyro.temperature)
        gyro.temperature(&telemTemperature1);
}

void mwDisarm(void)
{
    if (ARMING_FLAG(ARMED)) {
        DISABLE_ARMING_FLAG(ARMED);

#ifdef BLACKBOX
        if (feature(FEATURE_BLACKBOX)) {
            finishBlackbox();
        }
#endif

        beeper(BEEPER_DISARMING);      // emit disarm tone
    }
}

#define TELEMETRY_FUNCTION_MASK (FUNCTION_TELEMETRY_FRSKY | FUNCTION_TELEMETRY_HOTT | FUNCTION_TELEMETRY_SMARTPORT | FUNCTION_TELEMETRY_LTM)

void releaseSharedTelemetryPorts(void) {
    serialPort_t *sharedPort = findSharedSerialPort(TELEMETRY_FUNCTION_MASK, FUNCTION_MSP);
    while (sharedPort) {
        mspReleasePortIfAllocated(sharedPort);
        sharedPort = findNextSharedSerialPort(TELEMETRY_FUNCTION_MASK, FUNCTION_MSP);
    }
}

void mwArm(void)
{
    if (ARMING_FLAG(OK_TO_ARM)) {
        if (ARMING_FLAG(ARMED)) {
            return;
        }
        if (IS_RC_MODE_ACTIVE(BOXFAILSAFE)) {
            return;
        }
        if (!ARMING_FLAG(PREVENT_ARMING)) {
            ENABLE_ARMING_FLAG(ARMED);
            headFreeModeHold = DECIDEGREES_TO_DEGREES(attitude.values.yaw);

#ifdef BLACKBOX
            if (feature(FEATURE_BLACKBOX)) {
                serialPort_t *sharedBlackboxAndMspPort = findSharedSerialPort(FUNCTION_BLACKBOX, FUNCTION_MSP);
                if (sharedBlackboxAndMspPort) {
                    mspReleasePortIfAllocated(sharedBlackboxAndMspPort);
                }
                startBlackbox();
            }
#endif
            disarmAt = millis() + masterConfig.auto_disarm_delay * 1000;   // start disarm timeout, will be extended when throttle is nonzero

            //beep to indicate arming
#ifdef GPS
            if (feature(FEATURE_GPS) && STATE(GPS_FIX) && GPS_numSat >= 5)
                beeper(BEEPER_ARMING_GPS_FIX);
            else
                beeper(BEEPER_ARMING);
#else
            beeper(BEEPER_ARMING);
#endif

            return;
        }
    }

    if (!ARMING_FLAG(ARMED)) {
        beeperConfirmationBeeps(1);
    }
}

// Automatic ACC Offset Calibration
bool AccInflightCalibrationArmed = false;
bool AccInflightCalibrationMeasurementDone = false;
bool AccInflightCalibrationSavetoEEProm = false;
bool AccInflightCalibrationActive = false;
uint16_t InflightcalibratingA = 0;

void handleInflightCalibrationStickPosition(void)
{
    if (AccInflightCalibrationMeasurementDone) {
        // trigger saving into eeprom after landing
        AccInflightCalibrationMeasurementDone = false;
        AccInflightCalibrationSavetoEEProm = true;
    } else {
        AccInflightCalibrationArmed = !AccInflightCalibrationArmed;
        if (AccInflightCalibrationArmed) {
            beeper(BEEPER_ACC_CALIBRATION);
        } else {
            beeper(BEEPER_ACC_CALIBRATION_FAIL);
        }
    }
}

void updateInflightCalibrationState(void)
{
    if (AccInflightCalibrationArmed && ARMING_FLAG(ARMED) && rcData[THROTTLE] > masterConfig.rxConfig.mincheck && !IS_RC_MODE_ACTIVE(BOXARM)) {   // Copter is airborne and you are turning it off via boxarm : start measurement
        InflightcalibratingA = 50;
        AccInflightCalibrationArmed = false;
    }
    if (IS_RC_MODE_ACTIVE(BOXCALIB)) {      // Use the Calib Option to activate : Calib = TRUE measurement started, Land and Calib = 0 measurement stored
        if (!AccInflightCalibrationActive && !AccInflightCalibrationMeasurementDone)
            InflightcalibratingA = 50;
        AccInflightCalibrationActive = true;
    } else if (AccInflightCalibrationMeasurementDone && !ARMING_FLAG(ARMED)) {
        AccInflightCalibrationMeasurementDone = false;
        AccInflightCalibrationSavetoEEProm = true;
    }
}

void updateMagHold(void)
{
    if (ABS(rcCommand[YAW]) < 15 && FLIGHT_MODE(MAG_MODE)) {
        int16_t dif = DECIDEGREES_TO_DEGREES(attitude.values.yaw) - magHold;
        if (dif <= -180)
            dif += 360;
        if (dif >= +180)
            dif -= 360;
        dif *= -masterConfig.yaw_control_direction;
        if (STATE(SMALL_ANGLE))
            rcCommand[YAW] -= dif * currentProfile->pidProfile.P8[PIDMAG] / 30;    // 18 deg
    } else
        magHold = DECIDEGREES_TO_DEGREES(attitude.values.yaw);
}

void processRx(void)
{
    static bool armedBeeperOn = false;

    calculateRxChannelsAndUpdateFailsafe(currentTime);

    // in 3D mode, we need to be able to disarm by switch at any time
    if (feature(FEATURE_3D)) {
        if (!IS_RC_MODE_ACTIVE(BOXARM))
            mwDisarm();
    }

    updateRSSI(currentTime);

    if (feature(FEATURE_FAILSAFE)) {

        if (currentTime > FAILSAFE_POWER_ON_DELAY_US && !failsafeIsMonitoring()) {
            failsafeStartMonitoring();
        }

        failsafeUpdateState();
    }

    throttleStatus_e throttleStatus = calculateThrottleStatus(&masterConfig.rxConfig, masterConfig.flight3DConfig.deadband3d_throttle);
    rollPitchStatus_e rollPitchStatus =  calculateRollPitchCenterStatus(&masterConfig.rxConfig);

    /* In airmode Iterm should be prevented to grow when Low thottle and Roll + Pitch Centered.
     This is needed to prevent Iterm winding on the ground, but keep full stabilisation on 0 throttle while in air
     Low Throttle + roll and Pitch centered is assuming the copter is on the ground. Done to prevent complex air/ground detections */
    if (throttleStatus == THROTTLE_LOW) {
        if (IS_RC_MODE_ACTIVE(BOXAIRMODE) && !failsafeIsActive() && ARMING_FLAG(ARMED)) {
            if (rollPitchStatus == CENTERED) {
                ENABLE_STATE(ANTI_WINDUP);
            } else {
                DISABLE_STATE(ANTI_WINDUP);
            }
        } else {
            pidResetErrorAngle();
            pidResetErrorGyro();
        }
    } else {
        DISABLE_STATE(ANTI_WINDUP);
    }

    // When armed and motors aren't spinning, do beeps and then disarm
    // board after delay so users without buzzer won't lose fingers.
    // mixTable constrains motor commands, so checking  throttleStatus is enough
    if (ARMING_FLAG(ARMED)
        && feature(FEATURE_MOTOR_STOP)
        && !STATE(FIXED_WING)
    ) {
        if (isUsingSticksForArming()) {
            if (throttleStatus == THROTTLE_LOW) {
                if (masterConfig.auto_disarm_delay != 0
                    && (int32_t)(disarmAt - millis()) < 0
                ) {
                    // auto-disarm configured and delay is over
                    mwDisarm();
                    armedBeeperOn = false;
                } else {
                    // still armed; do warning beeps while armed
                    beeper(BEEPER_ARMED);
                    armedBeeperOn = true;
                }
            } else {
                // throttle is not low
                if (masterConfig.auto_disarm_delay != 0) {
                    // extend disarm time
                    disarmAt = millis() + masterConfig.auto_disarm_delay * 1000;
                }

                if (armedBeeperOn) {
                    beeperSilence();
                    armedBeeperOn = false;
                }
            }
        } else {
            // arming is via AUX switch; beep while throttle low
            if (throttleStatus == THROTTLE_LOW) {
                beeper(BEEPER_ARMED);
                armedBeeperOn = true;
            } else if (armedBeeperOn) {
                beeperSilence();
                armedBeeperOn = false;
            }
        }
    }

    processRcStickPositions(&masterConfig.rxConfig, throttleStatus, masterConfig.retarded_arm, masterConfig.disarm_kill_switch);

    if (feature(FEATURE_INFLIGHT_ACC_CAL)) {
        updateInflightCalibrationState();
    }

    updateActivatedModes(currentProfile->modeActivationConditions);

    if (!cliMode) {
        updateAdjustmentStates(currentProfile->adjustmentRanges);
        processRcAdjustments(currentControlRateProfile, &masterConfig.rxConfig);
    }

    bool canUseHorizonMode = true;

    if ((IS_RC_MODE_ACTIVE(BOXANGLE) || (feature(FEATURE_FAILSAFE) && failsafeIsActive())) && (sensors(SENSOR_ACC))) {
        // bumpless transfer to Level mode
        canUseHorizonMode = false;

        if (!FLIGHT_MODE(ANGLE_MODE)) {
            pidResetErrorAngle();
            ENABLE_FLIGHT_MODE(ANGLE_MODE);
        }
    } else {
        DISABLE_FLIGHT_MODE(ANGLE_MODE); // failsafe support
    }

    if (IS_RC_MODE_ACTIVE(BOXHORIZON) && canUseHorizonMode) {

        DISABLE_FLIGHT_MODE(ANGLE_MODE);

        if (!FLIGHT_MODE(HORIZON_MODE)) {
            pidResetErrorAngle();
            ENABLE_FLIGHT_MODE(HORIZON_MODE);
        }
    } else {
        DISABLE_FLIGHT_MODE(HORIZON_MODE);
    }

    if (FLIGHT_MODE(ANGLE_MODE) || FLIGHT_MODE(HORIZON_MODE)) {
        LED1_ON;
    } else {
        LED1_OFF;
    }

#ifdef  MAG
    if (sensors(SENSOR_ACC) || sensors(SENSOR_MAG)) {
        if (IS_RC_MODE_ACTIVE(BOXMAG)) {
            if (!FLIGHT_MODE(MAG_MODE)) {
                ENABLE_FLIGHT_MODE(MAG_MODE);
                magHold = DECIDEGREES_TO_DEGREES(attitude.values.yaw);
            }
        } else {
            DISABLE_FLIGHT_MODE(MAG_MODE);
        }
        if (IS_RC_MODE_ACTIVE(BOXHEADFREE)) {
            if (!FLIGHT_MODE(HEADFREE_MODE)) {
                ENABLE_FLIGHT_MODE(HEADFREE_MODE);
            }
        } else {
            DISABLE_FLIGHT_MODE(HEADFREE_MODE);
        }
        if (IS_RC_MODE_ACTIVE(BOXHEADADJ)) {
            headFreeModeHold = DECIDEGREES_TO_DEGREES(attitude.values.yaw); // acquire new heading
        }
    }
#endif

#ifdef GPS
    if (sensors(SENSOR_GPS)) {
        updateGpsWaypointsAndMode();
    }
#endif

    if (IS_RC_MODE_ACTIVE(BOXPASSTHRU)) {
        ENABLE_FLIGHT_MODE(PASSTHRU_MODE);
    } else {
        DISABLE_FLIGHT_MODE(PASSTHRU_MODE);
    }

    if (masterConfig.mixerMode == MIXER_FLYING_WING || masterConfig.mixerMode == MIXER_AIRPLANE) {
        DISABLE_FLIGHT_MODE(HEADFREE_MODE);
    }

#ifdef TELEMETRY
    if (feature(FEATURE_TELEMETRY)) {
        if ((!masterConfig.telemetryConfig.telemetry_switch && ARMING_FLAG(ARMED)) ||
                (masterConfig.telemetryConfig.telemetry_switch && IS_RC_MODE_ACTIVE(BOXTELEMETRY))) {

            releaseSharedTelemetryPorts();
        } else {
            // the telemetry state must be checked immediately so that shared serial ports are released.
            telemetryCheckState();
            mspAllocateSerialPorts(&masterConfig.serialConfig);
        }
    }
#endif

}

void filterRc(void){
    static int16_t lastCommand[4] = { 0, 0, 0, 0 };
    static int16_t deltaRC[4] = { 0, 0, 0, 0 };
    static int16_t factor, rcInterpolationFactor;
    uint16_t rxRefreshRate;

    // Set RC refresh rate for sampling and channels to filter
    initRxRefreshRate(&rxRefreshRate);

    rcInterpolationFactor = rxRefreshRate / filteredCycleTime + 1;

    if (isRXDataNew) {
        for (int channel=0; channel < 4; channel++) {
            deltaRC[channel] = rcCommand[channel] -  (lastCommand[channel] - deltaRC[channel] * factor / rcInterpolationFactor);
            lastCommand[channel] = rcCommand[channel];
        }

        isRXDataNew = false;
        factor = rcInterpolationFactor - 1;
    } else {
        factor--;
    }

    // Interpolate steps of rcCommand
    if (factor > 0) {
        for (int channel=0; channel < 4; channel++) {
            rcCommand[channel] = lastCommand[channel] - deltaRC[channel] * factor/rcInterpolationFactor;
         }
    } else {
        factor = 0;
    }
}

#if defined(BARO) || defined(SONAR)
static bool haveProcessedAnnexCodeOnce = false;
#endif

void taskMainPidLoop(void)
{
    cycleTime = getTaskDeltaTime(TASK_SELF);
    dT = (float)cycleTime * 0.000001f;

    // Calculate average cycle time and average jitter
    filteredCycleTime = filterApplyPt1(cycleTime, &filteredCycleTimeState, 1, dT);
    
    debug[0] = cycleTime;
    debug[1] = cycleTime - filteredCycleTime;

    imuUpdateGyroAndAttitude();

    annexCode();

    if (masterConfig.rxConfig.rcSmoothing) {
        filterRc();
    }

#if defined(BARO) || defined(SONAR)
    haveProcessedAnnexCodeOnce = true;
#endif

#ifdef MAG
        if (sensors(SENSOR_MAG)) {
            updateMagHold();
        }
#endif

#if defined(BARO) || defined(SONAR)
        if (sensors(SENSOR_BARO) || sensors(SENSOR_SONAR)) {
            if (FLIGHT_MODE(BARO_MODE) || FLIGHT_MODE(SONAR_MODE)) {
                applyAltHold(&masterConfig.airplaneConfig);
            }
        }
#endif

    // If we're armed, at minimum throttle, and we do arming via the
    // sticks, do not process yaw input from the rx.  We do this so the
    // motors do not spin up while we are trying to arm or disarm.
    // Allow yaw control for tricopters if the user wants the servo to move even when unarmed.
    if (isUsingSticksForArming() && rcData[THROTTLE] <= masterConfig.rxConfig.mincheck
#ifndef USE_QUAD_MIXER_ONLY
#ifdef USE_SERVOS
                && !((masterConfig.mixerMode == MIXER_TRI || masterConfig.mixerMode == MIXER_CUSTOM_TRI) && masterConfig.mixerConfig.tri_unarmed_servo)
#endif
                && masterConfig.mixerMode != MIXER_AIRPLANE
                && masterConfig.mixerMode != MIXER_FLYING_WING
#endif
    ) {
        rcCommand[YAW] = 0;
    }

    if (currentProfile->throttle_correction_value && (FLIGHT_MODE(ANGLE_MODE) || FLIGHT_MODE(HORIZON_MODE))) {
        rcCommand[THROTTLE] += calculateThrottleAngleCorrection(currentProfile->throttle_correction_value);
    }

#ifdef GPS
    if (sensors(SENSOR_GPS)) {
        if ((FLIGHT_MODE(GPS_HOME_MODE) || FLIGHT_MODE(GPS_HOLD_MODE)) && STATE(GPS_FIX_HOME)) {
            updateGpsStateForHomeAndHoldMode();
        }
    }
#endif

    // PID - note this is function pointer set by setPIDController()
    pid_controller(
        &currentProfile->pidProfile,
        currentControlRateProfile,
        masterConfig.max_angle_inclination,
        &currentProfile->accelerometerTrims,
        &masterConfig.rxConfig
    );

    mixTable();

#ifdef USE_SERVOS
    filterServos();
    writeServos();
#endif

    if (motorControlEnable) {
        writeMotors();
    }

#ifdef USE_SDCARD
        afatfs_poll();
#endif

#ifdef BLACKBOX
    if (!cliMode && feature(FEATURE_BLACKBOX)) {
        handleBlackbox();
    }
#endif
}

// Function for loop trigger
void taskMainPidLoopChecker(void) {
    // getTaskDeltaTime() returns delta time freezed at the moment of entering the scheduler. currentTime is freezed at the very same point. 
    // To make busy-waiting timeout work we need to account for time spent within busy-waiting loop
    uint32_t currentDeltaTime = getTaskDeltaTime(TASK_SELF);

    if (masterConfig.gyroSync) {
        while (1) {
            if (gyroSyncCheckUpdate() || ((currentDeltaTime + (micros() - currentTime)) >= (targetLooptime + GYRO_WATCHDOG_DELAY))) {
                break;
            }
        }
    }

    taskMainPidLoop();
}

void taskUpdateAccelerometer(void)
{
    imuUpdateAccelerometer(&currentProfile->accelerometerTrims);
}

void taskHandleSerial(void)
{
    handleSerial();
}

#ifdef BEEPER
void taskUpdateBeeper(void)
{
    beeperUpdate();          //call periodic beeper handler
}
#endif

void taskUpdateBattery(void)
{
    static uint32_t vbatLastServiced = 0;
    static uint32_t ibatLastServiced = 0;

    if (feature(FEATURE_VBAT)) {
        if (cmp32(currentTime, vbatLastServiced) >= VBATINTERVAL) {
            vbatLastServiced = currentTime;
            updateBattery();
        }
    }

    if (feature(FEATURE_CURRENT_METER)) {
        int32_t ibatTimeSinceLastServiced = cmp32(currentTime, ibatLastServiced);

        if (ibatTimeSinceLastServiced >= IBATINTERVAL) {
            ibatLastServiced = currentTime;

            throttleStatus_e throttleStatus = calculateThrottleStatus(&masterConfig.rxConfig, masterConfig.flight3DConfig.deadband3d_throttle);

            updateCurrentMeter(ibatTimeSinceLastServiced, throttleStatus);
        }
    }
}

bool taskUpdateRxCheck(uint32_t currentDeltaTime)
{
    UNUSED(currentDeltaTime);
    updateRx(currentTime);
    return shouldProcessRx(currentTime);
}

void taskUpdateRxMain(void)
{
    processRx();
    isRXDataNew = true;

#ifdef BARO
    // the 'annexCode' initialses rcCommand, updateAltHoldState depends on valid rcCommand data.
    if (haveProcessedAnnexCodeOnce) {
        if (sensors(SENSOR_BARO)) {
            updateAltHoldState();
        }
    }
#endif

#ifdef SONAR
    // the 'annexCode' initialses rcCommand, updateAltHoldState depends on valid rcCommand data.
    if (haveProcessedAnnexCodeOnce) {
        if (sensors(SENSOR_SONAR)) {
            updateSonarAltHoldState();
        }
    }
#endif
}

#ifdef GPS
void taskProcessGPS(void)
{
    // if GPS feature is enabled, gpsThread() will be called at some intervals to check for stuck
    // hardware, wrong baud rates, init GPS if needed, etc. Don't use SENSOR_GPS here as gpsThread() can and will
    // change this based on available hardware
    if (feature(FEATURE_GPS)) {
        gpsThread();
    }

    if (sensors(SENSOR_GPS)) {
        updateGpsIndicator(currentTime);
    }
}
#endif

#ifdef MAG
void taskUpdateCompass(void)
{
    if (sensors(SENSOR_MAG)) {
        updateCompass(&masterConfig.magZero);
    }
}
#endif

#ifdef BARO
void taskUpdateBaro(void)
{
    if (sensors(SENSOR_BARO)) {
        uint32_t newDeadline = baroUpdate();
        rescheduleTask(TASK_SELF, newDeadline);
    }
}
#endif

#ifdef SONAR
void taskUpdateSonar(void)
{
    if (sensors(SENSOR_SONAR)) {
        sonarUpdate();
    }
}
#endif

#if defined(BARO) || defined(SONAR)
void taskCalculateAltitude(void)
{
    if (false
#if defined(BARO)
        || (sensors(SENSOR_BARO) && isBaroReady())
#endif
#if defined(SONAR)
        || sensors(SENSOR_SONAR)
#endif
        ) {
        calculateEstimatedAltitude(currentTime);
    }}
#endif

#ifdef DISPLAY
void taskUpdateDisplay(void)
{
    if (feature(FEATURE_DISPLAY)) {
        updateDisplay();
    }
}
#endif

#ifdef TELEMETRY
void taskTelemetry(void)
{
    telemetryCheckState();

    if (!cliMode && feature(FEATURE_TELEMETRY)) {
        telemetryProcess(&masterConfig.rxConfig, masterConfig.flight3DConfig.deadband3d_throttle);
    }
}
#endif

#ifdef LED_STRIP
void taskLedStrip(void)
{
    if (feature(FEATURE_LED_STRIP)) {
        updateLedStrip();
    }
}
#endif

#ifdef TRANSPONDER
void taskTransponder(void)
{
    if (feature(FEATURE_TRANSPONDER)) {
        updateTransponder();
    }
}
#endif
