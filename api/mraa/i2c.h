/*
 * Author: Brendan Le Foll <brendan.le.foll@intel.com>
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
 * @brief Inter-Integrated Circuit
 *
 * An i2c context represents a master on an i2c bus and that context can
 * communicate to multiple i2c slaves by configuring the address.
 * @htmlinclude i2c.txt
 *
 * @snippet i2c_HMC5883L.c Interesting
 */

#ifdef __cplusplus
extern "C" {
#endif

#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdint.h>

#include "common.h"
#include "gpio.h"

/**
 * Opaque pointer definition to the internal struct _i2c
 */
typedef struct _i2c* mraa_i2c_context;

/**
 * Initialise i2c context, using board defintions
 *
 * @param bus i2c bus to use
 * @return i2c context or NULL
 */
mraa_i2c_context mraa_i2c_init(int bus);

/**
 * Initialise i2c context, passing in the i2c bus to use.
 *
 * @param bus The i2c bus to use i.e. /dev/i2c-2 would be "2"
 * @return i2c context or NULL
 */
mraa_i2c_context mraa_i2c_init_raw(unsigned int bus);

/**
 * Sets the frequency of the i2c context. Most platforms do not support this.
 *
 * @param dev The i2c context
 * @param mode The bus mode
 * @return Result of operation
 */
mraa_result_t mraa_i2c_frequency(mraa_i2c_context dev, mraa_i2c_mode_t mode);

/**
 * Simple bulk read from an i2c context
 *
 * @param dev The i2c context
 * @param data pointer to the byte array to read data in to
 * @param length max number of bytes to read
 * @return length of the read in bytes or -1
 */
int mraa_i2c_read(mraa_i2c_context dev, uint8_t* data, int length);

/**
 * Simple read for a single byte from the i2c context
 *
 * @param dev The i2c context
 * @return The result of the read or -1 if failed
 */
int mraa_i2c_read_byte(mraa_i2c_context dev);

/**
 * Read a single byte from i2c context, from designated register
 *
 * @param dev The i2c context
 * @param command The register
 * @return The result of the read or -1 if failed
 */
int mraa_i2c_read_byte_data(mraa_i2c_context dev, const uint8_t command);

/**
 * Read a single word from i2c context, from designated register
 *
 * @param dev The i2c context
 * @param command The register
 * @return The result of the read or -1 if failed
 */
int mraa_i2c_read_word_data(mraa_i2c_context dev, const uint8_t command);

/**
 * Bulk read from i2c context, starting from designated register
 *
 * @param dev The i2c context
 * @param command The register
 * @param data pointer to the byte array to read data in to
 * @param length max number of bytes to read
 * @return The length in bytes passed to the function or -1
 */
int mraa_i2c_read_bytes_data(mraa_i2c_context dev, uint8_t command, uint8_t* data, int length);

/**
 * Write length bytes to the bus, the first byte in the array is the
 * command/register to write
 *
 * @param dev The i2c context
 * @param data pointer to the byte array to be written
 * @param length the number of bytes to transmit
 * @return Result of operation
 */
mraa_result_t mraa_i2c_write(mraa_i2c_context dev, const uint8_t* data, int length);

/**
 * Write a single byte to an i2c context
 *
 * @param dev The i2c context
 * @param data The byte to write
 * @return Result of operation
 */
mraa_result_t mraa_i2c_write_byte(mraa_i2c_context dev, const uint8_t data);

/**
 * Write a single byte to an i2c context
 *
 * @param dev The i2c context
 * @param data The byte to write
 * @param command The register
 * @return Result of operation
 */
mraa_result_t mraa_i2c_write_byte_data(mraa_i2c_context dev, const uint8_t data, const uint8_t command);

/**
 * Write a single word to an i2c context
 *
 * @param dev The i2c context
 * @param data The word to write
 * @param command The register
 * @return Result of operation
 */
mraa_result_t mraa_i2c_write_word_data(mraa_i2c_context dev, const uint16_t data, const uint8_t command);

/**
 * Sets the i2c slave address.
 *
 * @param dev The i2c context
 * @param address The address to set for the slave (7-bit address)
 * @return Result of operation
 */
mraa_result_t mraa_i2c_address(mraa_i2c_context dev, uint8_t address);

/**
 * De-inits an mraa_i2c_context device
 *
 * @param dev The i2c context
 * @return Result of operation
 */
mraa_result_t mraa_i2c_stop(mraa_i2c_context dev);

#ifdef __cplusplus
}
#endif
