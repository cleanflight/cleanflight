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

#include "common/axis.h"

#include "rx/rx.h"
#include "io/escservo.h"
#include "io/rc_controls.h"
#include "config/runtime_config.h"

#include "flight/failsafe.h"

/*
 * Usage:
 *
 * failsafeInit() and useFailsafeConfig() must be called before the other methods are used.
 *
 * failsafeInit() and useFailsafeConfig() can be called in any order.
 * failsafeInit() should only be called once.
 *
 * enable() should be called after system initialisation.
 */

static failsafe_t failsafe;

static failsafeConfig_t *failsafeConfig;

static rxConfig_t *rxConfig;

const failsafeVTable_t failsafeVTable[];

void reset(void)
{
    failsafe.counter = 0;
}

/*
 * Should called when the failsafe config needs to be changed - e.g. a different profile has been selected.
 */
void useFailsafeConfig(failsafeConfig_t *failsafeConfigToUse)
{
    failsafeConfig = failsafeConfigToUse;
    reset();
}

failsafe_t* failsafeInit(rxConfig_t *intialRxConfig)
{
    rxConfig = intialRxConfig;

    failsafe.vTable = failsafeVTable;
    failsafe.events = 0;
    failsafe.state = FAILSAFE_FSM_DISABLED;

    return &failsafe;
}

bool isIdle(void)
{
    return failsafe.counter == 0;
}

bool isEnabled(void)
{
    return failsafe.state > FAILSAFE_FSM_DISABLED;
}

void enable(void)
{
    failsafe.state = FAILSAFE_FSM_ENABLED;
}

bool hasTimerElapsed(void)
{
    return failsafe.counter > (5 * failsafeConfig->failsafe_delay);
}

bool forcedLandingInProgress(void)
{
    return failsafe.state == FAILSAFE_FSM_LANDING;
}

bool forcedLandingFinished(void)
{
    return failsafe.state == FAILSAFE_FSM_FINISHED;
}

void failsafeAvoidRearm(void)
{
    // This will prevent the automatic rearm if failsafe shuts it down and prevents
    // to restart accidently by just reconnect to the tx - you will have to switch off first to rearm
    ENABLE_ARMING_FLAG(PREVENT_ARMING);
}

void onValidDataReceived(void)
{
    if (failsafe.counter > 20)
        failsafe.counter -= 20;
    else
        failsafe.counter = 0;
}

void updateState(void)
{
    uint8_t i;
    static uint32_t downCounter = 0;

    if (downCounter) {
        downCounter--;
    }

    // Failsafe system state machine
    switch(failsafe.state) {
    case FAILSAFE_FSM_DISABLED:
        reset();
        break;

    case FAILSAFE_FSM_ENABLED:
        if (ARMING_FLAG(ARMED) && hasTimerElapsed()) {
            // RC signal is lost for more then the specified guard time (in 0.1sec)
            failsafe.events++;
            downCounter = 5 * failsafeConfig->failsafe_off_delay;
            failsafe.state = FAILSAFE_FSM_LANDING;
        }
        break;

    case FAILSAFE_FSM_LANDING:
        // Center stick positions and set Throttle to specified level
        for (i = 0; i < 3; i++) {
            rcData[i] = rxConfig->midrc;
        }
        rcData[THROTTLE] = failsafeConfig->failsafe_throttle;

        if (isIdle() && failsafeConfig->failsafe_abortable) {
            failsafe.state = FAILSAFE_FSM_ENABLED;
        }

        if (!ARMING_FLAG(ARMED) || !downCounter) {
            failsafeAvoidRearm();
            mwDisarm();
            failsafe.state = FAILSAFE_FSM_FINISHED;
        }
        break;

    case FAILSAFE_FSM_FINISHED:
        break;
    }
}

void incrementCounter(void)
{
    failsafe.counter++;
}

// pulse duration is in micro secons (usec)
void checkPulse(uint8_t channel, uint16_t pulseDuration)
{
    static uint8_t goodChannelMask;

    if (channel < 6 &&
        pulseDuration > failsafeConfig->failsafe_min_usec &&
        pulseDuration < failsafeConfig->failsafe_max_usec
    )
        goodChannelMask |= (1 << channel);       // if signal is valid - mark channel as OK

    if (goodChannelMask == 0x3F) {               // If first six channels have good pulses, clear FailSafe counter
        goodChannelMask = 0;
        onValidDataReceived();
    }
}


const failsafeVTable_t failsafeVTable[] = {
    {
        reset,
        forcedLandingInProgress,
        hasTimerElapsed,
        forcedLandingFinished,
        incrementCounter,
        updateState,
        isIdle,
        checkPulse,
        isEnabled,
        enable,
    }
};


