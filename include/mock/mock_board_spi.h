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

#define MOCK_SPI_DEFAULT_FREQ 4000000
#define MOCK_SPI_DEFAULT_MODE MRAA_SPI_MODE0
#define MOCK_SPI_DEFAULT_LSBMODE 0
#define MOCK_SPI_DEFAULT_BIT_PER_WORD 8
// This is XORed with each byte/word of the transmitted message to get the received one
#define MOCK_SPI_REPLY_DATA_MODIFIER_BYTE 0xAB
#define MOCK_SPI_REPLY_DATA_MODIFIER_WORD 0xABBA

mraa_result_t
mraa_mock_spi_init_raw_replace(mraa_spi_context dev, unsigned int bus, unsigned int cs);

mraa_result_t
mraa_mock_spi_stop_replace(mraa_spi_context dev);

mraa_result_t
mraa_mock_spi_bit_per_word_replace(mraa_spi_context dev, unsigned int bits);

mraa_result_t
mraa_mock_spi_lsbmode_replace(mraa_spi_context dev, mraa_boolean_t lsb);

mraa_result_t
mraa_mock_spi_mode_replace(mraa_spi_context dev, mraa_spi_mode_t mode);

mraa_result_t
mraa_mock_spi_frequency_replace(mraa_spi_context dev, int hz);

int
mraa_mock_spi_write_replace(mraa_spi_context dev, uint8_t data);

int
mraa_mock_spi_write_word_replace(mraa_spi_context dev, uint16_t data);

mraa_result_t
mraa_mock_spi_transfer_buf_replace(mraa_spi_context dev, uint8_t* data, uint8_t* rxbuf, int length);

mraa_result_t
mraa_mock_spi_transfer_buf_word_replace(mraa_spi_context dev, uint16_t* data, uint16_t* rxbuf, int length);

#ifdef __cplusplus
}
#endif
