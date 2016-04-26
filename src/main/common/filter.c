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

#include "common/axis.h"
#include "common/filter.h"
#include "common/maths.h"

#define M_LN2_FLOAT 0.69314718055994530942f
#define M_PI_FLOAT  3.14159265358979323846f

#define BIQUAD_BANDWIDTH 1.9f     /* bandwidth in octaves */

// PT1 Low Pass filter (when no dT specified it will be calculated from the cycleTime)
void pt1FilterInit(pt1Filter_t *filter, uint8_t f_cut)
{
    // Pre calculate and store RC
    filter->RC = 1.0f / ( 2.0f * (float)M_PI * f_cut );
    filter->state = 0.0f;
}

float pt1FilterApply(pt1Filter_t *filter, float input, uint8_t f_cut, float dT)
{
    // Pre calculate and store RC
    if (!filter->RC) {
        filter->RC = 1.0f / ( 2.0f * (float)M_PI * f_cut );
    }

    filter->state = filter->state + dT / (filter->RC + dT) * (input - filter->state);
    return filter->state;
}

/* sets up a biquad Filter */
void biQuadFilterInit(biquad_t *filter, float filterCutFreq, uint32_t refreshRate)
{
    // zero initial samples
    filter->x1 = filter->x2 = 0;
    filter->y1 = filter->y2 = 0;

    const float sampleRate = 1 / ((float)refreshRate * 0.000001f);

    // setup variables
    const float omega = 2 * M_PI_FLOAT * filterCutFreq / sampleRate;
    const float sn = sinf(omega);
    const float cs = cosf(omega);
    const float alpha = sn * sinf(M_LN2_FLOAT /2 * BIQUAD_BANDWIDTH * omega /sn);

    const float b0 = (1 - cs) / 2;
    const float b1 = 1 - cs;
    const float b2 = (1 - cs) / 2;
    const float a0 = 1 + alpha;
    const float a1 = -2 * cs;
    const float a2 = 1 - alpha;

    // precompute the coefficients
    filter->b0 = b0 / a0;
    filter->b1 = b1 / a0;
    filter->b2 = b2 / a0;
    filter->a1 = a1 / a0;
    filter->a2 = a2 / a0;
}

/* Computes a biquad_t filter on a sample */
float biQuadFilterApply(biquad_t *filter, float input)
{
    // compute result
    const float result = filter->b0 * input + filter->b1 * filter->x1 + filter->b2 * filter->x2 -
        filter->a1 * filter->y1 - filter->a2 * filter->y2;

    // shift x1 to x2, sample to x1
    filter->x2 = filter->x1;
    filter->x1 = input;

    // shift y1 to y2, result to y1
    filter->y2 = filter->y1;
    filter->y1 = result;

    return result;
}

void firFilterInit2(firFilter_t *filter, float *buf, uint8_t bufLength, const float *coeffs, uint8_t coeffsLength)
{
    filter->buf = buf;
    filter->bufLength = bufLength;
    filter->coeffs = coeffs;
    filter->coeffsLength = coeffsLength;
    memset(filter->buf, 0, sizeof(float) * filter->bufLength);
}

void firFilterInit(firFilter_t *filter, float *buf, uint8_t bufLength, const float *coeffs)
{
    firFilterInit2(filter, buf, bufLength, coeffs, bufLength);
}

void firFilterUpdate(firFilter_t *filter, float input)
{
    memmove(&filter->buf[1], &filter->buf[0], (filter->bufLength-1) * sizeof(float));
    filter->buf[0] = input;
}

float firFilterApply(firFilter_t *filter)
{
    float ret = 0.0f;
    for (int ii = 0; ii < filter->coeffsLength; ++ii) {
        ret += filter->coeffs[ii] * filter->buf[ii];
    }
    return ret;
}

float firFilterCalcPartialAverage(firFilter_t *filter, uint8_t count)
{
    float ret = 0.0f;
    for (int ii = 0; ii < count; ++ii) {
        ret += filter->buf[ii];
    }
    return ret / count;
}

float firFilterCalcAverage(firFilter_t *filter)
{
    return firFilterCalcPartialAverage(filter, filter->coeffsLength);
}

float firFilterLastInput(firFilter_t *filter)
{
    return filter->buf[0];
}

// integer based FIR filter
// coefficients are multiples of 1/64
void firFilterInt32Init2(firFilterInt32_t *filter, int32_t *buf, uint8_t bufLength, const int8_t *coeffs, uint8_t coeffsLength)
{
    filter->buf = buf;
    filter->bufLength = bufLength;
    filter->coeffs = coeffs;
    filter->coeffsLength = coeffsLength;
    memset(filter->buf, 0, sizeof(int32_t) * filter->bufLength);
}

void firFilterInt32Init(firFilterInt32_t *filter, int32_t *buf, uint8_t bufLength, const int8_t *coeffs)
{
    firFilterInt32Init2(filter, buf, bufLength, coeffs, bufLength);
}

void firFilterInt32Update(firFilterInt32_t *filter, float input)
{
    memmove(&filter->buf[1], &filter->buf[0], (filter->bufLength-1) * sizeof(int32_t));
    filter->buf[0] = input;
}

int32_t firFilterInt32Apply(firFilterInt32_t *filter)
{
    int32_t ret = 0;
    for (int ii = 0; ii < filter->coeffsLength; ++ii) {
        ret += filter->coeffs[ii] * filter->buf[ii];
    }
    return ret / 64;
}

int32_t firFilterInt32CalcPartialAverage(firFilterInt32_t *filter, uint8_t count)
{
    int32_t ret = 0;
    for (int ii = 0; ii < count; ++ii) {
        ret += filter->buf[ii];
    }
    return ret / count;
}

int32_t firFilterInt32CalcAverage(firFilterInt32_t *filter)
{
    return firFilterInt32CalcPartialAverage(filter, filter->coeffsLength);
}

int32_t firFilterInt32LastInput(firFilterInt32_t *filter)
{
    return filter->buf[0];
}
