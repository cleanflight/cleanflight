/*
 * Author: Jon Trulson <jtrulson@ics.com>
 * Copyright (c) 2016 Intel Corporation
 *
 * Portions (search) copyright:
 * Copyright (C) 2004 Dallas Semiconductor Corporation, All Rights Reserved.
 *
 * For the crc8 algorithm:
 * Copyright (c) 2002 Colin O'Flynn
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
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>
#include <termios.h>
#include <fcntl.h>
#include <errno.h>

#include "uart.h"
#include "uart_ow.h"
#include "mraa_internal.h"

// low-level read byte
static mraa_result_t
_ow_read_byte(mraa_uart_ow_context dev, uint8_t *ch)
{
    while (!mraa_uart_read(dev->uart, (char*) ch, 1))
        ;

    return MRAA_SUCCESS;
}

// low-level write byte
static int
_ow_write_byte(mraa_uart_ow_context dev, const char ch)
{
    return mraa_uart_write(dev->uart, &ch, 1);
}

// Here we setup a very simple termios with the minimum required
// settings.  We use this to also change speed from high to low.  We
// use the low speed (9600 bd) for emitting the reset pulse, and
// high speed (115200 bd) for actual data communications.
//
static mraa_result_t
_ow_set_speed(mraa_uart_ow_context dev, mraa_boolean_t speed)
{

    if (!dev) {
        syslog(LOG_ERR, "uart_ow: set_speed: context is NULL");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    static speed_t baud;
    if (speed) {
        baud = B115200;
    }
    else {
        baud = B9600;
    }

    struct termios termio = {
        .c_cflag = baud | CS8 | CLOCAL | CREAD, .c_iflag = 0, .c_oflag = 0, .c_lflag = NOFLSH, .c_cc = { 0 },
    };

    tcflush(dev->uart->fd, TCIFLUSH);

    // TCSANOW is required
    if (tcsetattr(dev->uart->fd, TCSANOW, &termio) < 0) {
        syslog(LOG_ERR, "uart_ow: tcsetattr() failed");
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    return MRAA_SUCCESS;
}

// Perform the 1-Wire Search Algorithm on the 1-Wire bus using the existing
// search state.
// Return 1 : device found, ROM number in ROM_NO buffer
// 0 : device not found, end of search
//
static mraa_boolean_t
_ow_search(mraa_uart_ow_context dev)
{
    int id_bit_number;
    int last_zero, rom_byte_number, search_result;
    int id_bit, cmp_id_bit;
    unsigned char rom_byte_mask, search_direction;

    // initialize for search
    id_bit_number = 1;
    last_zero = 0;
    rom_byte_number = 0;
    rom_byte_mask = 1;
    search_result = 0;

    // if the last call was not the last device
    if (!dev->LastDeviceFlag) {
        // 1-Wire reset
        if (mraa_uart_ow_reset(dev) != MRAA_SUCCESS) {
            // reset the search
            dev->LastDiscrepancy = 0;
            dev->LastDeviceFlag = 0;
            dev->LastFamilyDiscrepancy = 0;
            return 0;
        }

        // issue the search command
        mraa_uart_ow_write_byte(dev, MRAA_UART_OW_CMD_SEARCH_ROM);

        // loop to do the search
        do {
            // read a bit and its complement
            id_bit = mraa_uart_ow_bit(dev, 1);
            cmp_id_bit = mraa_uart_ow_bit(dev, 1);

            // check for no devices on 1-wire
            if ((id_bit == 1) && (cmp_id_bit == 1))
                break;
            else {
                // all devices coupled have 0 or 1
                if (id_bit != cmp_id_bit)
                    search_direction = id_bit; // bit write value for search
                else {
                    // if this discrepancy if before the Last Discrepancy
                    // on a previous next then pick the same as last time
                    if (id_bit_number < dev->LastDiscrepancy)
                        search_direction = ((dev->ROM_NO[rom_byte_number] & rom_byte_mask) > 0);
                    else
                        // if equal to last pick 1, if not then pick 0
                        search_direction = (id_bit_number == dev->LastDiscrepancy);
                    // if 0 was picked then record its position in LastZero
                    if (search_direction == 0) {
                        last_zero = id_bit_number;
                        // check for Last discrepancy in family
                        if (last_zero < 9)
                            dev->LastFamilyDiscrepancy = last_zero;
                    }
                }

                // set or clear the bit in the ROM byte rom_byte_number
                // with mask rom_byte_mask
                if (search_direction == 1)
                    dev->ROM_NO[rom_byte_number] |= rom_byte_mask;
                else
                    dev->ROM_NO[rom_byte_number] &= ~rom_byte_mask;

                // serial number search direction write bit
                mraa_uart_ow_bit(dev, search_direction);

                // increment the byte counter id_bit_number
                // and shift the mask rom_byte_mask
                id_bit_number++;
                rom_byte_mask <<= 1;
                // if the mask is 0 then go to new SerialNum byte
                // rom_byte_number and reset
                if (rom_byte_mask == 0) {
                    rom_byte_number++;
                    rom_byte_mask = 1;
                }
            }
        } while (rom_byte_number < 8);

        // loop until through all ROM bytes 0-7
        // if the search was successful then
        if (id_bit_number >= 65) {
            // search successful so set
            // LastDiscrepancy,LastDeviceFlag,search_result
            dev->LastDiscrepancy = last_zero;

            // check for last device
            if (dev->LastDiscrepancy == 0)
                dev->LastDeviceFlag = 1;
        }
        search_result = 1;
    }

    // if no device found then reset counters so next 'search' will be
    // like a first
    if (!search_result || !dev->ROM_NO[0]) {
        dev->LastDiscrepancy = 0;
        dev->LastDeviceFlag = 0;
        dev->LastFamilyDiscrepancy = 0;
        search_result = 0;
    }

    return search_result;
}

//--------------------------------------------------------------------------
// Find the 'first' devices on the 1-Wire bus
// Return 1 : device found, ROM number in ROM_NO buffer
//        0 : no device present
//
static mraa_boolean_t
_ow_first(mraa_uart_ow_context dev)
{
    // reset the search state
    dev->LastDiscrepancy = 0;
    dev->LastDeviceFlag = 0;
    dev->LastFamilyDiscrepancy = 0;

    return _ow_search(dev);
}

//--------------------------------------------------------------------------
//  Find the 'next' devices on the 1-Wire bus
//  Return 1 : device found, ROM number in ROM_NO buffer
//         0 : device not found, end of search
//
static mraa_boolean_t
_ow_next(mraa_uart_ow_context dev)
{
    // leave the search state alone
    return _ow_search(dev);
}

// Start of exported mraa functionality

mraa_uart_ow_context
mraa_uart_ow_init(int index)
{
    mraa_uart_ow_context dev = calloc(1, sizeof(struct _mraa_uart_ow));
    if (!dev)
        return NULL;

    dev->uart = mraa_uart_init(index);
    if (!dev->uart)
        {
            free(dev);
            return NULL;
        }


    // now get the fd, and set it up for non-blocking operation
    if (fcntl(dev->uart->fd, F_SETFL, O_NONBLOCK) == -1) {
        syslog(LOG_ERR, "uart_ow: failed to set non-blocking on fd");
        mraa_uart_ow_stop(dev);
        return NULL;
    }

    return dev;
}

mraa_uart_ow_context
mraa_uart_ow_init_raw(const char* path)
{
    mraa_uart_ow_context dev = calloc(1, sizeof(struct _mraa_uart_ow));
    if (!dev)
        return NULL;

    dev->uart = mraa_uart_init_raw(path);
    if (!dev->uart)
        {
            free(dev);
            return NULL;
        }

    // now get the fd, and set it up for non-blocking operation
    if (fcntl(dev->uart->fd, F_SETFL, O_NONBLOCK) == -1) {
        syslog(LOG_ERR, "uart_ow: failed to set non-blocking on fd");
        mraa_uart_ow_stop(dev);
        return NULL;
    }

    return dev;
}

mraa_result_t
mraa_uart_ow_stop(mraa_uart_ow_context dev)
{
    mraa_result_t rv =  mraa_uart_stop(dev->uart);
    free(dev);
    return rv;
}

const char*
mraa_uart_ow_get_dev_path(mraa_uart_ow_context dev)
{
    return mraa_uart_get_dev_path(dev->uart);
}

int
mraa_uart_ow_bit(mraa_uart_ow_context dev, uint8_t bit)
{
    if (!dev) {
        syslog(LOG_ERR, "uart_ow: ow_bit: context is NULL");
        return -1;
    }

    int ret = 0;
    uint8_t ch;
    if (bit) {
        ret = _ow_write_byte(dev, 0xff); /* write a 1 bit */
    }
    else {
        ret = _ow_write_byte(dev, 0x00); /* write a 0 bit */
    }

    /* return the bit present on the bus (0xff is a '1', anything else
     * (typically 0xfc or 0x00) is a 0
     */
    if (_ow_read_byte(dev, &ch) != MRAA_SUCCESS || ret == -1) {
         return -1;
    }
    return (ch == 0xff);
}

int
mraa_uart_ow_write_byte(mraa_uart_ow_context dev, uint8_t byte)
{
    if (!dev) {
        syslog(LOG_ERR, "uart_ow: write_byte: context is NULL");
        return -1;
    }

    /* writing bytes - each bit on the byte to send corresponds to a
     * byte on the uart. At the same time, we read bits (uart bytes)
     * from the bus and build a byte to return.  This is possible due to
     * the way we wire the UART TX/RX pins together, similar to a
     * loopback connection, except the devices on the 1-wire bus have
     * the ability to modify the returning bitstream.
     */

    uint8_t bit;
    int i;
    for (i = 0; i < 8; i++) {
        bit = mraa_uart_ow_bit(dev, byte & 0x01);
        /* prep for next bit to send, and clear space for bit read */
        byte >>= 1;
        /* store read bit in the msb */
        if (bit)
            byte |= 0x80;
    }

    /* return the new byte read */
    return byte;
}

int
mraa_uart_ow_read_byte(mraa_uart_ow_context dev)
{
    if (!dev) {
        syslog(LOG_ERR, "uart_ow: read_byte: context is NULL");
        return -1;
    }

    /* we read by sending 0xff, so the bus is released on the initial
     * low pulse (uart start bit) for every timeslot, when the device
     * will then send it's bits
     */
    return mraa_uart_ow_write_byte(dev, 0xff);
}

mraa_result_t
mraa_uart_ow_reset(mraa_uart_ow_context dev)
{
    if (!dev) {
        syslog(LOG_ERR, "uart_ow: reset: context is NULL");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    uint8_t rv;

    /* To emit a proper reset pulse, we set low speed (9600 baud) for
     * the reset pulse and send 0xf0 to pull the line down for the
     * minimum amount of time.
     *
     * From the Maxim whitepaper:
     *
     * Transmitting an 0xF0 from the UART forms a proper Reset
     * pulse. The receive value depends on whether one or more 1-Wire
     * slave devices are present, their internal timing of each slave
     * device present, and the UART's detection timing within each bit
     * window. If no device is present, the receive value will equal the
     * transmit value. Otherwise the receive value can vary.
     */
    if (_ow_set_speed(dev, 0) != MRAA_SUCCESS) {
        return MRAA_ERROR_INVALID_HANDLE;
    }

    /* pull the data line low */
    _ow_write_byte(dev, 0xf0);

    _ow_read_byte(dev, &rv);

    /* back up to high speed for normal data transmissions */
    if (_ow_set_speed(dev, 1) != MRAA_SUCCESS) {
        return MRAA_ERROR_INVALID_HANDLE;
    }

    /* shorted data line */
    if (rv == 0x00)
        return MRAA_ERROR_UART_OW_SHORTED;

    /* no devices detected (no presence pulse) */
    if (rv == 0xf0)
        return MRAA_ERROR_UART_OW_NO_DEVICES;

    /* otherwise, at least one device is present */
    return MRAA_SUCCESS;
}


mraa_result_t
mraa_uart_ow_rom_search(mraa_uart_ow_context dev, mraa_boolean_t start, uint8_t* id)
{
    if (!dev) {
        syslog(LOG_ERR, "uart_ow: rom_search: context is NULL");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    // bail if there aren't any devices, or some other error occurs
    mraa_result_t rv;
    if ((rv = mraa_uart_ow_reset(dev)) != MRAA_SUCCESS)
        return rv;

    mraa_boolean_t result;

    // see if we are starting from scratch
    if (start)
        result = _ow_first(dev);
    else
        result = _ow_next(dev);

    if (result) {
        // found one.  Copy into id and return 1
        int i;
        for (i = 0; i < MRAA_UART_OW_ROMCODE_SIZE; i++)
            id[i] = dev->ROM_NO[i];

        return MRAA_SUCCESS;
    } else
        return MRAA_ERROR_UART_OW_NO_DEVICES;
}

mraa_result_t
mraa_uart_ow_command(mraa_uart_ow_context dev, uint8_t command, uint8_t* id)
{
    if (!dev) {
        syslog(LOG_ERR, "uart_ow: ow_command: context is NULL");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    /* send reset pulse first */
    mraa_result_t rv = mraa_uart_ow_reset(dev);

    if (rv != MRAA_SUCCESS)
        return rv;

    if (id) {
        /* send the match rom command */
        mraa_uart_ow_write_byte(dev, MRAA_UART_OW_CMD_MATCH_ROM);

        /* sending to a specific device, so send out the full romcode */
        int i;
        for (i = 0; i < MRAA_UART_OW_ROMCODE_SIZE; i++)
            mraa_uart_ow_write_byte(dev, id[i]);
    } else {
        /* send to all devices (or a single device if it's the only one
         * on the bus)
         */
        mraa_uart_ow_write_byte(dev, MRAA_UART_OW_CMD_SKIP_ROM);
    }

    mraa_uart_ow_write_byte(dev, command);

    return MRAA_SUCCESS;
}

uint8_t
mraa_uart_ow_crc8(uint8_t* buffer, uint16_t length)
{
    // 0x18 = X ^ 8 + X ^ 5 + X ^ 4 + X ^ 0
    static const uint8_t CRC8POLY = 0x18;

    uint8_t crc = 0x00;
    uint16_t loop_count;
    uint8_t bit_counter;
    uint8_t data;
    uint8_t feedback_bit;

    for (loop_count = 0; loop_count != length; loop_count++) {
        data = buffer[loop_count];
        bit_counter = 8;
        do {
            feedback_bit = (crc ^ data) & 0x01;
            if (feedback_bit == 0x01)
                crc = crc ^ CRC8POLY;
            crc = (crc >> 1) & 0x7F;
            if (feedback_bit == 0x01)
                crc = crc | 0x80;
            data = data >> 1;
            bit_counter--;
        } while (bit_counter > 0);
    }

    return crc;
}
