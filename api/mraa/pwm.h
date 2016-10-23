/*
 * Author: Thomas Ingleby <thomas.c.ingleby@intel.com>
 * Copyright (c) 2014 Intel Corporation.
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#pragma once

/**
 * @file
 * @brief Pulse Width Modulation module
 *
 * PWM is the Pulse Width Modulation interface to libmraa. It allows the
 * generation of a signal on a pin. Some boards may have higher or lower levels
 * of resolution so make sure you check the board & pin you are using before
 * hand.
 *
 * @snippet cycle-pwm3.c Interesting
 */

#ifdef __cplusplus
extern "C" {
#endif

#include <stdio.h>
#include <fcntl.h>

#include "common.h"

typedef struct _pwm* mraa_pwm_context;

/**
 * Initialise pwm_context, uses board mapping
 *
 * @param pin The PWM PIN
 * @return pwm context or NULL
 */
mraa_pwm_context mraa_pwm_init(int pin);

/**
 * Initialise pwm_context, raw mode
 *
 * @param chipid The chip inwhich the PWM is under in SYSFS
 * @param pin The PWM PIN.
 * @return pwm context or NULL
 */
mraa_pwm_context mraa_pwm_init_raw(int chipid, int pin);

/**
 * Set the output duty-cycle percentage, as a float
 *
 * @param dev The Pwm context to use
 * @param percentage A floating-point value representing percentage of output.
 *    The value should lie between 0.0f (representing on 0%) and 1.0f
 *    Values above or below this range will be set at either 0.0f or 1.0f
 * @return Result of operation
 */
mraa_result_t mraa_pwm_write(mraa_pwm_context dev, float percentage);

/**
 * Read the output duty-cycle percentage, as a float
 *
 * @param dev The Pwm context to use
 * @return percentage A floating-point value representing percentage of output.
 *    The value should lie between 0.0f (representing on 0%) and 1.0f
 *    Values above or below this range will be set at either 0.0f or 1.0f
 */
float mraa_pwm_read(mraa_pwm_context dev);

/**
 * Set the PWM period as seconds represented in a float
 *
 * @param dev The Pwm context to use
 * @param seconds Period represented as a float in seconds
 * @return Result of operation
 */
mraa_result_t mraa_pwm_period(mraa_pwm_context dev, float seconds);

/**
 * Set period, milliseconds.
 *
 * @param dev The Pwm context to use
 * @param ms Milliseconds for period
 * @return Result of operation
 */
mraa_result_t mraa_pwm_period_ms(mraa_pwm_context dev, int ms);

/**
 * Set period, microseconds
 *
 * @param dev The Pwm context to use
 * @param us Microseconds as period
 * @return Result of operation
 */
mraa_result_t mraa_pwm_period_us(mraa_pwm_context dev, int us);

/**
 * Set pulsewidth, As represnted by seconds in a (float)
 *
 * @param dev The Pwm context to use
 * @param seconds The duration of a pulse
 * @return Result of operation
 */
mraa_result_t mraa_pwm_pulsewidth(mraa_pwm_context dev, float seconds);

/**
 * Set pulsewidth, milliseconds
 *
 * @param dev The Pwm context to use
 * @param ms Milliseconds for pulsewidth
 * @return Result of operation
 */
mraa_result_t mraa_pwm_pulsewidth_ms(mraa_pwm_context dev, int ms);

/**
 * Set pulsewidth, microseconds
 *
 * @param dev The Pwm context to use
 * @param us Microseconds for pulsewidth
 * @return Result of operation
 */
mraa_result_t mraa_pwm_pulsewidth_us(mraa_pwm_context dev, int us);

/**
 * Set the enable status of the PWM pin. None zero will assume on with output being driven.
 *   and 0 will disable the output.
 *
 * @param dev The pwm context to use
 * @param enable Toggle status of pin
 * @return Result of operation.
 */
mraa_result_t mraa_pwm_enable(mraa_pwm_context dev, int enable);

/**
 * Change ownership of context
 *
 * @param dev the context
 * @param owner Ownership boolean
 * @return Result of operation
 */
mraa_result_t mraa_pwm_owner(mraa_pwm_context dev, mraa_boolean_t owner);

/**
 * Close and unexport the PWM pin
 *
 * @param dev The pwm context to use
 * @return Result of operation
 */
mraa_result_t mraa_pwm_close(mraa_pwm_context dev);

/**
 * Get the maximum pwm period in us
 *
 * @param dev The pwm context to use
 * @return max pwm in us
 */
int mraa_pwm_get_max_period(mraa_pwm_context dev);

/**
 * Get the minimum pwm period in us
 *
 * @param dev The pwm context to use
 * @return min pwm in us
 */
int mraa_pwm_get_min_period(mraa_pwm_context dev);

#ifdef __cplusplus
}
#endif
