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
#include "common/utils.h"

#include "fc/config.h"
#include "fc/rc_controls.h"
#include "fc/controlrate_profile.h"

#include "flight/failsafe.h"
#include "flight/mixer.h"
#include "flight/pid.h"

#include "rx/rx.h"

#include "sensors/acceleration.h"
#include "sensors/compass.h"
#include "sensors/gyro.h"

#include "hardware_revision.h"

void targetConfiguration(void)
{
#ifdef BEEBRAIN
    // alternative defaults settings for Beebrain target
    motorConfigMutable()->dev.motorPwmRate = 4000;
    failsafeConfigMutable()->failsafe_delay = 2;
    failsafeConfigMutable()->failsafe_off_delay = 0;

    motorConfigMutable()->minthrottle = 1049;

    gyroConfigMutable()->gyro_lpf = GYRO_LPF_188HZ;
    gyroConfigMutable()->gyro_soft_lpf_hz = 100;
    gyroConfigMutable()->gyro_soft_notch_hz_1 = 0;
    gyroConfigMutable()->gyro_soft_notch_hz_2 = 0;

    /*for (int channel = 0; channel < NON_AUX_CHANNEL_COUNT; channel++) {
        rxConfigMutable()->channelRanges[channel].min = 1180;
        rxConfigMutable()->channelRanges[channel].max = 1860;
    }*/

    for (int profileId = 0; profileId < 2; profileId++) {
        pidProfilesMutable(0)->P8[ROLL] = 60;
        pidProfilesMutable(0)->I8[ROLL] = 70;
        pidProfilesMutable(0)->D8[ROLL] = 17;
        pidProfilesMutable(0)->P8[PITCH] = 80;
        pidProfilesMutable(0)->I8[PITCH] = 90;
        pidProfilesMutable(0)->D8[PITCH] = 18;
        pidProfilesMutable(0)->P8[YAW] = 200;
        pidProfilesMutable(0)->I8[YAW] = 45;
        pidProfilesMutable(0)->P8[PIDLEVEL] = 30;
        pidProfilesMutable(0)->D8[PIDLEVEL] = 30;

        for (int rateProfileId = 0; rateProfileId < CONTROL_RATE_PROFILE_COUNT; rateProfileId++) {
            controlRateProfilesMutable(rateProfileId)->rcRate8 = 100;
            controlRateProfilesMutable(rateProfileId)->rcYawRate8 = 110;
            controlRateProfilesMutable(rateProfileId)->rcExpo8 = 0;
            controlRateProfilesMutable(rateProfileId)->rates[FD_ROLL] = 77;
            controlRateProfilesMutable(rateProfileId)->rates[FD_PITCH] = 77;
            controlRateProfilesMutable(rateProfileId)->rates[FD_YAW] = 80;

            pidProfilesMutable(0)->dtermSetpointWeight = 200;
            pidProfilesMutable(0)->setpointRelaxRatio = 50;
        }
    }
#endif

#if !defined(AFROMINI) && !defined(BEEBRAIN)
    if (hardwareRevision >= NAZE32_REV5) {
        // naze rev4 and below used opendrain to PNP for buzzer. Rev5 and above use PP to NPN.
        beeperDevConfigMutable()->isOpenDrain = false;
        beeperDevConfigMutable()->isInverted = true;
    } else {
        beeperDevConfigMutable()->isOpenDrain = true;
        beeperDevConfigMutable()->isInverted = false;
        flashConfigMutable()->csTag = IO_TAG_NONE;
    }
#endif

#ifdef MAG_INT_EXTI
    if (hardwareRevision < NAZE32_REV5) {
        compassConfigMutable()->interruptTag = IO_TAG(PB12);
    }
#endif
}

void targetValidateConfiguration(void)
{
    if (hardwareRevision < NAZE32_REV5 && accelerometerConfig()->acc_hardware == ACC_ADXL345) {
        accelerometerConfigMutable()->acc_hardware = ACC_NONE;
    }  
}
#endif
