/*
 * Author: Brendan Le Foll <brendan.le.foll@intel.com>
 * Copyright (c) 2016 Intel Corporation.
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
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include "common.h"
#include "x86/intel_gt_tuchuck.h"

#define PLATFORM_NAME "Intel GT Tuchuck"

mraa_board_t*
mraa_gt_tuchuck_board()
{
    mraa_board_t* b = (mraa_board_t*) calloc(1, sizeof(mraa_board_t));
    if (b == NULL) {
        return NULL;
    }

    b->platform_name = PLATFORM_NAME;
    b->phy_pin_count = MRAA_INTEL_GT_TUCHUCK_PINCOUNT;
    b->aio_count = 0;
    b->adc_raw = 0;
    b->adc_supported = 0;

    b->pins = (mraa_pininfo_t*) calloc(MRAA_INTEL_GT_TUCHUCK_PINCOUNT, sizeof(mraa_pininfo_t));
    if (b->pins == NULL) {
        goto error;
    }

    b->adv_func = (mraa_adv_func_t*) calloc(1, sizeof(mraa_adv_func_t));
    if (b->adv_func == NULL) {
        free(b->pins);
        goto error;
    }

    b->pwm_default_period = 5000;
    b->pwm_max_period = 218453;
    b->pwm_min_period = 1;

    b->i2c_bus_count = 3;
    b->i2c_bus[0].bus_id = 0;
    b->i2c_bus[0].sda = 11;
    b->i2c_bus[0].scl = 13;

    if (mraa_find_i2c_bus("designware", 5) != 5) {
        b->i2c_bus[1].bus_id = 9;
        b->i2c_bus[2].bus_id = 10;
    } else {
        b->i2c_bus[1].bus_id = 5;
        b->i2c_bus[2].bus_id = 6;
    }
    b->i2c_bus[1].sda = 15;
    b->i2c_bus[1].scl = 17;
    b->i2c_bus[2].sda = 19;
    b->i2c_bus[2].scl = 21;

    b->def_i2c_bus = b->i2c_bus[0].bus_id;

    b->spi_bus_count = 3;
    b->def_spi_bus = 0;
    b->spi_bus[0].bus_id = 32765;
    b->spi_bus[0].slave_s = 0;
    b->spi_bus[1].bus_id = 32766;
    b->spi_bus[1].slave_s = 0;
    b->spi_bus[2].bus_id = 32766;
    b->spi_bus[2].slave_s = 1;

    int pos = 0;

    strncpy(b->pins[pos].name, "INVALID", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "GPIO", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 446;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "SPP1RX", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 421;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "PMICRST", 8);
    // disabled as this pin causes a reset
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 366;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "SPP1TX", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 422;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "19.2mhz", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 356;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "SPP1FS0", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 417;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "UART0TX", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 1 };
    // not configured as GPIO
    //b->pins[pos].gpio.pinmap = 462;
    //b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].uart.pinmap = 0;
    b->pins[pos].uart.parent_id = 0;
    b->pins[pos].uart.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "SPP1FS2", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 419;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "PWRGD", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    // not configured as GPI0 - does read work?
    //b->pins[pos].gpio.pinmap = 365;
    //b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "SPP1CLK", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 416;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    // pin 11
    strncpy(b->pins[pos].name, "I2C0SDA", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 1, 0, 0 };
    b->pins[pos].gpio.pinmap = 315;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].i2c.mux_total = 0;
    b->pins[pos].i2c.pinmap = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2S1SDI", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 381;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2C0SCL", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 1, 0, 0 };
    b->pins[pos].gpio.pinmap = 316;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].i2c.mux_total = 0;
    b->pins[pos].i2c.pinmap = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2S1SDO", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 382;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2C1SDA", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 1, 0, 0 };
    b->pins[pos].gpio.pinmap = 331;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].i2c.mux_total = 0;
    b->pins[pos].i2c.pinmap = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2S1WS", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 380;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2C1SCL", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 1, 0, 0 };
    b->pins[pos].gpio.pinmap = 332;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].i2c.pinmap = 0;
    b->pins[pos].i2c.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2S1CLK", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 379;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2C2SDA", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 1, 0, 0 };
    b->pins[pos].gpio.pinmap = 333;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].i2c.pinmap = 0;
    b->pins[pos].i2c.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2S1MCL", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 378;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2C2SCL", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 1, 0, 0 };
    b->pins[pos].gpio.pinmap = 334;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].i2c.mux_total = 0;
    b->pins[pos].i2c.pinmap = 0;
    pos++;

    strncpy(b->pins[pos].name, "UART1TX", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 1 };
    //b->pins[pos].gpio.pinmap = 472;
    //b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].uart.pinmap = 0;
    b->pins[pos].uart.parent_id = 0;
    b->pins[pos].uart.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2S4SDO", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    // doesn't work so disable
    //b->pins[pos].gpio.pinmap = 396;
    //b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "UART1RX", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 1 };
    //b->pins[pos].gpio.pinmap = 471;
    //b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].uart.pinmap = 0;
    b->pins[pos].uart.parent_id = 0;
    b->pins[pos].uart.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2S4SDI", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    // doesnt work
    //b->pins[pos].gpio.pinmap = 395;
    //b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "PWM0", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 463;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].pwm.pinmap = 0;
    b->pins[pos].pwm.parent_id = 0;
    b->pins[pos].pwm.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2S4BLK", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    // this pin has a voltage of 0.34V in 'low' mode - beware!
    b->pins[pos].gpio.pinmap = 397;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "PWM1", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 464;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].pwm.pinmap = 1;
    b->pins[pos].pwm.parent_id = 0;
    b->pins[pos].pwm.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2S4WS", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    // not working
    //b->pins[pos].gpio.pinmap = 398;
    //b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "PWM2", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 465;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].pwm.pinmap = 2;
    b->pins[pos].pwm.parent_id = 0;
    b->pins[pos].pwm.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2S3SDO", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    //b->pins[pos].gpio.pinmap = 400;
    //b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "PWM3", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 466;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].pwm.pinmap = 3;
    b->pins[pos].pwm.parent_id = 0;
    b->pins[pos].pwm.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2S3SDI", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    //b->pins[pos].gpio.pinmap = 399;
    //b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "1.8V", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "I2S4BLK", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 393;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "GND", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "GND", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "GND", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "GND", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "3.3V", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    // second header
    strncpy(b->pins[pos].name, "GND", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "5V", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "GND", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "5V", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "GND", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "3.3V", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "GND", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "3.3V", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "GND", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "1.8V", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "GPIO", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 456;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "1.8V", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "PANEL", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 270;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "GND", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "PANEL", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 271;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "CAMERA", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "PANEL", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 272;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "CAMERA", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "SPP0FS0", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 411;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "CAMERA", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    pos++;

    strncpy(b->pins[pos].name, "SPP0FS1", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 412;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "SPI_DAT", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 385;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "SPP0FS2", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 411;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "SPICLKB", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 384;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "SPP0FS3", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 410;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "SPICLKA", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 383;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "SPP0TX", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 414;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "UART0RX", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[pos].gpio.pinmap = 467;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].uart.pinmap = 0;
    b->pins[pos].uart.parent_id = 0;
    b->pins[pos].uart.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "SPP0RX", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 415;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "UART0RT", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[pos].gpio.pinmap = 469;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].uart.pinmap = 0;
    b->pins[pos].uart.parent_id = 0;
    b->pins[pos].uart.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2C1SDA", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 };
    b->pins[pos].gpio.pinmap = 317;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].i2c.pinmap = 0;
    b->pins[pos].i2c.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "UART0CT", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[pos].gpio.pinmap = 412;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].uart.pinmap = 0;
    b->pins[pos].uart.parent_id = 0;
    b->pins[pos].uart.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2C1SCL", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 };
    b->pins[pos].gpio.pinmap = 318;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].i2c.pinmap = 0;
    b->pins[pos].i2c.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "UART1TX", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[pos].gpio.pinmap = 484;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].uart.pinmap = 0;
    b->pins[pos].uart.parent_id = 0;
    b->pins[pos].uart.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2C2SDA", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 };
    b->pins[pos].gpio.pinmap = 319;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].i2c.pinmap = 0;
    b->pins[pos].i2c.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "UART1RX", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[pos].gpio.pinmap = 483;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].uart.pinmap = 0;
    b->pins[pos].uart.parent_id = 0;
    b->pins[pos].uart.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "I2C1SCL", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 };
    b->pins[pos].gpio.pinmap = 320;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].i2c.pinmap = 0;
    b->pins[pos].i2c.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "UART1RT", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[pos].gpio.pinmap = 485;
    b->pins[pos].gpio.mux_total = 0;
    b->pins[pos].uart.pinmap = 0;
    b->pins[pos].uart.parent_id = 0;
    b->pins[pos].uart.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "RTC_CLK", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 367;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "UART1CT", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[pos].gpio.pinmap = 486;
    b->pins[pos].uart.pinmap = 0;
    b->pins[pos].uart.parent_id = 0;
    b->pins[pos].uart.mux_total = 0;
    pos++;

    while (pos != 100) {
        b->pins[pos].capabilities = (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 };
        pos++;
    }

    strncpy(b->pins[pos].name, "LED100", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 337;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "LED101", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 338;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "LED102", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 339;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "LED103", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 340;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "LEDWIFI", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 438;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    strncpy(b->pins[pos].name, "LEDBT", 8);
    b->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[pos].gpio.pinmap = 439;
    b->pins[pos].gpio.mux_total = 0;
    pos++;

    return b;

error:
    syslog(LOG_CRIT, "GT Tuchuck: Platform failed to initialise");
    free(b);
    return NULL;
}
