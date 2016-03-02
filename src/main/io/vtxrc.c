/*
 * This file is part of Cleanflight.
 *
 * Cleanflight is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Cleanflight is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Cleanflight.  If not, see <http://www.gnu.org/licenses/>.
 */

// Place holder for future VTXRC integration

#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "build_config.h"
#include "debug.h"
#include <platform.h>
#include "scheduler.h"

#include "common/axis.h"
#include "common/color.h"
#include "common/maths.h"

#include "drivers/system.h"

#include "drivers/sensor.h"
#include "drivers/accgyro.h"
#include "drivers/compass.h"

#include "drivers/serial.h"
#include "drivers/bus_i2c.h"
#include "drivers/gpio.h"
#include "drivers/timer.h"
#include "drivers/pwm_rx.h"
#include "drivers/sdcard.h"
#include "drivers/buf_writer.h"
#include "rx/rx.h"
#include "rx/msp.h"

#include "io/escservo.h"
#include "io/rc_controls.h"
#include "io/gps.h"
#include "io/gimbal.h"
#include "io/serial.h"
#include "io/ledstrip.h"
#include "io/flashfs.h"
#include "io/transponder_ir.h"
#include "io/asyncfatfs/asyncfatfs.h"
#include "io/beeper.h"
#include "io/vtxrc.h"

#include "drivers/vtx.h"

#include "telemetry/telemetry.h"

#include "sensors/boardalignment.h"
#include "sensors/sensors.h"
#include "sensors/battery.h"
#include "sensors/sonar.h"
#include "sensors/acceleration.h"
#include "sensors/barometer.h"
#include "sensors/compass.h"
#include "sensors/gyro.h"

#include "flight/mixer.h"
#include "flight/pid.h"
#include "flight/imu.h"
#include "flight/failsafe.h"
#include "flight/navigation.h"
#include "flight/altitudehold.h"

#include "blackbox/blackbox.h"

#include "mw.h"

#include "config/runtime_config.h"
#include "config/config.h"
#include "config/config_profile.h"
#include "config/config_master.h"

#include "version.h"

void vtxRcInit()
{
    vtxInit();

#ifndef VTXRC
    if (!(masterConfig.vtx_mode == 0 || masterConfig.vtx_mode == 1))
	masterConfig.vtx_mode = 0;
#endif

    if (masterConfig.vtx_mode == 0) {
        vtxSetChan(masterConfig.vtx_band, masterConfig.vtx_channel);
    } else if (masterConfig.vtx_mode == 1) {
        vtxSetFreq(masterConfig.vtx_mhz);
    }
}
