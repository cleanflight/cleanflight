/*
 * Author: Nandkishor Sonar
 * Author: Brendan Le Foll <brendan.le.foll@intel.com>
 * Copyright (c) 2014-2016 Intel Corporation.
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

#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>

#include "aio.h"
#include "mraa_internal.h"

#define DEFAULT_BITS 10

static int raw_bits;

static mraa_result_t
aio_get_valid_fp(mraa_aio_context dev)
{
    if (IS_FUNC_DEFINED(dev, aio_get_valid_fp)) {
        return dev->advance_func->aio_get_valid_fp(dev);
    }

    char file_path[64] = "";

    // Open file Analog device input channel raw voltage file for reading.
    snprintf(file_path, 64, "/sys/bus/iio/devices/iio:device0/in_voltage%d_raw", dev->channel);

    dev->adc_in_fp = open(file_path, O_RDONLY);
    if (dev->adc_in_fp == -1) {
        syslog(LOG_ERR, "aio: Failed to open input raw file %s for reading!", file_path);
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    return MRAA_SUCCESS;
}

static mraa_aio_context
mraa_aio_init_internal(mraa_adv_func_t* func_table, int aio, unsigned int channel)
{
    mraa_aio_context dev = calloc(1, sizeof(struct _aio));
    if (dev == NULL) {
        return NULL;
    }
    dev->advance_func = func_table;

    if (IS_FUNC_DEFINED(dev, aio_init_internal_replace)) {
        if (dev->advance_func->aio_init_internal_replace(dev, aio) == MRAA_SUCCESS) {
            return dev;
        }
        free(dev);
        return NULL;
    }

    dev->channel = channel;

    // Open valid  analog input file and get the pointer.
    if (MRAA_SUCCESS != aio_get_valid_fp(dev)) {
        free(dev);
        return NULL;
    }

    return dev;
}

mraa_aio_context
mraa_aio_init(unsigned int aio)
{
    mraa_board_t* board = plat;
    int pin;
    if (board == NULL) {
        syslog(LOG_ERR, "aio: Platform not initialised");
        return NULL;
    }
    if (mraa_is_sub_platform_id(aio)) {
        syslog(LOG_NOTICE, "aio: Using sub platform");
        board = board->sub_platform;
        if (board == NULL) {
            syslog(LOG_ERR, "aio: Sub platform Not Initialised");
            return NULL;
        }
        aio = mraa_get_sub_platform_index(aio);
    }

    // aio are always past the gpio_count in the pin array
    pin = aio + board->gpio_count;

    if (pin < 0 || pin >= board->phy_pin_count) {
        syslog(LOG_ERR, "aio: pin %i beyond platform definition", pin);
        return NULL;
    }
    if (aio >= board->aio_count) {
        syslog(LOG_ERR, "aio: requested channel out of range");
        return NULL;
    }
    if (board->pins[pin].capabilities.aio != 1) {
        syslog(LOG_ERR, "aio: pin %i not capable of aio", pin);
        return NULL;
    }
    if (board->pins[pin].aio.mux_total > 0) {
        if (mraa_setup_mux_mapped(board->pins[pin].aio) != MRAA_SUCCESS) {
            syslog(LOG_ERR, "aio: unable to setup multiplexers for pin");
            return NULL;
        }
    }

    // Create ADC device connected to specified channel
    mraa_aio_context dev = mraa_aio_init_internal(board->adv_func, aio, board->pins[pin].aio.pinmap);
    if (dev == NULL) {
        syslog(LOG_ERR, "aio: Insufficient memory for specified input channel %d", aio);
        return NULL;
    }
    dev->value_bit = DEFAULT_BITS;

    if (IS_FUNC_DEFINED(dev, aio_init_pre)) {
        mraa_result_t pre_ret = (dev->advance_func->aio_init_pre(aio));
        if (pre_ret != MRAA_SUCCESS) {
            free(dev);
            return NULL;
        }
    }

    if (IS_FUNC_DEFINED(dev, aio_init_post)) {
        mraa_result_t ret = dev->advance_func->aio_init_post(dev);
        if (ret != MRAA_SUCCESS) {
            free(dev);
            return NULL;
        }
    }

    raw_bits = mraa_adc_raw_bits();

    return dev;
}

int
mraa_aio_read(mraa_aio_context dev)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "aio: read: context is invalid");
        return -1;
    }

    if (IS_FUNC_DEFINED(dev, aio_read_replace)) {
        return dev->advance_func->aio_read_replace(dev);
    }

    char buffer[17];
    unsigned int shifter_value = 0;

    if (dev->adc_in_fp == -1) {
        if (aio_get_valid_fp(dev) != MRAA_SUCCESS) {
            syslog(LOG_ERR, "aio: Failed to get to the device");
            return -1;
        }
    }

    lseek(dev->adc_in_fp, 0, SEEK_SET);
    if (read(dev->adc_in_fp, buffer, sizeof(buffer)) < 1) {
        syslog(LOG_ERR, "aio: Failed to read a sensible value");
    }
    // force NULL termination of string
    buffer[16] = '\0';
    lseek(dev->adc_in_fp, 0, SEEK_SET);

    errno = 0;
    char* end;
    unsigned int analog_value = (unsigned int) strtoul(buffer, &end, 10);
    if (end == &buffer[0]) {
        syslog(LOG_ERR, "aio: Value is not a decimal number");
        return -1;
    } else if (errno != 0) {
        syslog(LOG_ERR, "aio: Errno was set");
        return -1;
    }

    if (dev->value_bit != raw_bits) {
        /* Adjust the raw analog input reading to supported resolution value*/
        if (raw_bits > dev->value_bit) {
            shifter_value = raw_bits - dev->value_bit;
            analog_value = analog_value >> shifter_value;
        } else {
            shifter_value = dev->value_bit - raw_bits;
            analog_value = analog_value << shifter_value;
        }
    }

    return analog_value;
}

float
mraa_aio_read_float(mraa_aio_context dev)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "aio: Device not valid");
        return -1.0;
    }

    float max_analog_value = (1 << dev->value_bit) - 1;
    unsigned int analog_value_int = mraa_aio_read(dev);

    return analog_value_int / max_analog_value;
}

mraa_result_t
mraa_aio_close(mraa_aio_context dev)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "aio: close: context is invalid");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (IS_FUNC_DEFINED(dev, aio_close_replace)) {
        return dev->advance_func->aio_close_replace(dev);
    }

    if (dev->adc_in_fp != -1) {
        close(dev->adc_in_fp);
    }

    free(dev);

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_aio_set_bit(mraa_aio_context dev, int bits)
{
    if (dev == NULL || bits < 1) {
        syslog(LOG_ERR, "aio: Device not valid");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    dev->value_bit = bits;
    return MRAA_SUCCESS;
}

int
mraa_aio_get_bit(mraa_aio_context dev)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "aio: Device not valid");
        return 0;
    }
    return dev->value_bit;
}
