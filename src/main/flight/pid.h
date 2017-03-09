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

#pragma once

#include <stdbool.h>
#include "config/parameter_group.h"

#define MAX_PID_PROCESS_DENOM       16
#define PID_CONTROLLER_BETAFLIGHT   1
#define PID_MIXER_SCALING           1000.0f
#define PID_SERVO_MIXER_SCALING     0.7f
#define PIDSUM_LIMIT                0.5f
#define PIDSUM_LIMIT_YAW            0.4f

// Scaling factors for Pids for better tunable range in configurator for betaflight pid controller. The scaling is based on legacy pid controller or previous float
#define PTERM_SCALE 0.032029f
#define ITERM_SCALE 0.244381f
#define DTERM_SCALE 0.000529f

typedef enum {
    PIDROLL,
    PIDPITCH,
    PIDYAW,
    PIDALT,
    PIDPOS,
    PIDPOSR,
    PIDNAVR,
    PIDLEVEL,
    PIDMAG,
    PIDVEL,
    PID_ITEM_COUNT
} pidIndex_e;

typedef enum {
    SUPEREXPO_YAW_OFF = 0,
    SUPEREXPO_YAW_ON,
    SUPEREXPO_YAW_ALWAYS
} pidSuperExpoYaw_e;

typedef enum {
    PID_STABILISATION_OFF = 0,
    PID_STABILISATION_ON
} pidStabilisationState_e;

typedef struct pidProfile_s {
    uint8_t P8[PID_ITEM_COUNT];
    uint8_t I8[PID_ITEM_COUNT];
    uint8_t D8[PID_ITEM_COUNT];

    uint8_t dterm_filter_type;              // Filter selection for dterm
    uint16_t dterm_lpf_hz;                  // Delta Filter in hz
    uint16_t yaw_lpf_hz;                    // Additional yaw filter when yaw axis too noisy
    uint16_t dterm_notch_hz;                // Biquad dterm notch hz
    uint16_t dterm_notch_cutoff;            // Biquad dterm notch low cutoff
    uint8_t itermWindupPointPercent;        // Experimental ITerm windup threshold, percent motor saturation
    float pidSumLimit;
    float pidSumLimitYaw;
    uint8_t dterm_average_count;            // Configurable delta count for dterm
    uint8_t vbatPidCompensation;            // Scale PIDsum to battery voltage
    uint8_t pidAtMinThrottle;               // Disable/Enable pids on zero throttle. Normally even without airmode P and D would be active.
    uint8_t levelAngleLimit;                // Max angle in degrees in level mode
    uint8_t levelSensitivity;               // Angle mode sensitivity reflected in degrees assuming user using full stick

    // Betaflight PID controller parameters
    uint16_t itermThrottleThreshold;        // max allowed throttle delta before iterm accelerated in ms
    float itermAcceleratorGain;             // Iterm Accelerator Gain when itermThrottlethreshold is hit
    uint8_t setpointRelaxRatio;             // Setpoint weight relaxation effect
    uint8_t dtermSetpointWeight;            // Setpoint weight for Dterm (0= measurement, 1= full error, 1 > agressive derivative)
    float yawRateAccelLimit;                // yaw accel limiter for deg/sec/ms
    float rateAccelLimit;                   // accel limiter roll/pitch deg/sec/ms
} pidProfile_t;

#if FLASH_SIZE <= 128
#define MAX_PROFILE_COUNT 2
#else
#define MAX_PROFILE_COUNT 3
#endif
PG_DECLARE_ARRAY(pidProfile_t, MAX_PROFILE_COUNT, pidProfiles);

typedef struct pidConfig_s {
    uint8_t pid_process_denom;              // Processing denominator for PID controller vs gyro sampling rate
} pidConfig_t;

PG_DECLARE(pidConfig_t, pidConfig);

union rollAndPitchTrims_u;
void pidController(const pidProfile_t *pidProfile, const union rollAndPitchTrims_u *angleTrim);

extern float axisPIDf[3];
extern int32_t axisPID_P[3], axisPID_I[3], axisPID_D[3];
bool airmodeWasActivated;
extern uint32_t targetPidLooptime;

// PIDweight is a scale factor for PIDs which is derived from the throttle and TPA setting, and 100 = 100% scale means no PID reduction
extern uint8_t PIDweight[3];

void pidResetErrorGyroState(void);
void pidStabilisationState(pidStabilisationState_e pidControllerState);
void pidSetTargetLooptime(uint32_t pidLooptime);
void pidSetItermAccelerator(float newItermAccelerator);
void pidInitFilters(const pidProfile_t *pidProfile);
void pidInitConfig(const pidProfile_t *pidProfile);
void pidInit(const pidProfile_t *pidProfile);

