#pragma once

// simple pin-debug support
// define macros to use available pins to signal some event/state
// in normal build there is zero overhead (make sure this holds when making changes)
// select here which events(defines) are output to available pins, other places will be optimized out
// pindebug is not essential, only guarantie is that it will not break anything in production build
// usability is preffered to portability/corectness/...

#define DBP_TIMER                            DBG_PIN_1     // in timer interrupt
#define DBP_CALLBACK                         DBG_PIN_2     // in callback (pendSv) handler

#define DBP_SOFTSERIAL_RXPROCESS             DBG_PIN_3     // in softSerialRxProcess
#define DBP_SOFTSERIAL_RXWAIT_SYMBOL         DBG_PIN_4     // waiting for whole symbol to arrive
#define DBP_TIMERINPUT_EDGEDELAY             DBG_PIN_4     // waiting for whole symbol to arrive
#define DBP_TELEMETRY_SPORT_REPLYWAIT        DBG_NONE      // poll received, waiting before reply


#include <stdbool.h>
#include <stdint.h>
#include "build_config.h"

#ifdef PINDEBUG

#include "gpio.h"

// these pins are currently defined for AfroMini32 (reduced NAZE)
// change used pins to any available. It will be probably problem-dependent
// check code that uses pin for normal function, use pinDebugIsPinUsed() to skip pin inicialization and use

#define DBG_PIN_1 true, GPIOB, Pin_6             // PWM11
#define DBG_PIN_2 true, GPIOB, Pin_9             // PWM14
#define DBG_PIN_3 true, GPIOA, Pin_0             // PWM1 (RC_CH1)
#define DBG_PIN_4 true, GPIOA, Pin_8             // PWM9 (PWM1)

#define DBG_NONE false, 0, 0

static inline void pinDbgHi(bool enable, GPIO_TypeDef *gpio, uint16_t pin)
{
    if(enable) digitalHi(gpio, pin);
}

static inline void pinDbgLo(bool enable, GPIO_TypeDef *gpio, uint16_t pin)
{
    if(enable) digitalLo(gpio, pin);
}

static inline void pinDbgToggle(bool enable, GPIO_TypeDef *gpio, uint16_t pin)
{
    if(enable) digitalToggle(gpio, pin);
}

void pinDebugInit(void);
bool pinDebugIsPinUsed(GPIO_TypeDef* gpio, uint16_t pin);

#ifndef __UNIQL
# define __UNIQL_CONCAT2(x,y) x ## y
# define __UNIQL_CONCAT(x,y) __UNIQL_CONCAT2(x,y)
# define __UNIQL(x) __UNIQL_CONCAT(x,__LINE__)
#endif

// assert pin for duration of enclosing block (local variable scope)
// use only once per line
#define PIN_DBG_BLOCK(def)                                              \
    __extension__ void  __UNIQL(__pinDbgBlockEnd)(char *u __attribute__ ((unused))) {  pinDbgLo(def); } \
    char  __attribute__((__cleanup__(__UNIQL(__pinDbgBlockEnd))))       \
    __UNIQL(__pinDbgBlock);                                             \
    pinDbgHi(def)

#else
// dummy versions when pindebug is not enabled
#define pinDbgHi(...) do {} while(0)
#define pinDbgLo(...) do {} while(0)
#define pinDbgToggle(...) do {} while(0)
#define PIN_DBG_BLOCK(...) do {} while(0)

static inline void pinDebugInit(void) {}
static inline bool pinDebugIsPinUsed(GPIO_TypeDef* gpio, uint16_t pin) { UNUSED(gpio); UNUSED(pin); return false; }

#endif
