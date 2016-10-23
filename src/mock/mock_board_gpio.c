/*
 * Author: Alex Tereschenko <alext.mkrs@gmail.com>
 * Copyright (c) 2016 Alex Tereschenko.
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
#include <string.h>

#include "common.h"
#include "mock/mock_board_gpio.h"

mraa_result_t
mraa_mock_gpio_init_internal_replace(mraa_gpio_context dev, int pin)
{
    dev->value_fp = -1;
    dev->isr_value_fp = -1;
    dev->isr_thread_terminating = 0;
    dev->phy_pin = pin;
    // We are always the owner
    dev->owner = 1;
#ifndef HAVE_PTHREAD_CANCEL
    dev->isr_control_pipe[0] = dev->isr_control_pipe[1] = -1;
#endif

    // We start as INPUT and LOW
    dev->mock_dir = MRAA_GPIO_IN;
    dev->mock_state = 0;

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_mock_gpio_close_replace(mraa_gpio_context dev)
{
    free(dev);
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_mock_gpio_dir_replace(mraa_gpio_context dev, mraa_gpio_dir_t dir)
{
    switch (dir) {
        case MRAA_GPIO_OUT_HIGH:
            dev->mock_dir = MRAA_GPIO_OUT;
            return mraa_gpio_write(dev, 1);
        case MRAA_GPIO_OUT_LOW:
            dev->mock_dir = MRAA_GPIO_OUT;
            return mraa_gpio_write(dev, 0);
        case MRAA_GPIO_IN:
        case MRAA_GPIO_OUT:
            dev->mock_dir = dir;
            return MRAA_SUCCESS;
        default:
            syslog(LOG_ERR, "gpio: dir: invalid direction '%d' to set", (int) dir);
            return MRAA_ERROR_INVALID_PARAMETER;
    }
}

mraa_result_t
mraa_mock_gpio_read_dir_replace(mraa_gpio_context dev, mraa_gpio_dir_t* dir)
{
    *dir = dev->mock_dir;
    return MRAA_SUCCESS;
}

int
mraa_mock_gpio_read_replace(mraa_gpio_context dev)
{
    return dev->mock_state;
}

mraa_result_t
mraa_mock_gpio_write_replace(mraa_gpio_context dev, int value)
{
    if ((value < 0) || (value > 1)) {
        syslog(LOG_ERR, "gpio: write: incorrect value '%d' passed to write(), must be 0 or 1", value);
        return MRAA_ERROR_INVALID_PARAMETER;
    }

    if (dev->mock_dir == MRAA_GPIO_IN) {
        syslog(LOG_ERR, "gpio: write: cannot write to pin set to INPUT");
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    dev->mock_state = value;
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_mock_gpio_edge_mode_replace(mraa_gpio_context dev, mraa_gpio_edge_t mode)
{
    return MRAA_ERROR_FEATURE_NOT_IMPLEMENTED;
}

mraa_result_t
mraa_mock_gpio_isr_replace(mraa_gpio_context dev, mraa_gpio_edge_t mode, void (*fptr)(void*), void* args)
{
    return MRAA_ERROR_FEATURE_NOT_IMPLEMENTED;
}

mraa_result_t
mraa_mock_gpio_isr_exit_replace(mraa_gpio_context dev)
{
    return MRAA_ERROR_FEATURE_NOT_IMPLEMENTED;
}

mraa_result_t
mraa_mock_gpio_mode_replace(mraa_gpio_context dev, mraa_gpio_mode_t mode)
{
    return MRAA_ERROR_FEATURE_NOT_IMPLEMENTED;
}
