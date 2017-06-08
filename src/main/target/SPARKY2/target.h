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
#define TARGET_BOARD_IDENTIFIER "SPK2"

#define USBD_PRODUCT_STRING "Sparky 2.0"
#ifdef OPBL
    #define USBD_SERIALNUMBER_STRING "0x8020000"
#endif

#define LED0                    PB5
#define LED1                    PB4
#define LED2                    PB6

#define BEEPER                  PC9
#define BEEPER_INVERTED

#define INVERTER_PIN_UART6      PC6

#define USE_ESC_SENSOR

// MPU9250 interrupt
#define USE_EXTI
#define MPU_INT_EXTI            PC5
//#define DEBUG_MPU_DATA_READY_INTERRUPT
#define USE_MPU_DATA_READY_SIGNAL
#define ENSURE_MPU_DATA_READY_IS_LOW

#define MPU9250_CS_PIN          PC4
#define MPU9250_SPI_INSTANCE    SPI1

#define ACC
#define USE_ACC_SPI_MPU9250
#define ACC_MPU9250_ALIGN       CW270_DEG

#define GYRO
#define USE_GYRO_SPI_MPU9250
#define GYRO_MPU9250_ALIGN      CW270_DEG

#define MAG
//#define USE_MAG_HMC5883
#define USE_MAG_AK8963

//#define MAG_HMC5883_ALIGN       CW180_DEG
#define MAG_AK8963_ALIGN        CW270_DEG

#define BARO
#define USE_BARO_MS5611
//#define USE_BARO_BMP280

#define M25P16_CS_PIN           PB3
#define M25P16_SPI_INSTANCE     SPI3

//#define RFM22B_CS_PIN           PA15
//#define RFM22B_SPI_INSTANCE     SPI3

#define USE_FLASHFS
#define USE_FLASH_M25P16
#define USE_FLASH_TOOLS

#define USE_VCP
#define VBUS_SENSING_PIN        PA8

#define USE_UART1
#define UART1_RX_PIN            PA10
#define UART1_TX_PIN            PA9
#define UART1_AHB1_PERIPHERALS  RCC_AHB1Periph_DMA2

#define USE_UART3
#define UART3_RX_PIN            PB11
#define UART3_TX_PIN            PB10

#define USE_UART6
#define UART6_RX_PIN            PC7
#define UART6_TX_PIN            PC6 //inverter

#define SERIAL_PORT_COUNT 4

#define USE_ESCSERIAL
#define ESCSERIAL_TIMER_TX_HARDWARE 0 // PWM 1

#define USE_SPI

#define USE_SPI_DEVICE_1 //MPU9250
#define SPI1_NSS_PIN            PC4
#define SPI1_SCK_PIN            PA5
#define SPI1_MISO_PIN           PA6
#define SPI1_MOSI_PIN           PA7

#define USE_SPI_DEVICE_3 //dataflash
#define SPI3_NSS_PIN            PB3
#define SPI3_SCK_PIN            PC10
#define SPI3_MISO_PIN           PC11
#define SPI3_MOSI_PIN           PC12

#define USE_I2C
#define USE_I2C_DEVICE_1
#define I2C_DEVICE              (I2CDEV_1)

#define USE_ADC
#define VBAT_ADC_PIN            PC1
#define CURRENT_METER_ADC_PIN   PC2

#undef LED_STRIP

#define DEFAULT_RX_FEATURE      FEATURE_RX_SERIAL
#define SERIALRX_PROVIDER       SERIALRX_SBUS
#define SERIALRX_UART           SERIAL_PORT_USART6

#define USE_SERIAL_4WAY_BLHELI_INTERFACE

#define TARGET_IO_PORTA 0xffff
#define TARGET_IO_PORTB 0xffff
#define TARGET_IO_PORTC 0xffff

#define USABLE_TIMER_CHANNEL_COUNT 11
#define USED_TIMERS  ( TIM_N(2) | TIM_N(3) | TIM_N(5) | TIM_N(12) | TIM_N(8) | TIM_N(9))
