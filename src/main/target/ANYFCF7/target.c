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

#include <stdint.h>

#include <platform.h>
#include "drivers/io.h"

#include "drivers/dma.h"
#include "drivers/timer.h"
#include "drivers/timer_def.h"

const timerHardware_t timerHardware[USABLE_TIMER_CHANNEL_COUNT] = {
    DEF_TIM(TIM12, CH1, PB14, TIM_USE_PWM | TIM_USE_PPM,  TIMER_INPUT_ENABLED,  0 ), // S1_IN
    DEF_TIM(TIM12, CH2, PB15, TIM_USE_PWM,                TIMER_INPUT_ENABLED,  0 ), // S2_IN
    DEF_TIM(TIM8,  CH1, PC6,  TIM_USE_PWM,                TIMER_INPUT_ENABLED,  0 ), // S3_IN
    DEF_TIM(TIM8,  CH2, PC7,  TIM_USE_PWM,                TIMER_INPUT_ENABLED,  0 ), // S4_IN
    DEF_TIM(TIM8,  CH3, PC8,  TIM_USE_PWM,                TIMER_INPUT_ENABLED,  0 ), // S5_IN
    DEF_TIM(TIM8,  CH4, PC9,  TIM_USE_PWM,                TIMER_INPUT_ENABLED,  0 ), // S6_IN

    DEF_TIM(TIM4, CH3, PB8, TIM_USE_MOTOR,               TIMER_OUTPUT_ENABLED,  0 ), // S10_OUT 1 DMA1_ST7
    DEF_TIM(TIM2, CH3, PA2, TIM_USE_MOTOR,               TIMER_OUTPUT_ENABLED,  0 ), // S6_OUT  2 DMA1_ST1
    DEF_TIM(TIM5, CH2, PA1, TIM_USE_MOTOR,               TIMER_OUTPUT_ENABLED,  0 ), // S2_OUT  3 DMA1_ST4
    DEF_TIM(TIM2, CH4, PA3, TIM_USE_MOTOR,               TIMER_OUTPUT_ENABLED,  1 ), // S1_OUT  4 DMA1_ST7 DMA1_ST6
    DEF_TIM(TIM3, CH2, PB5, TIM_USE_MOTOR | TIM_USE_LED, TIMER_OUTPUT_ENABLED,  0 ), // S4_OUT DMA1_ST5
    DEF_TIM(TIM5, CH1, PA0, TIM_USE_MOTOR,               TIMER_OUTPUT_ENABLED,  0 ), // S7_OUT DMA1_ST2
    DEF_TIM(TIM4, CH4, PB9, TIM_USE_MOTOR,               TIMER_OUTPUT_ENABLED,  0 ), // S5_OUT
    DEF_TIM(TIM9, CH2, PE6, TIM_USE_MOTOR,               TIMER_OUTPUT_ENABLED,  0 ), // S3_OUT
    DEF_TIM(TIM2, CH2, PB3, TIM_USE_MOTOR,               TIMER_OUTPUT_ENABLED,  0 ), // S8_OUT DMA1_ST6
    DEF_TIM(TIM3, CH1, PB4, TIM_USE_MOTOR,               TIMER_OUTPUT_ENABLED,  0 ), // S9_OUT DMA1_ST4
};
