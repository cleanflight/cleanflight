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

#include "drivers/system.h"
#include "drivers/gpio.h"
#include "drivers/light_led.h"
#include "drivers/sound_beeper.h"

#include "statusindicator.h"

static uint32_t warningLedTimer = 0;

typedef enum {
    WARNING_LED_OFF = 0,
    WARNING_LED_ON,
    WARNING_LED_FLASH,
    WARNING_LED_PULSE
} warningLedState_e;

static warningLedState_e warningLedState = WARNING_LED_OFF;

void warningLedResetTimer(void)
{
    uint32_t now = millis();
    warningLedTimer = now + 500000;
}

void warningLedEnable(void)
{
    warningLedState = WARNING_LED_ON;
}

void warningLedDisable(void)
{
    warningLedState = WARNING_LED_OFF;
}

void warningLedFlash(void)
{
    warningLedState = WARNING_LED_FLASH;
}

void warningLedPulse(void)
{
    warningLedState = WARNING_LED_PULSE;
}


void warningLedRefresh(void)
{
    uint32_t delay = 500000;
    static bool ledEnabled = false;

    switch (warningLedState) {
        case WARNING_LED_OFF:
            ledEnabled = false;
            break;
        case WARNING_LED_ON:
            ledEnabled = true;
            break;
        case WARNING_LED_FLASH:
            ledEnabled = !ledEnabled;
            LED0_TOGGLE;
            break;
        case WARNING_LED_PULSE:
            ledEnabled = !ledEnabled;

            if (ledEnabled) {
                delay = 100000; // short on
            } else {
                delay = 900000; // long off
            }
            break;
    }

    if (ledEnabled) {
        LED0_ON;
    } else {
        LED0_OFF;
    }

    uint32_t now = micros();
    warningLedTimer = now + delay;
}

void warningLedUpdate(void)
{
    uint32_t now = micros();

    if ((int32_t)(now - warningLedTimer) < 0) {
        return;
    }

    warningLedRefresh();
}

