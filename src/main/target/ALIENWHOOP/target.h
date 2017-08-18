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


/*




         \   |   _ _| __|  \ |\ \      /|  |  _ \  _ \ _ \
        _ \  |     |  _|  .  | \ \ \  / __ | (   |(   |__/
      _/  _\____|___|___|_|\_|  \_/\_/ _| _|\___/\___/_|


              Take me to your leader-board...



*/

#pragma once

/* Multi-Arch Support for 168MHz or 216MHz ARM Cortex processors - STM32F405RGT or STM32F7RET
 */
#if defined(ALIENWHOOPF4)
#define TARGET_BOARD_IDENTIFIER "AWF4"
#define USBD_PRODUCT_STRING     "AlienWhoopF4"
#else
#define TARGET_BOARD_IDENTIFIER "AWF7"
#define USBD_PRODUCT_STRING     "AlienWhoopF7"
#endif

#define TARGET_CONFIG // see config.c for target specific customizations

#define CONFIG_FASTLOOP_PREFERRED_ACC ACC_DEFAULT
#define BRUSHED_MOTORS
#define BRUSHED_ESC_AUTODETECT

/* Visual Alerts - SMD LEDs
 */
#define LED0_PIN                PC12 // conflicts UART5
#define LED1_PIN                PD2  // conflicts UART5

#define LED_STRIP

/* Lost Quad Mode and Alerts - RCX03-787 Low Voltage Active Buzzer
 */
#define BEEPER                 PA2
#define BEEPER_INVERTED

/* Serial Peripheral Interface (SPI) - Up to 50 Mbit/s on F7
 */
#define USE_SPI
#define USE_SPI_DEVICE_1 // SPI1 can communicate at up to 42 Mbits/s on F4
#define USE_SPI_DEVICE_2 // SPI2 and SPI3 can communicate at up to 21 Mbit/s on F4
#define USE_SPI_DEVICE_3 // All SPIs can be served by the DMA controller.
#if defined(ALIENWHOOPF7)
//TODO:
//#define USE_SPI_DEVICE_4
//#define USE_SPI_DEVICE_5
#endif

#define SPI1_NSS_PIN            PA4 // LQFP64 pin 20 (PA4)
#define SPI1_SCK_PIN            PA5 // LQFP64 pin 21 (PA5)
#define SPI1_MISO_PIN           PA6 // LQFP64 pin 22 (PA6)
#define SPI1_MOSI_PIN           PA7 // LQFP64 pin 23 (PA7)

#define SPI2_NSS_PIN            PB12 // LQFP64 pin 33 (PB12)
#define SPI2_SCK_PIN            PB13 // LQFP64 pin 34 (PB13)
#define SPI2_MISO_PIN           PB14 // LQFP64 pin 35 (PB14)
#define SPI2_MOSI_PIN           PB15 // LQFP64 pin 36 (PB15)

#define SPI3_NSS_PIN            PA15 // LQFP64 pin 50 (PA15)
//#define SPI3_SCK_PIN            PC10 // LQFP64 pin 51 (PC10)
//#define SPI3_MISO_PIN           PC11 // LQFP64 pin 52 (PC11)
//#define SPI3_MOSI_PIN           PC12 // LQFP64 pin 53 (PC12)
#define SPI3_SCK_PIN            PB3  // LQFP64 pin 55 (PB3)
#define SPI3_MISO_PIN           PB4  // LQFP64 pin 56 (PB4)
#define SPI3_MOSI_PIN           PB5  // LQFP64 pin 57 (PB5)

#if defined(ALIENWHOOPF7)
//TODO: define SPI4 and SPI5 for F7 target
//#define SPI4_NSS_PIN
//#define SPI4_SCK_PIN
//#define SPI4_MISO_PIN
//#define SPI4_MOSI_PIN
//#define SPI5_NSS_PIN
//#define SPI5_SCK_PIN
//#define SPI5_MISO_PIN
//#define SPI5_MOSI_PIN
#endif

/* Motion Processing Unit (MPU) - Invensense 6-axis MPU-6500 or 9-axis MPU-9250
 */
// Interrupt
#define USE_EXTI
#define MPU_INT_EXTI            PC14
// MPU
#define MPU6500_CS_PIN          SPI1_NSS_PIN
#define MPU6500_SPI_INSTANCE    SPI1
#define USE_MPU_DATA_READY_SIGNAL
#define ENSURE_MPU_DATA_READY_IS_LOW
// MAG
#define MAG
#define USE_MAG_AK8963
#define MAG_AK8963_ALIGN        CW0_DEG
#define USE_MAG_DATA_READY_SIGNAL
#define ENSURE_MAG_DATA_READY_IS_HIGH
// GYRO
#define GYRO
#define USE_GYRO_SPI_MPU6500
#define GYRO_MPU6500_ALIGN      CW0_DEG
// ACC
#define ACC
#define USE_ACC_SPI_MPU6500
#define ACC_MPU6500_ALIGN       CW0_DEG

/* Optional Digital Pressure Sensor (barometer) - Bosch BMP280
 * TODO: not implemented on V1 or V2 pcb
 */
#define BARO
#define USE_BARO_BMP280
#define USE_BARO_SPI_BMP280
#define BMP280_SPI_INSTANCE     SPI3
#define BMP280_CS_PIN           SPI3_NSS_PIN

/* Serial ports etc.
 */
#define USE_VCP
#define USE_UART1
#define USE_UART2
#define USE_UART3
#define USE_UART4
#define USE_UART5

#define SERIAL_PORT_COUNT       6

// USART1
#define UART1_TX_PIN            PA9 // PB1 INCOMPAT F4 -> F7
#define UART1_RX_PIN            PA10 // PB0 INCOMPAT F4 -> F7

// USART2
#define UART2_TX_PIN            PA2 //PA12
#define UART2_RX_PIN            PA3 //PA13

// USART3
#define UART3_TX_PIN            PC10 // PB10 INCOMPAT F4 -> F7
#define UART3_RX_PIN            PC11 // PB11 INCOMPAT F4 -> F7

// UART4 async only on F4
#define UART4_TX_PIN            PA0 // PC10 currently used by USART3
#define UART4_RX_PIN            PA1 // PC11 currently used by USART3

// UART5 async only on F4
//#define UART5_TX_PIN            PB3 // PC12
//#define UART5_RX_PIN            PB4 // PD2

/* Receiver - e.g. FrSky XM/XM+ or Spektrum/Lemon DSM/DSMX capable of 3.3V
 */
/* Assume Spektrum following defines inherited from common_fc_pre.h:
//#define USE_SERIALRX_SPEKTRUM
//#define USE_SPEKTRUM_BIND
//#define USE_SPEKTRUM_BIND_PLUG
*/
#define BINDPLUG_PIN            PC13 // PC13 Current Limited (3 mA). Not suitable for LED/Beeper
#define SPEKTRUM_BIND_PIN       UART3_RX_PIN
#define SERIALRX_UART           SERIAL_PORT_USART3
#define RX_CHANNELS_TAER        //RX_CHANNELS_AETR
#define SERIALRX_PROVIDER       SERIALRX_SPEKTRUM1024 //SERIALRX_SBUS

/* Defaults - What do we want out of the box?
 */
#if defined(BREADBOARD)
#define DEFAULT_FEATURES        (FEATURE_RX_SERIAL | FEATURE_MOTOR_STOP | FEATURE_LED_STRIP )
#else
#define DEFAULT_FEATURES        (FEATURE_RX_SERIAL | FEATURE_MOTOR_STOP) // FEATURE_TELEMETRY changes bind pin from rx to tx
#endif

#undef VTX_COMMON
#undef VTX_CONTROL
#undef VTX_SMARTAUDIO
#undef VTX_TRAMP

/* OLED Support
 */
#if defined(BREADBOARD)
#define CMS
#define USE_I2C
#define USE_I2C_DEVICE_1
#define I2C_DEVICE              (I2CDEV_1)
#define USE_I2C_PULLUP
#define I2C1_SCL                PB6
#define I2C1_SDA                PB7
#else
#undef CMS
#undef USE_I2C
#endif

/* MCU Pin Mapping - LPFQ64 Flags
 */
#define TARGET_IO_PORTA         0xffff
#define TARGET_IO_PORTB         0xffff
#define TARGET_IO_PORTC         0xffff
#if defined(ALIENWHOOPF4)
// STM32F405RGT
#define TARGET_IO_PORTD         (BIT(2))
#else
// STM32F722RET
#define TARGET_IO_PORTD         0xffff
#define TARGET_IO_PORTE         0xffff
#endif

/* Timers
 */
#define USABLE_TIMER_CHANNEL_COUNT 5
#define USED_TIMERS             ( TIM_N(3) | TIM_N(8) | TIM_N(5) )

