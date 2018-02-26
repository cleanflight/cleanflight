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

#include <stdbool.h>
#include <stdint.h>

#include <platform.h>

#include "common/axis.h"

#include "drivers/sensor.h"
#include "drivers/compass/compass.h"
#include "drivers/serial.h"

#include "fc/rc_controls.h"

#include "flight/failsafe.h"
#include "flight/mixer.h"
#include "flight/pid.h"

#include "rx/rx.h"

#include "io/serial.h"

#include "telemetry/telemetry.h"

#include "sensors/sensors.h"
#include "sensors/compass.h"
#include "sensors/barometer.h"

#include "config/feature.h"

#include "fc/config.h"

#ifdef TARGET_CONFIG
void targetConfiguration(void)
{
    barometerConfigMutable()->baro_hardware = BARO_DEFAULT;
#if (0) // XXX remove this check, for debugging serial port conflicts
    serialConfigMutable()->portConfigs[1].functionMask = FUNCTION_MSP;
#endif
#if (1) // XXX remove this check, for debugging serial port conflicts
    serialConfigMutable()->portConfigs[findSerialPortIndexByIdentifier(TELEMETRY_UART)].functionMask = FUNCTION_TELEMETRY_SMARTPORT;
#endif

#ifdef TELEMETRY
    // change telemetry settings
    telemetryConfigMutable()->telemetry_inverted = 1;
    telemetryConfigMutable()->halfDuplex = 1;
#endif

}
#endif
