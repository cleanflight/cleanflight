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

#define TARGET_BOARD_IDENTIFIER "SIRF"

#define LED0                    PB2
#define BEEPER                  PA1


#define USE_EXTI
#define USE_MPU_DATA_READY_SIGNAL
#define MPU_INT_EXTI            PA8
#define ENSURE_MPU_DATA_READY_IS_LOW

#define GYRO
#define USE_GYRO_SPI_MPU6000
#define USE_GYRO_MPU6500
#define USE_GYRO_SPI_MPU6500

#define ACC
#define USE_ACC_SPI_MPU6000
#define USE_ACC_MPU6500
#define USE_ACC_SPI_MPU6500

// MPU6000
#define ACC_MPU6000_ALIGN       CW180_DEG
#define GYRO_MPU6000_ALIGN      CW180_DEG

#define MPU6000_CS_PIN          PA4
#define MPU6000_SPI_INSTANCE    SPI1

// MPU6500
#define ACC_MPU6500_ALIGN       CW90_DEG
#define GYRO_MPU6500_ALIGN      CW90_DEG

#define MPU6500_CS_PIN          PA4
#define MPU6500_SPI_INSTANCE    SPI1

#define USE_VCP
#define USE_UART1
#define USE_UART2
#define USE_UART3
#define USE_SOFTSERIAL1
#define USE_SOFTSERIAL2

#define SERIAL_PORT_COUNT       6

#define USE_ESCSERIAL
#define ESCSERIAL_TIMER_TX_HARDWARE 0 // PWM 1

#define UART1_TX_PIN            PA9
#define UART1_RX_PIN            PA10

#define UART2_TX_PIN            PA2 // PA14 / SWCLK
#define UART2_RX_PIN            PA3 // PA15

#define UART3_TX_PIN            PB10 // PB10 (AF7)
#define UART3_RX_PIN            PB11 // PB11 (AF7)

#undef  USE_UART1_RX_DMA
#undef  USE_UART1_TX_DMA

#undef  USE_I2C

#define USE_SPI
#define USE_SPI_DEVICE_1
#define USE_SPI_DEVICE_2 // PB12,13,14,15 on AF5
#define USE_SPI_DEVICE_3

#define SPI1_NSS_PIN            PA4
#define SPI1_SCK_PIN            PA5
#define SPI1_MISO_PIN           PA6
#define SPI1_MOSI_PIN           PA7

#define SPI2_NSS_PIN            PB12
#define SPI2_SCK_PIN            PB13
#define SPI2_MISO_PIN           PB14
#define SPI2_MOSI_PIN           PB15

#define SPI3_NSS_PIN            PA15
#define SPI3_SCK_PIN            PB3
#define SPI3_MISO_PIN           PB4
#define SPI3_MOSI_PIN           PB5

#define REMAP_TIM17_DMA

#define USE_MAX7456
#define MAX7456_SPI_INSTANCE    SPI3
#define MAX7456_SPI_CS_PIN      PA15

#define MAX7456_DMA_CHANNEL_TX              DMA2_Channel2
#define MAX7456_DMA_CHANNEL_RX              DMA2_Channel1
#define MAX7456_DMA_IRQ_HANDLER_ID          DMA2_CH1_HANDLER

#define VTX_RTC6705
#define VTX_RTC6705SOFTSPI

#define RTC6705_SPIDATA_PIN     PC15
#define RTC6705_SPILE_PIN       PC14
#define RTC6705_SPICLK_PIN      PC13

#define USE_SDCARD
#define USE_SDCARD_SPI2

#define SDCARD_SPI_INSTANCE                 SPI2
#define SDCARD_SPI_CS_GPIO                  SPI2_GPIO
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

#define DEFAULT_VOLTAGE_METER_SOURCE VOLTAGE_METER_ADC
#define USE_ADC
#define ADC_INSTANCE            ADC1
#define VBAT_ADC_PIN            PA0
#define CURRENT_METER_ADC_PIN   PA3
#define RSSI_ADC_PIN            PA2

//#define USE_QUAD_MIXER_ONLY
#define ENABLE_BLACKBOX_LOGGING_ON_SDCARD_BY_DEFAULT

#define OSD

#define CONFIG_FASTLOOP_PREFERRED_ACC ACC_DEFAULT

#define SPEKTRUM_BIND_PIN       UART3_RX_PIN

#define DEFAULT_RX_FEATURE      FEATURE_RX_PPM
#define DEFAULT_FEATURES        (FEATURE_RX_SERIAL | FEATURE_OSD)

#define USE_SERIAL_4WAY_BLHELI_INTERFACE

// IO - stm32f303cc in 48pin package
#define TARGET_IO_PORTA         0xffff
#define TARGET_IO_PORTB         0xffff
#define TARGET_IO_PORTC         (BIT(13)|BIT(14)|BIT(15))
#define TARGET_IO_PORTF         (BIT(0)|BIT(1)|BIT(3)|BIT(4))

#define USABLE_TIMER_CHANNEL_COUNT 7
#define USED_TIMERS             (TIM_N(1) | TIM_N(2) | TIM_N(3) | TIM_N(4) | TIM_N(8) | TIM_N(17))

