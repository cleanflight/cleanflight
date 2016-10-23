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
#include <mraa/types.h>

#include "common.h"
#include "arm/beaglebone.h"

#define NUM2STR(x) #x

#define PLATFORM_NAME_BEAGLEBONE_BLACK_REV_B "Beaglebone Black Rev. B"
#define PLATFORM_NAME_BEAGLEBONE_BLACK_REV_C "Beaglebone Black Rev. C"

#define SYSFS_DEVICES_CAPEMGR_SLOTS "/sys/devices/bone_capemgr.*/slots"
#define SYSFS_CLASS_PWM "/sys/class/pwm/"
#define SYSFS_CLASS_MMC "/sys/class/mmc_host/"
#define SYSFS_PWM_OVERLAY "am33xx_pwm"
#define UART_OVERLAY(x) "ADAFRUIT-UART" NUM2STR(x)
//#define ADAFRUIT_SPI_OVERLAY "ADAFRUIT-SPI%d"
#define SPI_OVERLAY(x) "BB-SPI" NUM2STR(x) "-01"
#define I2C_OVERLAY(x) "ADAFRUIT-I2C" NUM2STR(x)
#define MAX_SIZE 64

#define MMAP_PATH "/dev/mem"
#define AM335X_GPIO0_BASE 0x44e07000
#define AM335X_GPIO1_BASE 0x4804c000
#define AM335X_GPIO2_BASE 0x481AC000
#define AM335X_GPIO3_BASE 0x481AE000
#define AM335X_GPIO_SIZE (4 * 1024)
#define AM335X_IN 0x138
#define AM335X_CLR 0x190
#define AM335X_SET 0x194

// MMAP
static uint8_t* mmap_gpio[4] = { NULL, NULL, NULL, NULL };
static int mmap_fd = 0;
static unsigned int mmap_count = 0;

mraa_result_t
mraa_beaglebone_mmap_write(mraa_gpio_context dev, int value)
{
    if (value) {
        *(volatile uint32_t*) (mmap_gpio[dev->pin / 32] + AM335X_SET) = (uint32_t)(1 << (dev->pin % 32));
    } else {
        *(volatile uint32_t*) (mmap_gpio[dev->pin / 32] + AM335X_CLR) = (uint32_t)(1 << (dev->pin % 32));
    }
    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_beaglebone_mmap_unsetup()
{
    if (mmap_gpio[0] == NULL) {
        syslog(LOG_ERR, "beaglebone mmap: null register cant unsetup");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    munmap(mmap_gpio[0], AM335X_GPIO_SIZE);
    mmap_gpio[0] = NULL;
    munmap(mmap_gpio[1], AM335X_GPIO_SIZE);
    mmap_gpio[1] = NULL;
    munmap(mmap_gpio[2], AM335X_GPIO_SIZE);
    mmap_gpio[2] = NULL;
    munmap(mmap_gpio[3], AM335X_GPIO_SIZE);
    mmap_gpio[3] = NULL;
    if (close(mmap_fd) != 0) {
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    return MRAA_SUCCESS;
}

int
mraa_beaglebone_mmap_read(mraa_gpio_context dev)
{
    uint32_t value = *(volatile uint32_t*) (mmap_gpio[dev->pin / 32] + AM335X_IN);
    if (value & (uint32_t)(1 << (dev->pin % 32))) {
        return 1;
    }
    return 0;
}

mraa_result_t
mraa_beaglebone_mmap_setup(mraa_gpio_context dev, mraa_boolean_t en)
{
    if (dev == NULL) {
        syslog(LOG_ERR, "beaglebone mmap: context not valid");
        return MRAA_ERROR_INVALID_HANDLE;
    }

    if (en == 0) {
        if (dev->mmap_write == NULL && dev->mmap_read == NULL) {
            syslog(LOG_ERR, "beaglebone mmap: can't disable disabled mmap gpio");
            return MRAA_ERROR_INVALID_PARAMETER;
        }
        dev->mmap_write = NULL;
        dev->mmap_read = NULL;
        mmap_count--;
        if (mmap_count == 0) {
            return mraa_beaglebone_mmap_unsetup();
        }
        return MRAA_SUCCESS;
    }

    if (dev->mmap_write != NULL && dev->mmap_read != NULL) {
        syslog(LOG_ERR, "beaglebone mmap: can't enable enabled mmap gpio");
        return MRAA_ERROR_INVALID_PARAMETER;
    }

    // Might need to make some elements of this thread safe.
    // For example only allow one thread to enter the following block
    // to prevent mmap'ing twice.
    if (mmap_gpio[0] == NULL) {
        if ((mmap_fd = open(MMAP_PATH, O_RDWR)) < 0) {
            syslog(LOG_ERR, "beaglebone map: unable to open resource0 file");
            return MRAA_ERROR_INVALID_HANDLE;
        }

        mmap_gpio[0] = (uint8_t*) mmap(NULL, AM335X_GPIO_SIZE, PROT_READ | PROT_WRITE,
                                       MAP_FILE | MAP_SHARED, mmap_fd, AM335X_GPIO0_BASE);
        if (mmap_gpio[0] == MAP_FAILED) {
            syslog(LOG_ERR, "beaglebone mmap: failed to mmap");
            mmap_gpio[0] = NULL;
            close(mmap_fd);
            return MRAA_ERROR_NO_RESOURCES;
        }
        mmap_gpio[1] = (uint8_t*) mmap(NULL, AM335X_GPIO_SIZE, PROT_READ | PROT_WRITE,
                                       MAP_FILE | MAP_SHARED, mmap_fd, AM335X_GPIO1_BASE);
        if (mmap_gpio[1] == MAP_FAILED) {
            syslog(LOG_ERR, "beaglebone mmap: failed to mmap");
            mmap_gpio[1] = NULL;
            close(mmap_fd);
            return MRAA_ERROR_NO_RESOURCES;
        }
        mmap_gpio[2] = (uint8_t*) mmap(NULL, AM335X_GPIO_SIZE, PROT_READ | PROT_WRITE,
                                       MAP_FILE | MAP_SHARED, mmap_fd, AM335X_GPIO2_BASE);
        if (mmap_gpio[2] == MAP_FAILED) {
            syslog(LOG_ERR, "beaglebone mmap: failed to mmap");
            mmap_gpio[2] = NULL;
            close(mmap_fd);
            return MRAA_ERROR_NO_RESOURCES;
        }
        mmap_gpio[3] = (uint8_t*) mmap(NULL, AM335X_GPIO_SIZE, PROT_READ | PROT_WRITE,
                                       MAP_FILE | MAP_SHARED, mmap_fd, AM335X_GPIO3_BASE);
        if (mmap_gpio[3] == MAP_FAILED) {
            syslog(LOG_ERR, "beaglebone mmap: failed to mmap");
            mmap_gpio[3] = NULL;
            close(mmap_fd);
            return MRAA_ERROR_NO_RESOURCES;
        }
    }
    dev->mmap_write = &mraa_beaglebone_mmap_write;
    dev->mmap_read = &mraa_beaglebone_mmap_read;
    mmap_count++;

    return MRAA_SUCCESS;
}

mraa_result_t
mraa_beaglebone_uart_init_pre(int index)
{
    mraa_result_t ret = MRAA_ERROR_NO_RESOURCES;
    char devpath[MAX_SIZE];
    char* capepath = NULL;
    sprintf(devpath, "/dev/ttyO%u", index + 1);
    if (!mraa_file_exist(devpath)) {
        capepath = mraa_file_unglob(SYSFS_DEVICES_CAPEMGR_SLOTS);
        if (capepath == NULL) {
            syslog(LOG_ERR, "uart: Could not find CapeManager");
            return ret;
        }
        FILE* fh;
        fh = fopen(capepath, "w");
        free(capepath);
        if (fh == NULL) {
            syslog(LOG_ERR, "uart: Failed to open capepath for writing, check access rights for user");
            return ret;
        }
        if (fprintf(fh, UART_OVERLAY(index + 1)) < 0) {
            syslog(LOG_ERR, "uart: Failed to write to CapeManager");
        }
        fclose(fh);
    }
    if (mraa_file_exist(devpath))
        ret = MRAA_SUCCESS;
    else
        syslog(LOG_ERR, "uart: Device not initialized");
    return ret;
}

mraa_result_t
mraa_beaglebone_spi_init_pre(int index)
{
    mraa_result_t ret = MRAA_ERROR_NO_RESOURCES;
    char devpath[MAX_SIZE];
    char* capepath = NULL;
    int deviceindex = 0;

    // The first initialized SPI devices always gets the bus id 1
    // So we need to track down correct mapping and adjust the bus_id field
    if ((index == 0) && mraa_link_targets("/sys/class/spidev/spidev1.0", "48030000"))
        deviceindex = 1;
    if ((index == 0) && mraa_link_targets("/sys/class/spidev/spidev2.0", "48030000"))
        deviceindex = 2;
    if ((index == 1) && mraa_link_targets("/sys/class/spidev/spidev1.0", "481a0000"))
        deviceindex = 1;
    if ((index == 1) && mraa_link_targets("/sys/class/spidev/spidev2.0", "481a0000"))
        deviceindex = 2;
    if ((deviceindex == 0) && mraa_file_exist("/sys/class/spidev/spidev1.0"))
        deviceindex = 2;
    if (deviceindex == 0)
        deviceindex = 1;

    sprintf(devpath, "/dev/spidev%u.0", deviceindex);
    if (!mraa_file_exist(devpath)) {
        capepath = mraa_file_unglob(SYSFS_DEVICES_CAPEMGR_SLOTS);
        if (capepath == NULL) {
            syslog(LOG_ERR, "spi: Could not find CapeManager");
            return ret;
        }
        FILE* fh;
        fh = fopen(capepath, "w");
        free(capepath);
        if (fh == NULL) {
            syslog(LOG_ERR, "spi: Failed to open capepath for writing, check access rights for user");
            return ret;
        }
        if (fprintf(fh, SPI_OVERLAY(index)) < 0) {
            syslog(LOG_ERR,
                   "spi: Failed to write to CapeManager, check that /lib/firmware/%s exists",
                   SPI_OVERLAY(index));
        }
        fclose(fh);
    }
    if (mraa_file_exist(devpath)) {
        plat->spi_bus[index].bus_id = deviceindex;
        ret = MRAA_SUCCESS;
    } else {
        syslog(LOG_ERR, "spi: Device not initialized, check that /lib/firmware/%s exists", SPI_OVERLAY(index));
        syslog(LOG_ERR, "spi: Check http://elinux.org/BeagleBone_Black_Enable_SPIDEV for details");
    }
    return ret;
}

mraa_result_t
mraa_beaglebone_i2c_init_pre(unsigned int bus)
{
    mraa_result_t ret = MRAA_ERROR_NO_RESOURCES;
    char devpath[MAX_SIZE];
    char* capepath = NULL;
    sprintf(devpath, "/dev/i2c-%u", plat->i2c_bus[bus].bus_id);
    if (!mraa_file_exist(devpath)) {
        syslog(LOG_INFO, "i2c: %s doesn't exist ", devpath);
        capepath = mraa_file_unglob(SYSFS_DEVICES_CAPEMGR_SLOTS);
        if (capepath == NULL) {
            syslog(LOG_ERR, "i2c: Could not find CapeManager");
            return ret;
        }
        FILE* fh;
        fh = fopen(capepath, "w");
        free(capepath);
        if (fh == NULL) {
            syslog(LOG_ERR, "i2c: Failed to open capepath for writing, check access rights for user");
            return ret;
        }
        if (fprintf(fh, "ADAFRUIT-I2C%d", bus) < 0) {
            syslog(LOG_ERR,
                   "i2c: Failed to write to CapeManager, check that /lib/firmware/%s exists",
                   I2C_OVERLAY(index));
        }
        fclose(fh);
    }
    if (mraa_file_exist(devpath))
        ret = MRAA_SUCCESS;
    else {
        syslog(LOG_ERR,
               "i2c: Device not initialized, check that /lib/firmware/%s exists",
               I2C_OVERLAY(index));
    }
    return ret;
}

mraa_pwm_context
mraa_beaglebone_pwm_init_replace(int pin)
{
    char devpath[MAX_SIZE];
    char* capepath = NULL;
    if (plat == NULL) {
        syslog(LOG_ERR, "pwm: Platform Not Initialised");
        return NULL;
    }
    if (plat->pins[pin].capabilities.pwm != 1) {
        syslog(LOG_ERR, "pwm: pin not capable of pwm");
        return NULL;
    }
    if (!mraa_file_exist(SYSFS_CLASS_PWM "pwmchip0")) {
        FILE* fh;
        capepath = mraa_file_unglob(SYSFS_DEVICES_CAPEMGR_SLOTS);
        if (capepath == NULL) {
            syslog(LOG_ERR, "pwm: Could not find CapeManager");
            return NULL;
        }
        fh = fopen(capepath, "w");
        free(capepath);
        if (fh == NULL) {
            syslog(LOG_ERR, "pwm: Failed to open %s for writing, check access rights for user");
            return NULL;
        }
        if (fprintf(fh, SYSFS_PWM_OVERLAY) < 0) {
            syslog(LOG_ERR,
                   "pwm: Failed to write to CapeManager, check that /lib/firmware/%s exists", SYSFS_PWM_OVERLAY);
        }
        fclose(fh);
    }

    sprintf(devpath, SYSFS_CLASS_PWM "pwm%u", plat->pins[pin].pwm.pinmap);
    if (!mraa_file_exist(devpath)) {
        FILE* fh;
        fh = fopen(SYSFS_CLASS_PWM "export", "w");
        if (fh == NULL) {
            syslog(LOG_ERR, "pwm: Failed to open /sys/class/pwm/export for writing, check access "
                            "rights for user");
            return NULL;
        }
        if (fprintf(fh, "%d", plat->pins[pin].pwm.pinmap) < 0) {
            syslog(LOG_ERR, "pwm: Failed to write to CapeManager");
        }
        fclose(fh);
    }

    if (mraa_file_exist(devpath)) {
        mraa_pwm_context dev = (mraa_pwm_context) calloc(1, sizeof(struct _pwm));
        if (dev == NULL)
            return NULL;
        dev->duty_fp = -1;
        dev->chipid = -1;
        dev->pin = plat->pins[pin].pwm.pinmap;
        dev->period = -1;
        return dev;
    } else
        syslog(LOG_ERR, "pwm: pin not initialized, check that /lib/firmware/%s exists", SYSFS_PWM_OVERLAY);
    return NULL;
}

mraa_board_t*
mraa_beaglebone()
{
    unsigned int emmc_enabled = 1;
    unsigned int hdmi_enabled = 1;
    unsigned int i2c0_enabled = 1;
    unsigned int i2c1_enabled = 1;
    unsigned int spi0_enabled = 0;
    unsigned int spi1_enabled = 0;
    unsigned int uart1_enabled = 0;
    unsigned int uart2_enabled = 0;
    unsigned int uart3_enabled = 0;
    unsigned int uart4_enabled = 0;
    unsigned int uart5_enabled = 0;
    unsigned int ehrpwm0a_enabled = 0;
    unsigned int ehrpwm0b_enabled = 0;
    unsigned int ehrpwm1a_enabled = 0;
    unsigned int ehrpwm1b_enabled = 0;
    unsigned int ehrpwm2a_enabled = 0;
    unsigned int ehrpwm2b_enabled = 0;
    unsigned int is_rev_c = 0;
    size_t len = 0;
    char* line = NULL;

    FILE* fh;
    fh = fopen(SYSFS_CLASS_MMC "mmc1/mmc1:0001/name", "r");
    if (fh != NULL) {
        emmc_enabled = 1;
        if (getline(&line, &len, fh) != -1) {
            if (strstr(line, "MMC04G")) {
                is_rev_c = 1;
            }
        }
        fclose(fh);
        free(line);
    } else
        emmc_enabled = 0;


    if (mraa_file_exist("/sys/devices/ocp.*/hdmi.*"))
        hdmi_enabled = 1;
    else
        hdmi_enabled = 0;

    if (mraa_file_exist("/sys/class/i2c-dev/i2c-0"))
        i2c0_enabled = 1;
    else
        i2c0_enabled = 0;

    if (mraa_file_exist("/sys/class/i2c-dev/i2c-2"))
        i2c1_enabled = 1;
    else
        i2c1_enabled = 0;

    if (mraa_file_exist("/sys/class/spidev/spidev1.0"))
        spi0_enabled = 1;
    else
        spi0_enabled = 0;

    if (mraa_file_exist("/sys/class/spidev/spidev2.0"))
        spi1_enabled = 1;
    else
        spi1_enabled = 0;

    if (mraa_file_exist("/sys/class/tty/ttyO1"))
        uart1_enabled = 1;
    else
        uart1_enabled = 0;

    if (mraa_file_exist("/sys/class/tty/ttyO2"))
        uart2_enabled = 1;
    else
        uart2_enabled = 0;

    if (mraa_file_exist("/sys/class/tty/ttyO3"))
        uart3_enabled = 1;
    else
        uart3_enabled = 0;

    if (mraa_file_exist("/sys/class/tty/ttyO4"))
        uart4_enabled = 1;
    else
        uart4_enabled = 0;

    if (mraa_file_exist("/sys/class/tty/ttyO5"))
        uart5_enabled = 1;
    else
        uart5_enabled = 0;

    if (mraa_file_exist("/sys/class/pwm/pwm0"))
        ehrpwm0a_enabled = 1;
    else
        ehrpwm0a_enabled = 0;

    if (mraa_file_exist("/sys/class/pwm/pwm1"))
        ehrpwm0b_enabled = 1;
    else
        ehrpwm0b_enabled = 0;

    if (mraa_file_exist("/sys/class/pwm/pwm3"))
        ehrpwm1a_enabled = 1;
    else
        ehrpwm1a_enabled = 0;

    if (mraa_file_exist("/sys/class/pwm/pwm4"))
        ehrpwm1b_enabled = 1;
    else
        ehrpwm1b_enabled = 0;

    if (mraa_file_exist("/sys/class/pwm/pwm5"))
        ehrpwm2a_enabled = 1;
    else
        ehrpwm2a_enabled = 0;

    if (mraa_file_exist("/sys/class/pwm/pwm6"))
        ehrpwm2b_enabled = 1;
    else
        ehrpwm2b_enabled = 0;

    mraa_board_t* b = (mraa_board_t*) calloc(1, sizeof(mraa_board_t));
    if (b == NULL)
        return NULL;
    // TODO: Detect Beaglebone Black Revisions, for now always TYPE B
    if (is_rev_c == 0) {
        b->platform_name = PLATFORM_NAME_BEAGLEBONE_BLACK_REV_B;
        b->phy_pin_count = MRAA_BEAGLEBONE_BLACK_PINCOUNT;
    }
    if (is_rev_c == 1) {
        b->platform_name = PLATFORM_NAME_BEAGLEBONE_BLACK_REV_C;
        b->phy_pin_count = MRAA_BEAGLEBONE_BLACK_PINCOUNT;
    }

    if (b->platform_name == NULL) {
        goto error;
    }

    b->aio_count = 7;
    b->adc_raw = 12;
    b->adc_supported = 12;
    b->pwm_default_period = 500;
    b->pwm_max_period = 2147483;
    b->pwm_min_period = 1;

    b->pins = (mraa_pininfo_t*) calloc(b->phy_pin_count,sizeof(mraa_pininfo_t));
    if (b->pins == NULL) {
        goto error;
    }

    b->adv_func = (mraa_adv_func_t*) calloc(1, sizeof(mraa_adv_func_t));
    if (b->adv_func == NULL) {
        free(b->pins);
        goto error;
    }

    b->adv_func->uart_init_pre = &mraa_beaglebone_uart_init_pre;
    b->adv_func->spi_init_pre = &mraa_beaglebone_spi_init_pre;
    b->adv_func->i2c_init_pre = &mraa_beaglebone_i2c_init_pre;
    b->adv_func->pwm_init_replace = &mraa_beaglebone_pwm_init_replace;

    strncpy(b->pins[0].name, "INVALID", MRAA_PIN_NAME_SIZE);
    b->pins[0].capabilities = (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[1].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[1].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[2].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[2].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    if (emmc_enabled == 1) {
        strncpy(b->pins[3].name, "MMC1_D6", MRAA_PIN_NAME_SIZE);
        b->pins[3].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[3].name, "GPIO38", MRAA_PIN_NAME_SIZE);
        b->pins[3].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[3].gpio.pinmap = 38;
    b->pins[3].gpio.parent_id = 0;
    b->pins[3].gpio.mux_total = 0;

    if (emmc_enabled == 1) {
        strncpy(b->pins[4].name, "MMC1_D7", MRAA_PIN_NAME_SIZE);
        b->pins[4].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[4].name, "GPIO39", MRAA_PIN_NAME_SIZE);
        b->pins[4].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[4].gpio.pinmap = 39;
    b->pins[4].gpio.parent_id = 0;
    b->pins[4].gpio.mux_total = 0;

    if (emmc_enabled == 1) {
        strncpy(b->pins[5].name, "MMC1_D2", MRAA_PIN_NAME_SIZE);
        b->pins[5].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[5].name, "GPIO34", MRAA_PIN_NAME_SIZE);
        b->pins[5].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[5].gpio.pinmap = 34;
    b->pins[5].gpio.parent_id = 0;
    b->pins[5].gpio.mux_total = 0;

    if (emmc_enabled == 1) {
        strncpy(b->pins[6].name, "MMC1_D3", MRAA_PIN_NAME_SIZE);
        b->pins[6].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[6].name, "GPIO35", MRAA_PIN_NAME_SIZE);
        b->pins[6].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[6].gpio.pinmap = 35;
    b->pins[6].gpio.parent_id = 0;
    b->pins[6].gpio.mux_total = 0;

    // TODO TIMER4
    strncpy(b->pins[7].name, "GPIO66", MRAA_PIN_NAME_SIZE);
    b->pins[7].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[7].gpio.pinmap = 66;
    b->pins[7].gpio.parent_id = 0;
    b->pins[7].gpio.mux_total = 0;

    // TODO TIMER7
    strncpy(b->pins[8].name, "GPIO67", MRAA_PIN_NAME_SIZE);
    b->pins[8].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[8].gpio.pinmap = 67;
    b->pins[8].gpio.parent_id = 0;
    b->pins[8].gpio.mux_total = 0;

    // TODO TIMER5
    strncpy(b->pins[9].name, "GPIO69", MRAA_PIN_NAME_SIZE);
    b->pins[9].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[9].gpio.pinmap = 69;
    b->pins[9].gpio.parent_id = 0;
    b->pins[9].gpio.mux_total = 0;

    // TODO TIMER6
    strncpy(b->pins[10].name, "GPIO68", MRAA_PIN_NAME_SIZE);
    b->pins[10].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[10].gpio.pinmap = 68;
    b->pins[10].gpio.parent_id = 0;
    b->pins[10].gpio.mux_total = 0;

    strncpy(b->pins[11].name, "GPIO45", MRAA_PIN_NAME_SIZE);
    b->pins[11].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[11].gpio.pinmap = 45;
    b->pins[11].gpio.parent_id = 0;
    b->pins[11].gpio.mux_total = 0;

    strncpy(b->pins[12].name, "GPIO44", MRAA_PIN_NAME_SIZE);
    b->pins[12].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[12].gpio.pinmap = 44;
    b->pins[12].gpio.parent_id = 0;
    b->pins[12].gpio.mux_total = 0;

    if (ehrpwm2b_enabled == 1) {
        strncpy(b->pins[13].name, "EHRPWM2B", MRAA_PIN_NAME_SIZE);
        b->pins[13].capabilities = (mraa_pincapabilities_t){ 1, 0, 1, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[13].name, "GPIO23", MRAA_PIN_NAME_SIZE);
        b->pins[13].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    }
    b->pins[13].gpio.pinmap = 23;
    b->pins[13].gpio.parent_id = 0;
    b->pins[13].gpio.mux_total = 0;
    b->pins[13].pwm.pinmap = 6;
    b->pins[13].pwm.mux_total = 0;

    strncpy(b->pins[14].name, "GPIO26", MRAA_PIN_NAME_SIZE);
    b->pins[14].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[14].gpio.pinmap = 26;
    b->pins[14].gpio.parent_id = 0;
    b->pins[14].gpio.mux_total = 0;

    strncpy(b->pins[15].name, "GPIO47", MRAA_PIN_NAME_SIZE);
    b->pins[15].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[15].gpio.pinmap = 47;
    b->pins[15].gpio.parent_id = 0;
    b->pins[15].gpio.mux_total = 0;

    strncpy(b->pins[16].name, "GPIO46", MRAA_PIN_NAME_SIZE);
    b->pins[16].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[16].gpio.pinmap = 46;
    b->pins[16].gpio.parent_id = 0;
    b->pins[16].gpio.mux_total = 0;

    // TODO PWM0_SYNCO
    strncpy(b->pins[17].name, "GPIO27", MRAA_PIN_NAME_SIZE);
    b->pins[17].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[17].gpio.pinmap = 27;
    b->pins[17].gpio.parent_id = 0;
    b->pins[17].gpio.mux_total = 0;

    strncpy(b->pins[18].name, "GPIO65", MRAA_PIN_NAME_SIZE);
    b->pins[18].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[18].gpio.pinmap = 65;
    b->pins[18].gpio.parent_id = 0;
    b->pins[18].gpio.mux_total = 0;

    if (ehrpwm2a_enabled == 1) {
        strncpy(b->pins[19].name, "EHRPWM2A", MRAA_PIN_NAME_SIZE);
        b->pins[19].capabilities = (mraa_pincapabilities_t){ 1, 0, 1, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[19].name, "GPIO22", MRAA_PIN_NAME_SIZE);
        b->pins[19].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    }
    b->pins[19].gpio.pinmap = 22;
    b->pins[19].gpio.parent_id = 0;
    b->pins[19].gpio.mux_total = 0;
    b->pins[19].pwm.pinmap = 5;
    b->pins[19].pwm.mux_total = 0;

    if (emmc_enabled == 1) {
        strncpy(b->pins[20].name, "MMC1_CMD", MRAA_PIN_NAME_SIZE);
        b->pins[20].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[20].name, "GPIO63", MRAA_PIN_NAME_SIZE);
        b->pins[20].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[20].gpio.pinmap = 63;
    b->pins[20].gpio.parent_id = 0;
    b->pins[20].gpio.mux_total = 0;

    if (emmc_enabled == 1) {
        strncpy(b->pins[21].name, "MMC1_CLK", MRAA_PIN_NAME_SIZE);
        b->pins[21].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[21].name, "GPIO62", MRAA_PIN_NAME_SIZE);
        b->pins[21].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[21].gpio.pinmap = 62;
    b->pins[21].gpio.parent_id = 0;
    b->pins[21].gpio.mux_total = 0;

    if (emmc_enabled == 1) {
        strncpy(b->pins[22].name, "MMC1_D5", MRAA_PIN_NAME_SIZE);
        b->pins[22].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[22].name, "GPIO37", MRAA_PIN_NAME_SIZE);
        b->pins[22].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[22].gpio.pinmap = 37;
    b->pins[22].gpio.parent_id = 0;
    b->pins[22].gpio.mux_total = 0;

    if (emmc_enabled == 1) {
        strncpy(b->pins[23].name, "MMC_D4", MRAA_PIN_NAME_SIZE);
        b->pins[23].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[23].name, "GPIO36", MRAA_PIN_NAME_SIZE);
        b->pins[23].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[23].gpio.pinmap = 36;
    b->pins[23].gpio.parent_id = 0;
    b->pins[23].gpio.mux_total = 0;

    if (emmc_enabled == 1) {
        strncpy(b->pins[24].name, "MMC_D1", MRAA_PIN_NAME_SIZE);
        b->pins[24].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[24].name, "GPIO33", MRAA_PIN_NAME_SIZE);
        b->pins[24].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[24].gpio.pinmap = 33;
    b->pins[24].gpio.parent_id = 0;
    b->pins[24].gpio.mux_total = 0;

    if (emmc_enabled == 1) {
        strncpy(b->pins[25].name, "MMC1_D0", MRAA_PIN_NAME_SIZE);
        b->pins[25].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[25].name, "GPIO32", MRAA_PIN_NAME_SIZE);
        b->pins[25].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[25].gpio.pinmap = 32;
    b->pins[25].gpio.parent_id = 0;
    b->pins[25].gpio.mux_total = 0;

    strncpy(b->pins[26].name, "GPIO61", MRAA_PIN_NAME_SIZE);
    b->pins[26].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[26].gpio.pinmap = 61;
    b->pins[26].gpio.parent_id = 0;
    b->pins[26].gpio.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[27].name, "LCD_VSYNC", MRAA_PIN_NAME_SIZE);
        b->pins[27].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[27].name, "GPIO86", MRAA_PIN_NAME_SIZE);
        b->pins[27].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[27].gpio.pinmap = 86;
    b->pins[27].gpio.parent_id = 0;
    b->pins[27].gpio.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[28].name, "LCD_PCLK", MRAA_PIN_NAME_SIZE);
        b->pins[28].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[28].name, "GPIO88", MRAA_PIN_NAME_SIZE);
        b->pins[28].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[28].gpio.pinmap = 88;
    b->pins[28].gpio.parent_id = 0;
    b->pins[28].gpio.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[29].name, "LCD_HSYNC", MRAA_PIN_NAME_SIZE);
        b->pins[29].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[29].name, "GPIO87", MRAA_PIN_NAME_SIZE);
        b->pins[29].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[29].gpio.pinmap = 87;
    b->pins[29].gpio.parent_id = 0;
    b->pins[29].gpio.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[30].name, "LCD_AC_BIAS", MRAA_PIN_NAME_SIZE);
        b->pins[30].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[30].name, "GPIO89", MRAA_PIN_NAME_SIZE);
        b->pins[30].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[30].gpio.pinmap = 89;
    b->pins[30].gpio.parent_id = 0;
    b->pins[30].gpio.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[31].name, "LCD_D14", MRAA_PIN_NAME_SIZE);
        b->pins[31].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        // TODO UART5_CTS this is ignored when using ADAFRUIT
        strncpy(b->pins[31].name, "GPIO10", MRAA_PIN_NAME_SIZE);
        b->pins[31].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[31].gpio.pinmap = 10;
    b->pins[31].gpio.parent_id = 0;
    b->pins[31].gpio.mux_total = 0;
    b->pins[31].uart.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[32].name, "LCD_D15", MRAA_PIN_NAME_SIZE);
        b->pins[32].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        // TODO UART5_RTS this is ignored when using ADAFRUIT
        strncpy(b->pins[32].name, "GPIO11", MRAA_PIN_NAME_SIZE);
        b->pins[32].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[32].gpio.pinmap = 11;
    b->pins[32].gpio.parent_id = 0;
    b->pins[32].gpio.mux_total = 0;
    b->pins[32].uart.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[33].name, "LCD_D13", MRAA_PIN_NAME_SIZE);
        b->pins[33].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        // TODO UART4_RTS this is ignored when using ADAFRUIT
        strncpy(b->pins[33].name, "GPIO9", MRAA_PIN_NAME_SIZE);
        b->pins[33].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[33].gpio.pinmap = 9;
    b->pins[33].gpio.parent_id = 0;
    b->pins[33].gpio.mux_total = 0;
    b->pins[33].uart.mux_total = 0;

    // TODO PWM_1B
    if (hdmi_enabled == 1) {
        strncpy(b->pins[34].name, "LCD_D11", MRAA_PIN_NAME_SIZE);
        b->pins[34].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[34].name, "GPIO81", MRAA_PIN_NAME_SIZE);
        b->pins[34].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    }
    b->pins[34].gpio.pinmap = 81;
    b->pins[34].gpio.parent_id = 0;
    b->pins[34].gpio.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[35].name, "LCD_D12", MRAA_PIN_NAME_SIZE);
        b->pins[35].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        // TODO UART4_CTS this is ignored when using ADAFRUIT
        strncpy(b->pins[35].name, "GPIO8", MRAA_PIN_NAME_SIZE);
        b->pins[35].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[35].gpio.pinmap = 8;
    b->pins[35].gpio.parent_id = 0;
    b->pins[35].gpio.mux_total = 0;
    b->pins[35].uart.mux_total = 0;

    // TODO PWM_1A
    if (hdmi_enabled == 1) {
        strncpy(b->pins[36].name, "LCD_D10", MRAA_PIN_NAME_SIZE);
        b->pins[36].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[36].name, "GPIO80", MRAA_PIN_NAME_SIZE);
        b->pins[36].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    }
    b->pins[36].gpio.pinmap = 80;
    b->pins[36].gpio.parent_id = 0;
    b->pins[36].gpio.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[37].name, "LCD_D8", MRAA_PIN_NAME_SIZE);
        b->pins[37].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        if (uart5_enabled == 1) {
            strncpy(b->pins[37].name, "UART5TX", MRAA_PIN_NAME_SIZE);
            b->pins[37].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
        } else {
            strncpy(b->pins[37].name, "GPIO78", MRAA_PIN_NAME_SIZE);
            b->pins[37].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
        }
    }
    b->pins[37].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[37].gpio.pinmap = 78;
    b->pins[37].gpio.parent_id = 0;
    b->pins[37].gpio.mux_total = 0;
    b->pins[37].uart.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[38].name, "LCD_D9", MRAA_PIN_NAME_SIZE);
        b->pins[38].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        // TODO UART5_RX
        if (uart5_enabled == 1) {
            strncpy(b->pins[38].name, "UART5RX", MRAA_PIN_NAME_SIZE);
            b->pins[38].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
        } else {
            strncpy(b->pins[38].name, "GPIO79", MRAA_PIN_NAME_SIZE);
            b->pins[38].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
        }
    }
    b->pins[38].gpio.pinmap = 79;
    b->pins[38].gpio.parent_id = 0;
    b->pins[38].gpio.mux_total = 0;
    b->pins[38].uart.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[39].name, "LCD_D6", MRAA_PIN_NAME_SIZE);
        b->pins[39].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[39].name, "GPIO76", MRAA_PIN_NAME_SIZE);
        b->pins[39].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[39].gpio.pinmap = 76;
    b->pins[39].gpio.parent_id = 0;
    b->pins[39].gpio.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[40].name, "LCD_D7", MRAA_PIN_NAME_SIZE);
        b->pins[40].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[40].name, "GPIO77", MRAA_PIN_NAME_SIZE);
        b->pins[40].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[40].gpio.pinmap = 77;
    b->pins[40].gpio.parent_id = 0;
    b->pins[40].gpio.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[41].name, "LCD_D4", MRAA_PIN_NAME_SIZE);
        b->pins[41].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[41].name, "GPIO74", MRAA_PIN_NAME_SIZE);
        b->pins[41].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[41].gpio.pinmap = 74;
    b->pins[41].gpio.parent_id = 0;
    b->pins[41].gpio.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[42].name, "LCD_D5", MRAA_PIN_NAME_SIZE);
        b->pins[42].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[42].name, "GPIO75", MRAA_PIN_NAME_SIZE);
        b->pins[42].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[42].gpio.pinmap = 75;
    b->pins[42].gpio.parent_id = 0;
    b->pins[42].gpio.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[43].name, "LCD_D2", MRAA_PIN_NAME_SIZE);
        b->pins[43].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[43].name, "GPIO72", MRAA_PIN_NAME_SIZE);
        b->pins[43].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[43].gpio.pinmap = 72;
    b->pins[43].gpio.parent_id = 0;
    b->pins[43].gpio.mux_total = 0;

    if (hdmi_enabled == 1) {
        strncpy(b->pins[44].name, "LCD_D3", MRAA_PIN_NAME_SIZE);
        b->pins[44].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[44].name, "GPIO73", MRAA_PIN_NAME_SIZE);
        b->pins[44].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[44].gpio.pinmap = 73;
    b->pins[44].gpio.parent_id = 0;
    b->pins[44].gpio.mux_total = 0;

    // TODO PWM_2A
    if (hdmi_enabled == 1) {
        strncpy(b->pins[45].name, "LCD_D0", MRAA_PIN_NAME_SIZE);
        b->pins[45].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[45].name, "GPIO70", MRAA_PIN_NAME_SIZE);
        b->pins[45].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    }
    b->pins[45].gpio.pinmap = 70;
    b->pins[45].gpio.parent_id = 0;
    b->pins[45].gpio.mux_total = 0;

    // TODO PWM_2B
    if (hdmi_enabled == 1) {
        strncpy(b->pins[46].name, "LCD_D1", MRAA_PIN_NAME_SIZE);
        b->pins[46].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[46].name, "GPIO71", MRAA_PIN_NAME_SIZE);
        b->pins[46].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    }
    b->pins[46].gpio.pinmap = 71;
    b->pins[46].gpio.parent_id = 0;
    b->pins[46].gpio.mux_total = 0;

    strncpy(b->pins[47].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[47].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[48].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[48].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[49].name, "3.3V", MRAA_PIN_NAME_SIZE);
    b->pins[49].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[50].name, "3.3V", MRAA_PIN_NAME_SIZE);
    b->pins[50].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[51].name, "5V", MRAA_PIN_NAME_SIZE);
    b->pins[51].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[52].name, "5V", MRAA_PIN_NAME_SIZE);
    b->pins[52].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[53].name, "5V", MRAA_PIN_NAME_SIZE);
    b->pins[53].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[54].name, "5V", MRAA_PIN_NAME_SIZE);
    b->pins[54].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[55].name, "PWR", MRAA_PIN_NAME_SIZE);
    b->pins[55].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    strncpy(b->pins[56].name, "RESET", MRAA_PIN_NAME_SIZE);
    b->pins[56].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    if (uart4_enabled == 1) {
        strncpy(b->pins[57].name, "UART4_RX", MRAA_PIN_NAME_SIZE);
        b->pins[57].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    } else {
        strncpy(b->pins[57].name, "GPIO30", MRAA_PIN_NAME_SIZE);
        b->pins[57].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    }
    b->pins[57].gpio.pinmap = 30;
    b->pins[57].gpio.parent_id = 0;
    b->pins[57].gpio.mux_total = 0;
    b->pins[57].uart.mux_total = 0;

    strncpy(b->pins[58].name, "GPIO60", MRAA_PIN_NAME_SIZE);
    b->pins[58].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[58].gpio.pinmap = 60;
    b->pins[58].gpio.parent_id = 0;
    b->pins[58].gpio.mux_total = 0;

    if (uart4_enabled == 1) {
        strncpy(b->pins[59].name, "UART4_TX", MRAA_PIN_NAME_SIZE);
        b->pins[59].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    } else {
        strncpy(b->pins[59].name, "GPIO31", MRAA_PIN_NAME_SIZE);
        b->pins[59].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    }
    b->pins[59].gpio.pinmap = 31;
    b->pins[59].gpio.parent_id = 0;
    b->pins[59].gpio.mux_total = 0;
    b->pins[59].uart.mux_total = 0;

    if (ehrpwm1a_enabled == 1) {
        strncpy(b->pins[60].name, "EHRPWM1A", MRAA_PIN_NAME_SIZE);
        b->pins[60].capabilities = (mraa_pincapabilities_t){ 1, 0, 1, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[60].name, "GPIO50", MRAA_PIN_NAME_SIZE);
        b->pins[60].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    }
    b->pins[60].gpio.pinmap = 50;
    b->pins[60].gpio.parent_id = 0;
    b->pins[60].gpio.mux_total = 0;
    b->pins[60].pwm.pinmap = 3;
    b->pins[60].pwm.mux_total = 0;

    // TODO PWM_TRIP2_IN (not a PWM output, but used for sync cf ref. manual)
    strncpy(b->pins[61].name, "GPIO48", MRAA_PIN_NAME_SIZE);
    b->pins[61].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[61].gpio.pinmap = 48;
    b->pins[61].gpio.parent_id = 0;
    b->pins[61].gpio.mux_total = 0;

    if (ehrpwm1b_enabled == 1) {
        strncpy(b->pins[62].name, "EHRPWM1B", MRAA_PIN_NAME_SIZE);
        b->pins[62].capabilities = (mraa_pincapabilities_t){ 1, 0, 1, 0, 0, 0, 0, 0 };
    } else {
        strncpy(b->pins[62].name, "GPIO51", MRAA_PIN_NAME_SIZE);
        b->pins[62].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    }
    b->pins[62].gpio.pinmap = 51;
    b->pins[62].gpio.parent_id = 0;
    b->pins[62].gpio.mux_total = 0;
    b->pins[62].pwm.pinmap = 4;
    b->pins[62].pwm.mux_total = 0;

    if ((i2c0_enabled == 1) || (spi0_enabled == 1)) {
        if (i2c0_enabled == 1) {
            strncpy(b->pins[63].name, "I2C1SCL", MRAA_PIN_NAME_SIZE);
            b->pins[63].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 1, 0, 0 };
        }
        if (spi0_enabled == 1) {
            strncpy(b->pins[63].name, "SPI0CS0", MRAA_PIN_NAME_SIZE);
            b->pins[63].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 0, 0, 0 };
        }
    } else {
        strncpy(b->pins[63].name, "GPIO4", MRAA_PIN_NAME_SIZE);
        b->pins[63].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 1, 0, 0 };
    }
    b->pins[63].gpio.pinmap = 4;
    b->pins[63].gpio.parent_id = 0;
    b->pins[63].gpio.mux_total = 0;
    b->pins[63].i2c.mux_total = 0;
    b->pins[63].spi.mux_total = 0;

    if ((i2c0_enabled == 1) || (spi0_enabled == 1)) {
        if (i2c0_enabled == 1) {
            strncpy(b->pins[64].name, "I2C1SDA", MRAA_PIN_NAME_SIZE);
            b->pins[64].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 1, 0, 0 };
        }
        if (spi0_enabled == 1) {
            strncpy(b->pins[64].name, "SPI0D1", MRAA_PIN_NAME_SIZE);
            b->pins[64].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 0, 0, 0 };
        }
    } else {
        strncpy(b->pins[64].name, "GPIO5", MRAA_PIN_NAME_SIZE);
        b->pins[64].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 1, 0, 0 };
    }
    b->pins[64].gpio.pinmap = 5;
    b->pins[64].gpio.parent_id = 0;
    b->pins[64].gpio.mux_total = 0;
    b->pins[64].i2c.mux_total = 0;
    b->pins[64].spi.mux_total = 0;

    if (i2c1_enabled == 1) {
        strncpy(b->pins[65].name, "I2C2SCL", MRAA_PIN_NAME_SIZE);
        b->pins[65].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 1, 0, 0 };
        b->pins[65].i2c.mux_total = 0;
    } else {
        strncpy(b->pins[65].name, "GPIO13", MRAA_PIN_NAME_SIZE);
        b->pins[65].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 };
    }
    b->pins[65].gpio.pinmap = 13;
    b->pins[65].gpio.parent_id = 0;
    b->pins[65].gpio.mux_total = 0;
    b->pins[65].i2c.mux_total = 0;

    if (i2c1_enabled == 1) {
        strncpy(b->pins[66].name, "I2C2SDA", MRAA_PIN_NAME_SIZE);
        b->pins[66].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 1, 0, 0 };
        b->pins[66].i2c.mux_total = 0;
    } else {
        strncpy(b->pins[66].name, "GPIO12", MRAA_PIN_NAME_SIZE);
        b->pins[66].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 };
    }
    b->pins[66].gpio.pinmap = 12;
    b->pins[66].gpio.parent_id = 0;
    b->pins[66].gpio.mux_total = 0;
    b->pins[66].i2c.mux_total = 0;

    if ((spi0_enabled == 1) || uart2_enabled == 1 || ehrpwm0b_enabled == 1) {
        if (uart2_enabled == 1) {
            strncpy(b->pins[67].name, "UART2_TX", MRAA_PIN_NAME_SIZE);
            b->pins[67].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 1 };
        }
        if (spi0_enabled == 1) {
            strncpy(b->pins[67].name, "SPI0D0", MRAA_PIN_NAME_SIZE);
            b->pins[67].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 0, 0, 0 };
        }
        if (ehrpwm0b_enabled == 1) {
            strncpy(b->pins[67].name, "EHRPWM0B", MRAA_PIN_NAME_SIZE);
            b->pins[67].capabilities = (mraa_pincapabilities_t){ 1, 0, 1, 0, 0, 0, 0, 0 };
        }
    } else {
        strncpy(b->pins[67].name, "GPIO3", MRAA_PIN_NAME_SIZE);
        b->pins[67].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 1, 0, 0, 1 };
    }
    b->pins[67].gpio.pinmap = 3;
    b->pins[67].gpio.parent_id = 0;
    b->pins[67].gpio.mux_total = 0;
    b->pins[67].spi.mux_total = 0;
    b->pins[67].uart.mux_total = 0;
    b->pins[67].pwm.pinmap = 1;
    b->pins[67].pwm.mux_total = 0;

    if ((spi0_enabled == 1) || uart2_enabled == 1 || ehrpwm0a_enabled == 1) {
        if (uart2_enabled == 1) {
            strncpy(b->pins[68].name, "UART2_RX", MRAA_PIN_NAME_SIZE);
            b->pins[68].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 0, 0, 1 };
        }
        if (spi0_enabled == 1) {
            strncpy(b->pins[68].name, "SPI0CLK", MRAA_PIN_NAME_SIZE);
            b->pins[68].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 0, 0, 0 };
        }
        if (ehrpwm0a_enabled == 1) {
            strncpy(b->pins[68].name, "EHRPWM0A", MRAA_PIN_NAME_SIZE);
            b->pins[68].capabilities = (mraa_pincapabilities_t){ 1, 0, 1, 0, 0, 0, 0, 0 };
        }
    } else {
        strncpy(b->pins[68].name, "GPIO2", MRAA_PIN_NAME_SIZE);
        b->pins[68].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 1, 0, 0, 1 };
    }
    b->pins[68].gpio.pinmap = 2;
    b->pins[68].gpio.parent_id = 0;
    b->pins[68].gpio.mux_total = 0;
    b->pins[68].spi.mux_total = 0;
    b->pins[68].uart.mux_total = 0;
    b->pins[68].pwm.pinmap = 0;
    b->pins[68].pwm.mux_total = 0;

    // TODO PWM0_SYNCO ?? PWM
    strncpy(b->pins[69].name, "GPIO49", MRAA_PIN_NAME_SIZE);
    b->pins[69].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[69].gpio.pinmap = 49;
    b->pins[69].gpio.parent_id = 0;
    b->pins[69].gpio.mux_total = 0;

    if (uart1_enabled == 1) {
        strncpy(b->pins[70].name, "UART1_RX", MRAA_PIN_NAME_SIZE);
        b->pins[70].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    } else {
        strncpy(b->pins[70].name, "GPIO15", MRAA_PIN_NAME_SIZE);
        b->pins[70].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    }
    b->pins[70].gpio.pinmap = 15;
    b->pins[70].gpio.parent_id = 0;
    b->pins[70].gpio.mux_total = 0;
    b->pins[70].uart.mux_total = 0;

    strncpy(b->pins[71].name, "GPIO117", MRAA_PIN_NAME_SIZE);
    b->pins[71].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[71].gpio.pinmap = 117;
    b->pins[71].gpio.parent_id = 0;
    b->pins[71].gpio.mux_total = 0;

    if (uart1_enabled == 1) {
        strncpy(b->pins[72].name, "UART1_RX", MRAA_PIN_NAME_SIZE);
        b->pins[72].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    } else {
        strncpy(b->pins[72].name, "GPIO14", MRAA_PIN_NAME_SIZE);
        b->pins[72].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    }
    b->pins[72].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 1 };
    b->pins[72].gpio.pinmap = 14;
    b->pins[72].gpio.parent_id = 0;
    b->pins[72].gpio.mux_total = 0;
    b->pins[72].uart.mux_total = 0;

    strncpy(b->pins[73].name, "GPIO115", MRAA_PIN_NAME_SIZE);
    b->pins[73].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[73].gpio.pinmap = 115;
    b->pins[73].gpio.parent_id = 0;
    b->pins[73].gpio.mux_total = 0;

    if (emmc_enabled != 1) {
        if (spi1_enabled == 1) {
            strncpy(b->pins[74].name, "SPI1CS0", MRAA_PIN_NAME_SIZE);
            b->pins[74].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 0, 0, 0 };
        } else {
            strncpy(b->pins[74].name, "GPIO113", MRAA_PIN_NAME_SIZE);
            b->pins[74].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
        }
    } else {
        strncpy(b->pins[74].name, "MCASP0XX", MRAA_PIN_NAME_SIZE);
        b->pins[74].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 0, 0, 0 };
    }
    b->pins[74].gpio.pinmap = 113;
    b->pins[74].gpio.parent_id = 0;
    b->pins[74].gpio.mux_total = 0;
    b->pins[74].spi.mux_total = 0;

    if (emmc_enabled != 1) {
        if (spi1_enabled == 1) {
            strncpy(b->pins[75].name, "SPI1D0", MRAA_PIN_NAME_SIZE);
            b->pins[75].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 0, 0, 0 };
        } else {
            strncpy(b->pins[75].name, "GPIO111", MRAA_PIN_NAME_SIZE);
            b->pins[75].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
        }
    } else {
        strncpy(b->pins[75].name, "MMC1_SD", MRAA_PIN_NAME_SIZE);
        b->pins[75].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[75].gpio.pinmap = 111;
    b->pins[75].gpio.parent_id = 0;
    b->pins[75].gpio.mux_total = 0;
    b->pins[75].spi.mux_total = 0;

    if (emmc_enabled != 1) {
        if (spi1_enabled == 1) {
            strncpy(b->pins[76].name, "SPI1D1", MRAA_PIN_NAME_SIZE);
            b->pins[76].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 0, 0, 0 };
        } else {
            strncpy(b->pins[76].name, "GPIO112", MRAA_PIN_NAME_SIZE);
            b->pins[76].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
        }
    } else {
        strncpy(b->pins[76].name, "MMC2_SD", MRAA_PIN_NAME_SIZE);
        b->pins[76].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[76].gpio.pinmap = 112;
    b->pins[76].gpio.parent_id = 0;
    b->pins[76].gpio.mux_total = 0;
    b->pins[76].spi.mux_total = 0;

    if (emmc_enabled != 1) {
        if (spi1_enabled == 1) {
            strncpy(b->pins[77].name, "SPI1CLK", MRAA_PIN_NAME_SIZE);
            b->pins[77].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 1, 0, 0, 0 };
        } else {
            strncpy(b->pins[77].name, "GPIO110", MRAA_PIN_NAME_SIZE);
            b->pins[77].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 1, 0, 0, 0 };
        }
    } else {
        strncpy(b->pins[77].name, "MMC0_SD", MRAA_PIN_NAME_SIZE);
        b->pins[77].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    }
    b->pins[77].gpio.pinmap = 110;
    b->pins[77].gpio.parent_id = 0;
    b->pins[77].gpio.mux_total = 0;
    b->pins[77].spi.mux_total = 0;


    strncpy(b->pins[78].name, "VDD_ADC", MRAA_PIN_NAME_SIZE);
    b->pins[78].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    // TODO AIN4
    strncpy(b->pins[79].name, "AIN4", MRAA_PIN_NAME_SIZE);
    b->pins[79].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 1, 0 };

    strncpy(b->pins[80].name, "GND_ADC", MRAA_PIN_NAME_SIZE);
    b->pins[80].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    // TODO AIN6
    strncpy(b->pins[81].name, "AIN6", MRAA_PIN_NAME_SIZE);
    b->pins[81].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 1, 0 };
    // TODO AIN5
    strncpy(b->pins[82].name, "AIN5", MRAA_PIN_NAME_SIZE);
    b->pins[82].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 1, 0 };
    // TODO AIN2
    strncpy(b->pins[83].name, "AIN2", MRAA_PIN_NAME_SIZE);
    b->pins[83].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 1, 0 };
    // TODO AIN3
    strncpy(b->pins[84].name, "AIN3", MRAA_PIN_NAME_SIZE);
    b->pins[84].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 1, 0 };
    // TODO AIN0
    strncpy(b->pins[85].name, "AIN0", MRAA_PIN_NAME_SIZE);
    b->pins[85].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 1, 0 };
    // TODO AIN1
    strncpy(b->pins[86].name, "AIN1", MRAA_PIN_NAME_SIZE);
    b->pins[86].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 1, 0 };

    strncpy(b->pins[87].name, "GPIO20", MRAA_PIN_NAME_SIZE);
    b->pins[87].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[87].gpio.pinmap = 20;
    b->pins[87].gpio.parent_id = 0;
    b->pins[87].gpio.mux_total = 0;

    strncpy(b->pins[88].name, "GPIO7", MRAA_PIN_NAME_SIZE);
    b->pins[88].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[88].gpio.pinmap = 7;
    b->pins[88].gpio.parent_id = 0;
    b->pins[88].gpio.mux_total = 0;

    // GND
    strncpy(b->pins[89].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[89].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    // GND
    strncpy(b->pins[90].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[90].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    // GND
    strncpy(b->pins[91].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[91].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    // GND
    strncpy(b->pins[92].name, "GND", MRAA_PIN_NAME_SIZE);
    b->pins[92].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };

    // BUS DEFINITIONS
    b->i2c_bus_count = 2;
    b->def_i2c_bus = 0;

    b->i2c_bus[0].bus_id = 0;
    b->i2c_bus[0].sda = 46 + 18;
    b->i2c_bus[0].scl = 46 + 17;

    b->i2c_bus[1].bus_id = 2;
    b->i2c_bus[1].sda = 46 + 20;
    b->i2c_bus[1].scl = 46 + 19;

    if (emmc_enabled == 1)
        b->spi_bus_count = 1;
    else
        b->spi_bus_count = 2;
    b->def_spi_bus = 0;
    b->spi_bus[0].bus_id = 1;
    b->spi_bus[0].slave_s = 0;
    b->spi_bus[0].cs = 46 + 17;
    b->spi_bus[0].mosi = 46 + 18;
    b->spi_bus[0].miso = 46 + 21;
    b->spi_bus[0].sclk = 46 + 22;

    b->spi_bus[1].bus_id = 2;
    b->spi_bus[1].slave_s = 0;
    b->spi_bus[1].cs = 46 + 28;
    b->spi_bus[1].mosi = 46 + 29;
    b->spi_bus[1].miso = 46 + 30;
    b->spi_bus[1].sclk = 46 + 31;

    b->uart_dev_count = 5;
    b->def_uart_dev = 0;
    b->uart_dev[0].rx = 46 + 26;
    b->uart_dev[0].tx = 46 + 24;
    b->uart_dev[1].rx = 46 + 22;
    b->uart_dev[1].tx = 46 + 21;
    // TODO
    b->uart_dev[2].rx = 0;
    b->uart_dev[2].tx = 42;

    b->uart_dev[3].rx = 46 + 11;
    b->uart_dev[3].tx = 46 + 13;
    b->uart_dev[4].rx = 38;
    b->uart_dev[4].tx = 37;

    b->gpio_count = 0;
    int i;
    for (i = 0; i < b->phy_pin_count; i++)
        if (b->pins[i].capabilities.gpio)
            b->gpio_count++;

    return b;
error:
    syslog(LOG_CRIT, "Beaglebone: failed to initialize");
    free(b);
    return NULL;
};
