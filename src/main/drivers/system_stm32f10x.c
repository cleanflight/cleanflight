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

#include "platform.h"

#include "gpio.h"
#include "system.h"

#define AIRCR_VECTKEY_MASK    ((uint32_t)0x05FA0000)

void systemReset(void)
{
    // Generate system reset
    SCB->AIRCR = AIRCR_VECTKEY_MASK | (uint32_t)0x04;
}

void systemResetToBootloader(void) {
    // 1FFFF000 -> 20000200 -> SP
    // 1FFFF004 -> 1FFFF021 -> PC

    *((uint32_t *)0x20004FF0) = 0xDEADBEEF; // 20KB STM32F103
    systemReset();
}


void enableGPIOPowerUsageAndNoiseReductions(void)
{
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_GPIOB | RCC_APB2Periph_GPIOC, ENABLE);

    gpio_config_t gpio;

    gpio.mode = Mode_AIN;
    gpio.pin = Pin_All;
    gpioInit(GPIOA, &gpio);
    gpioInit(GPIOB, &gpio);
    gpioInit(GPIOC, &gpio);
}

bool isMPUSoftReset(void)
{
    if (cachedRccCsrValue & RCC_CSR_SFTRSTF)
        return true;
    else
        return false;
}


void writeDesiredFeatures(uint32_t desiredFeatures)
{
    // Enable access to BKP regs
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR | RCC_APB1Periph_BKP, ENABLE);
    PWR->CR |= PWR_CR_DBP;
    // Write the desires features in RTC backup registers BKP_DR3 and BKP_DR4
    *((uint16_t *)BKP_BASE + 0x0C) = (desiredFeatures & 0xffff);
    *((uint16_t *)BKP_BASE + 0x10) = ((desiredFeatures  >> 16) & 0xffff);
}

uint32_t readDesiredFeatures(void)
{
    uint32_t desiredFeatures;

    // Enable access to BKP regs
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR | RCC_APB1Periph_BKP, ENABLE);
    PWR->CR |= PWR_CR_DBP;
    desiredFeatures  = *((uint16_t *)BKP_BASE + 0x0C);
    desiredFeatures |= (*((uint16_t *)BKP_BASE + 0x10) << 16) & 0xffff0000;
    return desiredFeatures;
}

