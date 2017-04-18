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

#include "platform.h"

#include "build/build_config.h"

#include "common/axis.h"
#include "common/maths.h"
#include "common/filter.h"

#include "config/feature.h"
#include "config/parameter_group.h"
#include "config/parameter_group_ids.h"

#include "drivers/system.h"
#include "drivers/pwm_output.h"
#include "drivers/pwm_esc_detect.h"

#include "io/motors.h"

#include "rx/rx.h"

#include "sensors/battery.h"

#include "flight/mixer.h"
#include "flight/failsafe.h"
#include "flight/pid.h"
#include "flight/imu.h"

#include "fc/config.h"
#include "fc/rc_controls.h"
#include "fc/runtime_config.h"

PG_REGISTER_WITH_RESET_TEMPLATE(flight3DConfig_t, flight3DConfig, PG_MOTOR_3D_CONFIG, 0);

PG_RESET_TEMPLATE(flight3DConfig_t, flight3DConfig,
    .deadband3d_low = 1406,
    .deadband3d_high = 1514,
    .neutral3d = 1460,
    .deadband3d_throttle = 50
);

PG_REGISTER_WITH_RESET_TEMPLATE(mixerConfig_t, mixerConfig, PG_MIXER_CONFIG, 0);

#ifndef TARGET_DEFAULT_MIXER
#define TARGET_DEFAULT_MIXER    MIXER_QUADX
#endif
PG_RESET_TEMPLATE(mixerConfig_t, mixerConfig,
    .mixerMode = TARGET_DEFAULT_MIXER,
    .yaw_motors_reversed = false,
);

PG_REGISTER_WITH_RESET_FN(motorConfig_t, motorConfig, PG_MOTOR_CONFIG, 0);

void pgResetFn_motorConfig(motorConfig_t *motorConfig)
{
#ifdef BRUSHED_MOTORS
    motorConfig->minthrottle = 1000;
    motorConfig->dev.motorPwmRate = BRUSHED_MOTORS_PWM_RATE;
    motorConfig->dev.motorPwmProtocol = PWM_TYPE_BRUSHED;
    motorConfig->dev.useUnsyncedPwm = true;
#else
#ifdef BRUSHED_ESC_AUTODETECT
    if (hardwareMotorType == MOTOR_BRUSHED) {
        motorConfig->minthrottle = 1000;
        motorConfig->dev.motorPwmRate = BRUSHED_MOTORS_PWM_RATE;
        motorConfig->dev.motorPwmProtocol = PWM_TYPE_BRUSHED;
        motorConfig->dev.useUnsyncedPwm = true;
    } else
#endif
    {
        motorConfig->minthrottle = 1070;
        motorConfig->dev.motorPwmRate = BRUSHLESS_MOTORS_PWM_RATE;
        motorConfig->dev.motorPwmProtocol = PWM_TYPE_ONESHOT125;
    }
#endif
    motorConfig->maxthrottle = 2000;
    motorConfig->mincommand = 1000;
    motorConfig->digitalIdleOffsetValue = 450;

    int motorIndex = 0;
    for (int i = 0; i < USABLE_TIMER_CHANNEL_COUNT && motorIndex < MAX_SUPPORTED_MOTORS; i++) {
        if (timerHardware[i].usageFlags & TIM_USE_MOTOR) {
            motorConfig->dev.ioTags[motorIndex] = timerHardware[i].tag;
            motorIndex++;
        }
    }
}

PG_REGISTER_ARRAY(motorMixer_t, MAX_SUPPORTED_MOTORS, customMotorMixer, PG_MOTOR_MIXER, 0);

#define EXTERNAL_DSHOT_CONVERSION_FACTOR 2
// (minimum output value(1001) - (minimum input value(48) / conversion factor(2))
#define EXTERNAL_DSHOT_CONVERSION_OFFSET 977
#define EXTERNAL_CONVERSION_MIN_VALUE 1000
#define EXTERNAL_CONVERSION_MAX_VALUE 2000
#define EXTERNAL_CONVERSION_3D_MID_VALUE 1500

#define TRICOPTER_ERROR_RATE_YAW_SATURATED 75 // rate at which tricopter yaw axis becomes saturated, determined experimentally by TriFlight


static uint8_t motorCount;
static float motorMixRange;

int16_t motor[MAX_SUPPORTED_MOTORS];
int16_t motor_disarmed[MAX_SUPPORTED_MOTORS];

mixerMode_e currentMixerMode;
static motorMixer_t currentMixer[MAX_SUPPORTED_MOTORS];


static const motorMixer_t mixerQuadX[] = {
    { 1.0f, -1.0f,  1.0f, -1.0f },          // REAR_R
    { 1.0f, -1.0f, -1.0f,  1.0f },          // FRONT_R
    { 1.0f,  1.0f,  1.0f,  1.0f },          // REAR_L
    { 1.0f,  1.0f, -1.0f, -1.0f },          // FRONT_L
};
#ifndef USE_QUAD_MIXER_ONLY
static const motorMixer_t mixerTricopter[] = {
    { 1.0f,  0.0f,  1.333333f,  0.0f },     // REAR
    { 1.0f, -1.0f, -0.666667f,  0.0f },     // RIGHT
    { 1.0f,  1.0f, -0.666667f,  0.0f },     // LEFT
};

static const motorMixer_t mixerQuadP[] = {
    { 1.0f,  0.0f,  1.0f, -1.0f },          // REAR
    { 1.0f, -1.0f,  0.0f,  1.0f },          // RIGHT
    { 1.0f,  1.0f,  0.0f,  1.0f },          // LEFT
    { 1.0f,  0.0f, -1.0f, -1.0f },          // FRONT
};

#if defined(USE_UNCOMMON_MIXERS)
static const motorMixer_t mixerBicopter[] = {
    { 1.0f,  1.0f,  0.0f,  0.0f },          // LEFT
    { 1.0f, -1.0f,  0.0f,  0.0f },          // RIGHT
};
#else
#define mixerBicopter NULL
#endif

static const motorMixer_t mixerY4[] = {
    { 1.0f,  0.0f,  1.0f, -1.0f },          // REAR_TOP CW
    { 1.0f, -1.0f, -1.0f,  0.0f },          // FRONT_R CCW
    { 1.0f,  0.0f,  1.0f,  1.0f },          // REAR_BOTTOM CCW
    { 1.0f,  1.0f, -1.0f,  0.0f },          // FRONT_L CW
};


#if (MAX_SUPPORTED_MOTORS >= 6)
static const motorMixer_t mixerHex6X[] = {
    { 1.0f, -0.5f,  0.866025f,  1.0f },     // REAR_R
    { 1.0f, -0.5f, -0.866025f,  1.0f },     // FRONT_R
    { 1.0f,  0.5f,  0.866025f, -1.0f },     // REAR_L
    { 1.0f,  0.5f, -0.866025f, -1.0f },     // FRONT_L
    { 1.0f, -1.0f,  0.0f,      -1.0f },     // RIGHT
    { 1.0f,  1.0f,  0.0f,       1.0f },     // LEFT
};

#if defined(USE_UNCOMMON_MIXERS)
static const motorMixer_t mixerHex6H[] = {
    { 1.0f, -1.0f,  1.0f, -1.0f },     // REAR_R
    { 1.0f, -1.0f, -1.0f,  1.0f },     // FRONT_R
    { 1.0f,  1.0f,  1.0f,  1.0f },     // REAR_L
    { 1.0f,  1.0f, -1.0f, -1.0f },     // FRONT_L
    { 1.0f,  0.0f,  0.0f,  0.0f },     // RIGHT
    { 1.0f,  0.0f,  0.0f,  0.0f },     // LEFT
};

static const motorMixer_t mixerHex6P[] = {
    { 1.0f, -0.866025f,  0.5f,  1.0f },     // REAR_R
    { 1.0f, -0.866025f, -0.5f, -1.0f },     // FRONT_R
    { 1.0f,  0.866025f,  0.5f,  1.0f },     // REAR_L
    { 1.0f,  0.866025f, -0.5f, -1.0f },     // FRONT_L
    { 1.0f,  0.0f,      -1.0f,  1.0f },     // FRONT
    { 1.0f,  0.0f,       1.0f, -1.0f },     // REAR
};
static const motorMixer_t mixerY6[] = {
    { 1.0f,  0.0f,  1.333333f,  1.0f },     // REAR
    { 1.0f, -1.0f, -0.666667f, -1.0f },     // RIGHT
    { 1.0f,  1.0f, -0.666667f, -1.0f },     // LEFT
    { 1.0f,  0.0f,  1.333333f, -1.0f },     // UNDER_REAR
    { 1.0f, -1.0f, -0.666667f,  1.0f },     // UNDER_RIGHT
    { 1.0f,  1.0f, -0.666667f,  1.0f },     // UNDER_LEFT
};
#else
#define mixerHex6H NULL
#define mixerHex6P NULL
#define mixerY6 NULL
#endif // USE_UNCOMMON_MIXERS
#else
#define mixerHex6X NULL
#endif // MAX_SUPPORTED_MOTORS >= 6

#if defined(USE_UNCOMMON_MIXERS) && (MAX_SUPPORTED_MOTORS >= 8)
static const motorMixer_t mixerOctoX8[] = {
    { 1.0f, -1.0f,  1.0f, -1.0f },          // REAR_R
    { 1.0f, -1.0f, -1.0f,  1.0f },          // FRONT_R
    { 1.0f,  1.0f,  1.0f,  1.0f },          // REAR_L
    { 1.0f,  1.0f, -1.0f, -1.0f },          // FRONT_L
    { 1.0f, -1.0f,  1.0f,  1.0f },          // UNDER_REAR_R
    { 1.0f, -1.0f, -1.0f, -1.0f },          // UNDER_FRONT_R
    { 1.0f,  1.0f,  1.0f, -1.0f },          // UNDER_REAR_L
    { 1.0f,  1.0f, -1.0f,  1.0f },          // UNDER_FRONT_L
};

static const motorMixer_t mixerOctoFlatP[] = {
    { 1.0f,  0.707107f, -0.707107f,  1.0f },    // FRONT_L
    { 1.0f, -0.707107f, -0.707107f,  1.0f },    // FRONT_R
    { 1.0f, -0.707107f,  0.707107f,  1.0f },    // REAR_R
    { 1.0f,  0.707107f,  0.707107f,  1.0f },    // REAR_L
    { 1.0f,  0.0f, -1.0f, -1.0f },              // FRONT
    { 1.0f, -1.0f,  0.0f, -1.0f },              // RIGHT
    { 1.0f,  0.0f,  1.0f, -1.0f },              // REAR
    { 1.0f,  1.0f,  0.0f, -1.0f },              // LEFT
};

static const motorMixer_t mixerOctoFlatX[] = {
    { 1.0f,  1.0f, -0.414178f,  1.0f },      // MIDFRONT_L
    { 1.0f, -0.414178f, -1.0f,  1.0f },      // FRONT_R
    { 1.0f, -1.0f,  0.414178f,  1.0f },      // MIDREAR_R
    { 1.0f,  0.414178f,  1.0f,  1.0f },      // REAR_L
    { 1.0f,  0.414178f, -1.0f, -1.0f },      // FRONT_L
    { 1.0f, -1.0f, -0.414178f, -1.0f },      // MIDFRONT_R
    { 1.0f, -0.414178f,  1.0f, -1.0f },      // REAR_R
    { 1.0f,  1.0f,  0.414178f, -1.0f },      // MIDREAR_L
};
#else
#define mixerOctoX8 NULL
#define mixerOctoFlatP NULL
#define mixerOctoFlatX NULL
#endif

static const motorMixer_t mixerVtail4[] = {
    { 1.0f,  -0.58f,  0.58f, 1.0f },        // REAR_R
    { 1.0f,  -0.46f, -0.39f, -0.5f },       // FRONT_R
    { 1.0f,  0.58f,  0.58f, -1.0f },        // REAR_L
    { 1.0f,  0.46f, -0.39f, 0.5f },         // FRONT_L
};

static const motorMixer_t mixerAtail4[] = {
    { 1.0f,  0.0f,  1.0f,  1.0f },          // REAR_R
    { 1.0f, -1.0f, -1.0f,  0.0f },          // FRONT_R
    { 1.0f,  0.0f,  1.0f, -1.0f },          // REAR_L
    { 1.0f,  1.0f, -1.0f, -0.0f },          // FRONT_L
};

#if defined(USE_UNCOMMON_MIXERS)
static const motorMixer_t mixerDualcopter[] = {
    { 1.0f,  0.0f,  0.0f, -1.0f },          // LEFT
    { 1.0f,  0.0f,  0.0f,  1.0f },          // RIGHT
};
#else
#define mixerDualcopter NULL
#endif

static const motorMixer_t mixerSingleProp[] = {
    { 1.0f,  0.0f,  0.0f, 0.0f },
};

static const motorMixer_t mixerQuadX1234[] = {
    { 1.0f,  1.0f, -1.0f, -1.0f },          // FRONT_L
    { 1.0f, -1.0f, -1.0f,  1.0f },          // FRONT_R
    { 1.0f, -1.0f,  1.0f, -1.0f },          // REAR_R
    { 1.0f,  1.0f,  1.0f,  1.0f },          // REAR_L
};

// Keep synced with mixerMode_e
const mixer_t mixers[] = {
    // motors, use servo, motor mixer
    { 0, false, NULL },                // entry 0
    { 3, true,  mixerTricopter },      // MIXER_TRI
    { 4, false, mixerQuadP },          // MIXER_QUADP
    { 4, false, mixerQuadX },          // MIXER_QUADX
    { 2, true,  mixerBicopter },       // MIXER_BICOPTER
    { 0, true,  NULL },                // * MIXER_GIMBAL
    { 6, false, mixerY6 },             // MIXER_Y6
    { 6, false, mixerHex6P },          // MIXER_HEX6
    { 1, true,  mixerSingleProp },     // * MIXER_FLYING_WING
    { 4, false, mixerY4 },             // MIXER_Y4
    { 6, false, mixerHex6X },          // MIXER_HEX6X
    { 8, false, mixerOctoX8 },         // MIXER_OCTOX8
    { 8, false, mixerOctoFlatP },      // MIXER_OCTOFLATP
    { 8, false, mixerOctoFlatX },      // MIXER_OCTOFLATX
    { 1, true,  mixerSingleProp },     // * MIXER_AIRPLANE
    { 0, true,  NULL },                // * MIXER_HELI_120_CCPM
    { 0, true,  NULL },                // * MIXER_HELI_90_DEG
    { 4, false, mixerVtail4 },         // MIXER_VTAIL4
    { 6, false, mixerHex6H },          // MIXER_HEX6H
    { 0, true,  NULL },                // * MIXER_PPM_TO_SERVO
    { 2, true,  mixerDualcopter },     // MIXER_DUALCOPTER
    { 1, true,  NULL },                // MIXER_SINGLECOPTER
    { 4, false, mixerAtail4 },         // MIXER_ATAIL4
    { 0, false, NULL },                // MIXER_CUSTOM
    { 2, true,  NULL },                // MIXER_CUSTOM_AIRPLANE
    { 3, true,  NULL },                // MIXER_CUSTOM_TRI
    { 4, false, mixerQuadX1234 },
};
#endif

static uint16_t disarmMotorOutput, deadbandMotor3dHigh, deadbandMotor3dLow;
uint16_t motorOutputHigh, motorOutputLow;
static float rcCommandThrottleRange, rcCommandThrottleRange3dLow, rcCommandThrottleRange3dHigh;

uint8_t getMotorCount()
{
    return motorCount;
}

float getMotorMixRange()
{
    return motorMixRange;
}

bool mixerIsOutputSaturated(int axis, float errorRate)
{
    if (axis == FD_YAW && (currentMixerMode == MIXER_TRI || currentMixerMode == MIXER_CUSTOM_TRI)) {
        return errorRate > TRICOPTER_ERROR_RATE_YAW_SATURATED;
    } else {
        return motorMixRange >= 1.0f;
    }
    return false;
}

bool isMotorProtocolDshot(void) {
#ifdef USE_DSHOT
    switch(motorConfig()->dev.motorPwmProtocol) {
    case PWM_TYPE_DSHOT1200:
    case PWM_TYPE_DSHOT600:
    case PWM_TYPE_DSHOT300:
    case PWM_TYPE_DSHOT150:
        return true;
    default:
        return false;
    }
#else
    return false;
#endif
}

// Add here scaled ESC outputs for digital protol
void initEscEndpoints(void) {
#ifdef USE_DSHOT
    if (isMotorProtocolDshot()) {
        disarmMotorOutput = DSHOT_DISARM_COMMAND;
        if (feature(FEATURE_3D))
            motorOutputLow = DSHOT_MIN_THROTTLE + lrintf(((DSHOT_3D_DEADBAND_LOW - DSHOT_MIN_THROTTLE) / 100.0f) * CONVERT_PARAMETER_TO_PERCENT(motorConfig()->digitalIdleOffsetValue));
        else
            motorOutputLow = DSHOT_MIN_THROTTLE + lrintf(((DSHOT_MAX_THROTTLE - DSHOT_MIN_THROTTLE) / 100.0f) * CONVERT_PARAMETER_TO_PERCENT(motorConfig()->digitalIdleOffsetValue));
        motorOutputHigh = DSHOT_MAX_THROTTLE;
        deadbandMotor3dHigh = DSHOT_3D_DEADBAND_HIGH + lrintf(((DSHOT_MAX_THROTTLE - DSHOT_3D_DEADBAND_HIGH) / 100.0f) * CONVERT_PARAMETER_TO_PERCENT(motorConfig()->digitalIdleOffsetValue)); // TODO - Not working yet !! Mixer requires some throttle rescaling changes
        deadbandMotor3dLow = DSHOT_3D_DEADBAND_LOW;
    } else
#endif
    {
        disarmMotorOutput = (feature(FEATURE_3D)) ? flight3DConfig()->neutral3d : motorConfig()->mincommand;
        motorOutputLow = motorConfig()->minthrottle;
        motorOutputHigh = motorConfig()->maxthrottle;
        deadbandMotor3dHigh = flight3DConfig()->deadband3d_high;
        deadbandMotor3dLow = flight3DConfig()->deadband3d_low;
    }

    rcCommandThrottleRange = (PWM_RANGE_MAX - rxConfig()->mincheck);
    rcCommandThrottleRange3dLow = rxConfig()->midrc - rxConfig()->mincheck - flight3DConfig()->deadband3d_throttle;
    rcCommandThrottleRange3dHigh = PWM_RANGE_MAX - rxConfig()->midrc - flight3DConfig()->deadband3d_throttle;
}

void mixerInit(mixerMode_e mixerMode)
{
    currentMixerMode = mixerMode;

    initEscEndpoints();
}

#ifndef USE_QUAD_MIXER_ONLY

void mixerConfigureOutput(void)
{
    motorCount = 0;

    if (currentMixerMode == MIXER_CUSTOM || currentMixerMode == MIXER_CUSTOM_TRI || currentMixerMode == MIXER_CUSTOM_AIRPLANE) {
        // load custom mixer into currentMixer
        for (int i = 0; i < MAX_SUPPORTED_MOTORS; i++) {
            // check if done
            if (customMotorMixer(i)->throttle == 0.0f)
                break;
            currentMixer[i] = *customMotorMixer(i);
            motorCount++;
        }
    } else {
        motorCount = mixers[currentMixerMode].motorCount;
        if (motorCount > MAX_SUPPORTED_MOTORS) {
            motorCount = MAX_SUPPORTED_MOTORS;
        }
        // copy motor-based mixers
        if (mixers[currentMixerMode].motor) {
            for (int i = 0; i < motorCount; i++)
                currentMixer[i] = mixers[currentMixerMode].motor[i];
        }
    }

    // in 3D mode, mixer gain has to be halved
    if (feature(FEATURE_3D)) {
        if (motorCount > 1) {
            for (int i = 0; i < motorCount; i++) {
                currentMixer[i].pitch *= 0.5f;
                currentMixer[i].roll *= 0.5f;
                currentMixer[i].yaw *= 0.5f;
            }
        }
    }

    mixerResetDisarmedMotors();
}

void mixerLoadMix(int index, motorMixer_t *customMixers)
{
    // we're 1-based
    index++;
    // clear existing
    for (int i = 0; i < MAX_SUPPORTED_MOTORS; i++) {
        customMixers[i].throttle = 0.0f;
    }

    // do we have anything here to begin with?
    if (mixers[index].motor != NULL) {
        for (int i = 0; i < mixers[index].motorCount; i++) {
            customMixers[i] = mixers[index].motor[i];
        }
    }
}
#else
void mixerConfigureOutput(void)
{
    motorCount = QUAD_MOTOR_COUNT;

    for (int i = 0; i < motorCount; i++) {
        currentMixer[i] = mixerQuadX[i];
    }

    mixerResetDisarmedMotors();
}
#endif

void mixerResetDisarmedMotors(void)
{
    // set disarmed motor values
    for (int i = 0; i < MAX_SUPPORTED_MOTORS; i++) {
        motor_disarmed[i] = disarmMotorOutput;
    }
}

void writeMotors(void)
{
    if (pwmAreMotorsEnabled()) {
        for (int i = 0; i < motorCount; i++) {
            pwmWriteMotor(i, motor[i]);
        }
    }

    pwmCompleteMotorUpdate(motorCount);
}

static void writeAllMotors(int16_t mc)
{
    // Sends commands to all motors
    for (int i = 0; i < motorCount; i++) {
        motor[i] = mc;
    }

    writeMotors();
}

void stopMotors(void)
{
    writeAllMotors(disarmMotorOutput);

    delay(50); // give the timers and ESCs a chance to react.
}

void stopPwmAllMotors(void)
{
    pwmShutdownPulsesForAllMotors(motorCount);
    delayMicroseconds(1500);
}

void mixTable(pidProfile_t *pidProfile)
{
    // Scale roll/pitch/yaw uniformly to fit within throttle range
    // Initial mixer concept by bdoiron74 reused and optimized for Air Mode
    float throttle = 0, currentThrottleInputRange = 0;
    uint16_t motorOutputMin, motorOutputMax;
    static uint16_t throttlePrevious = 0;   // Store the last throttle direction for deadband transitions
    bool mixerInversion = false;

    // Find min and max throttle based on condition.
    if (feature(FEATURE_3D)) {
        if (!ARMING_FLAG(ARMED)) throttlePrevious = rxConfig()->midrc; // When disarmed set to mid_rc. It always results in positive direction after arming.

        if ((rcCommand[THROTTLE] <= (rxConfig()->midrc - flight3DConfig()->deadband3d_throttle))) { // Out of band handling
            motorOutputMax = deadbandMotor3dLow;
            motorOutputMin = motorOutputLow;
            throttlePrevious = rcCommand[THROTTLE];
            throttle = rcCommand[THROTTLE] - rxConfig()->mincheck;
            currentThrottleInputRange = rcCommandThrottleRange3dLow;
            if(isMotorProtocolDshot()) mixerInversion = true;
        } else if (rcCommand[THROTTLE] >= (rxConfig()->midrc + flight3DConfig()->deadband3d_throttle)) { // Positive handling
            motorOutputMax = motorOutputHigh;
            motorOutputMin = deadbandMotor3dHigh;
            throttlePrevious = rcCommand[THROTTLE];
            throttle = rcCommand[THROTTLE] - rxConfig()->midrc - flight3DConfig()->deadband3d_throttle;
            currentThrottleInputRange = rcCommandThrottleRange3dHigh;
        } else if ((throttlePrevious <= (rxConfig()->midrc - flight3DConfig()->deadband3d_throttle)))  { // Deadband handling from negative to positive
            motorOutputMax = deadbandMotor3dLow;
            motorOutputMin = motorOutputLow;
            throttle = rxConfig()->midrc - flight3DConfig()->deadband3d_throttle;
            currentThrottleInputRange = rcCommandThrottleRange3dLow;
            if(isMotorProtocolDshot()) mixerInversion = true;
        } else {  // Deadband handling from positive to negative
            motorOutputMax = motorOutputHigh;
            motorOutputMin = deadbandMotor3dHigh;
            throttle = 0;
            currentThrottleInputRange = rcCommandThrottleRange3dHigh;
        }
    } else {
        throttle = rcCommand[THROTTLE] - rxConfig()->mincheck;
        currentThrottleInputRange = rcCommandThrottleRange;
        motorOutputMin = motorOutputLow;
        motorOutputMax = motorOutputHigh;
    }

    throttle = constrainf(throttle / currentThrottleInputRange, 0.0f, 1.0f);
    const float motorOutputRange = motorOutputMax - motorOutputMin;

    float scaledAxisPIDf[3];
    // Calculate and Limit the PIDsum
    scaledAxisPIDf[FD_ROLL] =
        constrainf((axisPID_P[FD_ROLL] + axisPID_I[FD_ROLL] + axisPID_D[FD_ROLL]) / PID_MIXER_SCALING,
        -CONVERT_PARAMETER_TO_FLOAT(pidProfile->pidSumLimit), CONVERT_PARAMETER_TO_FLOAT(pidProfile->pidSumLimit));
    scaledAxisPIDf[FD_PITCH] =
        constrainf((axisPID_P[FD_PITCH] + axisPID_I[FD_PITCH] + axisPID_D[FD_PITCH]) / PID_MIXER_SCALING,
        -CONVERT_PARAMETER_TO_FLOAT(pidProfile->pidSumLimit), CONVERT_PARAMETER_TO_FLOAT(pidProfile->pidSumLimit));
    scaledAxisPIDf[FD_YAW] =
        constrainf((axisPID_P[FD_YAW] + axisPID_I[FD_YAW]) / PID_MIXER_SCALING,
        -CONVERT_PARAMETER_TO_FLOAT(pidProfile->pidSumLimit), CONVERT_PARAMETER_TO_FLOAT(pidProfile->pidSumLimitYaw));

    // Calculate voltage compensation
    const float vbatCompensationFactor = (pidProfile->vbatPidCompensation)  ? calculateVbatPidCompensation() : 1.0f;

    // Find roll/pitch/yaw desired output
    float motorMix[MAX_SUPPORTED_MOTORS];
    float motorMixMax = 0, motorMixMin = 0;
    for (int i = 0; i < motorCount; i++) {
        motorMix[i] =
            scaledAxisPIDf[PITCH] * currentMixer[i].pitch +
            scaledAxisPIDf[ROLL]  * currentMixer[i].roll +
            scaledAxisPIDf[YAW]   * currentMixer[i].yaw * -GET_DIRECTION(mixerConfig()->yaw_motors_reversed);

        if (vbatCompensationFactor > 1.0f) {
            motorMix[i] *= vbatCompensationFactor;  // Add voltage compensation
        }

        if (motorMix[i] > motorMixMax) {
            motorMixMax = motorMix[i];
        } else if (motorMix[i] < motorMixMin) {
            motorMixMin = motorMix[i];
        }
    }

    motorMixRange = motorMixMax - motorMixMin;

    if (motorMixRange > 1.0f) {
        for (int i = 0; i < motorCount; i++) {
            motorMix[i] /= motorMixRange;
        }
        // Get the maximum correction by setting offset to center when airmode enabled
        if (isAirmodeActive()) {
            throttle = 0.5f;
        }
    } else {
        if (isAirmodeActive()) {  // Only automatically adjust throttle during airmode scenario
            float throttleLimitOffset = motorMixRange / 2.0f;
            throttle = constrainf(throttle, 0.0f + throttleLimitOffset, 1.0f - throttleLimitOffset);
        }
    }

    // Now add in the desired throttle, but keep in a range that doesn't clip adjusted
    // roll/pitch/yaw. This could move throttle down, but also up for those low throttle flips.
    uint32_t i = 0;
    for (i = 0; i < motorCount; i++) {
        motor[i] = motorOutputMin + lrintf(motorOutputRange * (motorMix[i] + (throttle * currentMixer[i].throttle)));

        // Dshot works exactly opposite in lower 3D section.
        if (mixerInversion) {
            motor[i] = motorOutputMin + (motorOutputMax - motor[i]);
        }

        if (failsafeIsActive()) {
            if (isMotorProtocolDshot())
                motor[i] = (motor[i] < motorOutputMin) ? disarmMotorOutput : motor[i]; // Prevent getting into special reserved range

            motor[i] = constrain(motor[i], disarmMotorOutput, motorOutputMax);
        } else {
            motor[i] = constrain(motor[i], motorOutputMin, motorOutputMax);
        }

        // Motor stop handling
        if (feature(FEATURE_MOTOR_STOP) && ARMING_FLAG(ARMED) && !feature(FEATURE_3D) && !isAirmodeActive()) {
            if (((rcData[THROTTLE]) < rxConfig()->mincheck)) {
                motor[i] = disarmMotorOutput;
            }
        }
    }

    // Disarmed mode
    if (!ARMING_FLAG(ARMED)) {
        for (i = 0; i < motorCount; i++) {
            motor[i] = motor_disarmed[i];
        }
    }
}

uint16_t convertExternalToMotor(uint16_t externalValue)
{
    uint16_t motorValue = externalValue;
#ifdef USE_DSHOT
    if (isMotorProtocolDshot()) {
        // Add 1 to the value, otherwise throttle tops out at 2046
        motorValue = externalValue <= EXTERNAL_CONVERSION_MIN_VALUE ? DSHOT_DISARM_COMMAND : constrain((externalValue - EXTERNAL_DSHOT_CONVERSION_OFFSET) * EXTERNAL_DSHOT_CONVERSION_FACTOR + 1, DSHOT_MIN_THROTTLE, DSHOT_MAX_THROTTLE);

        if (feature(FEATURE_3D)) {
            if (externalValue == EXTERNAL_CONVERSION_3D_MID_VALUE) {
                motorValue = DSHOT_DISARM_COMMAND;
            } else if (motorValue >= DSHOT_MIN_THROTTLE && motorValue <= DSHOT_3D_DEADBAND_LOW) {
                // Add 1 to the value, otherwise throttle tops out at 2046
                motorValue = DSHOT_MIN_THROTTLE + (DSHOT_3D_DEADBAND_LOW - motorValue) + 1;
            }
        }
    }
#endif

    return motorValue;
}

uint16_t convertMotorToExternal(uint16_t motorValue)
{
    uint16_t externalValue = motorValue;
#ifdef USE_DSHOT
    if (isMotorProtocolDshot()) {
        if (feature(FEATURE_3D) && motorValue >= DSHOT_MIN_THROTTLE && motorValue <= DSHOT_3D_DEADBAND_LOW) {
            motorValue = DSHOT_MIN_THROTTLE + (DSHOT_3D_DEADBAND_LOW - motorValue);
        }

        externalValue = motorValue < DSHOT_MIN_THROTTLE ? EXTERNAL_CONVERSION_MIN_VALUE : constrain((motorValue / EXTERNAL_DSHOT_CONVERSION_FACTOR) + EXTERNAL_DSHOT_CONVERSION_OFFSET, EXTERNAL_CONVERSION_MIN_VALUE + 1, EXTERNAL_CONVERSION_MAX_VALUE);

        if (feature(FEATURE_3D) && motorValue == DSHOT_DISARM_COMMAND) {
            externalValue = EXTERNAL_CONVERSION_3D_MID_VALUE;
        }
    }
#endif

    return externalValue;
}
