/*
 * Author: Houman Brinjcargorabi <Houman.Brinjcargorabi@intel.com>
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

#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>


#include <json-c/json.h>
#include <sys/stat.h>
#include <sys/mman.h>

#include "mraa_internal.h"

typedef mraa_result_t (*init_plat_func_t)(json_object*, mraa_board_t*, int);

mraa_result_t
mraa_init_json_platform_get_pin(json_object* jobj, const char* io, const char* key, int index, int* pin)
{
    json_object* jobj_temp = NULL;
    if (json_object_object_get_ex(jobj, key, &jobj_temp)) {
        if (!json_object_is_type(jobj_temp, json_type_int)) {
            syslog(LOG_ERR, "init_json_platform: %s %s at position: %d is not an int", io, key, index);
            return MRAA_ERROR_INVALID_RESOURCE;
        }
        *pin = (unsigned int) json_object_get_int(jobj_temp);
        return MRAA_SUCCESS;
    }
    syslog(LOG_ERR, "init_json_platform: No %s specified for %s at position: %d", key, io, index);
    return MRAA_ERROR_NO_DATA_AVAILABLE;
}

mraa_result_t
mraa_init_json_platform_get_index(json_object* jobj, const char* io, const char* key, int index, int* pos, int upper)
{
    json_object* jobj_temp = NULL;
    if (json_object_object_get_ex(jobj, key, &jobj_temp)) {
        if (!json_object_is_type(jobj_temp, json_type_int)) {
            syslog(LOG_ERR, "init_json_platform: %s index at position: %d not an int", io, index);
            return MRAA_ERROR_INVALID_RESOURCE;
        }

        *pos = (int) json_object_get_int(jobj_temp);
        if (*pos < 0 || *pos > upper) {
            syslog(LOG_ERR,
                   "init_json_platform: %s %s at position: %d, gave: %d which was out of range", io,
                   key, index, *pos);
            return MRAA_ERROR_INVALID_RESOURCE;
        }
        return MRAA_SUCCESS;
    }
    syslog(LOG_ERR, "init_json_platform: An %s was not found for the %s", key, io);
    return MRAA_ERROR_NO_DATA_AVAILABLE;
}

mraa_result_t
mraa_init_json_platform_platform(json_object* jobj_platform, mraa_board_t* board, int index)
{
    json_object* jobj_temp = NULL;
    const char* temp_string = NULL;
    int length = 0;
    mraa_result_t ret = MRAA_SUCCESS;

    // Set the platform name
    if (json_object_object_get_ex(jobj_platform, NAME_KEY, &jobj_temp)) {
        if (!json_object_is_type(jobj_temp, json_type_string)) {
            syslog(LOG_ERR, "init_json_platform: Platform name not a string");
            return MRAA_ERROR_NO_RESOURCES;
        }
        temp_string = json_object_get_string(jobj_temp);
        if (temp_string == NULL || (length = strlen(temp_string)) == 0) {
            syslog(LOG_ERR, "init_json_platform: Empty string provided for \"%s\" key in platform", NAME_KEY);
            return MRAA_ERROR_NO_DATA_AVAILABLE;
        }
        board->platform_name = (char*) calloc(length, sizeof(char));
        strncpy(board->platform_name, temp_string, length);
    } else {
        syslog(LOG_ERR, "init_json_platform: No \"%s\" key in platform", NAME_KEY);
        return MRAA_ERROR_NO_DATA_AVAILABLE;
    }

    // Get the physical pincount
    ret = mraa_init_json_platform_get_pin(jobj_platform, PLATFORM_KEY, PIN_COUNT_KEY, index,
                                          &(board->phy_pin_count));
    if (ret != MRAA_SUCCESS) {
        return ret;
    }

    // Setup the pins
    board->pins = (mraa_pininfo_t*) calloc(board->phy_pin_count, sizeof(mraa_pininfo_t));
    if (board->pins == NULL) {
        syslog(LOG_ERR, "init_json_platform: Unable to allocate space for the pins");
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    // set the inital counts to -1 so we know if they don't exist
    board->gpio_count = -1;
    board->aio_count = -1;
    board->uart_dev_count = -1;
    board->i2c_bus_count = -1;
    board->spi_bus_count = -1;

    // Check to see if they've provided a GPIO count
    ret = mraa_init_json_platform_get_index(jobj_platform, PLATFORM_KEY, GPIO_COUNT_KEY, index,
                                            &(board->gpio_count), board->phy_pin_count);
    if (ret != MRAA_SUCCESS && ret != MRAA_ERROR_NO_DATA_AVAILABLE) {
        return ret;
    }

    // Check to see if they've provided a AIO count
    ret = mraa_init_json_platform_get_index(jobj_platform, PLATFORM_KEY, AIO_COUNT_KEY, index,
                                            &(board->aio_count), board->phy_pin_count);
    if (ret != MRAA_SUCCESS && ret != MRAA_ERROR_NO_DATA_AVAILABLE) {
        return ret;
    }

    // Check to see if they've provided a UART count
    ret = mraa_init_json_platform_get_index(jobj_platform, PLATFORM_KEY, UART_COUNT_KEY, index,
                                            &(board->uart_dev_count), 6);
    if (ret != MRAA_SUCCESS && ret != MRAA_ERROR_NO_DATA_AVAILABLE) {
        return ret;
    }
    // Check to see if they've provided a I2C count
    ret = mraa_init_json_platform_get_index(jobj_platform, PLATFORM_KEY, I2C_COUNT_KEY, index,
                                            &(board->i2c_bus_count), 12);
    if (ret != MRAA_SUCCESS && ret != MRAA_ERROR_NO_DATA_AVAILABLE) {
        return ret;
    }
    // Check to see if they've provided a SPI count
    ret = mraa_init_json_platform_get_index(jobj_platform, PLATFORM_KEY, SPI_COUNT_KEY, index,
                                            &(board->spi_bus_count), 12);
    if (ret != MRAA_SUCCESS && ret != MRAA_ERROR_NO_DATA_AVAILABLE) {
        return ret;
    }

    // Set the PWM default numbers
    board->pwm_default_period = -1;
    board->pwm_max_period = -1;
    board->pwm_min_period = -1;

    // Setup the PWM rates if they exist
    ret = mraa_init_json_platform_get_pin(jobj_platform, PLATFORM_KEY, PWMDEFAULT_KEY, index,
                                          &(board->pwm_default_period));
    if (ret != MRAA_SUCCESS && ret != MRAA_ERROR_NO_DATA_AVAILABLE) {
        return ret;
    }
    ret = mraa_init_json_platform_get_pin(jobj_platform, PLATFORM_KEY, PWMMAX_KEY, index,
                                          &(board->pwm_max_period));
    if (ret != MRAA_SUCCESS && ret != MRAA_ERROR_NO_DATA_AVAILABLE) {
        return ret;
    }
    ret = mraa_init_json_platform_get_pin(jobj_platform, PLATFORM_KEY, PWMMIN_KEY, index,
                                          &(board->pwm_min_period));
    if (ret != MRAA_SUCCESS && ret != MRAA_ERROR_NO_DATA_AVAILABLE) {
        return ret;
    }

    // A hacky logical xor to ensure the value's have all been set or none should have been set
    // Here we infer that IF A != B and B != C then A == C since they're working on binary values
    if (((board->pwm_default_period == -1) != (board->pwm_max_period == -1)) ||
        ((board->pwm_min_period == -1) != (board->pwm_max_period == -1))) {
        syslog(LOG_ERR, "init_json_platform: One of more PWM settings missing in the platform"
                        "configuration");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    // Set our platform type
    board->platform_type = MRAA_JSON_PLATFORM;
    board->adv_func = (mraa_adv_func_t*) calloc(1, sizeof(mraa_adv_func_t));
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_init_json_platform_io(json_object* jobj_io, mraa_board_t* board, int index)
{
    const char* temp_string = NULL;
    json_object* jobj_temp = NULL;
    int pos = 0;
    int invalid = 0;
    pos = index;

    // set the label for the IO
    if (json_object_object_get_ex(jobj_io, LABEL_KEY, &jobj_temp)) {
        if (!json_object_is_type(jobj_temp, json_type_string)) {
            syslog(LOG_ERR, "init_json_platform: IO label at position: %d not a string", index);
            return MRAA_ERROR_NO_RESOURCES;
        }
        temp_string = json_object_get_string(jobj_temp);
        // set the gpio label
        strncpy(board->pins[pos].name, temp_string, 8);
    } else {
        syslog(LOG_ERR, "init_json_platform: No IO Label");
        return MRAA_ERROR_INVALID_RESOURCE;
    }
    if (json_object_object_get_ex(jobj_io, INVALID_KEY, &jobj_temp)) {
        if (!json_object_is_type(jobj_temp, json_type_boolean)) {
            syslog(LOG_ERR, "init_json_platform: Default I2C device key has an incorrect value");
            return MRAA_ERROR_INVALID_RESOURCE;
        }
        invalid = json_object_get_boolean(jobj_temp);
    }
    if (invalid) {
        board->pins[pos].capabilities = (mraa_pincapabilities_t){ 0, 0, 0, 0, 0, 0, 0, 0 };
    } else {
        board->pins[pos].capabilities = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 0, 0, 0 };
    }
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_init_json_platform_gpio(json_object* jobj_gpio, mraa_board_t* board, int index)
{
    int pos = 0;
    mraa_result_t ret = MRAA_SUCCESS;

    // Get the gpio index
    ret = mraa_init_json_platform_get_index(jobj_gpio, GPIO_KEY, INDEX_KEY, index, &pos,
                                            board->phy_pin_count - 1);
    if (ret != MRAA_SUCCESS) {
        return ret;
    }
    // Get the gpio sysfs pin;
    ret = mraa_init_json_platform_get_pin(jobj_gpio, GPIO_KEY, RAW_PIN_KEY, index,
                                          &(board->pins[pos].gpio.pinmap));
    if (ret != MRAA_SUCCESS) {
        return ret;
    }
    board->pins[pos].capabilities.gpio = 1;
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_init_json_platform_aio(json_object* jobj_aio, mraa_board_t* board, int index)
{
    int pos = 0;
    mraa_result_t ret = MRAA_SUCCESS;

    // Get the gpio index
    ret = mraa_init_json_platform_get_index(jobj_aio, AIO_KEY, INDEX_KEY, index, &pos, board->phy_pin_count - 1);
    if (ret != MRAA_SUCCESS) {
        return ret;
    }

    // Get the gpio sysfs pin;
    ret = mraa_init_json_platform_get_pin(jobj_aio, AIO_KEY, RAW_PIN_KEY, index,
                                          &(board->pins[pos].aio.pinmap));
    if (ret != MRAA_SUCCESS) {
        return ret;
    }

    board->pins[pos].capabilities.aio = 1;
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_init_json_platform_i2c(json_object* jobj_i2c, mraa_board_t* board, int index)
{
    int pos = 0;
    int pin = 0;
    int sysfs_pin = 0;
    mraa_result_t ret = MRAA_SUCCESS;
    json_object* jobj_temp = NULL;

    // Get the I2C bus array index
    ret = mraa_init_json_platform_get_index(jobj_i2c, I2C_KEY, INDEX_KEY, index, &pos, board->i2c_bus_count - 1);
    if (ret != MRAA_SUCCESS) {
        return ret;
    }
    // Get the sysfs pin
    ret = mraa_init_json_platform_get_pin(jobj_i2c, I2C_KEY, RAW_PIN_KEY, index, &sysfs_pin);
    if (ret != MRAA_SUCCESS) {
        return ret;
    }
    // Setup the sda pin
    ret = mraa_init_json_platform_get_index(jobj_i2c, I2C_KEY, SDAPIN_KEY, index, &pin,
                                            board->phy_pin_count - 1);
    if (ret == MRAA_ERROR_NO_DATA_AVAILABLE) {
        board->i2c_bus[pos].sda = -1;
    } else if (ret == MRAA_SUCCESS) {
        board->pins[pin].capabilities.i2c = 1;
        board->pins[pin].i2c.pinmap = sysfs_pin;
        board->i2c_bus[pos].sda = pin;
    } else {
        return ret;
    }
    // Setup the scl pin
    ret = mraa_init_json_platform_get_index(jobj_i2c, I2C_KEY, SCLPIN_KEY, index, &pin,
                                            board->phy_pin_count - 1);
    if (ret == MRAA_ERROR_NO_DATA_AVAILABLE) {
        board->i2c_bus[pos].scl = -1;
    } else if (ret == MRAA_SUCCESS) {
        board->pins[pin].capabilities.i2c = 1;
        board->pins[pin].i2c.pinmap = sysfs_pin;
        board->i2c_bus[pos].scl = pin;
    } else {
        return ret;
    }

    board->i2c_bus[pos].bus_id = pos;

    // check to see if this i2c is the default one
    if (json_object_object_get_ex(jobj_i2c, DEFAULT_KEY, &jobj_temp)) {
        if (!json_object_is_type(jobj_temp, json_type_boolean)) {
            syslog(LOG_ERR, "init_json_platform: Default I2C device key has an incorrect value");
            return MRAA_ERROR_INVALID_RESOURCE;
        }
        if (json_object_get_boolean(jobj_temp)) {
            board->def_i2c_bus = pos;
        }
    }
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_init_json_platform_pwm(json_object* jobj_pwm, mraa_board_t* board, int index)
{
    int pos = 0;
    int parent_id = 0;
    int sysfs_pin = 0;
    mraa_result_t ret = MRAA_SUCCESS;

    // Get the index into the physical pin array
    ret = mraa_init_json_platform_get_index(jobj_pwm, PWM_KEY, INDEX_KEY, index, &pos, board->phy_pin_count - 1);
    if (ret != MRAA_SUCCESS) {
        return ret;
    }
    // Get the parent id
    ret = mraa_init_json_platform_get_pin(jobj_pwm, PWM_KEY, CHIP_ID_KEY, index, &parent_id);
    if (ret != MRAA_SUCCESS) {
        return ret;
    }
    // Get the sysfs pin
    ret = mraa_init_json_platform_get_pin(jobj_pwm, PWM_KEY, RAW_PIN_KEY, index, &sysfs_pin);
    if (ret != MRAA_SUCCESS) {
        return ret;
    }

    board->pins[pos].capabilities.pwm = 1;
    board->pins[pos].pwm.pinmap = sysfs_pin;
    board->pins[pos].pwm.parent_id = parent_id;
    return ret;
}

mraa_result_t
mraa_init_json_platform_spi(json_object* jobj_spi, mraa_board_t* board, int index)
{
    int pos = 0;
    int pin = 0;
    int parent_id = 0;
    json_object* jobj_temp = NULL;
    mraa_result_t ret = MRAA_SUCCESS;

    // Get the index into the physical pin array
    ret = mraa_init_json_platform_get_index(jobj_spi, SPI_KEY, INDEX_KEY, index, &pos, board->spi_bus_count - 1);
    if (ret != MRAA_SUCCESS) {
        return ret;
    }

    // Get the parent id
    ret = mraa_init_json_platform_get_pin(jobj_spi, SPI_KEY, CHIP_ID_KEY, index, &parent_id);
    if (ret != MRAA_SUCCESS) {
        return ret;
    }

    // Setup the clock pin
    ret = mraa_init_json_platform_get_index(jobj_spi, SPI_KEY, CLOCK_KEY, index, &pin, board->phy_pin_count - 1);
    if (ret == MRAA_ERROR_NO_DATA_AVAILABLE) {
        board->spi_bus[pos].sclk = -1;
    } else if (ret == MRAA_SUCCESS) {
        board->pins[pin].capabilities.spi = 1;
        board->pins[pin].spi.parent_id = parent_id;
        board->spi_bus[pos].sclk = pin;
    } else {
        return ret;
    }
    // Setup the MISO pin
    ret = mraa_init_json_platform_get_index(jobj_spi, SPI_KEY, MISO_KEY, index, &pin, board->phy_pin_count - 1);
    if (ret == MRAA_ERROR_NO_DATA_AVAILABLE) {
        board->spi_bus[pos].miso = -1;
    } else if (ret == MRAA_SUCCESS) {
        board->pins[pin].capabilities.spi = 1;
        board->pins[pin].spi.parent_id = parent_id;
        board->spi_bus[pos].miso = pin;
    } else {
        return ret;
    }
    // Setup the MOSI pin
    ret = mraa_init_json_platform_get_index(jobj_spi, SPI_KEY, MOSI_KEY, index, &pin, board->phy_pin_count - 1);
    if (ret == MRAA_ERROR_NO_DATA_AVAILABLE) {
        board->spi_bus[pos].mosi = -1;
    } else if (ret == MRAA_SUCCESS) {
        board->pins[pin].capabilities.spi = 1;
        board->pins[pin].spi.parent_id = parent_id;
        board->spi_bus[pos].mosi = pin;
    } else {
        return ret;
    }
    // Setup the CS pin
    ret = mraa_init_json_platform_get_index(jobj_spi, SPI_KEY, CS_KEY, index, &pin, board->phy_pin_count - 1);
    if (ret == MRAA_ERROR_NO_DATA_AVAILABLE) {
        board->spi_bus[pos].cs = -1;
    } else if (ret == MRAA_SUCCESS) {
        board->pins[pin].capabilities.spi = 1;
        board->pins[pin].spi.parent_id = parent_id;
        board->spi_bus[pos].cs = pin;
    } else {
        return ret;
    }
    // check to see if this SPI is the default one
    if (json_object_object_get_ex(jobj_spi, DEFAULT_KEY, &jobj_temp)) {
        if (!json_object_is_type(jobj_temp, json_type_boolean)) {
            syslog(LOG_ERR, "init_json_platform: Default I2C device key has an incorrect value");
            return MRAA_ERROR_INVALID_RESOURCE;
        }
        if (json_object_get_boolean(jobj_temp)) {
            board->def_spi_bus = pos;
        }
    }
    return ret;
}

mraa_result_t
mraa_init_json_platform_uart(json_object* jobj_uart, mraa_board_t* board, int index)
{
    json_object* jobj_temp = NULL;
    mraa_result_t ret = MRAA_SUCCESS;
    int pos = 0;
    int pin = 0;
    int sysfs_pin = 0;
    int parent_id = 0;
    int length = 0;
    const char* temp_string = NULL;

    // Get the index into the uart bus
    ret = mraa_init_json_platform_get_index(jobj_uart, UART_KEY, INDEX_KEY, index, &pos,
                                            board->uart_dev_count - 1);
    if (ret != MRAA_SUCCESS) {
        return ret;
    }

    // Get the parent id
    ret = mraa_init_json_platform_get_pin(jobj_uart, UART_KEY, CHIP_ID_KEY, index, &parent_id);
    if (ret != MRAA_SUCCESS) {
        return ret;
    }
    // Get the sysfs pin
    ret = mraa_init_json_platform_get_pin(jobj_uart, UART_KEY, RAW_PIN_KEY, index, &sysfs_pin);
    if (ret != MRAA_SUCCESS) {
        return ret;
    }

    // Setup the rx pin
    ret = mraa_init_json_platform_get_index(jobj_uart, UART_KEY, RXPIN_KEY, index, &pin,
                                            board->phy_pin_count - 1);
    if (ret == MRAA_ERROR_NO_DATA_AVAILABLE) {
        board->uart_dev[pos].rx = -1;
    } else if (ret == MRAA_SUCCESS) {
        board->pins[pin].capabilities.uart = 1;
        board->pins[pin].uart.pinmap = sysfs_pin;
        board->pins[pin].uart.parent_id = parent_id;
        board->uart_dev[pos].rx = pin;
    } else {
        return ret;
    }

    // Setup the TX pin
    ret = mraa_init_json_platform_get_index(jobj_uart, UART_KEY, TXPIN_KEY, index, &pin,
                                            board->phy_pin_count - 1);
    if (ret == MRAA_ERROR_NO_DATA_AVAILABLE) {
        board->uart_dev[pos].tx = -1;
    } else if (ret == MRAA_SUCCESS) {
        board->pins[pin].capabilities.uart = 1;
        board->pins[pin].uart.pinmap = sysfs_pin;
        board->pins[pin].uart.parent_id = parent_id;
        board->uart_dev[pos].tx = pin;
    } else {
        return ret;
    }

    // Setup the path
    if (json_object_object_get_ex(jobj_uart, UART_PATH_KEY, &jobj_temp)) {
        if (!json_object_is_type(jobj_temp, json_type_string)) {
            syslog(LOG_ERR, "init_json_platform: UART Path at index: %d was not a string", index);
            return MRAA_ERROR_NO_RESOURCES;
        }
        temp_string = json_object_get_string(jobj_temp);
        if (temp_string == NULL || (length = strlen(temp_string)) == 0) {
            syslog(LOG_ERR, "init_json_platform: UART Path at index: %d was empty", index);
            return MRAA_ERROR_NO_DATA_AVAILABLE;
        }
        board->uart_dev[pos].device_path = (char*) calloc(length, sizeof(char));
        strncpy(board->uart_dev[pos].device_path, temp_string, length);
    } else {
        syslog(LOG_ERR, "init_json_platform: UART config at index: %d needs a path", index);
        return MRAA_ERROR_NO_DATA_AVAILABLE;
    }

    // If this element is supposed to be default set it.
    if (json_object_object_get_ex(jobj_uart, DEFAULT_KEY, &jobj_temp)) {
        if (!json_object_is_type(jobj_temp, json_type_boolean)) {
            syslog(LOG_ERR, "init_json_platform: Default UART device key has an incorrect value");
            return MRAA_ERROR_INVALID_RESOURCE;
        }
        if (json_object_get_boolean(jobj_temp)) {
            board->def_uart_dev = pos;
        }
    }
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_init_json_platform_loop(json_object* jobj_platform, const char* obj_key, mraa_board_t* board, init_plat_func_t func)
{
    mraa_result_t ret = MRAA_SUCCESS;
    int i = 0, array_length = 0;
    json_object *jobj_temp = NULL, *jobj_io = NULL;
    if (json_object_object_get_ex(jobj_platform, obj_key, &jobj_temp)) {
        array_length = json_object_array_length(jobj_temp);
        for (i = 0; i < array_length; i++) {
            // Get the json object at position i
            jobj_io = json_object_array_get_idx(jobj_temp, i);
            // Check to see it's the right type
            if (!json_object_is_type(jobj_io, json_type_object)) {
                syslog(LOG_ERR, "init_json_platform: One of more of the elements in the \"%s\" "
                                "array where not JSON objects",
                       obj_key);
                return MRAA_ERROR_INVALID_RESOURCE;
            }
            ret = (*func)(jobj_io, board, i);
            if (ret != MRAA_SUCCESS) {
                return ret;
            }
        }
    } else {
        syslog(LOG_ERR, "init_json_platform: No \"%s\" info found in json file", obj_key);
        ret = MRAA_ERROR_NO_DATA_AVAILABLE;
    }
    return ret;
}

mraa_result_t
mraa_init_json_platform_size_check(json_object* jobj_platform,
                                   const char* obj_key,
                                   mraa_board_t* board,
                                   init_plat_func_t func,
                                   int range)
{
    json_object* jobj_temp = NULL;
    mraa_result_t ret = MRAA_SUCCESS;
    int array_length = 0;
    if (json_object_object_get_ex(jobj_platform, obj_key, &jobj_temp)) {
        // Make sure the value for the key is an array
        if (!json_object_is_type(jobj_temp, json_type_array)) {
            syslog(LOG_ERR, "init_json_platform: json key \"%s\" should be an array", obj_key);
            return MRAA_ERROR_INVALID_RESOURCE;
        }
        // make sure we don't have more than our range
        array_length = json_object_array_length(jobj_temp);
        if (array_length > range) {
            syslog(LOG_ERR,
                   "init_json_platform: The size of the %s array given was %d, max was: %d",
                   obj_key, array_length, range);
            return MRAA_ERROR_INVALID_RESOURCE;
        }
        ret = mraa_init_json_platform_loop(jobj_platform, obj_key, board, func);
        if (ret != MRAA_SUCCESS) {
            return ret;
        }
        return MRAA_SUCCESS;
    }
    syslog(LOG_NOTICE, "init_json_platform: %s wasn't found in the json file", obj_key);
    return MRAA_ERROR_NO_DATA_AVAILABLE;
}

mraa_result_t
mraa_init_json_platform(const char* platform_json)
{
    mraa_result_t ret = MRAA_SUCCESS;
    char* buffer = NULL;
    struct stat st;
    int file_lock = 0, i = 0;
    json_object *jobj_platform = NULL;
    mraa_board_t* board = NULL;

    // Try to lock the file for use
    if ((file_lock = open(platform_json, O_RDONLY)) == -1) {
        syslog(LOG_ERR, "init_json_platform: Failed to open platform file");
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    if (fstat(file_lock, &st) != 0 || (!S_ISREG(st.st_mode))) {
        syslog(LOG_ERR, "init_json_platform: Failed to retrieve information about a file or the "
                        "file specified is not actually a file");
        close(file_lock);
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    buffer = mmap(0, st.st_size, PROT_READ, MAP_SHARED, file_lock, 0);
    close(file_lock);
    if (buffer == MAP_FAILED) {
        syslog(LOG_ERR, "init_json_platform: Failed to read platform file");
        return MRAA_ERROR_INVALID_RESOURCE;
    }

    // Parse the json file
    jobj_platform = json_tokener_parse(buffer);
    // Allocate some memory for the board information
    board = (mraa_board_t*) calloc(1, sizeof(mraa_board_t));
    if (board == NULL) {
        munmap(buffer, st.st_size);
        return MRAA_ERROR_INVALID_HANDLE;
    }

    // Call our helper to go through and init our board for the "Platform" data
    ret = mraa_init_json_platform_loop(jobj_platform, PLATFORM_KEY, board, mraa_init_json_platform_platform);
    if (ret != MRAA_SUCCESS) {
        goto unsuccessful;
    }

    // Setup the IO's with their labels
    ret = mraa_init_json_platform_size_check(jobj_platform, IO_KEY, board,
                                             mraa_init_json_platform_io, board->phy_pin_count);
    if (ret != MRAA_SUCCESS) {
        goto unsuccessful;
    }

    // Setup GPIO
    ret = mraa_init_json_platform_size_check(jobj_platform, GPIO_KEY, board,
                                             mraa_init_json_platform_gpio, board->phy_pin_count);
    if (ret != MRAA_SUCCESS) {
        goto unsuccessful;
    }

    // Setup AIO
    ret = mraa_init_json_platform_size_check(jobj_platform, AIO_KEY, board,
                                             mraa_init_json_platform_aio, board->phy_pin_count);
    if (ret != MRAA_SUCCESS && ret != MRAA_ERROR_NO_DATA_AVAILABLE) {
        goto unsuccessful;
    }

    // Setup SPI
    ret = mraa_init_json_platform_size_check(jobj_platform, SPI_KEY, board,
                                             mraa_init_json_platform_spi, board->spi_bus_count);
    if (ret != MRAA_SUCCESS && ret != MRAA_ERROR_NO_DATA_AVAILABLE) {
        goto unsuccessful;
    }

    // Setup I2C
    ret = mraa_init_json_platform_size_check(jobj_platform, I2C_KEY, board,
                                             mraa_init_json_platform_i2c, board->i2c_bus_count);
    if (ret != MRAA_SUCCESS && ret != MRAA_ERROR_NO_DATA_AVAILABLE) {
        goto unsuccessful;
    }

    // Setup UART
    ret = mraa_init_json_platform_size_check(jobj_platform, UART_KEY, board,
                                             mraa_init_json_platform_uart, board->uart_dev_count);
    if (ret != MRAA_SUCCESS && ret != MRAA_ERROR_NO_DATA_AVAILABLE) {
        for (i = 0; i < board->uart_dev_count; i++) {
            if (board->uart_dev[i].device_path != NULL) {
                free(plat->uart_dev[i].device_path);
            }
        }
        goto unsuccessful;
    }

    // Setup PWM
    ret = mraa_init_json_platform_size_check(jobj_platform, PWM_KEY, board,
                                             mraa_init_json_platform_pwm, board->phy_pin_count);
    if (ret != MRAA_SUCCESS && ret != MRAA_ERROR_NO_DATA_AVAILABLE) {
        goto unsuccessful;
    }

    // Free the old empty platform
    free(plat);
    // Set the new one in it's place
    plat = board;
    platform_name = plat->platform_name;

    // We made it to the end without anything going wrong, just cleanup
    ret = MRAA_SUCCESS;
    syslog(LOG_NOTICE, "init_json_platform: Platform %s initialised via json", platform_name);
    goto cleanup;

unsuccessful:
    free(board->platform_name);
    free(board->pins);
    free(board->adv_func);
    free(board);
cleanup:
    json_object_put(jobj_platform);
    munmap(buffer, st.st_size);
    return ret;
}
