#include "board.h"

// Driver for STM32F103CB onboard ADC
// VBAT is connected to PA4 (ADC1_IN4) with 10k:1k divider
// rev.5 hardware has PA5 (ADC1_IN5) on breakout pad on bottom of board
// Additional channel can be stolen from RC_CH2 (PA1, ADC1_IN1) or 
// RC_CH8 (PB1, ADC1_IN9) by using set power_adc_channel=1|9

typedef struct adc_config_t {
    uint8_t adcChannel;         // ADC1_INxx channel number
    uint8_t dmaIndex;           // index into DMA buffer in case of sparse channels
} adc_config_t;

static adc_config_t adcConfig[ADC_CHANNEL_MAX];
static volatile uint16_t adcValues[ADC_CHANNEL_MAX];

void adcInit(drv_adc_config_t *init)
{
    ADC_InitTypeDef adc;
    DMA_InitTypeDef dma;
    int numChannels = 1, i, rank = 1;

    // configure always-present battery index (ADC4)
    adcConfig[ADC_BATTERY].adcChannel = ADC_Channel_10;
    adcConfig[ADC_BATTERY].dmaIndex = numChannels - 1;

    // optional ADC5 input on rev.5 hardware
    if (hw_revision >= NAZE32_REV5) {
        numChannels++;
        adcConfig[ADC_EXTERNAL_PAD].adcChannel = ADC_Channel_5;
        adcConfig[ADC_EXTERNAL_PAD].dmaIndex = numChannels - 1;
    }
    // another channel can be stolen from PWM for current measurement or other things
    if (init->powerAdcChannel > 0) {
        numChannels++;
        adcConfig[ADC_EXTERNAL_CURRENT].adcChannel = init->powerAdcChannel;
        adcConfig[ADC_EXTERNAL_CURRENT].dmaIndex = numChannels - 1;
    }

    if (init->rssiAdcChannel > 0) {
        numChannels++;
        adcConfig[ADC_RSSI].adcChannel = init->rssiAdcChannel;
        adcConfig[ADC_RSSI].dmaIndex = numChannels - 1;
    }

    // ADC driver assumes all the GPIO was already placed in 'AIN' mode
    DMA_DeInit(DMA1_Channel1);
    dma.DMA_PeripheralBaseAddr = (uint32_t)&ADC1->DR;
    dma.DMA_MemoryBaseAddr = (uint32_t)adcValues;
    dma.DMA_DIR = DMA_DIR_PeripheralSRC;
    dma.DMA_BufferSize = numChannels;
    dma.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
    dma.DMA_MemoryInc = numChannels > 1 ? DMA_MemoryInc_Enable : DMA_MemoryInc_Disable;
    dma.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord;
    dma.DMA_MemoryDataSize = DMA_MemoryDataSize_HalfWord;
    dma.DMA_Mode = DMA_Mode_Circular;
    dma.DMA_Priority = DMA_Priority_High;
    dma.DMA_M2M = DMA_M2M_Disable;
    DMA_Init(DMA1_Channel1, &dma);
    DMA_Cmd(DMA1_Channel1, ENABLE);

    adc.ADC_Mode = ADC_Mode_Independent;
    adc.ADC_ScanConvMode = numChannels > 1 ? ENABLE : DISABLE;
    adc.ADC_ContinuousConvMode = ENABLE;
    adc.ADC_ExternalTrigConv = ADC_ExternalTrigConv_None;
    adc.ADC_DataAlign = ADC_DataAlign_Right;
    adc.ADC_NbrOfChannel = numChannels;
    ADC_Init(ADC1, &adc);

    // Configure ADC channels. Skip if channel is zero, means can't use PA0, but OK for this situation.
    for (i = 0; i < ADC_CHANNEL_MAX; i++)
        if (adcConfig[i].adcChannel >= 0)
            ADC_RegularChannelConfig(ADC1, adcConfig[i].adcChannel, rank++, ADC_SampleTime_239Cycles5);
    ADC_DMACmd(ADC1, ENABLE);

    ADC_Cmd(ADC1, ENABLE);

    // Calibrate ADC
    ADC_ResetCalibration(ADC1);
    while(ADC_GetResetCalibrationStatus(ADC1));
    ADC_StartCalibration(ADC1);
    while(ADC_GetCalibrationStatus(ADC1));

    // Fire off ADC
    ADC_SoftwareStartConvCmd(ADC1, ENABLE);
}

uint16_t adcGetChannel(uint8_t channel)
{
    return adcValues[adcConfig[channel].dmaIndex];
}
