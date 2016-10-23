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

#include "common.h"
#include "arm/raspberry_pi.h"

#define PLATFORM_NAME_RASPBERRY_PI_B_REV_1 "Raspberry Pi Model B Rev 1"
#define PLATFORM_NAME_RASPBERRY_PI_A_REV_2 "Raspberry Pi Model A Rev 2"
#define PLATFORM_NAME_RASPBERRY_PI_B_REV_2 "Raspberry Pi Model B Rev 2"
#define PLATFORM_NAME_RASPBERRY_PI_B_PLUS_REV_1 "Raspberry Pi Model B+ Rev 1"
#define PLATFORM_NAME_RASPBERRY_PI_COMPUTE_MODULE_REV_1 "Raspberry Pi Compute Module Rev 1"
#define PLATFORM_NAME_RASPBERRY_PI_A_PLUS_REV_1 "Raspberry Pi Model A+ Rev 1"
#define PLATFORM_NAME_RASPBERRY_PI2_B_REV_1 "Raspberry Pi 2 Model B Rev 1"
#define PLATFORM_NAME_RASPBERRY_PI_ZERO "Raspberry Pi Zero"
#define PLATFORM_RASPBERRY_PI_B_REV_1 1
#define PLATFORM_RASPBERRY_PI_A_REV_2 2
#define PLATFORM_RASPBERRY_PI_B_REV_2 3
#define PLATFORM_RASPBERRY_PI_B_PLUS_REV_1 4
#define PLATFORM_RASPBERRY_PI_COMPUTE_MODULE_REV_1 5
#define PLATFORM_RASPBERRY_PI_A_PLUS_REV_1 6
#define PLATFORM_RASPBERRY_PI2_B_REV_1 7
#define PLATFORM_RASPBERRY_PI_ZERO "Raspberry Pi Zero"
#define MMAP_PATH "/dev/mem"
#define BCM2835_PERI_BASE 0x20000000
#define BCM2835_GPIO_BASE (BCM2835_PERI_BASE + 0x200000)
#define BCM2836_PERI_BASE 0x3f000000
#define BCM2836_GPIO_BASE (BCM2836_PERI_BASE + 0x200000)
#define BCM2835_BLOCK_SIZE (4 * 1024)
#define BCM2836_BLOCK_SIZE (4 * 1024)
#define BCM283X_GPSET0 0x001c
#define BCM283X_GPCLR0 0x0028
#define BCM2835_GPLEV0 0x0034
#define MAX_SIZE 64

// MMAP
static uint8_t* mmap_reg = NULL;
static int mmap_fd = 0;
static int mmap_size;
static unsigned int mmap_count = 0;
static int platform_detected = 0;

mraa_result_t
mraa_raspberry_pi_spi_init_pre(int index)
{
    char devpath[MAX_SIZE];
    sprintf(devpath, "/dev/spidev%u.0", plat->spi_bus[index].bus_id);
    if (!mraa_file_exist(devpath)) {
        syslog(LOG_ERR, "spi: Device not initialized");
        syslog(LOG_ERR, "spi: If you run a kernel >=3.18 then you will have to add dtparam=spi=on "
                        "to /boot/config.txt and reboot");
        syslog(LOG_INFO, "spi: trying modprobe for spi-bcm2708");
        system("modprobe spi-bcm2708 >/dev/null 2>&1");
        system("modprobe spi_bcm2708 >/dev/null 2>&1");
        if (!mraa_file_exist(devpath)) {
            return MRAA_ERROR_NO_RESOURCES;
        }
    }
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_raspberry_pi_i2c_init_pre(unsigned int bus)
{
    char devpath[MAX_SIZE];
    sprintf(devpath, "/dev/i2c-%u", bus);
    if (!mraa_file_exist(devpath)) {
        syslog(LOG_INFO, "spi: trying modprobe for i2c-bcm2708 & i2c-dev");
        system("modprobe i2c-bcm2708 >/dev/null 2>&1");
        system("modprobe i2c-dev >/dev/null 2>&1");
        system("modprobe i2c_bcm2708 >/dev/null 2>&1");
        system("modprobe i2c_dev >/dev/null 2>&1");
    }
    if (!mraa_file_exist(devpath)) {
        syslog(LOG_ERR, "i2c: Device not initialized");
        if (platform_detected == PLATFORM_RASPBERRY_PI_B_REV_1) {
            syslog(LOG_ERR, "i2c: If you run a kernel >=3.18 then you will have to add "
                            "dtparam=i2c0=on to /boot/config.txt and reboot");
        } else {
            syslog(LOG_ERR, "i2c: If you run a kernel >=3.18 then you will have to add "
                            "dtparam=i2c1=on to /boot/config.txt and reboot");
        }
        return MRAA_ERROR_NO_RESOURCES;
    }
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_raspberry_pi_mmap_write(mraa_gpio_context dev, int value)
{
    volatile uint32_t* addr;
    if (value) {
        *(volatile uint32_t*) (mmap_reg + BCM283X_GPSET0 + (dev->pin / 32) * 4) =
        (uint32_t)(1 << (dev->pin % 32));
    } else {
        *(volatile uint32_t*) (mmap_reg + BCM283X_GPCLR0 + (dev->pin / 32) * 4) =
        (uint32_t)(1 << (dev->pin % 32));
    }
    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_raspberry_pi_mmap_unsetup()
{
    if (mmap_reg == NULL) {
        syslog(LOG_ERR, "raspberry mmap: null register cant unsetup");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    munmap(mmap_reg, mmap_size);
    mmap_reg = NULL;
    if (close(mmap_fd) != 0) {
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    return MRAA_SUCCESS;
}

int
mraa_raspberry_pi_mmap_read(mraa_gpio_context dev)
{
    uint32_t value = *(volatile uint32_t*) (mmap_reg + BCM2835_GPLEV0 + (dev->pin / 32) * 4);
    if (value & (uint32_t)(1 << (dev->pin % 32))) {
        return 1;
    }
    return 0;
}

mraa_result_t
mraa_raspberry_pi_mmap_setup(mraa_gpio_context dev, mraa_boolean_t en)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "raspberry mmap: context not valid");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (en == 0) {
        if (dev->mmap_write == NULL && dev->mmap_read == NULL) {
            syslog(LOG_ERR, "raspberry mmap: can't disable disabled mmap gpio");
            return MRAA_ERROR_INVALID_PARAMETER;
        }
        dev->mmap_write = NULL;
        dev->mmap_read = NULL;
        mmap_count--;
        if (mmap_count == 0) {
            return mraa_raspberry_pi_mmap_unsetup();
        }
        return MRAA_SUCCESS;
    }

    if (dev->mmap_write != NULL && dev->mmap_read != NULL) {
        syslog(LOG_ERR, "raspberry mmap: can't enable enabled mmap gpio");
        return MRAA_ERROR_INVALID_PARAMETER;
    }

    // Might need to make some elements of this thread safe.
    // For example only allow one thread to enter the following block
    // to prevent mmap'ing twice.
    if (mmap_reg == NULL) {
        if ((mmap_fd = open(MMAP_PATH, O_RDWR)) < 0) {
            syslog(LOG_ERR, "raspberry map: unable to open resource0 file");
            return MRAA_ERROR_INVALID_HANDLE;
        }

        if (platform_detected == PLATFORM_RASPBERRY_PI2_B_REV_1) {
            mmap_reg = (uint8_t*) mmap(NULL, BCM2836_BLOCK_SIZE, PROT_READ | PROT_WRITE,
                                       MAP_FILE | MAP_SHARED, mmap_fd, BCM2836_GPIO_BASE);
        } else {
            mmap_reg = (uint8_t*) mmap(NULL, BCM2835_BLOCK_SIZE, PROT_READ | PROT_WRITE,
                                       MAP_FILE | MAP_SHARED, mmap_fd, BCM2835_GPIO_BASE);
        }
        if (mmap_reg == MAP_FAILED) {
            syslog(LOG_ERR, "raspberry mmap: failed to mmap");
            mmap_reg = NULL;
            close(mmap_fd);
            return MRAA_ERROR_NO_RESOURCES;
        }
    }
    dev->mmap_write = &mraa_raspberry_pi_mmap_write;
    dev->mmap_read = &mraa_raspberry_pi_mmap_read;
    mmap_count++;

    return MRAA_SUCCESS;
}

mraa_board_t*
mraa_raspberry_pi()
{
    mraa_board_t* b = (mraa_board_t*) calloc(1, sizeof(mraa_board_t));
    if (b == NULL) {
        return NULL;
    }
    b->phy_pin_count = 0;

    size_t len = 100;
    char* line = calloc(len, sizeof(char));

    FILE* fh = fopen("/proc/cpuinfo", "r");
    if (fh != NULL) {
        while (getline(&line, &len, fh) != -1) {
            if (strncmp(line, "Revision", 8) == 0) {
                if (strstr(line, "0002") || strstr(line, "0003")) {
                    b->platform_name = PLATFORM_NAME_RASPBERRY_PI_B_REV_1;
                    platform_detected = PLATFORM_RASPBERRY_PI_B_REV_1;
                    b->phy_pin_count = MRAA_RASPBERRY_PI_B_REV_1_PINCOUNT;
                } else if (strstr(line, "0004") || strstr(line, "0005") || strstr(line, "0006") ||
                           strstr(line, "000d") || strstr(line, "000e") || strstr(line, "000f")) {
                    b->platform_name = PLATFORM_NAME_RASPBERRY_PI_B_REV_2;
                    platform_detected = PLATFORM_RASPBERRY_PI_B_REV_2;
                    b->phy_pin_count = MRAA_RASPBERRY_PI_AB_REV_2_PINCOUNT;
                } else if (strstr(line, "900092")) {
                    b->platform_name = PLATFORM_NAME_RASPBERRY_PI_ZERO;
                    platform_detected = PLATFORM_RASPBERRY_PI_ZERO;
                    b->phy_pin_count = MRAA_RASPBERRY_PI_ZERO_PINCOUNT;
                } else if (strstr(line, "0007") || strstr(line, "0008") || strstr(line, "0009")) {
                    b->platform_name = PLATFORM_NAME_RASPBERRY_PI_A_REV_2;
                    platform_detected = PLATFORM_RASPBERRY_PI_A_REV_2;
                    b->phy_pin_count = MRAA_RASPBERRY_PI_AB_REV_2_PINCOUNT;
                } else if (strstr(line, "0010")) {
                    b->platform_name = PLATFORM_NAME_RASPBERRY_PI_B_PLUS_REV_1;
                    platform_detected = PLATFORM_RASPBERRY_PI_B_PLUS_REV_1;
                    b->phy_pin_count = MRAA_RASPBERRY_PI_AB_PLUS_PINCOUNT;
                } else if (strstr(line, "0011")) {
                    b->platform_name = PLATFORM_NAME_RASPBERRY_PI_COMPUTE_MODULE_REV_1;
                    platform_detected = PLATFORM_RASPBERRY_PI_COMPUTE_MODULE_REV_1;
                    b->phy_pin_count = MRAA_RASPBERRY_PI_COMPUTE_MODULE_PINCOUNT;
                } else if (strstr(line, "0012")) {
                    b->platform_name = PLATFORM_NAME_RASPBERRY_PI_A_PLUS_REV_1;
                    platform_detected = PLATFORM_RASPBERRY_PI_A_PLUS_REV_1;
                    b->phy_pin_count = MRAA_RASPBERRY_PI_AB_PLUS_PINCOUNT;
                } else if (strstr(line, "a01041") || strstr(line, "a21041") || strstr(line, "a02082")) {
                    b->platform_name = PLATFORM_NAME_RASPBERRY_PI2_B_REV_1;
                    platform_detected = PLATFORM_RASPBERRY_PI2_B_REV_1;
                    b->phy_pin_count = MRAA_RASPBERRY_PI2_B_REV_1_PINCOUNT;
                } else {
                    b->platform_name = PLATFORM_NAME_RASPBERRY_PI_B_REV_1;
                    platform_detected = PLATFORM_RASPBERRY_PI_B_REV_1;
                    b->phy_pin_count = MRAA_RASPBERRY_PI_B_REV_1_PINCOUNT;
                }
            }
        }
        fclose(fh);
    }
    free(line);

    b->aio_count = 0;
    b->adc_raw = 0;
    b->adc_supported = 0;
    b->pwm_default_period = 500;
    b->pwm_max_period = 2147483;
    b->pwm_min_period = 1;

    if (b->phy_pin_count == 0) {
        free(b);
        syslog(LOG_ERR, "raspberrypi: Failed to detect platform revision");
        return NULL;
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

    b->adv_func->spi_init_pre = &mraa_raspberry_pi_spi_init_pre;
    b->adv_func->i2c_init_pre = &mraa_raspberry_pi_i2c_init_pre;
    b->adv_func->gpio_mmap_setup = &mraa_raspberry_pi_mmap_setup;

    strncpy(b->pins[0].name, "INVALID", MRAA_PIN_NAME_SIZE);
    b->pins[0].capabilities = (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[1].name, "3V3", MRAA_PIN_NAME_SIZE);
    b->pins[1].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[2].name, "5V", MRAA_PIN_NAME_SIZE);
    b->pins[2].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[3].name, "SDA0", MRAA_PIN_NAME_SIZE);
    b->pins[3].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 };
    b->pins[3].gpio.pinmap = 2;
    b->pins[3].gpio.mux_total = 0;
    b->pins[3].i2c.pinmap = 0;
    b->pins[3].i2c.mux_total = 0;

    strncpy(b->pins[4].name, "5V", MRAA_PIN_NAME_SIZE);
    b->pins[4].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[5].name, "SCL0", MRAA_PIN_NAME_SIZE);
    b->pins[5].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 };
    b->pins[5].gpio.pinmap = 3;
    b->pins[5].gpio.mux_total = 0;
    b->pins[5].i2c.pinmap = 0;
    b->pins[5].i2c.mux_total = 0;

    strncpy(b->pins[6].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[6].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[7].name, "GPIO4", MRAA_PIN_NAME_SIZE);
    b->pins[7].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[7].gpio.pinmap = 4;
    b->pins[7].gpio.mux_total = 0;

    strncpy(b->pins[8].name, "UART_TX", MRAA_PIN_NAME_SIZE);
    b->pins[8].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[8].gpio.pinmap = 14;
    b->pins[8].gpio.mux_total = 0;
    b->pins[8].uart.parent_id = 0;
    b->pins[8].uart.mux_total = 0;

    strncpy(b->pins[9].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[9].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[10].name, "UART_RX", MRAA_PIN_NAME_SIZE);
    b->pins[10].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[10].gpio.pinmap = 15;
    b->pins[10].gpio.mux_total = 0;
    b->pins[10].uart.parent_id = 0;
    b->pins[10].uart.mux_total = 0;

    strncpy(b->pins[11].name, "GPIO17", MRAA_PIN_NAME_SIZE);
    b->pins[11].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[11].gpio.pinmap = 17;
    b->pins[11].gpio.mux_total = 0;

    strncpy(b->pins[12].name, "GPIO18", MRAA_PIN_NAME_SIZE);
    b->pins[12].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[12].gpio.pinmap = 18;
    b->pins[12].gpio.mux_total = 0;

    if (platform_detected == PLATFORM_RASPBERRY_PI_B_REV_1) {
        strncpy(b->pins[13].name, "GPIO21", MRAA_PIN_NAME_SIZE);
        b->pins[13].gpio.pinmap = 21;
    } else {
        strncpy(b->pins[13].name, "GPIO27", MRAA_PIN_NAME_SIZE);
        b->pins[13].gpio.pinmap = 27;
    }
    b->pins[13].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[13].gpio.mux_total = 0;

    strncpy(b->pins[14].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[14].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[15].name, "GPIO22", MRAA_PIN_NAME_SIZE);
    b->pins[15].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[15].gpio.pinmap = 22;
    b->pins[15].gpio.mux_total = 0;

    strncpy(b->pins[16].name, "GPIO23", MRAA_PIN_NAME_SIZE);
    b->pins[16].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[16].gpio.pinmap = 23;
    b->pins[16].gpio.mux_total = 0;

    strncpy(b->pins[17].name, "3V3", MRAA_PIN_NAME_SIZE);
    b->pins[17].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[18].name, "GPIO24", MRAA_PIN_NAME_SIZE);
    b->pins[18].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[18].gpio.pinmap = 24;
    b->pins[18].gpio.mux_total = 0;

    strncpy(b->pins[19].name, "SPI_MOSI", MRAA_PIN_NAME_SIZE);
    b->pins[19].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[19].gpio.pinmap = 10;
    b->pins[19].gpio.mux_total = 0;
    b->pins[19].spi.pinmap = 0;
    b->pins[19].spi.mux_total = 0;

    strncpy(b->pins[20].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[20].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[21].name, "SPI_MISO", MRAA_PIN_NAME_SIZE);
    b->pins[21].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[21].gpio.pinmap = 9;
    b->pins[21].gpio.mux_total = 0;
    b->pins[21].spi.pinmap = 0;
    b->pins[21].spi.mux_total = 0;

    strncpy(b->pins[22].name, "GPIO25", MRAA_PIN_NAME_SIZE);
    b->pins[22].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[22].gpio.pinmap = 25;
    b->pins[22].gpio.mux_total = 0;

    strncpy(b->pins[23].name, "SPI_CLK", MRAA_PIN_NAME_SIZE);
    b->pins[23].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[23].gpio.pinmap = 11;
    b->pins[23].gpio.mux_total = 0;
    b->pins[23].spi.pinmap = 0;
    b->pins[23].spi.mux_total = 0;

    strncpy(b->pins[24].name, "SPI_CS0", MRAA_PIN_NAME_SIZE);
    b->pins[24].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[24].gpio.pinmap = 8;
    b->pins[24].gpio.mux_total = 0;
    b->pins[24].spi.pinmap = 0;
    b->pins[24].spi.mux_total = 0;

    strncpy(b->pins[25].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[25].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[26].name, "SPI_CS1", MRAA_PIN_NAME_SIZE);
    b->pins[26].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
    b->pins[26].gpio.pinmap = 7;
    b->pins[26].gpio.mux_total = 0;
    b->pins[26].spi.pinmap = 0;
    b->pins[26].spi.mux_total = 0;

    if ((platform_detected == PLATFORM_RASPBERRY_PI_A_REV_2) ||
        (platform_detected == PLATFORM_RASPBERRY_PI_B_REV_2)) {
        strncpy(b->pins[27].name, "5V", MRAA_PIN_NAME_SIZE);
        b->pins[27].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

        strncpy(b->pins[28].name, "3V3", MRAA_PIN_NAME_SIZE);
        b->pins[28].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

        strncpy(b->pins[29].name, "GPIO8", MRAA_PIN_NAME_SIZE);
        b->pins[29].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[29].gpio.pinmap = 8;
        b->pins[29].gpio.mux_total = 0;

        strncpy(b->pins[30].name, "GPIO9", MRAA_PIN_NAME_SIZE);
        b->pins[30].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[30].gpio.pinmap = 9;
        b->pins[30].gpio.mux_total = 0;

        strncpy(b->pins[31].name, "GPIO10", MRAA_PIN_NAME_SIZE);
        b->pins[31].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[31].gpio.pinmap = 10;
        b->pins[31].gpio.mux_total = 0;

        strncpy(b->pins[32].name, "GPIO11", MRAA_PIN_NAME_SIZE);
        b->pins[32].gpio.pinmap = 11;
        b->pins[32].gpio.mux_total = 0;
        b->pins[32].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };

        strncpy(b->pins[33].name, "GND", MRAA_PIN_NAME_SIZE);
        b->pins[33].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

        strncpy(b->pins[34].name, "GND", MRAA_PIN_NAME_SIZE);
        b->pins[34].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    }

    // BUS DEFINITIONS
    b->i2c_bus_count = 1;
    b->def_i2c_bus = 0;
    if (platform_detected == PLATFORM_RASPBERRY_PI_B_REV_1)
        b->i2c_bus[0].bus_id = 0;
    else
        b->i2c_bus[0].bus_id = 1;
    b->i2c_bus[0].sda = 3;
    b->i2c_bus[0].scl = 5;

    b->spi_bus_count = 1;
    b->def_spi_bus = 0;
    b->spi_bus[0].bus_id = 0;
    b->spi_bus[0].slave_s = 0;
    b->spi_bus[0].cs = 24;
    b->spi_bus[0].mosi = 19;
    b->spi_bus[0].miso = 21;
    b->spi_bus[0].sclk = 23;

    b->uart_dev_count = 1;
    b->def_uart_dev = 0;
    b->uart_dev[0].rx = 10;
    b->uart_dev[0].tx = 8;

    if ((platform_detected == PLATFORM_RASPBERRY_PI_A_PLUS_REV_1) ||
        (platform_detected == PLATFORM_RASPBERRY_PI_B_PLUS_REV_1) ||
        (platform_detected == PLATFORM_RASPBERRY_PI2_B_REV_1) ||
        (platform_detected == PLATFORM_RASPBERRY_PI_ZERO)) {

        strncpy(b->pins[27].name, "ID_SD", MRAA_PIN_NAME_SIZE);
        b->pins[27].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

        strncpy(b->pins[28].name, "ID_SC", MRAA_PIN_NAME_SIZE);
        b->pins[28].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

        strncpy(b->pins[29].name, "GPIO05", MRAA_PIN_NAME_SIZE);
        b->pins[29].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[29].gpio.pinmap = 5;
        b->pins[29].gpio.mux_total = 0;

        strncpy(b->pins[30].name, "GND", MRAA_PIN_NAME_SIZE);
        b->pins[30].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

        strncpy(b->pins[31].name, "GPIO06", MRAA_PIN_NAME_SIZE);
        b->pins[31].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[31].gpio.pinmap = 6;
        b->pins[31].gpio.mux_total = 0;

        strncpy(b->pins[32].name, "GPIO12", MRAA_PIN_NAME_SIZE);
        b->pins[32].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[32].gpio.pinmap = 12;
        b->pins[32].gpio.mux_total = 0;

        strncpy(b->pins[33].name, "GPIO13", MRAA_PIN_NAME_SIZE);
        b->pins[33].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[33].gpio.pinmap = 13;
        b->pins[33].gpio.mux_total = 0;

        strncpy(b->pins[34].name, "GND", MRAA_PIN_NAME_SIZE);
        b->pins[34].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

        strncpy(b->pins[35].name, "GPIO19", MRAA_PIN_NAME_SIZE);
        b->pins[35].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[35].gpio.pinmap = 19;
        b->pins[35].gpio.mux_total = 0;

        strncpy(b->pins[36].name, "GPIO16", MRAA_PIN_NAME_SIZE);
        b->pins[36].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[36].gpio.pinmap = 16;
        b->pins[36].gpio.mux_total = 0;

        strncpy(b->pins[37].name, "GPIO26", MRAA_PIN_NAME_SIZE);
        b->pins[37].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[37].gpio.pinmap = 26;
        b->pins[37].gpio.mux_total = 0;

        strncpy(b->pins[38].name, "GPIO20", MRAA_PIN_NAME_SIZE);
        b->pins[38].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[38].gpio.pinmap = 20;
        b->pins[38].gpio.mux_total = 0;

        strncpy(b->pins[39].name, "GND", MRAA_PIN_NAME_SIZE);
        b->pins[39].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

        strncpy(b->pins[40].name, "GPIO21", MRAA_PIN_NAME_SIZE);
        b->pins[40].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
        b->pins[40].gpio.pinmap = 21;
        b->pins[40].gpio.mux_total = 0;
    }

    b->gpio_count = 0;
    int i;
    for (i = 0; i < b->phy_pin_count; i++) {
        if (b->pins[i].capabilities.gpio) {
            b->gpio_count++;
        }
    }

    return b;
}
