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

#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

#include "platform.h"
#include "drivers/system.h"

#include "drivers/io.h"
#include "pwm_output.h"
#include "timer.h"
#include "drivers/pwm_output.h"

#define MULTISHOT_5US_PW    (MULTISHOT_TIMER_MHZ * 5)
#define MULTISHOT_20US_MULT (MULTISHOT_TIMER_MHZ * 20 / 1000.0f)

#define DSHOT_MAX_COMMAND 47

static pwmWriteFuncPtr pwmWritePtr;
static pwmOutputPort_t motors[MAX_SUPPORTED_MOTORS];
static pwmCompleteWriteFuncPtr pwmCompleteWritePtr = NULL;

#ifdef USE_SERVOS
static pwmOutputPort_t servos[MAX_SUPPORTED_SERVOS];
#endif

#ifdef BEEPER
static pwmOutputPort_t beeperPwm;
static uint16_t freqBeep=0;
#endif

bool pwmMotorsEnabled = false;

static void pwmOCConfig(TIM_TypeDef *tim, uint8_t channel, uint16_t value, uint8_t output)
{
#if defined(USE_HAL_DRIVER)
    TIM_HandleTypeDef* Handle = timerFindTimerHandle(tim);
    if(Handle == NULL) return;

    TIM_OC_InitTypeDef TIM_OCInitStructure;

    TIM_OCInitStructure.OCMode = TIM_OCMODE_PWM1;

    if (output & TIMER_OUTPUT_N_CHANNEL) {
        TIM_OCInitStructure.OCIdleState = TIM_OCIDLESTATE_RESET;
        TIM_OCInitStructure.OCPolarity = (output & TIMER_OUTPUT_INVERTED) ? TIM_OCPOLARITY_HIGH: TIM_OCPOLARITY_LOW;
        TIM_OCInitStructure.OCNIdleState = TIM_OCNIDLESTATE_RESET;
        TIM_OCInitStructure.OCNPolarity = (output & TIMER_OUTPUT_INVERTED) ? TIM_OCNPOLARITY_HIGH : TIM_OCNPOLARITY_LOW;
    } else {
        TIM_OCInitStructure.OCIdleState = TIM_OCIDLESTATE_SET;
        TIM_OCInitStructure.OCPolarity = (output & TIMER_OUTPUT_INVERTED) ? TIM_OCPOLARITY_LOW : TIM_OCPOLARITY_HIGH;
        TIM_OCInitStructure.OCNIdleState = TIM_OCNIDLESTATE_SET;
        TIM_OCInitStructure.OCNPolarity = (output & TIMER_OUTPUT_INVERTED) ? TIM_OCNPOLARITY_LOW : TIM_OCNPOLARITY_HIGH;
    }

    TIM_OCInitStructure.Pulse = value;
    TIM_OCInitStructure.OCFastMode = TIM_OCFAST_DISABLE;

    HAL_TIM_PWM_ConfigChannel(Handle, &TIM_OCInitStructure, channel);
#else
    TIM_OCInitTypeDef TIM_OCInitStructure;

    TIM_OCStructInit(&TIM_OCInitStructure);
    TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM1;

    if (output & TIMER_OUTPUT_N_CHANNEL) {
        TIM_OCInitStructure.TIM_OutputNState = TIM_OutputNState_Enable;
        TIM_OCInitStructure.TIM_OCNIdleState = TIM_OCNIdleState_Reset;
        TIM_OCInitStructure.TIM_OCNPolarity = (output & TIMER_OUTPUT_INVERTED) ? TIM_OCNPolarity_High : TIM_OCNPolarity_Low;
    } else {
        TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
        TIM_OCInitStructure.TIM_OCIdleState = TIM_OCIdleState_Set;
        TIM_OCInitStructure.TIM_OCPolarity =  (output & TIMER_OUTPUT_INVERTED) ? TIM_OCPolarity_Low : TIM_OCPolarity_High;
    }
    TIM_OCInitStructure.TIM_Pulse = value;

    timerOCInit(tim, channel, &TIM_OCInitStructure);
    timerOCPreloadConfig(tim, channel, TIM_OCPreload_Enable);
#endif
}

static void pwmOutConfig(pwmOutputPort_t *port, const timerHardware_t *timerHardware, uint8_t mhz, uint16_t period, uint16_t value, uint8_t inversion)
{
#if defined(USE_HAL_DRIVER)
    TIM_HandleTypeDef* Handle = timerFindTimerHandle(timerHardware->tim);
    if(Handle == NULL) return;
#endif

    configTimeBase(timerHardware->tim, period, mhz);
    pwmOCConfig(timerHardware->tim, timerHardware->channel, value,
        inversion ? timerHardware->output ^ TIMER_OUTPUT_INVERTED : timerHardware->output);

#if defined(USE_HAL_DRIVER)
    if(timerHardware->output & TIMER_OUTPUT_N_CHANNEL)
        HAL_TIMEx_PWMN_Start(Handle, timerHardware->channel);
    else
        HAL_TIM_PWM_Start(Handle, timerHardware->channel);
    HAL_TIM_Base_Start(Handle);
#else
    TIM_CtrlPWMOutputs(timerHardware->tim, ENABLE);
    TIM_Cmd(timerHardware->tim, ENABLE);
#endif

    port->ccr = timerChCCR(timerHardware);
    port->period = period;
    port->tim = timerHardware->tim;

    *port->ccr = 0;
}

static void pwmWriteUnused(uint8_t index, uint16_t value)
{
    UNUSED(index);
    UNUSED(value);
}

static void pwmWriteBrushed(uint8_t index, uint16_t value)
{
    *motors[index].ccr = (value - 1000) * motors[index].period / 1000;
}

static void pwmWriteStandard(uint8_t index, uint16_t value)
{
    *motors[index].ccr = value;
}

static void pwmWriteOneShot125(uint8_t index, uint16_t value)
{
    *motors[index].ccr = lrintf((float)(value * ONESHOT125_TIMER_MHZ/8.0f));
}

static void pwmWriteOneShot42(uint8_t index, uint16_t value)
{
    *motors[index].ccr = lrintf((float)(value * ONESHOT42_TIMER_MHZ/24.0f));
}

static void pwmWriteMultiShot(uint8_t index, uint16_t value)
{
    *motors[index].ccr = lrintf(((float)(value-1000) * MULTISHOT_20US_MULT) + MULTISHOT_5US_PW);
}

void pwmWriteMotor(uint8_t index, uint16_t value)
{
    pwmWritePtr(index, value);
}

void pwmShutdownPulsesForAllMotors(uint8_t motorCount)
{
    for (int index = 0; index < motorCount; index++) {
        // Set the compare register to 0, which stops the output pulsing if the timer overflows
        if (motors[index].ccr) {
            *motors[index].ccr = 0;
        }
    }
}

void pwmDisableMotors(void)
{
    pwmShutdownPulsesForAllMotors(MAX_SUPPORTED_MOTORS);
    pwmMotorsEnabled = false;
}

void pwmEnableMotors(void)
{
    /* check motors can be enabled */
    pwmMotorsEnabled = (pwmWritePtr != pwmWriteUnused);
}

bool pwmAreMotorsEnabled(void)
{
    return pwmMotorsEnabled;
}

static void pwmCompleteWriteUnused(uint8_t motorCount)
{
    UNUSED(motorCount);    
}

static void pwmCompleteOneshotMotorUpdate(uint8_t motorCount)
{
    for (int index = 0; index < motorCount; index++) {
        if (motors[index].forceOverflow) {
            timerForceOverflow(motors[index].tim);
        }
        // Set the compare register to 0, which stops the output pulsing if the timer overflows before the main loop completes again.
        // This compare register will be set to the output value on the next main loop.
        *motors[index].ccr = 0;
    }
}

void pwmCompleteMotorUpdate(uint8_t motorCount)
{
    pwmCompleteWritePtr(motorCount);
}

void motorDevInit(const motorDevConfig_t *motorConfig, uint16_t idlePulse, uint8_t motorCount)
{
    memset(motors, 0, sizeof(motors));
    
    uint32_t timerMhzCounter = 0;
    bool useUnsyncedPwm = motorConfig->useUnsyncedPwm;
    bool isDigital = false;

    switch (motorConfig->motorPwmProtocol) {
    default:
    case PWM_TYPE_ONESHOT125:
        timerMhzCounter = ONESHOT125_TIMER_MHZ;
        pwmWritePtr = pwmWriteOneShot125;
        break;
    case PWM_TYPE_ONESHOT42:
        timerMhzCounter = ONESHOT42_TIMER_MHZ;
        pwmWritePtr = pwmWriteOneShot42;
        break;
    case PWM_TYPE_MULTISHOT:
        timerMhzCounter = MULTISHOT_TIMER_MHZ;
        pwmWritePtr = pwmWriteMultiShot;
        break;
    case PWM_TYPE_BRUSHED:
        timerMhzCounter = PWM_BRUSHED_TIMER_MHZ;
        pwmWritePtr = pwmWriteBrushed;
        useUnsyncedPwm = true;
        idlePulse = 0;
        break;
    case PWM_TYPE_STANDARD:
        timerMhzCounter = PWM_TIMER_MHZ;
        pwmWritePtr = pwmWriteStandard;
        useUnsyncedPwm = true;
        idlePulse = 0;
        break;
#ifdef USE_DSHOT
    case PWM_TYPE_DSHOT1200:
    case PWM_TYPE_DSHOT600:
    case PWM_TYPE_DSHOT300:
    case PWM_TYPE_DSHOT150:
        pwmWritePtr = pwmWriteDigital;
        pwmCompleteWritePtr = pwmCompleteDigitalMotorUpdate;
        isDigital = true;
        break;
#endif
    }

    if (!isDigital) {
        pwmCompleteWritePtr = useUnsyncedPwm ? pwmCompleteWriteUnused : pwmCompleteOneshotMotorUpdate;
    }

    for (int motorIndex = 0; motorIndex < MAX_SUPPORTED_MOTORS && motorIndex < motorCount; motorIndex++) {
        const ioTag_t tag = motorConfig->ioTags[motorIndex];
        const timerHardware_t *timerHardware = timerGetByTag(tag, TIM_USE_ANY);

        if (timerHardware == NULL) {
            /* not enough motors initialised for the mixer or a break in the motors */
            pwmWritePtr = pwmWriteUnused;
            pwmCompleteWritePtr = pwmCompleteWriteUnused;
            /* TODO: block arming and add reason system cannot arm */
            return;
        }

        motors[motorIndex].io = IOGetByTag(tag);

#ifdef USE_DSHOT
        if (isDigital) {
            pwmDigitalMotorHardwareConfig(timerHardware, motorIndex, motorConfig->motorPwmProtocol,
                motorConfig->motorPwmInversion ? timerHardware->output ^ TIMER_OUTPUT_INVERTED : timerHardware->output);
            motors[motorIndex].enabled = true;
            continue;
        }
#endif

        IOInit(motors[motorIndex].io, OWNER_MOTOR, RESOURCE_INDEX(motorIndex));
#if defined(USE_HAL_DRIVER)
        IOConfigGPIOAF(motors[motorIndex].io, IOCFG_AF_PP, timerHardware->alternateFunction);
#else
        IOConfigGPIO(motors[motorIndex].io, IOCFG_AF_PP);
#endif

        if (useUnsyncedPwm) {
            const uint32_t hz = timerMhzCounter * 1000000;
            pwmOutConfig(&motors[motorIndex], timerHardware, timerMhzCounter, hz / motorConfig->motorPwmRate, idlePulse, motorConfig->motorPwmInversion);
        } else {
            pwmOutConfig(&motors[motorIndex], timerHardware, timerMhzCounter, 0xFFFF, 0, motorConfig->motorPwmInversion);
        }

        bool timerAlreadyUsed = false;
        for (int i = 0; i < motorIndex; i++) {
            if (motors[i].tim == motors[motorIndex].tim) {
                timerAlreadyUsed = true;
                break;
            }
        }
        motors[motorIndex].forceOverflow = !timerAlreadyUsed;
        motors[motorIndex].enabled = true;
    }

    pwmMotorsEnabled = true;
}

pwmOutputPort_t *pwmGetMotors(void)
{
    return motors;
}

#ifdef USE_DSHOT
uint32_t getDshotHz(motorPwmProtocolTypes_e pwmProtocolType)
{
    switch (pwmProtocolType) {
        case(PWM_TYPE_DSHOT1200):
            return MOTOR_DSHOT1200_MHZ * 1000000;
        case(PWM_TYPE_DSHOT600):
            return MOTOR_DSHOT600_MHZ * 1000000;
        case(PWM_TYPE_DSHOT300):
            return MOTOR_DSHOT300_MHZ * 1000000;
        default:
        case(PWM_TYPE_DSHOT150):
            return MOTOR_DSHOT150_MHZ * 1000000;
    }
}

void pwmWriteDshotCommand(uint8_t index, uint8_t command)
{
    if (command <= DSHOT_MAX_COMMAND) {
        motorDmaOutput_t *const motor = getMotorDmaOutput(index);

        unsigned repeats;
        if ((command >= 7 && command <= 10) || command == 12) {
            repeats = 10;
        } else {
            repeats = 1;
        }
        for (; repeats; repeats--) {
            motor->requestTelemetry = true;
            pwmWritePtr(index, command);
            pwmCompleteMotorUpdate(0);

            delay(1);
        }
    }
}
#endif

#ifdef USE_SERVOS
void pwmWriteServo(uint8_t index, uint16_t value)
{
    if (index < MAX_SUPPORTED_SERVOS && servos[index].ccr) {
        *servos[index].ccr = value;
    }
}

void servoDevInit(const servoDevConfig_t *servoConfig)
{
    for (uint8_t servoIndex = 0; servoIndex < MAX_SUPPORTED_SERVOS; servoIndex++) {
        const ioTag_t tag = servoConfig->ioTags[servoIndex];

        if (!tag) {
            break;
        }

        servos[servoIndex].io = IOGetByTag(tag);

        IOInit(servos[servoIndex].io, OWNER_SERVO, RESOURCE_INDEX(servoIndex));

        const timerHardware_t *timer = timerGetByTag(tag, TIM_USE_ANY);
#if defined(USE_HAL_DRIVER)
        IOConfigGPIOAF(servos[servoIndex].io, IOCFG_AF_PP, timer->alternateFunction);
#else
        IOConfigGPIO(servos[servoIndex].io, IOCFG_AF_PP);
#endif

        if (timer == NULL) {
            /* flag failure and disable ability to arm */
            break;
        }

        pwmOutConfig(&servos[servoIndex], timer, PWM_TIMER_MHZ, 1000000 / servoConfig->servoPwmRate, servoConfig->servoCenterPulse, 0);
        servos[servoIndex].enabled = true;
    }
}

#endif

#ifdef BEEPER
void pwmWriteBeeper(bool onoffBeep)
{
        if(!beeperPwm.io)
            return;
        if(onoffBeep == true) {
            *beeperPwm.ccr = (1000000/freqBeep)/2;
            beeperPwm.enabled = true;
        } else {
            *beeperPwm.ccr = 0;
            beeperPwm.enabled = false;
        }
}

void pwmToggleBeeper(void)
{
        pwmWriteBeeper(!beeperPwm.enabled);
}

void beeperPwmInit(IO_t io, uint16_t frequency)
{
        const ioTag_t tag=IO_TAG(BEEPER);
        beeperPwm.io = io;
        const timerHardware_t *timer = timerGetByTag(tag, TIM_USE_BEEPER);
        if (beeperPwm.io && timer) {
            IOInit(beeperPwm.io, OWNER_BEEPER, RESOURCE_INDEX(0));
#if defined(USE_HAL_DRIVER)
            IOConfigGPIOAF(beeperPwm.io, IOCFG_AF_PP, timer->alternateFunction);
#else
            IOConfigGPIO(beeperPwm.io, IOCFG_AF_PP);
#endif
            freqBeep = frequency;
            pwmOutConfig(&beeperPwm, timer, PWM_TIMER_MHZ, 1000000/freqBeep, (1000000/freqBeep)/2,0);
        }
        *beeperPwm.ccr = 0;
        beeperPwm.enabled = false;
}
#endif
