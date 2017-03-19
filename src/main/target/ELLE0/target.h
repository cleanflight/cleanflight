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
#define TARGET_BOARD_IDENTIFIER "ELL0"

#define TARGET_XTAL_MHZ         25

#define USBD_PRODUCT_STRING "Elle0"

#define LED0                    PA8
#define LED1                    PB4
#define LED2                    PC2

// MPU9250 interrupt
#define USE_EXTI
#define MPU_INT_EXTI            PB5
//#define DEBUG_MPU_DATA_READY_INTERRUPT
#define USE_MPU_DATA_READY_SIGNAL
#define ENSURE_MPU_DATA_READY_IS_LOW

#define MPU6500_CS_PIN          PB12
#define MPU6500_SPI_INSTANCE    SPI2

// Using MPU6050 for the moment.
#define GYRO
#define USE_GYRO_SPI_MPU6500
#define GYRO_MPU6500_ALIGN      CW270_DEG

#define ACC
#define USE_ACC_SPI_MPU6500
#define ACC_MPU6500_ALIGN       CW270_DEG

//#define BARO
//#define USE_BARO_MS5611

#define MAG
#define USE_MAG_AK8963
#define MAG_AK8963_ALIGN        CW0_DEG_FLIP

#define USE_VCP

/* Telemetry (Overlaps with DMA from motors) */
//#define USE_UART1
//#define UART1_RX_PIN            PA10
//#define UART1_TX_PIN            PA9
//#define UART1_AHB1_PERIPHERALS  RCC_AHB1Periph_DMA2

/* RX1 */
#define USE_UART2
#define UART2_RX_PIN        PA3
#define UART2_TX_PIN        PA2

/* I2C */
#define USE_UART3
#define UART3_RX_PIN            PB11
#define UART3_TX_PIN            PB10

/* RX2 */
//#define USE_UART5
//#define UART5_RX_PIN            PD2
//#define UART5_TX_PIN            PC12

#define USE_SOFTSERIAL1
#define USE_SOFTSERIAL2

#define SERIAL_PORT_COUNT 5

#define USE_SPI

#define USE_SPI_DEVICE_2 //MPU9250
#define SPI2_NSS_PIN            PB12
#define SPI2_SCK_PIN            PB13
#define SPI2_MISO_PIN           PB14
#define SPI2_MOSI_PIN           PB15

#define USE_ADC
#define VBAT_ADC_PIN            PC4
#define CURRENT_METER_ADC_PIN   PC5

#undef LED_STRIP

#define DEFAULT_RX_FEATURE      FEATURE_RX_SERIAL
#define SERIALRX_PROVIDER    SERIALRX_SPEKTRUM2048
#define SERIALRX_UART           SERIAL_PORT_USART2
#define RX_CHANNELS_TAER

#define TARGET_IO_PORTA         0xffff
#define TARGET_IO_PORTB         0xffff
#define TARGET_IO_PORTC         0xffff
#define TARGET_IO_PORTD         (BIT(2))

#define USABLE_TIMER_CHANNEL_COUNT 9
#define USED_TIMERS  (TIM_N(2) | TIM_N(4) | TIM_N(5) | TIM_N(8))
