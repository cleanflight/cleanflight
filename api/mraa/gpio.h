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
 * @brief General Purpose IO
 *
 * Gpio is the General Purpose IO interface to libmraa. Its features depend on
 * the board type used, it can use gpiolibs (exported via a kernel module
 * through sysfs), or memory mapped IO via a /dev/uio device or /dev/mem
 * depending again on the board configuration.
 *
 * @snippet gpio_read6.c Interesting
 */

#ifdef __cplusplus
extern "C" {
#endif

#include <stdio.h>
#include <pthread.h>
#include "common.h"

#if defined(SWIGJAVA) || defined(JAVACALLBACK)
#include <jni.h>
void mraa_java_isr_callback(void *args);
#endif

/**
 * Opaque pointer definition to the internal struct _gpio
 */
typedef struct _gpio* mraa_gpio_context;

/**
 * Gpio Output modes
 */
typedef enum {
    MRAA_GPIO_STRONG = 0,   /**< Default. Strong high and low */
    MRAA_GPIO_PULLUP = 1,   /**< Resistive High */
    MRAA_GPIO_PULLDOWN = 2, /**< Resistive Low */
    MRAA_GPIO_HIZ = 3       /**< High Z State */
} mraa_gpio_mode_t;

/**
 * Gpio Direction options
 */
typedef enum {
    MRAA_GPIO_OUT = 0,      /**< Output. A Mode can also be set */
    MRAA_GPIO_IN = 1,       /**< Input */
    MRAA_GPIO_OUT_HIGH = 2, /**< Output. Init High */
    MRAA_GPIO_OUT_LOW = 3   /**< Output. Init Low */
} mraa_gpio_dir_t;

/**
 * Gpio Edge types for interrupts
 */
typedef enum {
    MRAA_GPIO_EDGE_NONE = 0,   /**< No interrupt on Gpio */
    MRAA_GPIO_EDGE_BOTH = 1,   /**< Interrupt on rising & falling */
    MRAA_GPIO_EDGE_RISING = 2, /**< Interrupt on rising only */
    MRAA_GPIO_EDGE_FALLING = 3 /**< Interrupt on falling only */
} mraa_gpio_edge_t;

/**
 * Initialise gpio_context, based on board number
 *
 *  @param pin Pin number read from the board, i.e IO3 is 3
 *  @returns gpio context or NULL
 */
mraa_gpio_context mraa_gpio_init(int pin);

/**
 * Initialise gpio context without any mapping to a pin
 *
 * @param gpiopin gpio pin as listed in SYSFS
 * @return gpio context or NULL
 */
mraa_gpio_context mraa_gpio_init_raw(int gpiopin);

/**
 * Set the edge mode on the gpio
 *
 * @param dev The Gpio context
 * @param mode The edge mode to set the gpio into
 * @return Result of operation
 */
mraa_result_t mraa_gpio_edge_mode(mraa_gpio_context dev, mraa_gpio_edge_t mode);

/**
 * Set an interrupt on pin
 *
 * @param dev The Gpio context
 * @param edge The edge mode to set the gpio into
 * @param fptr Function pointer to function to be called when interrupt is
 * triggered
 * @param args Arguments passed to the interrupt handler (fptr)
 * @return Result of operation
 */
mraa_result_t mraa_gpio_isr(mraa_gpio_context dev, mraa_gpio_edge_t edge, void (*fptr)(void*), void* args);

/**
 * Stop the current interrupt watcher on this Gpio, and set the Gpio edge mode
 * to MRAA_GPIO_EDGE_NONE
 *
 * @param dev The Gpio context
 * @return Result of operation
 */
mraa_result_t mraa_gpio_isr_exit(mraa_gpio_context dev);

/**
 * Set Gpio Output Mode,
 *
 * @param dev The Gpio context
 * @param mode The Gpio Output Mode
 * @return Result of operation
 */
mraa_result_t mraa_gpio_mode(mraa_gpio_context dev, mraa_gpio_mode_t mode);

/**
 * Set Gpio direction
 *
 * @param dev The Gpio context
 * @param dir The direction of the Gpio
 * @return Result of operation
 */
mraa_result_t mraa_gpio_dir(mraa_gpio_context dev, mraa_gpio_dir_t dir);

/**
 * Read Gpio direction
 *
 * @param dev The Gpio context
 * @param dir The address where to store the Gpio direction
 * @return Result of operation
 */
mraa_result_t mraa_gpio_read_dir(mraa_gpio_context dev, mraa_gpio_dir_t *dir);

/**
 * Close the Gpio context
 * - Will free the memory for the context and unexport the Gpio
 *
 * @param dev The Gpio context
 * @return Result of operation
 */
mraa_result_t mraa_gpio_close(mraa_gpio_context dev);

/**
 * Read the Gpio value. This can be 0 or 1. A resonse of -1 means that there
 * was a fatal error.
 *
 * @param dev The Gpio context
 * @return Result of operation
 */
int mraa_gpio_read(mraa_gpio_context dev);

/**
 * Write to the Gpio Value.
 *
 * @param dev The Gpio context
 * @param value Integer value to write
 * @return Result of operation
 */
mraa_result_t mraa_gpio_write(mraa_gpio_context dev, int value);

/**
 * Change ownership of the context.
 *
 * @param dev The Gpio context
 * @param owner Does this context own the pin
 * @return Result of operation
 */
mraa_result_t mraa_gpio_owner(mraa_gpio_context dev, mraa_boolean_t owner);

/**
 * Enable using memory mapped io instead of sysfs
 *
 * @param dev The Gpio context
 * @param mmap Use mmap instead of sysfs
 * @return Result of operation
 */
mraa_result_t mraa_gpio_use_mmaped(mraa_gpio_context dev, mraa_boolean_t mmap);

/**
 * Get a pin number of the gpio, invalid will return -1
 *
 * @param dev The Gpio context
 * @return Pin number
 */
int mraa_gpio_get_pin(mraa_gpio_context dev);

/**
 * Get a gpio number as used within sysfs, invalid will return -1
 *
 * @param dev The Gpio context
 * @return gpio number
 */
int mraa_gpio_get_pin_raw(mraa_gpio_context dev);

#ifdef __cplusplus
}
#endif
