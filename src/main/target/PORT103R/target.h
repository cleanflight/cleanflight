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

#define TARGET_BOARD_IDENTIFIER "103R"

#define LED0_GPIO   GPIOB
#define LED0_PIN    Pin_3 // PB3 (LED)
#define LED0_PERIPHERAL RCC_APB2Periph_GPIOB

#define LED1_GPIO   GPIOB
#define LED1_PIN    Pin_4 // PB4 (LED)
#define LED1_PERIPHERAL RCC_APB2Periph_GPIOB

#define LED2_GPIO   GPIOD
#define LED2_PIN    Pin_2 // PD2 (LED) - Labelled LED4
#define LED2_PERIPHERAL RCC_APB2Periph_GPIOD

#define BEEP_GPIO   GPIOA
#define BEEP_PIN    Pin_12 // PA12 (Beeper)
#define BEEP_PERIPHERAL RCC_APB2Periph_GPIOA

#define BARO_XCLR_GPIO   GPIOC
#define BARO_XCLR_PIN    Pin_13
#define BARO_EOC_GPIO    GPIOC
#define BARO_EOC_PIN     Pin_14
#define BARO_APB2_PERIPHERALS RCC_APB2Periph_GPIOC

#define INVERTER_PIN Pin_2 // PB2 (BOOT1) abused as inverter select GPIO
#define INVERTER_GPIO GPIOB
#define INVERTER_PERIPHERAL RCC_APB2Periph_GPIOB
#define INVERTER_USART USART2

#define USE_SPI
#define USE_SPI_DEVICE_2

#define PORT103R_SPI_INSTANCE     SPI2
#define PORT103R_SPI_CS_GPIO      GPIOB
#define PORT103R_SPI_CS_PIN       GPIO_Pin_12

// We either have this 16mbit flash chip on SPI or the MPU6500 acc/gyro depending on board revision:
#define M25P16_CS_GPIO        PORT103R_SPI_CS_GPIO
#define M25P16_CS_PIN         PORT103R_SPI_CS_PIN
#define M25P16_SPI_INSTANCE   PORT103R_SPI_INSTANCE

#define MPU6000_CS_GPIO       PORT103R_SPI_CS_GPIO
#define MPU6000_CS_PIN        PORT103R_SPI_CS_PIN
#define MPU6000_SPI_INSTANCE  PORT103R_SPI_INSTANCE

#define MPU6500_CS_GPIO       PORT103R_SPI_CS_GPIO
#define MPU6500_CS_PIN        PORT103R_SPI_CS_PIN
#define MPU6500_SPI_INSTANCE  PORT103R_SPI_INSTANCE
#define MPU6500_CS_GPIO_CLK_PERIPHERAL   RCC_APB2Periph_GPIOB

#define GYRO
#define USE_FAKE_GYRO
//#define USE_GYRO_L3G4200D
//#define USE_GYRO_L3GD20
//#define USE_GYRO_MPU3050
#define USE_GYRO_MPU6050
#define USE_GYRO_SPI_MPU6000
#define USE_GYRO_SPI_MPU6500

#define ACC
#define USE_FAKE_ACC
//#define USE_ACC_ADXL345
//#define USE_ACC_BMA280
//#define USE_ACC_MMA8452
#define USE_ACC_MPU6050
#define USE_ACC_SPI_MPU6000
#define USE_ACC_SPI_MPU6500

#define BARO
#define USE_BARO_MS5611
#define USE_BARO_BMP085

#define MAG
#define USE_MAG_HMC5883
#define USE_MAG_AK8975

#define USE_FLASHFS
#define USE_FLASHTOOLS
#define USE_FLASH_M25P16

#define SONAR
#define BEEPER
#define LED0
#define LED1
#define LED2
#define INVERTER
#define DISPLAY

#define USE_USART1
#define USE_USART2
#define USE_SOFTSERIAL1
#define USE_SOFTSERIAL2
#define SERIAL_PORT_COUNT 4

#define SOFTSERIAL_1_TIMER TIM3
#define SOFTSERIAL_1_TIMER_RX_HARDWARE 4 // PWM 5
#define SOFTSERIAL_1_TIMER_TX_HARDWARE 5 // PWM 6
#define SOFTSERIAL_2_TIMER TIM3
#define SOFTSERIAL_2_TIMER_RX_HARDWARE 6 // PWM 7
#define SOFTSERIAL_2_TIMER_TX_HARDWARE 7 // PWM 8

#define USE_I2C
#define I2C_DEVICE (I2CDEV_2)

// #define SOFT_I2C // enable to test software i2c
// #define SOFT_I2C_PB1011 // If SOFT_I2C is enabled above, need to define pinout as well (I2C1 = PB67, I2C2 = PB1011)
// #define SOFT_I2C_PB67

#define USE_ADC

#define CURRENT_METER_ADC_GPIO      GPIOB
#define CURRENT_METER_ADC_GPIO_PIN  GPIO_Pin_1
#define CURRENT_METER_ADC_CHANNEL   ADC_Channel_9

#define VBAT_ADC_GPIO               GPIOA
#define VBAT_ADC_GPIO_PIN           GPIO_Pin_4
#define VBAT_ADC_CHANNEL            ADC_Channel_4

#define RSSI_ADC_GPIO               GPIOA
#define RSSI_ADC_GPIO_PIN           GPIO_Pin_1
#define RSSI_ADC_CHANNEL            ADC_Channel_1

#define EXTERNAL1_ADC_GPIO          GPIOA
#define EXTERNAL1_ADC_GPIO_PIN      GPIO_Pin_5
#define EXTERNAL1_ADC_CHANNEL       ADC_Channel_5

#define LED0

#define LED_STRIP
#define LED_STRIP_TIMER TIM3

#define BLACKBOX
#define GPS
#define GTUNE
#define SERIAL_RX
#define TELEMETRY
#define USE_SERVOS
#define USE_CLI

#define USE_SERIAL_1WIRE
#define USE_SERIAL_1WIRE_CLI

#define S1W_TX_GPIO         GPIOA
#define S1W_TX_PIN          GPIO_Pin_9
#define S1W_RX_GPIO         GPIOA
#define S1W_RX_PIN          GPIO_Pin_10
