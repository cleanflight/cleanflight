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

#include "platform.h"
#include "system.h"
#include "gpio.h"

#include "sensor.h"
#include "accgyro.h"

#include "adc.h"
#include "adc_impl.h"
#include "io.h"
#include "rcc.h"
#include "dma.h"

#include "common/utils.h"

#ifndef ADC_INSTANCE
#define ADC_INSTANCE                ADC1
#endif

const adcDevice_t adcHardware[] = {
    { .ADCx = ADC1, .rccADC = RCC_AHB(ADC12), .DMAy_Channelx = DMA1_Channel1 },
#ifdef ADC24_DMA_REMAP
    { .ADCx = ADC2, .rccADC = RCC_AHB(ADC12), .DMAy_Channelx = DMA2_Channel3 },
#else
    { .ADCx = ADC2, .rccADC = RCC_AHB(ADC12), .DMAy_Channelx = DMA2_Channel1 },
#endif
    { .ADCx = ADC3, .rccADC = RCC_AHB(ADC34), .DMAy_Channelx = DMA2_Channel5 }
};

const adcTagMap_t adcTagMap[] = {
    { DEFIO_TAG_E__PA0,  ADC_Channel_1  }, // ADC1
    { DEFIO_TAG_E__PA1,  ADC_Channel_2  }, // ADC1
    { DEFIO_TAG_E__PA2,  ADC_Channel_3  }, // ADC1
    { DEFIO_TAG_E__PA3,  ADC_Channel_4  }, // ADC1
    { DEFIO_TAG_E__PA4,  ADC_Channel_1  }, // ADC2
    { DEFIO_TAG_E__PA5,  ADC_Channel_2  }, // ADC2
    { DEFIO_TAG_E__PA6,  ADC_Channel_3  }, // ADC2
    { DEFIO_TAG_E__PA7,  ADC_Channel_4  }, // ADC2
    { DEFIO_TAG_E__PB0,  ADC_Channel_12 }, // ADC3
    { DEFIO_TAG_E__PB1,  ADC_Channel_1  }, // ADC3
    { DEFIO_TAG_E__PB2,  ADC_Channel_12 }, // ADC2
    { DEFIO_TAG_E__PB12, ADC_Channel_3  }, // ADC4
    { DEFIO_TAG_E__PB13, ADC_Channel_5  }, // ADC3
    { DEFIO_TAG_E__PB14, ADC_Channel_4  }, // ADC4
    { DEFIO_TAG_E__PB15, ADC_Channel_5  }, // ADC4
    { DEFIO_TAG_E__PC0,  ADC_Channel_6  }, // ADC12
    { DEFIO_TAG_E__PC1,  ADC_Channel_7  }, // ADC12
    { DEFIO_TAG_E__PC2,  ADC_Channel_8  }, // ADC12
    { DEFIO_TAG_E__PC3,  ADC_Channel_9  }, // ADC12
    { DEFIO_TAG_E__PC4,  ADC_Channel_5  }, // ADC2
    { DEFIO_TAG_E__PC5,  ADC_Channel_11 }, // ADC2
    { DEFIO_TAG_E__PD8,  ADC_Channel_12 }, // ADC4
    { DEFIO_TAG_E__PD9,  ADC_Channel_13 }, // ADC4
    { DEFIO_TAG_E__PD10, ADC_Channel_7  }, // ADC34
    { DEFIO_TAG_E__PD11, ADC_Channel_8  }, // ADC34
    { DEFIO_TAG_E__PD12, ADC_Channel_9  }, // ADC34
    { DEFIO_TAG_E__PD13, ADC_Channel_10 }, // ADC34
    { DEFIO_TAG_E__PD14, ADC_Channel_11 }, // ADC34
    { DEFIO_TAG_E__PE7,  ADC_Channel_13 }, // ADC3
    { DEFIO_TAG_E__PE8,  ADC_Channel_6  }, // ADC34
    { DEFIO_TAG_E__PE9,  ADC_Channel_2  }, // ADC3
    { DEFIO_TAG_E__PE10, ADC_Channel_14 }, // ADC3
    { DEFIO_TAG_E__PE11, ADC_Channel_15 }, // ADC3
    { DEFIO_TAG_E__PE12, ADC_Channel_16 }, // ADC3
    { DEFIO_TAG_E__PE13, ADC_Channel_3  }, // ADC3
    { DEFIO_TAG_E__PE14, ADC_Channel_1  }, // ADC4
    { DEFIO_TAG_E__PE15, ADC_Channel_2  }, // ADC4
    { DEFIO_TAG_E__PF2,  ADC_Channel_10 }, // ADC12
    { DEFIO_TAG_E__PF4,  ADC_Channel_5  }, // ADC1
};

ADCDevice adcDeviceByInstance(ADC_TypeDef *instance)
{
    if (instance == ADC1)
        return ADCDEV_1;

    if (instance == ADC2)
        return ADCDEV_2;

    if (instance == ADC3)
        return ADCDEV_3;

    return ADCINVALID;
}

void adcInit(const adcConfig_t *config)
{
    ADC_InitTypeDef ADC_InitStructure;
    DMA_InitTypeDef DMA_InitStructure;

    uint8_t adcChannelCount = 0;

    memset(&adcOperatingConfig, 0, sizeof(adcOperatingConfig));

    if (config->vbat.enabled) {
        adcOperatingConfig[ADC_BATTERY].tag = config->vbat.ioTag;
    }

    if (config->rssi.enabled) {
        adcOperatingConfig[ADC_RSSI].tag = config->rssi.ioTag;  //RSSI_ADC_CHANNEL;
    }

    if (config->external1.enabled) {
        adcOperatingConfig[ADC_EXTERNAL1].tag = config->external1.ioTag; //EXTERNAL1_ADC_CHANNEL;
    }

    if (config->current.enabled) {
        adcOperatingConfig[ADC_CURRENT].tag = config->current.ioTag;  //CURRENT_METER_ADC_CHANNEL;
    }

    ADCDevice device = adcDeviceByInstance(ADC_INSTANCE);
    if (device == ADCINVALID)
        return;

#ifdef ADC24_DMA_REMAP
    SYSCFG_DMAChannelRemapConfig(SYSCFG_DMARemap_ADC2ADC4, ENABLE);
#endif
    adcDevice_t adc = adcHardware[device];

    bool adcActive = false;
    for (int i = 0; i < ADC_CHANNEL_COUNT; i++) {
        if (!adcOperatingConfig[i].tag)
            continue;

        adcActive = true;
        IOInit(IOGetByTag(adcOperatingConfig[i].tag), OWNER_ADC_BATT + i, 0);
        IOConfigGPIO(IOGetByTag(adcOperatingConfig[i].tag), IO_CONFIG(GPIO_Mode_AN, 0, GPIO_OType_OD, GPIO_PuPd_NOPULL));
        adcOperatingConfig[i].adcChannel = adcChannelByTag(adcOperatingConfig[i].tag);
        adcOperatingConfig[i].dmaIndex = adcChannelCount++;
        adcOperatingConfig[i].sampleTime = ADC_SampleTime_601Cycles5;
        adcOperatingConfig[i].enabled = true;
    }

    if (!adcActive) {
        return;
    }

    if ((device == ADCDEV_1) || (device == ADCDEV_2)) {
        // enable clock for ADC1+2
        RCC_ADCCLKConfig(RCC_ADC12PLLCLK_Div256);  // 72 MHz divided by 256 = 281.25 kHz
    } else {
        // enable clock for ADC3+4
        RCC_ADCCLKConfig(RCC_ADC34PLLCLK_Div256);  // 72 MHz divided by 256 = 281.25 kHz
    }

    RCC_ClockCmd(adc.rccADC, ENABLE);

    dmaInit(dmaGetIdentifier(adc.DMAy_Channelx), OWNER_ADC, 0);

    DMA_DeInit(adc.DMAy_Channelx);

    DMA_StructInit(&DMA_InitStructure);
    DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)&adc.ADCx->DR;
    DMA_InitStructure.DMA_MemoryBaseAddr = (uint32_t)adcValues;
    DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralSRC;
    DMA_InitStructure.DMA_BufferSize = adcChannelCount;
    DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
    DMA_InitStructure.DMA_MemoryInc = adcChannelCount > 1 ? DMA_MemoryInc_Enable : DMA_MemoryInc_Disable;
    DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord;
    DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_HalfWord;
    DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
    DMA_InitStructure.DMA_Priority = DMA_Priority_High;
    DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;

    DMA_Init(adc.DMAy_Channelx, &DMA_InitStructure);

    DMA_Cmd(adc.DMAy_Channelx, ENABLE);

    // calibrate

    ADC_VoltageRegulatorCmd(adc.ADCx, ENABLE);
    delay(10);
    ADC_SelectCalibrationMode(adc.ADCx, ADC_CalibrationMode_Single);
    ADC_StartCalibration(adc.ADCx);
    while (ADC_GetCalibrationStatus(adc.ADCx) != RESET);
    ADC_VoltageRegulatorCmd(adc.ADCx, DISABLE);

    ADC_CommonInitTypeDef ADC_CommonInitStructure;

    ADC_CommonStructInit(&ADC_CommonInitStructure);
    ADC_CommonInitStructure.ADC_Mode = ADC_Mode_Independent;
    ADC_CommonInitStructure.ADC_Clock = ADC_Clock_SynClkModeDiv4;
    ADC_CommonInitStructure.ADC_DMAAccessMode = ADC_DMAAccessMode_1;
    ADC_CommonInitStructure.ADC_DMAMode = ADC_DMAMode_Circular;
    ADC_CommonInitStructure.ADC_TwoSamplingDelay = 0;
    ADC_CommonInit(adc.ADCx, &ADC_CommonInitStructure);

    ADC_StructInit(&ADC_InitStructure);

    ADC_InitStructure.ADC_ContinuousConvMode    = ADC_ContinuousConvMode_Enable;
    ADC_InitStructure.ADC_Resolution            = ADC_Resolution_12b;
    ADC_InitStructure.ADC_ExternalTrigConvEvent = ADC_ExternalTrigConvEvent_0;
    ADC_InitStructure.ADC_ExternalTrigEventEdge = ADC_ExternalTrigEventEdge_None;
    ADC_InitStructure.ADC_DataAlign             = ADC_DataAlign_Right;
    ADC_InitStructure.ADC_OverrunMode           = ADC_OverrunMode_Disable;
    ADC_InitStructure.ADC_AutoInjMode           = ADC_AutoInjec_Disable;
    ADC_InitStructure.ADC_NbrOfRegChannel       = adcChannelCount;

    ADC_Init(adc.ADCx, &ADC_InitStructure);

    uint8_t rank = 1;
    for (int i = 0; i < ADC_CHANNEL_COUNT; i++) {
        if (!adcOperatingConfig[i].enabled) {
            continue;
        }
        ADC_RegularChannelConfig(adc.ADCx, adcOperatingConfig[i].adcChannel, rank++, adcOperatingConfig[i].sampleTime);
    }

    ADC_Cmd(adc.ADCx, ENABLE);

    while (!ADC_GetFlagStatus(adc.ADCx, ADC_FLAG_RDY));

    ADC_DMAConfig(adc.ADCx, ADC_DMAMode_Circular);

    ADC_DMACmd(adc.ADCx, ENABLE);

    ADC_StartConversion(adc.ADCx);
}

