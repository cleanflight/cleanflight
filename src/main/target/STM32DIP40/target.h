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

#define TARGET_BOARD_IDENTIFIER "STM32DIP40" //

#define LED0_GPIO   GPIOB
#define LED0_PIN    Pin_3 // PB3 (LED)
#define LED0_PERIPHERAL RCC_APB2Periph_GPIOB

#define LED1_GPIO   GPIOB
#define LED1_PIN    Pin_4 // PB4 (LED)
#define LED1_PERIPHERAL RCC_APB2Periph_GPIOB


#define BEEP_GPIO   GPIOA
#define BEEP_PIN Pin_15 // PA15 (Beeper)
#define BEEP_PERIPHERAL RCC_APB2Periph_GPIOA

#define BARO_XCLR_GPIO   GPIOC
#define BARO_XCLR_PIN    Pin_13
#define BARO_EOC_GPIO    GPIOC
#define BARO_EOC_PIN     Pin_14
#define BARO_APB2_PERIPHERALS RCC_APB2Periph_GPIOC

#define INVERTER_PIN Pin_2 // PB2 (BOOT1) abused as inverter select GPIO
#define INVERTER_GPIO GPIOB
#define INVERTER_PERIPHERAL RCC_APB2Periph_GPIOB
#define INVERTER_USART USART1

#define GYRO
#define USE_GYRO_MPU6050
#define USE_GYRO_L3G4200D

#define ACC
#define USE_ACC_ADXL345
#define USE_ACC_BMA280
#define USE_ACC_MMA8452
#define USE_ACC_MPU6050

#define BARO
#define USE_BARO_MS5611
#define USE_BARO_BMP085

#define MAG
#define SONAR
#define BEEPER
#define LED0
#define LED1
#define INVERTER
#define DISPLAY


#define USE_VCP
#define USE_USART1
#define USE_USART2
#define USE_SOFTSERIAL1
#define SERIAL_PORT_COUNT 4

#define SOFTSERIAL_1_TIMER TIM3
#define SOFTSERIAL_1_TIMER_TX_HARDWARE 1 // PWM 2
#define SOFTSERIAL_1_TIMER_RX_HARDWARE 2 // PWM 3

#define USE_I2C
#define I2C_DEVICE (I2CDEV_2)

#define SENSORS_SET (SENSOR_ACC | SENSOR_BARO | SENSOR_MAG)

#define USE_ADC

#define CURRENT_METER_ADC_GPIO      GPIOB
#define CURRENT_METER_ADC_GPIO_PIN  GPIO_Pin_1
#define CURRENT_METER_ADC_CHANNEL   ADC_Channel_9

#define VBAT_ADC_GPIO               GPIOA
#define VBAT_ADC_GPIO_PIN           GPIO_Pin_0
#define VBAT_ADC_CHANNEL            ADC_Channel_0

#define RSSI_ADC_GPIO               GPIOA
#define RSSI_ADC_GPIO_PIN           GPIO_Pin_1
#define RSSI_ADC_CHANNEL            ADC_Channel_1

#define GPS

#define LED_STRIP
#define LED_STRIP_TIMER TIM3

#define TELEMETRY
#define SERIAL_RX
#define SONAR
#define AUTOTUNE
#define USE_SERVOS
#define USE_CLI
#define USE_HIL
