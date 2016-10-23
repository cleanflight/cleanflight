/*
 * Author: Dan O'Donovan <dan@emutex.com>
 * Copyright (c) 2015 Emutex Ltd.
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
#include "x86/up.h"

#define PLATFORM_NAME "UP"
#define I2C_BUS_DEFAULT 1
#define MAX_LENGTH 8
#define I2CNAME "designware"

static mraa_result_t
set_pininfo(mraa_board_t* board, int mraa_index, char* name, mraa_pincapabilities_t caps, int sysfs_pin)
{
    if (mraa_index < board->phy_pin_count) {
        mraa_pininfo_t* pin_info = &board->pins[mraa_index];
        strncpy(pin_info->name, name, MAX_LENGTH);
        pin_info->capabilities = caps;
        if (caps.gpio) {
            pin_info->gpio.pinmap = sysfs_pin;
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

static mraa_result_t
get_pin_index(mraa_board_t* board, char* name, int* pin_index)
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
mraa_up_board()
{
    mraa_board_t* b = (mraa_board_t*) calloc(1, sizeof(mraa_board_t));

    struct utsname running_uname;
    int uname_major, uname_minor;

    if (b == NULL) {
        return NULL;
    }

    b->platform_name = PLATFORM_NAME;
    b->phy_pin_count = MRAA_UP_PINCOUNT;
    b->gpio_count = MRAA_UP_GPIOCOUNT;

    b->pins = (mraa_pininfo_t*) malloc(sizeof(mraa_pininfo_t) * MRAA_UP_PINCOUNT);
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

    set_pininfo(b, 0, "INVALID",   (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    set_pininfo(b, 1, "3.3v",      (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    set_pininfo(b, 2, "5v",        (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    set_pininfo(b, 3, "I2C1_SDA",  (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 }, 2);
    set_pininfo(b, 4, "5v",        (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    set_pininfo(b, 5, "I2C1_SCL",  (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 }, 3);
    set_pininfo(b, 6, "GND",       (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    set_pininfo(b, 7, "GPIO4",     (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 4);
    set_pininfo(b, 8, "UART1_TX",  (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 }, 14);
    set_pininfo(b, 9, "GND",       (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    set_pininfo(b, 10, "UART1_RX", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 }, 15);
    set_pininfo(b, 11, "GPIO17",   (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 17);
    set_pininfo(b, 12, "I2S_CLK",  (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 18);
    set_pininfo(b, 13, "UART2_RX", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 1 }, 27);
    set_pininfo(b, 14, "GND",      (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    set_pininfo(b, 15, "GPIO22",   (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 }, 22);
    set_pininfo(b, 16, "GPIO23",   (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 23);
    set_pininfo(b, 17, "3.3v",     (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    set_pininfo(b, 18, "GPIO24",   (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 24);
    set_pininfo(b, 19, "SPI_MOSI", (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 }, 10);
    set_pininfo(b, 20, "GND",      (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    set_pininfo(b, 21, "SPI_MISO", (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 }, 9);
    set_pininfo(b, 22, "UART2_TX", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 }, 25);
    set_pininfo(b, 23, "SPI_CLK",  (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 }, 11);
    set_pininfo(b, 24, "SPI_CS0",  (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 }, 8);
    set_pininfo(b, 25, "GND",      (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    set_pininfo(b, 26, "SPI_CS1",  (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 }, 7);
    set_pininfo(b, 27, "ID_SD",    (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 }, 0);
    set_pininfo(b, 28, "ID_SC",    (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 }, 1);
    set_pininfo(b, 29, "GPIO5",    (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 5);
    set_pininfo(b, 30, "GND",      (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    set_pininfo(b, 31, "GPIO6",    (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 6);
    set_pininfo(b, 32, "PWM0",     (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 }, 12);
    set_pininfo(b, 33, "PWM1",     (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 }, 13);
    set_pininfo(b, 34, "GND",      (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    set_pininfo(b, 35, "I2S_FRM",  (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 19);
    set_pininfo(b, 36, "GPIO16",   (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 16);
    set_pininfo(b, 37, "GPIO26",   (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 26);
    set_pininfo(b, 38, "I2S_DIN",  (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 20);
    set_pininfo(b, 39, "GND",      (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 }, -1);
    set_pininfo(b, 40, "I2S_DOUT", (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 }, 21);

    // Set number of i2c adaptors usable from userspace
    b->i2c_bus_count = 2;

    // Configure i2c adaptor #0 (default)
    // (For consistency with Raspberry Pi 2, use I2C1 as our primary I2C bus)
    b->i2c_bus[0].bus_id = 1;
    get_pin_index(b, "I2C1_SDA", (int*) &(b->i2c_bus[0].sda));
    get_pin_index(b, "I2C1_SCL", (int*) &(b->i2c_bus[0].scl));

    // Configure i2c adaptor #1
    // (normally reserved for accessing HAT EEPROM)
    b->i2c_bus[1].bus_id = 0;
    get_pin_index(b, "I2C0_SDA", (int*) &(b->i2c_bus[1].sda));
    get_pin_index(b, "I2C0_SCL", (int*) &(b->i2c_bus[1].scl));
    b->def_i2c_bus = 0;

    // Configure PWM
    b->pwm_default_period = 500;
    b->pwm_max_period = 3413;
    b->pwm_min_period = 1;

    // Configure SPI #0 CS0 (default)
    b->spi_bus_count = 2;
    b->spi_bus[0].bus_id = 2;
    b->spi_bus[0].slave_s = 0;
    get_pin_index(b, "SPI_CS0", (int*) &(b->spi_bus[0].cs));
    get_pin_index(b, "SPI_MOSI", (int*) &(b->spi_bus[0].mosi));
    get_pin_index(b, "SPI_MISO", (int*) &(b->spi_bus[0].miso));
    get_pin_index(b, "SPI_CLK", (int*) &(b->spi_bus[0].sclk));
    b->def_spi_bus = 0;
    // Configure SPI #0 CS1
    b->spi_bus[1].bus_id = 2;
    b->spi_bus[1].slave_s = 1;
    get_pin_index(b, "SPI_CS1", (int*) &(b->spi_bus[1].cs));
    get_pin_index(b, "SPI_MOSI", (int*) &(b->spi_bus[1].mosi));
    get_pin_index(b, "SPI_MISO", (int*) &(b->spi_bus[1].miso));
    get_pin_index(b, "SPI_CLK", (int*) &(b->spi_bus[1].sclk));

    // Configure UART #1 (default)
    b->uart_dev_count = 2;
    get_pin_index(b, "UART1_RX", &(b->uart_dev[0].rx));
    get_pin_index(b, "UART1_TX", &(b->uart_dev[0].tx));
    b->uart_dev[0].device_path = "/dev/ttyS1";
    b->def_uart_dev = 0;
    // Configure UART #2
    get_pin_index(b, "UART2_RX", &(b->uart_dev[1].rx));
    get_pin_index(b, "UART2_TX", &(b->uart_dev[1].tx));
    b->uart_dev[1].device_path = "/dev/ttyS2";

    return b;
error:
    syslog(LOG_CRIT, "up: Platform failed to initialise");
    free(b);
    return NULL;
}
