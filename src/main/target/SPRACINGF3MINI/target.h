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

#ifdef TINYBEEF3
#define TARGET_BOARD_IDENTIFIER "TBF3"

#define CONFIG_FASTLOOP_PREFERRED_ACC ACC_DEFAULT

#define LED0                    PB8
#else
#define TARGET_BOARD_IDENTIFIER "SRFM"

#ifndef SPRACINGF3MINI_REV
#define SPRACINGF3MINI_REV 2
#endif

#define CONFIG_FASTLOOP_PREFERRED_ACC ACC_NONE

#define LED0                    PB3
#endif

#define BEEPER                  PC15
#define BEEPER_INVERTED

#define USE_EXTI
#define MPU_INT_EXTI            PC13
#define USE_MPU_DATA_READY_SIGNAL
#define ENSURE_MPU_DATA_READY_IS_LOW

#define GYRO
#define ACC

#ifdef TINYBEEF3

#define USE_GYRO_SPI_MPU6500
#define GYRO_MPU6500_ALIGN      CW270_DEG

#define USE_ACC_SPI_MPU6500
#define ACC_MPU6500_ALIGN       CW270_DEG
#else

#define USE_MAG_DATA_READY_SIGNAL
#define ENSURE_MAG_DATA_READY_IS_HIGH

#define USE_GYRO_MPU6500
#define GYRO_MPU6500_ALIGN      CW180_DEG

#define USE_ACC_MPU6500
#define ACC_MPU6500_ALIGN       CW180_DEG

#define BARO
#define USE_BARO_BMP280

#define MAG
#define USE_MPU9250_MAG // Enables bypass configuration
#define USE_MAG_AK8975
#define USE_MAG_HMC5883 // External
#define MAG_AK8975_ALIGN        CW90_DEG_FLIP
#endif

//#define SONAR
//#define SONAR_ECHO_PIN          PB1
//#define SONAR_TRIGGER_PIN       PB0

#define BRUSHED_ESC_AUTODETECT

#define USE_VCP
#define USE_UART1
#define USE_UART2
#define USE_UART3

#ifdef TINYBEEF3
#define SERIAL_PORT_COUNT       4
#else
#define USB_DETECT_PIN          PB5

#define USE_SOFTSERIAL1
#define USE_SOFTSERIAL2
#define SERIAL_PORT_COUNT       6
#endif

#define USE_ESCSERIAL
#define ESCSERIAL_TIMER_TX_HARDWARE 0 // PWM 1

#define USE_SERIAL_4WAY_BLHELI_INTERFACE

#define UART1_TX_PIN            PA9
#define UART1_RX_PIN            PA10

#define UART2_TX_PIN            PA14 // PA14 / SWCLK
#define UART2_RX_PIN            PA15

#define UART3_TX_PIN            PB10 // PB10 (AF7)
#define UART3_RX_PIN            PB11 // PB11 (AF7)

#ifndef TINYBEEF3
#define SOFTSERIAL1_RX_PIN      PA0 // PA0 / PAD3
#define SOFTSERIAL1_TX_PIN      PA1 // PA1 / PAD4
#endif

#define SONAR_SOFTSERIAL1_EXCLUSIVE

#define USE_SPI

#ifdef TINYBEEF3
#define USE_SPI_DEVICE_1 // PB9,3,4,5 on AF5 SPI1 (MPU)

#define SPI1_NSS_PIN            PB9
#define SPI1_SCK_PIN            PB3
#define SPI1_MISO_PIN           PB4
#define SPI1_MOSI_PIN           PB5

#define MPU6500_CS_PIN                   SPI1_NSS_PIN
#define MPU6500_SPI_INSTANCE             SPI1
#else
#define USE_I2C
#define USE_I2C_DEVICE_1
#define I2C_DEVICE              (I2CDEV_1)

#define USE_SPI_DEVICE_2 // PB12,13,14,15 on AF5

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

// Performance logging for SD card operations:
// #define AFATFS_USE_INTROSPECTIVE_LOGGING

#define ENABLE_BLACKBOX_LOGGING_ON_SDCARD_BY_DEFAULT
#endif

#define DEFAULT_VOLTAGE_METER_SOURCE VOLTAGE_METER_ADC
#define USE_ADC
#define ADC_INSTANCE                ADC2
#define VBAT_ADC_PIN                PA4
#define CURRENT_METER_ADC_PIN       PA5
#define RSSI_ADC_PIN                PB2

#define TRANSPONDER

#define REDUCE_TRANSPONDER_CURRENT_DRAW_WHEN_USB_CABLE_PRESENT

#define DEFAULT_RX_FEATURE      FEATURE_RX_PPM

#ifndef TINYBEEF3

#define BUTTONS
#define BUTTON_A_PIN            PB1
#define BUTTON_B_PIN            PB0

#define BINDPLUG_PIN            BUTTON_B_PIN
#endif

#define SPEKTRUM_BIND_PIN       UART2_RX_PIN

#define TARGET_IO_PORTA         0xffff
#define TARGET_IO_PORTB         0xffff
#define TARGET_IO_PORTC         (BIT(13)|BIT(14)|BIT(15))
#define TARGET_IO_PORTF         (BIT(0)|BIT(1)|BIT(4))

#define USABLE_TIMER_CHANNEL_COUNT 12 // 8 Outputs; PPM; LED Strip; 2 additional PWM pins also on UART3 RX/TX pins.
#ifdef TINYBEEF3
#define USED_TIMERS             (TIM_N(1) | TIM_N(2) | TIM_N(3) | TIM_N(8) | TIM_N(15))
#else
#define USED_TIMERS             (TIM_N(1) | TIM_N(2) | TIM_N(3) | TIM_N(4) | TIM_N(15) | TIM_N(16) |TIM_N(17))
#endif
