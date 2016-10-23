/*
 * Author: Henry Bruce <henry.bruce@intel.com>
 * 	   Evan Steele <evan.steele@intel.com>
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
#include <sys/utsname.h>
#include <ctype.h>

#include "common.h"
#include "x86/intel_minnow_byt_compatible.h"

#define PLATFORM_NAME "MinnowBoard MAX"
#define I2C_BUS_DEFAULT 7
#define MAX_LENGTH 8
#define I2CNAME "designware"

int arch_nr_gpios_adjust = 0x100;

mraa_result_t
mraa_set_pininfo(mraa_board_t* board, int mraa_index, char* name, mraa_pincapabilities_t caps, int sysfs_pin)
{
    if (mraa_index < board->phy_pin_count) {
        // adjust mraa_index for ARCH_NR_GPIOS value
        mraa_pininfo_t* pin_info = &board->pins[mraa_index];
        strncpy(pin_info->name, name, MAX_LENGTH);
        pin_info->capabilities = caps;
        if (caps.gpio) {
            pin_info->gpio.pinmap = sysfs_pin | arch_nr_gpios_adjust;
            pin_info->gpio.mux_total = 0;
        }
        if (caps.i2c) {
            pin_info->i2c.pinmap = 1;
            pin_info->i2c.mux_total = 0;
        }
        if (caps.pwm) {
            int controller = 0;
            if (strncmp(name, "PWM", 3) == 0 && strlen(name) > 3 && isdigit(name[3]))
                controller = name[3] - '0';
            pin_info->pwm.parent_id = controller;
            pin_info->pwm.pinmap = 0;
            pin_info->pwm.mux_total = 0;
        }
        if (caps.spi) {
            pin_info->spi.mux_total = 0;
        }
        return MRAA_SUCCESS;
    }
    return MRAA_ERROR_INVALID_RESOURCE;
}

mraa_result_t
mraa_get_pin_index(mraa_board_t* board, char* name, int* pin_index)
{
    int i;
    for (i = 0; i < board->phy_pin_count; ++i) {
        if (strncmp(name, board->pins[i].name, MAX_LENGTH) == 0) {
            *pin_index = i;
            return MRAA_SUCCESS;
        }
    }
    return MRAA_ERROR_INVALID_RESOURCE;
}

mraa_board_t*
mraa_intel_minnowboard_byt_compatible(mraa_boolean_t turbot)
{
    mraa_board_t* b = (mraa_board_t*) calloc(1, sizeof(mraa_board_t));

    struct utsname running_uname;
    int uname_major, uname_minor;

    if (b == NULL) {
        return NULL;
    }

    b->platform_name = PLATFORM_NAME;
    if (turbot) {
        b->platform_version = "Turbot";
        b->gpio_count = b->phy_pin_count = MRAA_INTEL_MINNOW_TURBOT_PINCOUNT;
    } else {
        b->platform_version = "Ax";
        b->gpio_count = b->phy_pin_count = MRAA_INTEL_MINNOW_MAX_PINCOUNT;
    }

    b->pins = (mraa_pininfo_t*) calloc(b->phy_pin_count, sizeof(mraa_pininfo_t));
    if (b->pins == NULL) {
        goto error;
    }

    b->adv_func = (mraa_adv_func_t*) calloc(1, sizeof(mraa_adv_func_t));
    if (b->adv_func == NULL) {
        free(b->pins);
        goto error;
    }

    if (uname(&running_uname) != 0) {
        free(b->pins);
        free(b->adv_func);
        goto error;
    }

    sscanf(running_uname.release, "%d.%d", &uname_major, &uname_minor);

    /* if we are on Linux 3.17 or lower they use a 256 max and number the GPIOs down
     * if we are on 3.18 or higher (ea584595fc85e65796335033dfca25ed655cd0ed)  (for now)
     * they start at 512 and number down, at some point this is going to change again when
     * GPIO moves to a radix.
     */
    if (uname_major <= 3 && uname_minor <= 17) {
        arch_nr_gpios_adjust = 0;
    }

    mraa_set_pininfo(b, 0, "INVALID", (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    mraa_set_pininfo(b, 1, "GND", (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    mraa_set_pininfo(b, 2, "GND", (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    mraa_set_pininfo(b, 3, "5v", (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    mraa_set_pininfo(b, 4, "3.3v", (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 }, -1);
    mraa_set_pininfo(b, 5, "SPI_CS", (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 0, 0, 0 }, 220);
    mraa_set_pininfo(b, 6, "UART1TX", (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 1 }, 225);
    mraa_set_pininfo(b, 7, "SPIMISO", (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 0, 0, 0 }, 221);
    mraa_set_pininfo(b, 8, "UART1RX", (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 1 }, 224);
    mraa_set_pininfo(b, 9, "SPIMOSI", (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 0, 0, 0 }, 222);
    mraa_set_pininfo(b, 10, "UART1CT", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 227);
    mraa_set_pininfo(b, 11, "SPI_CLK", (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 0, 0, 0 }, 223);
    mraa_set_pininfo(b, 12, "UART1RT", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 226);
    mraa_set_pininfo(b, 13, "I2C_SCL", (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 1, 0, 0 }, 243);
    mraa_set_pininfo(b, 14, "I2S_CLK", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 216);
    mraa_set_pininfo(b, 15, "I2C_SDA", (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 1, 0, 0 }, 242);
    mraa_set_pininfo(b, 16, "I2S_FRM", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 217);
    mraa_set_pininfo(b, 17, "UART2TX", (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 1 }, 229);
    mraa_set_pininfo(b, 18, "I2S_DO", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 219);
    mraa_set_pininfo(b, 19, "UART2RX", (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 1 }, 228);
    mraa_set_pininfo(b, 20, "I2S_DI", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 218);
    mraa_set_pininfo(b, 21, "S5_0", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 82);
    mraa_set_pininfo(b, 22, "PWM0", (mraa_pincapabilities_t){ 1, 0, 1, 0, 0, 0, 0, 0 },
                     248); // Assume BIOS configured for PWM
    mraa_set_pininfo(b, 23, "S5_1", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 83);
    mraa_set_pininfo(b, 24, "PWM1", (mraa_pincapabilities_t){ 1, 0, 1, 0, 0, 0, 0, 0 },
                     249); // Assume BIOS configured for PWM
    mraa_set_pininfo(b, 25, "S5_4", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 84);
    if (turbot) {
        mraa_set_pininfo(b, 26, "I2S_MCLK", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 253);
        mraa_set_pininfo(b, 27, "S5_22", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 104);
    } else {
        mraa_set_pininfo(b, 26, "IBL8254", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 208);
    }

    // Set number of i2c adaptors usable from userspace
    b->i2c_bus_count = 1;

    // Configure i2c adaptor #7 and make it the default
    int pin_index_sda, pin_index_scl;
    if (mraa_get_pin_index(b, "I2C_SDA", &pin_index_sda) == MRAA_SUCCESS &&
        mraa_get_pin_index(b, "I2C_SCL", &pin_index_scl) == MRAA_SUCCESS) {
        int bus = mraa_find_i2c_bus(I2CNAME, 0);
        if (bus == -1) {
            b->i2c_bus_count = 0;
        } else {
            b->def_i2c_bus = bus;
            b->i2c_bus[0].bus_id = b->def_i2c_bus;
            b->i2c_bus[0].sda = pin_index_sda;
            b->i2c_bus[0].scl = pin_index_scl;
        }
    }

    // Configure PWM
    b->pwm_default_period = 500;
    b->pwm_max_period = 1000000000;
    b->pwm_min_period = 1;

    b->spi_bus_count = 1;
    b->def_spi_bus = 0;
    b->spi_bus[0].bus_id = 0;
    b->spi_bus[0].slave_s = 0;
    b->spi_bus[0].cs = 5;
    b->spi_bus[0].mosi = 9;
    b->spi_bus[0].miso = 7;
    b->spi_bus[0].sclk = 11;

    b->uart_dev_count = 1;
    b->def_uart_dev = 0;
    b->uart_dev[0].rx = -1;
    b->uart_dev[0].tx = -1;
    b->uart_dev[0].device_path = "/dev/ttyS0";

    return b;
error:
    syslog(LOG_CRIT, "minnowmax: Platform failed to initialise");
    free(b);
    return NULL;
}
