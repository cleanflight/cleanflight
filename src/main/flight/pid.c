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
#include <stdint.h>
#include <string.h>
#include <math.h>

#include <platform.h>

#include "build/build_config.h"
#include "build/debug.h"

#include "common/axis.h"
#include "common/maths.h"
#include "common/filter.h"

#include "config/config_reset.h"
#include "config/parameter_group.h"
#include "config/parameter_group_ids.h"

#include "drivers/sound_beeper.h"

#include "fc/fc_core.h"
#include "fc/fc_rc.h"

#include "fc/rc_controls.h"
#include "fc/runtime_config.h"

#include "flight/pid.h"
#include "flight/imu.h"
#include "flight/mixer.h"
#include "flight/navigation.h"

#include "sensors/gyro.h"
#include "sensors/acceleration.h"

uint32_t targetPidLooptime;
static bool pidStabilisationEnabled;

float axisPID_P[3], axisPID_I[3], axisPID_D[3];

static float dT;

PG_REGISTER_WITH_RESET_TEMPLATE(pidConfig_t, pidConfig, PG_PID_CONFIG, 0);

#ifdef STM32F10X
#define PID_PROCESS_DENOM_DEFAULT       1
#elif defined(USE_GYRO_SPI_MPU6000) || defined(USE_GYRO_SPI_MPU6500)  || defined(USE_GYRO_SPI_ICM20689)
#define PID_PROCESS_DENOM_DEFAULT       4
#else
#define PID_PROCESS_DENOM_DEFAULT       2
#endif
PG_RESET_TEMPLATE(pidConfig_t, pidConfig,
    .pid_process_denom = PID_PROCESS_DENOM_DEFAULT
);

PG_REGISTER_ARRAY_WITH_RESET_FN(pidProfile_t, MAX_PROFILE_COUNT, pidProfiles, PG_PID_PROFILE, 0);

void resetPidProfile(pidProfile_t *pidProfile)
{
    RESET_CONFIG(const pidProfile_t, pidProfile,
        .P8[ROLL] = 44,
        .I8[ROLL] = 40,
        .D8[ROLL] = 30,
        .P8[PITCH] = 58,
        .I8[PITCH] = 50,
        .D8[PITCH] = 35,
        .P8[YAW] = 70,
        .I8[YAW] = 45,
        .D8[YAW] = 20,
        .P8[PIDALT] = 50,
        .I8[PIDALT] = 0,
        .D8[PIDALT] = 0,
        .P8[PIDPOS] = 15,   // POSHOLD_P * 100,
        .I8[PIDPOS] = 0,    // POSHOLD_I * 100,
        .D8[PIDPOS] = 0,
        .P8[PIDPOSR] = 34,  // POSHOLD_RATE_P * 10,
        .I8[PIDPOSR] = 14,  // POSHOLD_RATE_I * 100,
        .D8[PIDPOSR] = 53,  // POSHOLD_RATE_D * 1000,
        .P8[PIDNAVR] = 25,  // NAV_P * 10,
        .I8[PIDNAVR] = 33,  // NAV_I * 100,
        .D8[PIDNAVR] = 83,  // NAV_D * 1000,
        .P8[PIDLEVEL] = 50,
        .I8[PIDLEVEL] = 50,
        .D8[PIDLEVEL] = 75,
        .P8[PIDMAG] = 40,
        .P8[PIDVEL] = 55,
        .I8[PIDVEL] = 55,
        .D8[PIDVEL] = 75,

        .pidSumLimit = PIDSUM_LIMIT,
        .pidSumLimitYaw = PIDSUM_LIMIT_YAW,
        .yaw_lpf_hz = 0,
        .itermWindupPointPercent = 50,
        .dterm_filter_type = FILTER_BIQUAD,
        .dterm_lpf_hz = 100,    // filtering ON by default
        .dterm_notch_hz = 260,
        .dterm_notch_cutoff = 160,
        .vbatPidCompensation = 0,
        .pidAtMinThrottle = PID_STABILISATION_ON,
        .levelAngleLimit = 55,
        .levelSensitivity = 55,
        .setpointRelaxRatio = 100,
        .dtermSetpointWeight = 60,
        .yawRateAccelLimit = 100,
        .rateAccelLimit = 0,
        .itermThrottleThreshold = 350,
        .itermAcceleratorGain = 1000,
        .crash_time = 500,          // 500ms
        .crash_recovery_angle = 10, //  10 degrees
        .crash_recovery_rate = 100, // 100 degrees/second
        .crash_dthreshold = 50,     //  50 degrees/second/second
        .crash_gthreshold = 200,    // 200 degrees/second
        .crash_recovery = PID_CRASH_RECOVERY_OFF, // off by default
        .horizon_tilt_effect = 75,
        .horizon_tilt_expert_mode = false
    );
}

void pgResetFn_pidProfiles(pidProfile_t *pidProfiles)
{
    for (int i = 0; i < MAX_PROFILE_COUNT; i++) {
        resetPidProfile(&pidProfiles[i]);
    }
}

void pidSetTargetLooptime(uint32_t pidLooptime)
{
    targetPidLooptime = pidLooptime;
    dT = (float)targetPidLooptime * 0.000001f;
}

void pidResetErrorGyroState(void)
{
    for (int axis = 0; axis < 3; axis++) {
        axisPID_I[axis] = 0.0f;
    }
}

static float itermAccelerator = 1.0f;

void pidSetItermAccelerator(float newItermAccelerator) {
    itermAccelerator = newItermAccelerator;
}

void pidStabilisationState(pidStabilisationState_e pidControllerState)
{
    pidStabilisationEnabled = (pidControllerState == PID_STABILISATION_ON) ? true : false;
}

const angle_index_t rcAliasToAngleIndexMap[] = { AI_ROLL, AI_PITCH };

static filterApplyFnPtr dtermNotchFilterApplyFn;
static void *dtermFilterNotch[2];
static filterApplyFnPtr dtermLpfApplyFn;
static void *dtermFilterLpf[2];
static filterApplyFnPtr ptermYawFilterApplyFn;
static void *ptermYawFilter;

void pidInitFilters(const pidProfile_t *pidProfile)
{
    static biquadFilter_t biquadFilterNotch[2];
    static pt1Filter_t pt1Filter[2];
    static biquadFilter_t biquadFilter[2];
    static firFilterDenoise_t denoisingFilter[2];
    static pt1Filter_t pt1FilterYaw;

    uint32_t pidFrequencyNyquist = (1.0f / dT) / 2; // No rounding needed

    BUILD_BUG_ON(FD_YAW != 2); // only setting up Dterm filters on roll and pitch axes, so ensure yaw axis is 2

    if (pidProfile->dterm_notch_hz == 0 || pidProfile->dterm_notch_hz > pidFrequencyNyquist) {
        dtermNotchFilterApplyFn = nullFilterApply;
    } else {
        dtermNotchFilterApplyFn = (filterApplyFnPtr)biquadFilterApply;
        const float notchQ = filterGetNotchQ(pidProfile->dterm_notch_hz, pidProfile->dterm_notch_cutoff);
        for (int axis = FD_ROLL; axis <= FD_PITCH; axis++) {
            dtermFilterNotch[axis] = &biquadFilterNotch[axis];
            biquadFilterInit(dtermFilterNotch[axis], pidProfile->dterm_notch_hz, targetPidLooptime, notchQ, FILTER_NOTCH);
        }
    }

    if (pidProfile->dterm_lpf_hz == 0 || pidProfile->dterm_lpf_hz > pidFrequencyNyquist) {
        dtermLpfApplyFn = nullFilterApply;
    } else {
        switch (pidProfile->dterm_filter_type) {
        default:
            dtermLpfApplyFn = nullFilterApply;
            break;
        case FILTER_PT1:
            dtermLpfApplyFn = (filterApplyFnPtr)pt1FilterApply;
            for (int axis = FD_ROLL; axis <= FD_PITCH; axis++) {
                dtermFilterLpf[axis] = &pt1Filter[axis];
                pt1FilterInit(dtermFilterLpf[axis], pidProfile->dterm_lpf_hz, dT);
            }
            break;
        case FILTER_BIQUAD:
            dtermLpfApplyFn = (filterApplyFnPtr)biquadFilterApply;
            for (int axis = FD_ROLL; axis <= FD_PITCH; axis++) {
                dtermFilterLpf[axis] = &biquadFilter[axis];
                biquadFilterInitLPF(dtermFilterLpf[axis], pidProfile->dterm_lpf_hz, targetPidLooptime);
            }
            break;
        case FILTER_FIR:
            dtermLpfApplyFn = (filterApplyFnPtr)firFilterDenoiseUpdate;
            for (int axis = FD_ROLL; axis <= FD_PITCH; axis++) {
                dtermFilterLpf[axis] = &denoisingFilter[axis];
                firFilterDenoiseInit(dtermFilterLpf[axis], pidProfile->dterm_lpf_hz, targetPidLooptime);
            }
            break;
        }
    }

    if (pidProfile->yaw_lpf_hz == 0 || pidProfile->yaw_lpf_hz > pidFrequencyNyquist) {
        ptermYawFilterApplyFn = nullFilterApply;
    } else {
        ptermYawFilterApplyFn = (filterApplyFnPtr)pt1FilterApply;
        ptermYawFilter = &pt1FilterYaw;
        pt1FilterInit(ptermYawFilter, pidProfile->yaw_lpf_hz, dT);
    }
}

static float Kp[3], Ki[3], Kd[3], maxVelocity[3];
static float relaxFactor;
static float dtermSetpointWeight;
static float levelGain, horizonGain, horizonTransition, horizonCutoffDegrees,
             horizonFactorRatio, ITermWindupPoint, ITermWindupPointInv;
static uint8_t horizonTiltExpertMode;
static timeDelta_t crashTimeLimitUs;
static int32_t crashRecoveryAngleDeciDegrees;
static float crashRecoveryRate;
static float crashDtermThreshold;
static float crashGyroThreshold;

void pidInitConfig(const pidProfile_t *pidProfile) {
    for(int axis = FD_ROLL; axis <= FD_YAW; axis++) {
        Kp[axis] = PTERM_SCALE * pidProfile->P8[axis];
        Ki[axis] = ITERM_SCALE * pidProfile->I8[axis];
        Kd[axis] = DTERM_SCALE * pidProfile->D8[axis];
    }
    dtermSetpointWeight = pidProfile->dtermSetpointWeight / 127.0f;
    relaxFactor = 1.0f / (pidProfile->setpointRelaxRatio / 100.0f);
    levelGain = pidProfile->P8[PIDLEVEL] / 10.0f;
    horizonGain = pidProfile->I8[PIDLEVEL] / 10.0f;
    horizonTransition = (float)pidProfile->D8[PIDLEVEL];
    horizonTiltExpertMode = pidProfile->horizon_tilt_expert_mode;
    horizonCutoffDegrees = (175 - pidProfile->horizon_tilt_effect) * 1.8f;
    horizonFactorRatio = (100 - pidProfile->horizon_tilt_effect) * 0.01f;
    maxVelocity[FD_ROLL] = maxVelocity[FD_PITCH] = pidProfile->rateAccelLimit * 100 * dT;
    maxVelocity[FD_YAW] = pidProfile->yawRateAccelLimit * 100 * dT;
    ITermWindupPoint = (float)pidProfile->itermWindupPointPercent / 100.0f;
    ITermWindupPointInv = 1.0f / (1.0f - ITermWindupPoint);
    crashTimeLimitUs = pidProfile->crash_time * 1000;
    crashRecoveryAngleDeciDegrees = pidProfile->crash_recovery_angle * 10;
    crashRecoveryRate = pidProfile->crash_recovery_rate;
    crashGyroThreshold = pidProfile->crash_gthreshold;
    crashDtermThreshold = pidProfile->crash_dthreshold;
}

void pidInit(const pidProfile_t *pidProfile)
{
    pidSetTargetLooptime(gyro.targetLooptime * pidConfig()->pid_process_denom); // Initialize pid looptime
    pidInitFilters(pidProfile);
    pidInitConfig(pidProfile);
}

// calculates strength of horizon leveling; 0 = none, 1.0 = most leveling
static float calcHorizonLevelStrength() {
    // start with 1.0 at center stick, 0.0 at max stick deflection:
    float horizonLevelStrength = 1.0f -
             MAX(getRcDeflectionAbs(FD_ROLL), getRcDeflectionAbs(FD_PITCH));

    // 0 at level, 90 at vertical, 180 at inverted (degrees):
    const float currentInclination = MAX(ABS(attitude.values.roll),
                                        ABS(attitude.values.pitch)) / 10.0f;

    // horizonTiltExpertMode:  0 = leveling always active when sticks centered,
    //                         1 = leveling can be totally off when inverted
    if (horizonTiltExpertMode) {
        if (horizonTransition > 0 && horizonCutoffDegrees > 0) {
                    // if d_level > 0 and horizonTiltEffect < 175
            // horizonCutoffDegrees: 0 to 125 => 270 to 90 (represents where leveling goes to zero)
            // inclinationLevelRatio (0.0 to 1.0) is smaller (less leveling)
            //  for larger inclinations; 0.0 at horizonCutoffDegrees value:
            const float inclinationLevelRatio = constrainf(
                    (horizonCutoffDegrees-currentInclination) / horizonCutoffDegrees, 0, 1);
            // apply configured horizon sensitivity:
                // when stick is near center (horizonLevelStrength ~= 1.0)
                //  H_sensitivity value has little effect,
                // when stick is deflected (horizonLevelStrength near 0.0)
                //  H_sensitivity value has more effect:
            horizonLevelStrength = (horizonLevelStrength - 1) *
                    100 / horizonTransition + 1;
            // apply inclination ratio, which may lower leveling
            //  to zero regardless of stick position:
            horizonLevelStrength *= inclinationLevelRatio;
        }
        else  // d_level=0 or horizon_tilt_effect>=175 means no leveling
          horizonLevelStrength = 0;
    } else {  // horizon_tilt_expert_mode = 0 (leveling always active when sticks centered)
        float sensitFact;
        if (horizonFactorRatio < 1.01f) {   // if horizonTiltEffect > 0
            // horizonFactorRatio: 1.0 to 0.0 (larger means more leveling)
            // inclinationLevelRatio (0.0 to 1.0) is smaller (less leveling)
            //  for larger inclinations, goes to 1.0 at inclination==level:
            const float inclinationLevelRatio = (180-currentInclination)/180 *
                               (1.0f-horizonFactorRatio) + horizonFactorRatio;
            // apply ratio to configured horizon sensitivity:
            sensitFact = horizonTransition * inclinationLevelRatio;
        }
        else   // horizonTiltEffect=0 for "old" functionality
            sensitFact = horizonTransition;

        if (sensitFact <= 0) {           // zero means no leveling
            horizonLevelStrength = 0;
        } else {
            // when stick is near center (horizonLevelStrength ~= 1.0)
            //  sensitFact value has little effect,
            // when stick is deflected (horizonLevelStrength near 0.0)
            //  sensitFact value has more effect:
            horizonLevelStrength = ((horizonLevelStrength - 1) * (100 / sensitFact)) + 1;
        }
    }
    return constrainf(horizonLevelStrength, 0, 1);
}

static float pidLevel(int axis, const pidProfile_t *pidProfile, const rollAndPitchTrims_t *angleTrim, float currentPidSetpoint) {
    // calculate error angle and limit the angle to the max inclination
    float angle = pidProfile->levelSensitivity * getRcDeflection(axis);
#ifdef GPS
    angle += GPS_angle[axis];
#endif
    angle = constrainf(angle, -pidProfile->levelAngleLimit, pidProfile->levelAngleLimit);
    const float errorAngle = angle - ((attitude.raw[axis] - angleTrim->raw[axis]) / 10.0f);
    if (FLIGHT_MODE(ANGLE_MODE)) {
        // ANGLE mode - control is angle based, so control loop is needed
        currentPidSetpoint = errorAngle * levelGain;
    } else {
        // HORIZON mode - direct sticks control is applied to rate PID
        // mix up angle error to desired AngleRate to add a little auto-level feel
        const float horizonLevelStrength = calcHorizonLevelStrength();
        currentPidSetpoint = currentPidSetpoint + (errorAngle * horizonGain * horizonLevelStrength);
    }
    return currentPidSetpoint;
}

static float accelerationLimit(int axis, float currentPidSetpoint) {
    static float previousSetpoint[3];
    const float currentVelocity = currentPidSetpoint- previousSetpoint[axis];

    if(ABS(currentVelocity) > maxVelocity[axis])
        currentPidSetpoint = (currentVelocity > 0) ? previousSetpoint[axis] + maxVelocity[axis] : previousSetpoint[axis] - maxVelocity[axis];

    previousSetpoint[axis] = currentPidSetpoint;
    return currentPidSetpoint;
}

// Betaflight pid controller, which will be maintained in the future with additional features specialised for current (mini) multirotor usage.
// Based on 2DOF reference design (matlab)
void pidController(const pidProfile_t *pidProfile, const rollAndPitchTrims_t *angleTrim, timeUs_t currentTimeUs)
{
    static float previousRateError[2];
    const float tpaFactor = getThrottlePIDAttenuation();
    const float motorMixRange = getMotorMixRange();
    static bool inCrashRecoveryMode = false;
    static timeUs_t crashDetectedAtUs;

    // Dynamic ki component to gradually scale back integration when above windup point
    const float dynKi = MIN((1.0f - motorMixRange) * ITermWindupPointInv, 1.0f);

    // ----------PID controller----------
    for (int axis = FD_ROLL; axis <= FD_YAW; axis++) {
        float currentPidSetpoint = getSetpointRate(axis);

        if(maxVelocity[axis])
            currentPidSetpoint = accelerationLimit(axis, currentPidSetpoint);

        // Yaw control is GYRO based, direct sticks control is applied to rate PID
        if ((FLIGHT_MODE(ANGLE_MODE) || FLIGHT_MODE(HORIZON_MODE)) && axis != YAW) {
            currentPidSetpoint = pidLevel(axis, pidProfile, angleTrim, currentPidSetpoint);
        }

        if (inCrashRecoveryMode && axis != FD_YAW) {
            // self-level - errorAngle is deviation from horizontal
            const float errorAngle =  -(attitude.raw[axis] - angleTrim->raw[axis]) / 10.0f;
            currentPidSetpoint = errorAngle * levelGain;
            if (cmpTimeUs(currentTimeUs, crashDetectedAtUs) > crashTimeLimitUs
                || (motorMixRange < 1.0f
                       && ABS(attitude.raw[FD_ROLL] - angleTrim->raw[FD_ROLL]) < crashRecoveryAngleDeciDegrees
                       && ABS(attitude.raw[FD_PITCH] - angleTrim->raw[FD_PITCH]) < crashRecoveryAngleDeciDegrees
                       && ABS(gyro.gyroADCf[FD_ROLL]) < crashRecoveryRate
                       && ABS(gyro.gyroADCf[FD_PITCH]) < crashRecoveryRate)
                       ) {
                inCrashRecoveryMode = false;
                BEEP_OFF;
            }
        }
        const float gyroRate = gyro.gyroADCf[axis]; // Process variable from gyro output in deg/sec

        // --------low-level gyro-based PID based on 2DOF PID controller. ----------
        // 2-DOF PID controller with optional filter on derivative term.
        // b = 1 and only c (dtermSetpointWeight) can be tuned (amount derivative on measurement or error).

        // -----calculate error rate
        const float errorRate = currentPidSetpoint - gyroRate;       // r - y

        // -----calculate P component and add Dynamic Part based on stick input
        axisPID_P[axis] = Kp[axis] * errorRate * tpaFactor;
        if (axis == FD_YAW) {
            axisPID_P[axis] = ptermYawFilterApplyFn(ptermYawFilter, axisPID_P[axis]);
        }

        // -----calculate I component
        const float ITerm = axisPID_I[axis];
        const float ITermNew = ITerm + Ki[axis] * errorRate * dT * dynKi * itermAccelerator;
        const bool outputSaturated = mixerIsOutputSaturated(axis, errorRate);
        if (outputSaturated == false || ABS(ITermNew) < ABS(ITerm)) {
            // Only increase ITerm if output is not saturated
            axisPID_I[axis] = ITermNew;
        }

        // -----calculate D component
        if (axis != FD_YAW) {
            float dynC = dtermSetpointWeight;
            if (pidProfile->setpointRelaxRatio < 100) {
                dynC *= MIN(getRcDeflectionAbs(axis) * relaxFactor, 1.0f);
            }
            const float rD = dynC * currentPidSetpoint - gyroRate;    // cr - y
            // Divide rate change by dT to get differential (ie dr/dt)
            float delta = (rD - previousRateError[axis]) / dT;
            previousRateError[axis] = rD;

            // if crash recovery is on check for a crash
            if (pidProfile->crash_recovery) {
                if (motorMixRange >= 1.0f && ABS(delta) > crashDtermThreshold && ABS(errorRate) > crashGyroThreshold) {
                    inCrashRecoveryMode = true;
                    crashDetectedAtUs = currentTimeUs;
                    if (pidProfile->crash_recovery == PID_CRASH_RECOVERY_BEEP) {
                        BEEP_ON;
                    }
                }
            }

            // apply filters
            delta = dtermNotchFilterApplyFn(dtermFilterNotch[axis], delta);
            delta = dtermLpfApplyFn(dtermFilterLpf[axis], delta);

            axisPID_D[axis] = Kd[axis] * delta * tpaFactor;
        }

        // Disable PID control at zero throttle
        if (!pidStabilisationEnabled) {
            axisPID_P[axis] = 0;
            axisPID_I[axis] = 0;
            axisPID_D[axis] = 0;
        }
    }
}
