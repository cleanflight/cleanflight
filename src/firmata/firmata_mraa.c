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
#include <syslog.h>

#include "firmata.h"
#include "mraa_internal.h"
#include "firmata/firmata_mraa.h"
#include "firmata/firmata.h"

static t_firmata* firmata_dev;
static pthread_t thread_id;
static volatile int isr_detected;

mraa_firmata_context
mraa_firmata_init(int feature)
{
    mraa_firmata_context dev = (mraa_firmata_context) calloc(1, sizeof(struct _firmata));
    if (dev == NULL) {
        return NULL;
    }
    dev->feature = (uint8_t) feature;
    dev->added = 0;

    return dev;
}

mraa_result_t
mraa_firmata_write_sysex(mraa_firmata_context dev, char* msg, int length)
{
    return mraa_uart_write(firmata_dev->uart, msg, length);
}

mraa_result_t
mraa_firmata_response(mraa_firmata_context dev, void (*fptr)(uint8_t*, int))
{
    if (dev->added == 0) {
        struct _firmata** ptr;
        ptr = realloc(firmata_dev->devs, (firmata_dev->dev_count+1) * sizeof(struct _firmata*));
        if (ptr == NULL) {
            return MRAA_ERROR_NO_RESOURCES;
        }
        firmata_dev->devs = ptr;
        dev->index = firmata_dev->dev_count;
        firmata_dev->dev_count++;
        firmata_dev->devs[dev->index] = dev;
        dev->added = 1;
    }
    dev->isr = fptr;
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_firmata_response_stop(mraa_firmata_context dev)
{
    dev->isr = NULL;
    return MRAA_SUCCESS;
}

mraa_result_t
mraa_firmata_close(mraa_firmata_context dev)
{
    mraa_firmata_response_stop(dev);
    free(dev);
    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_firmata_i2c_init_bus_replace(mraa_i2c_context dev)
{
    int delay = 1; // this should be either 1 or 0, I don't know :)
    uint8_t buff[4];
    buff[0] = FIRMATA_START_SYSEX;
    buff[1] = FIRMATA_I2C_CONFIG;
    buff[2] = delay & 0xFF, (delay >> 8) & 0xFF;
    buff[3] = FIRMATA_END_SYSEX;
    mraa_uart_write(firmata_dev->uart, buff, 4);

    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_firmata_i2c_address(mraa_i2c_context dev, uint8_t addr)
{
    // only thing needed and it's already done
    //dev->addr = (int) addr;

    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_firmata_i2c_frequency(mraa_i2c_context dev, mraa_i2c_mode_t mode)
{
    return MRAA_ERROR_FEATURE_NOT_IMPLEMENTED;
}

static mraa_result_t
mraa_firmata_send_i2c_read_req(mraa_i2c_context dev, int length)
{
    uint8_t* buffer = calloc(7, 0);
    if (buffer == NULL) {
        return MRAA_ERROR_NO_RESOURCES;
    }
    buffer[0] = FIRMATA_START_SYSEX;
    buffer[1] = FIRMATA_I2C_REQUEST;
    buffer[2] = dev->addr;
    buffer[3] = I2C_MODE_READ << 3;

    // number of bytes
    buffer[4] = length & 0x7f;
    buffer[5] = (length >> 7) & 0x7f;
    buffer[6] = FIRMATA_END_SYSEX;

    if (mraa_uart_write(firmata_dev->uart, buffer, 7) != 7) {
        free(buffer);
        return MRAA_ERROR_UNSPECIFIED;
    }

    // this needs a lock :)
    memset(&firmata_dev->i2cmsg[dev->addr][0], -1, sizeof(int)*length);

    free(buffer);
    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_firmata_send_i2c_read_reg_req(mraa_i2c_context dev, uint8_t command, int length)
{
    uint8_t* buffer = calloc(9, 0);
    if (buffer == NULL) {
        return MRAA_ERROR_NO_RESOURCES;
    }
    buffer[0] = FIRMATA_START_SYSEX;
    buffer[1] = FIRMATA_I2C_REQUEST;
    buffer[2] = dev->addr;
    buffer[3] = I2C_MODE_READ << 3;

    // register to read from
    buffer[4] = command & 0x7f;
    buffer[5] = (command >> 7) & 0x7f;
    // number of bytes
    buffer[6] = length & 0x7f;
    buffer[7] = (length >> 7) & 0x7f;
    buffer[8] = FIRMATA_END_SYSEX;

    if (mraa_uart_write(firmata_dev->uart, buffer, 9) != 9) {
        free(buffer);
        return MRAA_ERROR_UNSPECIFIED;
    }

    // this needs a lock :)
    memset(&firmata_dev->i2cmsg[dev->addr][command], -1, sizeof(int)*length);

    free(buffer);
    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_firmata_i2c_wait(int addr, int reg)
{
    int i = 0;
    for (i = 0; firmata_dev->i2cmsg[addr][reg] == -1; i++) {
        if (i > 50) {
            return MRAA_ERROR_UNSPECIFIED;
        }
        usleep(500);
    }
    return MRAA_SUCCESS;
}

static int
mraa_firmata_i2c_read_byte(mraa_i2c_context dev)
{
    if (mraa_firmata_send_i2c_read_req(dev, 1) == MRAA_SUCCESS) {
        if (mraa_firmata_i2c_wait(dev->addr, 0) == MRAA_SUCCESS) {
            return firmata_dev->i2cmsg[dev->addr][0];
        }
    }
    return -1;
}

static int
mraa_firmata_i2c_read_word_data(mraa_i2c_context dev, uint8_t command)
{
    if (mraa_firmata_send_i2c_read_reg_req(dev, command, 2) == MRAA_SUCCESS) {
        if (mraa_firmata_i2c_wait(dev->addr, command) == MRAA_SUCCESS) {
            uint8_t rawdata[2];
            rawdata[0] = firmata_dev->i2cmsg[dev->addr][command];
            rawdata[1] = firmata_dev->i2cmsg[dev->addr][command+1];
            uint16_t data = (uint16_t) rawdata;
            uint8_t high = (data & 0xFF00) >> 8;
            data = (data << 8) & 0xFF00;
            data |= high;

            return (int) data;
        }
    }
    return -1;
}

static int
mraa_firmata_i2c_read_bytes_data(mraa_i2c_context dev, uint8_t command, uint8_t* data, int length)
{
    if (mraa_firmata_send_i2c_read_reg_req(dev, command, length) == MRAA_SUCCESS) {
        if (mraa_firmata_i2c_wait(dev->addr, command) == MRAA_SUCCESS) {
            memcpy(data, &firmata_dev->i2cmsg[dev->addr][command], sizeof(int)*length);
            return length;
        }
    }
    return 0;
}

static int
mraa_firmata_i2c_read(mraa_i2c_context dev, uint8_t* data, int length)
{
    if (mraa_firmata_send_i2c_read_req(dev, length) == MRAA_SUCCESS) {
        if (mraa_firmata_i2c_wait(dev->addr, 0) == MRAA_SUCCESS) {
            int i = 0;
            for (i = 0; i < length; i++) {
                data[i] = firmata_dev->i2cmsg[dev->addr][i];
            }
            return length;
        }
    }

    return 0;
}

static int
mraa_firmata_i2c_read_byte_data(mraa_i2c_context dev, uint8_t command)
{
    if (mraa_firmata_send_i2c_read_reg_req(dev, command, 1) == MRAA_SUCCESS) {
        if (mraa_firmata_i2c_wait(dev->addr, command) == MRAA_SUCCESS) {
            return (int) firmata_dev->i2cmsg[dev->addr][command];
        }
    }

    return -1;
}

static mraa_result_t
mraa_firmata_i2c_write(mraa_i2c_context dev, const uint8_t* data, int bytesToWrite)
{
    // buffer needs 5 bytes for firmata, and 2 bytes for every byte of data
    int buffer_size = (bytesToWrite*2) + 5;
    uint8_t* buffer = calloc(buffer_size, 0);
    if (buffer == NULL) {
        return MRAA_ERROR_NO_RESOURCES;
    }
    int i = 0;
    int ii = 4;
    buffer[0] = FIRMATA_START_SYSEX;
    buffer[1] = FIRMATA_I2C_REQUEST;
    buffer[2] = dev->addr;
    buffer[3] = I2C_MODE_WRITE << 3;
    // we need to write until FIRMATA_END_SYSEX
    for (i; i < (buffer_size-1); i++) {
        buffer[ii] = data[i] & 0x7F;
        buffer[ii+1] = (data[i] >> 7) & 0x7f;
        ii = ii+2;
    }
    buffer[buffer_size-1] = FIRMATA_END_SYSEX;
    mraa_uart_write(firmata_dev->uart, buffer, buffer_size);
    free(buffer);
    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_firmata_i2c_write_byte(mraa_i2c_context dev, uint8_t data)
{
    uint8_t* buffer = calloc(7, 0);
    if (buffer == NULL) {
        return MRAA_ERROR_NO_RESOURCES;
    }
    buffer[0] = FIRMATA_START_SYSEX;
    buffer[1] = FIRMATA_I2C_REQUEST;
    buffer[2] = dev->addr;
    buffer[3] = I2C_MODE_WRITE << 3;
    buffer[4] = data & 0x7F;
    buffer[5] = (data >> 7) & 0x7F;
    buffer[6] = FIRMATA_END_SYSEX;
    mraa_uart_write(firmata_dev->uart, buffer, 7);
    free(buffer);
    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_firmata_i2c_write_byte_data(mraa_i2c_context dev, const uint8_t data, const uint8_t command)
{
    uint8_t* buffer = calloc(9, 0);
    if (buffer == NULL) {
        return MRAA_ERROR_NO_RESOURCES;
    }
    buffer[0] = FIRMATA_START_SYSEX;
    buffer[1] = FIRMATA_I2C_REQUEST;
    buffer[2] = dev->addr;
    buffer[3] = I2C_MODE_WRITE << 3;
    buffer[4] = command & 0x7F;
    buffer[5] = (command >> 7) & 0x7F;
    buffer[6] = data & 0x7F;
    buffer[7] = (data >> 7) & 0x7F;
    buffer[8] = FIRMATA_END_SYSEX;
    mraa_uart_write(firmata_dev->uart, buffer, 9);
    free(buffer);
    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_firmata_i2c_write_word_data(mraa_i2c_context dev, const uint16_t data, const uint8_t command)
{
    return MRAA_ERROR_FEATURE_NOT_IMPLEMENTED;
}

static mraa_result_t
mraa_firmata_i2c_stop(mraa_i2c_context dev)
{
    return MRAA_SUCCESS;
}

static int
mraa_firmata_aio_read(mraa_aio_context dev)
{
    // careful, whilst you need to enable '0' for A0 you then need to read 14
    // in t_firmata because well that makes sense doesn't it...
    return (int) firmata_dev->pins[dev->channel].value;
}

static mraa_result_t
mraa_firmata_aio_init_internal_replace(mraa_aio_context dev, int aio)
{
    // set the channel, since we override internal it's never set
    // offset by 14 because it makes total logical sense.
    dev->channel = aio + 14;
    // firmata considers A0 pin0 as well as actual pin0 :/
    firmata_pinMode(firmata_dev, aio, MODE_ANALOG);
    // register for updates on that ADC channel
    firmata_analogRead(firmata_dev, aio);

    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_firmata_gpio_init_internal_replace(mraa_gpio_context dev, int pin)
{
    dev->pin = pin;
    dev->phy_pin = pin;

    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_firmata_gpio_mode_replace(mraa_gpio_context dev, mraa_gpio_mode_t mode)
{
    return MRAA_ERROR_FEATURE_NOT_IMPLEMENTED;
}

static int
mraa_firmata_gpio_read_replace(mraa_gpio_context dev)
{
    return firmata_dev->pins[dev->pin].value;
}

static mraa_result_t
mraa_firmata_gpio_write_replace(mraa_gpio_context dev, int write_value)
{
    if (write_value == 0) {
        firmata_digitalWrite(firmata_dev, dev->phy_pin, LOW);
    } else {
        firmata_digitalWrite(firmata_dev, dev->phy_pin, HIGH);
    }

    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_firmata_gpio_dir_replace(mraa_gpio_context dev, mraa_gpio_dir_t dir)
{
    switch (dir) {
        case MRAA_GPIO_IN:
            firmata_pinMode(firmata_dev, dev->phy_pin, MODE_INPUT);
            break;
        case MRAA_GPIO_OUT:
            firmata_pinMode(firmata_dev, dev->phy_pin, MODE_OUTPUT);
            break;
        case MRAA_GPIO_OUT_LOW:
            firmata_pinMode(firmata_dev, dev->phy_pin, MODE_OUTPUT);
            firmata_digitalWrite(firmata_dev, dev->phy_pin, LOW);
            break;
        case MRAA_GPIO_OUT_HIGH:
            firmata_pinMode(firmata_dev, dev->phy_pin, MODE_OUTPUT);
            firmata_digitalWrite(firmata_dev, dev->phy_pin, HIGH);
            break;
        default:
            return MRAA_ERROR_INVALID_PARAMETER;
    }
    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_firmata_gpio_edge_mode_replace(mraa_gpio_context dev, mraa_gpio_edge_t mode)
{
    switch (mode) {
        case MRAA_GPIO_EDGE_BOTH:
            return MRAA_SUCCESS;
        default:
            return MRAA_ERROR_FEATURE_NOT_IMPLEMENTED;
    }
}

static mraa_result_t
mraa_firmata_gpio_interrupt_handler_init_replace(mraa_gpio_context dev)
{
    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_firmata_gpio_wait_interrupt_replace(mraa_gpio_context dev)
{
    while (!((isr_detected >> dev->pin) & 1)) {
        usleep(100);
    }
    // might want to lock here?
    isr_detected &= ~(1 << dev->pin);
    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_firmata_gpio_close_replace(mraa_gpio_context dev)
{
    free(dev);
    return MRAA_SUCCESS;
}

static mraa_pwm_context
mraa_firmata_pwm_init_internal_replace(void* func_table, int pin)
{
    mraa_pwm_context dev = (mraa_pwm_context) calloc(1, sizeof(struct _pwm));
    if (dev == NULL) {
        return NULL;
    }
    dev->pin = pin;
    dev->chipid = 512;
    dev->period = 2048000; // Locked, in ns
    dev->advance_func = (mraa_adv_func_t*) func_table;

    return dev;
}

static mraa_result_t
mraa_firmata_pwm_write_replace(mraa_pwm_context dev, float percentage)
{
    int value = (int)((percentage - 1) / 8000);
    firmata_analogWrite(firmata_dev, dev->pin, value);
    firmata_dev->pins[dev->pin].value = value;
    return MRAA_SUCCESS;
}

static float
mraa_firmata_pwm_read_replace(mraa_pwm_context dev)
{
    int value = firmata_dev->pins[dev->pin].value;
    if (value) {
        return (value + 1) * 8000;
    }
    return 0;
}

static mraa_result_t
mraa_firmata_pwm_enable_replace(mraa_pwm_context dev, int enable)
{
    if (enable) {
        firmata_pinMode(firmata_dev, dev->pin, MODE_PWM);
        firmata_dev->pins[dev->pin].value = 0;
    } else {
        firmata_pinMode(firmata_dev, dev->pin, MODE_INPUT);
    }
    return MRAA_SUCCESS;
}

static void*
mraa_firmata_pull_handler(void* vp)
{
    int i, isr_now, isr_prev;
    isr_prev = 0;
    while(1) {
        isr_now = 0;
        firmata_pull(firmata_dev);
        // would prefer to send board pointer as argument
        for(i = 0; i < 14; i++) {
            isr_now |= (firmata_dev->pins[i].value & 1) << i;
        }
        // might want to lock here?
        isr_detected = isr_prev ^ isr_now; //both edges for now
        isr_prev = isr_now;
        usleep(100);
    }
}

mraa_board_t*
mraa_firmata_plat_init(const char* uart_dev)
{
    mraa_board_t* b = (mraa_board_t*) calloc(1, sizeof(mraa_board_t));
    if (b == NULL) {
        return NULL;
    }

    firmata_dev = firmata_new(uart_dev);
    if (firmata_dev == NULL) {
        syslog(LOG_WARNING, "firmata: Failed to open uart to Firmata dev on %s", uart_dev);
        fprintf(stderr, "Mraa expected to find a Firmata device on %s, is the port in use?\n", uart_dev);
        free(b);
        return NULL;
    }

    // if this isn't working then we have an issue with our uart
    int retry = 20;
    while (!firmata_dev->isReady && --retry) {
       firmata_pull(firmata_dev);
    }

    if (!retry) {
        syslog(LOG_ERR, "firmata: Failed to find a valid Firmata board on %s", uart_dev);
        firmata_close(firmata_dev);
        free(b);
	return NULL;
    }

    pthread_create(&thread_id, NULL, mraa_firmata_pull_handler, NULL);

    b->platform_name = "firmata";
    // do we support 2.5? Or are we more 2.3?
    // or should we return the flashed sketch name?
    b->platform_version = firmata_dev->firmware;
    b->gpio_count = 14;
    b->aio_count = 6;
    b->adc_supported = 10;
    b->phy_pin_count = 20;
    b->i2c_bus_count = 1;
    b->def_i2c_bus = 0;
    b->i2c_bus[0].bus_id = 0;
    b->pwm_min_period = 2048;
    b->pwm_max_period = 2048;

    b->pins = (mraa_pininfo_t*) calloc(b->phy_pin_count, sizeof(mraa_pininfo_t));
    if (b->pins == NULL) {
        free(b);
        return NULL;
    }

    strncpy(b->pins[0].name, "IO0", 8);
    b->pins[0].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[0].gpio.pinmap = 0;
    strncpy(b->pins[1].name, "IO1", 8);
    b->pins[1].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[1].gpio.pinmap = 1;
    strncpy(b->pins[2].name, "IO2", 8);
    b->pins[2].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[2].gpio.pinmap = 2;
    strncpy(b->pins[3].name, "IO3", 8);
    b->pins[3].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    b->pins[3].gpio.pinmap = 3;
    strncpy(b->pins[4].name, "IO4", 8);
    b->pins[4].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[4].gpio.pinmap = 4;
    strncpy(b->pins[5].name, "IO5", 8);
    b->pins[5].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    b->pins[5].gpio.pinmap = 5;
    strncpy(b->pins[6].name, "IO6", 8);
    b->pins[6].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    b->pins[6].gpio.pinmap = 6;
    strncpy(b->pins[7].name, "IO7", 8);
    b->pins[7].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[7].gpio.pinmap = 7;
    strncpy(b->pins[8].name, "IO8", 8);
    b->pins[8].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[8].gpio.pinmap = 8;
    strncpy(b->pins[9].name, "IO9", 8);
    b->pins[9].capabilities = (mraa_pincapabilities_t){ 1, 1, 1, 0, 0, 0, 0, 0 };
    b->pins[9].gpio.pinmap = 9;
    strncpy(b->pins[10].name, "IO10", 8);
    b->pins[10].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[10].gpio.pinmap = 10;
    strncpy(b->pins[11].name, "IO11", 8);
    b->pins[11].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[11].gpio.pinmap = 11;
    strncpy(b->pins[12].name, "IO12", 8);
    b->pins[12].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[12].gpio.pinmap = 12;
    strncpy(b->pins[13].name, "IO13", 8);
    b->pins[13].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };
    b->pins[13].gpio.pinmap = 13;
    strncpy(b->pins[10].name, "A0", 8);
    b->pins[14].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 1, 0 };
    b->pins[14].gpio.pinmap = 14;
    b->pins[14].aio.pinmap = 14;
    strncpy(b->pins[11].name, "A1", 8);
    b->pins[15].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 1, 0 };
    b->pins[15].gpio.pinmap = 15;
    b->pins[15].aio.pinmap = 15;
    strncpy(b->pins[12].name, "A2", 8);
    b->pins[16].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 1, 0 };
    b->pins[16].gpio.pinmap = 16;
    b->pins[16].aio.pinmap = 16;
    strncpy(b->pins[13].name, "A3", 8);
    b->pins[17].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 1, 0 };
    b->pins[17].gpio.pinmap = 17;
    b->pins[17].aio.pinmap = 17;
    strncpy(b->pins[13].name, "A4", 8);
    b->pins[18].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 1, 0 };
    b->pins[18].gpio.pinmap = 18;
    b->pins[18].aio.pinmap = 18;
    strncpy(b->pins[13].name, "A5", 8);
    b->pins[19].capabilities = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 1, 0 };
    b->pins[19].gpio.pinmap = 19;
    b->pins[19].aio.pinmap = 19;

    b->adv_func = (mraa_adv_func_t*) calloc(1, sizeof(mraa_adv_func_t));
    if (b->adv_func == NULL) {
        free(b->pins);
        free(b);
        return NULL;
    }

    b->adv_func->gpio_init_internal_replace = &mraa_firmata_gpio_init_internal_replace;
    b->adv_func->gpio_mode_replace = &mraa_firmata_gpio_mode_replace;
    b->adv_func->gpio_dir_replace = &mraa_firmata_gpio_dir_replace;
    b->adv_func->gpio_edge_mode_replace = &mraa_firmata_gpio_edge_mode_replace;
    b->adv_func->gpio_interrupt_handler_init_replace = &mraa_firmata_gpio_interrupt_handler_init_replace;
    b->adv_func->gpio_wait_interrupt_replace = &mraa_firmata_gpio_wait_interrupt_replace;
    b->adv_func->gpio_read_replace = &mraa_firmata_gpio_read_replace;
    b->adv_func->gpio_write_replace = &mraa_firmata_gpio_write_replace;
    b->adv_func->gpio_close_replace = &mraa_firmata_gpio_close_replace;

    b->adv_func->aio_init_internal_replace = &mraa_firmata_aio_init_internal_replace;
    b->adv_func->aio_read_replace = &mraa_firmata_aio_read;

    b->adv_func->pwm_init_internal_replace = &mraa_firmata_pwm_init_internal_replace;
    b->adv_func->pwm_write_replace = &mraa_firmata_pwm_write_replace;
    b->adv_func->pwm_read_replace = &mraa_firmata_pwm_read_replace;
    b->adv_func->pwm_enable_replace = &mraa_firmata_pwm_enable_replace;

    b->adv_func->i2c_init_bus_replace = &mraa_firmata_i2c_init_bus_replace;
    b->adv_func->i2c_set_frequency_replace = &mraa_firmata_i2c_frequency;
    b->adv_func->i2c_address_replace = &mraa_firmata_i2c_address;
    b->adv_func->i2c_read_replace = &mraa_firmata_i2c_read;
    b->adv_func->i2c_read_byte_replace = &mraa_firmata_i2c_read_byte;
    b->adv_func->i2c_read_byte_data_replace = &mraa_firmata_i2c_read_byte_data;
    b->adv_func->i2c_read_word_data_replace = &mraa_firmata_i2c_read_word_data;
    b->adv_func->i2c_read_bytes_data_replace = &mraa_firmata_i2c_read_bytes_data;
    b->adv_func->i2c_write_replace = &mraa_firmata_i2c_write;
    b->adv_func->i2c_write_byte_replace = &mraa_firmata_i2c_write_byte;
    b->adv_func->i2c_write_byte_data_replace = &mraa_firmata_i2c_write_byte_data;
    b->adv_func->i2c_write_word_data_replace = &mraa_firmata_i2c_write_word_data;
    b->adv_func->i2c_stop_replace = &mraa_firmata_i2c_stop;

    return b;
}

mraa_platform_t
mraa_firmata_platform(mraa_board_t* board, const char* uart_dev)
{
    /**
     * Firmata boards are not something we can detect so we just trust the user
     * to initialise them themselves and is the only platform type not to be
     * initialised from mraa_init(). Good luck!
     */
    mraa_board_t* sub_plat = NULL;

    sub_plat = mraa_firmata_plat_init(uart_dev);
    if (sub_plat != NULL) {
        sub_plat->platform_type = MRAA_GENERIC_FIRMATA;
        board->sub_platform = sub_plat;
        return sub_plat->platform_type;
    }

    return MRAA_NULL_PLATFORM;
}
