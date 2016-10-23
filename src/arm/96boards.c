/*
 * Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 * Copyright (c) 2014 Intel Corporation.
 * Copyright (c) 2015 Linaro Limited.
 *
 * Copied from src/arm/banana.c
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
#include <stdarg.h>
#include <string.h>
#include <sys/mman.h>
#include <mraa/common.h>

#include "common.h"
#include "arm/96boards.h"

#define DT_BASE "/sys/firmware/devicetree/base"

#define PLATFORM_NAME_DB410C "DB410C"
#define PLATFORM_NAME_HIKEY "HIKEY"

int db410c_ls_gpio_pins[MRAA_96BOARDS_LS_GPIO_COUNT] = {
  36, 12, 13, 69, 115, 4, 24, 25, 35, 34, 28, 33,
};

const char* db410c_serialdev[MRAA_96BOARDS_LS_UART_COUNT] = { "/dev/ttyMSM0", "/dev/ttyMSM1"};

int hikey_ls_gpio_pins[MRAA_96BOARDS_LS_GPIO_COUNT] = {
 488, 489, 490, 491, 492, 415, 463, 495, 426, 433, 427, 434,
};

const char* hikey_serialdev[MRAA_96BOARDS_LS_UART_COUNT] = { "/dev/ttyAMA2", "/dev/ttyAMA3"};

void mraa_96boards_pininfo(mraa_board_t* board, int index, int sysfs_pin,
                           char *fmt, ...)
{
   va_list arg_ptr;
   if (index > board->phy_pin_count)
      return;

   mraa_pininfo_t* pininfo = &board->pins[index];
   va_start(arg_ptr, fmt);
   vsnprintf(pininfo->name, MRAA_PIN_NAME_SIZE, fmt, arg_ptr);
   va_end(arg_ptr);
   if (sysfs_pin >= 0)
      pininfo->capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
   else
      pininfo->capabilities = (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 };
   pininfo->gpio.pinmap = sysfs_pin;
   pininfo->gpio.mux_total = 0;
}

mraa_board_t* mraa_96boards()
{
   int i, pin;
   int *ls_gpio_pins = NULL;
   char ch;

   mraa_board_t* b = (mraa_board_t*) calloc(1, sizeof(mraa_board_t));
   if (b == NULL) {
      return NULL;
   }

   // pin mux for buses are setup by default by kernel so tell mraa to ignore them
   b->no_bus_mux = 1;
   b->phy_pin_count = MRAA_96BOARDS_LS_PIN_COUNT + 1;

   if (mraa_file_exist(DT_BASE "/model")) {
        // We are on a modern kernel, great!!!!
        if (mraa_file_contains(DT_BASE "/model", "Qualcomm Technologies, Inc. APQ 8016 SBC")) {
            b->platform_name = PLATFORM_NAME_DB410C;
            ls_gpio_pins = db410c_ls_gpio_pins;
            b->uart_dev[0].device_path = db410c_serialdev[0];
            b->uart_dev[1].device_path = db410c_serialdev[1];
        } else if (mraa_file_contains(DT_BASE "/model", "HiKey Development Board")) {
            b->platform_name = PLATFORM_NAME_HIKEY;
            ls_gpio_pins = hikey_ls_gpio_pins;
            b->uart_dev[0].device_path = hikey_serialdev[0];
            b->uart_dev[1].device_path = hikey_serialdev[1];
	}
   }

   //UART
   b->uart_dev_count = MRAA_96BOARDS_LS_UART_COUNT;
   b->def_uart_dev = 0;

   //I2C
   b->i2c_bus_count = MRAA_96BOARDS_LS_I2C_COUNT;
   b->def_i2c_bus = 0;
   b->i2c_bus[0].bus_id = 0;
   b->i2c_bus[1].bus_id= 1;

   //SPI
   b->spi_bus_count = MRAA_96BOARDS_LS_SPI_COUNT;
   b->spi_bus[0].bus_id = 0;
   b->def_spi_bus = 0;

   b->adv_func = (mraa_adv_func_t*) calloc(1, sizeof(mraa_adv_func_t));
   if (b->adv_func == NULL) {
      free(b);
      return NULL;
   }

   b->pins = (mraa_pininfo_t*) malloc(sizeof(mraa_pininfo_t) * b->phy_pin_count);
   if (b->pins == NULL) {
      free(b->adv_func);
      free(b);
      return NULL;
   }

   mraa_96boards_pininfo(b,  0, -1, "INVALID");
   mraa_96boards_pininfo(b,  1, -1, "GND");
   mraa_96boards_pininfo(b,  2, -1, "GND");
   mraa_96boards_pininfo(b,  3, -1, "UART0_CTS");
   mraa_96boards_pininfo(b,  4, -1, "PWR_BTN_N");
   mraa_96boards_pininfo(b,  5, -1, "UART0_TXD");
   mraa_96boards_pininfo(b,  6, -1, "RST_BTN_N");
   mraa_96boards_pininfo(b,  7, -1, "UART0_RXD");
   mraa_96boards_pininfo(b,  8, -1, "SPI0_SCLK");
   mraa_96boards_pininfo(b,  9, -1, "UART0_RTS");
   mraa_96boards_pininfo(b, 10, -1, "SPI0_DIN");
   mraa_96boards_pininfo(b, 11, -1, "UART1_TXD");
   mraa_96boards_pininfo(b, 12, -1, "SPI0_CS");
   mraa_96boards_pininfo(b, 13, -1, "UART1_RXD");
   mraa_96boards_pininfo(b, 14, -1, "SPI0_DOUT");
   mraa_96boards_pininfo(b, 15, -1, "I2C0_SCL");
   mraa_96boards_pininfo(b, 16, -1, "PCM_FS");
   mraa_96boards_pininfo(b, 17, -1, "I2C0_SDA");
   mraa_96boards_pininfo(b, 18, -1, "PCM_CLK");
   mraa_96boards_pininfo(b, 19, -1, "I2C1_SCL");
   mraa_96boards_pininfo(b, 20, -1, "PCM_DO");
   mraa_96boards_pininfo(b, 21, -1, "I2C1_SDA");
   mraa_96boards_pininfo(b, 22, -1, "PCM_DI");
   // GPIOs are labelled "GPIO-A" through "GPIO-L"
   for (i = 0; i < MRAA_96BOARDS_LS_GPIO_COUNT; i++)
   {
      mraa_96boards_pininfo(b, 23 + i, ls_gpio_pins ? ls_gpio_pins[i] : -1,
                            "GPIO-%c", 'A'+i);
   }
   mraa_96boards_pininfo(b, 35, -1, "1.8v");
   mraa_96boards_pininfo(b, 36, -1, "SYS_DCIN");
   mraa_96boards_pininfo(b, 37, -1, "5v");
   mraa_96boards_pininfo(b, 38, -1, "SYS_DCIN");
   mraa_96boards_pininfo(b, 39, -1, "GND");
   mraa_96boards_pininfo(b, 40, -1, "GND");

   b->gpio_count = MRAA_96BOARDS_LS_GPIO_COUNT;

   b->aio_count = 0;
   b->adc_raw = 0;
   b->adc_supported = 0;

   return b;
}
