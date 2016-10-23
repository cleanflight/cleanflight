/*
 * Author: Brendan Le Foll <brendan.le.foll@intel.com>
 * Copyright © 2014 Intel Corporation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */

#pragma once

/** @file
 *
 * This file defines the basic shared types for libmraa
 * this file is different to common.h in that swig takes this as an input
 */

namespace mraa
{

//These enums must match the enums in types.h

/**
 * MRAA supported platform types
 */
typedef enum {
    INTEL_GALILEO_GEN1 = 0,    /**< The Generation 1 Galileo platform (RevD) */
    INTEL_GALILEO_GEN2 = 1,    /**< The Generation 2 Galileo platform (RevG/H) */
    INTEL_EDISON_FAB_C = 2,    /**< The Intel Edison (FAB C) */
    INTEL_DE3815 = 3,          /**< The Intel DE3815 Baytrail NUC */
    INTEL_MINNOWBOARD_MAX = 4, /**< The Intel Minnow Board Max */
    RASPBERRY_PI = 5,          /**< The different Raspberry PI Models -like  A,B,A+,B+ */
    BEAGLEBONE = 6,            /**< The different BeagleBone Black Modes B/C */
    BANANA = 7,                /**< Allwinner A20 based Banana Pi and Banana Pro */
    INTEL_NUC5 = 8,            /**< The Intel 5th generations Broadwell NUCs */
    A96BOARDS = 9,             /**< Linaro 96boards, A prefix for 'ARM' since not allowed numerical */
    INTEL_SOFIA_3GR = 10,      /**< The Intel SoFIA 3GR */
    INTEL_CHERRYHILLS = 11,    /**< The Intel Braswell Cherryhills */
    INTEL_UP = 12,             /**< The UP Board */
    INTEL_GT_TUCHUCK = 13,     /**< The Intel GT Board */

    FTDI_FT4222 = 256,         /**< FTDI FT4222 USB to i2c bridge */

    GENERIC_FIRMATA = 1280,    /**< Firmata uart platform/bridge */

    NULL_PLATFORM = 98,
    UNKNOWN_PLATFORM =
    99 /**< An unknown platform type, typically will load INTEL_GALILEO_GEN1 */
} Platform;

/**
 * Intel edison miniboard numbering enum
 */
typedef enum {
    INTEL_EDISON_MINIBOARD_J17_1 = 0,
    INTEL_EDISON_MINIBOARD_J17_5 = 4,
    INTEL_EDISON_MINIBOARD_J17_7 = 6,
    INTEL_EDISON_MINIBOARD_J17_8 = 7,
    INTEL_EDISON_MINIBOARD_J17_9 = 8,
    INTEL_EDISON_MINIBOARD_J17_10 = 9,
    INTEL_EDISON_MINIBOARD_J17_11 = 10,
    INTEL_EDISON_MINIBOARD_J17_12 = 11,
    INTEL_EDISON_MINIBOARD_J17_14 = 13,
    INTEL_EDISON_MINIBOARD_J18_1 = 14,
    INTEL_EDISON_MINIBOARD_J18_2 = 15,
    INTEL_EDISON_MINIBOARD_J18_6 = 19,
    INTEL_EDISON_MINIBOARD_J18_7 = 20,
    INTEL_EDISON_MINIBOARD_J18_8 = 21,
    INTEL_EDISON_MINIBOARD_J18_10 = 23,
    INTEL_EDISON_MINIBOARD_J18_11 = 24,
    INTEL_EDISON_MINIBOARD_J18_12 = 25,
    INTEL_EDISON_MINIBOARD_J18_13 = 26,
    INTEL_EDISON_MINIBOARD_J19_4 = 31,
    INTEL_EDISON_MINIBOARD_J19_5 = 32,
    INTEL_EDISON_MINIBOARD_J19_6 = 33,
    INTEL_EDISON_MINIBOARD_J19_8 = 35,
    INTEL_EDISON_MINIBOARD_J19_9 = 36,
    INTEL_EDISON_MINIBOARD_J19_10 = 37,
    INTEL_EDISON_MINIBOARD_J19_11 = 38,
    INTEL_EDISON_MINIBOARD_J19_12 = 39,
    INTEL_EDISON_MINIBOARD_J19_13 = 40,
    INTEL_EDISON_MINIBOARD_J19_14 = 41,
    INTEL_EDISON_MINIBOARD_J20_3 = 44,
    INTEL_EDISON_MINIBOARD_J20_4 = 45,
    INTEL_EDISON_MINIBOARD_J20_5 = 46,
    INTEL_EDISON_MINIBOARD_J20_6 = 47,
    INTEL_EDISON_MINIBOARD_J20_7 = 48,
    INTEL_EDISON_MINIBOARD_J20_8 = 49,
    INTEL_EDISON_MINIBOARD_J20_9 = 50,
    INTEL_EDISON_MINIBOARD_J20_10 = 51,
    INTEL_EDISON_MINIBOARD_J20_11 = 52,
    INTEL_EDISON_MINIBOARD_J20_12 = 53,
    INTEL_EDISON_MINIBOARD_J20_13 = 54,
    INTEL_EDISON_MINIBOARD_J20_14 = 55
} IntelEdisonMiniboard;

/**
 * Intel Edison raw GPIO numbering enum
 */
typedef enum {
    INTEL_EDISON_GP182 = 0,
    INTEL_EDISON_GP135 = 4,
    INTEL_EDISON_GP27 = 6,
    INTEL_EDISON_GP20 = 7,
    INTEL_EDISON_GP28 = 8,
    INTEL_EDISON_GP111 = 0,
    INTEL_EDISON_GP109 = 10,
    INTEL_EDISON_GP115 = 11,
    INTEL_EDISON_GP128 = 13,
    INTEL_EDISON_GP13 = 14,
    INTEL_EDISON_GP165 = 15,
    INTEL_EDISON_GP19 = 19,
    INTEL_EDISON_GP12 = 20,
    INTEL_EDISON_GP183 = 21,
    INTEL_EDISON_GP110 = 23,
    INTEL_EDISON_GP114 = 24,
    INTEL_EDISON_GP129 = 25,
    INTEL_EDISON_GP130 = 26,
    INTEL_EDISON_GP44 = 31,
    INTEL_EDISON_GP46 = 32,
    INTEL_EDISON_GP48 = 33,
    INTEL_EDISON_GP131 = 35,
    INTEL_EDISON_GP14 = 36,
    INTEL_EDISON_GP40 = 37,
    INTEL_EDISON_GP43 = 38,
    INTEL_EDISON_GP77 = 39,
    INTEL_EDISON_GP82 = 40,
    INTEL_EDISON_GP83 = 41,
    INTEL_EDISON_GP134 = 44,
    INTEL_EDISON_GP45 = 45,
    INTEL_EDISON_GP47 = 46,
    INTEL_EDISON_GP49 = 47,
    INTEL_EDISON_GP15 = 48,
    INTEL_EDISON_GP84 = 49,
    INTEL_EDISON_GP42 = 50,
    INTEL_EDISON_GP41 = 51,
    INTEL_EDISON_GP78 = 52,
    INTEL_EDISON_GP79 = 53,
    INTEL_EDISON_GP80 = 54,
    INTEL_EDISON_GP81 = 55
} IntelEdison;

/**
* Raspberry PI Wiring compatible numbering enum
*/
typedef enum {
    RASPBERRY_WIRING_PIN8 = 3,
    RASPBERRY_WIRING_PIN9 = 5,
    RASPBERRY_WIRING_PIN7 = 7,
    RASPBERRY_WIRING_PIN15 = 8,
    RASPBERRY_WIRING_PIN16 = 10,
    RASPBERRY_WIRING_PIN0 = 11,
    RASPBERRY_WIRING_PIN1 = 12,
    RASPBERRY_WIRING_PIN2 = 13,
    RASPBERRY_WIRING_PIN3 = 15,
    RASPBERRY_WIRING_PIN4 = 16,
    RASPBERRY_WIRING_PIN5 = 18,
    RASPBERRY_WIRING_PIN12 = 19,
    RASPBERRY_WIRING_PIN13 = 21,
    RASPBERRY_WIRING_PIN6 = 22,
    RASPBERRY_WIRING_PIN14 = 23,
    RASPBERRY_WIRING_PIN10 = 24,
    RASPBERRY_WIRING_PIN11 = 26,
    RASPBERRY_WIRING_PIN17 = 29, // RPi B V2
    RASPBERRY_WIRING_PIN21 = 29,
    RASPBERRY_WIRING_PIN18 = 30, // RPi B V2
    RASPBERRY_WIRING_PIN19 = 31, // RPI B V2
    RASPBERRY_WIRING_PIN22 = 31,
    RASPBERRY_WIRING_PIN20 = 32, // RPi B V2
    RASPBERRY_WIRING_PIN26 = 32,
    RASPBERRY_WIRING_PIN23 = 33,
    RASPBERRY_WIRING_PIN24 = 35,
    RASPBERRY_WIRING_PIN27 = 36,
    RASPBERRY_WIRING_PIN25 = 37,
    RASPBERRY_WIRING_PIN28 = 38,
    RASPBERRY_WIRING_PIN29 = 40
} RaspberryWiring;

/**
 * MRAA return codes
 */
typedef enum {
    SUCCESS = 0,                             /**< Expected response */
    ERROR_FEATURE_NOT_IMPLEMENTED = 1,       /**< Feature TODO */
    ERROR_FEATURE_NOT_SUPPORTED = 2,         /**< Feature not supported by HW */
    ERROR_INVALID_VERBOSITY_LEVEL = 3,       /**< Verbosity level wrong */
    ERROR_INVALID_PARAMETER = 4,             /**< Parameter invalid */
    ERROR_INVALID_HANDLE = 5,                /**< Handle invalid */
    ERROR_NO_RESOURCES = 6,                  /**< No resource of that type avail */
    ERROR_INVALID_RESOURCE = 7,              /**< Resource invalid */
    ERROR_INVALID_QUEUE_TYPE = 8,            /**< Queue type incorrect */
    ERROR_NO_DATA_AVAILABLE = 9,             /**< No data available */
    ERROR_INVALID_PLATFORM = 10,             /**< Platform not recognised */
    ERROR_PLATFORM_NOT_INITIALISED = 11,     /**< Board information not initialised */
    ERROR_UART_OW_SHORTED = 12,              /**< UART OW Short Circuit Detected*/
    ERROR_UART_OW_NO_DEVICES = 13,           /**< UART OW No devices detected */
    ERROR_UART_OW_DATA_ERROR = 14,           /**< UART OW Data/Bus error detected */

    ERROR_UNSPECIFIED = 99 /**< Unknown Error */
} Result;

/**
 * Enum representing different possible modes for a pin.
 */
typedef enum {
    PIN_VALID = 0,     /**< Pin Valid */
    PIN_GPIO = 1,      /**< General Purpose IO */
    PIN_PWM = 2,       /**< Pulse Width Modulation */
    PIN_FAST_GPIO = 3, /**< Faster GPIO */
    PIN_SPI = 4,       /**< SPI */
    PIN_I2C = 5,       /**< I2C */
    PIN_AIO = 6,       /**< Analog in */
    PIN_UART = 7       /**< UART */
} Pinmodes;

/**
 * Enum reprensenting different i2c speeds/modes
 */
typedef enum {
    I2C_STD = 0,  /**< up to 100Khz */
    I2C_FAST = 1, /**< up to 400Khz */
    I2C_HIGH = 2  /**< up to 3.4Mhz */
} I2cMode;

typedef enum {
    UART_PARITY_NONE = 0,
    UART_PARITY_EVEN = 1,
    UART_PARITY_ODD = 2,
    UART_PARITY_MARK = 3,
    UART_PARITY_SPACE = 4
} UartParity;

}
