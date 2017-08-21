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

// SITL (software in the loop) simulator
#define TARGET_BOARD_IDENTIFIER "SITL"

#define SIMULATOR_BUILD
#define SIMULATOR_MULTITHREAD

// use simulatior's attitude directly
// disable this if wants to test AHRS algorithm
#define SKIP_IMU_CALC

//#define SIMULATOR_ACC_SYNC
//#define SIMULATOR_GYRO_SYNC
//#define SIMULATOR_IMU_SYNC
//#define SIMULATOR_GYROPID_SYNC

// file name to save config
#define EEPROM_FILENAME "eeprom.bin"
#define EEPROM_IN_RAM
#define EEPROM_SIZE     8192

#define U_ID_0 0
#define U_ID_1 1
#define U_ID_2 2

#undef TASK_GYROPID_DESIRED_PERIOD
#define TASK_GYROPID_DESIRED_PERIOD     100

#undef SCHEDULER_DELAY_LIMIT
#define SCHEDULER_DELAY_LIMIT           1

#define USE_FAKE_LED

#define ACC
#define USE_FAKE_ACC

#define GYRO
#define USE_FAKE_GYRO

#define MAG
#define USE_FAKE_MAG

#define BARO
#define USE_FAKE_BARO

#define USABLE_TIMER_CHANNEL_COUNT 0

#define USE_UART1
#define USE_UART2
#define USE_UART3
#define USE_UART4
#define USE_UART5
#define USE_UART6
#define USE_UART7
#define USE_UART8

//#define USE_SOFTSERIAL1
//#define USE_SOFTSERIAL2

#define SERIAL_PORT_COUNT 8

#define DEFAULT_RX_FEATURE      FEATURE_RX_MSP
#define DEFAULT_FEATURES        (FEATURE_GPS | FEATURE_TELEMETRY)

#define USE_PARAMETER_GROUPS

#undef STACK_CHECK // I think SITL don't need this
#undef USE_DASHBOARD
#undef TELEMETRY_LTM
#undef USE_ADC
#undef USE_VCP
#undef USE_PPM
#undef USE_PWM
#undef SERIAL_RX
#undef USE_SERIALRX_CRSF
#undef USE_SERIALRX_IBUS
#undef USE_SERIALRX_SBUS
#undef USE_SERIALRX_SPEKTRUM
#undef USE_SERIALRX_SUMD
#undef USE_SERIALRX_SUMH
#undef USE_SERIALRX_XBUS
#undef LED_STRIP
#undef TELEMETRY_FRSKY
#undef TELEMETRY_HOTT
#undef TELEMETRY_SMARTPORT
#undef TELEMETRY_MAVLINK
#undef USE_RESOURCE_MGMT
#undef CMS
#undef TELEMETRY_CRSF
#undef TELEMETRY_IBUS
#undef TELEMETRY_JETIEXBUS
#undef TELEMETRY_SRXL
#undef USE_SERIALRX_JETIEXBUS
#undef VTX_COMMON
#undef VTX_CONTROL
#undef VTX_SMARTAUDIO
#undef VTX_TRAMP
#undef USE_CAMERA_CONTROL

#undef USE_I2C
#undef USE_SPI

#define FLASH_SIZE 2048


#define LED_STRIP_TIMER 1
#define SOFTSERIAL_1_TIMER 2
#define SOFTSERIAL_2_TIMER 3

#define DEFIO_NO_PORTS   // suppress 'no pins defined' warning

#define WS2811_DMA_TC_FLAG (void *)1
#define WS2811_DMA_HANDLER_IDENTIFER 0


// belows are internal stuff
#include <stdint.h>
#include <stddef.h>

uint32_t SystemCoreClock;

#define UNUSED(x) (void)(x)

typedef enum
{
    Mode_TEST = 0x0,
    Mode_Out_PP = 0x10
} GPIO_Mode;

typedef enum {RESET = 0, SET = !RESET} FlagStatus, ITStatus;
typedef enum {DISABLE = 0, ENABLE = !DISABLE} FunctionalState;
typedef enum {TEST_IRQ = 0 } IRQn_Type;
typedef enum {
    EXTI_Trigger_Rising = 0x08,
    EXTI_Trigger_Falling = 0x0C,
    EXTI_Trigger_Rising_Falling = 0x10
} EXTITrigger_TypeDef;

typedef struct
{
  uint32_t IDR;
  uint32_t ODR;
  uint32_t BSRR;
  uint32_t BRR;
} GPIO_TypeDef;

#define GPIOA_BASE ((intptr_t)0x0001)

typedef struct
{
    void* test;
} TIM_TypeDef;

typedef struct
{
    void* test;
} TIM_OCInitTypeDef;

typedef struct {
    void* test;
} DMA_TypeDef;

typedef struct {
    void* test;
} DMA_Channel_TypeDef;

uint8_t DMA_GetFlagStatus(void *);
void DMA_Cmd(DMA_Channel_TypeDef*, FunctionalState );
void DMA_ClearFlag(uint32_t);

typedef struct
{
    void* test;
} SPI_TypeDef;

typedef struct
{
    void* test;
} USART_TypeDef;

#define USART1 ((USART_TypeDef *)0x0001)
#define USART2 ((USART_TypeDef *)0x0002)
#define USART3 ((USART_TypeDef *)0x0003)
#define USART4 ((USART_TypeDef *)0x0004)
#define USART5 ((USART_TypeDef *)0x0005)
#define USART6 ((USART_TypeDef *)0x0006)
#define USART7 ((USART_TypeDef *)0x0007)
#define USART8 ((USART_TypeDef *)0x0008)

#define UART4 ((USART_TypeDef *)0x0004)
#define UART5 ((USART_TypeDef *)0x0005)
#define UART7 ((USART_TypeDef *)0x0007)
#define UART8 ((USART_TypeDef *)0x0008)

typedef struct
{
    void* test;
} I2C_TypeDef;

typedef enum
{
  FLASH_BUSY = 1,
  FLASH_ERROR_PG,
  FLASH_ERROR_WRP,
  FLASH_COMPLETE,
  FLASH_TIMEOUT
} FLASH_Status;

typedef struct {
    double timestamp;                   // in seconds
    double imu_angular_velocity_rpy[3]; // rad/s -> range: +/- 8192; +/- 2000 deg/se
    double imu_linear_acceleration_xyz[3];    // m/s/s NED, body frame -> sim 1G = 9.80665, FC 1G = 256
    double imu_orientation_quat[4];     //w, x, y, z
    double velocity_xyz[3];             // m/s, earth frame
    double position_xyz[3];             // meters, NED from origin
} fdm_packet;
typedef struct {
    float motor_speed[4];   // normal: [0.0, 1.0], 3D: [-1.0, 1.0]
} servo_packet;

void FLASH_Unlock(void);
void FLASH_Lock(void);
FLASH_Status FLASH_ErasePage(uintptr_t Page_Address);
FLASH_Status FLASH_ProgramWord(uintptr_t addr, uint32_t Data);

uint64_t nanos64_real();
uint64_t micros64_real();
uint64_t millis64_real();
void delayMicroseconds_real(uint32_t us);
uint64_t micros64();
uint64_t millis64();

int lockMainPID(void);

