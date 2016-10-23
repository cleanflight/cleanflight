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
#include "mock/mock_board_i2c.h"

mraa_result_t
mraa_mock_i2c_init_bus_replace(mraa_i2c_context dev)
{
    dev->mock_dev_addr = MOCK_I2C_DEV_ADDR;
    dev->mock_dev_data_len = MOCK_I2C_DEV_DATA_LEN;

    dev->mock_dev_data = (uint8_t*) calloc(dev->mock_dev_data_len, sizeof(uint8_t));
    if (dev->mock_dev_data == NULL) {
        syslog(LOG_CRIT, "i2c%i: init: Failed to allocate memory for mock device context", dev->busnum);
        return MRAA_ERROR_NO_RESOURCES;
    }

    // Set initial values for mock device "data registers"
    memset(dev->mock_dev_data, MOCK_I2C_DEV_DATA_INIT_BYTE, dev->mock_dev_data_len);

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_mock_i2c_stop_replace(mraa_i2c_context dev)
{
    free(dev->mock_dev_data);
    free(dev);
    return MRAA_SUCCESS;
}


mraa_result_t
mraa_mock_i2c_set_frequency_replace(mraa_i2c_context dev, mraa_i2c_mode_t mode)
{
    switch (mode) {
        case MRAA_I2C_STD:
        case MRAA_I2C_FAST:
        case MRAA_I2C_HIGH:
            return MRAA_SUCCESS;
            break;
        default:
            syslog(LOG_ERR, "i2c%i: set_frequency: Invalid I2C frequency selected", dev->busnum);
            return MRAA_ERROR_INVALID_PARAMETER;
    }
}

mraa_result_t
mraa_mock_i2c_address_replace(mraa_i2c_context dev, uint8_t addr)
{
    const uint8_t MAX_I2C_ADDR = 0x7F;

    if (addr > MAX_I2C_ADDR) {
        syslog(LOG_ERR, "i2c%i: address: Slave address 0x%X is bigger than max supported (0x%X)",
               dev->busnum, addr, MAX_I2C_ADDR);
        return MRAA_ERROR_INVALID_PARAMETER;
    }

    return MRAA_SUCCESS;
}

int
mraa_mock_i2c_read_replace(mraa_i2c_context dev, uint8_t* data, int length)
{
    if (dev->addr == dev->mock_dev_addr) {
        // Account for possible mismatch between length and our "register" range
        int copy_len = (length <= dev->mock_dev_data_len) ? length : dev->mock_dev_data_len;
        memcpy(data, dev->mock_dev_data, copy_len);
        return copy_len;
    } else {
        // Not our mock device
        return -1;
    }
}

int
mraa_mock_i2c_read_byte_replace(mraa_i2c_context dev)
{
    if (dev->addr == dev->mock_dev_addr) {
        return dev->mock_dev_data[0];
    } else {
        // Not our mock device
        return -1;
    }
}

int
mraa_mock_i2c_read_byte_data_replace(mraa_i2c_context dev, uint8_t command)
{
    if (dev->addr == dev->mock_dev_addr) {
        if (command < dev->mock_dev_data_len) {
            return dev->mock_dev_data[command];
        } else {
            syslog(LOG_ERR,
                   "i2c%i: read_byte_data: Command/register number is too big, max is 0x%X",
                   dev->busnum, dev->mock_dev_data_len - 1);
            return -1;
        }
    } else {
        // Not our mock device
        return -1;
    }
}

int
mraa_mock_i2c_read_bytes_data_replace(mraa_i2c_context dev, uint8_t command, uint8_t* data, int length)
{
    if (dev->addr == dev->mock_dev_addr) {
        if (command >= dev->mock_dev_data_len) {
            syslog(LOG_ERR,
                   "i2c%i: read_bytes_data: Command/register number is too big, max is 0x%X",
                   dev->busnum, dev->mock_dev_data_len - 1);
            return -1;
        }

        if (length <= 0) {
            syslog(LOG_ERR,
                   "i2c%i: read_bytes_data: Length to read is invalid (%d), cannot proceed",
                   dev->busnum, length);
            return -1;
        }

        int i = 0;
        // We read requested length, but only up to mock device data length
        for (i = command; (i < (command + length)) && (i < dev->mock_dev_data_len); ++i) {
            data[i - command] = dev->mock_dev_data[i];
        }
        return (i - command);
    } else {
        // Not our mock device
        return -1;
    }
}

int
mraa_mock_i2c_read_word_data_replace(mraa_i2c_context dev, uint8_t command)
{
    if (dev->addr == dev->mock_dev_addr) {
        if ((command + 1) < dev->mock_dev_data_len) {
            // Let's say the device is big-endian
            int result = (dev->mock_dev_data[command] << 8) + dev->mock_dev_data[command + 1];
            return result;
        } else {
            syslog(LOG_ERR,
                   "i2c%i: read_word_data: Command/register number is too big, max is 0x%X",
                   dev->busnum, dev->mock_dev_data_len - 2);
            return -1;
        }
    } else {
        // Not our mock device
        return -1;
    }
}

mraa_result_t
mraa_mock_i2c_write_replace(mraa_i2c_context dev, const uint8_t* data, int length)
{
    if (dev->addr == dev->mock_dev_addr) {
        int copy_len = (length <= dev->mock_dev_data_len) ? length : dev->mock_dev_data_len;
        memcpy(dev->mock_dev_data, data, copy_len);
        return MRAA_SUCCESS;
    } else {
        // Not our mock device
        return MRAA_ERROR_UNSPECIFIED;
    }
}

mraa_result_t
mraa_mock_i2c_write_byte_replace(mraa_i2c_context dev, const uint8_t data)
{
    if (dev->addr == dev->mock_dev_addr) {
        dev->mock_dev_data[0] = data;
        return MRAA_SUCCESS;
    } else {
        // Not our mock device
        return MRAA_ERROR_UNSPECIFIED;
    }
}

mraa_result_t
mraa_mock_i2c_write_byte_data_replace(mraa_i2c_context dev, const uint8_t data, const uint8_t command)
{
    if (dev->addr == dev->mock_dev_addr) {
        if (command < dev->mock_dev_data_len) {
            dev->mock_dev_data[command] = data;
            return MRAA_SUCCESS;
        } else {
            syslog(LOG_ERR,
                   "i2c%i: write_byte_data: Command/register number is too big, max is 0x%X",
                   dev->busnum, dev->mock_dev_data_len - 1);
            return MRAA_ERROR_UNSPECIFIED;
        }
    } else {
        // Not our mock device
        return MRAA_ERROR_UNSPECIFIED;
    }
}

mraa_result_t
mraa_mock_i2c_write_word_data_replace(mraa_i2c_context dev, const uint16_t data, const uint8_t command)
{
    if (dev->addr == dev->mock_dev_addr) {
        if ((command + 1) < dev->mock_dev_data_len) {
            // Let's say the device is big-endian
            dev->mock_dev_data[command] = (data & 0xFF00) >> 8;
            dev->mock_dev_data[command + 1] = data & 0x00FF;
            return MRAA_SUCCESS;
        } else {
            syslog(LOG_ERR,
                   "i2c%i: write_word_data: Command/register number is too big, max is 0x%X",
                   dev->busnum, dev->mock_dev_data_len - 2);
            return MRAA_ERROR_UNSPECIFIED;
        }
    } else {
        // Not our mock device
        return MRAA_ERROR_UNSPECIFIED;
    }
}
