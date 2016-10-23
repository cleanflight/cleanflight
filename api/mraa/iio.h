/*
 * Author: Brendan Le Foll <brendan.le.foll@intel.com>
 * Copyright (c) 2015 Intel Corporation.
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

#include "common.h"
#include "iio_kernel_headers.h"

typedef struct {
    int index;
    int enabled;
    char* type;
    mraa_boolean_t lendian;
    int signedd;
    unsigned int offset;
    uint64_t mask;
    unsigned int bits_used;
    unsigned int bytes;
    unsigned int shift;
    unsigned int location;
} mraa_iio_channel;

typedef struct {
    char* name;
    int enabled;
} mraa_iio_event;

/**
 * @file
 * @brief iio
 *
 * An iio context represents an IIO device
 *
 * @snippet iio_driver.c Interesting
 */

#ifdef __cplusplus
extern "C" {
#endif

#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdint.h>

#include "common.h"

/**
 * Opaque pointer definition to the internal struct _iio
 */
typedef struct _iio* mraa_iio_context;

/**
 * Initialise iio context
 *
 * @param bus iio device to use
 * @return i2c context or NULL
 */
mraa_iio_context mraa_iio_init(int device);

mraa_result_t mraa_iio_trigger_buffer(mraa_iio_context dev, void (*fptr)(char* data), void* args);

const char* mraa_iio_get_device_name(mraa_iio_context dev);

int mraa_iio_get_device_num_by_name(const char* name);

int mraa_iio_read_size(mraa_iio_context dev);

mraa_iio_channel* mraa_iio_get_channels(mraa_iio_context dev);

int mraa_iio_get_channel_count(mraa_iio_context dev);

mraa_result_t mraa_iio_read_float(mraa_iio_context dev, const char* filename, float* data);

mraa_result_t mraa_iio_read_int(mraa_iio_context dev, const char* filename, int* data);

mraa_result_t mraa_iio_read_string(mraa_iio_context dev, const char* filename, char* data, int max_len);

mraa_result_t mraa_iio_write_float(mraa_iio_context dev, const char* attr_chan, const float data);

mraa_result_t mraa_iio_write_int(mraa_iio_context dev, const char* attr_chan, const int data);

mraa_result_t mraa_iio_write_string(mraa_iio_context dev, const char* attr_chan, const char* data);

mraa_result_t mraa_iio_get_channel_data(mraa_iio_context dev);

mraa_result_t mraa_iio_get_event_data(mraa_iio_context dev);

mraa_result_t mraa_iio_event_poll(mraa_iio_context dev, struct iio_event_data* data);

mraa_result_t
mraa_iio_event_setup_callback(mraa_iio_context dev, void (*fptr)(struct iio_event_data* data, void* args), void* args);

mraa_result_t mraa_iio_event_extract_event(struct iio_event_data* event,
                                           int* chan_type,
                                           int* modifier,
                                           int* type,
                                           int* direction,
                                           int* channel,
                                           int* channel2,
                                           int* different);

mraa_result_t mraa_iio_get_mount_matrix(mraa_iio_context dev, const char *sysfs_name, float mm[9]);

mraa_result_t mraa_iio_create_trigger(mraa_iio_context dev, const char* trigger);

mraa_result_t mraa_iio_update_channels(mraa_iio_context dev);
/**
 * De-inits an mraa_iio_context device
 *
 * @param dev The iio context
 * @return Result of operation
 */
mraa_result_t mraa_iio_close(mraa_iio_context dev);

#ifdef __cplusplus
}
#endif
