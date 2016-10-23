/*
 * Author: Thomas Ingleby <thomas.c.ingleby@intel.com>
 * Author: Michael Ring <mail@michael-ring.org>
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
#include <mraa/common.h>
#include <mraa_internal_types.h>

#include "common.h"
#include "arm/banana.h"

#define PLATFORM_NAME_BANANA_PI "Banana Pi"
#define PLATFORM_BANANA_PI 1
#define PLATFORM_NAME_BANANA_PRO "Banana Pro"
#define PLATFORM_BANANA_PRO 2
#define MMAP_PATH "/dev/mem"
#define DT_BASE "/sys/firmware/devicetree/base"

#define SUNXI_BASE (0x01C20000)
#define SUNXI_BLOCK_SIZE (4 * 1024)
#define SUNXI_GPIO_DAT 0x0810
#define SUNXI_GPIO_PORT_OFFSET 0x0024
#define MAX_SIZE 64

// MMAP
static uint8_t* mmap_reg = NULL;
static int mmap_fd = 0;
static int mmap_size;
static unsigned int mmap_count = 0;
static int platform_detected = 0;

const char* serialdev[] = { "/dev/ttyS0", "/dev/ttyS1", "/dev/ttyS2", "/dev/ttyS3",
                            "/dev/ttyS4", "/dev/ttyS5", "/dev/ttyS6", "/dev/ttyS7" };
const char* seriallink[] = { "/sys/class/tty/ttyS0", "/sys/class/tty/ttyS1", "/sys/class/tty/ttyS2",
                             "/sys/class/tty/ttyS3", "/sys/class/tty/ttyS4", "/sys/class/tty/ttyS5",
                             "/sys/class/tty/ttyS6", "/sys/class/tty/ttyS7" };
const char* i2clink[] = {
    "/sys/class/i2c-dev/i2c-0", "/sys/class/i2c-dev/i2c-1", "/sys/class/i2c-dev/i2c-2",
    "/sys/class/i2c-dev/i2c-3", "/sys/class/i2c-dev/i2c-4",
};
const char* spilink[] = { "/sys/class/spidev/spidev0.0",
                          "/sys/class/spidev/spidev1.0",
                          "/sys/class/spidev/spidev2.0",
                          "/sys/class/spidev/spidev3.0" };

mraa_result_t
mraa_banana_spi_init_pre(int index)
{
    char devpath[MAX_SIZE];
    sprintf(devpath, "/dev/spidev%u.0", plat->spi_bus[index].bus_id);
    if (!mraa_file_exist(devpath)) {
        syslog(LOG_INFO, "spi: trying modprobe for spi-sun4i");
        system("modprobe spi-sun4i >/dev/null 2>&1");
        syslog(LOG_INFO, "spi: trying modprobe for spidev");
        system("modprobe spidev >/dev/null 2>&1");
    }
    if (!mraa_file_exist(devpath)) {
        syslog(LOG_ERR, "spi: Device not initialized");
        syslog(LOG_ERR, "spi: If you run a kernel >=3.18 then most likely spi support does not yet "
                        "fully work.");
        return MRAA_ERROR_NO_RESOURCES;
    }
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_banana_i2c_init_pre(unsigned int bus)
{
    char devpath[MAX_SIZE];
    sprintf(devpath, "/dev/i2c-%u", bus);
    if (!mraa_file_exist(devpath)) {
        syslog(LOG_INFO, "i2c: trying modprobe for i2c-dev");
        system("modprobe i2c-dev >/dev/null 2>&1");
    }
    if (!mraa_file_exist(devpath)) {
        syslog(LOG_ERR, "i2c: Device not initialized");
        return MRAA_ERROR_NO_RESOURCES;
    }
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_banana_mmap_write(mraa_gpio_context dev, int value)
{
    uint32_t readvalue =
    *(volatile uint32_t*) (mmap_reg + SUNXI_GPIO_DAT + (dev->pin / 32) * SUNXI_GPIO_PORT_OFFSET);
    volatile uint32_t* addr;
    if (value) {
        *(volatile uint32_t*) (mmap_reg + SUNXI_GPIO_DAT + (dev->pin / 32) * SUNXI_GPIO_PORT_OFFSET) =
        (uint32_t)((1 << (dev->pin % 32)) | readvalue);
    } else {
        *(volatile uint32_t*) (mmap_reg + SUNXI_GPIO_DAT + (dev->pin / 32) * SUNXI_GPIO_PORT_OFFSET) =
        (uint32_t)(~(1 << (dev->pin % 32)) & readvalue);
    }
    return MRAA_SUCCESS;
}

int
mraa_banana_mmap_read(mraa_gpio_context dev)
{
    uint32_t value =
    *(volatile uint32_t*) (mmap_reg + SUNXI_GPIO_DAT + (dev->pin / 32) * SUNXI_GPIO_PORT_OFFSET);
    if (value & (uint32_t)(1 << (dev->pin % 32))) {
        return 1;
    }
    return 0;
}

static mraa_result_t
mraa_banana_mmap_unsetup()
{
    if (mmap_reg == NULL) {
        syslog(LOG_ERR, "banana mmap: cannot unsetup NULLed mmap");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    munmap(mmap_reg, mmap_size);
    mmap_reg = NULL;
    if (close(mmap_fd) != 0) {
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_banana_mmap_setup(mraa_gpio_context dev, mraa_boolean_t en)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "Banana mmap: context not valid");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (en == 0) {
        if (dev->mmap_write == NULL && dev->mmap_read == NULL) {
            syslog(LOG_ERR, "Banana mmap: can't disable disabled mmap gpio");
            return MRAA_ERROR_INVALID_PARAMETER;
        }
        dev->mmap_write = NULL;
        dev->mmap_read = NULL;
        mmap_count--;
        if (mmap_count == 0) {
            return mraa_banana_mmap_unsetup();
        }
        return MRAA_SUCCESS;
    }

    if (dev->mmap_write != NULL && dev->mmap_read != NULL) {
        syslog(LOG_ERR, "Banana mmap: can't enable enabled mmap gpio");
        return MRAA_ERROR_INVALID_PARAMETER;
    }

    // Might need to make some elements of this thread safe.
    // For example only allow one thread to enter the following block
    // to prevent mmap'ing twice.
    if (mmap_reg == NULL) {
        if ((mmap_fd = open(MMAP_PATH, O_RDWR)) < 0) {
            syslog(LOG_ERR, "Banana mmap: unable to open /dev/mem file");
            return MRAA_ERROR_INVALID_HANDLE;
        }

        mmap_reg = (uint8_t*) mmap(NULL, SUNXI_BLOCK_SIZE, PROT_READ | PROT_WRITE,
                                   MAP_FILE | MAP_SHARED, mmap_fd, SUNXI_BASE);
        if (mmap_reg == MAP_FAILED) {
            syslog(LOG_ERR, "Banana mmap: failed to mmap");
            mmap_reg = NULL;
            close(mmap_fd);
            return MRAA_ERROR_NO_RESOURCES;
        }
    }
    dev->mmap_write = &mraa_banana_mmap_write;
    dev->mmap_read = &mraa_banana_mmap_read;
    mmap_count++;

    return MRAA_SUCCESS;
}

mraa_board_t*
mraa_banana()
{
    mraa_board_t* b = (mraa_board_t*) calloc(1, sizeof(mraa_board_t));
    if (b == NULL) {
        return NULL;
    }

    platform_detected = 0;
    int i2c2 = -1;
    int spi0 = -1;
    int uart2 = -1;
    int uart3 = -1;
    int uart4 = -1;
    int uart7 = -1;

    if (mraa_file_exist(DT_BASE "/model")) {
        // We are on a modern kernel, great!!!!
        if (mraa_file_contains(DT_BASE "/model", "Banana Pro")) {
            b->platform_name = PLATFORM_NAME_BANANA_PRO;
            platform_detected = PLATFORM_BANANA_PRO;
            b->phy_pin_count = MRAA_BANANA_PRO_PINCOUNT;
        }

        if (mraa_file_contains(DT_BASE "/model", "Banana Pi")) {
            b->platform_name = PLATFORM_NAME_BANANA_PI;
            platform_detected = PLATFORM_BANANA_PI;
            b->phy_pin_count = MRAA_BANANA_PI_PINCOUNT;
        }
        if (mraa_file_contains(DT_BASE "/soc@01c00000/i2c@01c2b400/status", "okay")) {
            i2c2 = 1;
        }
        if (mraa_file_contains(DT_BASE "/soc@01c00000/spi@01c05000/status", "okay")) {
            spi0 = 1;
        }
    } else {
        if (mraa_file_exist("/sys/class/leds/green:ph24:led1")) {
            if (mraa_file_exist("/sys/class/leds/blue:pg02:led2")) {
                b->platform_name = PLATFORM_NAME_BANANA_PRO;
                platform_detected = PLATFORM_BANANA_PRO;
                b->phy_pin_count = MRAA_BANANA_PRO_PINCOUNT;
            } else {
                b->platform_name = PLATFORM_NAME_BANANA_PI;
                platform_detected = PLATFORM_BANANA_PI;
                b->phy_pin_count = MRAA_BANANA_PI_PINCOUNT;
            }
            if (mraa_file_exist("/sys/class/i2c-dev/i2c-2")) {
                i2c2 = 1;
            }


            if (mraa_file_exist("/sys/class/spi_master/spi0")) {
                spi0 = 1;
            }
        }
    }

    if (platform_detected == 0) {
        free(b);
        syslog(LOG_ERR, "mraa: Could not detect Banana Pi or Banana Pro");
        return NULL;
    }

    int devnum;
    for (devnum = 0; devnum < 8; devnum++) {
        if (mraa_link_targets(seriallink[devnum], "1c28800")) {
            uart2 = devnum;
        }
        if (mraa_link_targets(seriallink[devnum], "1c28c00")) {
            uart3 = devnum;
        }
        if (mraa_link_targets(seriallink[devnum], "1c29000")) {
            uart4 = devnum;
        }
        if (mraa_link_targets(seriallink[devnum], "1c29c00")) {
            uart7 = devnum;
        }
    }

    for (devnum = 0; devnum < 5; devnum++) {
        if (mraa_link_targets(i2clink[devnum], "1c2b400")) {
            i2c2 = devnum;
        }
    }

    for (devnum = 0; devnum < 4; devnum++) {
        if (mraa_link_targets(spilink[devnum], "1c05000")) {
            spi0 = devnum;
        }
    }

    b->adv_func = (mraa_adv_func_t*) calloc(1, sizeof(mraa_adv_func_t));
    if (b->adv_func == NULL) {
        free(b);
        return NULL;
    }

    b->pins = (mraa_pininfo_t*) calloc(b->phy_pin_count, sizeof(mraa_pininfo_t));
    if (b->pins == NULL) {
        free(b->adv_func);
        free(b);
        return NULL;
    }

    b->adv_func->spi_init_pre = &mraa_banana_spi_init_pre;
    b->adv_func->i2c_init_pre = &mraa_banana_i2c_init_pre;
    b->adv_func->gpio_mmap_setup = &mraa_banana_mmap_setup;

    strncpy(b->pins[0].name, "INVALID", MRAA_PIN_NAME_SIZE);
    b->pins[0].capabilities = (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[1].name, "3V3", MRAA_PIN_NAME_SIZE);
    b->pins[1].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[2].name, "5V", MRAA_PIN_NAME_SIZE);
    b->pins[2].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    if (i2c2 == 1) {
        strncpy(b->pins[3].name, "TWI2-SDA", MRAA_PIN_NAME_SIZE); // PB21 Pin53 TWI2-SDA
        b->pins[3].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 };
    } else {
        strncpy(b->pins[3].name, "PB21", MRAA_PIN_NAME_SIZE); // PB21 Pin53 TWI2-SDA
        b->pins[3].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[3].gpio.pinmap = 53;

    strncpy(b->pins[4].name, "5V", MRAA_PIN_NAME_SIZE);
    b->pins[4].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    if (i2c2 == 1) {
        strncpy(b->pins[5].name, "TWI2-SCK", MRAA_PIN_NAME_SIZE); // PB20 Pin52 TWI2-SCK
        b->pins[5].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 };
    } else {
        strncpy(b->pins[5].name, "PB20", MRAA_PIN_NAME_SIZE); // PB20 Pin52 TWI2-SCK
        b->pins[5].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[5].gpio.pinmap = 52;

    strncpy(b->pins[6].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[6].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    if (platform_detected == PLATFORM_BANANA_PRO) {
        strncpy(b->pins[7].name, "PH02", MRAA_PIN_NAME_SIZE); // PH2 Pin226
        b->pins[7].gpio.pinmap = 226;
    } else {
        strncpy(b->pins[7].name, "PI03", MRAA_PIN_NAME_SIZE); // PI3 Pin259 PWM
        b->pins[7].gpio.pinmap = 259;
    }
    b->pins[7].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };

    if (platform_detected == PLATFORM_BANANA_PRO) {
        strncpy(b->pins[8].name, "UART4_TX", MRAA_PIN_NAME_SIZE); // PH4 Pin228 UART4_TX
        b->pins[8].gpio.pinmap = 228;
    } else {
        strncpy(b->pins[8].name, "UART3_TX", MRAA_PIN_NAME_SIZE); // PH0 Pin224 UART3_TX
        b->pins[8].gpio.pinmap = 224;
    }
    b->pins[8].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };

    strncpy(b->pins[9].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[9].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    if (platform_detected == PLATFORM_BANANA_PRO) {
        strncpy(b->pins[10].name, "UART4_RX", MRAA_PIN_NAME_SIZE); // PH5 Pin229 UART4_RX
        b->pins[10].gpio.pinmap = 229;
    } else {
        strncpy(b->pins[10].name, "UART3_RX", MRAA_PIN_NAME_SIZE); // PH1 Pin225 UART3_RX
        b->pins[10].gpio.pinmap = 225;
    }
    b->pins[10].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };

    strncpy(b->pins[11].name, "PI19", MRAA_PIN_NAME_SIZE); // PI19 Pin275 IO+UART2_RX
    b->pins[11].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[11].gpio.pinmap = 275;

    if (platform_detected == PLATFORM_BANANA_PRO) {
        strncpy(b->pins[12].name, "PI03", MRAA_PIN_NAME_SIZE); // PI3 Pin259 PWM
        b->pins[12].gpio.pinmap = 259;
    } else {
        strncpy(b->pins[12].name, "PH02", MRAA_PIN_NAME_SIZE); // PH2 Pin226
        b->pins[12].gpio.pinmap = 226;
    }
    b->pins[12].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };

    strncpy(b->pins[13].name, "PI18", MRAA_PIN_NAME_SIZE); // PI18 Pin274 UART2_TX
    b->pins[13].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[13].gpio.pinmap = 274;

    strncpy(b->pins[14].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[14].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[15].name, "PI17", MRAA_PIN_NAME_SIZE); // PI17 Pin273 UART2_CTS
    b->pins[15].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[15].gpio.pinmap = 273;

    strncpy(b->pins[16].name, "PH20", MRAA_PIN_NAME_SIZE); // PH20 Pin 244 CAN_TX
    b->pins[16].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[16].gpio.pinmap = 244;

    strncpy(b->pins[17].name, "3V3", MRAA_PIN_NAME_SIZE);
    b->pins[17].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[18].name, "PH21", MRAA_PIN_NAME_SIZE); // PH21 Pin245 CAN_RX
    b->pins[18].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[18].gpio.pinmap = 245;

    strncpy(b->pins[19].name, "SPI0MOSI", MRAA_PIN_NAME_SIZE); // PI12 SPI0
    b->pins[19].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[19].gpio.pinmap = 268;

    strncpy(b->pins[20].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[20].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[21].name, "SPI0MISO", MRAA_PIN_NAME_SIZE); // PI13 SPI0
    b->pins[21].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[21].gpio.pinmap = 269;

    strncpy(b->pins[22].name, "PI16", MRAA_PIN_NAME_SIZE); // PI16 UART2_RTS
    b->pins[22].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[22].gpio.pinmap = 272;

    strncpy(b->pins[23].name, "SPI0CLK", MRAA_PIN_NAME_SIZE); // PI11 SPI0
    b->pins[23].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[23].gpio.pinmap = 267;

    strncpy(b->pins[24].name, "SPI0CS0", MRAA_PIN_NAME_SIZE); // PI10 SPI0
    b->pins[24].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[24].gpio.pinmap = 266;

    strncpy(b->pins[25].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[25].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[26].name, "SPI0CS1", MRAA_PIN_NAME_SIZE); // PI14 SPI0
    b->pins[26].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[26].gpio.pinmap = 270;

    if (platform_detected == PLATFORM_BANANA_PI) {
        strncpy(b->pins[27].name, "5V", MRAA_PIN_NAME_SIZE);
        b->pins[27].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

        strncpy(b->pins[28].name, "3V3", MRAA_PIN_NAME_SIZE);
        b->pins[28].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

        strncpy(b->pins[29].name, "PH05", MRAA_PIN_NAME_SIZE); // PH5
        b->pins[29].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[29].gpio.pinmap = 229;

        strncpy(b->pins[30].name, "PI21", MRAA_PIN_NAME_SIZE); // PI21 UART7_RX
        b->pins[30].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
        b->pins[30].gpio.pinmap = 277;

        strncpy(b->pins[31].name, "PH03", MRAA_PIN_NAME_SIZE); // PH3
        b->pins[31].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[31].gpio.pinmap = 227;

        strncpy(b->pins[32].name, "PI20", MRAA_PIN_NAME_SIZE); // PI20 UART7_TX
        b->pins[32].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
        b->pins[32].gpio.pinmap = 276;

        strncpy(b->pins[33].name, "GND", MRAA_PIN_NAME_SIZE);
        b->pins[33].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

        strncpy(b->pins[34].name, "GND", MRAA_PIN_NAME_SIZE);
        b->pins[34].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    }

    if (platform_detected == PLATFORM_BANANA_PRO) {

        strncpy(b->pins[27].name, "HAT_SDA", MRAA_PIN_NAME_SIZE); // PI1 TWI3-SDA i2c3
        b->pins[27].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
        b->pins[27].gpio.pinmap = 257;

        strncpy(b->pins[28].name, "HAT_SCK", MRAA_PIN_NAME_SIZE); // PI0 TWI3-SCK i2c3
        b->pins[28].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
        b->pins[28].gpio.pinmap = 256;

        strncpy(b->pins[29].name, "PB03", MRAA_PIN_NAME_SIZE); // PB3 IR0_TX/SPDIF_MCLK
        b->pins[29].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[29].gpio.pinmap = 35;

        strncpy(b->pins[30].name, "GND", MRAA_PIN_NAME_SIZE);
        b->pins[30].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

        strncpy(b->pins[31].name, "PI21", MRAA_PIN_NAME_SIZE); // PI21 UART7_RX
        b->pins[31].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
        b->pins[31].gpio.pinmap = 277;

        strncpy(b->pins[32].name, "PI20", MRAA_PIN_NAME_SIZE); // PI20 UART7_TX
        b->pins[32].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
        b->pins[32].gpio.pinmap = 276;

        strncpy(b->pins[33].name, "PB13", MRAA_PIN_NAME_SIZE); // PB13 SPDIF_D0
        b->pins[33].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[33].gpio.pinmap = 45;

        strncpy(b->pins[34].name, "GND", MRAA_PIN_NAME_SIZE);
        b->pins[34].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

        strncpy(b->pins[35].name, "PB07", MRAA_PIN_NAME_SIZE); // PB07 I2S0_LRCK
        b->pins[35].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[35].gpio.pinmap = 39;

        strncpy(b->pins[36].name, "PB06", MRAA_PIN_NAME_SIZE); // PB06 I2S0BCLK
        b->pins[36].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[36].gpio.pinmap = 38;

        strncpy(b->pins[37].name, "PB05", MRAA_PIN_NAME_SIZE); // PB05 I2S0MCK
        b->pins[37].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[37].gpio.pinmap = 37;

        strncpy(b->pins[38].name, "PB12", MRAA_PIN_NAME_SIZE); // PB12 I2S0_DI
        b->pins[38].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[38].gpio.pinmap = 44;

        strncpy(b->pins[39].name, "GND", MRAA_PIN_NAME_SIZE);
        b->pins[39].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

        strncpy(b->pins[40].name, "PB08", MRAA_PIN_NAME_SIZE); // PB08 I2S0_DO0
        b->pins[40].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[40].gpio.pinmap = 40;
    }

    b->aio_count = 0;
    b->adc_raw = 0;
    b->adc_supported = 0;
    b->pwm_default_period = 500;
    b->pwm_max_period = 2147483;
    b->pwm_min_period = 1;

    b->gpio_count = 0;
    int i;
    for (i = 0; i < b->phy_pin_count; i++) {
        if (b->pins[i].capabilities.gpio) {
            b->gpio_count++;
        }
    }

    // BUS DEFINITIONS
    b->i2c_bus_count = 0;
    b->def_i2c_bus = 0;
    if (i2c2 >= 0) {
        b->i2c_bus[b->i2c_bus_count].bus_id = i2c2;
        b->i2c_bus[b->i2c_bus_count].sda = 3;
        b->i2c_bus[b->i2c_bus_count].scl = 5;
        b->i2c_bus_count++;
    }

    b->spi_bus_count = 0;
    b->def_spi_bus = 0;
    if (spi0 >= 0) {
        b->spi_bus[b->spi_bus_count].bus_id = spi0;
        b->spi_bus[b->spi_bus_count].slave_s = 0;
        b->spi_bus[b->spi_bus_count].cs = 24;
        b->spi_bus[b->spi_bus_count].mosi = 19;
        b->spi_bus[b->spi_bus_count].miso = 21;
        b->spi_bus[b->spi_bus_count].sclk = 23;
        b->spi_bus_count++;
    }

    b->uart_dev_count = 0;
    b->def_uart_dev = 0;
    if ((uart3 >= 0) && (platform_detected == PLATFORM_BANANA_PI)) {
        b->def_uart_dev = b->uart_dev_count;
        b->uart_dev[b->uart_dev_count].device_path = serialdev[uart3];
        b->uart_dev[b->uart_dev_count].rx = 11;
        b->uart_dev[b->uart_dev_count].tx = 13;
        b->uart_dev_count++;
    }
    if ((uart4 >= 0) && (platform_detected == PLATFORM_BANANA_PRO)) {
        b->def_uart_dev = b->uart_dev_count;
        b->uart_dev[b->uart_dev_count].device_path = serialdev[uart4];
        b->uart_dev[b->uart_dev_count].rx = 10;
        b->uart_dev[b->uart_dev_count].tx = 8;
        b->uart_dev_count++;
    }
    if (uart7 >= 0) {
        b->uart_dev[b->uart_dev_count].device_path = serialdev[uart7];
        if (platform_detected == PLATFORM_BANANA_PRO) {
            b->uart_dev[b->uart_dev_count].rx = 31;
            b->uart_dev[b->uart_dev_count].tx = 32;
        } else {
            b->uart_dev[b->uart_dev_count].rx = 30;
            b->uart_dev[b->uart_dev_count].tx = 32;
        }
        b->uart_dev_count++;
    }
    if (uart2 >= 0) {
        b->uart_dev[b->uart_dev_count].device_path = serialdev[uart2];
        b->uart_dev[b->uart_dev_count].rx = 11;
        b->uart_dev[b->uart_dev_count].tx = 13;
        b->uart_dev_count++;
    }
    return b;
}
