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
#define TARGET_BOARD_IDENTIFIER "COLI"

#define LED0_GPIO   GPIOC
#define LED0_PIN    Pin_14 // Blue LEDs
#define LED0_PERIPHERAL RCC_AHB1Periph_GPIOC

#define LED1_GPIO   GPIOC
#define LED1_PIN    Pin_13  // Red LEDs
#define LED1_PERIPHERAL RCC_AHB1Periph_GPIOC


#define BEEP_GPIO   GPIOC
#define BEEP_PIN    Pin_5 // Red LEDs
#define BEEP_PERIPHERAL RCC_AHB1Periph_GPIOC
#define BEEPER_INVERTED


#define INVERTER_PIN Pin_2 // PC0 used as inverter select GPIO
#define INVERTER_GPIO GPIOB
#define INVERTER_PERIPHERAL RCC_AHB1Periph_GPIOB
#define INVERTER_USART USART2

#define M25P16_CS_GPIO        GPIOB
#define M25P16_CS_PIN         GPIO_Pin_12
#define M25P16_SPI_INSTANCE   SPI2

#define USE_FLASHFS
#define USE_FLASH_M25P16

#define USABLE_TIMER_CHANNEL_COUNT 16

#define MPU6000_CS_GPIO       GPIOC
#define MPU6000_CS_PIN        GPIO_Pin_4
#define MPU6000_SPI_INSTANCE  SPI1

#define BEEPER_INVERTED

//#define DEBUG_MPU_DATA_READY_INTERRUPT
#define USE_MPU_DATA_READY_SIGNAL

#define ACC
#define USE_ACC_SPI_MPU6000
#define ACC_MPU6000_ALIGN CW270_DEG_FLIP

#define GYRO
#define USE_GYRO_SPI_MPU6000
#define GYRO_MPU6000_ALIGN CW270_DEG_FLIP

#define MAG
//#define USE_MAG_HMC5883
#define HMC5883_BUS I2C_DEVICE_INT
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

#define USE_UART1
#define UART1_RX_PIN Pin_7
#define UART1_TX_PIN Pin_6
#define UART1_GPIO GPIOB
#define UART1_APB2_PERIPHERALS RCC_APB2Periph_USART1
#define UART1_AHB1_PERIPHERALS RCC_AHB1Periph_GPIOB|RCC_AHB1Periph_DMA2

#define USE_UART2
#define UART2_RX_PIN Pin_3
#define UART2_TX_PIN Pin_2
#define UART2_GPIO GPIOA
#define UART2_APB1_PERIPHERALS RCC_APB1Periph_USART2
#define UART2_AHB1_PERIPHERALS RCC_AHB1Periph_GPIOA

//#define USE_USART3
#define UART3_RX_PIN Pin_11
#define UART3_TX_PIN Pin_10
#define UART3_GPIO GPIOB
#define UART3_APB1_PERIPHERALS RCC_APB1Periph_USART3
#define UART3_AHB1_PERIPHERALS RCC_AHB1Periph_GPIOB

#define USE_UART4
#define UART4_RX_PIN Pin_11
#define UART4_TX_PIN Pin_10
#define UART4_GPIO GPIOC
#define UART4_APB1_PERIPHERALS RCC_APB1Periph_UART4
#define UART4_AHB1_PERIPHERALS RCC_AHB1Periph_GPIOC

#define USE_UART5
#define UART5_RX_PIN Pin_2
#define UART5_TX_PIN Pin_12
#define UART5_GPIO_TX GPIOC
#define UART5_GPIO_RX GPIOD
#define UART5_APB1_PERIPHERALS RCC_APB1Periph_UART5
#define UART5_AHB1_PERIPHERALS RCC_AHB1Periph_GPIOC|RCC_AHB1Periph_GPIOD

//#define USE_USART6
#define USART6_RX_PIN Pin_7
#define USART6_TX_PIN Pin_6
#define USART6_GPIO GPIOC
#define USART6_APB2_PERIPHERALS RCC_APB2Periph_USART6
#define USART6_AHB1_PERIPHERALS RCC_AHB1Periph_GPIOC

#define SERIAL_PORT_COUNT 5

#define USE_ESCSERIAL
#define ESCSERIAL_TIMER_TX_HARDWARE 0 // PWM 1

#define USE_SPI
#define USE_SPI_DEVICE_1
#define USE_SPI_DEVICE_2

#define USE_I2C
#define I2C_DEVICE_INT (I2CDEV_3)
#define I2C_DEVICE_EXT (I2CDEV_2)

#define SENSORS_SET (SENSOR_ACC|SENSOR_MAG|SENSOR_BARO|SENSOR_PITOT)

#define GPS

#define USE_ADC

#define ADC_INSTANCE                ADC2
#define ADC_DMA_CHANNEL             DMA2_Channel1
#define ADC_AHB_PERIPHERAL          RCC_AHBPeriph_DMA2

//#define VBAT_ADC_GPIO               GPIOC
#define VBAT_ADC_GPIO_PIN           GPIO_Pin_0
#define VBAT_ADC_CHANNEL            ADC_Channel_0

//#define CURRENT_METER_ADC_GPIO      GPIOC
#define CURRENT_METER_ADC_GPIO_PIN  GPIO_Pin_1
#define CURRENT_METER_ADC_CHANNEL   ADC_Channel_1

//#define RSSI_ADC_GPIO               GPIOC
#define RSSI_ADC_GPIO_PIN           GPIO_Pin_2
#define RSSI_ADC_CHANNEL            ADC_Channel_2

#define LED_STRIP
#define LED_STRIP_TIMER TIM4

#define WS2811_GPIO                     GPIOB
#define WS2811_GPIO_AHB1_PERIPHERAL     RCC_AHB1Periph_GPIOB
#define WS2811_GPIO_AF                  GPIO_AF_TIM4
#define WS2811_PIN                      GPIO_Pin_7 // TIM4_CH2
#define WS2811_PIN_SOURCE               GPIO_PinSource7
#define WS2811_TIMER                    TIM4
#define WS2811_TIMER_DMA                TIM_DMA_CC2
#define WS2811_TIMER_APB1_PERIPHERAL    RCC_APB1Periph_TIM4
#define WS2811_DMA_STREAM				DMA1_Stream3
#define WS2811_DMA_CHANNEL              DMA_Channel_2
#define WS2811_IRQ                      DMA1_Stream3_IRQn
#define WS2811_DMA_TC_FLAG              DMA_FLAG_TCIF3
#define WS2811_DMA_HANDLER_IDENTIFER    DMA1_CH3_HANDLER


#define BLACKBOX
#define TELEMETRY
#define SERIAL_RX
#define GTUNE
#define USE_SERVOS
#define USE_CLI
