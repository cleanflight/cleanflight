/*
 * Copyright (c) 2016 Intel Corporation
 * Copyright (c) 2015 Jules Dourlens (jdourlens@gmail.com)
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

#include "firmata/firmata.h"
#include "mraa_internal.h"

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

t_firmata*
firmata_new(const char* name)
{
    t_firmata* res;
    mraa_result_t uart_res = MRAA_ERROR_UNSPECIFIED;

    res = calloc(1, sizeof(t_firmata));
    if (!res) {
        return NULL;
    }

    res->uart = mraa_uart_init_raw(name);
    if (res->uart == NULL) {
        syslog(LOG_ERR, "firmata: UART failed to setup");
        free(res);
        return  NULL;
    }

    firmata_initPins(res);

    if (mraa_uart_set_baudrate(res->uart, 57600) != MRAA_SUCCESS) {
        syslog(LOG_WARNING, "firmata: Failed to set correct baud rate on %s", name);
    }

    firmata_askFirmware(res);
    syslog(LOG_INFO, "firmata: Device opened at: %s", name);

    return res;
}

void
firmata_close(t_firmata* firmata)
{
    mraa_uart_stop(firmata->uart);
    free(firmata);
}

int
firmata_pull(t_firmata* firmata)
{
    uint8_t buff[FIRMATA_MSG_LEN];
    int r;

    r = mraa_uart_data_available(firmata->uart, 40);
    if (r > 0) {
        r = mraa_uart_read(firmata->uart, buff, sizeof(buff));
        if (r < 0) {
            return 0;
        }
        if (r > 0) {
            firmata_parse(firmata, buff, r);
            return r;
        }
    }
    return r;
}

void
firmata_parse(t_firmata* firmata, const uint8_t* buf, int len)
{
    const uint8_t* p;
    const uint8_t* end;

    p = buf;
    end = p + len;
    for (p = buf; p < end; p++) {
        uint8_t msn = *p & 0xF0;
        if (msn == 0xE0 || msn == 0x90 || *p == 0xF9) {
            firmata->parse_command_len = 3;
            firmata->parse_count = 0;
        } else if (msn == 0xC0 || msn == 0xD0) {
            firmata->parse_command_len = 2;
            firmata->parse_count = 0;
        } else if (*p == FIRMATA_START_SYSEX) {
            firmata->parse_count = 0;
            firmata->parse_command_len = sizeof(firmata->parse_buff);
        } else if (*p == FIRMATA_END_SYSEX) {
            firmata->parse_command_len = firmata->parse_count + 1;
        } else if (*p & 0x80) {
            firmata->parse_command_len = 1;
            firmata->parse_count = 0;
        }
        if (firmata->parse_count < (int) sizeof(firmata->parse_buff)) {
            firmata->parse_buff[firmata->parse_count] = (uint8_t)(*p);
            firmata->parse_count++;
        }
        if (firmata->parse_count == firmata->parse_command_len) {
            firmata_endParse(firmata);
            firmata->parse_count = 0;
            firmata->parse_command_len = 0;
        }
    }
}

void
firmata_endParse(t_firmata* firmata)
{
    uint8_t cmd = (firmata->parse_buff[0] & 0xF0);
    int pin;

    if (cmd == 0xE0 && firmata->parse_count == 3) {
        int analog_ch = (firmata->parse_buff[0] & 0x0F);
        int analog_val = firmata->parse_buff[1] | (firmata->parse_buff[2] << 7);
        for (pin = 0; pin < 128; pin++) {
            if (firmata->pins[pin].analog_channel == analog_ch) {
                firmata->pins[pin].value = analog_val;
                return;
            }
        }
        return;
    }
    if (cmd == 0x90 && firmata->parse_count == 3) {
        int port_num = (firmata->parse_buff[0] & 0x0F);
        int port_val = firmata->parse_buff[1] | (firmata->parse_buff[2] << 7);
        int pin = port_num * 8;
        int mask;
        for (mask = 1; mask & 0xFF; mask <<= 1, pin++) {
            if (firmata->pins[pin].mode == MODE_INPUT) {
                uint32_t val = (port_val & mask) ? 1 : 0;
                firmata->pins[pin].value = val;
            }
        }
        return;
    }
    if (firmata->parse_buff[0] == FIRMATA_START_SYSEX &&
        firmata->parse_buff[firmata->parse_count - 1] == FIRMATA_END_SYSEX) {
        if (firmata->parse_buff[1] == FIRMATA_REPORT_FIRMWARE) {
            int len = 0;
            int i;
            for (i = 4; i < firmata->parse_count - 2; i += 2) {
                firmata->firmware[len++] =
                (firmata->parse_buff[i] & 0x7F) | ((firmata->parse_buff[i + 1] & 0x7F) << 7);
            }
            firmata->firmware[len++] = '-';
            firmata->firmware[len++] = firmata->parse_buff[2] + '0';
            firmata->firmware[len++] = '.';
            firmata->firmware[len++] = firmata->parse_buff[3] + '0';
            firmata->firmware[len++] = 0;
            syslog(LOG_INFO, "firmata: sketch name:: %s", firmata->firmware);
            // query the board's capabilities only after hearing the
            // REPORT_FIRMWARE message.  For boards that reset when
            // the port open (eg, Arduino with reset=DTR), they are
            // not ready to communicate for some time, so the only
            // way to reliably query their capabilities is to wait
            // until the REPORT_FIRMWARE message is heard.
            uint8_t buf[80];
            len = 0;
            buf[len++] = FIRMATA_START_SYSEX;
            buf[len++] = FIRMATA_ANALOG_MAPPING_QUERY; // read analog to pin # info
            buf[len++] = FIRMATA_END_SYSEX;
            buf[len++] = FIRMATA_START_SYSEX;
            buf[len++] = FIRMATA_CAPABILITY_QUERY; // read capabilities
            buf[len++] = FIRMATA_END_SYSEX;
            for (i = 0; i < 16; i++) {
                buf[len++] = 0xC0 | i; // report analog
                buf[len++] = 1;
                buf[len++] = 0xD0 | i; // report digital
                buf[len++] = 1;
            }
            firmata->isReady = 1;
            mraa_uart_write(firmata->uart, buf, len);
        } else if (firmata->parse_buff[1] == FIRMATA_CAPABILITY_RESPONSE) {
            int pin, i, n;
            for (pin = 0; pin < 128; pin++) {
                firmata->pins[pin].supported_modes = 0;
            }
            for (i = 2, n = 0, pin = 0; i < firmata->parse_count; i++) {
                if (firmata->parse_buff[i] == 127) {
                    pin++;
                    n = 0;
                    continue;
                }
                if (n == 0) {
                    // first byte is supported mode
                    firmata->pins[pin].supported_modes |= (1 << firmata->parse_buff[i]);
                }
                n = n ^ 1;
            }
            // send a state query for for every pin with any modes
            for (pin = 0; pin < 128; pin++) {
                uint8_t buf[512];
                int len = 0;
                if (firmata->pins[pin].supported_modes) {
                    buf[len++] = FIRMATA_START_SYSEX;
                    buf[len++] = FIRMATA_PIN_STATE_QUERY;
                    buf[len++] = pin;
                    buf[len++] = FIRMATA_END_SYSEX;
                }
                mraa_uart_write(firmata->uart, buf, len);
            }
        } else if (firmata->parse_buff[1] == FIRMATA_ANALOG_MAPPING_RESPONSE) {
            int pin = 0;
            int i;
            for (i = 2; i < firmata->parse_count - 1; i++) {
                firmata->pins[pin].analog_channel = firmata->parse_buff[i];
                pin++;
            }
            return;
        } else if (firmata->parse_buff[1] == FIRMATA_PIN_STATE_RESPONSE && firmata->parse_count >= 6) {
            int pin = firmata->parse_buff[2];
            firmata->pins[pin].mode = firmata->parse_buff[3];
            firmata->pins[pin].value = firmata->parse_buff[4];
            if (firmata->parse_count > 6)
                firmata->pins[pin].value |= (firmata->parse_buff[5] << 7);
            if (firmata->parse_count > 7)
                firmata->pins[pin].value |= (firmata->parse_buff[6] << 14);
        // disable this to check the firmata_devs responses
        } else if (firmata->parse_buff[1] == FIRMATA_I2C_REPLY) {
            int addr = (firmata->parse_buff[2] & 0x7f) | ((firmata->parse_buff[3] & 0x7f) << 7);
            int reg = (firmata->parse_buff[4] & 0x7f) | ((firmata->parse_buff[5] & 0x7f) << 7);
            int i = 6;
            int ii = 0;
            for (ii; ii < (firmata->parse_count - 7) / 2; ii++) {
                firmata->i2cmsg[addr][reg+ii] = (firmata->parse_buff[i] & 0x7f) | ((firmata->parse_buff[i+1] & 0x7f) << 7);
                i = i+2;
            }
        } else {
            if (firmata->devs != NULL) {
                struct _firmata* devs = firmata->devs[0];
                int i = 0;
                for (i; i < firmata->dev_count; i++, devs++) {
                    if (devs != NULL) {
                        if (firmata->parse_buff[1] == devs->feature) {
                            // call func
                            if (devs->isr) {
                                devs->isr(firmata->parse_buff, firmata->parse_count);
                            }
                        }
                    }
                }
            }
        }
        return;
    }
}

void
firmata_initPins(t_firmata* firmata)
{
    int i;

    firmata->parse_count = 0;
    firmata->parse_command_len = 0;
    firmata->isReady = 0;
    for (i = 0; i < 128; i++) {
        firmata->pins[i].mode = 255;
        firmata->pins[i].analog_channel = 127;
        firmata->pins[i].supported_modes = 0;
        firmata->pins[i].value = 0;
    }
}

int
firmata_askFirmware(t_firmata* firmata)
{
    uint8_t buf[3];
    int res;

    buf[0] = FIRMATA_START_SYSEX;
    buf[1] = FIRMATA_REPORT_FIRMWARE; // read firmata name & version
    buf[2] = FIRMATA_END_SYSEX;
    res = mraa_uart_write(firmata->uart, buf, 3);
    return (res);
}

int
firmata_pinMode(t_firmata* firmata, int pin, int mode)
{
    int res;
    uint8_t buff[4];

    firmata->pins[pin].mode = mode;
    buff[0] = FIRMATA_SET_PIN_MODE;
    buff[1] = pin;
    buff[2] = mode;
    res = mraa_uart_write(firmata->uart, buff, 3);
    return (res);
}

int
firmata_analogWrite(t_firmata* firmata, int pin, int value)
{
    int res;

    uint8_t buff[3];
    buff[0] = 0xE0 | pin;
    buff[1] = value & 0x7F;
    buff[2] = (value >> 7) & 0x7F;
    res = mraa_uart_write(firmata->uart, buff, 3);
    return (res);
}

int
firmata_analogRead(t_firmata *firmata, int pin)
{
    int res;
    int value = 1;
    uint8_t buff[2];
    buff[0] = FIRMATA_REPORT_ANALOG | pin;
    buff[1] = value;
    res = mraa_uart_write(firmata->uart, buff, 2);
    return res;
}

int
firmata_digitalWrite(t_firmata* firmata, int pin, int value)
{
    int i;
    int res;
    uint8_t buff[4];

    if (pin < 0 || pin > 127)
        return (0);
    firmata->pins[pin].value = value;
    int port_num = pin / 8;
    int port_val = 0;
    for (i = 0; i < 8; i++) {
        int p = port_num * 8 + i;
        if (firmata->pins[p].mode == MODE_OUTPUT || firmata->pins[p].mode == MODE_INPUT) {
            if (firmata->pins[p].value) {
                port_val |= (1 << i);
            }
        }
    }
    buff[0] = FIRMATA_DIGITAL_MESSAGE | port_num;
    buff[1] = port_val & 0x7F;
    buff[2] = (port_val >> 7) & 0x7F;
    res = mraa_uart_write(firmata->uart, buff, 3);
    return (res);
}
