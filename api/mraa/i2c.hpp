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

#include "i2c.h"
#include "types.hpp"
#include <stdexcept>

namespace mraa
{

/**
 * @brief API to Inter-Integrated Circuit
 *
 * An I2c object represents an i2c master and can talk multiple i2c slaves by
 * selecting the correct address
 * @htmlinclude i2c.txt
 *
 * @snippet I2c-compass.cpp Interesting
 */
class I2c
{
  public:
    /**
     * Instantiates an i2c bus. Multiple instances of the same bus can
     * exist and the bus is not guarranteed to be on the correct address
     * before read/write.
     *
     * @param bus The i2c bus to use
     * @param raw Whether to disable pinmapper for your board
     */
    I2c(int bus, bool raw = false)
    {
        if (raw) {
            m_i2c = mraa_i2c_init_raw(bus);
        } else {
            m_i2c = mraa_i2c_init(bus);
        }
        if (m_i2c == NULL) {
            throw std::invalid_argument("Invalid i2c bus");
        }
    }
    /**
     * I2C constructor, takes a pointer to a I2C context and initialises the I2C class
     *
     * @param void * to an I2C context
     */
    I2c(void* i2c_context)
    {
        m_i2c = (mraa_i2c_context) i2c_context;
        if (m_i2c == NULL) {
            throw std::invalid_argument("Invalid I2C context");
        }
    }

    /**
     * Closes the I2c Bus used. This does not guarrantee the bus will not
     * be usable by anyone else or communicates this disconnect to any
     * slaves.
     */
    ~I2c()
    {
        mraa_i2c_stop(m_i2c);
    }

    /**
     * Sets the i2c Frequency for communication. Your board may not support
     * the set frequency. Anyone can change this at any time and this will
     * affect every slave on the bus
     *
     * @param mode Frequency to set the bus to
     * @return Result of operation
     */
    Result
    frequency(I2cMode mode)
    {
        return (Result) mraa_i2c_frequency(m_i2c, (mraa_i2c_mode_t) mode);
    }

    /**
     * Set the slave to talk to, typically called before every read/write
     * operation
     *
     * @param address Communicate to the i2c slave on this address
     * @return Result of operation
     */
    Result
    address(uint8_t address)
    {
        return (Result) mraa_i2c_address(m_i2c, address);
    }

    /**
     * Read exactly one byte from the bus
     *
     * @throws std::invalid_argument in case of error
     * @return char read from the bus
     */
    uint8_t
    readByte()
    {
        int x = mraa_i2c_read_byte(m_i2c);
        if (x == -1) {
            throw std::invalid_argument("Unknown error in I2c::readByte()");
        }
        return (uint8_t) x;
    }

    /**
     * Read length bytes from the bus into *data pointer
     *
     * @param data Data to read into
     * @param length Size of read in bytes to make
     * @return length of read, should match length
     */
    int
    read(uint8_t* data, int length)
    {
        return mraa_i2c_read(m_i2c, data, length);
    }

    /**
     * Read byte from an i2c register
     *
     * @param reg Register to read from
     *
     * @throws std::invalid_argument in case of error
     * @return char read from register
     */
    uint8_t
    readReg(uint8_t reg)
    {
        int x = mraa_i2c_read_byte_data(m_i2c, reg);
        if (x == -1) {
            throw std::invalid_argument("Unknown error in I2c::readReg()");
        }
        return (uint8_t) x;
    }

    /**
     * Read word from an i2c register
     *
     * @param reg Register to read from
     *
     * @throws std::invalid_argument in case of error
     * @return char read from register
     */
    uint16_t
    readWordReg(uint8_t reg)
    {
        int x = mraa_i2c_read_word_data(m_i2c, reg);
	if (x == -1) {
            throw std::invalid_argument("Unknown error in I2c::readReg()");
        }
        return (uint16_t) x;
    }

    /**
     * Read length bytes from the bus into *data pointer starting from
     * an i2c register
     *
     * @param reg Register to read from
     * @param data pointer to the byte array to read data in to
     * @param length max number of bytes to read
     * @return length passed to the function or -1
     */
    int
    readBytesReg(uint8_t reg, uint8_t* data, int length)
    {
        return mraa_i2c_read_bytes_data(m_i2c, reg, data, length);
    }

    /**
     * Write a byte on the bus
     *
     * @param data The byte to send on the bus
     * @return Result of operation
     */
    Result
    writeByte(uint8_t data)
    {
        return (Result) mraa_i2c_write_byte(m_i2c, data);
    }

    /**
     * Write length bytes to the bus, the first byte in the array is the
     * command/register to write
     *
     * @param data Buffer to send on the bus, first byte is i2c command
     * @param length Size of buffer to send
     * @return Result of operation
     */
    Result
    write(const uint8_t* data, int length)
    {
        return (Result) mraa_i2c_write(m_i2c, data, length);
    }

    /**
     * Write a byte to an i2c register
     *
     * @param reg Register to write to
     * @param data Value to write to register
     * @return Result of operation
     */
    Result
    writeReg(uint8_t reg, uint8_t data)
    {
        return (Result) mraa_i2c_write_byte_data(m_i2c, data, reg);
    }

    /**
     * Write a word to an i2c register
     *
     * @param reg Register to write to
     * @param data Value to write to register
     * @return Result of operation
     */
    Result
    writeWordReg(uint8_t reg, uint16_t data)
    {
        return (Result) mraa_i2c_write_word_data(m_i2c, data, reg);
    }

  private:
    mraa_i2c_context m_i2c;
};
}
