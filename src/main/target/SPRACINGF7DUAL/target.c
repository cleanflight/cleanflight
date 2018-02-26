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

    DEF_TIM(TIM9,  CH2, PA3,  TIM_USE_PPM | TIM_USE_PWM,   TIMER_INPUT_ENABLED, 0), // PPM / PWM1 / UART2 RX
    DEF_TIM(TIM9,  CH1, PA2,  TIM_USE_PWM,                 TIMER_INPUT_ENABLED, 0), // PPM / PWM2 / UART2 TX

    DEF_TIM(TIM8,  CH3, PC8,  TIM_USE_MOTOR,               TIMER_OUTPUT_STANDARD, 0), // ESC 1
    DEF_TIM(TIM8,  CH1, PC6,  TIM_USE_MOTOR,               TIMER_OUTPUT_STANDARD, 0), // ESC 2
    DEF_TIM(TIM8,  CH4, PC9,  TIM_USE_MOTOR,               TIMER_OUTPUT_STANDARD, 0), // ESC 3
    DEF_TIM(TIM8,  CH2, PC7,  TIM_USE_MOTOR,               TIMER_OUTPUT_STANDARD, 0), // ESC 4

    DEF_TIM(TIM4,  CH1, PB6,  TIM_USE_MOTOR,               TIMER_OUTPUT_STANDARD, 0), // ESC 5 / Conflicts with USART5_RX / SPI3_RX - SPI3_RX can be mapped to DMA1_ST3_CH0
    DEF_TIM(TIM4,  CH2, PB7,  TIM_USE_MOTOR,               TIMER_OUTPUT_STANDARD, 0), // ESC 6 / Conflicts with USART3_RX
    DEF_TIM(TIM3,  CH4, PB1,  TIM_USE_MOTOR,               TIMER_OUTPUT_STANDARD, 0), // ESC 7
    DEF_TIM(TIM3,  CH3, PB0,  TIM_USE_MOTOR,               TIMER_OUTPUT_STANDARD, 0), // ESC 8

    DEF_TIM(TIM2,  CH2, PA1,  TIM_USE_LED,                 TIMER_OUTPUT_STANDARD, 0), // LED Strip
    // Additional 2 PWM channels available on UART3 RX/TX pins
    // However, when using led strip the timer cannot be used, but no code appears to prevent that right now
    DEF_TIM(TIM2,  CH3, PB10, TIM_USE_MOTOR,               TIMER_OUTPUT_STANDARD, 0), // Shared with UART3 TX PIN and SPI3 TX (OSD)
    DEF_TIM(TIM2,  CH4, PB11, TIM_USE_MOTOR,               TIMER_OUTPUT_STANDARD, 0), // Shared with UART3 RX PIN

    DEF_TIM(TIM1,  CH1, PA8,  TIM_USE_TRANSPONDER,         TIMER_OUTPUT_STANDARD, 0), // Transponder
    // Additional 2 PWM channels available on UART1 RX/TX pins
    // However, when using transponder the timer cannot be used, but no code appears to prevent that right now
    DEF_TIM(TIM1,  CH2, PA9,  TIM_USE_SERVO | TIM_USE_PWM, TIMER_OUTPUT_STANDARD, 1), // PWM 3
    DEF_TIM(TIM1,  CH3, PA10, TIM_USE_SERVO | TIM_USE_PWM, TIMER_OUTPUT_STANDARD, 1), // PWM 4
};

#if (SPRACINGF7DUAL_REV <= 1)

#include "drivers/serial.h"
#include "drivers/serial_uart.h"

void usartTargetConfigure(uartPort_t *uartPort)
{
    if (uartPort->USARTx == USART3) {
        uartPort->Handle.AdvancedInit.AdvFeatureInit |= UART_ADVFEATURE_SWAP_INIT;
        uartPort->Handle.AdvancedInit.Swap = UART_ADVFEATURE_SWAP_ENABLE;
    }
}
#endif
