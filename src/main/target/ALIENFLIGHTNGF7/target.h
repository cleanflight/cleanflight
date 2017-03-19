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
#define TARGET_BOARD_IDENTIFIER "AFF7"
#define TARGET_CONFIG

#define USE_HARDWARE_REVISION_DETECTION
#define HW_PIN                  PC13
#define BRUSHED_ESC_AUTODETECT
#define USE_DSHOT

#define USBD_PRODUCT_STRING "AlienFlightNG F7"

#define LED0                    PC12
#define LED1                    PD2

#define BEEPER                  PC13
#define BEEPER_INVERTED

// MPU interrupt
#define USE_EXTI
#define MPU_INT_EXTI            PC14
//#define DEBUG_MPU_DATA_READY_INTERRUPT
#define USE_MPU_DATA_READY_SIGNAL
#define ENSURE_MPU_DATA_READY_IS_LOW

#define MPU6500_CS_PIN          SPI1_NSS_PIN
#define MPU6500_SPI_INSTANCE    SPI1

#define ACC
#define USE_ACC_SPI_MPU6500
#define ACC_MPU6500_ALIGN       CW270_DEG

#define GYRO
#define USE_GYRO_SPI_MPU6500
#define GYRO_MPU6500_ALIGN      CW270_DEG

#define MAG
#define USE_MAG_HMC5883
#define USE_MAG_SPI_HMC5883
#define USE_MAG_AK8963

#define HMC5883_CS_PIN          PC15
#define HMC5883_SPI_INSTANCE    SPI3

#define MAG_HMC5883_ALIGN       CW180_DEG
#define MAG_AK8963_ALIGN        CW270_DEG

#define BARO
#define USE_BARO_MS5611
#define USE_BARO_BMP280
#define USE_BARO_SPI_BMP280

#define BMP280_CS_PIN           SPI3_NSS_PIN
#define BMP280_SPI_INSTANCE     SPI3

#define USE_SDCARD

//#define SDCARD_DETECT_INVERTED

#define SDCARD_DETECT_PIN               PB11
#define SDCARD_DETECT_EXTI_LINE         EXTI_Line10
#define SDCARD_DETECT_EXTI_PIN_SOURCE   EXTI_PinSource10
#define SDCARD_DETECT_EXTI_PORT_SOURCE  EXTI_PortSourceGPIOB
#define SDCARD_DETECT_EXTI_IRQn         EXTI15_10_IRQn

#define SDCARD_SPI_INSTANCE             SPI2
#define SDCARD_SPI_CS_PIN               PB10

// SPI2 is on the APB1 bus whose clock runs at 84MHz. Divide to under 400kHz for init:
#define SDCARD_SPI_INITIALIZATION_CLOCK_DIVIDER 256 // 328kHz
// Divide to under 25MHz for normal operation:
#define SDCARD_SPI_FULL_SPEED_CLOCK_DIVIDER 4 // 21MHz

#define SDCARD_DMA_CHANNEL_TX               DMA1_Stream4
#define SDCARD_DMA_CHANNEL_TX_COMPLETE_FLAG DMA_FLAG_TCIF4
#define SDCARD_DMA_CLK                      RCC_AHB1Periph_DMA1
#define SDCARD_DMA_CHANNEL                  DMA_CHANNEL_0

// Performance logging for SD card operations:
// #define AFATFS_USE_INTROSPECTIVE_LOGGING

//#define M25P16_CS_PIN        SPI2_NSS_PIN
//#define M25P16_SPI_INSTANCE  SPI2

//#define USE_FLASHFS
//#define USE_FLASH_M25P16

#define USE_VCP

#define USE_UART1
#define UART1_RX_PIN            PA10
#define UART1_TX_PIN            PA9

#define USE_UART2
#define UART2_RX_PIN            PA3
#define UART2_TX_PIN            PA2

//#define USE_UART3
//#define UART3_RX_PIN            PB11
//#define UART3_TX_PIN            PB10

#define USE_UART4
#define UART4_RX_PIN            PC10
#define UART4_TX_PIN            PC11

//#define USE_UART5
//#define UART5_RX_PIN            PD2
//#define UART5_TX_PIN            PC12

#define SERIAL_PORT_COUNT       4

//#define USE_ESCSERIAL
//#define ESCSERIAL_TIMER_TX_HARDWARE 0 // PWM 1

#define USE_SPI
#define USE_SPI_DEVICE_1
#define USE_SPI_DEVICE_2
#define USE_SPI_DEVICE_3

#define SPI1_NSS_PIN            PA4
#define SPI1_SCK_PIN            PA5
#define SPI1_MISO_PIN           PA6
#define SPI1_MOSI_PIN           PA7

#define SPI2_NSS_PIN            PB12
#define SPI2_SCK_PIN            PB13
#define SPI2_MISO_PIN           PC2
#define SPI2_MOSI_PIN           PC3

#define SPI3_NSS_PIN            PA15
#define SPI3_SCK_PIN            PB3
#define SPI3_MISO_PIN           PB4
#define SPI3_MOSI_PIN           PB5

#define USE_I2C
#define I2C_DEVICE              (I2CDEV_1)
//#define I2C_DEVICE_EXT          (I2CDEV_2)
#define I2C1_SCL                PB6
#define I2C1_SDA                PB7

#define USE_ADC
#define BOARD_HAS_VOLTAGE_DIVIDER
#define BOARD_HAS_CURRENT_SENSOR
#define VBAT_ADC_PIN            PC0
#define CURRENT_METER_ADC_PIN   PC1
#define RSSI_ADC_PIN            PC4

#define CURRENT_METER_OFFSET_DEFAULT 2500                      // ACS712/714-30A - 0A = 2.5V
#define CURRENT_METER_SCALE_DEFAULT -667                       // ACS712/714-30A - 66.666 mV/A inverted mode

// LED strip configuration.
#define LED_STRIP

#define SPEKTRUM_BIND_PIN       UART2_RX_PIN

#define BINDPLUG_PIN            PB2

#define ENABLE_BLACKBOX_LOGGING_ON_SDCARD_BY_DEFAULT

#define DEFAULT_FEATURES        (FEATURE_MOTOR_STOP | FEATURE_BLACKBOX)
#define DEFAULT_RX_FEATURE      FEATURE_RX_SERIAL
#define SERIALRX_UART           SERIAL_PORT_USART2
#define RX_CHANNELS_TAER

#define TELEMETRY_UART          SERIAL_PORT_USART1

#define USE_SERIAL_4WAY_BLHELI_INTERFACE

#define TARGET_IO_PORTA         0xffff
#define TARGET_IO_PORTB         0xffff
#define TARGET_IO_PORTC         0xffff
#define TARGET_IO_PORTD         (BIT(2))

#define USABLE_TIMER_CHANNEL_COUNT      13
#define USED_TIMERS             ( TIM_N(1) | TIM_N(3) | TIM_N(4) | TIM_N(5) | TIM_N(8) )

