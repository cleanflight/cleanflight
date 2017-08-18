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

#include "platform.h"

#include "drivers/io_types.h"
#include "drivers/pwm_output_counts.h"
#include "drivers/timer.h"


#define DSHOT_MAX_COMMAND 47

/*
  DshotSettingRequest (KISS24). Spin direction, 3d and save Settings reqire 10 requests.. and the TLM Byte must always be high if 1-47 are used to send settings

  3D Mode:
  0 = stop
  48   (low) - 1047 (high) -> negative direction
  1048 (low) - 2047 (high) -> positive direction
 */

typedef enum {
    DSHOT_CMD_MOTOR_STOP = 0,
    DSHOT_CMD_BEEP1,
    DSHOT_CMD_BEEP2,
    DSHOT_CMD_BEEP3,
    DSHOT_CMD_BEEP4,
    DSHOT_CMD_BEEP5,
    DSHOT_CMD_ESC_INFO, // V2 includes settings
    DSHOT_CMD_SPIN_DIRECTION_1,
    DSHOT_CMD_SPIN_DIRECTION_2,
    DSHOT_CMD_3D_MODE_OFF,
    DSHOT_CMD_3D_MODE_ON,
    DSHOT_CMD_SETTINGS_REQUEST, // Currently not implemented
    DSHOT_CMD_SAVE_SETTINGS,
    DSHOT_CMD_SPIN_DIRECTION_NORMAL = 20,
    DSHOT_CMD_SPIN_DIRECTION_REVERSED = 21,
    DSHOT_CMD_MAX = 47
} dshotCommands_e;


typedef enum {
    PWM_TYPE_STANDARD = 0,
    PWM_TYPE_ONESHOT125,
    PWM_TYPE_ONESHOT42,
    PWM_TYPE_MULTISHOT,
    PWM_TYPE_BRUSHED,
#ifdef USE_DSHOT
    PWM_TYPE_DSHOT150,
    PWM_TYPE_DSHOT300,
    PWM_TYPE_DSHOT600,
    PWM_TYPE_DSHOT1200,
    PWM_TYPE_PROSHOT1000,
#endif
    PWM_TYPE_MAX
} motorPwmProtocolTypes_e;

#define PWM_TIMER_1MHZ        MHZ_TO_HZ(1)

#ifdef USE_DSHOT
#define MAX_DMA_TIMERS        8

#define MOTOR_DSHOT1200_HZ    MHZ_TO_HZ(24)
#define MOTOR_DSHOT600_HZ     MHZ_TO_HZ(12)
#define MOTOR_DSHOT300_HZ     MHZ_TO_HZ(6)
#define MOTOR_DSHOT150_HZ     MHZ_TO_HZ(3)

#define MOTOR_BIT_0           7
#define MOTOR_BIT_1           14
#define MOTOR_BITLENGTH       19

#define MOTOR_PROSHOT1000_HZ         MHZ_TO_HZ(24)
#define PROSHOT_BASE_SYMBOL          24 // 1uS
#define PROSHOT_BIT_WIDTH            3
#define MOTOR_NIBBLE_LENGTH_PROSHOT  96 // 4uS
#endif


#define DSHOT_DMA_BUFFER_SIZE   18 /* resolution + frame reset (2us) */
#define PROSHOT_DMA_BUFFER_SIZE 6  /* resolution + frame reset (2us) */

typedef struct {
    TIM_TypeDef *timer;
    uint16_t timerDmaSources;
} motorDmaTimer_t;

typedef struct {
    ioTag_t ioTag;
    const timerHardware_t *timerHardware;
    uint16_t value;
    uint16_t timerDmaSource;
    volatile bool requestTelemetry;
#if defined(STM32F3) || defined(STM32F4) || defined(STM32F7)
    uint32_t dmaBuffer[DSHOT_DMA_BUFFER_SIZE];
#else
    uint8_t dmaBuffer[DSHOT_DMA_BUFFER_SIZE];
#endif
#if defined(STM32F7)
    TIM_HandleTypeDef TimHandle;
    DMA_HandleTypeDef hdma_tim;
#endif
} motorDmaOutput_t;

motorDmaOutput_t *getMotorDmaOutput(uint8_t index);

struct timerHardware_s;
typedef void pwmWriteFn(uint8_t index, float value);  // function pointer used to write motors
typedef void pwmCompleteWriteFn(uint8_t motorCount);   // function pointer used after motors are written

typedef struct {
    volatile timCCR_t *ccr;
    TIM_TypeDef       *tim;
} timerChannel_t;

typedef struct {
    timerChannel_t channel;
    float pulseScale;
    float pulseOffset;
    bool forceOverflow;
    bool enabled;
    IO_t io;
} pwmOutputPort_t;

typedef struct motorDevConfig_s {
    uint16_t motorPwmRate;                  // The update rate of motor outputs (50-498Hz)
    uint8_t  motorPwmProtocol;              // Pwm Protocol
    uint8_t  motorPwmInversion;             // Active-High vs Active-Low. Useful for brushed FCs converted for brushless operation
    uint8_t  useUnsyncedPwm;
    ioTag_t  ioTags[MAX_SUPPORTED_MOTORS];
} motorDevConfig_t;

void motorDevInit(const motorDevConfig_t *motorDevConfig, uint16_t idlePulse, uint8_t motorCount);

typedef struct servoDevConfig_s {
    // PWM values, in milliseconds, common range is 1000-2000 (1ms to 2ms)
    uint16_t servoCenterPulse;              // This is the value for servos when they should be in the middle. e.g. 1500.
    uint16_t servoPwmRate;                  // The update rate of servo outputs (50-498Hz)
    ioTag_t  ioTags[MAX_SUPPORTED_SERVOS];
} servoDevConfig_t;

void servoDevInit(const servoDevConfig_t *servoDevConfig);

void pwmServoConfig(const struct timerHardware_s *timerHardware, uint8_t servoIndex, uint16_t servoPwmRate, uint16_t servoCenterPulse);

bool isMotorProtocolDshot(void);

#ifdef USE_DSHOT
typedef uint8_t loadDmaBufferFn(motorDmaOutput_t *const motor, uint16_t packet);  // function pointer used to encode a digital motor value into the DMA buffer representation

uint16_t prepareDshotPacket(motorDmaOutput_t *const motor, uint16_t value);

extern loadDmaBufferFn *loadDmaBuffer;

uint32_t getDshotHz(motorPwmProtocolTypes_e pwmProtocolType);
void pwmWriteDshotCommand(uint8_t index, uint8_t command);
void pwmWriteDshotInt(uint8_t index, uint16_t value);
void pwmDshotMotorHardwareConfig(const timerHardware_t *timerHardware, uint8_t motorIndex, motorPwmProtocolTypes_e pwmProtocolType, uint8_t output);
void pwmCompleteDshotMotorUpdate(uint8_t motorCount);
#endif

#ifdef BEEPER
void pwmWriteBeeper(bool onoffBeep);
void pwmToggleBeeper(void);
void beeperPwmInit(const ioTag_t tag, uint16_t frequency);
#endif
void pwmOutConfig(timerChannel_t *channel, const timerHardware_t *timerHardware, uint32_t hz, uint16_t period, uint16_t value, uint8_t inversion);

void pwmWriteMotor(uint8_t index, float value);
void pwmShutdownPulsesForAllMotors(uint8_t motorCount);
void pwmCompleteMotorUpdate(uint8_t motorCount);

void pwmWriteServo(uint8_t index, float value);

pwmOutputPort_t *pwmGetMotors(void);
bool pwmIsSynced(void);
void pwmDisableMotors(void);
void pwmEnableMotors(void);
bool pwmAreMotorsEnabled(void);
