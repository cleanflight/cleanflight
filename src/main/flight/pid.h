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

#define PID_LUX_FLOAT_MAX_I 250.0f
#define PID_LUX_FLOAT_MAX_D 300.0f
#define PID_LUX_FLOAT_MAX_PID 1000

#define GYRO_I_MAX 256                      // Gyro I limiter
#define YAW_P_LIMIT_MIN 100                 // Maximum value for yaw P limiter
#define YAW_P_LIMIT_MAX 500                 // Maximum value for yaw P limiter

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
	PID_CONTROLLER_MW23 = 0,
    PID_CONTROLLER_MWREWRITE,
    PID_CONTROLLER_LUX_FLOAT,
    PID_COUNT
} pidControllerType_e;

typedef enum {
	DELTA_FROM_ERROR = 0,
	DELTA_FROM_MEASUREMENT
} pidDeltaType_e;

#define IS_PID_CONTROLLER_FP_BASED(pidController) (pidController == PID_CONTROLLER_LUX_FLOAT)

typedef struct pidProfile_s {
    uint8_t pidController;                  // 1 = rewrite from http://www.multiwii.com/forum/viewtopic.php?f=8&t=3671, 2 = Luggi09s new baseflight pid

    uint8_t P8[PID_ITEM_COUNT];
    uint8_t I8[PID_ITEM_COUNT];
    uint8_t D8[PID_ITEM_COUNT];

    float P_f[FD_INDEX_COUNT];              // float p i and d factors for lux float pid controller
    float I_f[FD_INDEX_COUNT];
    float D_f[FD_INDEX_COUNT];
    float A_level;
    float H_level;
    uint8_t H_sensitivity;

    uint16_t yaw_p_limit;                   // set P term limit (fixed value was 300)
    float dterm_cut_hz;                     // dterm filtering
    uint8_t deltaMethod;                    // Alternative delta calculation. Delta from gyro might give smoother results

#ifdef GTUNE
    uint8_t  gtune_lolimP[FD_INDEX_COUNT];  // [0..200] Lower limit of P during G tune
    uint8_t  gtune_hilimP[FD_INDEX_COUNT];  // [0..200] Higher limit of P during G tune. 0 Disables tuning for that axis.
    uint8_t  gtune_pwr;                     // [0..10] Strength of adjustment
    uint16_t gtune_settle_time;             // [200..1000] Settle time in ms
    uint8_t  gtune_average_cycles;          // [8..128] Number of looptime cycles used for gyro average calculation
#endif
} pidProfile_t;

extern int16_t axisPID[FD_INDEX_COUNT];
extern int32_t axisPID_P[FD_INDEX_COUNT], axisPID_I[FD_INDEX_COUNT], axisPID_D[FD_INDEX_COUNT];

void pidSetController(pidControllerType_e type);
void pidResetErrorAngle(void);
void pidResetErrorGyro(void);

