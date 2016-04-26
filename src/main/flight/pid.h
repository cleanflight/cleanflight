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

#define PID_MAX_I 256
#define PID_MAX_D 512
#define PID_MAX_TOTAL_PID 1000

#define GYRO_I_MAX 256                      // Gyro I limiter
#define YAW_P_LIMIT_MIN 100                 // Maximum value for yaw P limiter
#define YAW_P_LIMIT_MAX 500                 // Maximum value for yaw P limiter

#define PID_GYRO_RATE_BUF_LENGTH 8
#define PID_DTERM_FIR_MAX_LENGTH 8
#define PID_MAX_DIFFERENTIATOR (PID_DTERM_FIR_MAX_LENGTH-2)
#define PID_DTERM_AVERAGE_FILTER_MAX_LENGTH 8

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

typedef struct pidProfile_s {
    uint8_t  P8[PID_ITEM_COUNT];
    uint8_t  I8[PID_ITEM_COUNT];
    uint8_t  D8[PID_ITEM_COUNT];
    uint8_t  pidController;
    uint8_t  dterm_differentiator;          // dterm noise-robust differentiator
    uint16_t dterm_lpf_hz;                  // dterm low pass filter frequency
    uint8_t  dterm_lpf_biquad;              // dterm use biquad low pass filter
    uint8_t  dterm_average_count;
    uint16_t yaw_p_limit;                   // yaw P term limit (fixed value was 300)
} pidProfile_t;

PG_DECLARE_PROFILE(pidProfile_t, pidProfile);


extern int16_t axisPID[FD_INDEX_COUNT];
extern int32_t axisPID_P[FD_INDEX_COUNT], axisPID_I[FD_INDEX_COUNT], axisPID_D[FD_INDEX_COUNT];

float pidScaleITermToRcInput(int axis);
void pidSetController(pidControllerType_e type);
void pidResetITermAngle(void);
void pidResetITerm(void);

