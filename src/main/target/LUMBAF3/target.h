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

#define TARGET_BOARD_IDENTIFIER "MCF3" // LumbaF3 Flight Controller by mC

#define LED0_PIN                PB3
#define BEEPER                  PC15

#define USE_EXTI
#define MPU_INT_EXTI            PA3
#define USE_MPU_DATA_READY_SIGNAL

#define USE_SPI
#define USE_SPI_DEVICE_1
#define USE_SPI_DEVICE_2

#define MPU6000_CS_GPIO         GPIOA
#define MPU6000_CS_PIN          PA4
#define MPU6000_SPI_INSTANCE    SPI1

#define M25P16_CS_GPIO          GPIOB
#define M25P16_CS_PIN           PB12
#define M25P16_SPI_INSTANCE     SPI2

#define USE_FLASHFS
#define USE_FLASH_M25P16

#define GYRO
#define USE_GYRO_SPI_MPU6000
#define GYRO_MPU6000_ALIGN      CW90_DEG

#define ACC
#define USE_ACC_SPI_MPU6000
#define ACC_MPU6000_ALIGN       CW90_DEG

#define USE_VCP
#define USE_UART1
#define USE_UART3
#define USE_SOFTSERIAL1

#define SERIAL_PORT_COUNT       4

#define UART1_TX_PIN            PA9
#define UART1_RX_PIN            PA10
#ifdef USE_UART1_RX_DMA
#undef USE_UART1_RX_DMA
#endif

#define UART3_TX_PIN            PB10
#define UART3_RX_PIN            PB11

#define SOFTSERIAL1_TX_PIN      PB5
#define SOFTSERIAL1_RX_PIN      PB0

#define DEFAULT_VOLTAGE_METER_SOURCE VOLTAGE_METER_ADC
#define USE_ADC
#define CURRENT_METER_ADC_PIN   PB1
#define VBAT_ADC_PIN            PA0

#define USE_SERIAL_4WAY_BLHELI_INTERFACE

#define LED_STRIP

#define CAMERA_CONTROL_PIN      PA15

#define DEFAULT_RX_FEATURE      FEATURE_RX_SERIAL
#define SERIALRX_PROVIDER       SERIALRX_SBUS
#define SERIALRX_UART           SERIAL_PORT_USART1
#define DEFAULT_FEATURES        FEATURE_TELEMETRY

#define TARGET_IO_PORTA         0xffff
#define TARGET_IO_PORTB         0xffff
#define TARGET_IO_PORTC         ( BIT(15) )

#define USABLE_TIMER_CHANNEL_COUNT 10
#define USED_TIMERS             ( TIM_N(1) | TIM_N(2) | TIM_N(3) | TIM_N(4) | TIM_N(8) | TIM_N(15) | TIM_N(16) )
