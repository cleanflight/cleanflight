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
 * @brief Serial Peripheral Interface
 *
 * This file defines the spi interface for libmraa. A Spi object in libmraa
 * represents a spidev device. Linux spidev devices are created per spi bus and
 * every chip select available on that bus has another spidev 'file'. A lot
 * more information on spidev devices is available
 * [here](https://www.kernel.org/doc/Documentation/spi/spidev).
 *
 * @snippet spi_mcp4261.c Interesting
 */

#ifdef __cplusplus
extern "C" {
#endif

#include <stdio.h>
#include <fcntl.h>
#include <stdint.h>

#include "common.h"

/**
 * MRAA SPI Modes
 */
typedef enum {
    MRAA_SPI_MODE0 = 0, /**< CPOL = 0, CPHA = 0, Clock idle low, data is clocked in on rising edge,
                           output data (change) on falling edge */
    MRAA_SPI_MODE1 = 1, /**< CPOL = 0, CPHA = 1, Clock idle low, data is clocked in on falling edge,
                           output data (change) on rising edge */
    MRAA_SPI_MODE2 = 2, /**< CPOL = 1, CPHA = 0, Clock idle low, data is clocked in on falling edge,
                           output data (change) on rising edge */
    MRAA_SPI_MODE3 = 3, /**< CPOL = 1, CPHA = 1, Clock idle low, data is clocked in on rising, edge
                           output data (change) on falling edge */
} mraa_spi_mode_t;

/**
 * Opaque pointer definition to the internal struct _spi
 */
typedef struct _spi* mraa_spi_context;

/**
 * Initialise SPI_context, uses board mapping. Sets the muxes
 *
 * @param bus Bus to use, as listed in platform definition, normally 0
 * @return Spi context or NULL
 */
mraa_spi_context mraa_spi_init(int bus);

/**
 * Initialise SPI_context without any board configuration, selects a bus and a mux.
 *
 * @param bus Bus to use as listed by spidev
 * @param cs Chip select to use as listed in spidev
 * @return Spi context or NULL
 */
mraa_spi_context mraa_spi_init_raw(unsigned int bus, unsigned int cs);

/**
 * Set the SPI device mode. see spidev 0-3.
 *
 * @param dev The Spi context
 * @param mode The SPI mode, See Linux spidev
 * @return Result of operation
 */
mraa_result_t mraa_spi_mode(mraa_spi_context dev, mraa_spi_mode_t mode);

/**
 * Set the SPI device operating clock frequency.
 *
 * @param dev the Spi context
 * @param hz the frequency in hz
 * @return Result of operation
 */
mraa_result_t mraa_spi_frequency(mraa_spi_context dev, int hz);

/**
 * Write Single Byte to the SPI device.
 *
 * @param dev The Spi context
 * @param data Data to send
 * @return Data received on the miso line or -1 in case of error
 */
int mraa_spi_write(mraa_spi_context dev, uint8_t data);

/**
 * Write Two Bytes to the SPI device.
 *
 * @param dev The Spi context
 * @param data Data to send
 * @return Data received on the miso line
 */
int mraa_spi_write_word(mraa_spi_context dev, uint16_t data);

/**
 * Write Buffer of bytes to the SPI device. The pointer return has to be
 * free'd by the caller. It will return a NULL pointer in cases of error.
 *
 * @param dev The Spi context
 * @param data to send
 * @param length elements within buffer, Max 4096
 * @return Data received on the miso line, same length as passed in
 */
uint8_t* mraa_spi_write_buf(mraa_spi_context dev, uint8_t* data, int length);

/**
 * Write Buffer of uint16 to the SPI device. The pointer return has to be
 * free'd by the caller. It will return a NULL pointer in cases of error.
 *
 * @param dev The Spi context
 * @param data to send
 * @param length elements (in bytes) within buffer, Max 4096
 * @return Data received on the miso line, same length as passed in
 */
uint16_t* mraa_spi_write_buf_word(mraa_spi_context dev, uint16_t* data, int length);

/**
 * Transfer Buffer of bytes to the SPI device. Both send and recv buffers
 * are passed in
 *
 * @param dev The Spi context
 * @param data to send
 * @param rxbuf buffer to recv data back, may be NULL
 * @param length elements within buffer, Max 4096
 * @return Result of operation
 */
mraa_result_t mraa_spi_transfer_buf(mraa_spi_context dev, uint8_t* data, uint8_t* rxbuf, int length);

/**
 * Transfer Buffer of uint16 to the SPI device. Both send and recv buffers
 * are passed in
 *
 * @param dev The Spi context
 * @param data to send
 * @param rxbuf buffer to recv data back, may be NULL
 * @param length elements (in bytes) within buffer, Max 4096
 * @return Result of operation
 */
mraa_result_t mraa_spi_transfer_buf_word(mraa_spi_context dev, uint16_t* data, uint16_t* rxbuf, int length);

/**
 * Change the SPI lsb mode
 *
 * @param dev The Spi context
 * @param lsb Use least significant bit transmission. 0 for msbi
 * @return Result of operation
 */
mraa_result_t mraa_spi_lsbmode(mraa_spi_context dev, mraa_boolean_t lsb);

/**
 * Set bits per mode on transaction, defaults at 8
 *
 * @param dev The Spi context
 * @param bits bits per word
 * @return Result of operation
 */
mraa_result_t mraa_spi_bit_per_word(mraa_spi_context dev, unsigned int bits);

/**
 * De-inits an mraa_spi_context device
 *
 * @param dev The Spi context
 * @return Result of operation
 */
mraa_result_t mraa_spi_stop(mraa_spi_context dev);

#ifdef __cplusplus
}
#endif
