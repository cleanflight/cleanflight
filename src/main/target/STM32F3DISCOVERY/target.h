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

/* LED defines */
#define LED0
#define LED0_GPIO   GPIOE
#define LED0_PIN    Pin_8|Pin_12 // Blue LEDs - PE8/PE12
#define LED0_PERIPHERAL RCC_AHBPeriph_GPIOE
#define LED0_INVERTED

#define LED1
#define LED1_GPIO   GPIOE
#define LED1_PIN    Pin_10|Pin_14  // Orange LEDs - PE10/PE14
#define LED1_PERIPHERAL RCC_AHBPeriph_GPIOE
#define LED1_INVERTED

/* Buzzer defines */
#define BEEPER
#define BEEP_GPIO   GPIOE
#define BEEP_PIN    Pin_9|Pin_13 // Red LEDs - PE9/PE13
#define BEEP_PERIPHERAL RCC_AHBPeriph_GPIOE
#define BEEPER_INVERTED

/* Hardware inverter defines */

/* Serial port defines */
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

/* I2C port defines */
#define USE_I2C
#define I2C_DEVICE (I2CDEV_1)

/* SPI port defines */
#define USE_SPI
#define USE_SPI_DEVICE_1

#define L3GD20_SPI                      SPI1
#define L3GD20_CS_GPIO_CLK_PERIPHERAL   RCC_AHBPeriph_GPIOE
#define L3GD20_CS_GPIO                  GPIOE
#define L3GD20_CS_PIN                   GPIO_Pin_3

/* ADC port defines */
#define USE_ADC

#define ADC_INSTANCE                ADC1
#define ADC_AHB_PERIPHERAL          RCC_AHBPeriph_DMA1
#define ADC_DMA_CHANNEL             DMA1_Channel1

#define VBAT_ADC_GPIO               GPIOC
#define VBAT_ADC_GPIO_PIN           GPIO_Pin_0
#define VBAT_ADC_CHANNEL            ADC_Channel_6
//#define BOARD_HAS_VOLTAGE_DIVIDER

#define CURRENT_METER_ADC_GPIO      GPIOC
#define CURRENT_METER_ADC_GPIO_PIN  GPIO_Pin_1
#define CURRENT_METER_ADC_CHANNEL   ADC_Channel_7

#define RSSI_ADC_GPIO               GPIOC
#define RSSI_ADC_GPIO_PIN           GPIO_Pin_2
#define RSSI_ADC_CHANNEL            ADC_Channel_8

#define EXTERNAL1_ADC_GPIO          GPIOC
#define EXTERNAL1_ADC_GPIO_PIN      GPIO_Pin_3
#define EXTERNAL1_ADC_CHANNEL       ADC_Channel_9

/* Peripheral defines */
#define GYRO
#define USE_GYRO_L3GD20
#define GYRO_L3GD20_ALIGN CW270_DEG

#define ACC
#define USE_ACC_LSM303DLHC

#define MAG
#define USE_MAG_HMC5883

/* Feature defines */
//#define SONAR
#define BLACKBOX
//#define ENABLE_BLACKBOX_LOGGING_ON_SPIFLASH_BY_DEFAULT
//#define DISPLAY
#define GPS
#define GTUNE
#define SERIAL_RX
#define TELEMETRY
#define USE_SERVOS
#define USE_CLI
//#define BRUSHED_MOTORS

/* Blheli Serial1Wire defines */
#define USE_SERIAL_1WIRE

#define S1W_TX_GPIO         GPIOD
#define S1W_TX_PIN          GPIO_Pin_5 // STM32F3DISCOVERY TX - PD5 connects to UART RX
#define S1W_RX_GPIO         GPIOD
#define S1W_RX_PIN          GPIO_Pin_6 // STM32F3DISCOVERY RX - PD6 connects to UART TX

/* LED Strip defines */
#define LED_STRIP
#define LED_STRIP_TIMER TIM16

/* Spektrum defines */
