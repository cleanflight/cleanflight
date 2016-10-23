/*
 * Author: Brendan Le Foll <brendan.le.foll@intel.com>
 * Copyright (c) 2016 Intel Corporation.
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
 * @brief Firmata IO
 *
 * Firmata IO lets you SYSEX messages construct and ask for a callback on a
 * SYSEX messages. This is meant to provide a way to call custom firmata APIs
 * especially using the Custom firmata API
 *
 * @snippet firmata_curie_imu.c Interesting
 */

#ifdef __cplusplus
extern "C" {
#endif

#include "common.h"

/**
 * Opaque pointer definition to the internal struct _firmata. This context
 * refers to one firmata 'extension' letting you write/return SYSEX messages
 * directly
 */
typedef struct _firmata* mraa_firmata_context;

/**
 * Initialise firmata context on a feature. This feature is what will be
 * listened on if you request a response callback
 *
 * @param firmata feature
 * @return firmata context or NULL
 */
mraa_firmata_context mraa_firmata_init(int feature);

/**
 * Sends a custom SYSEX message to the firmata board.
 *
 * @param dev The Firmata context
 * @param msg The SYSEX message
 * @param length The length of the sysex message
 */
mraa_result_t mraa_firmata_write_sysex(mraa_firmata_context dev, char* msg, int length);

/**
 * Set a callback on 'feature'. This function is not thread safe and threads
 * calling it need to make sure they are the only thread calling this.
 *
 * @param dev The Firmata context
 * @param fptr Function pointer to function to be called when interrupt is
 * triggered, the returned buffer and length are the arguments.
 * @return Result of operation
 */
mraa_result_t mraa_firmata_response(mraa_firmata_context dev, void (*fptr)(uint8_t*, int));

/**
 * Stop getting events on feature. This is more efficient than mraa_firmata_close
 * as it can be re-enabled without adding a feature
 *
 * @param dev The Firmata context
 * @return Result of operation
 */
mraa_result_t mraa_firmata_response_stop(mraa_firmata_context dev);

/**
 * Free all firmata handle resources, this will leave an element in an array
 * internally that will be skipped, avoid closing many firmata contexts often
 * as there is a cost to doing this
 *
 * @param dev The Firmata context
 * @return Result of operation
 */
mraa_result_t mraa_firmata_close(mraa_firmata_context dev);

#ifdef __cplusplus
}
#endif
