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
#include <string.h>

#include <math.h>

#include "platform.h"

#include "blackbox/blackbox.h"

#include "build/build_config.h"

#include "common/axis.h"
#include "common/maths.h"
#include "common/utils.h"

#include "drivers/time.h"

#include "config/parameter_group.h"
#include "config/parameter_group_ids.h"
#include "config/feature.h"

#include "flight/pid.h"

#include "io/beeper.h"
#include "io/motors.h"

#include "fc/config.h"
#include "fc/controlrate_profile.h"
#include "fc/rc_adjustments.h"
#include "fc/rc_controls.h"
#include "fc/fc_rc.h"

#include "rx/rx.h"

PG_REGISTER_ARRAY(adjustmentRange_t, MAX_ADJUSTMENT_RANGE_COUNT, adjustmentRanges, PG_ADJUSTMENT_RANGE_CONFIG, 0);

static pidProfile_t *pidProfile;

static void blackboxLogInflightAdjustmentEvent(adjustmentFunction_e adjustmentFunction, int32_t newValue)
{
#ifndef BLACKBOX
    UNUSED(adjustmentFunction);
    UNUSED(newValue);
#else
    if (blackboxConfig()->device) {
        flightLogEvent_inflightAdjustment_t eventData;
        eventData.adjustmentFunction = adjustmentFunction;
        eventData.newValue = newValue;
        eventData.floatFlag = false;
        blackboxLogEvent(FLIGHT_LOG_EVENT_INFLIGHT_ADJUSTMENT, (flightLogEventData_t*)&eventData);
    }
#endif
}

#if 0
static void blackboxLogInflightAdjustmentEventFloat(adjustmentFunction_e adjustmentFunction, float newFloatValue)
{
#ifndef BLACKBOX
    UNUSED(adjustmentFunction);
    UNUSED(newFloatValue);
#else
    if (blackboxConfig()->device) {
        flightLogEvent_inflightAdjustment_t eventData;
        eventData.adjustmentFunction = adjustmentFunction;
        eventData.newFloatValue = newFloatValue;
        eventData.floatFlag = true;
        blackboxLogEvent(FLIGHT_LOG_EVENT_INFLIGHT_ADJUSTMENT, (flightLogEventData_t*)&eventData);
    }
#endif
}
#endif

STATIC_UNIT_TESTED uint8_t adjustmentStateMask = 0;

#define MARK_ADJUSTMENT_FUNCTION_AS_BUSY(adjustmentIndex) adjustmentStateMask |= (1 << adjustmentIndex)
#define MARK_ADJUSTMENT_FUNCTION_AS_READY(adjustmentIndex) adjustmentStateMask &= ~(1 << adjustmentIndex)

#define IS_ADJUSTMENT_FUNCTION_BUSY(adjustmentIndex) (adjustmentStateMask & (1 << adjustmentIndex))

// sync with adjustmentFunction_e
static const adjustmentConfig_t defaultAdjustmentConfigs[ADJUSTMENT_FUNCTION_COUNT - 1] = {
    {
        .adjustmentFunction = ADJUSTMENT_RC_RATE,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_RC_EXPO,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_THROTTLE_EXPO,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_PITCH_ROLL_RATE,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_YAW_RATE,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_PITCH_ROLL_P,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_PITCH_ROLL_I,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_PITCH_ROLL_D,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_YAW_P,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_YAW_I,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_YAW_D,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_RATE_PROFILE,
        .mode = ADJUSTMENT_MODE_SELECT,
        .data = { .switchPositions = 3 }
    }, {
        .adjustmentFunction = ADJUSTMENT_PITCH_RATE,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_ROLL_RATE,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_PITCH_P,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_PITCH_I,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_PITCH_D,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_ROLL_P,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_ROLL_I,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_ROLL_D,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_RC_RATE_YAW,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_D_SETPOINT,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_D_SETPOINT_TRANSITION,
        .mode = ADJUSTMENT_MODE_STEP,
        .data = { .step = 1 }
    }, {
        .adjustmentFunction = ADJUSTMENT_HORIZON_STRENGTH,
        .mode = ADJUSTMENT_MODE_SELECT,
        .data = { .switchPositions = 255 }

    }
};

#define ADJUSTMENT_FUNCTION_CONFIG_INDEX_OFFSET 1

STATIC_UNIT_TESTED adjustmentState_t adjustmentStates[MAX_SIMULTANEOUS_ADJUSTMENT_COUNT];

STATIC_UNIT_TESTED void configureAdjustment(uint8_t index, uint8_t auxSwitchChannelIndex, const adjustmentConfig_t *adjustmentConfig)
{
    adjustmentState_t *adjustmentState = &adjustmentStates[index];

    if (adjustmentState->config == adjustmentConfig) {
        // already configured
        return;
    }
    adjustmentState->auxChannelIndex = auxSwitchChannelIndex;
    adjustmentState->config = adjustmentConfig;
    adjustmentState->timeoutAt = 0;

    MARK_ADJUSTMENT_FUNCTION_AS_READY(index);
}

static void applyStepAdjustment(controlRateConfig_t *controlRateConfig, uint8_t adjustmentFunction, int delta)
{

    beeperConfirmationBeeps(delta > 0 ? 2 : 1);
    int newValue;
    switch (adjustmentFunction) {
    case ADJUSTMENT_RC_RATE:
        newValue = constrain((int)controlRateConfig->rcRate8 + delta, 0, 250); // FIXME magic numbers repeated in cli.c
        controlRateConfig->rcRate8 = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_RC_RATE, newValue);
        break;
    case ADJUSTMENT_RC_EXPO:
        newValue = constrain((int)controlRateConfig->rcExpo8 + delta, 0, 100); // FIXME magic numbers repeated in cli.c
        controlRateConfig->rcExpo8 = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_RC_EXPO, newValue);
        break;
    case ADJUSTMENT_THROTTLE_EXPO:
        newValue = constrain((int)controlRateConfig->thrExpo8 + delta, 0, 100); // FIXME magic numbers repeated in cli.c
        controlRateConfig->thrExpo8 = newValue;
        generateThrottleCurve();
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_THROTTLE_EXPO, newValue);
        break;
    case ADJUSTMENT_PITCH_ROLL_RATE:
    case ADJUSTMENT_PITCH_RATE:
        newValue = constrain((int)controlRateConfig->rates[FD_PITCH] + delta, 0, CONTROL_RATE_CONFIG_ROLL_PITCH_RATE_MAX);
        controlRateConfig->rates[FD_PITCH] = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_PITCH_RATE, newValue);
        if (adjustmentFunction == ADJUSTMENT_PITCH_RATE) {
            break;
        }
        // follow though for combined ADJUSTMENT_PITCH_ROLL_RATE
    case ADJUSTMENT_ROLL_RATE:
        newValue = constrain((int)controlRateConfig->rates[FD_ROLL] + delta, 0, CONTROL_RATE_CONFIG_ROLL_PITCH_RATE_MAX);
        controlRateConfig->rates[FD_ROLL] = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_ROLL_RATE, newValue);
        break;
    case ADJUSTMENT_YAW_RATE:
        newValue = constrain((int)controlRateConfig->rates[FD_YAW] + delta, 0, CONTROL_RATE_CONFIG_YAW_RATE_MAX);
        controlRateConfig->rates[FD_YAW] = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_YAW_RATE, newValue);
        break;
    case ADJUSTMENT_PITCH_ROLL_P:
    case ADJUSTMENT_PITCH_P:
        newValue = constrain((int)pidProfile->pid[PID_PITCH].P + delta, 0, 200); // FIXME magic numbers repeated in cli.c
        pidProfile->pid[PID_PITCH].P = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_PITCH_P, newValue);

        if (adjustmentFunction == ADJUSTMENT_PITCH_P) {
            break;
        }
        // follow though for combined ADJUSTMENT_PITCH_ROLL_P
    case ADJUSTMENT_ROLL_P:
        newValue = constrain((int)pidProfile->pid[PID_ROLL].P + delta, 0, 200); // FIXME magic numbers repeated in cli.c
        pidProfile->pid[PID_ROLL].P = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_ROLL_P, newValue);
        break;
    case ADJUSTMENT_PITCH_ROLL_I:
    case ADJUSTMENT_PITCH_I:
        newValue = constrain((int)pidProfile->pid[PID_PITCH].I + delta, 0, 200); // FIXME magic numbers repeated in cli.c
        pidProfile->pid[PID_PITCH].I = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_PITCH_I, newValue);
        if (adjustmentFunction == ADJUSTMENT_PITCH_I) {
            break;
        }
        // fall though for combined ADJUSTMENT_PITCH_ROLL_I
    case ADJUSTMENT_ROLL_I:
        newValue = constrain((int)pidProfile->pid[PID_ROLL].I + delta, 0, 200); // FIXME magic numbers repeated in cli.c
        pidProfile->pid[PID_ROLL].I = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_ROLL_I, newValue);
        break;
    case ADJUSTMENT_PITCH_ROLL_D:
    case ADJUSTMENT_PITCH_D:
        newValue = constrain((int)pidProfile->pid[PID_PITCH].D + delta, 0, 200); // FIXME magic numbers repeated in cli.c
        pidProfile->pid[PID_PITCH].D = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_PITCH_D, newValue);
        if (adjustmentFunction == ADJUSTMENT_PITCH_D) {
            break;
        }
        // fall though for combined ADJUSTMENT_PITCH_ROLL_D
    case ADJUSTMENT_ROLL_D:
        newValue = constrain((int)pidProfile->pid[PID_ROLL].D + delta, 0, 200); // FIXME magic numbers repeated in cli.c
        pidProfile->pid[PID_ROLL].D = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_ROLL_D, newValue);
        break;
    case ADJUSTMENT_YAW_P:
        newValue = constrain((int)pidProfile->pid[PID_YAW].P + delta, 0, 200); // FIXME magic numbers repeated in cli.c
        pidProfile->pid[PID_YAW].P = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_YAW_P, newValue);
        break;
    case ADJUSTMENT_YAW_I:
        newValue = constrain((int)pidProfile->pid[PID_YAW].I + delta, 0, 200); // FIXME magic numbers repeated in cli.c
        pidProfile->pid[PID_YAW].I = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_YAW_I, newValue);
        break;
    case ADJUSTMENT_YAW_D:
        newValue = constrain((int)pidProfile->pid[PID_YAW].D + delta, 0, 200); // FIXME magic numbers repeated in cli.c
        pidProfile->pid[PID_YAW].D = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_YAW_D, newValue);
        break;
    case ADJUSTMENT_RC_RATE_YAW:
        newValue = constrain((int)controlRateConfig->rcYawRate8 + delta, 0, 300); // FIXME magic numbers repeated in cli.c
        controlRateConfig->rcYawRate8 = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_RC_RATE_YAW, newValue);
        break;
    case ADJUSTMENT_D_SETPOINT:
        newValue = constrain((int)pidProfile->dtermSetpointWeight + delta, 0, 254); // FIXME magic numbers repeated in cli.c
        pidProfile->dtermSetpointWeight = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_D_SETPOINT, newValue);
        break;
    case ADJUSTMENT_D_SETPOINT_TRANSITION:
        newValue = constrain((int)pidProfile->setpointRelaxRatio + delta, 1, 100); // FIXME magic numbers repeated in cli.c
        pidProfile->setpointRelaxRatio = newValue;
        blackboxLogInflightAdjustmentEvent(ADJUSTMENT_D_SETPOINT_TRANSITION, newValue);
        break;
    default:
        break;
    };
}

static void applySelectAdjustment(uint8_t adjustmentFunction, uint8_t position)
{
    uint8_t beeps = 0;

    switch (adjustmentFunction) {
    case ADJUSTMENT_RATE_PROFILE:
        {
            if (getCurrentControlRateProfileIndex() != position) {
                changeControlRateProfile(position);
                blackboxLogInflightAdjustmentEvent(ADJUSTMENT_RATE_PROFILE, position);
                beeps = position + 1;
            }
            break;
        }
    case ADJUSTMENT_HORIZON_STRENGTH:
        {
            uint8_t newValue = constrain(position, 0, 200); // FIXME magic numbers repeated in serial_cli.c
            if (pidProfile->pid[PID_LEVEL].D != newValue) {
                beeps = ((newValue - pidProfile->pid[PID_LEVEL].D) / 8) + 1;
                pidProfile->pid[PID_LEVEL].D = newValue;
                blackboxLogInflightAdjustmentEvent(ADJUSTMENT_HORIZON_STRENGTH, position);
            }
            break;
        }
    }

    if (beeps) {
        beeperConfirmationBeeps(beeps);
    }

}

#define RESET_FREQUENCY_2HZ (1000 / 2)

void processRcAdjustments(controlRateConfig_t *controlRateConfig)
{
    const uint32_t now = millis();

    const bool canUseRxData = rxIsReceivingSignal();

    for (int adjustmentIndex = 0; adjustmentIndex < MAX_SIMULTANEOUS_ADJUSTMENT_COUNT; adjustmentIndex++) {
        adjustmentState_t *adjustmentState = &adjustmentStates[adjustmentIndex];

        if (!adjustmentState->config) {
            continue;
        }
        const uint8_t adjustmentFunction = adjustmentState->config->adjustmentFunction;
        if (adjustmentFunction == ADJUSTMENT_NONE) {
            continue;
        }

        if (cmp32(now, adjustmentState->timeoutAt) >= 0) {
            adjustmentState->timeoutAt = now + RESET_FREQUENCY_2HZ;
            MARK_ADJUSTMENT_FUNCTION_AS_READY(adjustmentIndex);
        }

        if (!canUseRxData) {
            continue;
        }

        const uint8_t channelIndex = NON_AUX_CHANNEL_COUNT + adjustmentState->auxChannelIndex;

        if (adjustmentState->config->mode == ADJUSTMENT_MODE_STEP) {
            int delta;
            if (rcData[channelIndex] > rxConfig()->midrc + 200) {
                delta = adjustmentState->config->data.step;
            } else if (rcData[channelIndex] < rxConfig()->midrc - 200) {
                delta = -adjustmentState->config->data.step;
            } else {
                // returning the switch to the middle immediately resets the ready state
                MARK_ADJUSTMENT_FUNCTION_AS_READY(adjustmentIndex);
                adjustmentState->timeoutAt = now + RESET_FREQUENCY_2HZ;
                continue;
            }
            if (IS_ADJUSTMENT_FUNCTION_BUSY(adjustmentIndex)) {
                continue;
            }

            applyStepAdjustment(controlRateConfig, adjustmentFunction, delta);
            pidInitConfig(pidProfile);
        } else if (adjustmentState->config->mode == ADJUSTMENT_MODE_SELECT) {
            const uint16_t rangeWidth = ((2100 - 900) / adjustmentState->config->data.switchPositions);
            const uint8_t position = (constrain(rcData[channelIndex], 900, 2100 - 1) - 900) / rangeWidth;
            applySelectAdjustment(adjustmentFunction, position);
        }
        MARK_ADJUSTMENT_FUNCTION_AS_BUSY(adjustmentIndex);
    }
}

void resetAdjustmentStates(void)
{
    memset(adjustmentStates, 0, sizeof(adjustmentStates));
}

void updateAdjustmentStates(void)
{
    for (int index = 0; index < MAX_ADJUSTMENT_RANGE_COUNT; index++) {
        const adjustmentRange_t * const adjustmentRange = adjustmentRanges(index);
        if (isRangeActive(adjustmentRange->auxChannelIndex, &adjustmentRange->range)) {
            const adjustmentConfig_t *adjustmentConfig = &defaultAdjustmentConfigs[adjustmentRange->adjustmentFunction - ADJUSTMENT_FUNCTION_CONFIG_INDEX_OFFSET];
            configureAdjustment(adjustmentRange->adjustmentIndex, adjustmentRange->auxSwitchChannelIndex, adjustmentConfig);
        }
    }
}

void useAdjustmentConfig(pidProfile_t *pidProfileToUse)
{
    pidProfile = pidProfileToUse;
}
