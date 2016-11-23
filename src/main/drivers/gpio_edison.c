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

#include "gpio.h"
#include <mraa.h>

void gpioInit(GPIO_TypeDef *gpio)
{
    gpio->context = mraa_gpio_init(gpio->pin);
    if(gpio->mode == Out)
        mraa_gpio_dir(gpio->context, MRAA_GPIO_OUT);
    else if(gpio->mode == In)
        mraa_gpio_dir(gpio->context, MRAA_GPIO_IN);
}

void gpioPinRemapConfig(uint32_t remap, bool enable)
{
    //Dummy function for now. Not used anywhere
}
