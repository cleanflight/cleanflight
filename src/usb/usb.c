/*
 * Author: Henry Bruce <henry.bruce@intel.com>
 * Copyright (c) 2015 Intel Corporation.
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
#ifdef FTDI4222
#include "usb/ftdi_ft4222.h"
#endif


mraa_platform_t
mraa_usb_platform_extender(mraa_board_t* board)
{
    mraa_board_t* sub_plat = NULL;
    mraa_platform_t platform_type = MRAA_UNKNOWN_PLATFORM;

#ifdef FTDI4222
    libft4222_lib = dlopen("libft4222.so", RTLD_LAZY);
    if (!libft4222_lib) {
        syslog(LOG_WARNING, "libft4222.so not found, skipping");
    } else {
        if (mraa_ftdi_ft4222_init() == MRAA_SUCCESS) {
            unsigned int versionChip, versionLib;
            if (mraa_ftdi_ft4222_get_version(&versionChip, &versionLib) == MRAA_SUCCESS) {
                // TODO: Add ft4222 version checks
                platform_type = MRAA_FTDI_FT4222;
            }
        }
    }
#endif
    switch (platform_type) {
#ifdef FTDI4222
        case MRAA_FTDI_FT4222:
            sub_plat = mraa_ftdi_ft4222();
            break;
#endif
        default:
            // this is not an error but more that we didn't find a USB platform extender we recognise
            syslog(LOG_DEBUG, "Unknown USB Platform Extender, currently not supported by MRAA");
    }

    if (sub_plat != NULL) {
        sub_plat->platform_type = platform_type;
        board->sub_platform = sub_plat;
    }
    return platform_type;
}
