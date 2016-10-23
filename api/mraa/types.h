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

#ifdef __cplusplus
extern "C" {
#endif

/**
 * MRAA supported platform types
 */
typedef enum {
    MRAA_INTEL_GALILEO_GEN1 = 0,    /**< The Generation 1 Galileo platform (RevD) */
    MRAA_INTEL_GALILEO_GEN2 = 1,    /**< The Generation 2 Galileo platform (RevG/H) */
    MRAA_INTEL_EDISON_FAB_C = 2,    /**< The Intel Edison (FAB C) */
    MRAA_INTEL_DE3815 = 3,          /**< The Intel DE3815 Baytrail NUC */
    MRAA_INTEL_MINNOWBOARD_MAX = 4, /**< The Intel Minnow Board Max */
    MRAA_RASPBERRY_PI = 5,          /**< The different Raspberry PI Models -like  A,B,A+,B+ */
    MRAA_BEAGLEBONE = 6,            /**< The different BeagleBone Black Modes B/C */
    MRAA_BANANA = 7,                /**< Allwinner A20 based Banana Pi and Banana Pro */
    MRAA_INTEL_NUC5 = 8,            /**< The Intel 5th generations Broadwell NUCs */
    MRAA_96BOARDS = 9,            /**< Linaro 96boards */
    MRAA_INTEL_SOFIA_3GR = 10,      /**< The Intel SoFIA 3GR */
    MRAA_INTEL_CHERRYHILLS = 11,     /**< The Intel Braswell Cherryhills */
    MRAA_UP = 12,                    /**< The UP Board */
    MRAA_INTEL_GT_TUCHUCK = 13,      /**< The Intel GT Tuchuck Board */

    // USB platform extenders start at 256
    MRAA_FTDI_FT4222 = 256,         /**< FTDI FT4222 USB to i2c bridge */

    // contains bit 9 so is subplatform
    MRAA_GENERIC_FIRMATA = 1280,    /**< Firmata uart platform/bridge */

    MRAA_MOCK_PLATFORM = 96,        /**< Mock platform, which requires no real hardware */
    MRAA_JSON_PLATFORM = 97,        /**< User initialised platform from json*/
    MRAA_NULL_PLATFORM = 98,        /**< Platform with no capabilities that hosts a sub platform  */
    MRAA_UNKNOWN_PLATFORM =
    99 /**< An unknown platform type, typically will load INTEL_GALILEO_GEN1 */
} mraa_platform_t;

/**
 * Intel edison miniboard numbering enum
 */
typedef enum {
    MRAA_INTEL_EDISON_MINIBOARD_J17_1 = 0,
    MRAA_INTEL_EDISON_MINIBOARD_J17_5 = 4,
    MRAA_INTEL_EDISON_MINIBOARD_J17_7 = 6,
    MRAA_INTEL_EDISON_MINIBOARD_J17_8 = 7,
    MRAA_INTEL_EDISON_MINIBOARD_J17_9 = 8,
    MRAA_INTEL_EDISON_MINIBOARD_J17_10 = 9,
    MRAA_INTEL_EDISON_MINIBOARD_J17_11 = 10,
    MRAA_INTEL_EDISON_MINIBOARD_J17_12 = 11,
    MRAA_INTEL_EDISON_MINIBOARD_J17_14 = 13,
    MRAA_INTEL_EDISON_MINIBOARD_J18_1 = 14,
    MRAA_INTEL_EDISON_MINIBOARD_J18_2 = 15,
    MRAA_INTEL_EDISON_MINIBOARD_J18_6 = 19,
    MRAA_INTEL_EDISON_MINIBOARD_J18_7 = 20,
    MRAA_INTEL_EDISON_MINIBOARD_J18_8 = 21,
    MRAA_INTEL_EDISON_MINIBOARD_J18_10 = 23,
    MRAA_INTEL_EDISON_MINIBOARD_J18_11 = 24,
    MRAA_INTEL_EDISON_MINIBOARD_J18_12 = 25,
    MRAA_INTEL_EDISON_MINIBOARD_J18_13 = 26,
    MRAA_INTEL_EDISON_MINIBOARD_J19_4 = 31,
    MRAA_INTEL_EDISON_MINIBOARD_J19_5 = 32,
    MRAA_INTEL_EDISON_MINIBOARD_J19_6 = 33,
    MRAA_INTEL_EDISON_MINIBOARD_J19_8 = 35,
    MRAA_INTEL_EDISON_MINIBOARD_J19_9 = 36,
    MRAA_INTEL_EDISON_MINIBOARD_J19_10 = 37,
    MRAA_INTEL_EDISON_MINIBOARD_J19_11 = 38,
    MRAA_INTEL_EDISON_MINIBOARD_J19_12 = 39,
    MRAA_INTEL_EDISON_MINIBOARD_J19_13 = 40,
    MRAA_INTEL_EDISON_MINIBOARD_J19_14 = 41,
    MRAA_INTEL_EDISON_MINIBOARD_J20_3 = 44,
    MRAA_INTEL_EDISON_MINIBOARD_J20_4 = 45,
    MRAA_INTEL_EDISON_MINIBOARD_J20_5 = 46,
    MRAA_INTEL_EDISON_MINIBOARD_J20_6 = 47,
    MRAA_INTEL_EDISON_MINIBOARD_J20_7 = 48,
    MRAA_INTEL_EDISON_MINIBOARD_J20_8 = 49,
    MRAA_INTEL_EDISON_MINIBOARD_J20_9 = 50,
    MRAA_INTEL_EDISON_MINIBOARD_J20_10 = 51,
    MRAA_INTEL_EDISON_MINIBOARD_J20_11 = 52,
    MRAA_INTEL_EDISON_MINIBOARD_J20_12 = 53,
    MRAA_INTEL_EDISON_MINIBOARD_J20_13 = 54,
    MRAA_INTEL_EDISON_MINIBOARD_J20_14 = 55
} mraa_intel_edison_miniboard_t;

/**
 * Intel Edison raw GPIO numbering enum
 */
typedef enum {
    MRAA_INTEL_EDISON_GP182 = 0,
    MRAA_INTEL_EDISON_GP135 = 4,
    MRAA_INTEL_EDISON_GP27 = 6,
    MRAA_INTEL_EDISON_GP20 = 7,
    MRAA_INTEL_EDISON_GP28 = 8,
    MRAA_INTEL_EDISON_GP111 = 0,
    MRAA_INTEL_EDISON_GP109 = 10,
    MRAA_INTEL_EDISON_GP115 = 11,
    MRAA_INTEL_EDISON_GP128 = 13,
    MRAA_INTEL_EDISON_GP13 = 14,
    MRAA_INTEL_EDISON_GP165 = 15,
    MRAA_INTEL_EDISON_GP19 = 19,
    MRAA_INTEL_EDISON_GP12 = 20,
    MRAA_INTEL_EDISON_GP183 = 21,
    MRAA_INTEL_EDISON_GP110 = 23,
    MRAA_INTEL_EDISON_GP114 = 24,
    MRAA_INTEL_EDISON_GP129 = 25,
    MRAA_INTEL_EDISON_GP130 = 26,
    MRAA_INTEL_EDISON_GP44 = 31,
    MRAA_INTEL_EDISON_GP46 = 32,
    MRAA_INTEL_EDISON_GP48 = 33,
    MRAA_INTEL_EDISON_GP131 = 35,
    MRAA_INTEL_EDISON_GP14 = 36,
    MRAA_INTEL_EDISON_GP40 = 37,
    MRAA_INTEL_EDISON_GP43 = 38,
    MRAA_INTEL_EDISON_GP77 = 39,
    MRAA_INTEL_EDISON_GP82 = 40,
    MRAA_INTEL_EDISON_GP83 = 41,
    MRAA_INTEL_EDISON_GP134 = 44,
    MRAA_INTEL_EDISON_GP45 = 45,
    MRAA_INTEL_EDISON_GP47 = 46,
    MRAA_INTEL_EDISON_GP49 = 47,
    MRAA_INTEL_EDISON_GP15 = 48,
    MRAA_INTEL_EDISON_GP84 = 49,
    MRAA_INTEL_EDISON_GP42 = 50,
    MRAA_INTEL_EDISON_GP41 = 51,
    MRAA_INTEL_EDISON_GP78 = 52,
    MRAA_INTEL_EDISON_GP79 = 53,
    MRAA_INTEL_EDISON_GP80 = 54,
    MRAA_INTEL_EDISON_GP81 = 55
} mraa_intel_edison_t;

/**
* Raspberry PI Wiring compatible numbering enum
*/
typedef enum {
    MRAA_RASPBERRY_WIRING_PIN8 = 3,
    MRAA_RASPBERRY_WIRING_PIN9 = 5,
    MRAA_RASPBERRY_WIRING_PIN7 = 7,
    MRAA_RASPBERRY_WIRING_PIN15 = 8,
    MRAA_RASPBERRY_WIRING_PIN16 = 10,
    MRAA_RASPBERRY_WIRING_PIN0 = 11,
    MRAA_RASPBERRY_WIRING_PIN1 = 12,
    MRAA_RASPBERRY_WIRING_PIN2 = 13,
    MRAA_RASPBERRY_WIRING_PIN3 = 15,
    MRAA_RASPBERRY_WIRING_PIN4 = 16,
    MRAA_RASPBERRY_WIRING_PIN5 = 18,
    MRAA_RASPBERRY_WIRING_PIN12 = 19,
    MRAA_RASPBERRY_WIRING_PIN13 = 21,
    MRAA_RASPBERRY_WIRING_PIN6 = 22,
    MRAA_RASPBERRY_WIRING_PIN14 = 23,
    MRAA_RASPBERRY_WIRING_PIN10 = 24,
    MRAA_RASPBERRY_WIRING_PIN11 = 26,
    MRAA_RASPBERRY_WIRING_PIN17 = 29, // RPi B V2
    MRAA_RASPBERRY_WIRING_PIN21 = 29,
    MRAA_RASPBERRY_WIRING_PIN18 = 30, // RPi B V2
    MRAA_RASPBERRY_WIRING_PIN19 = 31, // RPI B V2
    MRAA_RASPBERRY_WIRING_PIN22 = 31,
    MRAA_RASPBERRY_WIRING_PIN20 = 32, // RPi B V2
    MRAA_RASPBERRY_WIRING_PIN26 = 32,
    MRAA_RASPBERRY_WIRING_PIN23 = 33,
    MRAA_RASPBERRY_WIRING_PIN24 = 35,
    MRAA_RASPBERRY_WIRING_PIN27 = 36,
    MRAA_RASPBERRY_WIRING_PIN25 = 37,
    MRAA_RASPBERRY_WIRING_PIN28 = 38,
    MRAA_RASPBERRY_WIRING_PIN29 = 40
} mraa_raspberry_wiring_t;

/**
 * MRAA return codes
 */
typedef enum {
    MRAA_SUCCESS = 0,                             /**< Expected response */
    MRAA_ERROR_FEATURE_NOT_IMPLEMENTED = 1,       /**< Feature TODO */
    MRAA_ERROR_FEATURE_NOT_SUPPORTED = 2,         /**< Feature not supported by HW */
    MRAA_ERROR_INVALID_VERBOSITY_LEVEL = 3,       /**< Verbosity level wrong */
    MRAA_ERROR_INVALID_PARAMETER = 4,             /**< Parameter invalid */
    MRAA_ERROR_INVALID_HANDLE = 5,                /**< Handle invalid */
    MRAA_ERROR_NO_RESOURCES = 6,                  /**< No resource of that type avail */
    MRAA_ERROR_INVALID_RESOURCE = 7,              /**< Resource invalid */
    MRAA_ERROR_INVALID_QUEUE_TYPE = 8,            /**< Queue type incorrect */
    MRAA_ERROR_NO_DATA_AVAILABLE = 9,             /**< No data available */
    MRAA_ERROR_INVALID_PLATFORM = 10,             /**< Platform not recognised */
    MRAA_ERROR_PLATFORM_NOT_INITIALISED = 11,     /**< Board information not initialised */
    MRAA_ERROR_UART_OW_SHORTED = 12,              /**< UART OW Short Circuit Detected*/
    MRAA_ERROR_UART_OW_NO_DEVICES = 13,           /**< UART OW No devices detected */
    MRAA_ERROR_UART_OW_DATA_ERROR = 14,           /**< UART OW Data/Bus error detected */

    MRAA_ERROR_UNSPECIFIED = 99 /**< Unknown Error */
} mraa_result_t;

/**
 * Enum representing different possible modes for a pin.
 */
typedef enum {
    MRAA_PIN_VALID = 0,     /**< Pin Valid */
    MRAA_PIN_GPIO = 1,      /**< General Purpose IO */
    MRAA_PIN_PWM = 2,       /**< Pulse Width Modulation */
    MRAA_PIN_FAST_GPIO = 3, /**< Faster GPIO */
    MRAA_PIN_SPI = 4,       /**< SPI */
    MRAA_PIN_I2C = 5,       /**< I2C */
    MRAA_PIN_AIO = 6,       /**< Analog in */
    MRAA_PIN_UART = 7       /**< UART */
} mraa_pinmodes_t;

/**
 * Enum reprensenting different i2c speeds/modes
 */
typedef enum {
    MRAA_I2C_STD = 0,  /**< up to 100Khz */
    MRAA_I2C_FAST = 1, /**< up to 400Khz */
    MRAA_I2C_HIGH = 2  /**< up to 3.4Mhz */
} mraa_i2c_mode_t;

typedef enum {
	MRAA_UART_PARITY_NONE = 0,
	MRAA_UART_PARITY_EVEN = 1,
	MRAA_UART_PARITY_ODD = 2,
	MRAA_UART_PARITY_MARK = 3,
	MRAA_UART_PARITY_SPACE = 4
} mraa_uart_parity_t;

#ifdef __cplusplus
}
#endif
