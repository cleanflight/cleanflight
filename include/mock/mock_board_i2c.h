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

// Mock I2C device address
#define MOCK_I2C_DEV_ADDR 0x33
// Mock I2C device data registers block length in bytes. Our code assumes it's >= 1.
#define MOCK_I2C_DEV_DATA_LEN 10
// Initial value for each byte in the mock I2C device data registers
#define MOCK_I2C_DEV_DATA_INIT_BYTE 0xAB

mraa_result_t
mraa_mock_i2c_init_bus_replace(mraa_i2c_context dev);

mraa_result_t
mraa_mock_i2c_stop_replace(mraa_i2c_context dev);

mraa_result_t
mraa_mock_i2c_set_frequency_replace(mraa_i2c_context dev, mraa_i2c_mode_t mode);

mraa_result_t
mraa_mock_i2c_address_replace(mraa_i2c_context dev, uint8_t addr);

int
mraa_mock_i2c_read_replace(mraa_i2c_context dev, uint8_t* data, int length);

int
mraa_mock_i2c_read_byte_replace(mraa_i2c_context dev);

int
mraa_mock_i2c_read_byte_data_replace(mraa_i2c_context dev, uint8_t command);

int
mraa_mock_i2c_read_bytes_data_replace(mraa_i2c_context dev, uint8_t command, uint8_t* data, int length);

int
mraa_mock_i2c_read_word_data_replace(mraa_i2c_context dev, uint8_t command);

mraa_result_t
mraa_mock_i2c_write_replace(mraa_i2c_context dev, const uint8_t* data, int length);

mraa_result_t
mraa_mock_i2c_write_byte_replace(mraa_i2c_context dev, const uint8_t data);

mraa_result_t
mraa_mock_i2c_write_byte_data_replace(mraa_i2c_context dev, const uint8_t data, const uint8_t command);

mraa_result_t
mraa_mock_i2c_write_word_data_replace(mraa_i2c_context dev, const uint16_t data, const uint8_t command);

#ifdef __cplusplus
}
#endif
