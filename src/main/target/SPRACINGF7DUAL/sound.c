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

//#define TEST_REQUIRE_BUTTON_TO_START

//#define TEST_DAC_TRIANGLE_VIA_CPU
//#define TEST_DAC_SINE_VIA_DMA
//#define TEST_DAC_TRIANGLE_VIA_TIMER
#define TEST_DAC_NOISE

#ifdef TEST_DAC_SINE_VIA_DMA

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
#endif

#ifdef TEST_DAC_TRIANGLE_VIA_TIMER

static uint32_t tim6Triggers = 0;

void TIM6_DAC_IRQHandler(void)
{
    if(__HAL_TIM_GET_IT_SOURCE(&handle, TIM_IT_UPDATE) != RESET)
    {
        __HAL_TIM_CLEAR_IT(&handle, TIM_IT_UPDATE);

        tim6Triggers++;
    }
}
#endif

void testSound(void)
{
#ifdef TEST_REQUIRE_BUTTON_TO_START
    if (!buttonAPressed()) {
        return;
    };

    LED0_ON;
    while (buttonAPressed()) {
        delay(25);
    };
    LED0_OFF;
#endif

    delay(200); // debounce switch

    __HAL_RCC_DAC_CLK_ENABLE();

    hdac.Instance = DAC;
    HAL_DAC_Init(&hdac);


    DAC_ChannelConfTypeDef sConfig;

    GPIO_InitTypeDef GPIO_InitStruct;
    GPIO_InitStruct.Pin = GPIO_PIN_4;
    GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);



#ifdef TEST_DAC_TRIANGLE_VIA_CPU
    // Triangle wave

    sConfig.DAC_Trigger = DAC_TRIGGER_NONE;
    sConfig.DAC_OutputBuffer = DAC_OUTPUTBUFFER_ENABLE;
    HAL_DAC_ConfigChannel(&hdac, &sConfig, DAC_CHANNEL_1);

    HAL_DAC_Start(&hdac, DAC_CHANNEL_1);

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
#endif

#ifdef TEST_DAC_SINE_VIA_DMA
    //Sine wave

    sConfig.DAC_Trigger = DAC_TRIGGER_NONE;
    sConfig.DAC_OutputBuffer = DAC_OUTPUTBUFFER_ENABLE;
    HAL_DAC_ConfigChannel(&hdac, &sConfig, DAC_CHANNEL_1);

    HAL_DAC_Start(&hdac, DAC_CHANNEL_1);

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

#ifdef TEST_DAC_TRIANGLE_VIA_TIMER
    //Timer triggered triangle wave

    __HAL_RCC_TIM6_CLK_ENABLE();

    handle.Instance = TIM6;
    handle.Init.Period = 46; // (54000000L / (1000000L / 440 / 2)) / 1024; // TIM6 is on APB1 at 54Mhz
    handle.Init.Prescaler = 0;

    handle.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
    handle.Init.CounterMode = TIM_COUNTERMODE_UP;
    handle.Init.RepetitionCounter = 0;
    HAL_TIM_Base_Init(&handle);

    TIM_MasterConfigTypeDef sMasterConfig;
    sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_ENABLE;
    sMasterConfig.MasterOutputTrigger = TIM_TRGO_UPDATE;
    HAL_TIMEx_MasterConfigSynchronization(&handle, &sMasterConfig);

    HAL_TIM_Base_Start(&handle);

    //HAL_TIM_Base_Start_IT(&handle);

    // fixme no need for NVIC
    HAL_NVIC_SetPriority(TIM6_DAC_IRQn, NVIC_PRIORITY_BASE(NVIC_PRIO_TIMER), NVIC_PRIORITY_SUB(NVIC_PRIO_TIMER));
    HAL_NVIC_EnableIRQ(TIM6_DAC_IRQn);

    sConfig.DAC_Trigger = DAC_TRIGGER_T6_TRGO;
    sConfig.DAC_OutputBuffer = DAC_OUTPUTBUFFER_ENABLE;
    HAL_DAC_ConfigChannel(&hdac, &sConfig, DAC_CHANNEL_1);

    HAL_DACEx_TriangleWaveGenerate(&hdac, DAC_CHANNEL_1, DAC_TRIANGLEAMPLITUDE_1023);

    HAL_DAC_SetValue(&hdac, DAC_CHANNEL_1, DAC_ALIGN_12B_R, 0xC00);

    HAL_DAC_Start(&hdac, DAC_CHANNEL_1);

    while(!buttonAPressed()) {
        LED0_TOGGLE;
        delay(100);
    }

    HAL_NVIC_DisableIRQ(TIM6_DAC_IRQn);
    HAL_TIM_Base_Stop_IT(&handle);
    HAL_TIM_Base_DeInit(&handle);
#endif

#ifdef TEST_DAC_NOISE

    __HAL_RCC_TIM6_CLK_ENABLE();

    handle.Instance = TIM6;
    handle.Init.Period = 0xFF; // 42Mhz / 256 = 16.406khz
    handle.Init.Prescaler = 0;

    handle.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
    handle.Init.CounterMode = TIM_COUNTERMODE_UP;
    handle.Init.RepetitionCounter = 0;
    HAL_TIM_Base_Init(&handle);

    TIM_MasterConfigTypeDef sMasterConfig;
    sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_ENABLE;
    sMasterConfig.MasterOutputTrigger = TIM_TRGO_UPDATE;
    HAL_TIMEx_MasterConfigSynchronization(&handle, &sMasterConfig);

    HAL_TIM_Base_Start(&handle);

    sConfig.DAC_Trigger = DAC_TRIGGER_T6_TRGO;
    sConfig.DAC_OutputBuffer = DAC_OUTPUTBUFFER_ENABLE;
    HAL_DAC_ConfigChannel(&hdac, &sConfig, DAC_CHANNEL_1);

    // good values
    // DAC_LFSRUNMASK_BITS10_0, 0xcd00

    HAL_DACEx_NoiseWaveGenerate(&hdac, DAC_CHANNEL_1, DAC_LFSRUNMASK_BITS10_0);
    uint32_t value = 0xcd00;
    HAL_DAC_SetValue(&hdac, DAC_CHANNEL_1, DAC_ALIGN_12B_L, value);

    HAL_DAC_Start(&hdac, DAC_CHANNEL_1);

    uint8_t mode = 1;
    bool advance = false;
    bool autoAdvance = true;
    uint8_t advanceMs = 50;
    LED0_OFF;

    timeMs_t advanceAt = millis() + advanceMs;

    while(1) {

        const timeMs_t start = millis();

        if (buttonAPressed()) {
            while (buttonAPressed()) {
                delay(50);
                LED0_TOGGLE;
            }

            const timeMs_t end = millis();

            int32_t diff = cmp32(end, start);
            if (diff > 25 && diff <= 500) {
                advance = true;
            } else if (diff > 500 && diff <= 1000) {
                mode = 0;
                LED0_ON;
            } else if (diff > 1000 && diff <= 2000) {
                mode = 1;
                LED0_OFF;
            } else if (diff > 2000 && diff <= 3000) {
                autoAdvance = !autoAdvance;
            }
        } else {
            if (autoAdvance) {
                int32_t diff = cmp32(start, advanceAt);
                if (diff > 0) {
                    advanceAt = start + advanceMs;
                    advance = true;
                }
            }
        }


        if (advance) {
            advance = false;

            LED0_TOGGLE;
            delay(250);
            LED0_TOGGLE;

            switch(mode) {
            case 0: {
                    value += 0x1000;
                    HAL_DAC_SetValue(&hdac, DAC_CHANNEL_1, DAC_ALIGN_12B_L, value);
                }
                break;
            case 1:
                {
                    uint32_t newPeriod = handle.Init.Period + 8;
                    if (newPeriod > 576) {
                        newPeriod = 64;
                    }
                    handle.Init.Period = newPeriod;
                    TIM_Base_SetConfig(handle.Instance, &handle.Init);
                }
                break;
            }
        }
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
