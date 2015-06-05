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
#define TARGET_BOARD_IDENTIFIER "ANYF"

#define LED0_GPIO   GPIOB
#define LED0_PIN    Pin_7 // Blue LEDs
#define LED0_PERIPHERAL RCC_AHB1Periph_GPIOB

#define LED1_GPIO   GPIOB
#define LED1_PIN    Pin_6  // Red LEDs
#define LED1_PERIPHERAL RCC_AHB1Periph_GPIOB


#define BEEP_GPIO   GPIOB
#define BEEP_PIN    Pin_2 // Red LEDs
#define BEEP_PERIPHERAL RCC_AHB1Periph_GPIOB
#define BEEPER_INVERTED


#define INVERTER_PIN Pin_3 // PC0 used as inverter select GPIO
#define INVERTER_GPIO GPIOC
#define INVERTER_PERIPHERAL RCC_AHB1Periph_GPIOC
#define INVERTER_USART USART1

#define USABLE_TIMER_CHANNEL_COUNT 16

#define MPU6000_CS_GPIO       GPIOA
#define MPU6000_CS_PIN        GPIO_Pin_4
#define MPU6000_SPI_INSTANCE  SPI1

#define BEEPER_INVERTED

#define ACC
#define USE_ACC_SPI_MPU6000
#define ACC_SPI_MPU6000_ALIGN CW270_DEG

#define GYRO
#define USE_GYRO_SPI_MPU6000
#define GYRO_SPI_MPU6000_ALIGN CW270_DEG

#define MAG
#define USE_MAG_HMC5883
#define HMC5883_BUS I2C_DEVICE_EXT
#define MAG_HMC5883_ALIGN CW270_DEG_FLIP
//#define MAG_HMC5883_ALIGN CW90_DEG

#define BARO
#define USE_BARO_MS5611
#define MS5611_BUS I2C_DEVICE_INT

#define PITOT
//#define USE_PITOT_MS4525
#define MS4525_BUS I2C_DEVICE_EXT


#define INVERTER
#define BEEPER
#define LED0
#define LED1

#define USE_VCP

#define USE_USART1
#define USART1_RX_PIN Pin_10
#define USART1_TX_PIN Pin_9
#define USART1_GPIO GPIOA
#define USART1_APB2_PERIPHERALS RCC_APB2Periph_USART1
#define USART1_AHB1_PERIPHERALS RCC_AHB1Periph_GPIOA|RCC_AHB1Periph_DMA2

#define USE_USART2
#define USART2_RX_PIN Pin_3
#define USART2_TX_PIN Pin_2
#define USART2_GPIO GPIOA
#define USART2_APB1_PERIPHERALS RCC_APB1Periph_USART2
#define USART2_AHB1_PERIPHERALS RCC_AHB1Periph_GPIOA

#define USE_USART3
#define USART3_RX_PIN Pin_11
#define USART3_TX_PIN Pin_10
#define USART3_GPIO GPIOB
#define USART3_APB1_PERIPHERALS RCC_APB1Periph_USART3
#define USART3_AHB1_PERIPHERALS RCC_AHB1Periph_GPIOB

#define USE_USART4
#define USART4_RX_PIN Pin_11
#define USART4_TX_PIN Pin_10
#define USART4_GPIO GPIOC
#define USART4_APB1_PERIPHERALS RCC_APB1Periph_UART4
#define USART4_AHB1_PERIPHERALS RCC_AHB1Periph_GPIOC

#define USE_USART5
#define USART5_RX_PIN Pin_2
#define USART5_TX_PIN Pin_12
#define USART5_TXGPIO GPIOC
#define USART5_RXGPIO GPIOD
#define USART5_APB1_PERIPHERALS RCC_APB1Periph_UART5
#define USART5_AHB1_PERIPHERALS RCC_AHB1Periph_GPIOC|RCC_AHB1Periph_GPIOD

#define USE_USART6
#define USART6_RX_PIN Pin_7
#define USART6_TX_PIN Pin_6
#define USART6_GPIO GPIOC
#define USART6_APB2_PERIPHERALS RCC_APB2Periph_USART6
#define USART6_AHB1_PERIPHERALS RCC_AHB1Periph_GPIOC

#define SERIAL_PORT_COUNT 7

#define USE_SPI
#define USE_SPI_DEVICE_1

#define USE_I2C
#define I2C_DEVICE_INT (I2CDEV_1)
#define I2C_DEVICE_EXT (I2CDEV_2)

#define SENSORS_SET (SENSOR_ACC|SENSOR_MAG|SENSOR_BARO|SENSOR_PITOT)

#define GPS

#define USE_ADC

#define ADC_INSTANCE                ADC2
#define ADC_DMA_CHANNEL             DMA2_Channel1
#define ADC_AHB_PERIPHERAL          RCC_AHBPeriph_DMA2

#define VBAT_ADC_GPIO               GPIOC
#define VBAT_ADC_GPIO_PIN           GPIO_Pin_0
#define VBAT_ADC_CHANNEL            ADC_Channel_0

#define CURRENT_METER_ADC_GPIO      GPIOC
#define CURRENT_METER_ADC_GPIO_PIN  GPIO_Pin_1
#define CURRENT_METER_ADC_CHANNEL   ADC_Channel_1

#define RSSI_ADC_GPIO               GPIOC
#define RSSI_ADC_GPIO_PIN           GPIO_Pin_2
#define RSSI_ADC_CHANNEL            ADC_Channel_2

#define LED_STRIP
#define LED_STRIP_TIMER TIM5

#define BLACKBOX
#define TELEMETRY
#define SERIAL_RX
#define AUTOTUNE
#define USE_SERVOS
#define USE_CLI
