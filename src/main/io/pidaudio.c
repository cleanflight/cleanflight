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
#include <math.h>

#include <platform.h>

#include "common/axis.h"
#include "common/maths.h"

#include "drivers/audio.h"

#include "fc/rc_modes.h"

#include "flight/pid.h"

static bool pidAudioEnabled = false;

void pidAudioInit(void)
{
    audioSetupIO();
}

void pidAudioStart(void)
{
    audioGenerateWhiteNoise();
}

void pidAudioStop(void)
{
    audioSilence();
}

void pidAudioUpdate(void)
{
    bool newState = IS_RC_MODE_ACTIVE(BOXPIDAUDIO);

    if (pidAudioEnabled != newState) {
        if (newState) {
            pidAudioStart();
        } else {
            pidAudioStop();
        }
        pidAudioEnabled = newState;
    }

    if (!pidAudioEnabled) {
        return;
    }

    const uint32_t pidSumXY = MIN((ABS(axisPIDSum[FD_ROLL]) + ABS(axisPIDSum[FD_YAW])) / 2, PIDSUM_LIMIT);

    uint32_t tone = scaleRange(pidSumXY, 0, PIDSUM_LIMIT, TONE_MIN, TONE_MAX);
    audioPlayTone(tone);
}
