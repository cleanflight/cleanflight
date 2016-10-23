/*
 * Author: Brendan Le Foll <brendan.le.foll@intel.com>
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

#include "common.h"
#include "x86/intel_galileo_rev_g.h"

#define MAX_SIZE 64
#define SYSFS_CLASS_GPIO "/sys/class/gpio"
#define PLATFORM_NAME "Intel Galileo Gen 2"

#define UIO_PATH "/dev/uio0"

static uint8_t* mmap_reg = NULL;
static int mmap_fd = 0;
static int mmap_size = 0x1000;
static unsigned int mmap_count = 0;

static unsigned int pullup_map[] = { 33, 29, 35, 17, 37, 19, 21, 39, 41, 23,
                                     27, 25, 43, 31, 49, 51, 53, 55, 57, 59 };

static mraa_gpio_context agpioOutputen[MRAA_INTEL_GALILEO_GEN_2_PINCOUNT];

mraa_result_t
mraa_intel_galileo_gen2_dir_pre(mraa_gpio_context dev, mraa_gpio_dir_t dir)
{
    if (dev->phy_pin >= 0) {
        int pin = dev->phy_pin;
        if (plat->pins[pin].gpio.complex_cap.complex_pin != 1)
            return MRAA_SUCCESS;

        if (plat->pins[pin].gpio.complex_cap.output_en == 1) {
            if (!agpioOutputen[pin]) {
                agpioOutputen[pin] = mraa_gpio_init_raw(plat->pins[pin].gpio.output_enable);
                if (agpioOutputen[pin] == NULL) {
                    return MRAA_ERROR_INVALID_RESOURCE;
                }
                if (mraa_gpio_dir(agpioOutputen[pin], MRAA_GPIO_OUT) != MRAA_SUCCESS) {
                    return MRAA_ERROR_INVALID_RESOURCE;
                }
            }

            int output_val = 1;
            if (dir == MRAA_GPIO_OUT) {
                output_val = 0;
            }
            if (mraa_gpio_write(agpioOutputen[pin], output_val) != MRAA_SUCCESS) {
                return MRAA_ERROR_INVALID_RESOURCE;
            }
        }
    }
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_intel_galileo_gen2_gpio_close_pre(mraa_gpio_context dev)
{
    if (dev->phy_pin >= 0) {
        int pin = dev->phy_pin;
        if (agpioOutputen[pin]) {
            mraa_gpio_close(agpioOutputen[pin]);
            agpioOutputen[pin] = NULL;
        }
    }
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_intel_galileo_gen2_pwm_period_replace(mraa_pwm_context dev, int period)
{
    char bu[MAX_SIZE];
    snprintf(bu, MAX_SIZE, "/sys/class/pwm/pwmchip%d/device/pwm_period", dev->chipid);

    int period_f = open(bu, O_RDWR);
    if (period_f == -1) {
        syslog(LOG_ERR, "galileo2: Failed to open period for writing!");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    char out[MAX_SIZE];
    int length = snprintf(out, MAX_SIZE, "%d", period);
    if (write(period_f, out, length * sizeof(char)) == -1) {
        close(period_f);
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    close(period_f);
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_intel_galileo_gen2_gpio_mode_replace(mraa_gpio_context dev, mraa_gpio_mode_t mode)
{
    if (dev->value_fp != -1) {
        close(dev->value_fp);
        dev->value_fp = -1;
    }

    mraa_gpio_context pullup_e;
    pullup_e = mraa_gpio_init_raw(pullup_map[dev->phy_pin]);
    if (pullup_e == NULL) {
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    if (mraa_gpio_dir(pullup_e, MRAA_GPIO_IN) != MRAA_SUCCESS) {
        mraa_gpio_close(pullup_e);
        syslog(LOG_ERR, "galileo2: Failed to set gpio pullup");
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    char filepath[MAX_SIZE];
    snprintf(filepath, MAX_SIZE, SYSFS_CLASS_GPIO "/gpio%d/drive", pullup_map[dev->phy_pin]);

    int drive = open(filepath, O_WRONLY);
    if (drive == -1) {
        syslog(LOG_ERR, "galileo2: Failed to open drive for writing");
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    char bu[MAX_SIZE];
    int length;
    int value = -1;
    switch (mode) {
        case MRAA_GPIO_STRONG:
            length = snprintf(bu, sizeof(bu), "hiz");
            break;
        case MRAA_GPIO_PULLUP:
            length = snprintf(bu, sizeof(bu), "strong");
            value = 1;
            break;
        case MRAA_GPIO_PULLDOWN:
            length = snprintf(bu, sizeof(bu), "pulldown");
            value = 0;
            break;
        case MRAA_GPIO_HIZ:
            close(drive);
            return MRAA_SUCCESS;
            break;
        default:
            close(drive);
            return MRAA_ERROR_FEATURE_NOT_IMPLEMENTED;
    }
    if (write(drive, bu, length * sizeof(char)) == -1) {
        syslog(LOG_ERR, "galileo2: Failed to write to drive mode");
        close(drive);
        mraa_gpio_close(pullup_e);
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    if (value != -1) {
        mraa_result_t ret = mraa_gpio_dir(pullup_e, MRAA_GPIO_OUT);
        ret += mraa_gpio_write(pullup_e, value);
        if (ret != MRAA_SUCCESS) {
            syslog(LOG_ERR, "galileo2: Error Setting pullup");
            close(drive);
            return MRAA_ERROR_INVALID_RESOURCE;
        }
    }

    mraa_gpio_close(pullup_e);
    close(drive);
    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_intel_galileo_g2_mmap_unsetup()
{
    if (mmap_reg == NULL) {
        syslog(LOG_ERR, "mmap: null register cant unsetup");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    munmap(mmap_reg, mmap_size);
    mmap_reg = NULL;
    close(mmap_fd);
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_intel_galileo_g2_mmap_write(mraa_gpio_context dev, int value)
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
mraa_intel_galileo_g2_mmap_setup(mraa_gpio_context dev, mraa_boolean_t en)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "Galileo mmap: context not valid");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (mraa_pin_mode_test(dev->phy_pin, MRAA_PIN_FAST_GPIO) == 0) {
        syslog(LOG_ERR, "Galileo mmap: mmap not on this pin");
        return MRAA_ERROR_NO_RESOURCES;
    }
    if (en == 0) {
        if (dev->mmap_write == NULL) {
            syslog(LOG_ERR, "mmap: can't disable disabled mmap gpio");
            return MRAA_ERROR_INVALID_PARAMETER;
        }
        dev->mmap_write = NULL;
        mmap_count--;
        if (mmap_count == 0) {
            return mraa_intel_galileo_g2_mmap_unsetup();
        }
        return MRAA_SUCCESS;
    }

    if (dev->mmap_write != NULL) {
        syslog(LOG_ERR, "mmap: can't enable enabled mmap gpio");
        return MRAA_ERROR_INVALID_PARAMETER;
    }
    if (mmap_reg == NULL) {
        if ((mmap_fd = open(UIO_PATH, O_RDWR)) < 0) {
            syslog(LOG_ERR, "mmap: Unable to open UIO device");
            return MRAA_ERROR_INVALID_RESOURCE;
        }
        mmap_reg = mmap(NULL, mmap_size, PROT_READ | PROT_WRITE, MAP_SHARED, mmap_fd, 0);

        if (mmap_reg == MAP_FAILED) {
            syslog(LOG_ERR, "mmap: failed to mmap");
            mmap_reg = NULL;
            close(mmap_fd);
            return MRAA_ERROR_NO_RESOURCES;
        }
    }
    if (mraa_setup_mux_mapped(plat->pins[dev->phy_pin].mmap.gpio) != MRAA_SUCCESS) {
        syslog(LOG_ERR, "mmap: unable to setup required multiplexers");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    dev->mmap_write = &mraa_intel_galileo_g2_mmap_write;
    return MRAA_SUCCESS;
}

mraa_board_t*
mraa_intel_galileo_gen2()
{
    mraa_board_t* b = (mraa_board_t*) calloc(1, sizeof(mraa_board_t));
    if (b == NULL) {
        return NULL;
    }

    b->platform_name = PLATFORM_NAME;
    b->phy_pin_count = 20;
    b->gpio_count = 14;
    b->aio_count = 6;
    b->adc_raw = 12;
    b->adc_supported = 10;
    b->pwm_default_period = 5000;
    b->pwm_max_period = 41666;
    b->pwm_min_period = 666;

    b->adv_func = (mraa_adv_func_t*) calloc(1, sizeof(mraa_adv_func_t));
    if (b->adv_func == NULL) {
        goto error;
    }
    b->adv_func->gpio_close_pre = &mraa_intel_galileo_gen2_gpio_close_pre;
    b->adv_func->gpio_dir_pre = &mraa_intel_galileo_gen2_dir_pre;
    b->adv_func->pwm_period_replace = &mraa_intel_galileo_gen2_pwm_period_replace;
    b->adv_func->gpio_mode_replace = &mraa_intel_galileo_gen2_gpio_mode_replace;
    b->adv_func->gpio_mmap_setup = &mraa_intel_galileo_g2_mmap_setup;

    b->pins = (mraa_pininfo_t*) calloc(MRAA_INTEL_GALILEO_GEN_2_PINCOUNT, sizeof(mraa_pininfo_t));
    if (b->pins == NULL) {
        free(b->adv_func);
        goto error;
    }

    strncpy(b->pins[0].name, "IO0", 8);
    b->pins[0].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 1, 0, 0, 0, 1 };
    b->pins[0].gpio.pinmap = 11;
    b->pins[0].gpio.parent_id = 0;
    b->pins[0].gpio.mux_total = 1;
    b->pins[0].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[0].gpio.mux[0].pin = 33;
    b->pins[0].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[0].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 1, 0, 1, 1 };
    b->pins[0].gpio.output_enable = 32;
    b->pins[0].mmap.gpio.pinmap = 11;
    strncpy(b->pins[0].mmap.mem_dev, "/dev/uio0", 12);
    b->pins[0].mmap.gpio.mux_total = 3;
    b->pins[0].mmap.gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[0].mmap.gpio.mux[0].pin = 33;
    b->pins[0].mmap.gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[0].mmap.gpio.mux[1].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[0].mmap.gpio.mux[1].pin = 32;
    b->pins[0].mmap.gpio.mux[1].value = 0;
    b->pins[0].mmap.gpio.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[0].mmap.gpio.mux[2].pin = 11;
    b->pins[0].mmap.gpio.mux[2].value = 0;
    b->pins[0].mmap.mem_sz = 0x1000;
    b->pins[0].mmap.bit_pos = 3;
    b->pins[0].uart.parent_id = 0;
    b->pins[0].uart.mux_total = 2;
    b->pins[0].uart.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[0].uart.mux[0].pin = 33;
    b->pins[0].uart.mux[0].value = MRAA_GPIO_IN;
    b->pins[0].uart.mux[1].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[0].uart.mux[1].pin = 32;
    b->pins[0].uart.mux[1].value = 1;

    strncpy(b->pins[1].name, "IO1", 8);
    b->pins[1].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 1, 0, 0, 0, 1 };
    b->pins[1].gpio.pinmap = 12;
    b->pins[1].gpio.parent_id = 0;
    b->pins[1].gpio.mux_total = 2;
    b->pins[1].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[1].gpio.mux[0].pin = 29;
    b->pins[1].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[1].gpio.mux[1].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[1].gpio.mux[1].pin = 45;
    b->pins[1].gpio.mux[1].value = 0;
    b->pins[1].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 1, 0, 1, 1 };
    b->pins[1].gpio.output_enable = 28;
    b->pins[1].mmap.gpio.pinmap = 12;
    strncpy(b->pins[1].mmap.mem_dev, "/dev/uio0", 12);
    b->pins[1].mmap.gpio.mux_total = 4;
    b->pins[1].mmap.gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[1].mmap.gpio.mux[0].pin = 29;
    b->pins[1].mmap.gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[1].mmap.gpio.mux[1].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[1].mmap.gpio.mux[1].pin = 45;
    b->pins[1].mmap.gpio.mux[1].value = 0;
    b->pins[1].mmap.gpio.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[1].mmap.gpio.mux[2].pin = 28;
    b->pins[1].mmap.gpio.mux[2].value = 0;
    b->pins[1].mmap.gpio.mux[3].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[1].mmap.gpio.mux[3].pin = 12;
    b->pins[1].mmap.gpio.mux[3].value = 0;
    b->pins[1].mmap.mem_sz = 0x1000;
    b->pins[1].mmap.bit_pos = 4;
    b->pins[1].uart.parent_id = 0;
    b->pins[1].uart.mux_total = 3;
    b->pins[1].uart.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[1].uart.mux[0].pin = 29;
    b->pins[1].uart.mux[0].value = MRAA_GPIO_IN;
    b->pins[1].uart.mux[1].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[1].uart.mux[1].pin = 45;
    b->pins[1].uart.mux[1].value = 1;
    b->pins[1].uart.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[1].uart.mux[2].pin = 28;
    b->pins[1].uart.mux[2].value = 0;

    strncpy(b->pins[2].name, "IO2", 8);
    b->pins[2].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 1, 0, 0, 0, 0};
    b->pins[2].gpio.pinmap = 13;
    b->pins[2].gpio.parent_id = 0;
    b->pins[2].gpio.mux_total = 2;
    b->pins[2].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[2].gpio.mux[0].pin = 35;
    b->pins[2].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[2].gpio.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[2].gpio.mux[1].pin = 77;
    b->pins[2].gpio.mux[1].value = 0;
    b->pins[2].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 1, 0, 1, 1 };
    b->pins[2].gpio.output_enable = 34;
    b->pins[2].mmap.gpio.pinmap = 13;
    strncpy(b->pins[2].mmap.mem_dev, "/dev/uio0", 12);
    b->pins[2].mmap.gpio.mux_total = 4;
    b->pins[2].mmap.gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[2].mmap.gpio.mux[0].pin = 35;
    b->pins[2].mmap.gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[2].mmap.gpio.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[2].mmap.gpio.mux[1].pin = 77;
    b->pins[2].mmap.gpio.mux[1].value = 0;
    b->pins[2].mmap.gpio.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[2].mmap.gpio.mux[2].pin = 34;
    b->pins[2].mmap.gpio.mux[2].value = 0;
    b->pins[2].mmap.gpio.mux[3].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[2].mmap.gpio.mux[3].pin = 13;
    b->pins[2].mmap.gpio.mux[3].value = 0;
    b->pins[2].mmap.mem_sz = 0x1000;
    b->pins[2].mmap.bit_pos = 5;

    strncpy(b->pins[3].name, "IO3", 8);
    b->pins[3].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 1, 0, 0, 0, 0 };
    b->pins[3].gpio.pinmap = 14;
    b->pins[3].gpio.parent_id = 0;
    b->pins[3].gpio.mux_total = 3;
    b->pins[3].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[3].gpio.mux[0].pin = 17;
    b->pins[3].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[3].gpio.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[3].gpio.mux[1].pin = 76;
    b->pins[3].gpio.mux[1].value = 0;
    b->pins[3].gpio.mux[2].pincmd = PINCMD_SET_VALUE;
    b->pins[3].gpio.mux[2].pin = 64;
    b->pins[3].gpio.mux[2].value = 0;
    b->pins[3].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 1, 0, 1, 1 };
    b->pins[3].gpio.output_enable = 16;
    b->pins[3].pwm.pinmap = 1;
    b->pins[3].pwm.parent_id = 0;
    b->pins[3].pwm.mux_total = 4;
    b->pins[3].pwm.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[3].pwm.mux[0].pin = 17;
    b->pins[3].pwm.mux[0].value = MRAA_GPIO_IN;
    b->pins[3].pwm.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[3].pwm.mux[1].pin = 76;
    b->pins[3].pwm.mux[1].value = 0;
    b->pins[3].pwm.mux[2].pincmd = PINCMD_SET_VALUE;
    b->pins[3].pwm.mux[2].pin = 64;
    b->pins[3].pwm.mux[2].value = 1;
    b->pins[3].pwm.mux[3].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[3].pwm.mux[3].pin = 16;
    b->pins[3].pwm.mux[3].value = 0;
    b->pins[3].mmap.gpio.pinmap = 14;
    strncpy(b->pins[3].mmap.mem_dev, "/dev/uio0", 12);
    b->pins[3].mmap.gpio.mux_total = 5;
    b->pins[3].mmap.gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[3].mmap.gpio.mux[0].pin = 17;
    b->pins[3].mmap.gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[3].mmap.gpio.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[3].mmap.gpio.mux[1].pin = 76;
    b->pins[3].mmap.gpio.mux[1].value = 0;
    b->pins[3].mmap.gpio.mux[2].pincmd = PINCMD_SET_VALUE;
    b->pins[3].mmap.gpio.mux[2].pin = 64;
    b->pins[3].mmap.gpio.mux[2].value = 0;
    b->pins[3].mmap.gpio.mux[3].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[3].mmap.gpio.mux[3].pin = 16;
    b->pins[3].mmap.gpio.mux[3].value = 0;
    b->pins[3].mmap.gpio.mux[4].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[3].mmap.gpio.mux[4].pin = 14;
    b->pins[3].mmap.gpio.mux[4].value = 0;
    b->pins[3].mmap.mem_sz = 0x1000;
    b->pins[3].mmap.bit_pos = 6;

    strncpy(b->pins[4].name, "IO4", 8);
    b->pins[4].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[4].gpio.pinmap = 6;
    b->pins[4].gpio.parent_id = 0;
    b->pins[4].gpio.mux_total = 1;
    b->pins[4].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[4].gpio.mux[0].pin = 37;
    b->pins[4].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[4].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 1, 0, 1, 1 };
    b->pins[4].gpio.output_enable = 36;

    strncpy(b->pins[5].name, "IO5", 8);
    b->pins[5].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0 , 0 };
    b->pins[5].gpio.pinmap = 0;
    b->pins[5].gpio.parent_id = 0;
    b->pins[5].gpio.mux_total = 2;
    b->pins[5].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[5].gpio.mux[0].pin = 19;
    b->pins[5].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[5].gpio.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[5].gpio.mux[1].pin = 66;
    b->pins[5].gpio.mux[1].value = 0;
    b->pins[5].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 1, 0, 1, 1 };
    b->pins[5].gpio.output_enable = 18;
    b->pins[5].pwm.pinmap = 3;
    b->pins[5].pwm.parent_id = 0;
    b->pins[5].pwm.mux_total = 3;
    b->pins[5].pwm.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[5].pwm.mux[0].pin = 19;
    b->pins[5].pwm.mux[0].value = MRAA_GPIO_IN;
    b->pins[5].pwm.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[5].pwm.mux[1].pin = 66;
    b->pins[5].pwm.mux[1].value = 1;
    b->pins[5].pwm.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[5].pwm.mux[2].pin = 18;
    b->pins[5].pwm.mux[2].value = 0;

    strncpy(b->pins[6].name, "IO6", 8);
    b->pins[6].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    b->pins[6].gpio.pinmap = 1;
    b->pins[6].gpio.parent_id = 0;
    b->pins[6].gpio.mux_total = 2;
    b->pins[6].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[6].gpio.mux[0].pin = 21;
    b->pins[6].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[6].gpio.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[6].gpio.mux[1].pin = 68;
    b->pins[6].gpio.mux[1].value = 0;
    b->pins[6].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 1, 0, 1, 1 };
    b->pins[6].gpio.output_enable = 20;
    b->pins[6].pwm.pinmap = 5;
    b->pins[6].pwm.parent_id = 0;
    b->pins[6].pwm.mux_total = 3;
    b->pins[6].pwm.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[6].pwm.mux[0].pin = 21;
    b->pins[6].pwm.mux[0].value = MRAA_GPIO_IN;
    b->pins[6].pwm.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[6].pwm.mux[1].pin = 68;
    b->pins[6].pwm.mux[1].value = 1;
    b->pins[6].pwm.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[6].pwm.mux[2].pin = 20;
    b->pins[6].pwm.mux[2].value = 0;

    strncpy(b->pins[7].name, "IO7", 8);
    b->pins[7].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[7].gpio.pinmap = 38;
    b->pins[7].gpio.parent_id = 0;
    b->pins[7].gpio.mux_total = 1;
    b->pins[7].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[7].gpio.mux[0].pin = 39;
    b->pins[7].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[7].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 0, 0, 1, 1 };

    strncpy(b->pins[8].name, "IO8", 8);
    b->pins[8].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[8].gpio.pinmap = 40;
    b->pins[8].gpio.parent_id = 0;
    b->pins[8].gpio.mux_total = 1;
    b->pins[8].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[8].gpio.mux[0].pin = 41;
    b->pins[8].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[8].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 0, 0, 1, 1 };

    strncpy(b->pins[9].name, "IO9", 8);
    b->pins[9].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    b->pins[9].gpio.pinmap = 4;
    b->pins[9].gpio.parent_id = 0;
    b->pins[9].gpio.mux_total = 2;
    b->pins[9].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[9].gpio.mux[0].pin = 23;
    b->pins[9].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[9].gpio.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[9].gpio.mux[1].pin = 70;
    b->pins[9].gpio.mux[1].value = 0;
    b->pins[9].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 1, 0, 1, 1 };
    b->pins[9].gpio.output_enable = 22;
    b->pins[9].pwm.pinmap = 7;
    b->pins[9].pwm.parent_id = 0;
    b->pins[9].pwm.mux_total = 3;
    b->pins[9].pwm.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[9].pwm.mux[0].pin = 23;
    b->pins[9].pwm.mux[0].value = MRAA_GPIO_IN;
    b->pins[9].pwm.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[9].pwm.mux[1].pin = 70;
    b->pins[9].pwm.mux[1].value = 1;
    b->pins[9].pwm.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[9].pwm.mux[2].pin = 22;
    b->pins[9].pwm.mux[2].value = 0;

    strncpy(b->pins[10].name, "IO10", 8);
    b->pins[10].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 1, 1, 0, 0, 0 };
    b->pins[10].gpio.pinmap = 10;
    b->pins[10].gpio.parent_id = 0;
    b->pins[10].gpio.mux_total = 2;
    b->pins[10].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[10].gpio.mux[0].pin = 27;
    b->pins[10].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[10].gpio.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[10].gpio.mux[1].pin = 74;
    b->pins[10].gpio.mux[1].value = 0;
    b->pins[10].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 1, 0, 1, 1 };
    b->pins[10].gpio.output_enable = 26;
    b->pins[10].pwm.pinmap = 11;
    b->pins[10].pwm.parent_id = 0;
    b->pins[10].pwm.mux_total = 3;
    b->pins[10].pwm.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[10].pwm.mux[0].pin = 27;
    b->pins[10].pwm.mux[0].value = MRAA_GPIO_IN;
    b->pins[10].pwm.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[10].pwm.mux[1].pin = 74;
    b->pins[10].pwm.mux[1].value = 1;
    b->pins[10].pwm.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[10].pwm.mux[2].pin = 26;
    b->pins[10].pwm.mux[2].value = 0;
    b->pins[10].mmap.gpio.pinmap = 10;
    strncpy(b->pins[10].mmap.mem_dev, "/dev/uio0", 12);
    b->pins[10].mmap.gpio.mux_total = 4;
    b->pins[10].mmap.gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[10].mmap.gpio.mux[0].pin = 27;
    b->pins[10].mmap.gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[10].mmap.gpio.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[10].mmap.gpio.mux[1].pin = 74;
    b->pins[10].mmap.gpio.mux[1].value = 0;
    b->pins[10].mmap.gpio.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[10].mmap.gpio.mux[2].pin = 26;
    b->pins[10].mmap.gpio.mux[2].value = 0;
    b->pins[10].mmap.gpio.mux[3].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[10].mmap.gpio.mux[3].pin = 10;
    b->pins[10].mmap.gpio.mux[3].value = 0;
    b->pins[10].mmap.mem_sz = 0x1000;
    b->pins[10].mmap.bit_pos = 2;
    b->pins[10].spi.parent_id = 1;
    b->pins[10].spi.mux_total = 3;
    b->pins[10].spi.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[10].spi.mux[0].pin = 27;
    b->pins[10].spi.mux[0].value = MRAA_GPIO_IN;
    b->pins[10].spi.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[10].spi.mux[1].pin = 74;
    b->pins[10].spi.mux[1].value = 0;
    b->pins[10].spi.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[10].spi.mux[2].pin = 26;
    b->pins[10].spi.mux[2].value = 0;

    strncpy(b->pins[11].name, "IO11", 8);
    b->pins[11].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 1, 0, 0, 0 };
    b->pins[11].gpio.pinmap = 5;
    b->pins[11].gpio.parent_id = 0;
    b->pins[11].gpio.mux_total = 3;
    b->pins[11].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[11].gpio.mux[0].pin = 25;
    b->pins[11].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[11].gpio.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[11].gpio.mux[1].pin = 72;
    b->pins[11].gpio.mux[1].value = 0;
    b->pins[11].gpio.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[11].gpio.mux[2].pin = 44;
    b->pins[11].gpio.mux[2].value = 0;
    b->pins[11].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 1, 0, 1, 1 };
    b->pins[11].gpio.output_enable = 24;
    b->pins[11].pwm.pinmap = 9;
    b->pins[11].pwm.parent_id = 0;
    b->pins[11].pwm.mux_total = 4;
    b->pins[11].pwm.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[11].pwm.mux[0].pin = 25;
    b->pins[11].pwm.mux[0].value = MRAA_GPIO_IN;
    b->pins[11].pwm.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[11].pwm.mux[1].pin = 72;
    b->pins[11].pwm.mux[1].value = 1;
    b->pins[11].pwm.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[11].pwm.mux[2].pin = 44;
    b->pins[11].pwm.mux[2].value = 0;
    b->pins[11].pwm.mux[3].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[11].pwm.mux[3].pin = 24;
    b->pins[11].pwm.mux[3].value = 0;
    b->pins[11].spi.pinmap = 1;
    b->pins[11].spi.mux_total = 4;
    b->pins[11].spi.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[11].spi.mux[0].pin = 25;
    b->pins[11].spi.mux[0].value = MRAA_GPIO_IN;
    b->pins[11].spi.mux[1].pincmd = PINCMD_SET_VALUE;
    b->pins[11].spi.mux[1].pin = 72;
    b->pins[11].spi.mux[1].value = 0;
    b->pins[11].spi.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[11].spi.mux[2].pin = 44;
    b->pins[11].spi.mux[2].value = 1;
    b->pins[11].spi.mux[3].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[11].spi.mux[3].pin = 24;
    b->pins[11].spi.mux[3].value = 0;

    strncpy(b->pins[12].name, "IO12", 8);
    b->pins[12].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 1, 1, 0, 0, 0 };
    b->pins[12].gpio.pinmap = 15;
    b->pins[12].gpio.parent_id = 0;
    b->pins[12].gpio.mux_total = 1;
    b->pins[12].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[12].gpio.mux[0].pin = 43;
    b->pins[12].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[12].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 1, 0, 1, 1 };
    b->pins[12].gpio.output_enable = 42;
    b->pins[12].spi.pinmap = 1;
    b->pins[12].spi.mux_total = 2;
    b->pins[12].spi.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[12].spi.mux[0].pin = 43;
    b->pins[12].spi.mux[0].value = MRAA_GPIO_IN;
    b->pins[12].spi.mux[1].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[12].spi.mux[1].pin = 42;
    b->pins[12].spi.mux[1].value = 1;
    b->pins[12].mmap.gpio.pinmap = 15;
    strncpy(b->pins[12].mmap.mem_dev, "/dev/uio0", 12);
    b->pins[12].mmap.gpio.mux_total = 3;
    b->pins[12].mmap.gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[12].mmap.gpio.mux[0].pin = 43;
    b->pins[12].mmap.gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[12].mmap.gpio.mux[1].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[12].mmap.gpio.mux[1].pin = 42;
    b->pins[12].mmap.gpio.mux[1].value = 0;
    b->pins[12].mmap.gpio.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[12].mmap.gpio.mux[2].pin = 15;
    b->pins[12].mmap.gpio.mux[2].value = 0;
    b->pins[12].mmap.mem_sz = 0x1000;
    b->pins[12].mmap.bit_pos = 7;

    strncpy(b->pins[13].name, "IO13", 8);
    b->pins[13].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[13].gpio.pinmap = 7;
    b->pins[13].gpio.parent_id = 0;
    b->pins[13].gpio.mux_total = 2;
    b->pins[13].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[13].gpio.mux[0].pin = 31;
    b->pins[13].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[13].gpio.mux[1].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[13].gpio.mux[1].pin = 46;
    b->pins[13].gpio.mux[1].value = 0;
    b->pins[13].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 1, 0, 1, 1 };
    b->pins[13].gpio.output_enable = 30;
    b->pins[13].spi.pinmap = 1;
    b->pins[13].spi.mux_total = 3;
    b->pins[13].spi.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[13].spi.mux[0].pin = 31;
    b->pins[13].spi.mux[0].value = MRAA_GPIO_IN;
    b->pins[13].spi.mux[1].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[13].spi.mux[1].pin = 46;
    b->pins[13].spi.mux[1].value = 1;
    b->pins[13].spi.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[13].spi.mux[2].pin = 30;
    b->pins[13].spi.mux[2].value = 0;

    // ANALOG
    strncpy(b->pins[14].name, "A0", 8);
    b->pins[14].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 1, 0 };
    b->pins[14].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 0, 0, 1, 1 };
    b->pins[14].aio.pinmap = 0;
    b->pins[14].aio.mux_total = 2;
    b->pins[14].aio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[14].aio.mux[0].pin = 49;
    b->pins[14].aio.mux[0].value = MRAA_GPIO_IN;
    b->pins[14].aio.mux[1].pincmd = PINCMD_SET_DIRECTION;
    b->pins[14].aio.mux[1].pin = 48;
    b->pins[14].aio.mux[1].value = MRAA_GPIO_IN;
    b->pins[14].gpio.pinmap = 48;
    b->pins[14].gpio.mux_total = 1;
    b->pins[14].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[14].gpio.mux[0].pin = 49;
    b->pins[14].gpio.mux[0].value = MRAA_GPIO_IN;

    strncpy(b->pins[15].name, "A1", 8);
    b->pins[15].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 1, 0 };
    b->pins[15].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 0, 0, 1, 1 };
    b->pins[15].aio.pinmap = 1;
    b->pins[15].aio.mux_total = 2;
    b->pins[15].aio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[15].aio.mux[0].pin = 51;
    b->pins[15].aio.mux[0].value = MRAA_GPIO_IN;
    b->pins[15].aio.mux[1].pincmd = PINCMD_SET_DIRECTION;
    b->pins[15].aio.mux[1].pin = 50;
    b->pins[15].aio.mux[1].value = MRAA_GPIO_IN;
    b->pins[15].gpio.pinmap = 50;
    b->pins[15].gpio.mux_total = 1;
    b->pins[15].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[15].gpio.mux[0].pin = 51;
    b->pins[15].gpio.mux[0].value = MRAA_GPIO_IN;

    strncpy(b->pins[16].name, "A2", 8);
    b->pins[16].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 1, 0 };
    b->pins[16].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 0, 0, 1, 1 };
    b->pins[16].aio.pinmap = 2;
    b->pins[16].aio.mux_total = 2;
    b->pins[16].aio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[16].aio.mux[0].pin = 53;
    b->pins[16].aio.mux[0].value = MRAA_GPIO_IN;
    b->pins[16].aio.mux[1].pincmd = PINCMD_SET_DIRECTION;
    b->pins[16].aio.mux[1].pin = 52;
    b->pins[16].aio.mux[1].value = MRAA_GPIO_IN;
    b->pins[16].gpio.pinmap = 52;
    b->pins[16].gpio.mux_total = 1;
    b->pins[16].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[16].gpio.mux[0].pin = 53;
    b->pins[16].gpio.mux[0].value = MRAA_GPIO_IN;

    strncpy(b->pins[17].name, "A3", 8);
    b->pins[17].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 1, 0 };
    b->pins[17].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 0, 0, 1, 1 };
    b->pins[17].aio.pinmap = 3;
    b->pins[17].aio.mux_total = 2;
    b->pins[17].aio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[17].aio.mux[0].pin = 55;
    b->pins[17].aio.mux[0].value = MRAA_GPIO_IN;
    b->pins[17].aio.mux[1].pincmd = PINCMD_SET_DIRECTION;
    b->pins[17].aio.mux[1].pin = 54;
    b->pins[17].aio.mux[1].value = MRAA_GPIO_IN;
    b->pins[17].gpio.pinmap = 54;
    b->pins[17].gpio.mux_total = 1;
    b->pins[17].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[17].gpio.mux[0].pin = 55;
    b->pins[17].gpio.mux[0].value = MRAA_GPIO_IN;

    strncpy(b->pins[18].name, "A4", 8);
    b->pins[18].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 1, 0 };
    b->pins[18].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 0, 0, 1, 1 };
    b->pins[18].i2c.pinmap = 1;
    b->pins[18].i2c.mux_total = 3;
    b->pins[18].i2c.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[18].i2c.mux[0].pin = 57;
    b->pins[18].i2c.mux[0].value = MRAA_GPIO_IN;
    b->pins[18].i2c.mux[1].pincmd = PINCMD_SET_MODE;
    b->pins[18].i2c.mux[1].pin = 57;
    b->pins[18].i2c.mux[1].value = MRAA_GPIO_HIZ;
    b->pins[18].i2c.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[18].i2c.mux[2].pin = 60;
    b->pins[18].i2c.mux[2].value = 0;
    b->pins[18].aio.pinmap = 4;
    b->pins[18].aio.mux_total = 3;
    b->pins[18].aio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[18].aio.mux[0].pin = 57;
    b->pins[18].aio.mux[0].value = MRAA_GPIO_IN;
    b->pins[18].aio.mux[1].pincmd = PINCMD_SET_DIRECTION;
    b->pins[18].aio.mux[1].pin = 60;
    b->pins[18].aio.mux[1].value = MRAA_GPIO_OUT_HIGH;
    b->pins[18].aio.mux[2].pincmd = PINCMD_SET_VALUE;
    b->pins[18].aio.mux[2].pin = 78;
    b->pins[18].aio.mux[2].value = 0;
    b->pins[18].gpio.pinmap = 56;
    b->pins[18].gpio.mux_total = 3;
    b->pins[18].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[18].gpio.mux[0].pin = 57;
    b->pins[18].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[18].gpio.mux[1].pincmd = PINCMD_SET_DIRECTION;
    b->pins[18].gpio.mux[1].pin = 60;
    b->pins[18].gpio.mux[1].value = MRAA_GPIO_OUT_HIGH;
    b->pins[18].gpio.mux[2].pincmd = PINCMD_SET_VALUE;
    b->pins[18].gpio.mux[2].pin = 78;
    b->pins[18].gpio.mux[2].value = 1;

    strncpy(b->pins[19].name, "A5", 8);
    b->pins[19].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 1, 0 };
    b->pins[19].gpio.complex_cap = (mraa_pin_cap_complex_t){ 1, 0, 0, 1, 1 };
    b->pins[19].i2c.pinmap = 1;
    b->pins[19].i2c.mux_total = 3;
    b->pins[19].i2c.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[19].i2c.mux[0].pin = 59;
    b->pins[19].i2c.mux[0].value = MRAA_GPIO_IN;
    b->pins[19].i2c.mux[1].pincmd = PINCMD_SET_MODE;
    b->pins[19].i2c.mux[1].pin = 59;
    b->pins[19].i2c.mux[1].value = MRAA_GPIO_HIZ;
    b->pins[19].i2c.mux[2].pincmd = PINCMD_SET_OUT_VALUE;
    b->pins[19].i2c.mux[2].pin = 60;
    b->pins[19].i2c.mux[2].value = 0;
    b->pins[19].aio.pinmap = 5;
    b->pins[19].aio.mux_total = 3;
    b->pins[19].aio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[19].aio.mux[0].pin = 59;
    b->pins[19].aio.mux[0].value = MRAA_GPIO_IN;
    b->pins[19].aio.mux[1].pincmd = PINCMD_SET_DIRECTION;
    b->pins[19].aio.mux[1].pin = 60;
    b->pins[19].aio.mux[1].value = MRAA_GPIO_OUT_HIGH;
    b->pins[19].aio.mux[2].pincmd = PINCMD_SET_VALUE;
    b->pins[19].aio.mux[2].pin = 79;
    b->pins[19].aio.mux[2].value = 0;
    b->pins[19].gpio.pinmap = 58;
    b->pins[19].gpio.mux_total = 3;
    b->pins[19].gpio.mux[0].pincmd = PINCMD_SET_DIRECTION;
    b->pins[19].gpio.mux[0].pin = 59;
    b->pins[19].gpio.mux[0].value = MRAA_GPIO_IN;
    b->pins[19].gpio.mux[1].pincmd = PINCMD_SET_DIRECTION;
    b->pins[19].gpio.mux[1].pin = 60;
    b->pins[19].gpio.mux[1].value = MRAA_GPIO_OUT_HIGH;
    b->pins[19].gpio.mux[2].pincmd = PINCMD_SET_VALUE;
    b->pins[19].gpio.mux[2].pin = 79;
    b->pins[19].gpio.mux[2].value = 1;

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
    syslog(LOG_CRIT, "galileo2: Platform failed to initialise");
    free(b);
    return NULL;
}
