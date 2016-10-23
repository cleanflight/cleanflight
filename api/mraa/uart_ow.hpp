/*
 * Author: Jon Trulson <jtrulson@ics.com>
 * Copyright (c) 2016 Intel Corporation
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

#include "uart_ow.h"
#include "types.hpp"
#include <stdexcept>
#include <cstring>

namespace mraa
{

/**
 * @brief API for UART One Wire
 *
 * This file defines the UartOW (UART to Dallas 1-wire) interface for libmraa
 *
 * @snippet UartOW.cpp Interesting
 */
class UartOW
{
  public:
    /**
     * UartOW Constructor, takes a pin number which will map directly to the
     * linux uart number, this 'enables' the uart, nothing more
     *
     * @throws std::invalid_argument in case of error
     * @param uart the index of the uart to use
     */
    UartOW(int uart)
    {
        m_uart = mraa_uart_ow_init(uart);

        if (m_uart == NULL) {
            throw std::invalid_argument("Error initialising UART_OW");
        }
    }

    /**
     * UartOW Constructor, takes a string to the path of the serial
     * interface that is needed.
     *
     * @throws std::invalid_argument in case of error
     * @param path the file path for the UART to use
     */
    UartOW(std::string path)
    {
        m_uart = mraa_uart_ow_init_raw(path.c_str());

        if (m_uart == NULL) {
            throw std::invalid_argument("Error initialising UART");
        }
    }

    /**
     * Uart destructor
     */
    ~UartOW()
    {
        mraa_uart_ow_stop(m_uart);
    }

    /**
     * Get string with tty device path within Linux
     * For example. Could point to "/dev/ttyS0"
     *
     * @return char pointer of device path
     */
    std::string
    getDevicePath()
    {
        std::string ret_val(mraa_uart_ow_get_dev_path(m_uart));
        return ret_val;
    }

    /**
     * Read a byte from the 1-wire bus
     *
     * @throws std::invalid_argument in case of error
     * @return the byte read
     */
    uint8_t
    readByte()
    {
        int res = mraa_uart_ow_read_byte(m_uart);
        if (res == -1) {
            throw std::invalid_argument("Unknown UART_OW error");
        }
        return (uint8_t) res;
    }

    /**
     * Write a byte to a 1-wire bus
     *
     * @param byte the byte to write to the bus
     *
     * @throws std::invalid_argument in case of error
     * @return the byte read back during the time slot
     */
    uint8_t
    writeByte(uint8_t byte)
    {
        int res = mraa_uart_ow_write_byte(m_uart, byte);
        if (res == -1) {
            throw std::invalid_argument("Unknown UART_OW error");
        }
        return (uint8_t) res;
    }

    /**
     * Write a bit to a 1-wire bus and read a bit corresponding to the
     * time slot back.  This is possible due to the way we wired the TX
     * and RX together with a diode, forming a loopback.
     *
     * @param bit the bit to write to the bus
     * @throws std::invalid_argument in case of error
     * @return the bit read back during the time slot
     */
    bool
    writeBit(bool bit)
    {
        int res = mraa_uart_ow_bit(m_uart, (bit) ? 1 : 0);
        if (res == -1) {
            throw std::invalid_argument("Unknown UART_OW error");
        }
        return ((res) ? true : false);
    }

    /**
     * Send a reset pulse to the 1-wire bus and test for device presence
     *
     * @return one of the mraa::Result values
     */
    mraa::Result
    reset()
    {
        return (mraa::Result) mraa_uart_ow_reset(m_uart);
    }

    /**
     * Begin a rom code search of the 1-wire bus.  This function
     * implements the 1-wire search algorithm.  See the uart_ow.c example
     * for an idea on how to use this function to identify all devices
     * present on the bus.
     *
     * @param start true to start a search from scratch, false to
     * continue a previously started search
     * @param id the 8-byte rom code id of the current matched device when a
     * device is found
     * @return one of the mraa::Result values
     */
    mraa::Result
    search(bool start, uint8_t* id)
    {
        return (mraa::Result) mraa_uart_ow_rom_search(m_uart, (start) ? 1 : 0, id);
    }

    /**
     * Begin a rom code search of the 1-wire bus.  This function
     * implements the 1-wire search algorithm.  See the UartOW.cpp
     * example for an idea on how to use this function to identify all
     * devices present on the bus.
     *
     * @param start true to start a search from scratch, false to
     * continue a previously started search
     * @return an empty string if no [more] devices are found, or a
     * string containing the 8-byte romcode of a detected device.
     */
    std::string
    search(bool start)
    {
        uint8_t id[MRAA_UART_OW_ROMCODE_SIZE];
        mraa_result_t rv;

        rv = mraa_uart_ow_rom_search(m_uart, (start) ? 1 : 0, id);

        if (rv == MRAA_SUCCESS) {
            // we found one
            std::string idStr((char*) id, MRAA_UART_OW_ROMCODE_SIZE);
            return idStr;
        } else {
            // failure, or end of search
            return "";
        }
    }

    /**
     * Send a command byte to a device on the 1-wire bus
     *
     * @param command the command byte to send
     * @param id the rom code id of the device to receive the command,
     * NULL for all devices on the bus
     * @return one of the mraa::Result values
     */
    mraa::Result
    command(uint8_t command, uint8_t* id)
    {
        return (mraa::Result) mraa_uart_ow_command(m_uart, command, id);
    }

    /**
     * Send a command byte to a device on the 1-wire bus, supplying
     * the id as a std::string
     *
     * @param command the command byte to send
     * @param id std::string representing the code id of the device to
     * receive the command, or an empty string for all devices on the
     * bus.  This string should be 8 bytes in size.
     * @return one of the mraa::Result values
     */
    mraa::Result
    command(uint8_t command, std::string id)
    {
        if (id.empty() == 0)
            return (mraa::Result) mraa_uart_ow_command(m_uart, command, NULL);
        else {
            if (id.size() != 8) {
                // Only 8 byte romcodes are legal.
                throw std::invalid_argument(std::string(__FUNCTION__) +
                                            ": id must be 8 bytes only");
            }
            return (mraa::Result) mraa_uart_ow_command(m_uart, command, (uint8_t*) id.c_str());
        }
    }

    /**
     * Perform a Dallas 1-wire compliant CRC8 computation on a buffer
     *
     * @param buffer the buffer containing the data
     * @param length the length of the buffer
     * @return the computed CRC
     */
    uint8_t
    crc8(uint8_t* buffer, uint16_t length)
    {
        return mraa_uart_ow_crc8(buffer, length);
    }

    /**
     * Perform a Dallas 1-wire compliant CRC8 computation on a
     * std::string based buffer
     *
     * @param buffer std::string buffer containing the data
     * @return the computed CRC
     */
    uint8_t
    crc8(std::string buffer)
    {
        return mraa_uart_ow_crc8((uint8_t*) buffer.c_str(), buffer.size());
    }

  private:
    mraa_uart_ow_context m_uart;
};
}
