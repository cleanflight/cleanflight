/*
 * kalman_filter.c
 *
 *  Created on: 30.05.2015
 *      Author: robert b
 */

#include "stdint.h"
#include "kalman_filter.h"

// the cutoff frequencies for the gyroscope and accelerometer
#define F_CUT_GYRO   160.0f
#define F_CUT_ACC    40.0f

// stripped down being a fir filter
// http://interactive-matter.eu/blog/2009/12/18/filtering-sensor-data-with-a-kalman-filter/
typedef struct
{
    float q;    // process noise covariance
    float r;    // measurement noise covariance
    float x;    // value
    float p;    // estimation error covariance
} fir_state;

// accelerometer
fir_state kax;
fir_state kay;
fir_state kaz;

// gyro
fir_state kgx;
fir_state kgy;
fir_state kgz;

void fir_filter_init(fir_state* state, float q, float r, float p, int16_t intial_value)
{
    state->q = q;
    state->r = r;
    state->p = p;
    state->x = (float) intial_value;
}

void init_fir_filter_accel(int16_t ax, int16_t ay, int16_t az)
{
#define Q 0.0625f           // process noise covariance
#define R 1.0f              // measurement noise covariance
#define P 0.2207f           // estimation error covariance
    fir_filter_init(&kax, Q, R, P, ax);
    fir_filter_init(&kay, Q, R, P, ay);
    fir_filter_init(&kaz, Q, R, P, az);
//  const float fc = 0.5f / (M_PI * F_CUT_ACC);
//  initKalman1D(&kax, mcfg.accVariance[0] * 0.5f, R, P, ax, fc);
//  initKalman1D(&kay, mcfg.accVariance[1] * 0.5f, R, P, ay, fc);
//  initKalman1D(&kaz, mcfg.accVariance[2] * 0.5f, R, P, az, fc);
#undef Q
#undef R
#undef P
}

void init_fir_filter_gyro(int16_t gx, int16_t gy, int16_t gz)
{
#define Q 1.0           // process noise covariance
#define R 0.0625        // measurement noise covariance
#define P 0.2207        // estimation error covariance
    fir_filter_init(&kgx, Q, R, P, gx);
    fir_filter_init(&kgy, Q, R, P, gy);
    fir_filter_init(&kgz, Q, R, P, gz);
//  const float fc = 0.5f / (M_PI * F_CUT_GYRO);
//  initKalman1D(&kgx, mcfg.gyroVariance[0] * 0.5f, R, P, gx, fc);
//  initKalman1D(&kgy, mcfg.gyroVariance[1] * 0.5f, R, P, gy, fc);
//  initKalman1D(&kgz, mcfg.gyroVariance[2] * 0.5f, R, P, gz, fc);

#undef Q
#undef R
#undef P
}

// all the matrix stuff is missing
// no fun with inverted matrixes...
void fir_filter_update(fir_state* state, float measurement)
{
    // prediction update
    // omit x = x
    float k; // gain

    state->p = state->p + state->q;

    // measurement update
    k = state->p / (state->p + state->r);
    state->x = state->x + k * (measurement - state->x);
    state->p = (1 - k) * state->p;
}

int16_t fir_filter_step(fir_state* state, int16_t value)
{
    float measurement = (float)value;
    fir_filter_update(state, measurement);

    // the position will be returned
    float estimate = state->x;
    if ( estimate >= 0.0f )
    {
        estimate += 0.5f;
    }
    else
    {
        estimate -= 0.5f;
    }

    return (int16_t) estimate;
}


void accFilter(int16_t acc[3])
{
    static int _init = 0;
    if (!_init)
    {
        _init = 1;
        init_fir_filter_accel(acc[0], acc[1], acc[2]);
    }
    else
    {
        acc[0] = fir_filter_step(&kax, acc[0]);
        acc[1] = fir_filter_step(&kay, acc[1]);
        acc[2] = fir_filter_step(&kaz, acc[2]);
    }
}

void gyroFilter(int16_t gyro[3])
{
    static int _init = 0;
    if (!_init)
    {
        _init = 1;
        init_fir_filter_gyro(gyro[0], gyro[1], gyro[2]);
    }
    else
    {
        gyro[0] = fir_filter_step(&kgx, gyro[0]);
        gyro[1] = fir_filter_step(&kgy, gyro[1]);
        gyro[2] = fir_filter_step(&kgz, gyro[2]);
    }
}
