/*
 * Author: Brendan Le Foll <brendan.le.foll@intel.com>
 * Contributions: Jon Trulson <jtrulson@ics.com>
 * Contributions: Thomas Ingleby <thomas.c.ingleby@intel.com>
 * Copyright (c) 2014 - 2015 Intel Corporation.
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

#include "uart.h"
#include "types.hpp"
#include <stdlib.h>
#include <stdexcept>
#include <cstring>

namespace mraa
{

/**
 * @brief API to UART (enabling only)
 *
 * This file defines the UART interface for libmraa
 *
 * @snippet Uart-example.cpp Interesting
 */
class Uart
{
  public:
    /**
     * Uart Constructor, takes a pin number which will map directly to the
     * linux uart number, this 'enables' the uart, nothing more
     *
     * @param uart the index of the uart set to use
     */
    Uart(int uart)
    {
        m_uart = mraa_uart_init(uart);

        if (m_uart == NULL) {
            throw std::invalid_argument("Error initialising UART");
        }
    }

    /**
     * Uart Constructor, takes a string to the path of the serial
     * interface that is needed.
     *
     * @param uart the index of the uart set to use
     */
    Uart(std::string path)
    {
        m_uart = mraa_uart_init_raw(path.c_str());

        if (m_uart == NULL) {
            throw std::invalid_argument("Error initialising UART");
        }
    }

    /**
     * Uart Constructor, takes a pointer to the UART context and initialises
     * the UART class
     *
     * @param void * to a UART context
     */
    Uart(void* uart_context)
    {
        m_uart = (mraa_uart_context) uart_context;

        if (m_uart == NULL) {
            throw std::invalid_argument("Invalid UART context");
        }
    }
    /**
     * Uart destructor
     */
    ~Uart()
    {
        mraa_uart_stop(m_uart);
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
        std::string ret_val(mraa_uart_get_dev_path(m_uart));
        return ret_val;
    }

    /**
     * Read bytes from the device into char* buffer
     *
     * @param data buffer pointer
     * @param length maximum size of buffer
     * @return numbers of bytes read
     */
    int
    read(char* data, int length)
    {
        return mraa_uart_read(m_uart, data, (size_t) length);
    }

    /**
     * Write bytes in String object to a device
     *
     * @param data buffer pointer
     * @param length maximum size of buffer
     * @return the number of bytes written, or -1 if an error occurred
     */
    int
    write(const char* data, int length)
    {
        return mraa_uart_write(m_uart, data, (size_t) length);
    }

    /**
     * Read bytes from the device into a String object
     *
     * @param length to read
     * @throws std::bad_alloc If there is no space left for read.
     * @return string of data
     */
    std::string
    readStr(int length)
    {
        char* data = (char*) malloc(sizeof(char) * length);
        if (data == NULL) {
            throw std::bad_alloc();
        }

        int v = mraa_uart_read(m_uart, data, (size_t) length);
        std::string ret(data, v);
        free(data);
        return ret;
    }

    /**
     * Write bytes in String object to a device
     *
     * @param string to write
     * @return the number of bytes written, or -1 if an error occurred
     */
    int
    writeStr(std::string data)
    {
        // this is data.length() not +1 because we want to avoid the '\0' char
        return mraa_uart_write(m_uart, data.c_str(), (data.length()));
    }

    /**
     * Check to see if data is available on the device for reading
     *
     * @param millis number of milliseconds to wait, or 0 to return immediately
     * @return true if there is data available to read, false otherwise
     */
    bool
    dataAvailable(unsigned int millis = 0)
    {
        if (mraa_uart_data_available(m_uart, millis))
            return true;
        else
            return false;
    }

    /**
     * Flush the outbound data.
     * Blocks until complete.
     *
     * @return Result of operation
     */
    Result
    flush()
    {
        return (Result) mraa_uart_flush(m_uart);
    }

    /**
     * Set the baudrate.
     * Takes an int and will attempt to decide what baudrate  is
     * to be used on the UART hardware.
     *
     * @param baud unsigned int of baudrate i.e. 9600
     * @return Result of operation
     */
    Result
    setBaudRate(unsigned int baud)
    {
        return (Result) mraa_uart_set_baudrate(m_uart, baud);
    }

    /**
     * Set the transfer mode
     * For example setting the mode to 8N1 would be
     * "dev.setMode(8,UART_PARITY_NONE , 1)"
     *
     * @param bytesize data bits
     * @param parity Parity bit setting
     * @param stopbits stop bits
     * @return Result of operation
     */
    Result
    setMode(int bytesize, UartParity parity, int stopbits)
    {
        return (Result) mraa_uart_set_mode(m_uart, bytesize, (mraa_uart_parity_t) parity, stopbits);
    }

    /**
     * Set the flowcontrol
     *
     * @param xonxoff XON/XOFF Software flow control.
     * @param rtscts RTS/CTS out of band hardware flow control
     * @return Result of operation
     */
    Result
    setFlowcontrol(bool xonxoff, bool rtscts)
    {
        return (Result) mraa_uart_set_flowcontrol(m_uart, xonxoff, rtscts);
    }

    /**
     * Set the timeout for read and write operations
     * <= 0 will disable that timeout
     *
     * @param read read timeout
     * @param write write timeout
     * @param interchar inbetween char timeout
     * @return Result of operation
     */
    Result
    setTimeout(int read, int write, int interchar)
    {
        return (Result) mraa_uart_set_timeout(m_uart, read, write, interchar);
    }

    /**
     * Set the blocking state for write operations
     *
     * @param dev The UART context
     * @param nonblock new nonblocking state
     * @return Result of operation
     */
    Result
    SetNonBlocking(bool nonblock)
    {
        return (Result) mraa_uart_set_non_blocking(m_uart, nonblock);
    }

  private:
    mraa_uart_context m_uart;
};
}
