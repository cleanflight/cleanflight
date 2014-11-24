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

#define ENABLE_DEBUG_FAILSAFE   (1)

#if ENABLE_DEBUG_FAILSAFE > 0
extern int16_t debug[4];
#endif

/*
 * Usage:
 *
 * failsafeInit() and failsafeUseConfig() must be called before the other methods are used.
 *
 * failsafeInit() and failsafeUseConfig() can be called in any order.
 * failsafeInit() should only be called once.
 *
 * failsafeEnable() should be called after system initialisation.
 */

static failsafe_t failsafe;

static failsafeConfig_t *failsafeConfig;

static rxConfig_t *rxConfig;

void failsafeReset(void)
{
    failsafe.counter = 0;
#if ENABLE_DEBUG_FAILSAFE > 0
    debug[0] = 0;
#endif
}

/*
 * Should called when the failsafe config needs to be changed - e.g. a different profile has been selected.
 */
void failsafeUseConfig(failsafeConfig_t *failsafeConfigToUse)
{
    failsafeConfig = failsafeConfigToUse;
    failsafeReset();
}

failsafe_t* failsafeInit(rxConfig_t *intialRxConfig)
{
    rxConfig = intialRxConfig;

    failsafe.state = FAILSAFE_FSM_DISABLED;
#if ENABLE_DEBUG_FAILSAFE > 0
    debug[1] = FAILSAFE_FSM_DISABLED;
#endif
    return &failsafe;
}

bool failsafeIsIdle(void)
{
    return failsafe.counter == 0;
}

bool failsafeIsEnabled(void)
{
    return (FAILSAFE_FSM_DISABLED != failsafe.state);
}

void failsafeEnable(void)
{
    failsafe.state = FAILSAFE_FSM_ENABLED;
}

bool failsafeHasTimerElapsed(void)
{
    return failsafe.counter > (5 * failsafeConfig->failsafe_delay);
}

bool failsafeIsForcedLandingInProgress(void)
{
    return ((FAILSAFE_FSM_ENABLED < failsafe.state) && (FAILSAFE_FSM_COMPLETED > failsafe.state));
}

bool failsafeIsForcedLandingCompleted(void)
{
    return (FAILSAFE_FSM_COMPLETED == failsafe.state);
}

void failsafeAvoidRearm(void)
{
    // This will prevent the automatic rearm if failsafe shuts it down and prevents
    // to restart accidently by just reconnect to the tx - you will have to switch off first to rearm
    ENABLE_ARMING_FLAG(PREVENT_ARMING);
}

void failsafeOnValidDataReceived(void)
{
    if (failsafe.counter > 20) {
        failsafe.counter -= 20;
    } else {
        failsafe.counter = 0;
    }
#if ENABLE_DEBUG_FAILSAFE > 0
    debug[0] = failsafe.counter;
#endif
}

void failsafeUpdateState(void)
{
    uint8_t i;
    static int16_t downCounter = 0;

    if (downCounter > 0) {
        downCounter--;
    }

#if ENABLE_DEBUG_FAILSAFE > 0
    debug[1] = failsafe.state;
    debug[2] = downCounter;
#endif

    // Failsafe system state machine
    switch(failsafe.state) {
    case FAILSAFE_FSM_DISABLED:
        failsafeReset();
        break;

    case FAILSAFE_FSM_ENABLED:
        if (ARMING_FLAG(ARMED)) {
            if (failsafeHasTimerElapsed()) {
                // RC signal is lost for more then the specified guard time (in 0.1sec)
                failsafe.requestByRcSwitch = false;
                ENABLE_FLIGHT_MODE(FAILSAFE_MODE);
                downCounter = 5 * failsafeConfig->failsafe_off_delay;
                failsafe.state = FAILSAFE_FSM_LANDING;
            } else {
                if (IS_RC_MODE_ACTIVE(BOXFAILSAFE)) {
                    // RC switch for failsafe request is ON
                    failsafe.requestByRcSwitch = true;
                    ENABLE_FLIGHT_MODE(FAILSAFE_MODE);
                    downCounter = 5 * failsafeConfig->failsafe_off_delay;
                    failsafe.state = FAILSAFE_FSM_LANDING;
                }
            }
        } else {
            // to present failsafe switch is working in GUI
            if (IS_RC_MODE_ACTIVE(BOXFAILSAFE)) {
                ENABLE_FLIGHT_MODE(FAILSAFE_MODE);
            } else {
                DISABLE_FLIGHT_MODE(FAILSAFE_MODE);
            }
            // to prevent failsafe triggering when arming with a positive count.
            failsafeReset();
        }
        break;

    case FAILSAFE_FSM_LANDING:
        // Center stick positions and set Throttle to specified level
        for (i = 0; i < 3; i++) {
            rcData[i] = rxConfig->midrc;
        }
        rcData[THROTTLE] = failsafeConfig->failsafe_throttle;

        // Check abort conditions
        if (failsafeConfig->failsafe_abortable) {
            if (failsafe.requestByRcSwitch) {
                if (!IS_RC_MODE_ACTIVE(BOXFAILSAFE)) {
                    DISABLE_FLIGHT_MODE(FAILSAFE_MODE);
                    failsafe.state = FAILSAFE_FSM_ENABLED;
                }
            } else {
                if (failsafeIsIdle()) {
                    DISABLE_FLIGHT_MODE(FAILSAFE_MODE);
                    failsafe.state = FAILSAFE_FSM_ENABLED;
                }
            }
        }

        // Check for time-out condition
        if (!ARMING_FLAG(ARMED) || !downCounter) {
            failsafe.state = FAILSAFE_FSM_DISARMING;
        }
        break;

    case FAILSAFE_FSM_DISARMING:
        failsafeAvoidRearm();
        mwDisarm();
        DISABLE_FLIGHT_MODE(FAILSAFE_MODE);
        failsafe.state = FAILSAFE_FSM_COMPLETED;
        break;

    case FAILSAFE_FSM_COMPLETED:
        break;
    }
}

void failsafeIncrementCounter(void)
{
    if (failsafe.counter < 650) {               // clip counter to limit recovery time
        failsafe.counter++;
    }
#if ENABLE_DEBUG_FAILSAFE > 0
    debug[0] = failsafe.counter;
#endif
}

// pulse duration is in micro secons (usec)
void failsafeCheckPulse(uint8_t channel, uint16_t pulseDuration, int8_t channelCount)
{
    static uint8_t goodChannelCount;

    if (channel < channelCount &&
        pulseDuration > failsafeConfig->failsafe_min_usec &&
        pulseDuration < failsafeConfig->failsafe_max_usec
    )
        goodChannelCount++;                      // if signal is valid - count channel as OK

    if (++channel == channelCount) {
        if (goodChannelCount == channelCount) {  // If all channels have good pulses, clear FailSafe counter
            failsafeOnValidDataReceived();
        }
#if ENABLE_DEBUG_FAILSAFE > 0
        debug[3] = channelCount * 1000 + goodChannelCount;
#endif
        goodChannelCount = 0;
    }
}


