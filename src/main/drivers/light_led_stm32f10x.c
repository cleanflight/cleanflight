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
#include <stdlib.h>

#include <platform.h>

#include "common/utils.h"

#include "system.h"
#include "gpio.h"

#include "light_led.h"

void ledInit(bool alternative_led)
{
    UNUSED(alternative_led);
#if defined(LED0) || defined(LED1) || defined(LED2)
    gpio_config_t cfg;
    cfg.mode = Mode_Out_PP;
    cfg.speed = Speed_2MHz;
#ifdef LED0
    RCC_APB2PeriphClockCmd(LED0_PERIPHERAL, ENABLE);
    led_config[0].gpio = LED0_GPIO;
    led_config[0].pin = LED0_PIN;
    cfg.pin = led_config[0].pin;
    LED0_OFF;
    gpioInit(led_config[0].gpio, &cfg);
#endif
#ifdef LED1
    RCC_APB2PeriphClockCmd(LED1_PERIPHERAL, ENABLE);
    led_config[1].gpio = LED1_GPIO;
    led_config[1].pin = LED1_PIN;
    cfg.pin = led_config[1].pin;
    LED1_OFF;
    gpioInit(led_config[1].gpio, &cfg);
#endif
#ifdef LED2
    RCC_APB2PeriphClockCmd(LED2_PERIPHERAL, ENABLE);
    led_config[2].gpio = LED2_GPIO;
    led_config[2].pin = LED2_PIN;
    cfg.pin = led_config[2].pin;
    LED2_OFF;
    gpioInit(led_config[2].gpio, &cfg);
#endif
#endif
}

