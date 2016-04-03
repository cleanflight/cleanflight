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

#define SRC_MAIN_FLIGHT_PID_C_

#include <stdbool.h>
#include <stdint.h>
#include <math.h>

#include <platform.h>

#include "build_config.h"

#include "common/axis.h"
#include "common/maths.h"
#include "common/filter.h"

#include "drivers/sensor.h"
#include "drivers/accgyro.h"
#include "drivers/gyro_sync.h"

#include "sensors/sensors.h"
#include "sensors/gyro.h"
#include "sensors/acceleration.h"

#include "rx/rx.h"

#include "io/rc_controls.h"
#include "io/gps.h"

#include "flight/pid.h"
#include "flight/imu.h"
#include "flight/navigation.h"
#include "flight/gtune.h"
#include "flight/mixer.h"

#include "config/runtime_config.h"
#include "config/config_unittest.h"

extern uint8_t motorCount;
extern float dT;

int16_t axisPID[3];

#ifdef BLACKBOX
int32_t axisPID_P[3], axisPID_I[3], axisPID_D[3];
#endif

// PIDweight is a scale factor for PIDs which is derived from the throttle and TPA setting, and 100 = 100% scale means no PID reduction
uint8_t dynP8[3], dynI8[3], dynD8[3], PIDweight[3];

static int32_t errorGyroI[3], errorGyroILimit[3];
static float errorGyroIf[3], errorGyroIfLimit[3];
static int32_t errorAngleI[2];
static float errorAngleIf[2];

static void pidMultiWiiRewrite(pidProfile_t *pidProfile, controlRateConfig_t *controlRateConfig,
        uint16_t max_angle_inclination, rollAndPitchTrims_t *angleTrim, rxConfig_t *rxConfig);

typedef void (*pidControllerFuncPtr)(pidProfile_t *pidProfile, controlRateConfig_t *controlRateConfig,
        uint16_t max_angle_inclination, rollAndPitchTrims_t *angleTrim, rxConfig_t *rxConfig);            // pid controller function prototype

pidControllerFuncPtr pid_controller = pidMultiWiiRewrite; // which pid controller are we using

void pidResetErrorAngle(void)
{
    errorAngleI[AI_ROLL] = 0;
    errorAngleI[AI_PITCH] = 0;

    errorAngleIf[AI_ROLL] = 0.0f;
    errorAngleIf[AI_PITCH] = 0.0f;
}

void pidResetErrorGyro(void)
{
    int axis;
    for (axis = 0; axis < 3; axis++) {
        errorGyroI[axis] = 0;
        errorGyroIf[axis] = 0.0f;
    }
}

float scaleItermToRcInput(int axis) {
    float rcCommandDeflection = (float)rcCommand[axis] / 500.0f;
    static float iTermScaler[3] = {1.0f, 1.0f, 1.0f};
    static float antiWindUpIncrement = 0;

    if (!antiWindUpIncrement) {
        antiWindUpIncrement = (0.001 / 500) * targetLooptime;  // Calculate increment for 500ms period
    }

    if (ABS(rcCommandDeflection) > 0.7f && (!flightModeFlags)) {   // scaling should not happen in level modes
        // Reset Iterm on high stick inputs. No scaling necessary here
        iTermScaler[axis] = 0.0f;
    } else {
        // Prevent rapid windup during acro recoveries. Slowly enable Iterm for period of 500ms
        if (iTermScaler[axis] < 1) {
            iTermScaler[axis] = constrainf(iTermScaler[axis] + antiWindUpIncrement, 0.0f, 1.0f);
        } else {
            iTermScaler[axis] = 1;
        }
    }

    return iTermScaler[axis];
}

const angle_index_t rcAliasToAngleIndexMap[] = { AI_ROLL, AI_PITCH };

static biquad_t deltaFilterState[3];

void filterIsSetCheck(pidProfile_t *pidProfile) {
    static bool deltaStateIsSet = false;
    if (!deltaStateIsSet && pidProfile->dterm_cut_hz) {
        int axis;
        for (axis = 0; axis < 3; axis++) BiQuadNewLpf(pidProfile->dterm_cut_hz, &deltaFilterState[axis], targetLooptime);
        deltaStateIsSet = true;
    }
}

static void pidLuxFloat(pidProfile_t *pidProfile, controlRateConfig_t *controlRateConfig,
        uint16_t max_angle_inclination, rollAndPitchTrims_t *angleTrim, rxConfig_t *rxConfig)
{
    float RateError, errorAngle, AngleRate, gyroRate;
    float ITerm,PTerm,DTerm;
    int32_t stickPosAil, stickPosEle, mostDeflectedPos;
    static float lastErrorForDelta[3];
    static float delta1[3], delta2[3];
    float delta, deltaSum;
    int axis;
    float horizonLevelStrength = 1;

    filterIsSetCheck(pidProfile);

    if (FLIGHT_MODE(HORIZON_MODE)) {

        // Figure out the raw stick positions
        stickPosAil = getRcStickDeflection(ROLL, rxConfig->midrc);
        stickPosEle = getRcStickDeflection(PITCH, rxConfig->midrc);

        if(ABS(stickPosAil) > ABS(stickPosEle)){
            mostDeflectedPos = ABS(stickPosAil);
        }
        else {
            mostDeflectedPos = ABS(stickPosEle);
        }

        // Progressively turn off the horizon self level strength as the stick is banged over
        horizonLevelStrength = (float)(500 - mostDeflectedPos) / 500;  // 1 at centre stick, 0 = max stick deflection
        if(pidProfile->H_sensitivity == 0){
            horizonLevelStrength = 0;
        } else {
            horizonLevelStrength = constrainf(((horizonLevelStrength - 1) * (100 / pidProfile->H_sensitivity)) + 1, 0, 1);
        }
    }

    // ----------PID controller----------
    for (axis = 0; axis < 3; axis++) {
        SET_PID_LUX_FLOAT_LOCALS(axis);
        // -----Get the desired angle rate depending on flight mode
        uint8_t rate = controlRateConfig->rates[axis];

        if (axis == FD_YAW) {
            // YAW is always gyro-controlled (MAG correction is applied to rcCommand) 100dps to 1100dps max yaw rate
            AngleRate = (float)((rate + 10) * rcCommand[YAW]) / 50.0f;
         } else {
            // calculate error and limit the angle to the max inclination
#ifdef GPS
            errorAngle = (constrain(rcCommand[axis] + GPS_angle[axis], -((int) max_angle_inclination),
                    +max_angle_inclination) - attitude.raw[axis] + angleTrim->raw[axis]) / 10.0f; // 16 bits is ok here
#else
            errorAngle = (constrain(rcCommand[axis], -((int) max_angle_inclination),
                    +max_angle_inclination) - attitude.raw[axis] + angleTrim->raw[axis]) / 10.0f; // 16 bits is ok here
#endif

            if (FLIGHT_MODE(ANGLE_MODE)) {
                // it's the ANGLE mode - control is angle based, so control loop is needed
                AngleRate = errorAngle * pidProfile->A_level;
            } else {
                //control is GYRO based (ACRO and HORIZON - direct sticks control is applied to rate PID
                AngleRate = (float)((rate + 20) * rcCommand[axis]) / 50.0f; // 200dps to 1200dps max roll/pitch rate
                if (FLIGHT_MODE(HORIZON_MODE)) {
                    // mix up angle error to desired AngleRate to add a little auto-level feel
                    AngleRate += errorAngle * pidProfile->H_level * horizonLevelStrength;
                }
            }
        }

        gyroRate = gyroADC[axis] * gyro.scale; // gyro output scaled to dps

        // --------low-level gyro-based PID. ----------
        // Used in stand-alone mode for ACRO, controlled by higher level regulators in other modes
        // -----calculate scaled error.AngleRates
        // multiplication of rcCommand corresponds to changing the sticks scaling here
        RateError = AngleRate - gyroRate;

        // -----calculate P component
        PTerm = RateError * pidProfile->P_f[axis] * PIDweight[axis] / 100;

        // -----calculate I component.
        errorGyroIf[axis] = constrainf(errorGyroIf[axis] + RateError * dT * pidProfile->I_f[axis] * 10, -PID_LUX_FLOAT_MAX_I, PID_LUX_FLOAT_MAX_I);

        // limit maximum integrator value to prevent WindUp - accumulating extreme values when system is saturated.
        // I coefficient (I8) moved before integration to make limiting independent from PID settings

        // Anti windup protection
        if (IS_RC_MODE_ACTIVE(BOXAIRMODE)) {
            errorGyroIf[axis] = errorGyroIf[axis] * scaleItermToRcInput(axis);
            if (STATE(ANTI_WINDUP) || motorLimitReached) {
                errorGyroIf[axis] = constrainf(errorGyroIf[axis], -errorGyroIfLimit[axis], errorGyroIfLimit[axis]);
            } else {
                errorGyroIfLimit[axis] = ABS(errorGyroIf[axis]);
            }
        }

        ITerm = errorGyroIf[axis];

        //-----calculate D-term based on the configured approach (delta from measurement or deltafromError)
        if (pidProfile->deltaMethod == DELTA_FROM_ERROR) {
            delta = RateError - lastErrorForDelta[axis];
            lastErrorForDelta[axis] = RateError;
        } else {                                         /* Delta from measurement */
            delta = -(gyroRate - lastErrorForDelta[axis]);
            lastErrorForDelta[axis] = gyroRate;
        }

        // Correct difference by cycle time. Cycle time is jittery (can be different 2 times), so calculated difference
        // would be scaled by different dt each time. Division by dT fixes that.
        delta *= (1.0f / dT);

        if (pidProfile->dterm_cut_hz) {
            // Dterm low pass
            delta = applyBiQuadFilter(delta, &deltaFilterState[axis]);
        } else {
            // When dterm filter disabled apply moving average to reduce noise
            deltaSum = delta1[axis] + delta2[axis] + delta;
            delta2[axis] = delta1[axis];
            delta1[axis] = delta;
            delta = deltaSum / 3.0f;
        }

        DTerm = constrainf(delta * pidProfile->D_f[axis] * PIDweight[axis] / 100, -PID_LUX_FLOAT_MAX_D, PID_LUX_FLOAT_MAX_D);

        // -----calculate total PID output
        axisPID[axis] = constrain(lrintf(PTerm + ITerm + DTerm), -PID_LUX_FLOAT_MAX_PID, PID_LUX_FLOAT_MAX_PID);

#ifdef GTUNE
        if (FLIGHT_MODE(GTUNE_MODE) && ARMING_FLAG(ARMED)) {
            calculate_Gtune(axis);
        }
#endif

#ifdef BLACKBOX
        axisPID_P[axis] = PTerm;
        axisPID_I[axis] = ITerm;
        axisPID_D[axis] = DTerm;
#endif
        GET_PID_LUX_FLOAT_LOCALS(axis);
    }
}

static void pidMultiWii23(pidProfile_t *pidProfile, controlRateConfig_t *controlRateConfig, uint16_t max_angle_inclination,
            rollAndPitchTrims_t *angleTrim, rxConfig_t *rxConfig)
{
    UNUSED(rxConfig);

    int axis, prop = 0;
    int32_t rc, error, errorAngle, delta, gyroError;
    int32_t PTerm, ITerm, PTermACC, ITermACC, DTerm;
    static int16_t lastErrorForDelta[2];
    static int32_t delta1[2], delta2[2];

    filterIsSetCheck(pidProfile);

    if (FLIGHT_MODE(HORIZON_MODE)) {
        prop = MIN(MAX(ABS(rcCommand[PITCH]), ABS(rcCommand[ROLL])), 512);
    }

    // PITCH & ROLL
    for (axis = 0; axis < 2; axis++) {

        rc = rcCommand[axis] << 1;

        gyroError = gyroADC[axis] / 4;

        error = rc - gyroError;
        errorGyroI[axis]  = constrain(errorGyroI[axis] + error, -16000, +16000);   // WindUp   16 bits is ok here

        if (ABS(gyroADC[axis]) > (640 * 4)) {
            errorGyroI[axis] = 0;
        }

        // Anti windup protection
        if (IS_RC_MODE_ACTIVE(BOXAIRMODE)) {
            errorGyroI[axis] = (int32_t) (errorGyroI[axis] * scaleItermToRcInput(axis));
            if (STATE(ANTI_WINDUP) || motorLimitReached) {
                errorGyroI[axis] = constrain(errorGyroI[axis], -errorGyroILimit[axis], errorGyroILimit[axis]);
            } else {
                errorGyroILimit[axis] = ABS(errorGyroI[axis]);
            }
        }

        ITerm = (errorGyroI[axis] >> 7) * pidProfile->I8[axis] >> 6;   // 16 bits is ok here 16000/125 = 128 ; 128*250 = 32000

        PTerm = (int32_t)rc * pidProfile->P8[axis] >> 6;

        if (FLIGHT_MODE(ANGLE_MODE) || FLIGHT_MODE(HORIZON_MODE)) {   // axis relying on ACC
            // 50 degrees max inclination
#ifdef GPS
            errorAngle = constrain(2 * rcCommand[axis] + GPS_angle[axis], -((int) max_angle_inclination),
                +max_angle_inclination) - attitude.raw[axis] + angleTrim->raw[axis];
#else
            errorAngle = constrain(2 * rcCommand[axis], -((int) max_angle_inclination),
                +max_angle_inclination) - attitude.raw[axis] + angleTrim->raw[axis];
#endif

            errorAngleI[axis]  = constrain(errorAngleI[axis] + errorAngle, -10000, +10000);                                                // WindUp     //16 bits is ok here

            PTermACC = ((int32_t)errorAngle * pidProfile->P8[PIDLEVEL]) >> 7;   // 32 bits is needed for calculation: errorAngle*P8 could exceed 32768   16 bits is ok for result

            int16_t limit = pidProfile->D8[PIDLEVEL] * 5;
            PTermACC = constrain(PTermACC, -limit, +limit);

            ITermACC = ((int32_t)errorAngleI[axis] * pidProfile->I8[PIDLEVEL]) >> 12;  // 32 bits is needed for calculation:10000*I8 could exceed 32768   16 bits is ok for result

            ITerm = ITermACC + ((ITerm - ITermACC) * prop >> 9);
            PTerm = PTermACC + ((PTerm - PTermACC) * prop >> 9);
        }

        PTerm -= ((int32_t)gyroError * dynP8[axis]) >> 6;   // 32 bits is needed for calculation

        //-----calculate D-term based on the configured approach (delta from measurement or deltafromError)
        if (pidProfile->deltaMethod == DELTA_FROM_ERROR) {
            delta = error - lastErrorForDelta[axis];
            lastErrorForDelta[axis] = error;
        } else {                                       /* Delta from measurement */
            delta = -(gyroError - lastErrorForDelta[axis]);
            lastErrorForDelta[axis] = gyroError;
        }

        if (pidProfile->dterm_cut_hz) {
            // Dterm delta low pass
            DTerm = delta;
            DTerm = lrintf(applyBiQuadFilter((float) DTerm, &deltaFilterState[axis])) * 3;  // Keep same scaling as unfiltered DTerm
        } else {
            // When dterm filter disabled apply moving average to reduce noise
            DTerm  = delta1[axis] + delta2[axis] + delta;
            delta2[axis] = delta1[axis];
            delta1[axis] = delta;
        }

        DTerm = ((int32_t)DTerm * dynD8[axis]) >> 5;   // 32 bits is needed for calculation

        axisPID[axis] = PTerm + ITerm + DTerm;

#ifdef GTUNE
        if (FLIGHT_MODE(GTUNE_MODE) && ARMING_FLAG(ARMED)) {
            calculate_Gtune(axis);
        }
#endif

#ifdef BLACKBOX
        axisPID_P[axis] = PTerm;
        axisPID_I[axis] = ITerm;
        axisPID_D[axis] = DTerm;
#endif
    }

    //YAW
    rc = (int32_t)rcCommand[YAW] * (2 * controlRateConfig->rates[YAW] + 30)  >> 5;
#ifdef ALIENWII32
    error = rc - gyroADC[FD_YAW];
#else
    error = rc - (gyroADC[FD_YAW] / 4);
#endif
    errorGyroI[FD_YAW]  += (int32_t)error * pidProfile->I8[FD_YAW];
    errorGyroI[FD_YAW]  = constrain(errorGyroI[FD_YAW], 2 - ((int32_t)1 << 28), -2 + ((int32_t)1 << 28));
    if (ABS(rc) > 50) errorGyroI[FD_YAW] = 0;

    PTerm = (int32_t)error * pidProfile->P8[FD_YAW] >> 6; // TODO: Bitwise shift on a signed integer is not recommended

    // Constrain YAW by D value if not servo driven in that case servolimits apply
    if(motorCount >= 4 && pidProfile->yaw_p_limit < YAW_P_LIMIT_MAX) {
        PTerm = constrain(PTerm, -pidProfile->yaw_p_limit, pidProfile->yaw_p_limit);
    }

    ITerm = constrain((int16_t)(errorGyroI[FD_YAW] >> 13), -GYRO_I_MAX, +GYRO_I_MAX);

    axisPID[FD_YAW] =  PTerm + ITerm;

#ifdef GTUNE
    if (FLIGHT_MODE(GTUNE_MODE) && ARMING_FLAG(ARMED)) {
        calculate_Gtune(FD_YAW);
    }
#endif

#ifdef BLACKBOX
    axisPID_P[FD_YAW] = PTerm;
    axisPID_I[FD_YAW] = ITerm;
    axisPID_D[FD_YAW] = 0;
#endif
}


static void pidMultiWiiRewrite(pidProfile_t *pidProfile, controlRateConfig_t *controlRateConfig, uint16_t max_angle_inclination,
        rollAndPitchTrims_t *angleTrim, rxConfig_t *rxConfig)
{
    UNUSED(rxConfig);

    int32_t errorAngle;
    int axis;
    int32_t delta, deltaSum;
    static int32_t delta1[3], delta2[3];
    int32_t PTerm, ITerm, DTerm;
    static int32_t lastErrorForDelta[3] = { 0, 0, 0 };
    int32_t AngleRateTmp, RateError, gyroRate;

    int8_t horizonLevelStrength = 100;
    int32_t stickPosAil, stickPosEle, mostDeflectedPos;

    filterIsSetCheck(pidProfile);

    if (FLIGHT_MODE(HORIZON_MODE)) {

        // Figure out the raw stick positions
        stickPosAil = getRcStickDeflection(ROLL, rxConfig->midrc);
        stickPosEle = getRcStickDeflection(PITCH, rxConfig->midrc);

        if(ABS(stickPosAil) > ABS(stickPosEle)){
            mostDeflectedPos = ABS(stickPosAil);
        }
        else {
            mostDeflectedPos = ABS(stickPosEle);
        }

        // Progressively turn off the horizon self level strength as the stick is banged over
        horizonLevelStrength = (500 - mostDeflectedPos) / 5;  // 100 at centre stick, 0 = max stick deflection

        // Using Level D as a Sensitivity for Horizon. 0 more level to 255 more rate. Default value of 100 seems to work fine.
        // For more rate mode increase D and slower flips and rolls will be possible
        horizonLevelStrength = constrain((10 * (horizonLevelStrength - 100) * (10 * pidProfile->D8[PIDLEVEL] / 80) / 100) + 100, 0, 100);
    }

    // ----------PID controller----------
    for (axis = 0; axis < 3; axis++) {
        SET_PID_MULTI_WII_REWRITE_LOCALS(axis);
        uint8_t rate = controlRateConfig->rates[axis];

        // -----Get the desired angle rate depending on flight mode
        if (axis == FD_YAW) { // YAW is always gyro-controlled (MAG correction is applied to rcCommand)
            AngleRateTmp = (((int32_t)(rate + 27) * rcCommand[YAW]) >> 5);
        } else {
            // calculate error and limit the angle to max configured inclination
#ifdef GPS
            errorAngle = constrain(2 * rcCommand[axis] + GPS_angle[axis], -((int) max_angle_inclination),
                    +max_angle_inclination) - attitude.raw[axis] + angleTrim->raw[axis]; // 16 bits is ok here
#else
            errorAngle = constrain(2 * rcCommand[axis], -((int) max_angle_inclination),
                    +max_angle_inclination) - attitude.raw[axis] + angleTrim->raw[axis]; // 16 bits is ok here
#endif

            if (FLIGHT_MODE(ANGLE_MODE)) {
                // it's ANGLE mode - control is angle based, so control loop is needed
                AngleRateTmp = (errorAngle * pidProfile->P8[PIDLEVEL]) >> 4;
            } else {
                //control is GYRO based (ACRO and HORIZON) - direct sticks control is applied to rate PID
                AngleRateTmp = ((int32_t)(rate + 27) * rcCommand[axis]) >> 4;
                if (FLIGHT_MODE(HORIZON_MODE)) {
                    // mix up angle error to desired AngleRateTmp to add a little auto-level feel. horizonLevelStrength is scaled to the stick input
                    AngleRateTmp += (errorAngle * pidProfile->I8[PIDLEVEL] * horizonLevelStrength / 100) >> 4;
                }
            }
        }

        // --------low-level gyro-based PID. ----------
        // Used in stand-alone mode for ACRO, controlled by higher level regulators in other modes
        // -----calculate scaled error.AngleRates
        // multiplication of rcCommand corresponds to changing the sticks scaling here
        gyroRate = gyroADC[axis] / 4;
        RateError = AngleRateTmp - gyroRate;

        // -----calculate P component
        PTerm = (RateError * pidProfile->P8[axis] * PIDweight[axis] / 100) >> 7;

        // -----calculate I component
        // there should be no division before accumulating the error to integrator, because the precision would be reduced.
        // Precision is critical, as I prevents from long-time drift. Thus, 32 bits integrator is used.
        // Time correction (to avoid different I scaling for different builds based on average cycle time)
        // is normalized to cycle time = 2048.
        errorGyroI[axis] = errorGyroI[axis] + ((RateError * (uint16_t)targetLooptime) >> 11) * pidProfile->I8[axis];

        // limit maximum integrator value to prevent WindUp - accumulating extreme values when system is saturated.
        // I coefficient (I8) moved before integration to make limiting independent from PID settings
        errorGyroI[axis] = constrain(errorGyroI[axis], (int32_t) - GYRO_I_MAX << 13, (int32_t) + GYRO_I_MAX << 13);

        // Anti windup protection
        if (IS_RC_MODE_ACTIVE(BOXAIRMODE)) {
            errorGyroI[axis] = (int32_t) (errorGyroI[axis] * scaleItermToRcInput(axis));
            if (STATE(ANTI_WINDUP) || motorLimitReached) {
                errorGyroI[axis] = constrain(errorGyroI[axis], -errorGyroILimit[axis], errorGyroILimit[axis]);
            } else {
                errorGyroILimit[axis] = ABS(errorGyroI[axis]);
            }
        }

        ITerm = errorGyroI[axis] >> 13;

        //-----calculate D-term based on the configured approach (delta from measurement or deltafromError)
        if (pidProfile->deltaMethod == DELTA_FROM_ERROR) {
            delta = RateError - lastErrorForDelta[axis];
            lastErrorForDelta[axis] = RateError;
        } else {
            // Delta from measurement
            delta = -(gyroRate - lastErrorForDelta[axis]);
            lastErrorForDelta[axis] = gyroRate;
        }

        // Correct difference by cycle time. Cycle time is jittery (can be different 2 times), so calculated difference
        // would be scaled by different dt each time. Division by dT fixes that.
        delta = (delta * ((uint16_t) 0xFFFF / ((uint16_t)targetLooptime >> 4))) >> 6;

        if (pidProfile->dterm_cut_hz) {
            // Dterm delta low pass
            deltaSum = delta;
            deltaSum = lrintf(applyBiQuadFilter((float) deltaSum, &deltaFilterState[axis])) * 3;  // Keep same scaling as unfiltered deltaSum
        } else {
            // When dterm filter disabled apply moving average to reduce noise
            deltaSum = delta1[axis] + delta2[axis] + delta;
            delta2[axis] = delta1[axis];
            delta1[axis] = delta;
        }

        DTerm = (deltaSum * pidProfile->D8[axis] * PIDweight[axis] / 100) >> 8;

        // -----calculate total PID output
        axisPID[axis] = PTerm + ITerm + DTerm;

#ifdef GTUNE
        if (FLIGHT_MODE(GTUNE_MODE) && ARMING_FLAG(ARMED)) {
             calculate_Gtune(axis);
        }
#endif

#ifdef BLACKBOX
        axisPID_P[axis] = PTerm;
        axisPID_I[axis] = ITerm;
        axisPID_D[axis] = DTerm;
#endif
    GET_PID_MULTI_WII_REWRITE_LOCALS(axis);
    }
}


void pidSetController(pidControllerType_e type)
{
    switch (type) {
        default:
        case PID_CONTROLLER_MWREWRITE:
            pid_controller = pidMultiWiiRewrite;
            break;
        case PID_CONTROLLER_LUX_FLOAT:
            pid_controller = pidLuxFloat;
            break;
        case PID_CONTROLLER_MW23:
            pid_controller = pidMultiWii23;
    }
}
