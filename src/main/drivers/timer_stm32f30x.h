
#pragma once

#include "stm32f30x.h"

void TIM_SelectOCxM_NoDisable(TIM_TypeDef* TIMx, uint16_t TIM_Channel, uint16_t TIM_OCMode);
