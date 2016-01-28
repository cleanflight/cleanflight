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

#pragma once

#define TARGET_BOARD_IDENTIFIER "SDF3" // STM Discovery F3

#define LED0_GPIO   GPIOE
#define LED0_PIN    Pin_8|Pin_12 // Blue LEDs - PE8/PE12
#define LED0_PERIPHERAL RCC_AHBPeriph_GPIOE
#define LED0_INVERTED
#define LED1_GPIO   GPIOE
#define LED1_PIN    Pin_10|Pin_14  // Orange LEDs - PE10/PE14
#define LED1_PERIPHERAL RCC_AHBPeriph_GPIOE
#define LED1_INVERTED

#define BEEP_GPIO   GPIOE
#define BEEP_PIN    Pin_9|Pin_13 // Red LEDs - PE9/PE13
#define BEEP_PERIPHERAL RCC_AHBPeriph_GPIOE
#define BEEPER_INVERTED


#define BEEPER_INVERTED

#define USE_SPI
#define USE_SPI_DEVICE_1

#define GYRO
#define USE_GYRO_L3GD20

#define L3GD20_SPI                      SPI1
#define L3GD20_CS_GPIO_CLK_PERIPHERAL   RCC_AHBPeriph_GPIOE
#define L3GD20_CS_GPIO                  GPIOE
#define L3GD20_CS_PIN                   GPIO_Pin_3

#define GYRO_L3GD20_ALIGN CW270_DEG

#define ACC
#define USE_ACC_LSM303DLHC

#define MAG
#define USE_MAG_HMC5883

#define BEEPER
#define LED0
#define LED1

#define USE_VCP
#define USE_USART1
#define USE_USART2
#define SERIAL_PORT_COUNT 3

#define UART1_TX_PIN        GPIO_Pin_9  // PA9
#define UART1_RX_PIN        GPIO_Pin_10 // PA10
#define UART1_GPIO          GPIOA
#define UART1_GPIO_AF       GPIO_AF_7
#define UART1_TX_PINSOURCE  GPIO_PinSource9
#define UART1_RX_PINSOURCE  GPIO_PinSource10

#define UART2_TX_PIN        GPIO_Pin_5 // PD5
#define UART2_RX_PIN        GPIO_Pin_6 // PD6
#define UART2_GPIO          GPIOD
#define UART2_GPIO_AF       GPIO_AF_7
#define UART2_TX_PINSOURCE  GPIO_PinSource5
#define UART2_RX_PINSOURCE  GPIO_PinSource6

#define USE_I2C
#define I2C_DEVICE (I2CDEV_1)

#define USE_ADC

#define ADC_INSTANCE                ADC1
#define ADC_AHB_PERIPHERAL          RCC_AHBPeriph_DMA1
#define ADC_DMA_CHANNEL             DMA1_Channel1

#define VBAT_ADC_GPIO               GPIOC
#define VBAT_ADC_GPIO_PIN           GPIO_Pin_0
#define VBAT_ADC_CHANNEL            ADC_Channel_6

#define CURRENT_METER_ADC_GPIO      GPIOC
#define CURRENT_METER_ADC_GPIO_PIN  GPIO_Pin_1
#define CURRENT_METER_ADC_CHANNEL   ADC_Channel_7

#define RSSI_ADC_GPIO               GPIOC
#define RSSI_ADC_GPIO_PIN           GPIO_Pin_2
#define RSSI_ADC_CHANNEL            ADC_Channel_8

#define EXTERNAL1_ADC_GPIO          GPIOC
#define EXTERNAL1_ADC_GPIO_PIN      GPIO_Pin_3
#define EXTERNAL1_ADC_CHANNEL       ADC_Channel_9

#define BLACKBOX
#define GPS
#define GTUNE
#define LED_STRIP
#define LED_STRIP_TIMER TIM16
#define TELEMETRY
#define SERIAL_RX
#define USE_SERVOS
#define USE_CLI

#define USE_SERIAL_1WIRE

// STM32F3DISCOVERY TX - PD5 connects to UART RX
#define S1W_TX_GPIO         GPIOD
#define S1W_TX_PIN          GPIO_Pin_5
// STM32F3DISCOVERY RX - PD6 connects to UART TX
#define S1W_RX_GPIO         GPIOD
#define S1W_RX_PIN          GPIO_Pin_6

// IO - 303 in 100pin package
#define TARGET_IO_PORTA 0xffff
#define TARGET_IO_PORTB 0xffff
#define TARGET_IO_PORTC 0xffff
#define TARGET_IO_PORTD 0xffff
#define TARGET_IO_PORTE 0xffff
#define TARGET_IO_PORTF 0x00ff
