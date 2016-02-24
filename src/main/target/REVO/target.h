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
#define TARGET_BOARD_IDENTIFIER "REVO"

#define LED0_GPIO   GPIOB
#define LED0_PIN    Pin_5 // Blue LEDs - PB5
#define LED0_PERIPHERAL RCC_AHB1Periph_GPIOB
#define LED1_GPIO   GPIOB
#define LED1_PIN    Pin_4  // Orange LEDs - PB4
#define LED1_PERIPHERAL RCC_AHB1Periph_GPIOB

#define INVERTER_PIN Pin_0 // PC0 used as inverter select GPIO
#define INVERTER_GPIO GPIOC
#define INVERTER_PERIPHERAL RCC_AHB1Periph_GPIOC
#define INVERTER_USART USART1

#define MPU6000_CS_GPIO       GPIOA
#define MPU6000_CS_PIN        GPIO_Pin_4
#define MPU6000_SPI_INSTANCE  SPI1

//#define DEBUG_MPU_DATA_READY_INTERRUPT
#define USE_MPU_DATA_READY_SIGNAL

#define ACC
#define USE_ACC_SPI_MPU6000
#define ACC_MPU6000_ALIGN CW270_DEG

#define GYRO
#define USE_GYRO_SPI_MPU6000
#define GYRO_MPU6000_ALIGN CW270_DEG

#define MAG
//#define USE_MAG_HMC5883
#define HMC5883_BUS I2C_DEVICE_INT
#define MAG_HMC5883_ALIGN CW90_DEG

#define USE_MAG_NAZA
#define MAG_NAZA_ALIGN CW180_DEG_FLIP

#define BARO
#define USE_BARO_MS5611
#define MS5611_BUS I2C_DEVICE_INT

#define PITOT
//#define USE_PITOT_MS4525
#define MS4525_BUS I2C_DEVICE_EXT

#define INVERTER
#define LED0
#define LED1

#define M25P16_CS_GPIO        GPIOB
#define M25P16_CS_PIN         GPIO_Pin_3
#define M25P16_SPI_INSTANCE   SPI3

#define USE_FLASHFS
#define USE_FLASH_M25P16

#define USABLE_TIMER_CHANNEL_COUNT 12

#define USE_VCP

#define USE_USART1
#define USART1_RX_PIN Pin_10
#define USART1_TX_PIN Pin_9
#define USART1_GPIO GPIOA
#define USART1_APB2_PERIPHERALS RCC_APB2Periph_USART1
#define USART1_AHB1_PERIPHERALS RCC_AHB1Periph_GPIOA|RCC_AHB1Periph_DMA2

#define USE_USART3
#define USART3_RX_PIN Pin_11
#define USART3_TX_PIN Pin_10
#define USART3_GPIO GPIOB
#define USART3_APB1_PERIPHERALS RCC_APB1Periph_USART3
#define USART3_AHB1_PERIPHERALS RCC_AHB1Periph_GPIOB

#define USE_USART6
#define USART6_RX_PIN Pin_7
#define USART6_TX_PIN Pin_6
#define USART6_GPIO GPIOC
#define USART6_APB2_PERIPHERALS RCC_APB2Periph_USART6
#define USART6_AHB1_PERIPHERALS RCC_AHB1Periph_GPIOC

#define SERIAL_PORT_COUNT 4

#define USE_ESCSERIAL
#define ESCSERIAL_TIMER_TX_HARDWARE 0 // PWM 1

#define USE_SPI
#define USE_SPI_DEVICE_1
#define USE_SPI_DEVICE_3

#define USE_I2C
#define I2C_DEVICE_INT (I2CDEV_1)
#define I2C_DEVICE_EXT (I2CDEV_2)

#define SENSORS_SET (SENSOR_ACC|SENSOR_MAG|SENSOR_BARO)

#define LED_STRIP
#define LED_STRIP_TIMER TIM5

#define WS2811_GPIO                     GPIOA
#define WS2811_GPIO_AHB1_PERIPHERAL     RCC_AHB1Periph_GPIOA
#define WS2811_GPIO_AF                  GPIO_AF_TIM5
#define WS2811_PIN                      GPIO_Pin_0 // TIM5_CH1
#define WS2811_PIN_SOURCE               GPIO_PinSource0
#define WS2811_TIMER                    TIM5
#define WS2811_TIMER_DMA                TIM_DMA_CC1
#define WS2811_TIMER_APB1_PERIPHERAL    RCC_APB1Periph_TIM5
#define WS2811_DMA_STREAM				DMA1_Stream2
#define WS2811_DMA_CHANNEL              DMA_Channel_6
#define WS2811_IRQ                      DMA1_Stream2_IRQn
#define WS2811_DMA_TC_FLAG              DMA_FLAG_TCIF2
#define WS2811_DMA_HANDLER_IDENTIFER    DMA1_CH2_HANDLER

#define GPS
#define BLACKBOX
#define TELEMETRY
#define SERIAL_RX
#define GTUNE
#define USE_SERVOS
#define USE_CLI
