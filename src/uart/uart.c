/*
 * Author: Thomas Ingleby <thomas.c.ingleby@intel.com>
 * Contributions: Jon Trulson <jtrulson@ics.com>
 *                Brendan le Foll <brendan.le.foll@intel.com>
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

#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>
#include <termios.h>
#include <sys/select.h>
#include <errno.h>
#include <string.h>

#include "uart.h"
#include "mraa_internal.h"

#ifndef CMSPAR
#define CMSPAR   010000000000
#endif

// This function takes an unsigned int and converts it to a B* speed_t
// that can be used with linux/posix termios
static speed_t
uint2speed(unsigned int speed)
{
    switch (speed) {
        case 0:
            return B0; // hangup, not too useful otherwise
        case 50:
            return B50;
        case 75:
            return B75;
        case 110:
            return B110;
        case 150:
            return B150;
        case 200:
            return B200;
        case 300:
            return B300;
        case 600:
            return B600;
        case 1200:
            return B1200;
        case 1800:
            return B1800;
        case 2400:
            return B2400;
        case 4800:
            return B4800;
        case 9600:
            return B9600;
        case 19200:
            return B19200;
        case 38400:
            return B38400;
        case 57600:
            return B57600;
        case 115200:
            return B115200;
        case 230400:
            return B230400;
        case 460800:
            return B460800;
        case 500000:
            return B500000;
        case 576000:
            return B576000;
        case 921600:
            return B921600;
        case 1000000:
            return B1000000;
        case 1152000:
            return B1152000;
        case 1500000:
            return B1500000;
        case 2000000:
            return B2000000;
        case 2500000:
            return B2500000;
        case 3000000:
            return B3000000;
#if !defined(MSYS)
        case 3500000:
            return B3500000;
        case 4000000:
            return B4000000;
#endif
        default:
            // if we are here, then an unsupported baudrate was selected.
            return 0;
    }
}

static mraa_uart_context
mraa_uart_init_internal(mraa_adv_func_t* func_table)
{
    mraa_uart_context dev = (mraa_uart_context) calloc(1, sizeof(struct _uart));
    if (dev == NULL) {
        syslog(LOG_CRIT, "uart: Failed to allocate memory for context");
        return NULL;
    }
    dev->index = -1;
    dev->fd = -1;
    dev->advance_func = func_table;

    return dev;
}

mraa_uart_context
mraa_uart_init(int index)
{
    if (plat == NULL) {
        syslog(LOG_ERR, "uart%i: init: platform not initialised", index);
        return NULL;
    }

    if (mraa_is_sub_platform_id(index)) {
        syslog(LOG_NOTICE, "uart%i: init: Using sub platform is not supported", index);
        return NULL;
    }

    if (plat->adv_func->uart_init_pre != NULL) {
        if (plat->adv_func->uart_init_pre(index) != MRAA_SUCCESS) {
            syslog(LOG_ERR, "uart%i: init: failure in pre-init platform hook", index);
            return NULL;
        }
    }

    if (plat->uart_dev_count == 0) {
        syslog(LOG_ERR, "uart%i: init: platform has no UARTs defined", index);
        return NULL;
    }

    if (plat->uart_dev_count <= index) {
        syslog(LOG_ERR, "uart%i: init: platform has only %i uarts", index, plat->uart_dev_count);
        return NULL;
    }

    if (!plat->no_bus_mux) {
        int pos = plat->uart_dev[index].rx;
        if (pos >= 0) {
            if (plat->pins[pos].uart.mux_total > 0) {
                if (mraa_setup_mux_mapped(plat->pins[pos].uart) != MRAA_SUCCESS) {
                    syslog(LOG_ERR, "uart%i: init: failed to setup muxes for RX pin", index);
                    return NULL;
                }
            }
        }

        pos = plat->uart_dev[index].tx;
        if (pos >= 0) {
            if (plat->pins[pos].uart.mux_total > 0) {
                if (mraa_setup_mux_mapped(plat->pins[pos].uart) != MRAA_SUCCESS) {
                    syslog(LOG_ERR, "uart%i: init: failed to setup muxes for TX pin", index);
                    return NULL;
                }
            }
        }
    }

    mraa_uart_context dev = mraa_uart_init_raw((char*)plat->uart_dev[index].device_path);
    if (dev == NULL) {
        return NULL;
    }
    dev->index = index; //Set the board Index.

    if (IS_FUNC_DEFINED(dev, uart_init_post)) {
        mraa_result_t ret = dev->advance_func->uart_init_post(dev);
        if (ret != MRAA_SUCCESS) {
            free(dev);
            return NULL;
        }
    }

    return dev;
}

mraa_uart_context
mraa_uart_init_raw(const char* path)
{
    if (!path) {
        syslog(LOG_ERR, "uart: device path undefined");
        return NULL;
    }

    mraa_uart_context dev = mraa_uart_init_internal(plat == NULL ? NULL : plat->adv_func);
    if (dev == NULL) {
        syslog(LOG_ERR, "uart: Failed to allocate memory for context");
        return NULL;
    }
    dev->path = path;

    // now open the device
    if ((dev->fd = open(dev->path, O_RDWR)) == -1) {
        syslog(LOG_ERR, "uart: open(%s) failed: %s", path, strerror(errno));
        free(dev);
        return NULL;
    }

    // now setup the tty and the selected baud rate
    struct termios termio;

    // get current modes
    if (tcgetattr(dev->fd, &termio)) {
        syslog(LOG_ERR, "uart: tcgetattr(%s) failed: %s", path, strerror(errno));
        close(dev->fd);
        free(dev);
        return NULL;
    }

    // setup for a 'raw' mode.  8N1, no echo or special character
    // handling, such as flow control or line editing semantics.
    // cfmakeraw is not POSIX!
    cfmakeraw(&termio);
    if (tcsetattr(dev->fd, TCSAFLUSH, &termio) < 0) {
        syslog(LOG_ERR, "uart: tcsetattr(%s) failed after cfmakeraw(): %s", path, strerror(errno));
        close(dev->fd);
        free(dev);
        return NULL;
    }

    if (mraa_uart_set_baudrate(dev, 9600) != MRAA_SUCCESS) {
        close(dev->fd);
        free(dev);
        return NULL;
    }

    return dev;
}

mraa_result_t
mraa_uart_stop(mraa_uart_context dev)
{
    if (!dev) {
        syslog(LOG_ERR, "uart: stop: context is NULL");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    // just close the device and reset our fd.
    if (dev->fd >= 0) {
        close(dev->fd);
    }

    free(dev);

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_uart_flush(mraa_uart_context dev)
{
    if (!dev) {
        syslog(LOG_ERR, "uart: flush: context is NULL");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (tcdrain(dev->fd) == -1) {
        return MRAA_ERROR_FEATURE_NOT_SUPPORTED;
    }

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_uart_set_baudrate(mraa_uart_context dev, unsigned int baud)
{
    if (!dev) {
        syslog(LOG_ERR, "uart: set_baudrate: context is NULL");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    struct termios termio;
    if (tcgetattr(dev->fd, &termio)) {
        syslog(LOG_ERR, "uart%i: set_baudrate: tcgetattr() failed: %s", dev->index, strerror(errno));
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    // set our baud rates
    speed_t speed = uint2speed(baud);
    if (speed == 0)
    {
        syslog(LOG_ERR, "uart%i: set_baudrate: invalid baudrate: %i", dev->index, baud);
        return MRAA_ERROR_INVALID_PARAMETER;
    }
    cfsetispeed(&termio, speed);
    cfsetospeed(&termio, speed);

    // make it so
    if (tcsetattr(dev->fd, TCSAFLUSH, &termio) < 0) {
        syslog(LOG_ERR, "uart%i: set_baudrate: tcsetattr() failed: %s", dev->index, strerror(errno));
        return MRAA_ERROR_FEATURE_NOT_SUPPORTED;
    }
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_uart_set_mode(mraa_uart_context dev, int bytesize, mraa_uart_parity_t parity, int stopbits)
{
    if (!dev) {
        syslog(LOG_ERR, "uart: set_mode: context is NULL");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    struct termios termio;
    if (tcgetattr(dev->fd, &termio)) {
        syslog(LOG_ERR, "uart%i: set_mode: tcgetattr() failed: %s", dev->index, strerror(errno));
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    termio.c_cflag &= ~CSIZE;
    switch (bytesize) {
        case 8:
            termio.c_cflag |= CS8;
            break;
        case 7:
            termio.c_cflag |= CS7;
            break;
        case 6:
            termio.c_cflag |= CS6;
            break;
        case 5:
            termio.c_cflag |= CS5;
            break;
        default:
            termio.c_cflag |= CS8;
            break;
    }

    // POSIX & linux doesn't support 1.5 and I've got bigger fish to fry
    switch (stopbits) {
        case 1:
            termio.c_cflag &= ~CSTOPB;
            break;
        case 2:
            termio.c_cflag |= CSTOPB;
        default:
            break;
    }

    switch (parity) {
        case MRAA_UART_PARITY_NONE:
            termio.c_cflag &= ~(PARENB | PARODD);
            break;
        case MRAA_UART_PARITY_EVEN:
            termio.c_cflag |= PARENB;
            termio.c_cflag &= ~PARODD;
            break;
        case MRAA_UART_PARITY_ODD:
            termio.c_cflag |= PARENB | PARODD;
            break;
        case MRAA_UART_PARITY_MARK: // not POSIX
            termio.c_cflag |= PARENB | CMSPAR | PARODD;
            break;
        case MRAA_UART_PARITY_SPACE: // not POSIX
            termio.c_cflag |= PARENB | CMSPAR;
            termio.c_cflag &= ~PARODD;
            break;
    }

    if (tcsetattr(dev->fd, TCSAFLUSH, &termio) < 0) {
        syslog(LOG_ERR, "uart%i: set_mode: tcsetattr() failed: %s", dev->index, strerror(errno));
        return MRAA_ERROR_FEATURE_NOT_SUPPORTED;
    }

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_uart_set_flowcontrol(mraa_uart_context dev, mraa_boolean_t xonxoff, mraa_boolean_t rtscts)
{
    if (!dev) {
        syslog(LOG_ERR, "uart: set_flowcontrol: context is NULL");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    // hardware flow control
    int action = TCIOFF;
    if (xonxoff) {
        action = TCION;
    }
    if (tcflow(dev->fd, action)) {
        return MRAA_ERROR_FEATURE_NOT_SUPPORTED;
    }

    // rtscts
    struct termios termio;

    // get current modes
    if (tcgetattr(dev->fd, &termio)) {
        syslog(LOG_ERR, "uart%i: set_flowcontrol: tcgetattr() failed: %s", dev->index, strerror(errno));
         return MRAA_ERROR_INVALID_RESOURCE;
    }

    if (rtscts) {
        termio.c_cflag |= CRTSCTS;
    } else {
        termio.c_cflag &= ~CRTSCTS;
    }

    if (tcsetattr(dev->fd, TCSAFLUSH, &termio) < 0) {
        syslog(LOG_ERR, "uart%i: set_flowcontrol: tcsetattr() failed: %s", dev->index, strerror(errno));
        return MRAA_ERROR_FEATURE_NOT_SUPPORTED;
    }

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_uart_set_timeout(mraa_uart_context dev, int read, int write, int interchar)
{
    if (!dev) {
        syslog(LOG_ERR, "uart: set_timeout: context is NULL");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    struct termios termio;
    // get current modes
    if (tcgetattr(dev->fd, &termio)) {
        syslog(LOG_ERR, "uart%i: set_timeout: tcgetattr() failed: %s", dev->index, strerror(errno));
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    if (read > 0) {
        read = read / 100;
        if (read == 0)
            read = 1;
    }
    termio.c_lflag &= ~ICANON; /* Set non-canonical mode */
    termio.c_cc[VTIME] = read; /* Set timeout in tenth seconds */
    if (tcsetattr(dev->fd, TCSANOW, &termio) < 0) {
        syslog(LOG_ERR, "uart%i: set_timeout: tcsetattr() failed: %s", dev->index, strerror(errno));
        return MRAA_ERROR_FEATURE_NOT_SUPPORTED;
    }

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_uart_set_non_blocking(mraa_uart_context dev, mraa_boolean_t nonblock)
{
    if (!dev) {
        syslog(LOG_ERR, "uart: non_blocking: context is NULL");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    // get current flags
    int flags = fcntl(dev->fd, F_GETFL);

    // update flags with new blocking state according to nonblock bool
    if (nonblock) {
        flags |= O_NONBLOCK;
    } else {
        flags &= ~O_NONBLOCK;
    }

    // set new flags
    if (fcntl(dev->fd, F_SETFL, flags) < 0) {
        syslog(LOG_ERR, "uart%i: non_blocking: failed changing fd blocking state: %s", dev->index, strerror(errno));
        return MRAA_ERROR_UNSPECIFIED;
    }

    return MRAA_SUCCESS;
}

const char*
mraa_uart_get_dev_path(mraa_uart_context dev)
{
    if (!dev) {
        return NULL;
    }
    if (dev->path == NULL) {
        return NULL;
    }

    return dev->path;
}

int
mraa_uart_read(mraa_uart_context dev, char* buf, size_t len)
{
    if (!dev) {
        syslog(LOG_ERR, "uart: read: context is NULL");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (dev->fd < 0) {
        syslog(LOG_ERR, "uart%i: read: port is not open", dev->index);
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    return read(dev->fd, buf, len);
}

int
mraa_uart_write(mraa_uart_context dev, const char* buf, size_t len)
{
    if (!dev) {
        syslog(LOG_ERR, "uart: write: context is NULL");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (dev->fd < 0) {
        syslog(LOG_ERR, "uart%i: write: port is not open", dev->index);
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    return write(dev->fd, buf, len);
}

mraa_boolean_t
mraa_uart_data_available(mraa_uart_context dev, unsigned int millis)
{
    if (!dev) {
        syslog(LOG_ERR, "uart: data_available: context is NULL");
        return 0;
    }

    if (dev->fd < 0) {
        syslog(LOG_ERR, "uart%i: data_available: port is not open", dev->index);
        return 0;
    }

    struct timeval timeout;

    if (millis == 0) {
        // no waiting
        timeout.tv_sec = 0;
        timeout.tv_usec = 0;
    } else {
        timeout.tv_sec = millis / 1000;
        timeout.tv_usec = (millis % 1000) * 1000;
    }

    fd_set readfds;

    FD_ZERO(&readfds);
    FD_SET(dev->fd, &readfds);

    if (select(dev->fd + 1, &readfds, NULL, NULL, &timeout) > 0) {
        return 1; // data is ready
    } else {
        return 0;
    }
}


