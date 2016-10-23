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

#include "spi.h"
#include "types.hpp"
#include <stdexcept>

namespace mraa
{

/**
 * MRAA SPI Modes
 */
typedef enum {
    SPI_MODE0 = 0, /**< CPOL = 0, CPHA = 0, Clock idle low, data is clocked in on rising edge,
                      output data (change) on falling edge */
    SPI_MODE1 = 1, /**< CPOL = 0, CPHA = 1, Clock idle low, data is clocked in on falling edge,
                      output data (change) on rising edge */
    SPI_MODE2 = 2, /**< CPOL = 1, CPHA = 0, Clock idle low, data is clocked in on falling edge,
                      output data (change) on rising edge */
    SPI_MODE3 = 3, /**< CPOL = 1, CPHA = 1, Clock idle low, data is clocked in on rising, edge
                      output data (change) on falling edge */
} Spi_Mode;


/**
* @brief API to Serial Peripheral Interface
*
* This file defines the SPI interface for libmraa
*
* @snippet Spi-pot.cpp Interesting
*/
class Spi
{
  public:
    /**
     * Initialise SPI object using the board mapping to set muxes
     *
     * @param bus to use, as listed in the platform definition, normally 0
     */
    Spi(int bus)
    {
        m_spi = mraa_spi_init(bus);

        if (m_spi == NULL) {
            throw std::invalid_argument("Error initialising SPI bus");
        }
    }

    /**
     * Initialise SPI object using 'raw' mode. Mraa will go and grab the spidev device lablled /dev/spidev<bus>.<cs>
     *
     * @param bus to use
     * @param cs to use
     */
    Spi(int bus, int cs)
    {
        m_spi = mraa_spi_init_raw(bus, cs);

        if (m_spi == NULL) {
            throw std::invalid_argument("Error initialising SPI bus");
        }
    }

    /**
     * Spi Constructor, takes a pointer to a SPI context and initialises
     * the SPI class
     *
     * @param void * to SPI context
     */
    Spi(void* spi_context)
    {
        m_spi = (mraa_spi_context) spi_context;
        if (m_spi == NULL) {
            throw std::invalid_argument("Invalid SPI context");
        }
    }

    /**
     * Closes spi bus
     */
    ~Spi()
    {
        mraa_spi_stop(m_spi);
    }

    /**
     * Set the SPI device mode. see spidev0-3
     *
     * @param mode the mode. See Linux spidev doc
     * @return Result of operation
     */
    Result
    mode(Spi_Mode mode)
    {
        return (Result) mraa_spi_mode(m_spi, (mraa_spi_mode_t) mode);
    }

    /**
     * Set the SPI device operating clock frequency
     *
     * @param hz the frequency to set in hz
     * @return Result of operation
     */
    Result
    frequency(int hz)
    {
        return (Result) mraa_spi_frequency(m_spi, hz);
    }

    /**
     * Write single byte to the SPI device
     *
     * @param data the byte to send
     * @return data received on the miso line or -1 in case of error
     */
    int
    writeByte(uint8_t data)
    {
        return mraa_spi_write(m_spi, (uint8_t) data);
    }

    /**
     * Write single byte to the SPI device
     *
     * @param data the byte to send
     * @return data received on the miso line or -1 in case of error
     */
    int
    writeWord(uint16_t data)
    {
        return mraa_spi_write_word(m_spi, (uint16_t) data);
    }

    /**
     * Write buffer of bytes to SPI device The pointer return has to be
     * free'd by the caller. It will return a NULL pointer in cases of
     * error
     *
     * @param txBuf buffer to send
     * @param length size of buffer to send
     * @return uint8_t* data received on the miso line. Same length as passed in
     */
    uint8_t*
    write(uint8_t* txBuf, int length)
    {
        return mraa_spi_write_buf(m_spi, txBuf, length);
    }

#ifndef SWIG
    /**
     * Write buffer of bytes to SPI device The pointer return has to be
     * free'd by the caller. It will return a NULL pointer in cases of
     * error
     *
     * @param txBuf buffer to send
     * @param length size of buffer (in bytes) to send
     * @return uint8_t* data received on the miso line. Same length as passed in
     */
    uint16_t*
    writeWord(uint16_t* txBuf, int length)
    {
        return mraa_spi_write_buf_word(m_spi, txBuf, length);
    }
#endif

#ifndef SWIG
    /**
     * Transfer data to and from SPI device Receive pointer may be null if
     * return data is not needed.
     *
     * @param txBuf buffer to send
     * @param rxBuf buffer to optionally receive data from spi device
     * @param length size of buffer to send
     * @return Result of operation
     */
    Result
    transfer(uint8_t* txBuf, uint8_t* rxBuf, int length)
    {
        return (Result) mraa_spi_transfer_buf(m_spi, txBuf, rxBuf, length);
    }

    /**
     * Transfer data to and from SPI device Receive pointer may be null if
     * return data is not needed.
     *
     * @param txBuf buffer to send
     * @param rxBuf buffer to optionally receive data from spi device
     * @param length size of buffer to send
     * @return Result of operation
     */
    Result
    transfer_word(uint16_t* txBuf, uint16_t* rxBuf, int length)
    {
        return (Result) mraa_spi_transfer_buf_word(m_spi, txBuf, rxBuf, length);
    }
#endif

    /**
     * Change the SPI lsb mode
     *
     * @param lsb Use least significant bit transmission - 0 for msbi
     * @return Result of operation
     */
    Result
    lsbmode(bool lsb)
    {
        return (Result) mraa_spi_lsbmode(m_spi, (mraa_boolean_t) lsb);
    }

    /**
     * Set bits per mode on transaction, default is 8
     *
     * @param bits bits per word
     * @return Result of operation
     */
    Result
    bitPerWord(unsigned int bits)
    {
        return (Result) mraa_spi_bit_per_word(m_spi, bits);
    }

  private:
    mraa_spi_context m_spi;
};
}
