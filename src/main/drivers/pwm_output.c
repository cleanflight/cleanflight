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

#include <stdlib.h>

#include <platform.h>

//#include "gpio.h"
//#include "timer.h"

#include "pwm_mapping.h"

#include "pwm_output.h"

#include "common/maths.h"

#include <includes.h>

#define MAX_PWM_OUTPUT_PORTS MAX(MAX_MOTORS, MAX_SERVOS)

/*
#define BRUSHED_MOTORS_PWM_RATE 16000
#define BRUSHLESS_MOTORS_PWM_RATE 400
*/


typedef void (*pwmWriteFuncPtr)(uint8_t index, uint16_t value);  // function pointer used to write motors

typedef struct {
//    volatile timCCR_t *ccr;
//    TIM_TypeDef *tim;                   //Contains register addrsses for controlling the timer
    mraa_pwm_context pwm;
    uint16_t period;
    uint16_t value;
    pwmWriteFuncPtr pwmWritePtr;
} pwmOutputPort_t;

static pwmOutputPort_t pwmOutputPorts[MAX_PWM_OUTPUT_PORTS];

static pwmOutputPort_t *motors[MAX_PWM_MOTORS];

#ifdef USE_SERVOS
static pwmOutputPort_t *servos[MAX_PWM_SERVOS];
#endif

static uint8_t allocatedOutputPortCount = 0;

static bool pwmMotorsEnabled = true;
/*static void pwmOCConfig(TIM_TypeDef *tim, uint8_t channel, uint16_t value)          //initialize the timer for generating pwm signal
{
    //Value field contains the value that is to be stored in the CCR
    TIM_OCInitTypeDef  TIM_OCInitStructure;         //Contains info about the timer

    TIM_OCStructInit(&TIM_OCInitStructure);
    TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM2;
    TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
    TIM_OCInitStructure.TIM_OutputNState = TIM_OutputNState_Disable;
    TIM_OCInitStructure.TIM_Pulse = value;
    TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_Low;
    TIM_OCInitStructure.TIM_OCIdleState = TIM_OCIdleState_Set;

    switch (channel) {                                          //Initialize timer channel based on the channel number passed to the function
        case TIM_Channel_1:
            TIM_OC1Init(tim, &TIM_OCInitStructure);
            TIM_OC1PreloadConfig(tim, TIM_OCPreload_Enable);
            break;
        case TIM_Channel_2:
            TIM_OC2Init(tim, &TIM_OCInitStructure);
            TIM_OC2PreloadConfig(tim, TIM_OCPreload_Enable);
            break;
        case TIM_Channel_3:
            TIM_OC3Init(tim, &TIM_OCInitStructure);
            TIM_OC3PreloadConfig(tim, TIM_OCPreload_Enable);
            break;
        case TIM_Channel_4:
            TIM_OC4Init(tim, &TIM_OCInitStructure);
            TIM_OC4PreloadConfig(tim, TIM_OCPreload_Enable);
            break;
    }
}
*/
/*static void pwmGPIOConfig(GPIO_TypeDef *gpio, uint32_t pin, GPIO_Mode mode)
{
    gpio_config_t cfg;

    cfg.pin = pin;
    cfg.mode = PWM;
    cfg.speed = Speed_2MHz;
    gpioInit(gpio, &cfg);         //Change to something else
}*/

//static pwmOutputPort_t *pwmOutConfig(const timerHardware_t *timerHardware, uint8_t mhz, uint16_t period, uint16_t value)

//for brushless motors, pwm clock frequency is 1MHz
//So period and pulse width for edison calculation will result in divison by 1Mhz giving a time of 1MHz
//pwmOutConfig(const timerHardware_t *timerHardware, uint8_t mhz, uint16_t period, uint16_t value)
static pwmOutputPort_t *pwmOutConfig(uint32_t pin, uint16_t period, uint16_t value)         //period - use mraa_pwm_period_us
                                                                                            //value - use mraa_pwm_pulsewidth_us
{                                                                                           //mhz determines clock frequency and adjusts timer clock prescaler based on that
    pwmOutputPort_t *p = &pwmOutputPorts[allocatedOutputPortCount++];

    
    p->period = period;
    p->value = period-value;
    

    //modify pwm context in pwmOutputPort_t and disable pwm for now
    p->pwm = mraa_pwm_init(pin);
    
    mraa_pwm_period_us(p->pwm, p->period);

    //pulse width on stm32 is given by difference between ARR and CCR.
    mraa_pwm_pulsewidth_us(p->pwm,p->value);                                    
    
    mraa_pwm_enable(p->pwm,0);                        

    /*configTimeBase(timerHardware->tim, period, mhz);  
    //Configure timer clock and ARR
    //mhz is for the timer clock frequency
    //CCR - start of pulse. ARR - end of pulse
    //ARR is given by period
    //CCR is given by value
    */

    return p;
}

static void pwmWriteBrushed(uint8_t index, uint16_t value)
{
    //*motors[index]->ccr = (value - 1000) * motors[index]->period / 1000;
}

static void pwmWriteStandard(uint8_t index, uint16_t value)
{
    motors[index]->value = (motors[index]->period) - value;
}

void pwmWriteMotor(uint8_t index, uint16_t value)
{
    if (motors[index] && index < MAX_MOTORS && pwmMotorsEnabled)
        motors[index]->pwmWritePtr(index, value);
}

void pwmShutdownPulsesForAllMotors(uint8_t motorCount)
{
    uint8_t index;

    for(index = 0; index < motorCount; index++){
        // Set the compare register to 0, which stops the output pulsing if the timer overflows
        motors[index]->value = 0;
    }
}

void pwmDisableMotors(void)
{
    pwmMotorsEnabled = false;
}

void pwmEnableMotors(void)
{
    pwmMotorsEnabled = true;
}

/*
void pwmCompleteOneshotMotorUpdate(uint8_t motorCount)
{
    uint8_t index;
    TIM_TypeDef *lastTimerPtr = NULL;

    for(index = 0; index < motorCount; index++){

        // Force the timer to overflow if it's the first motor to output, or if we change timers
        if(motors[index]->tim != lastTimerPtr){
            lastTimerPtr = motors[index]->tim;

            timerForceOverflow(motors[index]->tim);
        }

        // Set the compare register to 0, which stops the output pulsing if the timer overflows before the main loop completes again.
        // This compare register will be set to the output value on the next main loop.
        *motors[index]->ccr = 0;
    }
}*/

bool isMotorBrushed(uint16_t motorPwmRate)
{
    return (motorPwmRate > 500);
}

//void pwmBrushedMotorConfig(const timerHardware_t *timerHardware, uint8_t motorIndex, uint16_t motorPwmRate, uint16_t idlePulse)
void pwmBrushedMotorConfig(uint32_t pin, uint8_t motorIndex, uint16_t motorPwmRate, uint16_t idlePulse)
{
    uint32_t hz = PWM_BRUSHED_TIMER_MHZ * 1000000;
    motors[motorIndex] = pwmOutConfig(pin, hz / motorPwmRate, idlePulse);
    motors[motorIndex]->pwmWritePtr = pwmWriteBrushed;
}


//for motorPwmRate refer top of document
//void pwmBrushlessMotorConfig(const timerHardware_t *timerHardware, uint8_t motorIndex, uint16_t motorPwmRate, uint16_t idlePulse)
void pwmBrushlessMotorConfig(uint32_t pin, uint8_t motorIndex, uint16_t motorPwmRate, uint16_t idlePulse)
{
    uint32_t hz = PWM_TIMER_MHZ * 1000000;
    motors[motorIndex] = pwmOutConfig(pin, hz / motorPwmRate, idlePulse);          //idlePulse signifies the value of timer at which the pulse starts
    motors[motorIndex]->pwmWritePtr = pwmWriteStandard;
}

//void pwmOneshotMotorConfig(const timerHardware_t *timerHardware, uint8_t motorIndex)
void pwmOneshotMotorConfig(uint32_t pin, uint8_t motorIndex)
{
    motors[motorIndex] = pwmOutConfig(pin, 0xFFFF, 0);
    motors[motorIndex]->pwmWritePtr = pwmWriteStandard;
}

#ifdef USE_SERVOS
void pwmServoConfig(const timerHardware_t *timerHardware, uint8_t servoIndex, uint16_t servoPwmRate, uint16_t servoCenterPulse)
{
    servos[servoIndex] = pwmOutConfig(timerHardware, PWM_TIMER_MHZ, 1000000 / servoPwmRate, servoCenterPulse);
}

void pwmWriteServo(uint8_t index, uint16_t value)
{
    if (servos[index] && index < MAX_SERVOS)
        *servos[index]->ccr = value;
}
#endif
