/*
 * Author: Brendan Le Foll <brendan.le.foll@intel.com>
 * Author: Thomas Ingleby <thomas.c.ingleby@intel.com>
 * Copyright (c) 2014-2016 Intel Corporation.
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

#define _GNU_SOURCE
#if !defined(_XOPEN_SOURCE) || _XOPEN_SOURCE < 600
#define _XOPEN_SOURCE 600 /* Get nftw() and S_IFSOCK declarations */
#endif

#include <stddef.h>
#include <stdlib.h>
#include <sched.h>
#include <string.h>
#include <pwd.h>
#include <glob.h>
#include <ftw.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdbool.h>
#include <errno.h>
#include <unistd.h>
#include <ctype.h>
#include <limits.h>


#if defined(IMRAA)
#include <json-c/json.h>
#include <sys/stat.h>
#include <sys/mman.h>
#endif

#include "mraa_internal.h"
#include "firmata/firmata_mraa.h"
#include "gpio.h"
#include "version.h"
#include "i2c.h"
#include "pwm.h"
#include "aio.h"
#include "spi.h"
#include "uart.h"

#define IIO_DEVICE_WILDCARD "iio:device*"


mraa_board_t* plat = NULL;
mraa_iio_info_t* plat_iio = NULL;
mraa_lang_func_t* lang_func = NULL;

char* platform_name = NULL;

static int num_i2c_devices = 0;
static int num_iio_devices = 0;

const char*
mraa_get_version()
{
    return gVERSION;
}

mraa_result_t
mraa_set_log_level(int level)
{
    if (level <= 7 && level >= 0) {
        setlogmask(LOG_UPTO(level));
        syslog(LOG_DEBUG, "Loglevel %d is set", level);
        return MRAA_SUCCESS;
    }
    syslog(LOG_NOTICE, "Invalid loglevel %d requested", level);
    return MRAA_ERROR_INVALID_PARAMETER;
}

/**
 * Whilst the actual mraa init function is now called imraa_init, it's only
 * callable externally if IMRAA is enabled
 */
mraa_result_t
imraa_init()
{
    if (plat != NULL) {
        return MRAA_SUCCESS;
    }
    char* env_var;
    mraa_result_t ret;
    mraa_platform_t platform_type = MRAA_NULL_PLATFORM;
    uid_t proc_euid = geteuid();
    struct passwd* proc_user = getpwuid(proc_euid);

#ifdef DEBUG
    setlogmask(LOG_UPTO(LOG_DEBUG));
#else
    setlogmask(LOG_UPTO(LOG_NOTICE));
#endif

    openlog("libmraa", LOG_CONS | LOG_PID | LOG_NDELAY, LOG_LOCAL1);
    syslog(LOG_NOTICE, "libmraa version %s initialised by user '%s' with EUID %d",
           mraa_get_version(), (proc_user != NULL) ? proc_user->pw_name : "<unknown>", proc_euid);

    // Check to see if the enviroment variable has been set
    env_var = getenv(MRAA_JSONPLAT_ENV_VAR);
    if (env_var != NULL) {
        // We only care about success, the init will write to syslog if things went wrong
        switch ((ret = mraa_init_json_platform(env_var))) {
            case MRAA_SUCCESS:
                platform_type = plat->platform_type;
                break;
            default:
                syslog(LOG_NOTICE, "libmraa was unable to initialise a platform from json");
        }
    }

    // Not an else because if the env var didn't load what we wanted maybe we can still load something
    if (platform_type == MRAA_NULL_PLATFORM) {
#if defined(X86PLAT)
        // Use runtime x86 platform detection
        platform_type = mraa_x86_platform();
#elif defined(ARMPLAT)
        // Use runtime ARM platform detection
        platform_type = mraa_arm_platform();
#elif defined(MOCKPLAT)
        // Use mock platform
        platform_type = mraa_mock_platform();
#else
#error mraa_ARCH NOTHING
#endif
    }

    if (plat != NULL) {
        plat->platform_type = platform_type;
    } else {
        platform_name = NULL;
    }

    // Create null base platform if one doesn't already exist
    if (plat == NULL) {
        plat = (mraa_board_t*) calloc(1, sizeof(mraa_board_t));
        if (plat != NULL) {
            plat->platform_type = MRAA_NULL_PLATFORM;
            plat->platform_name = "Unknown platform";
        }
    }

#if defined(USBPLAT)
    // Now detect sub platform, note this is not an else since we could be in
    // an error case and fall through to MRAA_ERROR_PLATFORM_NOT_INITIALISED
    if (plat != NULL) {
        mraa_platform_t usb_platform_type = mraa_usb_platform_extender(plat);
        // if we have no known platform just replace usb platform with platform
        if (plat->platform_type == MRAA_UNKNOWN_PLATFORM && usb_platform_type != MRAA_UNKNOWN_PLATFORM) {
            plat->platform_type = usb_platform_type;
        }
    }
    if (plat == NULL) {
        printf("mraa: FATAL error, failed to initialise platform\n");
        return MRAA_ERROR_PLATFORM_NOT_INITIALISED;
    }
#endif

#if defined(IMRAA)
    const char* subplatform_lockfile = "/tmp/imraa.lock";
    mraa_add_from_lockfile(subplatform_lockfile);
#endif

    // Look for IIO devices
    mraa_iio_detect();

    if (plat != NULL) {
        int length = strlen(plat->platform_name) + 1;
        if (mraa_has_sub_platform()) {
            // Account for ' + ' chars
            length += strlen(plat->sub_platform->platform_name) + 3;
        }
        platform_name = calloc(length, sizeof(char));
        if (mraa_has_sub_platform()) {
            snprintf(platform_name, length, "%s + %s", plat->platform_name, plat->sub_platform->platform_name);
        } else {
            strncpy(platform_name, plat->platform_name, length);
        }
    }

    lang_func = (mraa_lang_func_t*) calloc(1, sizeof(mraa_lang_func_t));
    if (lang_func == NULL) {
        return MRAA_ERROR_NO_RESOURCES;
    }

    syslog(LOG_NOTICE, "libmraa initialised for platform '%s' of type %d", mraa_get_platform_name(), mraa_get_platform_type());
    return MRAA_SUCCESS;
}

#if (defined SWIGPYTHON) || (defined SWIG)
mraa_result_t
#else
mraa_result_t __attribute__((constructor))
#endif
mraa_init()
{
    if (plat != NULL) {
        return MRAA_SUCCESS;
    } else {
        return imraa_init();
    }
}

void
mraa_deinit()
{
    int i = 0;
    if (plat != NULL) {
        if (plat->pins != NULL) {
            free(plat->pins);
        }
        mraa_board_t* sub_plat = plat->sub_platform;
        if (sub_plat != NULL) {
            if (sub_plat->pins != NULL) {
                free(sub_plat->pins);
            }
            free(sub_plat);
        }
#if defined(JSONPLAT)
        if (plat->platform_type == MRAA_JSON_PLATFORM) {
            // Free the platform name
            free(plat->platform_name);

            // Free the UART device path
            for (i = 0; i < plat->uart_dev_count; i++) {
                if (plat->uart_dev[i].device_path != NULL) {
                    free(plat->uart_dev[i].device_path);
                }
            }
        }
#endif
        free(plat);

    }
    if (plat_iio != NULL) {
        free(plat_iio);
    }
    closelog();
}

int
mraa_set_priority(const int priority)
{
    struct sched_param sched_s;

    memset(&sched_s, 0, sizeof(struct sched_param));
    if (priority > sched_get_priority_max(SCHED_RR)) {
        sched_s.sched_priority = sched_get_priority_max(SCHED_RR);
    } else {
        sched_s.sched_priority = priority;
    }

    return sched_setscheduler(0, SCHED_RR, &sched_s);
}

static int
mraa_count_iio_devices(const char* path, const struct stat* sb, int flag, struct FTW* ftwb)
{
    // we are only interested in files with specific names
    if (fnmatch(IIO_DEVICE_WILDCARD, basename(path), 0) == 0) {
        num_iio_devices++;
    }
    return 0;
}

mraa_result_t
mraa_iio_detect()
{
    plat_iio = (mraa_iio_info_t*) calloc(1, sizeof(mraa_iio_info_t));
    plat_iio->iio_device_count = num_iio_devices;
    // Now detect IIO devices, linux only
    // find how many iio devices we have if we haven't already
    if (num_iio_devices == 0) {
        if (nftw("/sys/bus/iio/devices", &mraa_count_iio_devices, 20, FTW_PHYS) == -1) {
            return MRAA_ERROR_UNSPECIFIED;
        }
    }
    char name[64], filepath[64];
    int fd, len, i;
    plat_iio->iio_device_count = num_iio_devices;
    plat_iio->iio_devices = calloc(num_iio_devices, sizeof(struct _iio));
    struct _iio* device;
    for (i=0; i < num_iio_devices; i++) {
        device = &plat_iio->iio_devices[i];
        device->num = i;
        snprintf(filepath, 64, "/sys/bus/iio/devices/iio:device%d/name", i);
        fd = open(filepath, O_RDONLY);
        if (fd != -1) {
            len = read(fd, &name, 64);
            if (len > 1) {
                // remove any trailing CR/LF symbols
                name[strcspn(name, "\r\n")] = '\0';
                len = strlen(name);
                // use strndup
                device->name = malloc((sizeof(char) * len) + sizeof(char));
                strncpy(device->name, name, len+1);
            }
            close(fd);
        }
    }
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_setup_mux_mapped(mraa_pin_t meta)
{
    unsigned int mi;
    mraa_result_t ret;
    mraa_gpio_context mux_i = NULL;
    // avoids the unsigned comparison and we should never have a pin that is UINT_MAX!
    unsigned int last_pin = UINT_MAX;

    for (mi = 0; mi < meta.mux_total; mi++) {

        switch(meta.mux[mi].pincmd) {
            case PINCMD_UNDEFINED:              // used for backward compatibility
                if(meta.mux[mi].pin != last_pin) {
                    if (mux_i != NULL) {
                        mraa_gpio_owner(mux_i, 0);
                        mraa_gpio_close(mux_i);
                    }
                    mux_i = mraa_gpio_init_raw(meta.mux[mi].pin);
                    if (mux_i == NULL) return MRAA_ERROR_INVALID_HANDLE;
                    last_pin = meta.mux[mi].pin;
                }
                // this function will sometimes fail, however this is not critical as
                // long as the write succeeds - Test case galileo gen2 pin2
                mraa_gpio_dir(mux_i, MRAA_GPIO_OUT);
                ret = mraa_gpio_write(mux_i, meta.mux[mi].value);
                if(ret != MRAA_SUCCESS) {
                    if (mux_i != NULL) {
                        mraa_gpio_owner(mux_i, 0);
                        mraa_gpio_close(mux_i);
                    }
                    return MRAA_ERROR_INVALID_RESOURCE;
                }
                break;

            case PINCMD_SET_VALUE:
                if(meta.mux[mi].pin != last_pin) {
                    if (mux_i != NULL) {
                        mraa_gpio_owner(mux_i, 0);
                        mraa_gpio_close(mux_i);
                    }
                    mux_i = mraa_gpio_init_raw(meta.mux[mi].pin);
                    if (mux_i == NULL) return MRAA_ERROR_INVALID_HANDLE;
                    last_pin = meta.mux[mi].pin;
                }

                ret = mraa_gpio_write(mux_i, meta.mux[mi].value);

                if(ret != MRAA_SUCCESS) {
                    if (mux_i != NULL) {
                        mraa_gpio_owner(mux_i, 0);
                        mraa_gpio_close(mux_i);
                    }
                    return MRAA_ERROR_INVALID_RESOURCE;
                }
                break;

            case PINCMD_SET_DIRECTION:
                if(meta.mux[mi].pin != last_pin) {
                    if (mux_i != NULL) {
                        mraa_gpio_owner(mux_i, 0);
                        mraa_gpio_close(mux_i);
                    }
                    mux_i = mraa_gpio_init_raw(meta.mux[mi].pin);
                    if (mux_i == NULL) return MRAA_ERROR_INVALID_HANDLE;
                    last_pin = meta.mux[mi].pin;
                }

                ret = mraa_gpio_dir(mux_i, meta.mux[mi].value);

                if(ret != MRAA_SUCCESS) {
                    if (mux_i != NULL) {
                        mraa_gpio_owner(mux_i, 0);
                        mraa_gpio_close(mux_i);
                    }
                    return MRAA_ERROR_INVALID_RESOURCE;
                }
                break;

            case PINCMD_SET_IN_VALUE:
                if(meta.mux[mi].pin != last_pin) {
                    if (mux_i != NULL) {
                        mraa_gpio_owner(mux_i, 0);
                        mraa_gpio_close(mux_i);
                    }
                    mux_i = mraa_gpio_init_raw(meta.mux[mi].pin);
                    if (mux_i == NULL) return MRAA_ERROR_INVALID_HANDLE;
                    last_pin = meta.mux[mi].pin;
                }

                ret = mraa_gpio_dir(mux_i, MRAA_GPIO_IN);

                if(ret == MRAA_SUCCESS)
                    ret = mraa_gpio_write(mux_i, meta.mux[mi].value);

                if(ret != MRAA_SUCCESS) {
                    if (mux_i != NULL) {
                        mraa_gpio_owner(mux_i, 0);
                        mraa_gpio_close(mux_i);
                    }
                    return MRAA_ERROR_INVALID_RESOURCE;
                }
                break;

            case PINCMD_SET_OUT_VALUE:
                if(meta.mux[mi].pin != last_pin) {
                    if (mux_i != NULL) {
                        mraa_gpio_owner(mux_i, 0);
                        mraa_gpio_close(mux_i);
                    }
                    mux_i = mraa_gpio_init_raw(meta.mux[mi].pin);
                    if (mux_i == NULL) return MRAA_ERROR_INVALID_HANDLE;
                    last_pin = meta.mux[mi].pin;
                }

                ret = mraa_gpio_dir(mux_i, MRAA_GPIO_OUT);

                if(ret == MRAA_SUCCESS)
                    ret = mraa_gpio_write(mux_i, meta.mux[mi].value);

                if(ret != MRAA_SUCCESS) {
                    if (mux_i != NULL) {
                        mraa_gpio_owner(mux_i, 0);
                        mraa_gpio_close(mux_i);
                    }
                    return MRAA_ERROR_INVALID_RESOURCE;
                }
                break;

            case PINCMD_SET_MODE:
                if(meta.mux[mi].pin != last_pin) {
                    if (mux_i != NULL) {
                        mraa_gpio_owner(mux_i, 0);
                        mraa_gpio_close(mux_i);
                    }
                    mux_i = mraa_gpio_init_raw(meta.mux[mi].pin);
                    if (mux_i == NULL) return MRAA_ERROR_INVALID_HANDLE;
                    last_pin = meta.mux[mi].pin;
                }

                ret = mraa_gpio_mode(mux_i, meta.mux[mi].value);

                if(ret != MRAA_SUCCESS) {
                    if (mux_i != NULL) {
                        mraa_gpio_owner(mux_i, 0);
                        mraa_gpio_close(mux_i);
                    }
                    return MRAA_ERROR_INVALID_RESOURCE;
                }
                break;

            case PINCMD_SKIP:
                break;

            default:
                syslog(LOG_NOTICE, "mraa_setup_mux_mapped: wrong command %d on pin %d with value %d", meta.mux[mi].pincmd, meta.mux[mi].pin, meta.mux[mi].value);
                break;
        }
    }

    if (mux_i != NULL) {
        mraa_gpio_owner(mux_i, 0);
        mraa_gpio_close(mux_i);
    }

    return MRAA_SUCCESS;
}

void
mraa_result_print(mraa_result_t result)
{
    switch (result) {
        case MRAA_SUCCESS:
            fprintf(stdout, "MRAA: SUCCESS\n");
            break;
        case MRAA_ERROR_FEATURE_NOT_IMPLEMENTED:
            fprintf(stdout, "MRAA: Feature not implemented.\n");
            break;
        case MRAA_ERROR_FEATURE_NOT_SUPPORTED:
            fprintf(stdout, "MRAA: Feature not supported by Hardware.\n");
            break;
        case MRAA_ERROR_INVALID_VERBOSITY_LEVEL:
            fprintf(stdout, "MRAA: Invalid verbosity level.\n");
            break;
        case MRAA_ERROR_INVALID_PARAMETER:
            fprintf(stdout, "MRAA: Invalid parameter.\n");
            break;
        case MRAA_ERROR_INVALID_HANDLE:
            fprintf(stdout, "MRAA: Invalid Handle.\n");
            break;
        case MRAA_ERROR_NO_RESOURCES:
            fprintf(stdout, "MRAA: No resources.\n");
            break;
        case MRAA_ERROR_INVALID_RESOURCE:
            fprintf(stdout, "MRAA: Invalid resource.\n");
            break;
        case MRAA_ERROR_INVALID_QUEUE_TYPE:
            fprintf(stdout, "MRAA: Invalid Queue Type.\n");
            break;
        case MRAA_ERROR_NO_DATA_AVAILABLE:
            fprintf(stdout, "MRAA: No Data available.\n");
            break;
        case MRAA_ERROR_INVALID_PLATFORM:
            fprintf(stdout, "MRAA: Platform not recognised.\n");
            break;
        case MRAA_ERROR_PLATFORM_NOT_INITIALISED:
            fprintf(stdout, "MRAA: Platform not initialised.\n");
            break;
        case MRAA_ERROR_UART_OW_SHORTED:
            fprintf(stdout, "MRAA: UART OW: Bus short detected.\n");
            break;
        case MRAA_ERROR_UART_OW_NO_DEVICES:
            fprintf(stdout, "MRAA: UART OW: No devices detected on bus.\n");
            break;
        case MRAA_ERROR_UART_OW_DATA_ERROR:
            fprintf(stdout, "MRAA: UART OW: Data or Bus error detected.\n");
            break;
        case MRAA_ERROR_UNSPECIFIED:
            fprintf(stdout, "MRAA: Unspecified Error.\n");
            break;
        default:
            fprintf(stdout, "MRAA: Unrecognised error.\n");
            break;
    }
}


mraa_boolean_t
mraa_has_sub_platform()
{
    return (plat != NULL) && (plat->sub_platform != NULL);
}

mraa_boolean_t
mraa_pin_mode_test(int pin, mraa_pinmodes_t mode)
{
    if (plat == NULL)
        return 0;

    mraa_board_t* current_plat = plat;
    if (mraa_is_sub_platform_id(pin)) {
        current_plat = plat->sub_platform;
        if (current_plat == NULL) {
            syslog(LOG_ERR, "mraa_pin_mode_test: Sub platform Not Initialised");
            return 0;
        }
        pin = mraa_get_sub_platform_index(pin);
    }

    if (current_plat == NULL || current_plat->platform_type == MRAA_UNKNOWN_PLATFORM || current_plat->platform_type == MRAA_NULL_PLATFORM) {
        return 0;
    }
    if (pin > (current_plat->phy_pin_count - 1) || pin < 0)
        return 0;

    switch (mode) {
        case MRAA_PIN_VALID:
            if (current_plat->pins[pin].capabilities.valid == 1)
                return 1;
            break;
        case MRAA_PIN_GPIO:
            if (current_plat->pins[pin].capabilities.gpio == 1)
                return 1;
            break;
        case MRAA_PIN_PWM:
            if (current_plat->pins[pin].capabilities.pwm == 1)
                return 1;
            break;
        case MRAA_PIN_FAST_GPIO:
            if (current_plat->pins[pin].capabilities.fast_gpio == 1)
                return 1;
            break;
        case MRAA_PIN_SPI:
            if (current_plat->pins[pin].capabilities.spi == 1)
                return 1;
            break;
        case MRAA_PIN_I2C:
            if (current_plat->pins[pin].capabilities.i2c == 1)
                return 1;
            break;
        case MRAA_PIN_AIO:
            if (current_plat->pins[pin].capabilities.aio == 1)
                return 1;
            break;
        case MRAA_PIN_UART:
            if (current_plat->pins[pin].capabilities.uart == 1)
                return 1;
            break;
        default:
            syslog(LOG_NOTICE, "requested pinmode invalid");
            break;
    }
    return 0;
}

mraa_platform_t
mraa_get_platform_type()
{
    if (plat == NULL)
        return MRAA_UNKNOWN_PLATFORM;
    return plat->platform_type;
}

int
mraa_get_platform_combined_type()
{
    int type = mraa_get_platform_type();
    int sub_type = mraa_has_sub_platform() ? plat->sub_platform->platform_type : MRAA_UNKNOWN_PLATFORM;
    return type | (sub_type << 8);
}

unsigned int
mraa_adc_raw_bits()
{
    if (plat == NULL)
        return 0;

    if (plat->aio_count == 0)
        return 0;

    return plat->adc_raw;
}

unsigned int
mraa_get_platform_adc_raw_bits(uint8_t platform_offset)
{
    if (platform_offset == MRAA_MAIN_PLATFORM_OFFSET)
        return mraa_adc_raw_bits();
    else {
        if (!mraa_has_sub_platform())
            return 0;

        if (plat->sub_platform->aio_count == 0)
            return 0;

        return plat->sub_platform->adc_raw;
    }
}


unsigned int
mraa_adc_supported_bits()
{
    if (plat == NULL)
        return 0;

    if (plat->aio_count == 0)
        return 0;

    return plat->adc_supported;
}

unsigned int
mraa_get_platform_adc_supported_bits(int platform_offset)
{
    if (platform_offset == MRAA_MAIN_PLATFORM_OFFSET)
        return mraa_adc_supported_bits();
    else {
        if (!mraa_has_sub_platform())
            return 0;

        if (plat->sub_platform->aio_count == 0)
            return 0;

        return plat->sub_platform->adc_supported;
    }
}

const char*
mraa_get_platform_name()
{
    return platform_name;
}

const char*
mraa_get_platform_version(int platform_offset)
{
    if (plat == NULL) {
        return NULL;
    }
    if (platform_offset == MRAA_MAIN_PLATFORM_OFFSET) {
        return plat->platform_version;
    } else {
        return plat->sub_platform->platform_version;
    }
}

int
mraa_get_i2c_bus_count()
{
    if (plat == NULL) {
        return -1;
    }
    return plat->i2c_bus_count;
}

int
mraa_get_i2c_bus_id(int i2c_bus)
{
    if (plat == NULL) {
        return -1;
    }

    if (i2c_bus >= plat->i2c_bus_count) {
        return -1;
    }

    return plat->i2c_bus[i2c_bus].bus_id;
}

unsigned int
mraa_get_pin_count()
{
    if (plat == NULL) {
        return 0;
    }
    return plat->phy_pin_count;
}

unsigned int
mraa_get_platform_pin_count(uint8_t platform_offset)
{
    if (platform_offset == MRAA_MAIN_PLATFORM_OFFSET)
        return mraa_get_pin_count();
    else {
        if (mraa_has_sub_platform())
           return plat->sub_platform->phy_pin_count;
        else
           return 0;
    }
}


char*
mraa_get_pin_name(int pin)
{
    if (plat == NULL)
        return 0;

    mraa_board_t* current_plat = plat;
    if (mraa_is_sub_platform_id(pin)) {
        current_plat = plat->sub_platform;
        if (current_plat == NULL) {
            syslog(LOG_ERR, "mraa_get_pin_name: Sub platform Not Initialised");
            return 0;
        }
        pin = mraa_get_sub_platform_index(pin);
    }

    if (pin > (current_plat->phy_pin_count - 1) || pin < 0)
        return NULL;
    return (char*) current_plat->pins[pin].name;
}

int
mraa_get_default_i2c_bus(uint8_t platform_offset)
{
    if (plat == NULL)
        return -1;
    if (platform_offset == MRAA_MAIN_PLATFORM_OFFSET) {
        return plat->def_i2c_bus;
    } else {
        if (mraa_has_sub_platform())
           return plat->sub_platform->def_i2c_bus;
        else
           return -1;
    }
}


mraa_boolean_t
mraa_file_exist(const char* filename)
{
    glob_t results;
    results.gl_pathc = 0;
    glob(filename, 0, NULL, &results);
    int file_found = results.gl_pathc == 1;
    globfree(&results);
    return file_found;
}

mraa_boolean_t
mraa_file_contains(const char* filename, const char* content)
{
    mraa_boolean_t found = 0;
    if ((filename == NULL) || (content == NULL)) {
        return 0;
    }

    char* file = mraa_file_unglob(filename);
    if (file != NULL) {
        size_t len = 1024;
        char* line = calloc(len, sizeof(char));
        if (line == NULL) {
            free(file);
            return 0;
        }
        FILE* fh = fopen(file, "r");
        if (fh == NULL) {
            free(file);
            free(line);
            return 0;
        }
        while ((getline(&line, &len, fh) != -1) && (found == 0)) {
            if (strstr(line, content)) {
                found = 1;
                break;
            }
        }
        fclose(fh);
        free(file);
        free(line);
    }
    return found;
}

mraa_boolean_t
mraa_file_contains_both(const char* filename, const char* content, const char* content2)
{
    mraa_boolean_t found = 0;
    if ((filename == NULL) || (content == NULL)) {
        return 0;
    }

    char* file = mraa_file_unglob(filename);
    if (file != NULL) {
        size_t len = 1024;
        char* line = calloc(len, sizeof(char));
        if (line == NULL) {
            free(file);
            return 0;
        }
        FILE* fh = fopen(file, "r");
        if (fh == NULL) {
            free(file);
            free(line);
            return 0;
        }
        while ((getline(&line, &len, fh) != -1) && (found == 0)) {
            if (strstr(line, content) && strstr(line, content2)) {
                found = 1;
                break;
            }
        }
        fclose(fh);
        free(file);
        free(line);
    }
    return found;
}

char*
mraa_file_unglob(const char* filename)
{
    glob_t results;
    char* res = NULL;
    results.gl_pathc = 0;
    glob(filename, 0, NULL, &results);
    if (results.gl_pathc == 1)
        res = strdup(results.gl_pathv[0]);
    globfree(&results);
    return res;
}

mraa_boolean_t
mraa_link_targets(const char* filename, const char* targetname)
{
    int size = 100;
    int nchars = 0;
    char* buffer = NULL;
    while (nchars == 0) {
        buffer = (char*) realloc(buffer, size);
        if (buffer == NULL)
            return 0;
        nchars = readlink(filename, buffer, size);
        if (nchars < 0) {
            free(buffer);
            return 0;
        } else {
            buffer[nchars] = '\0';
        }
        if (nchars >= size) {
            size *= 2;
            nchars = 0;
        }
    }
    if (strstr(buffer, targetname)) {
        free(buffer);
        return 1;
    } else {
        free(buffer);
        return 0;
    }
}

static int
mraa_count_i2c_files(const char* path, const struct stat* sb, int flag, struct FTW* ftwb)
{
    switch (sb->st_mode & S_IFMT) {
        case S_IFLNK:
            num_i2c_devices++;
            break;
    }
    return 0;
}

int
mraa_find_i2c_bus(const char* devname, int startfrom)
{
    char path[64];
    int fd;
    int i = startfrom;
    int ret = -1;

    // because feeding mraa_find_i2c_bus result back into the function is
    // useful treat -1 as 0
    if (startfrom < 0) {
        startfrom = 0;
    }

    // find how many i2c buses we have if we haven't already
    if (num_i2c_devices == 0) {
        if (nftw("/sys/class/i2c-dev/", &mraa_count_i2c_files, 20, FTW_PHYS) == -1) {
            return -1;
        }
    }

    // i2c devices are numbered numerically so 0 must exist otherwise there is
    // no i2c-dev loaded
    if (mraa_file_exist("/sys/class/i2c-dev/i2c-0")) {
        for (;i < num_i2c_devices; i++) {
            off_t size, err;
            snprintf(path, 64, "/sys/class/i2c-dev/i2c-%u/name", i);
            fd = open(path, O_RDONLY);
            if (fd < 0) {
                break;
            }
            size = lseek(fd, 0, SEEK_END);
            if (size < 0) {
                syslog(LOG_WARNING, "mraa: failed to seek i2c filename file");
                close(fd);
                break;
            }
            err = lseek(fd, 0, SEEK_SET);
            if (err < 0) {
                syslog(LOG_WARNING, "mraa: failed to seek i2c filename file");
                close(fd);
                break;
            }
            char* value = malloc(size);
            if (value == NULL) {
                syslog(LOG_ERR, "mraa: failed to allocate memory for i2c file");
                close(fd);
                break;
            }
            ssize_t r = read(fd, value, size);
            if (r > 0) {
                if (strcasestr(value, devname) != NULL) {
                    free(value);
                    close(fd);
                    return i;
                }
            } else {
                syslog(LOG_ERR, "mraa: sysfs i2cdev failed");
            }
            free(value);
            close(fd);
        }
    } else {
        syslog(LOG_WARNING, "mraa: no i2c-dev detected, load i2c-dev");
    }

    return ret;
}

mraa_boolean_t
mraa_is_sub_platform_id(int pin_or_bus)
{
    return (pin_or_bus & MRAA_SUB_PLATFORM_MASK) != 0;
}

int
mraa_get_sub_platform_id(int pin_or_bus)
{
    return pin_or_bus | MRAA_SUB_PLATFORM_MASK;
}

int
mraa_get_sub_platform_index(int pin_or_bus)
{
    return pin_or_bus & (~MRAA_SUB_PLATFORM_MASK);
}

int
mraa_get_iio_device_count()
{
    return plat_iio->iio_device_count;
}

mraa_result_t
mraa_add_subplatform(mraa_platform_t subplatformtype, const char* uart_dev)
{
#if defined(FIRMATA)
    if (subplatformtype == MRAA_GENERIC_FIRMATA) {
        if (plat->sub_platform != NULL) {
            return MRAA_ERROR_INVALID_PARAMETER;
        }
        if (mraa_firmata_platform(plat, uart_dev) == MRAA_GENERIC_FIRMATA) {
            syslog(LOG_NOTICE, "mraa: Added firmata subplatform");
            return MRAA_SUCCESS;
        }
        syslog(LOG_NOTICE, "mraa: Failed to add firmata subplatform");
    }
#endif

    return MRAA_ERROR_INVALID_PARAMETER;
}

mraa_result_t
mraa_remove_subplatform(mraa_platform_t subplatformtype)
{
#if defined(FIRMATA)
    if (subplatformtype == MRAA_GENERIC_FIRMATA) {
        if (plat == NULL || plat->sub_platform == NULL) {
            return MRAA_ERROR_INVALID_PARAMETER;
        }
        free(plat->sub_platform->adv_func);
        free(plat->sub_platform->pins);
        free(plat->sub_platform);
    }
#endif
    return MRAA_ERROR_INVALID_PARAMETER;
}

#if defined(IMRAA)
mraa_result_t
mraa_add_from_lockfile(const char* imraa_lock_file)
{
    mraa_result_t ret = MRAA_SUCCESS;
    mraa_platform_t type = plat->platform_type;
    char* buffer = NULL;
    off_t file_size;
    struct stat st;
    int i = 0;
    uint32_t subplat_num = 0;
    int flock = open(imraa_lock_file, O_RDONLY);
    if (flock == -1) {
        syslog(LOG_ERR, "imraa: Failed to open lock file");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    if (fstat(flock, &st) != 0 || (!S_ISREG(st.st_mode))) {
        close(flock);
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    buffer = mmap(0, st.st_size, PROT_READ, MAP_SHARED, flock, 0);
    close(flock);
    if (buffer == MAP_FAILED) {
        syslog(LOG_ERR, "imraa: lockfile read error");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    json_object* jobj_lock = json_tokener_parse(buffer);

    struct json_object* ioarray;
    if (json_object_object_get_ex(jobj_lock, "Platform", &ioarray) == true &&
        json_object_is_type(ioarray, json_type_array)) {
        subplat_num = json_object_array_length(ioarray);
        int id = -1;
        const char* uartdev = NULL;
        for (i = 0; i < subplat_num; i++) {
            struct json_object *ioobj = json_object_array_get_idx(ioarray, i);
            json_object_object_foreach(ioobj, key, val) {
                if (strcmp(key, "id") == 0) {
                    id = atoi(json_object_get_string(val));
                } else if (strcmp(key, "uart") == 0) {
                    uartdev = json_object_get_string(val);
                }
            }
            if (id != -1 && id != MRAA_NULL_PLATFORM && id != MRAA_UNKNOWN_PLATFORM && uartdev != NULL) {
                if (mraa_add_subplatform(id, uartdev) == MRAA_SUCCESS) {
                    syslog(LOG_NOTICE, "imraa: automatically added subplatform %d, %s", id, uartdev);
                } else {
                    syslog(LOG_ERR, "imraa: Failed to add subplatform (%d on %s) from lockfile", id, uartdev);
                }
                id = -1;
                uartdev = NULL;
            }
        }
    } else {
        ret = MRAA_ERROR_INVALID_RESOURCE;
    }
    json_object_put(jobj_lock);
    munmap(buffer, st.st_size);
    return ret;
}
#endif

void
mraa_to_upper(char* s)
{
    char* t = s;
    for (; *t; ++t) {
        *t = toupper(*t);
    }
}

mraa_result_t
mraa_atoi(char* intStr, int* value)
{
    char* end;
    // here 10 determines the number base in which strol is to work
    long val = strtol(intStr, &end, 10);
    if (*end != '\0' || errno == ERANGE || end == intStr || val > INT_MAX || val < INT_MIN) {
        *value = 0;
        return MRAA_ERROR_UNSPECIFIED;
    }
    *value = (int) val;
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_init_io_helper(char** str, int* value, const char* delim)
{
    // This function is a result of a repeated pattern within mraa_init_io
    // when determining if a value can be derived from a string
    char* token;
    token = strsep(str, delim);
    // check to see if empty string returned
    if (token == NULL) {
        *value = 0;
        return MRAA_ERROR_NO_DATA_AVAILABLE;
    }
    return mraa_atoi(token, value);
}

void*
mraa_init_io(const char* desc)
{
    const char* delim = "-";
    int length = 0, raw = 0;
    int pin = 0, id = 0;
    // 256 denotes the maximum size of our buffer
    // 8 denotes the maximum size of our type rounded to the nearest power of 2
    // max size is 4 + 1 for the \0 = 5 rounded to 8
    char buffer[256] = { 0 }, type[8] = { 0 };
    char *token = 0, *str = 0;
    if (desc == NULL) {
        return NULL;
    }
    length = strlen(desc);
    // Check to see the length is less than or equal to 255 which means
    // byte 256 is supposed to be \0
    if (length > 255 || length == 0) {
        return NULL;
    }
    strncpy(buffer, desc, length);

    str = buffer;
    token = strsep(&str, delim);
    length = strlen(token);
    // Check to see they haven't given us a type whose length is greater than the
    // largest type we know about
    if (length > 4) {
        syslog(LOG_ERR, "mraa_init_io: An invalid IO type was provided");
        return NULL;
    }
    strncpy(type, token, length);
    mraa_to_upper(type);
    token = strsep(&str, delim);
    // Check that they've given us more information than just the type
    if (token == NULL) {
        syslog(LOG_ERR, "mraa_init_io: Missing information after type");
        return NULL;
    }
    // If we cannot convert the pin to a number maybe it says raw?
    if (mraa_atoi(token, &pin) != MRAA_SUCCESS) {
        mraa_to_upper(token);
        if (strncmp(token, "RAW", 3)) {
            syslog(LOG_ERR, "mraa_init_io: Description does not adhere to a known format");
            return NULL;
        }
        raw = 1;
    }
    if (!raw && str != NULL) {
        syslog(LOG_ERR, "mraa_init_io: More information than required was provided");
        return NULL;
    }

    if (strncmp(type, GPIO_KEY, strlen(GPIO_KEY)) == 0) {
        if (raw) {
            if (mraa_init_io_helper(&str, &pin, delim) == MRAA_SUCCESS) {
                return (void*) mraa_gpio_init_raw(pin);
            }
            syslog(LOG_ERR, "mraa_init_io: Invalid Raw description for GPIO");
            return NULL;
        }
        return (void*) mraa_gpio_init(pin);
    } else if (strncmp(type, I2C_KEY, strlen(I2C_KEY)) == 0) {
        if (raw) {
            if (mraa_init_io_helper(&str, &pin, delim) == MRAA_SUCCESS) {
                return (void*) mraa_i2c_init_raw(pin);
            }
            syslog(LOG_ERR, "mraa_init_io: Invalid Raw description for I2C");
            return NULL;
        }
        return (void*) mraa_i2c_init(pin);
    } else if (strncmp(type, AIO_KEY, strlen(AIO_KEY)) == 0) {
        if (raw) {
            syslog(LOG_ERR, "mraa_init_io: Aio doesn't have a RAW mode");
            return NULL;
        }
        return (void*) mraa_aio_init(pin);
    } else if (strncmp(type, PWM_KEY, strlen(PWM_KEY)) == 0) {
        if (raw) {
            if (mraa_init_io_helper(&str, &id, delim) != MRAA_SUCCESS) {
                syslog(LOG_ERR, "mraa_init_io: Pwm, unable to convert the chip id string into a useable Int");
                return NULL;
            }
            if (mraa_init_io_helper(&str, &pin, delim) != MRAA_SUCCESS) {
                syslog(LOG_ERR, "mraa_init_io: Pwm, unable to convert the pin string into a useable Int");
                return NULL;
            }
            return (void*) mraa_pwm_init_raw(id, pin);
        }
        return (void*) mraa_pwm_init(pin);
    } else if (strncmp(type, SPI_KEY, strlen(SPI_KEY)) == 0) {
        if (raw) {
            if (mraa_init_io_helper(&str, &id, delim) != MRAA_SUCCESS) {
                syslog(LOG_ERR, "mraa_init_io: Spi, unable to convert the bus string into a useable Int");
                return NULL;
            }
            if (mraa_init_io_helper(&str, &pin, delim) != MRAA_SUCCESS) {
                syslog(LOG_ERR, "mraa_init_io: Spi, unable to convert the cs string into a useable Int");
                return NULL;
            }
            return (void*) mraa_spi_init_raw(id, pin);
        }
        return (void*) mraa_spi_init(pin);
    } else if (strncmp(type, UART_KEY, strlen(UART_KEY)) == 0) {
        if (raw) {
            return (void*) mraa_uart_init_raw(str);
        }
        return (void*) mraa_uart_init(pin);
    }
    syslog(LOG_ERR, "mraa_init_io: Invalid IO type given.");
    return NULL;
}


#ifndef JSONPLAT
mraa_result_t
mraa_init_json_platform(const char* desc)
{
    return MRAA_ERROR_FEATURE_NOT_SUPPORTED;
}
#endif
