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

#if defined(MSYS)
#define __USE_LINUX_IOCTL_DEFS
#endif
#include <sys/ioctl.h>
#if defined(MSYS)
// There's no spidev.h on MSYS, so we need to provide our own,
// and only *after* including ioctl.h as that one contains prerequisites.
#include "linux/spi_kernel_headers.h"
#else
#include <linux/spi/spidev.h>
#endif

#include "common.h"
#include "mock/mock_board_spi.h"

mraa_result_t
mraa_mock_spi_init_raw_replace(mraa_spi_context dev, unsigned int bus, unsigned int cs)
{
    dev->clock = MOCK_SPI_DEFAULT_FREQ;

    if ((mraa_spi_mode(dev, MOCK_SPI_DEFAULT_MODE) != MRAA_SUCCESS) ||
        (mraa_spi_lsbmode(dev, MOCK_SPI_DEFAULT_LSBMODE) != MRAA_SUCCESS) ||
        (mraa_spi_bit_per_word(dev, MOCK_SPI_DEFAULT_BIT_PER_WORD) != MRAA_SUCCESS)) {
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_mock_spi_stop_replace(mraa_spi_context dev)
{
    free(dev);
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_mock_spi_bit_per_word_replace(mraa_spi_context dev, unsigned int bits)
{
    if (bits == 0) {
        syslog(LOG_ERR, "spi: bit_per_word: Cannot set to zero");
        return MRAA_ERROR_INVALID_PARAMETER;
    }

    dev->bpw = bits;
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_mock_spi_lsbmode_replace(mraa_spi_context dev, mraa_boolean_t lsb)
{
    dev->lsb = lsb;
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_mock_spi_mode_replace(mraa_spi_context dev, mraa_spi_mode_t mode)
{
    uint8_t spi_mode = 0;

    switch (mode) {
    case MRAA_SPI_MODE0:
        spi_mode = SPI_MODE_0;
        break;
    case MRAA_SPI_MODE1:
        spi_mode = SPI_MODE_1;
        break;
    case MRAA_SPI_MODE2:
        spi_mode = SPI_MODE_2;
        break;
    case MRAA_SPI_MODE3:
        spi_mode = SPI_MODE_3;
        break;
    default:
        syslog(LOG_ERR, "spi: mode: Invalid SPI mode %d selected", mode);
        return MRAA_ERROR_INVALID_PARAMETER;
    }

    dev->mode = spi_mode;
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_mock_spi_frequency_replace(mraa_spi_context dev, int hz)
{
    if (hz <= 0) {
        syslog(LOG_ERR, "spi: frequency: Cannot set to zero or negative");
        return MRAA_ERROR_INVALID_PARAMETER;
    }

    dev->clock = hz;
    return MRAA_SUCCESS;
}

int
mraa_mock_spi_write_replace(mraa_spi_context dev, uint8_t data)
{
    return (int) (data ^ MOCK_SPI_REPLY_DATA_MODIFIER_BYTE);
}

int
mraa_mock_spi_write_word_replace(mraa_spi_context dev, uint16_t data)
{
    return (int) (data ^ MOCK_SPI_REPLY_DATA_MODIFIER_WORD);
}

mraa_result_t
mraa_mock_spi_transfer_buf_replace(mraa_spi_context dev, uint8_t* data, uint8_t* rxbuf, int length)
{
    if (data == NULL) {
        syslog(LOG_ERR, "spi: transfer_buf: Incoming data is null, cannot proceed");
        return MRAA_ERROR_INVALID_PARAMETER;
    }

    if (length <= 0) {
        syslog(LOG_ERR, "spi: transfer_buf: Length given is equal to or less than zero, cannot proceed");
        return MRAA_ERROR_INVALID_PARAMETER;
    }

    if (rxbuf != NULL) {
        int i;
        for (i = 0; i < length; ++i) {
            rxbuf[i] = data[i] ^ MOCK_SPI_REPLY_DATA_MODIFIER_BYTE;
        }
    }

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_mock_spi_transfer_buf_word_replace(mraa_spi_context dev, uint16_t* data, uint16_t* rxbuf, int length)
{
    if (data == NULL) {
        syslog(LOG_ERR, "spi: transfer_buf_word: Incoming data is null, cannot proceed");
        return MRAA_ERROR_INVALID_PARAMETER;
    }

    if (length <= 0) {
        syslog(LOG_ERR, "spi: transfer_buf_word: Length given is equal to or less than zero, cannot proceed");
        return MRAA_ERROR_INVALID_PARAMETER;
    }

    if (rxbuf != NULL) {
        // length is given in bytes, but arrays are comprised of words
        int i;
        for (i = 0; i < (length / 2); ++i) {
            rxbuf[i] = data[i] ^ MOCK_SPI_REPLY_DATA_MODIFIER_WORD;
        }
    }

    return MRAA_SUCCESS;
}
