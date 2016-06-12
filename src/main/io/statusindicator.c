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
    WARNING_LED_PULSE,
    WARNING_LED_CODE,
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

static uint8_t ledCode = 0;

void warningLedCode(uint8_t code)
{
    warningLedState = WARNING_LED_CODE;
    ledCode = code;
}


void warningLedRefresh(void)
{
    uint32_t delay = 500000;
    static bool ledEnabled = false;
    static int codeCounter = 0;

    static warningLedState_e ledState = WARNING_LED_OFF;

    static bool finished = true;

    if (ledState != warningLedState && finished) {
        // new state ready to apply
        ledEnabled = false;
        ledState = warningLedState;
        finished = false;
    }


    switch (ledState) {
        case WARNING_LED_OFF:
            ledEnabled = false;
            finished = true;
            break;
        case WARNING_LED_ON:
            ledEnabled = true;
            finished = true;
            break;
        case WARNING_LED_FLASH:
            ledEnabled = !ledEnabled;

            if (!ledEnabled) {
                finished = true;
            }
            break;
        case WARNING_LED_PULSE:
            ledEnabled = !ledEnabled;

            if (ledEnabled) {
                delay = 200000; // short on
                finished = false;
            } else {
                delay = 900000; // long off
                finished = true;
            }

            break;
        case WARNING_LED_CODE:
            ledEnabled = !ledEnabled;
            finished = false;

            if (!ledEnabled) {
                if (codeCounter) {
                    codeCounter--;
                }
                if (codeCounter == 0) {
                    finished = true;
                    codeCounter = ledCode;
                }
            }

            if (!finished) {
                delay = 100000; // short on or off when counting down
            } else {
                delay = 900000; // long off after counter.
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

