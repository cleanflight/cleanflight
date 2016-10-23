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

#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include "mraa_internal.h"

mraa_result_t
mraa_mock_gpio_init_internal_replace(mraa_gpio_context dev, int pin);

mraa_result_t
mraa_mock_gpio_close_replace(mraa_gpio_context dev);

mraa_result_t
mraa_mock_gpio_dir_replace(mraa_gpio_context dev, mraa_gpio_dir_t dir);

mraa_result_t
mraa_mock_gpio_read_dir_replace(mraa_gpio_context dev, mraa_gpio_dir_t* dir);

int
mraa_mock_gpio_read_replace(mraa_gpio_context dev);

mraa_result_t
mraa_mock_gpio_write_replace(mraa_gpio_context dev, int value);

mraa_result_t
mraa_mock_gpio_edge_mode_replace(mraa_gpio_context dev, mraa_gpio_edge_t mode);

mraa_result_t
mraa_mock_gpio_isr_replace(mraa_gpio_context dev, mraa_gpio_edge_t mode, void (*fptr)(void*), void* args);

mraa_result_t
mraa_mock_gpio_isr_exit_replace(mraa_gpio_context dev);

mraa_result_t
mraa_mock_gpio_mode_replace(mraa_gpio_context dev, mraa_gpio_mode_t mode);

#ifdef __cplusplus
}
#endif
