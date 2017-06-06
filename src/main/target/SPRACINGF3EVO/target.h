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

#ifdef AIORACERF3
#define TARGET_BOARD_IDENTIFIER "ARF3"
#elif SPRACINGF3MQ
#define TARGET_BOARD_IDENTIFIER "SPMQ"
#else
#define TARGET_BOARD_IDENTIFIER "SPEV"
#endif

#define TARGET_CONFIG

#ifdef AIORACERF3
#undef TARGET_CONFIG
#endif

#ifdef SPRACINGF3MQ
#define BRUSHED_MOTORS

#ifndef SPRACINGF3MQ_REV
#define SPRACINGF3MQ_REV 2
#endif

#undef USE_UNCOMMON_MIXERS
#endif


#define CONFIG_FASTLOOP_PREFERRED_ACC ACC_DEFAULT

#define BRUSHED_ESC_AUTODETECT

#define LED0                    PB8

#define BEEPER                  PC15
#define BEEPER_INVERTED

#define USE_EXTI
#define MPU_INT_EXTI            PC13
#define USE_MPU_DATA_READY_SIGNAL
#define ENSURE_MPU_DATA_READY_IS_LOW

#define USE_MAG_DATA_READY_SIGNAL
#define ENSURE_MAG_DATA_READY_IS_HIGH

#define USE_ESC_SENSOR

#define GYRO
#define USE_GYRO_SPI_MPU6500

#define ACC
#define USE_ACC_SPI_MPU6500

#define ACC_MPU6500_ALIGN       CW180_DEG
#define GYRO_MPU6500_ALIGN      CW180_DEG

#define BARO
#define USE_BARO_BMP280

#define MAG
#define USE_MAG_AK8963
//#define USE_MAG_HMC5883 // External

#define MAG_AK8963_ALIGN CW90_DEG_FLIP

//#define SONAR

#define USE_VCP
#define USE_UART1
#define USE_UART2
#define USE_UART3
#define USE_SOFTSERIAL1
#define USE_SOFTSERIAL2

#define SOFTSERIAL1_RX_PIN      PA6 // PWM 5
#define SOFTSERIAL1_TX_PIN      PA7 // PWM 6

#define SOFTSERIAL2_RX_PIN      PB0 // PWM 7
#define SOFTSERIAL2_TX_PIN      PB1 // PWM 8

#define SERIAL_PORT_COUNT       6

#define USE_ESCSERIAL
#define ESCSERIAL_TIMER_TX_HARDWARE 0 // PWM 1

#define UART1_TX_PIN            PA9
#define UART1_RX_PIN            PA10

#define UART2_TX_PIN            PA14 // PA14 / SWCLK
#define UART2_RX_PIN            PA15

#define UART3_TX_PIN            PB10 // PB10 (AF7)
#define UART3_RX_PIN            PB11 // PB11 (AF7)

#define USE_I2C
#define USE_I2C_DEVICE_1
#define I2C_DEVICE              (I2CDEV_1)

#define USE_SPI
#define USE_SPI_DEVICE_1 // PB9,3,4,5 on AF5 SPI1 (MPU)
#define USE_SPI_DEVICE_2 // PB12,13,14,15 on AF5 SPI2 (SDCard)

#define SPI1_NSS_PIN            PB9
#define SPI1_SCK_PIN            PB3
#define SPI1_MISO_PIN           PB4
#define SPI1_MOSI_PIN           PB5

#define SPI2_NSS_PIN            PB12
#define SPI2_SCK_PIN            PB13
#define SPI2_MISO_PIN           PB14
#define SPI2_MOSI_PIN           PB15

#define USE_SDCARD
#define USE_SDCARD_SPI2

#define SDCARD_DETECT_INVERTED

#define SDCARD_DETECT_PIN                   PC14
#define SDCARD_SPI_INSTANCE                 SPI2
#define SDCARD_SPI_CS_PIN                   SPI2_NSS_PIN

// SPI2 is on the APB1 bus whose clock runs at 36MHz. Divide to under 400kHz for init:
#define SDCARD_SPI_INITIALIZATION_CLOCK_DIVIDER 128
// Divide to under 25MHz for normal operation:
#define SDCARD_SPI_FULL_SPEED_CLOCK_DIVIDER     2

// Note, this is the same DMA channel as UART1_RX. Luckily we don't use DMA for USART Rx.
#define SDCARD_DMA_CHANNEL_TX               DMA1_Channel5
#define SDCARD_DMA_CHANNEL_TX_COMPLETE_FLAG DMA1_FLAG_TC5

#define MPU6500_CS_PIN                   PB9
#define MPU6500_SPI_INSTANCE             SPI1

#define DEFAULT_VOLTAGE_METER_SOURCE VOLTAGE_METER_ADC

#define USE_ADC
#define ADC_INSTANCE            ADC2
#define RSSI_ADC_PIN            PB2
#ifdef AIORACERF3
#define VBAT_ADC_PIN            PA5
#define CURRENT_METER_ADC_PIN   PA4
#define DEFAULT_CURRENT_METER_SOURCE CURRENT_METER_ADC
#else
#define VBAT_ADC_PIN            PA4
#define CURRENT_METER_ADC_PIN   PA5
#endif

#define OSD
#define USE_OSD_OVER_MSP_DISPLAYPORT
#define USE_MSP_CURRENT_METER

#define TRANSPONDER

#define ENABLE_BLACKBOX_LOGGING_ON_SDCARD_BY_DEFAULT

#define DEFAULT_RX_FEATURE      FEATURE_RX_PPM
#define DEFAULT_FEATURES        (FEATURE_TRANSPONDER  | FEATURE_RSSI_ADC | FEATURE_TELEMETRY)

#define SPEKTRUM_BIND_PIN       UART3_RX_PIN

#define USE_SERIAL_4WAY_BLHELI_INTERFACE

// IO - stm32f303cc in 48pin package
#define TARGET_IO_PORTA         0xffff
#define TARGET_IO_PORTB         0xffff
#define TARGET_IO_PORTC         (BIT(13)|BIT(14)|BIT(15))
#define TARGET_IO_PORTF         (BIT(0)|BIT(1)|BIT(4))

#define USABLE_TIMER_CHANNEL_COUNT 12 // PPM, 8 PWM, UART3 RX/TX, LED Strip
#ifdef AIORACERF3
#define USED_TIMERS             (TIM_N(1) | TIM_N(2) | TIM_N(3) | TIM_N(8) | TIM_N(15) | TIM_N(17))
#else
#define USED_TIMERS             (TIM_N(1) | TIM_N(2) | TIM_N(3) | TIM_N(8) | TIM_N(15) | TIM_N(16))
#endif
