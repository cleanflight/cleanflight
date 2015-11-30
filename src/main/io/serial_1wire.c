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
 *
 * Ported from https://github.com/4712/BLHeliSuite/blob/master/Interfaces/Arduino1Wire/Source/Arduino1Wire_C/Arduino1Wire.c
 *  by Nathan Tsoi <nathan@vertile.com>
 * Several updates by 4712 in order to optimize interaction with BLHeliSuite
 */

#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "platform.h"

#ifdef USE_SERIAL_1WIRE
#include "drivers/gpio.h"
#include "drivers/light_led.h"
#include "drivers/system.h"
#include "io/serial_1wire.h"
#include "io/beeper.h"
#include "drivers/pwm_mapping.h"
#include "flight/mixer.h"

uint8_t escCount; // we detect the hardware dynamically

static escHardware_t escHardware[MAX_PWM_MOTORS];

static void gpio_set_mode(GPIO_TypeDef* gpio, uint16_t pin, GPIO_Mode mode) {
    gpio_config_t cfg;
    cfg.pin = pin;
    cfg.mode = mode;
    cfg.speed = Speed_10MHz;
    gpioInit(gpio, &cfg);
}

static uint32_t GetPinPos(uint32_t pin) {
    uint32_t pinPos;
    for (pinPos = 0; pinPos < 16; pinPos++) {
        uint32_t pinMask = (0x1 << pinPos);
        if (pin & pinMask) {
        // pos found
        return pinPos;
        }
    }
    return 0;
}

void usb1WireInitialize()
{
    escCount = 0;
    memset(&escHardware,0,sizeof(escHardware));
    pwmOutputConfiguration_t *pwmOutputConfiguration = pwmGetOutputConfiguration();
    for (volatile uint8_t i = 0; i < pwmOutputConfiguration->outputCount; i++) {
        if ((pwmOutputConfiguration->portConfigurations[i].flags & PWM_PF_MOTOR) == PWM_PF_MOTOR) {
            if(motor[pwmOutputConfiguration->portConfigurations[i].index] >0 ) {
                escHardware[escCount].gpio = pwmOutputConfiguration->portConfigurations[i].timerHardware->gpio;
                escHardware[escCount].pin = pwmOutputConfiguration->portConfigurations[i].timerHardware->pin;
                escHardware[escCount].pinpos = GetPinPos(escHardware[escCount].pin);
                gpio_set_mode(escHardware[escCount].gpio,escHardware[escCount].pin, Mode_IPU); //GPIO_Mode_IPU
                escCount++;
            }
        }
    }
}

#ifdef STM32F10X
static volatile uint32_t in_cr_mask, out_cr_mask;

static __IO uint32_t *cr;
static void gpio_prep_vars(uint32_t escIndex)
{
     GPIO_TypeDef *gpio = escHardware[escIndex].gpio;
     uint32_t pinpos = escHardware[escIndex].pinpos;
     // mask out extra bits from pinmode, leaving just CNF+MODE
     uint32_t inmode = Mode_IPU & 0x0F;
     uint32_t outmode = (Mode_Out_PP & 0x0F) | Speed_10MHz;
     // reference CRL or CRH, depending whether pin number is 0..7 or 8..15
     cr = &gpio->CRL + (pinpos / 8);
     // offset to CNF and MODE portions of CRx register
     uint32_t shift = (pinpos % 8) * 4;
     // Read out current CRx value
     in_cr_mask = out_cr_mask = *cr;
     // Mask out 4 bits
     in_cr_mask &= ~(0xF << shift);
     out_cr_mask &= ~(0xF << shift);
     // save current pinmode
     in_cr_mask |= inmode << shift;
     out_cr_mask |= outmode << shift;
}

static void gpioSetOne(uint32_t escIndex, GPIO_Mode mode) {
    // reference CRL or CRH, depending whether pin number is 0..7 or 8..15
    if (mode == Mode_IPU) {
        *cr = in_cr_mask;
        escHardware[escIndex].gpio->ODR |= escHardware[escIndex].pin;
    }
    else {
        *cr = out_cr_mask;
    }
}
#endif

#define ESC_HI(escIndex)       ((escHardware[escIndex].gpio->IDR & escHardware[escIndex].pin) != (uint32_t)Bit_RESET)
#define RX_HI                  ((S1W_RX_GPIO->IDR & S1W_RX_PIN) != (uint32_t)Bit_RESET)
#define ESC_SET_HI(escIndex)   escHardware[escIndex].gpio->BSRR = escHardware[escIndex].pin
#define ESC_SET_LO(escIndex)   escHardware[escIndex].gpio->BRR = escHardware[escIndex].pin
#define TX_SET_HIGH            S1W_TX_GPIO->BSRR = S1W_TX_PIN
#define TX_SET_LO              S1W_TX_GPIO->BRR = S1W_TX_PIN

#ifdef STM32F303xC
#define ESC_INPUT(escIndex)    escHardware[escIndex].gpio->MODER &= ~(GPIO_MODER_MODER0 << (escHardware[escIndex].pinpos * 2))
#define ESC_OUTPUT(escIndex)   escHardware[escIndex].gpio->MODER |= GPIO_Mode_OUT << (escHardware[escIndex].pinpos * 2)
#endif

#ifdef STM32F10X
#define ESC_INPUT(escIndex)    gpioSetOne(escIndex, Mode_IPU)
#define ESC_OUTPUT(escIndex)   gpioSetOne(escIndex, Mode_Out_PP)
#endif

#define RX_LED_OFF LED0_OFF
#define RX_LED_ON LED0_ON
#define TX_LED_OFF LED1_OFF
#define TX_LED_ON LED1_ON

// This method translates 2 wires (a tx and rx line) to 1 wire, by letting the
// RX line control when data should be read or written from the single line
void usb1WirePassthrough(uint8_t escIndex)
{
#ifdef BEEPER
    // fix for buzzer often starts beeping continuously when the ESCs are read
    // switch beeper silent here
    beeperSilence();
#endif

    // disable all interrupts
    __disable_irq();

    // prepare MSP UART port for direct pin access
    // reset all the pins
    GPIO_ResetBits(S1W_RX_GPIO, S1W_RX_PIN);
    GPIO_ResetBits(S1W_TX_GPIO, S1W_TX_PIN);
    // configure gpio
    gpio_set_mode(S1W_RX_GPIO, S1W_RX_PIN, Mode_IPU);
    gpio_set_mode(S1W_TX_GPIO, S1W_TX_PIN, Mode_Out_PP);

#ifdef STM32F10X
    // reset our gpio register pointers and bitmask values
    gpio_prep_vars(escIndex);
#endif

    ESC_OUTPUT(escIndex);
    ESC_SET_HI(escIndex);
    TX_SET_HIGH;
    // Wait for programmer to go from 1 -> 0 indicating incoming data
    while(RX_HI);

    while(1) {
        // A new iteration on this loop starts when we have data from the programmer (read_programmer goes low)
        // Setup escIndex pin to send data, pullup is the default
        ESC_OUTPUT(escIndex);
        // Write the first bit
        ESC_SET_LO(escIndex);
        // Echo on the programmer tx line
        TX_SET_LO;
        //set LEDs
        RX_LED_OFF;
        TX_LED_ON;
        // Wait for programmer to go 0 -> 1
        uint32_t ct=3333;
        while(!RX_HI) {
            if (ct > 0) ct--; // count down until 0;
            // check for low time ->ct=3333 ~600uS //byte LO time for 0 @ 19200 baud -> 9*52 uS => 468.75uS
            // App must send a 0 at 9600 baud (or lower) which has a LO time of at 104uS (or more) > 0 =  937.5uS LO
            // BLHeliSuite will use 4800 baud
        }
        // Programmer is high, end of bit
        // At first Echo to the esc, which helps to charge input capacities at ESC
        ESC_SET_HI(escIndex);
        // Listen to the escIndex, input mode, pullup resistor is on
        gpio_set_mode(escHardware[escIndex].gpio, escHardware[escIndex].pin, Mode_IPU);
        TX_LED_OFF;
        if (ct==0) break; //we reached zero
        // Listen to the escIndex while there is no data from the programmer
        while (RX_HI) {
            if (ESC_HI(escIndex)) {
                TX_SET_HIGH;
                RX_LED_OFF;
            }
            else {
                TX_SET_LO;
                RX_LED_ON;
            }
        }
    }

    // we get here in case ct reached zero
    TX_SET_HIGH;
    RX_LED_OFF;
    // Enable all irq (for Hardware UART)
    __enable_irq();
    return;
}
#endif
