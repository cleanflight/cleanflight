/*
 * Author: Lay, Kuan Loon <kuan.loon.lay@intel.com>
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

//For kernel 4.1+,
//#include <linux/iio/types.h>
//#include <linux/iio/events.h>

//linux/iio/types.h
enum iio_chan_type {
        IIO_VOLTAGE,
        IIO_CURRENT,
        IIO_POWER,
        IIO_ACCEL,
        IIO_ANGL_VEL,
        IIO_MAGN,
        IIO_LIGHT,
        IIO_INTENSITY,
        IIO_PROXIMITY,
        IIO_TEMP,
        IIO_INCLI,
        IIO_ROT,
        IIO_ANGL,
        IIO_TIMESTAMP,
        IIO_CAPACITANCE,
        IIO_ALTVOLTAGE,
        IIO_CCT,
        IIO_PRESSURE,
        IIO_HUMIDITYRELATIVE,
        IIO_ACTIVITY,
        IIO_STEPS,
        IIO_ENERGY,
        IIO_DISTANCE,
        IIO_VELOCITY,
};

enum iio_modifier {
        IIO_NO_MOD,
        IIO_MOD_X,
        IIO_MOD_Y,
        IIO_MOD_Z,
        IIO_MOD_X_AND_Y,
        IIO_MOD_X_AND_Z,
        IIO_MOD_Y_AND_Z,
        IIO_MOD_X_AND_Y_AND_Z,
        IIO_MOD_X_OR_Y,
        IIO_MOD_X_OR_Z,
        IIO_MOD_Y_OR_Z,
        IIO_MOD_X_OR_Y_OR_Z,
        IIO_MOD_LIGHT_BOTH,
        IIO_MOD_LIGHT_IR,
        IIO_MOD_ROOT_SUM_SQUARED_X_Y,
        IIO_MOD_SUM_SQUARED_X_Y_Z,
        IIO_MOD_LIGHT_CLEAR,
        IIO_MOD_LIGHT_RED,
        IIO_MOD_LIGHT_GREEN,
        IIO_MOD_LIGHT_BLUE,
        IIO_MOD_QUATERNION,
        IIO_MOD_TEMP_AMBIENT,
        IIO_MOD_TEMP_OBJECT,
        IIO_MOD_NORTH_MAGN,
        IIO_MOD_NORTH_TRUE,
        IIO_MOD_NORTH_MAGN_TILT_COMP,
        IIO_MOD_NORTH_TRUE_TILT_COMP,
        IIO_MOD_RUNNING,
        IIO_MOD_JOGGING,
        IIO_MOD_WALKING,
        IIO_MOD_STILL,
        IIO_MOD_ROOT_SUM_SQUARED_X_Y_Z,
};

enum iio_event_type {
        IIO_EV_TYPE_THRESH,
        IIO_EV_TYPE_MAG,
        IIO_EV_TYPE_ROC,
        IIO_EV_TYPE_THRESH_ADAPTIVE,
        IIO_EV_TYPE_MAG_ADAPTIVE,
        IIO_EV_TYPE_CHANGE,
};

enum iio_event_direction {
        IIO_EV_DIR_EITHER,
        IIO_EV_DIR_RISING,
        IIO_EV_DIR_FALLING,
        IIO_EV_DIR_NONE,
};

//linux/iio/events.h
#if defined(MSYS)
#define __USE_LINUX_IOCTL_DEFS
#include <sys/ioctl.h>
#else
#include <linux/ioctl.h>
#endif

/**
 * struct iio_event_data - The actual event being pushed to userspace
 * @id:		event identifier
 * @timestamp:	best estimate of time of event occurrence (often from
 *		the interrupt handler)
 */
struct iio_event_data {
	unsigned long long int	id;
	long long int	timestamp;
};

#define IIO_GET_EVENT_FD_IOCTL _IOR('i', 0x90, int)

#define IIO_EVENT_CODE_EXTRACT_TYPE(mask) ((mask >> 56) & 0xFF)

#define IIO_EVENT_CODE_EXTRACT_DIR(mask) ((mask >> 48) & 0x7F)

#define IIO_EVENT_CODE_EXTRACT_CHAN_TYPE(mask) ((mask >> 32) & 0xFF)

/* Event code number extraction depends on which type of event we have.
 * Perhaps review this function in the future*/
#define IIO_EVENT_CODE_EXTRACT_CHAN(mask) ((short int)(mask & 0xFFFF))
#define IIO_EVENT_CODE_EXTRACT_CHAN2(mask) ((short int)(((mask) >> 16) & 0xFFFF))

#define IIO_EVENT_CODE_EXTRACT_MODIFIER(mask) ((mask >> 40) & 0xFF)
#define IIO_EVENT_CODE_EXTRACT_DIFF(mask) (((mask) >> 55) & 0x1)
