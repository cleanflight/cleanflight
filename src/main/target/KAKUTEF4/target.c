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
    DEF_TIM(TIM8, CH2, PC7, TIM_USE_PPM,   TIMER_INPUT_ENABLED,  0),  // PPM IN
    DEF_TIM(TIM3, CH3, PB0, TIM_USE_MOTOR, TIMER_OUTPUT_ENABLED, 0),  // S1_OUT - DMA1_ST7
    DEF_TIM(TIM3, CH4, PB1, TIM_USE_MOTOR, TIMER_OUTPUT_ENABLED, 0),  // S2_OUT - DMA1_ST2
    DEF_TIM(TIM2, CH4, PA3, TIM_USE_MOTOR, TIMER_OUTPUT_ENABLED, 1),  // S3_OUT - DMA1_ST6
    DEF_TIM(TIM2, CH3, PA2, TIM_USE_MOTOR, TIMER_OUTPUT_ENABLED, 0),  // S4_OUT - DMA1_ST1
    #if defined(KAKUTEF4V2)
    DEF_TIM(TIM8, CH3, PC8, TIM_USE_LED,   TIMER_OUTPUT_ENABLED, 0),  // LED_STRIP - DMA2_ST4
    #else
    DEF_TIM(TIM5, CH1, PA0, TIM_USE_MOTOR, TIMER_OUTPUT_ENABLED, 0),  // S5_OUT - DMA1_ST2
    DEF_TIM(TIM8, CH3, PC8, TIM_USE_MOTOR, TIMER_OUTPUT_ENABLED, 1),  // S6_OUT - DMA2_ST4
    DEF_TIM(TIM5, CH2, PA1, TIM_USE_LED,   TIMER_OUTPUT_ENABLED, 0),  // LED_STRIP - DMA1_ST4
    #endif
};
