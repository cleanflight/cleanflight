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

#include <stdbool.h>
#include <stdint.h>

#include "drivers/io_types.h"
#include "rcc_types.h"

typedef uint16_t captureCompare_t;        // 16 bit on both 103 and 303, just register access must be 32bit sometimes (use timCCR_t)

#if defined(STM32F4)
typedef uint32_t timCCR_t;
typedef uint32_t timCCER_t;
typedef uint32_t timSR_t;
typedef uint32_t timCNT_t;
#elif defined(STM32F7)
typedef uint32_t timCCR_t;
typedef uint32_t timCCER_t;
typedef uint32_t timSR_t;
typedef uint32_t timCNT_t;
#elif defined(STM32F3)
typedef uint32_t timCCR_t;
typedef uint32_t timCCER_t;
typedef uint32_t timSR_t;
typedef uint32_t timCNT_t;
#elif defined(STM32F1)
typedef uint16_t timCCR_t;
typedef uint16_t timCCER_t;
typedef uint16_t timSR_t;
typedef uint16_t timCNT_t;
#elif defined(UNIT_TEST) || defined(SIMULATOR_BUILD)
typedef uint32_t timCCR_t;
typedef uint32_t timCCER_t;
typedef uint32_t timSR_t;
typedef uint32_t timCNT_t;
#else
#error "Unknown CPU defined"
#endif

typedef enum {
    TIM_USE_ANY           = 0x0,
    TIM_USE_NONE          = 0x0,
    TIM_USE_PPM           = 0x1,
    TIM_USE_PWM           = 0x2,
    TIM_USE_MOTOR         = 0x4,
    TIM_USE_SERVO         = 0x8,
    TIM_USE_LED           = 0x10,
    TIM_USE_TRANSPONDER   = 0x20,
    TIM_USE_BEEPER        = 0x40
} timerUsageFlag_e;

// use different types from capture and overflow - multiple overflow handlers are implemented as linked list
struct timerCCHandlerRec_s;
struct timerOvrHandlerRec_s;
typedef void timerCCHandlerCallback(struct timerCCHandlerRec_s* self, uint16_t capture);
typedef void timerOvrHandlerCallback(struct timerOvrHandlerRec_s* self, uint16_t capture);

typedef struct timerCCHandlerRec_s {
    timerCCHandlerCallback* fn;
} timerCCHandlerRec_t;

typedef struct timerOvrHandlerRec_s {
    timerOvrHandlerCallback* fn;
    struct timerOvrHandlerRec_s* next;
} timerOvrHandlerRec_t;

typedef struct timerDef_s {
    TIM_TypeDef *TIMx;
    rccPeriphTag_t rcc;
    uint8_t inputIrq;
} timerDef_t;

typedef struct timerHardware_s {
    TIM_TypeDef *tim;
    ioTag_t tag;
    uint8_t channel;
    timerUsageFlag_e usageFlags;
    uint8_t output;
#if defined(STM32F3) || defined(STM32F4) || defined(STM32F7)
    uint8_t alternateFunction;
#endif
#if defined(USE_DSHOT) || defined(LED_STRIP) || defined(TRANSPONDER)
#if defined(STM32F4) || defined(STM32F7)
    DMA_Stream_TypeDef *dmaRef;
    uint32_t dmaChannel;
#elif defined(STM32F3) || defined(STM32F1)
    DMA_Channel_TypeDef *dmaRef;
#endif
    uint8_t dmaIrqHandler;
#endif
} timerHardware_t;

typedef enum {
    TIMER_OUTPUT_NONE      = 0x00,
    TIMER_INPUT_ENABLED    = 0x01, /* TODO: remove this */
    TIMER_OUTPUT_ENABLED   = 0x01, /* TODO: remove this */
    TIMER_OUTPUT_STANDARD  = 0x01,
    TIMER_OUTPUT_INVERTED  = 0x02,
    TIMER_OUTPUT_N_CHANNEL = 0x04
} timerFlag_e;

#ifdef STM32F1
#if defined(STM32F10X_XL) || defined(STM32F10X_HD_VL)
#define HARDWARE_TIMER_DEFINITION_COUNT 14
#elif defined(STM32F10X_HD) || defined(STM32F10X_CL)
#define HARDWARE_TIMER_DEFINITION_COUNT 7
#else
#define HARDWARE_TIMER_DEFINITION_COUNT 4
#endif
#elif defined(STM32F3)
#define HARDWARE_TIMER_DEFINITION_COUNT 10
#elif defined(STM32F411xE)
#define HARDWARE_TIMER_DEFINITION_COUNT 10
#elif defined(STM32F4)
#define HARDWARE_TIMER_DEFINITION_COUNT 14
#elif defined(STM32F7)
#define HARDWARE_TIMER_DEFINITION_COUNT 14
#endif

extern const timerHardware_t timerHardware[];
extern const timerDef_t timerDefinitions[];

typedef enum {
    TYPE_FREE,
    TYPE_PWMINPUT,
    TYPE_PPMINPUT,
    TYPE_PWMOUTPUT_MOTOR,
    TYPE_PWMOUTPUT_FAST,
    TYPE_PWMOUTPUT_SERVO,
    TYPE_SOFTSERIAL_RX,
    TYPE_SOFTSERIAL_TX,
    TYPE_SOFTSERIAL_RXTX,        // bidirectional pin for softserial
    TYPE_SOFTSERIAL_AUXTIMER,    // timer channel is used for softserial. No IO function on pin
    TYPE_ADC,
    TYPE_SERIAL_RX,
    TYPE_SERIAL_TX,
    TYPE_SERIAL_RXTX,
    TYPE_TIMER
} channelType_t;

void timerConfigure(const timerHardware_t *timHw, uint16_t period, uint8_t mhz);  // This interface should be replaced.

void timerChConfigIC(const timerHardware_t *timHw, bool polarityRising, unsigned inputFilterSamples);
void timerChConfigICDual(const timerHardware_t* timHw, bool polarityRising, unsigned inputFilterSamples);
void timerChICPolarity(const timerHardware_t *timHw, bool polarityRising);
volatile timCCR_t* timerChCCR(const timerHardware_t* timHw);
volatile timCCR_t* timerChCCRLo(const timerHardware_t* timHw);
volatile timCCR_t* timerChCCRHi(const timerHardware_t* timHw);
void timerChConfigOC(const timerHardware_t* timHw, bool outEnable, bool stateHigh);
void timerChConfigGPIO(const timerHardware_t* timHw, ioConfig_t mode);

void timerChCCHandlerInit(timerCCHandlerRec_t *self, timerCCHandlerCallback *fn);
void timerChOvrHandlerInit(timerOvrHandlerRec_t *self, timerOvrHandlerCallback *fn);
void timerChConfigCallbacks(const timerHardware_t *channel, timerCCHandlerRec_t *edgeCallback, timerOvrHandlerRec_t *overflowCallback);
void timerChConfigCallbacksDual(const timerHardware_t *channel, timerCCHandlerRec_t *edgeCallbackLo, timerCCHandlerRec_t *edgeCallbackHi, timerOvrHandlerRec_t *overflowCallback);
void timerChITConfigDualLo(const timerHardware_t* timHw, FunctionalState newState);
void timerChITConfig(const timerHardware_t* timHw, FunctionalState newState);
void timerChClearCCFlag(const timerHardware_t* timHw);

void timerChInit(const timerHardware_t *timHw, channelType_t type, int irqPriority, uint8_t irq);

void timerInit(void);
void timerStart(void);
void timerForceOverflow(TIM_TypeDef *tim);

uint8_t timerClockDivisor(TIM_TypeDef *tim);

void configTimeBase(TIM_TypeDef *tim, uint16_t period, uint8_t mhz);  // TODO - just for migration

rccPeriphTag_t timerRCC(TIM_TypeDef *tim);
uint8_t timerInputIrq(TIM_TypeDef *tim);

const timerHardware_t *timerGetByTag(ioTag_t tag, timerUsageFlag_e flag);

#if defined(USE_HAL_DRIVER)
TIM_HandleTypeDef* timerFindTimerHandle(TIM_TypeDef *tim);
#else
void timerOCInit(TIM_TypeDef *tim, uint8_t channel, TIM_OCInitTypeDef *init);
void timerOCPreloadConfig(TIM_TypeDef *tim, uint8_t channel, uint16_t preload);
#endif

volatile timCCR_t *timerCCR(TIM_TypeDef *tim, uint8_t channel);
uint16_t timerDmaSource(uint8_t channel);

uint16_t timerGetPrescalerByDesiredMhz(TIM_TypeDef *tim, uint16_t mhz);
uint16_t timerGetPeriodByPrescaler(TIM_TypeDef *tim, uint16_t prescaler, uint32_t hertz);
