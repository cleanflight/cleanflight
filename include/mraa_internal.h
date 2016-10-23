/*
 * Author: Thomas Ingleby <thomas.c.ingleby@intel.com>
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

#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include <syslog.h>
#include <fnmatch.h>

#include "common.h"
#include "mraa_internal_types.h"
#include "mraa_adv_func.h"
#include "mraa_lang_func.h"

extern mraa_board_t* plat;
extern char* platform_name;
extern mraa_iio_info_t* plat_iio;
extern mraa_lang_func_t* lang_func;

/**
 * Takes in pin information and sets up the multiplexors.
 *
 * @param meta
 * @return mraa result type indicating success of actions.
 */
mraa_result_t mraa_setup_mux_mapped(mraa_pin_t meta);

/**
 * runtime detect running x86 platform
 *
 * @return mraa_platform_t of the init'ed platform
 */
mraa_platform_t mraa_x86_platform();

/**
 * runtime detect running arm platforms
 *
 * @return mraa_platform_t of the init'ed platform
 */
mraa_platform_t mraa_arm_platform();

/**
 * setup a mock platform
 *
 * @return mraa_platform_t of the init'ed platform
 */
mraa_platform_t mraa_mock_platform();

/**
 * runtime detect running usb platform extender
 *
 * @return mraa_platform_t of the detected platform extender
 */
mraa_platform_t mraa_usb_platform_extender(mraa_board_t* board);

/**
 * runtime detect iio subsystem
 *
 * @return mraa_result_t indicating success of iio detection
 */
mraa_result_t mraa_iio_detect();

/**
 * helper function to check if file exists
 *
 * @param filename to check
 * @return mraa_boolean_t boolean result.
 */
mraa_boolean_t mraa_file_exist(const char* filename);

/**
 * helper function to unglob filenames
 *
 * @param filename to unglob
 * @return char * with the existing filename matching the pattern of input. NULL if there is no
 *match. Caller must free result
 */
char* mraa_file_unglob(const char* filename);

/**
 * helper function to check if file contains a given text
 *
 * @param filename to check
 * @param content to check in file
 * @return mraa_boolean_t boolean result.
 */
mraa_boolean_t mraa_file_contains(const char* filename, const char* content);

/**
 * helper function to check if file contains a given text
 *
 * @param filename to check
 * @param content to check in file
 * @param content2 to check in same line of file
 * @return mraa_boolean_t boolean result.
 */
mraa_boolean_t mraa_file_contains_both(const char* filename, const char* content, const char* content2);

/**
 * helper function to find out if file that is targeted by a softlink
 * (partially) matches the given name
 *
 * @param filename of the softlink
 * @param (partial) filename that is matched with the filename of the link-targeted file
 * @return mraa_boolean_t true when targetname (partially) matches
 */
mraa_boolean_t mraa_link_targets(const char* filename, const char* targetname);

/**
 * helper function to find the first i2c bus containing devname starting from
 * i2c-n where n is startfrom
 *
 * @param device name to match
 * @param i2c-dev number to start search from
 * @return the matching i2c-dev bus id or -1
 */
int mraa_find_i2c_bus(const char* devname, int startfrom);

#if defined(IMRAA)
/**
 * read Imraa subplatform lock file, caller is responsible to free return
 * struct array
 *
 * @param imraa lockfile location
 * @return the number of subplatforms added
 */
uint32_t mraa_add_from_lockfile(const char* imraa_lock_file);

/**
 * Internal imraa init function
 *
 * @return mraa_result_t indicating success
 */
mraa_result_t imraa_init();
#endif

#ifdef __cplusplus
}
#endif
