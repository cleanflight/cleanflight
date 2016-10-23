/*
 * Author: Thomas Ingleby <thomas.c.ingleby@intel.com>
 * Author: Brendan Le Foll <brendan.le.foll@intel.com>
 * Copyright (c) 2014, 2015 Intel Corporation.
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
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

#include "spi.h"
#include "mraa_internal.h"

#define MAX_SIZE 64
#define SPI_MAX_LENGTH 4096

static mraa_spi_context
mraa_spi_init_internal(mraa_adv_func_t* func_table)
{
    mraa_spi_context dev = (mraa_spi_context) calloc(1, sizeof(struct _spi));
    if (dev == NULL) {
        return NULL;
    }
    dev->advance_func = func_table;

    return dev;
}

mraa_spi_context
mraa_spi_init(int bus)
{
    if (plat == NULL) {
        syslog(LOG_ERR, "spi: Platform Not Initialised");
        return NULL;
    }
    if (mraa_is_sub_platform_id(bus)) {
        syslog(LOG_ERR, "spi: Spi module doesn't support subplatforms");
        return NULL;
    }
    if (plat->spi_bus_count == 0) {
        syslog(LOG_ERR, "spi: no spi buses defined in platform");
        return NULL;
    }
    if (plat->spi_bus_count == 1) {
        bus = plat->def_spi_bus;
    }
    if (bus >= plat->spi_bus_count) {
        syslog(LOG_ERR, "spi: requested bus above spi bus count");
        return NULL;
    }
    if (plat->adv_func->spi_init_pre != NULL) {
        if (plat->adv_func->spi_init_pre(bus) != MRAA_SUCCESS) {
            return NULL;
        }
    }

    if (!plat->no_bus_mux) {
        int pos = plat->spi_bus[bus].sclk;
        if (plat->pins[pos].spi.mux_total > 0) {
            if (mraa_setup_mux_mapped(plat->pins[pos].spi) != MRAA_SUCCESS) {
                syslog(LOG_ERR, "spi: failed to set-up spi sclk multiplexer");
                return NULL;
            }
        }

        pos = plat->spi_bus[bus].mosi;
        if (plat->pins[pos].spi.mux_total > 0) {
            if (mraa_setup_mux_mapped(plat->pins[pos].spi) != MRAA_SUCCESS) {
                syslog(LOG_ERR, "spi: failed to set-up spi mosi multiplexer");
                return NULL;
            }
        }

        pos = plat->spi_bus[bus].miso;
        if (plat->pins[pos].spi.mux_total > 0) {
            if (mraa_setup_mux_mapped(plat->pins[pos].spi) != MRAA_SUCCESS) {
                syslog(LOG_ERR, "spi: failed to set-up spi miso multiplexer");
                return NULL;
            }
        }

        pos = plat->spi_bus[bus].cs;
        if (plat->pins[pos].spi.mux_total > 0) {
            if (mraa_setup_mux_mapped(plat->pins[pos].spi) != MRAA_SUCCESS) {
                syslog(LOG_ERR, "spi: failed to set-up spi cs multiplexer");
                return NULL;
            }
        }
    }
    mraa_spi_context dev = mraa_spi_init_raw(plat->spi_bus[bus].bus_id, plat->spi_bus[bus].slave_s);

    if (plat->adv_func->spi_init_post != NULL) {
        mraa_result_t ret = plat->adv_func->spi_init_post(dev);
        if (ret != MRAA_SUCCESS) {
            free(dev);
            return NULL;
        }
    }

    return dev;
}

mraa_spi_context
mraa_spi_init_raw(unsigned int bus, unsigned int cs)
{
    mraa_result_t status = MRAA_SUCCESS;

    mraa_spi_context dev = mraa_spi_init_internal(plat == NULL ? NULL : plat->adv_func);
    if (dev == NULL) {
        syslog(LOG_CRIT, "spi: Failed to allocate memory for context");
        status = MRAA_ERROR_NO_RESOURCES;
        goto init_raw_cleanup;
    }

    if (IS_FUNC_DEFINED(dev, spi_init_raw_replace)) {
        status = dev->advance_func->spi_init_raw_replace(dev, bus, cs);
        if (status == MRAA_SUCCESS) {
            return dev;
        } else {
            goto init_raw_cleanup;
        }
    }

    char path[MAX_SIZE];
    sprintf(path, "/dev/spidev%u.%u", bus, cs);

    dev->devfd = open(path, O_RDWR);
    if (dev->devfd < 0) {
        syslog(LOG_ERR, "spi: Failed opening SPI Device. bus:%s", path);
        status = MRAA_ERROR_INVALID_RESOURCE;
        goto init_raw_cleanup;
    }

    int speed = 0;
    if (ioctl(dev->devfd, SPI_IOC_RD_MAX_SPEED_HZ, &speed) != -1) {
        dev->clock = speed;
    } else {
        // We had this on Galileo Gen1, so let it be a fallback value
        dev->clock = 4000000;
        syslog(LOG_WARNING, "spi: Max speed query failed, setting %d", dev->clock);
    }

    status = mraa_spi_mode(dev, MRAA_SPI_MODE0);
    if (status != MRAA_SUCCESS) {
        goto init_raw_cleanup;
    }

    status = mraa_spi_lsbmode(dev, 0);
    if (status != MRAA_SUCCESS) {
        goto init_raw_cleanup;
    }

    status = mraa_spi_bit_per_word(dev, 8);
    if (status != MRAA_SUCCESS) {
        goto init_raw_cleanup;
    }

init_raw_cleanup:
    if (status != MRAA_SUCCESS) {
        if (dev != NULL) {
            free(dev);
        }
        return NULL;
    }

    return dev;
}

mraa_result_t
mraa_spi_mode(mraa_spi_context dev, mraa_spi_mode_t mode)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "spi: mode: context is invalid");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (IS_FUNC_DEFINED(dev, spi_mode_replace)) {
        return dev->advance_func->spi_mode_replace(dev, mode);
    }

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
            spi_mode = SPI_MODE_0;
            break;
    }

    if (ioctl(dev->devfd, SPI_IOC_WR_MODE, &spi_mode) < 0) {
        syslog(LOG_ERR, "spi: Failed to set spi mode");
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    dev->mode = spi_mode;
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_spi_frequency(mraa_spi_context dev, int hz)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "spi: frequency: context is invalid");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (IS_FUNC_DEFINED(dev, spi_frequency_replace)) {
        return dev->advance_func->spi_frequency_replace(dev, hz);
    }

    int speed = 0;
    dev->clock = hz;
    if (ioctl(dev->devfd, SPI_IOC_RD_MAX_SPEED_HZ, &speed) != -1) {
        if (speed < hz) {
            dev->clock = speed;
            syslog(LOG_WARNING, "spi: Selected speed reduced to max allowed speed");
        }
    }
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_spi_lsbmode(mraa_spi_context dev, mraa_boolean_t lsb)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "spi: lsbmode: context is invalid");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (IS_FUNC_DEFINED(dev, spi_lsbmode_replace)) {
        return dev->advance_func->spi_lsbmode_replace(dev, lsb);
    }

    uint8_t lsb_mode = (uint8_t) lsb;
    if (ioctl(dev->devfd, SPI_IOC_WR_LSB_FIRST, &lsb_mode) < 0) {
        syslog(LOG_ERR, "spi: Failed to set bit order");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    if (ioctl(dev->devfd, SPI_IOC_RD_LSB_FIRST, &lsb_mode) < 0) {
        syslog(LOG_ERR, "spi: Failed to set bit order");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    dev->lsb = lsb;
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_spi_bit_per_word(mraa_spi_context dev, unsigned int bits)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "spi: bit_per_word: context is invalid");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (IS_FUNC_DEFINED(dev, spi_bit_per_word_replace)) {
        return dev->advance_func->spi_bit_per_word_replace(dev, bits);
    }

    if (ioctl(dev->devfd, SPI_IOC_WR_BITS_PER_WORD, &bits) < 0) {
        syslog(LOG_ERR, "spi: Failed to set bit per word");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    dev->bpw = bits;
    return MRAA_SUCCESS;
}

int
mraa_spi_write(mraa_spi_context dev, uint8_t data)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "spi: write: context is invalid");
        return -1;
    }

    if (IS_FUNC_DEFINED(dev, spi_write_replace)) {
        return dev->advance_func->spi_write_replace(dev, data);
    }

    struct spi_ioc_transfer msg;
    memset(&msg, 0, sizeof(msg));

    uint16_t length = 1;

    unsigned long recv = 0;
    msg.tx_buf = (unsigned long) &data;
    msg.rx_buf = (unsigned long) &recv;
    msg.speed_hz = dev->clock;
    msg.bits_per_word = dev->bpw;
    msg.delay_usecs = 0;
    msg.len = length;
    if (ioctl(dev->devfd, SPI_IOC_MESSAGE(1), &msg) < 0) {
        syslog(LOG_ERR, "spi: Failed to perform dev transfer");
        return -1;
    }
    return (int) recv;
}

int
mraa_spi_write_word(mraa_spi_context dev, uint16_t data)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "spi: write_word: context is invalid");
        return -1;
    }

    if (IS_FUNC_DEFINED(dev, spi_write_word_replace)) {
        return dev->advance_func->spi_write_word_replace(dev, data);
    }

    struct spi_ioc_transfer msg;
    memset(&msg, 0, sizeof(msg));

    uint16_t length = 2;

    uint16_t recv = 0;
    msg.tx_buf = (unsigned long) &data;
    msg.rx_buf = (unsigned long) &recv;
    msg.speed_hz = dev->clock;
    msg.bits_per_word = dev->bpw;
    msg.delay_usecs = 0;
    msg.len = length;
    if (ioctl(dev->devfd, SPI_IOC_MESSAGE(1), &msg) < 0) {
        syslog(LOG_ERR, "spi: Failed to perform dev transfer");
        return -1;
    }
    return (int) recv;
}

mraa_result_t
mraa_spi_transfer_buf(mraa_spi_context dev, uint8_t* data, uint8_t* rxbuf, int length)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "spi: transfer_buf: context is invalid");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (IS_FUNC_DEFINED(dev, spi_transfer_buf_replace)) {
        return dev->advance_func->spi_transfer_buf_replace(dev, data, rxbuf, length);
    }

    struct spi_ioc_transfer msg;
    memset(&msg, 0, sizeof(msg));

    msg.tx_buf = (unsigned long) data;
    msg.rx_buf = (unsigned long) rxbuf;
    msg.speed_hz = dev->clock;
    msg.bits_per_word = dev->bpw;
    msg.delay_usecs = 0;
    msg.len = length;
    if (ioctl(dev->devfd, SPI_IOC_MESSAGE(1), &msg) < 0) {
        syslog(LOG_ERR, "spi: Failed to perform dev transfer");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_spi_transfer_buf_word(mraa_spi_context dev, uint16_t* data, uint16_t* rxbuf, int length)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "spi: transfer_buf_word: context is invalid");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (IS_FUNC_DEFINED(dev, spi_transfer_buf_word_replace)) {
        return dev->advance_func->spi_transfer_buf_word_replace(dev, data, rxbuf, length);
    }

    struct spi_ioc_transfer msg;
    memset(&msg, 0, sizeof(msg));

    msg.tx_buf = (unsigned long) data;
    msg.rx_buf = (unsigned long) rxbuf;
    msg.speed_hz = dev->clock;
    msg.bits_per_word = dev->bpw;
    msg.delay_usecs = 0;
    msg.len = length;
    if (ioctl(dev->devfd, SPI_IOC_MESSAGE(1), &msg) < 0) {
        syslog(LOG_ERR, "spi: Failed to perform dev transfer");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    return MRAA_SUCCESS;
}

uint8_t*
mraa_spi_write_buf(mraa_spi_context dev, uint8_t* data, int length)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "spi: write_buf: context is invalid");
        return NULL;
    }

    uint8_t* recv = malloc(sizeof(uint8_t) * length);

    if (mraa_spi_transfer_buf(dev, data, recv, length) != MRAA_SUCCESS) {
        free(recv);
        return NULL;
    }
    return recv;
}

uint16_t*
mraa_spi_write_buf_word(mraa_spi_context dev, uint16_t* data, int length)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "spi: write_buf_word: context is invalid");
        return NULL;
    }

    uint16_t* recv = malloc(sizeof(uint16_t) * length);

    if (mraa_spi_transfer_buf_word(dev, data, recv, length) != MRAA_SUCCESS) {
        free(recv);
        return NULL;
    }
    return recv;
}

mraa_result_t
mraa_spi_stop(mraa_spi_context dev)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "spi: stop: context is invalid");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (IS_FUNC_DEFINED(dev, spi_stop_replace)) {
        return dev->advance_func->spi_stop_replace(dev);
    }

    close(dev->devfd);
    free(dev);
    return MRAA_SUCCESS;
}
