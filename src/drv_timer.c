/*
 * This file is part of baseflight
 * Licensed under GPL V3 or modified DCL - see https://github.com/multiwii/baseflight/blob/master/README.md
 */

#include "board.h"

/* FreeFlight/Naze32 timer layout
    TIM2_CH1    RC1             PWM1
    TIM2_CH2    RC2             PWM2
    TIM2_CH3    RC3/UA2_TX      PWM3
    TIM2_CH4    RC4/UA2_RX      PWM4
    TIM3_CH1    RC5             PWM5
    TIM3_CH2    RC6             PWM6
    TIM3_CH3    RC7             PWM7
    TIM3_CH4    RC8             PWM8
    TIM1_CH1    PWM1            PWM9
    TIM1_CH4    PWM2            PWM10
    TIM4_CH1    PWM3            PWM11
    TIM4_CH2    PWM4            PWM12
    TIM4_CH3    PWM5            PWM13
    TIM4_CH4    PWM6            PWM14

    RX1  TIM2_CH1 PA0 [also PPM] [also used for throttle calibration]
    RX2  TIM2_CH2 PA1
    RX3  TIM2_CH3 PA2 [also UART2_TX]
    RX4  TIM2_CH4 PA3 [also UART2_RX]
    RX5  TIM3_CH1 PA6 [also ADC_IN6]
    RX6  TIM3_CH2 PA7 [also ADC_IN7]
    RX7  TIM3_CH3 PB0 [also ADC_IN8]
    RX8  TIM3_CH4 PB1 [also ADC_IN9]

    Outputs
    PWM1 TIM1_CH1 PA8
    PWM2 TIM1_CH4 PA11
    PWM3 TIM4_CH1 PB6? [also I2C1_SCL]
    PWM4 TIM4_CH2 PB7 [also I2C1_SDA]
    PWM5 TIM4_CH3 PB8
    PWM6 TIM4_CH4 PB9

    Groups that allow running different period (ex 50Hz servos + 400Hz throttle + etc):
    TIM2 4 channels
    TIM3 4 channels
    TIM1 2 channels
    TIM4 4 channels
*/

const timerHardware_t timerHardware[] = {
    { TIM2, GPIOA, Pin_0, TIM_Channel_1, TIM2_IRQn, 0, },          // PWM1
    { TIM2, GPIOA, Pin_1, TIM_Channel_2, TIM2_IRQn, 0, },          // PWM2
    { TIM2, GPIOA, Pin_2, TIM_Channel_3, TIM2_IRQn, 0, },          // PWM3
    { TIM2, GPIOA, Pin_3, TIM_Channel_4, TIM2_IRQn, 0, },          // PWM4
    { TIM3, GPIOA, Pin_6, TIM_Channel_1, TIM3_IRQn, 0, },          // PWM5
    { TIM3, GPIOA, Pin_7, TIM_Channel_2, TIM3_IRQn, 0, },          // PWM6
    { TIM3, GPIOB, Pin_0, TIM_Channel_3, TIM3_IRQn, 0, },          // PWM7
    { TIM3, GPIOB, Pin_1, TIM_Channel_4, TIM3_IRQn, 0, },          // PWM8
    { TIM1, GPIOA, Pin_8, TIM_Channel_1, TIM1_CC_IRQn, 1, },       // PWM9
    { TIM1, GPIOA, Pin_11, TIM_Channel_4, TIM1_CC_IRQn, 1, },      // PWM10
    { TIM4, GPIOB, Pin_6, TIM_Channel_1, TIM4_IRQn, 0, },          // PWM11
    { TIM4, GPIOB, Pin_7, TIM_Channel_2, TIM4_IRQn, 0, },          // PWM12
    { TIM4, GPIOB, Pin_8, TIM_Channel_3, TIM4_IRQn, 0, },          // PWM13
    { TIM4, GPIOB, Pin_9, TIM_Channel_4, TIM4_IRQn, 0, },          // PWM14
};

enum {
    TIM1_IDX = 0,
    TIM2_IDX,
    TIM3_IDX,
    TIM4_IDX,
    MAX_TIMERS
};

#define CC_CHANNELS_PER_TIMER 4 // TIM_Channel_1..4

static const TIM_TypeDef * const timers[MAX_TIMERS] = {
    [TIM1_IDX] = TIM1, [TIM2_IDX] = TIM2, [TIM3_IDX] = TIM3, [TIM4_IDX] = TIM4
};

typedef struct channelConfig_s {
    uint16_t channel;
    uint16_t interruptBit;
    uint16_t (*TIM_GetCaptureFn)(TIM_TypeDef* TIMx);
} channelConfig_t;

static const channelConfig_t channels[CC_CHANNELS_PER_TIMER] = {
    { TIM_Channel_1, TIM_IT_CC1, TIM_GetCapture1 },
    { TIM_Channel_2, TIM_IT_CC2, TIM_GetCapture2 },
    { TIM_Channel_3, TIM_IT_CC3, TIM_GetCapture3 },
    { TIM_Channel_4, TIM_IT_CC4, TIM_GetCapture4 }
};

typedef struct timerConfig_s {
    TIM_TypeDef *tim;
    uint8_t channel;
    timerCCCallbackPtr *callback;
    uint8_t reference;
} timerConfig_t;

timerConfig_t timerConfigs[MAX_TIMERS][CC_CHANNELS_PER_TIMER];

static int lookupTimerIndex(const TIM_TypeDef *tim)
{
    int timerIndex;
    for (timerIndex=0; timerIndex < MAX_TIMERS; timerIndex++ ) {
        if (timers[timerIndex] == tim)
            break;
    }
    return timerIndex;
}

static int lookupChannelIndex(const int channel)
{
    int channelIndex;
    for (channelIndex=0; channelIndex < CC_CHANNELS_PER_TIMER; channelIndex++ ) {
        if (channels[channelIndex].channel == channel)
            break;
    }
    return channelIndex;
}

void configureTimerChannelCallback(TIM_TypeDef *tim, uint8_t channel, uint8_t reference, timerCCCallbackPtr *callback)
{
    assert_param(IS_TIM_CHANNEL(channel));

    int timerIndex = lookupTimerIndex(tim);
    int channelIndex = lookupChannelIndex(channel);

    if (timerIndex >= MAX_TIMERS || channelIndex >= CC_CHANNELS_PER_TIMER) {
        return;
    }

    timerConfigs[timerIndex][channelIndex].callback = callback;
    timerConfigs[timerIndex][channelIndex].channel = channel;
    timerConfigs[timerIndex][channelIndex].reference = reference;
}

void configureTimerInputCaptureCompareChannel(TIM_TypeDef *tim, const uint8_t channel)
{
    switch (channel) {
        case TIM_Channel_1:
            TIM_ITConfig(tim, TIM_IT_CC1, ENABLE);
            break;
        case TIM_Channel_2:
            TIM_ITConfig(tim, TIM_IT_CC2, ENABLE);
            break;
        case TIM_Channel_3:
            TIM_ITConfig(tim, TIM_IT_CC3, ENABLE);
            break;
        case TIM_Channel_4:
            TIM_ITConfig(tim, TIM_IT_CC4, ENABLE);
            break;
    }
}

void configureTimerCaptureCompareInterrupt(const timerHardware_t *timerHardwarePtr, uint8_t reference, timerCCCallbackPtr *callback)
{
    configureTimerChannelCallback(timerHardwarePtr->tim, timerHardwarePtr->channel, reference, callback);
    configureTimerInputCaptureCompareChannel(timerHardwarePtr->tim, timerHardwarePtr->channel);
}

void timerNVICConfigure(uint8_t irq)
{
    NVIC_InitTypeDef NVIC_InitStructure;

    NVIC_InitStructure.NVIC_IRQChannel = irq;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 1;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);
}

void configTimeBase(TIM_TypeDef *tim, uint16_t period, uint8_t mhz)
{
    TIM_TimeBaseInitTypeDef TIM_TimeBaseStructure;

    TIM_TimeBaseStructInit(&TIM_TimeBaseStructure);
    TIM_TimeBaseStructure.TIM_Period = period - 1; // AKA TIMx_ARR

    // "The counter clock frequency (CK_CNT) is equal to f CK_PSC / (PSC[15:0] + 1)." - STM32F10x Reference Manual 14.4.11
    // Thus for 1Mhz: 72000000 / 1000000 = 72, 72 - 1 = 71 = TIM_Prescaler
    TIM_TimeBaseStructure.TIM_Prescaler = (SystemCoreClock / ((uint32_t)mhz * 1000000)) - 1;


    TIM_TimeBaseStructure.TIM_ClockDivision = 0;
    TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
    TIM_TimeBaseInit(tim, &TIM_TimeBaseStructure);
}

void timerConfigure(const timerHardware_t *timerHardwarePtr, uint16_t period, uint8_t mhz)
{
    configTimeBase(timerHardwarePtr->tim, period, mhz);
    TIM_Cmd(timerHardwarePtr->tim, ENABLE);
    timerNVICConfigure(timerHardwarePtr->irq);
}


static timerConfig_t *findTimerConfig(unsigned int timerIndex, unsigned int channelIndex)
{
    assert_param(timerIndex < MAX_TIMERS);
    assert_param(channelIndex < CC_CHANNELS_PER_TIMER);

    return &(timerConfigs[timerIndex][channelIndex]);
}

static void timCCxHandler(TIM_TypeDef * const tim, unsigned int timerIndex)
{
    unsigned int channelIndex;

    for (channelIndex = 0; channelIndex < CC_CHANNELS_PER_TIMER; channelIndex++) {
        channelConfig_t const * const channel = &channels[channelIndex];

        if (TIM_GetITStatus(tim, channel->interruptBit) == SET) {
            TIM_ClearITPendingBit(tim, channel->interruptBit);

            uint16_t capture;
            capture = channel->TIM_GetCaptureFn(tim);

            timerConfig_t *timerConfig;
            timerConfig = findTimerConfig(timerIndex, channelIndex);
            if (timerConfig->callback) {
                timerConfig->callback(timerConfig->reference, capture);
            }
        }
    }
}

void TIM1_CC_IRQHandler(void)
{
    timCCxHandler(TIM1, TIM1_IDX);
}

void TIM2_IRQHandler(void)
{
    timCCxHandler(TIM2, TIM2_IDX);
}

void TIM3_IRQHandler(void)
{
    timCCxHandler(TIM3, TIM3_IDX);
}

void TIM4_IRQHandler(void)
{
    timCCxHandler(TIM4, TIM4_IDX);
}
