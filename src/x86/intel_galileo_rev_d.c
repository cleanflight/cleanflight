/*
 * Author: Thomas Ingleby <thomas.c.ingleby@intel.com>
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

#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/ioctl.h>
#include <linux/spi/spidev.h>

#include "common.h"
#include "x86/intel_galileo_rev_d.h"

#define UIO_PATH "/dev/uio0"
#define PLATFORM_NAME "Intel Galileo Gen 1"

static uint8_t* mmap_reg = NULL;
static int mmap_fd = 0;
static int mmap_size = 0x1000;
static unsigned int mmap_count = 0;

static mraa_result_t
mraa_intel_galileo_g1_mmap_unsetup()
{
    if (mmap_reg == NULL) {
        syslog(LOG_WARNING, "galileo1: Mmap null register nothing to unsetup");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    munmap(mmap_reg, mmap_size);
    mmap_reg = NULL;
    close(mmap_fd);
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_intel_galileo_g1_mmap_write(mraa_gpio_context dev, int value)
{
    int bitpos = plat->pins[dev->phy_pin].mmap.bit_pos;
    if (value) {
        *((unsigned*) mmap_reg) |= (1 << bitpos);
        return MRAA_SUCCESS;
    }
    *((unsigned*) mmap_reg) &= ~(1 << bitpos);

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_intel_galileo_g1_mmap_setup(mraa_gpio_context dev, mraa_boolean_t en)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "galileo1: Gpio context not valid");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (mraa_pin_mode_test(dev->phy_pin, MRAA_PIN_FAST_GPIO) == 0) {
        syslog(LOG_WARNING, "galileo1: Mmap not available on this pin");
        return MRAA_ERROR_NO_RESOURCES;
    }
    if (en == 0) {
        if (dev->mmap_write == NULL) {
            syslog(LOG_NOTICE, "galileo1: Can't disable disabled mmap gpio");
            return MRAA_ERROR_INVALID_PARAMETER;
        }
        dev->mmap_write = NULL;
        mmap_count--;
        if (mmap_count == 0) {
            return mraa_intel_galileo_g1_mmap_unsetup();
        }
        return MRAA_SUCCESS;
    }

    if (dev->mmap_write != NULL) {
        syslog(LOG_ERR, "galileo1: Can't enable enabled mmap gpio");
        return MRAA_ERROR_INVALID_PARAMETER;
    }
    if (mmap_reg == NULL) {
        if ((mmap_fd = open(UIO_PATH, O_RDWR)) < 0) {
            syslog(LOG_ERR, "galileo1: Unable to open UIO device");
            return MRAA_ERROR_INVALID_RESOURCE;
        }
        mmap_reg = mmap(NULL, mmap_size, PROT_READ | PROT_WRITE, MAP_SHARED, mmap_fd, 0);

        if (mmap_reg == MAP_FAILED) {
            syslog(LOG_ERR, "galileo1: Mmap failed to mmap");
            mmap_reg = NULL;
            close(mmap_fd);
            return MRAA_ERROR_NO_RESOURCES;
        }
    }
    if (mraa_setup_mux_mapped(plat->pins[dev->phy_pin].mmap.gpio) != MRAA_SUCCESS) {
        syslog(LOG_ERR, "galileo1: Unable to setup required multiplexers for mmap");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    dev->mmap_write = &mraa_intel_galileo_g1_mmap_write;

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_intel_galileo_g1_spi_lsbmode_replace(mraa_spi_context dev, mraa_boolean_t lsb)
{
    uint8_t lsb_mode = (uint8_t) lsb;

    // Galileo Gen1 doesn't support LSB_FIRST, we need to react appropriately
    if (!lsb) {
        if (ioctl(dev->devfd, SPI_IOC_WR_LSB_FIRST, &lsb_mode) < 0) {
            syslog(LOG_ERR, "spi: Failed to set bit order");
            return MRAA_ERROR_INVALID_RESOURCE;
        }
        if (ioctl(dev->devfd, SPI_IOC_RD_LSB_FIRST, &lsb_mode) < 0) {
            syslog(LOG_ERR, "spi: Failed to set bit order");
            return MRAA_ERROR_INVALID_RESOURCE;
        }
    } else {
        return MRAA_ERROR_FEATURE_NOT_SUPPORTED;
    }

    dev->lsb = lsb;
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_intel_galileo_g1_pwm_init_pre(int pin)
{
    // Gen1 galileo has no kernel muxing for GPIOs/PWM so ends up with leakage
    // on the PWM pins from the GPIO pins if not set to output high
    if (plat->pins[pin].capabilities.gpio == 1) {
        mraa_gpio_context mux_i;
        mux_i = mraa_gpio_init_raw(plat->pins[pin].gpio.pinmap);
        if (mux_i == NULL) {
            syslog(LOG_ERR, "pwm_init: error in gpio->pwm%i transition. gpio_init", pin);
            return MRAA_ERROR_INVALID_RESOURCE;
        }
        if (mraa_gpio_dir(mux_i, MRAA_GPIO_OUT) != MRAA_SUCCESS) {
            syslog(LOG_ERR, "pwm_init: error in gpio->pwm%i transition. gpio_dir", pin);
            return MRAA_ERROR_INVALID_RESOURCE;
        }
        if (mraa_gpio_write(mux_i, 1) != MRAA_SUCCESS) {
            syslog(LOG_ERR, "pwm_init: error in gpio->pwm%i transition. gpio_write", pin);
            return MRAA_ERROR_INVALID_RESOURCE;
        }
        if (mraa_gpio_close(mux_i) != MRAA_SUCCESS) {
            syslog(LOG_ERR, "pwm_init: error in gpio->pwm%i transition. gpio_close", pin);
            return MRAA_ERROR_INVALID_RESOURCE;
        }
    }
    return MRAA_SUCCESS;
}

mraa_board_t*
mraa_intel_galileo_rev_d()
{
    mraa_board_t* b = (mraa_board_t*) calloc(1, sizeof(mraa_board_t));
    if (b == NULL) {
        return NULL;
    }

    b->platform_name = PLATFORM_NAME;
    b->phy_pin_count = 20;
    b->gpio_count = 14;
    b->aio_count = 6;
    b->uart_dev_count = 2;

    b->adc_raw = 12;
    b->adc_supported = 10;
    b->pwm_default_period = 500;
    b->pwm_max_period = 7968;
    b->pwm_min_period = 1;

    b->adv_func = (mraa_adv_func_t*) calloc(1, sizeof(mraa_adv_func_t));
    if (b->adv_func == NULL) {
        goto error;
    }
    b->adv_func->gpio_mmap_setup = &mraa_intel_galileo_g1_mmap_setup;
    b->adv_func->spi_lsbmode_replace = &mraa_intel_galileo_g1_spi_lsbmode_replace;
    b->adv_func->pwm_init_pre = mraa_intel_galileo_g1_pwm_init_pre;

    b->pins = (mraa_pininfo_t*) calloc(MRAA_INTEL_GALILEO_REV_D_PINCOUNT, sizeof(mraa_pininfo_t));
    if (b->pins == NULL) {
        free(b->adv_func);
        goto error;
    }

    // GPIO IO0 - IO10
    strncpy(b->pins[0].name, "IO0", 8);
    b->pins[0].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[0].gpio.pinmap = 50;
    b->pins[0].gpio.parent_id = 0;
    b->pins[0].gpio.mux_total = 1;
    b->pins[0].gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[0].gpio.mux[0].pin = 40;
    b->pins[0].gpio.mux[0].value = 1;
    b->pins[0].uart.pinmap = 0;
    b->pins[0].uart.parent_id = 0;
    b->pins[0].uart.mux_total = 1;
    b->pins[0].uart.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[0].uart.mux[0].pin = 40;
    b->pins[0].uart.mux[0].value = 0;

    strncpy(b->pins[1].name, "IO1", 8);
    b->pins[1].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[1].gpio.pinmap = 51;
    b->pins[1].gpio.mux_total = 1;
    b->pins[1].gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[1].gpio.mux[0].pin = 41;
    b->pins[1].gpio.mux[0].value = 1;
    b->pins[1].uart.pinmap = 0;
    b->pins[1].uart.parent_id = 0;
    b->pins[1].uart.mux_total = 1;
    b->pins[1].uart.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[1].uart.mux[0].pin = 41;
    b->pins[1].uart.mux[0].value = 0;

    strncpy(b->pins[2].name, "IO2", 8);
    b->pins[2].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 1, 0, 0, 0, 0 };
    b->pins[2].gpio.pinmap = 32;
    b->pins[2].gpio.mux_total = 1;
    b->pins[2].gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[2].gpio.mux[0].pin = 31;
    b->pins[2].gpio.mux[0].value = 1;
    b->pins[2].mmap.gpio.pinmap = 14;
    strncpy(b->pins[2].mmap.mem_dev, "/dev/uio0", 12);
    b->pins[2].mmap.gpio.mux_total = 3;
    b->pins[2].mmap.gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[2].mmap.gpio.mux[0].pin = 0;
    b->pins[2].mmap.gpio.mux[0].value = 0;
    b->pins[2].mmap.gpio.mux[1].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[2].mmap.gpio.mux[1].pin = 31;
    b->pins[2].mmap.gpio.mux[1].value = 0;
    b->pins[2].mmap.gpio.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[2].mmap.gpio.mux[2].pin = 14;
    b->pins[2].mmap.gpio.mux[2].value = 0;
    b->pins[2].mmap.mem_sz = 0x1000;
    b->pins[2].mmap.bit_pos = 6;

    strncpy(b->pins[3].name, "IO3", 8);
    b->pins[3].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 1, 0, 0, 0, 0 };
    b->pins[3].gpio.pinmap = 18;
    b->pins[3].gpio.mux_total = 1;
    b->pins[3].gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[3].gpio.mux[0].pin = 30;
    b->pins[3].gpio.mux[0].value = 1;
    b->pins[3].mmap.gpio.pinmap = 15;
    strncpy(b->pins[3].mmap.mem_dev, "/dev/uio0", 12);
    b->pins[3].mmap.gpio.mux_total = 3;
    b->pins[3].mmap.gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[3].mmap.gpio.mux[0].pin = 1;
    b->pins[3].mmap.gpio.mux[0].value = 0;
    b->pins[3].mmap.gpio.mux[1].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[3].mmap.gpio.mux[1].pin = 30;
    b->pins[3].mmap.gpio.mux[1].value = 0;
    b->pins[3].mmap.gpio.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[3].mmap.gpio.mux[2].pin = 15;
    b->pins[3].mmap.gpio.mux[2].value = 0;
    b->pins[3].mmap.mem_sz = 0x1000;
    b->pins[3].mmap.bit_pos = 7;
    b->pins[3].pwm.pinmap = 3;
    b->pins[3].pwm.parent_id = 0;
    b->pins[3].pwm.mux_total = 1;
    b->pins[3].pwm.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[3].pwm.mux[0].pin = 30;
    b->pins[3].pwm.mux[0].value = 1;


    strncpy(b->pins[4].name, "IO4", 8);
    b->pins[4].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[4].gpio.pinmap = 28;
    b->pins[4].gpio.mux_total = 0;

    strncpy(b->pins[5].name, "IO5", 8);
    b->pins[5].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    b->pins[5].gpio.pinmap = 17;
    b->pins[5].gpio.mux_total = 0;
    b->pins[5].pwm.pinmap = 5;
    b->pins[5].pwm.parent_id = 0;
    b->pins[5].pwm.mux_total = 0;

    strncpy(b->pins[6].name, "IO6", 8);
    b->pins[6].gpio.pinmap = 24;
    b->pins[6].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    b->pins[6].gpio.mux_total = 0;
    b->pins[6].pwm.pinmap = 6;
    b->pins[6].pwm.parent_id = 0;
    b->pins[6].pwm.mux_total = 0;

    strncpy(b->pins[7].name, "IO7", 8);
    b->pins[7].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[7].gpio.pinmap = 27;
    b->pins[7].gpio.mux_total = 0;

    strncpy(b->pins[8].name, "IO8", 8);
    b->pins[8].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[8].gpio.pinmap = 26;
    b->pins[8].gpio.mux_total = 0;

    strncpy(b->pins[9].name, "IO9", 8);
    b->pins[9].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    b->pins[9].gpio.pinmap = 19;
    b->pins[9].gpio.mux_total = 0;
    b->pins[9].pwm.pinmap = 1;
    b->pins[9].pwm.parent_id = 0;
    b->pins[9].pwm.mux_total = 0;

    strncpy(b->pins[10].name, "IO10", 8);
    b->pins[10].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 1, 0, 0, 0 };
    b->pins[10].gpio.pinmap = 16;
    b->pins[10].gpio.mux_total = 1;
    b->pins[10].gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[10].gpio.mux[0].pin = 42;
    b->pins[10].gpio.mux[0].value = 1;
    b->pins[10].pwm.pinmap = 7;
    b->pins[10].pwm.parent_id = 0;
    b->pins[10].pwm.mux_total = 1;
    b->pins[10].pwm.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[10].pwm.mux[0].pin = 42;
    b->pins[10].pwm.mux[0].value = 1;
    b->pins[10].spi.pinmap = 1;
    b->pins[10].spi.mux_total = 1;
    b->pins[10].spi.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[10].spi.mux[0].pin = 42;
    b->pins[10].spi.mux[0].value = 0;

    strncpy(b->pins[11].name, "IO11", 8);
    b->pins[11].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 1, 0, 0, 0 };
    b->pins[11].gpio.pinmap = 25;
    b->pins[11].gpio.mux_total = 1;
    b->pins[11].gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[11].gpio.mux[0].pin = 43;
    b->pins[11].gpio.mux[0].value = 1;
    b->pins[11].pwm.pinmap = 4;
    b->pins[11].pwm.parent_id = 0;
    b->pins[11].pwm.mux_total = 1;
    b->pins[11].pwm.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[11].pwm.mux[0].pin = 43;
    b->pins[11].pwm.mux[0].value = 1;
    b->pins[11].spi.pinmap = 1;
    b->pins[11].spi.mux_total = 1;
    b->pins[11].spi.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[11].spi.mux[0].pin = 43;
    b->pins[11].spi.mux[0].value = 0;

    strncpy(b->pins[12].name, "IO12", 8);
    b->pins[12].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[12].gpio.pinmap = 38;
    b->pins[12].gpio.mux_total = 1;
    b->pins[12].gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[12].gpio.mux[0].pin = 54;
    b->pins[12].gpio.mux[0].value = 1;
    b->pins[12].spi.pinmap = 1;
    b->pins[12].spi.mux_total = 1;
    b->pins[12].spi.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[12].spi.mux[0].pin = 54;
    b->pins[12].spi.mux[0].value = 0;

    strncpy(b->pins[13].name, "IO13", 8);
    b->pins[13].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[13].gpio.pinmap = 39;
    b->pins[13].gpio.mux_total = 1;
    b->pins[13].gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[13].gpio.mux[0].pin = 55;
    b->pins[13].gpio.mux[0].value = 1;
    b->pins[13].spi.pinmap = 1;
    b->pins[13].spi.mux_total = 1;
    b->pins[13].spi.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[13].spi.mux[0].pin = 55;
    b->pins[13].spi.mux[0].value = 0;

    strncpy(b->pins[14].name, "A0", 8);
    b->pins[14].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 1, 0 };
    b->pins[14].gpio.pinmap = 44;
    b->pins[14].gpio.mux_total = 1;
    b->pins[14].gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[14].gpio.mux[0].pin = 37;
    b->pins[14].gpio.mux[0].value = 1;
    b->pins[14].aio.pinmap = 0;
    b->pins[14].aio.mux_total = 1;
    b->pins[14].aio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[14].aio.mux[0].pin = 37;
    b->pins[14].aio.mux[0].value = 0;

    strncpy(b->pins[15].name, "A1", 8);
    b->pins[15].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 1, 0 };
    b->pins[15].gpio.pinmap = 45;
    b->pins[15].gpio.mux_total = 1;
    b->pins[15].gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[15].gpio.mux[0].pin = 36;
    b->pins[15].gpio.mux[0].value = 1;
    b->pins[15].aio.pinmap = 1;
    b->pins[15].aio.mux_total = 1;
    b->pins[15].aio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[15].aio.mux[0].pin = 36;
    b->pins[15].aio.mux[0].value = 0;

    strncpy(b->pins[16].name, "A2", 8);
    b->pins[16].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 1, 0 };
    b->pins[16].gpio.pinmap = 46;
    b->pins[16].gpio.mux_total = 1;
    b->pins[16].gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[16].gpio.mux[0].pin = 23;
    b->pins[16].gpio.mux[0].value = 1;
    b->pins[16].aio.pinmap = 2;
    b->pins[16].aio.mux_total = 1;
    b->pins[16].aio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[16].aio.mux[0].pin = 23;
    b->pins[16].aio.mux[0].value = 0;

    strncpy(b->pins[17].name, "A3", 8);
    b->pins[17].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 1, 0 };
    b->pins[17].gpio.pinmap = 47;
    b->pins[17].gpio.mux_total = 1;
    b->pins[17].gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[17].gpio.mux[0].pin = 22;
    b->pins[17].gpio.mux[0].value = 1;
    b->pins[17].aio.pinmap = 3;
    b->pins[17].aio.mux_total = 1;
    b->pins[17].aio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[17].aio.mux[0].pin = 22;
    b->pins[17].aio.mux[0].value = 0;

    strncpy(b->pins[18].name, "A4", 8);
    b->pins[18].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 1, 0 };
    b->pins[18].gpio.pinmap = 48;
    b->pins[18].gpio.mux_total = 2;
    b->pins[18].gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[18].gpio.mux[0].pin = 29;
    b->pins[18].gpio.mux[0].value = 1;
    b->pins[18].gpio.mux[1].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[18].gpio.mux[1].pin = 21;
    b->pins[18].gpio.mux[1].value = 1;
    b->pins[18].i2c.pinmap = 1;
    b->pins[18].i2c.mux_total = 1;
    b->pins[18].i2c.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[18].i2c.mux[0].pin = 29;
    b->pins[18].i2c.mux[0].value = 0;
    b->pins[18].aio.pinmap = 4;
    b->pins[18].aio.mux_total = 2;
    b->pins[18].aio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[18].aio.mux[0].pin = 29;
    b->pins[18].aio.mux[0].value = 1;
    b->pins[18].aio.mux[1].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[18].aio.mux[1].pin = 21;
    b->pins[18].aio.mux[1].value = 0;

    strncpy(b->pins[19].name, "A5", 8);
    b->pins[19].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 1, 0 };
    b->pins[19].gpio.pinmap = 49;
    b->pins[19].gpio.mux_total = 2;
    b->pins[19].gpio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[19].gpio.mux[0].pin = 29;
    b->pins[19].gpio.mux[0].value = 1;
    b->pins[19].gpio.mux[1].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[19].gpio.mux[1].pin = 20;
    b->pins[19].gpio.mux[1].value = 1;
    b->pins[19].i2c.pinmap = 1;
    b->pins[19].i2c.mux_total = 1;
    b->pins[19].i2c.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[19].i2c.mux[0].pin = 29;
    b->pins[19].i2c.mux[0].value = 0;
    b->pins[19].aio.pinmap = 5;
    b->pins[19].aio.mux_total = 2;
    b->pins[19].aio.mux[0].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[19].aio.mux[0].pin = 29;
    b->pins[19].aio.mux[0].value = 1;
    b->pins[19].aio.mux[1].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[19].aio.mux[1].pin = 20;
    b->pins[19].aio.mux[1].value = 0;

    // BUS DEFINITIONS
    b->i2c_bus_count = 1;
    b->def_i2c_bus = 0;
    b->i2c_bus[0].bus_id = 0;
    b->i2c_bus[0].sda = 18;
    b->i2c_bus[0].scl = 19;

    b->spi_bus_count = 1;
    b->def_spi_bus = 0;
    b->spi_bus[0].bus_id = 1;
    b->spi_bus[0].slave_s = 0;
    b->spi_bus[0].cs = 10;
    b->spi_bus[0].mosi = 11;
    b->spi_bus[0].miso = 12;
    b->spi_bus[0].sclk = 13;

    b->uart_dev_count = 2;
    b->def_uart_dev = 0;
    b->uart_dev[0].rx = 0;
    b->uart_dev[0].tx = 1;
    b->uart_dev[0].device_path = "/dev/ttyS0";

    b->uart_dev[1].rx = -1;
    b->uart_dev[1].tx = -1;
    b->uart_dev[1].device_path = "/dev/ttyS1";

    return b;
error:
    syslog(LOG_CRIT, "galileo1: Platform failed to initialise");
    free(b);
    return NULL;
}
