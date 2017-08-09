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
#include "drivers/timer.h"
#include "drivers/timer_def.h"
#include "drivers/dma.h"

const timerHardware_t timerHardware[USABLE_TIMER_CHANNEL_COUNT] = {
    DEF_TIM( TIM3, CH2, PB5, TIM_USE_MOTOR, TIMER_OUTPUT_STANDARD, 0 ), // PWM1
    DEF_TIM( TIM3, CH3, PB0, TIM_USE_MOTOR, TIMER_OUTPUT_STANDARD, 0 ), // PWM2
    DEF_TIM( TIM2, CH2, PB3, TIM_USE_MOTOR, TIMER_OUTPUT_STANDARD, 0 ), // PWM3
    DEF_TIM( TIM3, CH4, PB1, TIM_USE_MOTOR, TIMER_OUTPUT_STANDARD, 0 ), // PWM4
#ifdef ML_PWM_6
    DEF_TIM( TIM5, CH3, PA2, TIM_USE_MOTOR, TIMER_OUTPUT_STANDARD, 0 ), // PWM5
    DEF_TIM( TIM5, CH4, PA3, TIM_USE_MOTOR, TIMER_OUTPUT_STANDARD, 0 ), // PWM6
#endif
    DEF_TIM( TIM1, CH1, PA8, TIM_USE_LED,   TIMER_OUTPUT_STANDARD, 0 ), // Serial LED
};
