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

#ifdef TARGET_CONFIG

#include "common/axis.h"
#include "common/maths.h"

#include "fc/config.h"
#include "fc/controlrate_profile.h"
#include "fc/rc_controls.h"

#include "flight/failsafe.h"
#include "flight/mixer.h"
#include "flight/pid.h"

#include "rx/rx.h"

#include "sensors/battery.h"
#include "sensors/compass.h"
#include "sensors/gyro.h"


// alternative defaults settings for MULTIFLITEPICO targets
void targetConfiguration(void)
{
    compassConfigMutable()->mag_hardware = MAG_NONE;            // disabled by default

    batteryConfigMutable()->vbatscale = 100;
    batteryConfigMutable()->vbatresdivval = 15;
    batteryConfigMutable()->vbatresdivmultiplier = 4;
    batteryConfigMutable()->vbatmaxcellvoltage = 44;
    batteryConfigMutable()->vbatmincellvoltage = 32;
    batteryConfigMutable()->vbatwarningcellvoltage = 33;

    rxConfigMutable()->spektrum_sat_bind = 5;
    rxConfigMutable()->spektrum_sat_bind_autoreset = 1;

    rcControlsConfigMutable()->yaw_deadband = 2;
    rcControlsConfigMutable()->deadband = 2;

    modeActivationConditionsMutable(0)->modeId          = BOXANGLE;
    modeActivationConditionsMutable(0)->auxChannelIndex = AUX1 - NON_AUX_CHANNEL_COUNT;
    modeActivationConditionsMutable(0)->range.startStep = CHANNEL_VALUE_TO_STEP(900);
    modeActivationConditionsMutable(0)->range.endStep   = CHANNEL_VALUE_TO_STEP(1400);
    modeActivationConditionsMutable(1)->modeId          = BOXHORIZON;
    modeActivationConditionsMutable(1)->auxChannelIndex = AUX1 - NON_AUX_CHANNEL_COUNT;
    modeActivationConditionsMutable(1)->range.startStep = CHANNEL_VALUE_TO_STEP(1425);
    modeActivationConditionsMutable(1)->range.endStep   = CHANNEL_VALUE_TO_STEP(1575);

    failsafeConfigMutable()->failsafe_delay = 2;
    failsafeConfigMutable()->failsafe_off_delay = 0;

    motorConfigMutable()->dev.motorPwmRate = 17000;

    gyroConfigMutable()->gyro_sync_denom = 4;
    pidConfigMutable()->pid_process_denom = 1;

    pidProfilesMutable(0)->P8[ROLL] = 70;
    pidProfilesMutable(0)->I8[ROLL] = 62;
    pidProfilesMutable(0)->D8[ROLL] = 19;
    pidProfilesMutable(0)->P8[PITCH] = 70;
    pidProfilesMutable(0)->I8[PITCH] = 62;
    pidProfilesMutable(0)->D8[PITCH] = 19;

    controlRateProfilesMutable(0)->rcRate8 = 70;
    pidProfilesMutable(0)->I8[PIDLEVEL] = 40;
}
#endif
