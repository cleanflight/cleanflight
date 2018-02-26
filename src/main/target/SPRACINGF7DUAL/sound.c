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

/*
 * Usage
 *
 * On boot, press and hold button A, LED 0 will turn on and stay on, release button a and a tone will be generated and an LED will flash.
 * Press and release button again to stop the tone and continue booting.
 */

#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

#include "platform.h"

#include "build/debug.h"

#include "drivers/system.h"
#include "drivers/time.h"
#include "drivers/io.h"
#include "drivers/light_led.h"
#include "drivers/buttons.h"
#include "drivers/nvic.h"

DAC_HandleTypeDef hdac;
TIM_HandleTypeDef handle;

// C D E F G A B C
static const int freq_table[] = {262, 293, 330, 349, 392, 440, 493, 523};

#define DAC_Frequency 20454 // Note: this needs to be an exact multiple of 1000000 / freq otherwise the generated sine wave will not be repeated an exact amount of times.

void TIM6_DAC_IRQHandler(void)
{
    if(__HAL_TIM_GET_IT_SOURCE(&handle, TIM_IT_UPDATE) != RESET)
    {
        __HAL_TIM_CLEAR_IT(&handle, TIM_IT_UPDATE);

        int pos = micros() % DAC_Frequency;

        int period = 1000000 / freq_table[5];
        float s = sin((pos * 3.14159265359f * 2.0f) / period);
        float x = (s / 2.0f) + 0.5f;
        int i = 4095 * x;
        HAL_DAC_SetValue(&hdac, DAC_CHANNEL_1, DAC_ALIGN_12B_R, i);
    }
}

void testSound(void)
{
    if (!buttonAPressed()) {
        return;
    };

    LED0_ON;
    while (buttonAPressed()) {
        delay(25);
    };
    LED0_OFF;

    delay(200); // debounce switch

    __HAL_RCC_DAC_CLK_ENABLE();

    hdac.Instance = DAC;
    HAL_DAC_Init(&hdac);


    DAC_ChannelConfTypeDef sConfig;
    sConfig.DAC_Trigger = DAC_TRIGGER_NONE;
    sConfig.DAC_OutputBuffer = DAC_OUTPUTBUFFER_ENABLE;
    HAL_DAC_ConfigChannel(&hdac, &sConfig, DAC_CHANNEL_1);

    GPIO_InitTypeDef GPIO_InitStruct;
    GPIO_InitStruct.Pin = GPIO_PIN_4;
    GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

    HAL_DAC_Start(&hdac, DAC_CHANNEL_1);


#if 0
    // Saw swave

    while(!buttonAPressed()) {
        LED0_TOGGLE;
        for (int i = 0; i <= 4095; i += 1) {
            HAL_DAC_SetValue(&hdac, DAC_CHANNEL_1, DAC_ALIGN_12B_R, i);
            delayMicroseconds(10);
        }

        for (int i = 4095; i >= 0; i -= 1) {
            HAL_DAC_SetValue(&hdac, DAC_CHANNEL_1, DAC_ALIGN_12B_R, i);
            delayMicroseconds(10);
        }
    }
#else

    //Sine wave

    __HAL_RCC_TIM6_CLK_ENABLE();

    handle.Instance = TIM6;
    handle.Init.Period = 54000000L / DAC_Frequency; // TIM6 is on APB1 at 54Mhz
    handle.Init.Prescaler = 0;

    handle.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
    handle.Init.CounterMode = TIM_COUNTERMODE_UP;
    handle.Init.RepetitionCounter = 0;
    HAL_TIM_Base_Init(&handle);

//    HAL_TIM_Base_Start(&handle);

    HAL_TIM_Base_Start_IT(&handle);

    HAL_NVIC_SetPriority(TIM6_DAC_IRQn, NVIC_PRIORITY_BASE(NVIC_PRIO_TIMER), NVIC_PRIORITY_SUB(NVIC_PRIO_TIMER));
    HAL_NVIC_EnableIRQ(TIM6_DAC_IRQn);

    while(!buttonAPressed()) {
        LED0_TOGGLE;
        delay(100);
    }

    HAL_NVIC_DisableIRQ(TIM6_DAC_IRQn);
    HAL_TIM_Base_Stop_IT(&handle);
    HAL_TIM_Base_DeInit(&handle);
#endif

    LED0_ON;
    while (buttonAPressed()) {
        delay(25);
    };
    LED0_OFF;

}
