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

#pragma once

#include "uart.h"

#define MODE_INPUT 0x00
#define MODE_OUTPUT 0x01
#define MODE_ANALOG 0x02
#define MODE_PWM 0x03
#define MODE_SERVO 0x04
#define MODE_SHIFT 0x05
#define MODE_I2C 0x06

#define LOW 0
#define HIGH 1

#define FIRMATA_START_SYSEX 0xF0       // start a MIDI Sysex message
#define FIRMATA_END_SYSEX 0xF7         // end a MIDI Sysex message
#define FIRMATA_PIN_MODE_QUERY 0x72    // ask for current and supported pin modes
#define FIRMATA_PIN_MODE_RESPONSE 0x73 // reply with current and supported pin modes
#define FIRMATA_PIN_STATE_QUERY 0x6D
#define FIRMATA_PIN_STATE_RESPONSE 0x6E
#define FIRMATA_CAPABILITY_QUERY 0x6B
#define FIRMATA_CAPABILITY_RESPONSE 0x6C
#define FIRMATA_ANALOG_MAPPING_QUERY 0x69
#define FIRMATA_ANALOG_MAPPING_RESPONSE 0x6A

#define FIRMATA_DIGITAL_MESSAGE 0x90 // send data for a digital pin
#define FIRMATA_ANALOG_MESSAGE 0xE0  // send data for an analog pin (or PWM)
#define FIRMATA_ANALOG_MESSAGE 0xE0  // send data for an analog pin (or PWM)
#define FIRMATA_REPORT_ANALOG 0xC0   // enable analog input by pin #
#define FIRMATA_REPORT_DIGITAL 0xD0  // enable digital input by port pair

#define FIRMATA_I2C_CONFIG 0x78
#define FIRMATA_I2C_REPLY 0x77
#define FIRMATA_I2C_REQUEST 0x76

#define I2C_MODE_WRITE 0x00
#define I2C_MODE_READ 0x01
#define I2C_CONTINUOUSREAD 0x02
#define I2C_STOP_READING 0x03

#define FIRMATA_SET_PIN_MODE 0xF4 // set a pin to INPUT/OUTPUT/PWM/etc

#define FIRMATA_REPORT_VERSION 0xF9 // report protocol version
#define FIRMATA_SYSTEM_RESET 0xFF   // reset from MIDI

#define FIRMATA_START_SYSEX 0xF0 // start a MIDI Sysex message
#define FIRMATA_END_SYSEX 0xF7   // end a MIDI Sysex message

// extended command set using sysex (0-127/0x00-0x7F)
/* 0x00-0x0F reserved for custom commands */
#define FIRMATA_SERVO_CONFIG 0x70       // set max angle, minPulse, maxPulse, freq
#define FIRMATA_STRING 0x71             // a string message with 14-bits per char
#define FIRMATA_REPORT_FIRMWARE 0x79    // report name and version of the firmware
#define FIRMATA_SYSEX_NON_REALTIME 0x7E // MIDI Reserved for non-realtime messages
#define FIRMATA_SYSEX_REALTIME 0x7F     // MIDI Reserved for realtime messages

#define FIRMATA_MSG_LEN 1024

typedef struct s_pin {
    uint8_t mode;
    uint8_t analog_channel;
    uint64_t supported_modes;
    uint32_t value;
} t_pin;

typedef struct s_firmata {
    mraa_uart_context uart;
    t_pin pins[128];
    int i2cmsg[256][256];
    int parse_command_len;
    int parse_count;
    uint8_t parse_buff[FIRMATA_MSG_LEN];
    int isReady;
    char firmware[140];
    uint8_t dev_count;
    struct _firmata** devs;
} t_firmata;

t_firmata* firmata_new(const char* name);
void firmata_initPins(t_firmata* firmata);
int firmata_askFirmware(t_firmata* firmata);
int firmata_pinMode(t_firmata* firmata, int pin, int mode);
int firmata_digitalWrite(t_firmata* firmata, int pin, int value);
int firmata_analogWrite(t_firmata* firmata, int pin, int value);
int firmata_analogRead(t_firmata* firmata, int pin);
int firmata_pull(t_firmata* firmata);
void firmata_parse(t_firmata* firmata, const uint8_t* buf, int len);
void firmata_endParse(t_firmata* firmata);
void firmata_close(t_firmata* firmata);
