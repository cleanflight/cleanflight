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

#include "mraa_internal.h"
#include "arm/raspberry_pi.h"
#include "arm/beaglebone.h"
#include "arm/banana.h"
#include "arm/96boards.h"


mraa_platform_t
mraa_arm_platform()
{
    mraa_platform_t platform_type = MRAA_UNKNOWN_PLATFORM;
    size_t len = 100;
    char* line = malloc(len);
    FILE* fh = fopen("/proc/cpuinfo", "r");

    if (fh != NULL) {
        while (getline(&line, &len, fh) != -1) {
            if (strncmp(line, "Hardware", 8) == 0) {
                if (strstr(line, "BCM2708")) {
                    platform_type = MRAA_RASPBERRY_PI;
                }
                else if (strstr(line, "BCM2709")) {
                    platform_type = MRAA_RASPBERRY_PI;
                }
                else if (strstr(line, "Generic AM33XX")) {
                    platform_type = MRAA_BEAGLEBONE;
                }
                else if (strstr(line, "HiKey Development Board")) {
                    platform_type = MRAA_96BOARDS;
                }
                else if (strstr(line, "sun7i")) {
                    if (mraa_file_contains("/sys/firmware/devicetree/base/model", "Banana Pro")) {
                        platform_type = MRAA_BANANA;
                    }
                    else if (mraa_file_contains("/sys/firmware/devicetree/base/model", "Banana Pi")) {
                        platform_type = MRAA_BANANA;
                    }
                    // For old kernels
                    else if (mraa_file_exist("/sys/class/leds/green:ph24:led1")) {
                        platform_type = MRAA_BANANA;
                    }
                }
            }

        }
        fclose(fh);
    }
    free(line);

    /* Get compatible string from Device tree for boards that dont have enough info in /proc/cpuinfo */
    if (platform_type == MRAA_UNKNOWN_PLATFORM) {
        if (mraa_file_contains("/sys/firmware/devicetree/base/compatible", "qcom,apq8016-sbc"))
                   platform_type = MRAA_96BOARDS;
        else if (mraa_file_contains("/sys/firmware/devicetree/base/model", "HiKey Development Board"))
                   platform_type = MRAA_96BOARDS;
     }

    switch (platform_type) {
        case MRAA_RASPBERRY_PI:
            plat = mraa_raspberry_pi();
            break;
        case MRAA_BEAGLEBONE:
            plat = mraa_beaglebone();
            break;
        case MRAA_BANANA:
            plat = mraa_banana();
            break;
        case MRAA_96BOARDS:
            plat = mraa_96boards();
            break;
        default:
            plat = NULL;
            syslog(LOG_ERR, "Unknown Platform, currently not supported by MRAA");
    }
    return platform_type;
}
