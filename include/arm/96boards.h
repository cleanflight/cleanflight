/*
 * Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 * Copyright (c) 2015 Linaro Limited.
 * Copyright (c) 2014 Intel Corporation.
 *
 * Copied from include/arm/banana.h
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

#define MRAA_96BOARDS_LS_GPIO_COUNT 12
#define MRAA_96BOARDS_LS_I2C_COUNT  2
#define MRAA_96BOARDS_LS_SPI_COUNT  1
#define MRAA_96BOARDS_LS_UART_COUNT 2
#define MRAA_96BOARDS_LS_PIN_COUNT  40

mraa_board_t* mraa_96boards();

#ifdef __cplusplus
}
#endif
