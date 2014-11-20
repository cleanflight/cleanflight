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

#pragma once

#define FAILSAFE_POWER_ON_DELAY_US (1000 * 1000 * 5)

typedef enum {
    FAILSAFE_FSM_DISABLED = 0,              // failsafe system is: disabled
    FAILSAFE_FSM_ENABLED,                   // enabled and waiting for failsafe event
    FAILSAFE_FSM_LANDING,              // failsafe event occured, landing attempt in progress
    FAILSAFE_FSM_FINISHED                   // failsafe landing procedure completed
} failsafeState_e;

typedef struct failsafeConfig_s {
    uint8_t failsafe_delay;                 // Guard time for failsafe activation after signal lost. 1 step = 0.1sec - 1sec in example (10)
    uint8_t failsafe_off_delay;             // Time for Landing before motors stop in 0.1sec. 1 step = 0.1sec - 20sec in example (200)
    uint16_t failsafe_throttle;             // Throttle level used for landing - specify value between 1000..2000 (pwm pulse width for slightly below hover). center throttle = 1500.
    uint16_t failsafe_min_usec;
    uint16_t failsafe_max_usec;
    uint8_t failsafe_abortable;             // 0: failsafe action cannot be aborted, 1: can be aborted
} failsafeConfig_t;

typedef struct failsafeVTable_s {
    void (*reset)(void);
    bool (*forcedLandingInProgress)(void);
    bool (*hasTimerElapsed)(void);
    bool (*forcedLandingFinished)(void);
    void (*incrementCounter)(void);
    void (*updateState)(void);
    bool (*isIdle)(void);
    void (*checkPulse)(uint8_t channel, uint16_t pulseDuration);
    bool (*isEnabled)(void);
    void (*enable)(void);

} failsafeVTable_t;

typedef struct failsafe_s {
    const failsafeVTable_t *vTable;

    int16_t counter;
    int16_t events;
    bool enabled;
    failsafeState_e state;
} failsafe_t;

void useFailsafeConfig(failsafeConfig_t *failsafeConfigToUse);

