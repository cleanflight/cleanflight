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

#include <platform.h>

#include "build/build_config.h"
#include "build/debug.h"

#include "common/axis.h"
#include "common/maths.h"
#include "common/filter.h"

#include "config/config_reset.h"
#include "pg/pg.h"
#include "pg/pg_ids.h"

//#include "drivers/sound_beeper.h"
//#include "drivers/time.h"

#include "fc/fc_core.h"
#include "fc/rc_modes.h"
#include "fc/fc_rc.h"

#include "fc/rc_controls.h"
#include "fc/runtime_config.h"

#include "flight/pid.h"
#include "flight/imu.h"
#include "flight/mixer.h"

#include "io/gps.h"

#include "sensors/gyro.h"
#include "sensors/acceleration.h"

static DAC_HandleTypeDef hdac;
static TIM_HandleTypeDef handle;
static DAC_ChannelConfTypeDef sConfig;

static bool pidAudioEnabled = false;

void pidAudioInit(void)
{
    __HAL_RCC_DAC_CLK_ENABLE();
    __HAL_RCC_TIM6_CLK_ENABLE();

    hdac.Instance = DAC;
    HAL_DAC_Init(&hdac);

    GPIO_InitTypeDef GPIO_InitStruct;
    GPIO_InitStruct.Pin = GPIO_PIN_4;
    GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
}

void pidAudioStart(void)
{

    handle.Instance = TIM6;
    handle.Init.Period = 0xFF; // 42Mhz / 256 = 16.406khz
    handle.Init.Prescaler = 0;

    handle.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
    handle.Init.CounterMode = TIM_COUNTERMODE_UP;
    handle.Init.RepetitionCounter = 0;
    HAL_TIM_Base_Init(&handle);

    TIM_MasterConfigTypeDef sMasterConfig;
    sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_ENABLE;
    sMasterConfig.MasterOutputTrigger = TIM_TRGO_UPDATE;
    HAL_TIMEx_MasterConfigSynchronization(&handle, &sMasterConfig);

    HAL_TIM_Base_Start(&handle);

    sConfig.DAC_Trigger = DAC_TRIGGER_T6_TRGO;
    sConfig.DAC_OutputBuffer = DAC_OUTPUTBUFFER_ENABLE;
    HAL_DAC_ConfigChannel(&hdac, &sConfig, DAC_CHANNEL_1);

    HAL_DACEx_NoiseWaveGenerate(&hdac, DAC_CHANNEL_1, DAC_LFSRUNMASK_BITS10_0);
    HAL_DAC_SetValue(&hdac, DAC_CHANNEL_1, DAC_ALIGN_12B_L, 0xcd00);

    HAL_DAC_Start(&hdac, DAC_CHANNEL_1);
}

void pidAudioStop(void)
{
    HAL_DAC_Stop(&hdac, DAC_CHANNEL_1);
    HAL_TIM_Base_Stop(&handle);
}

void pidAudioUpdate(void)
{
    bool newState = IS_RC_MODE_ACTIVE(BOXPIDAUDIO);

    if (pidAudioEnabled != newState) {
        if (newState) {
            pidAudioStart();
        } else {
            pidAudioStop();
        }
        pidAudioEnabled = newState;
    }

    if (!pidAudioEnabled) {
        return;
    }

    const uint32_t pidSumXY = MIN((ABS(axisPIDSum[FD_ROLL]) + ABS(axisPIDSum[FD_YAW])) / 2, PIDSUM_LIMIT);

    uint32_t newPeriod = scaleRange(pidSumXY, 0, PIDSUM_LIMIT, 64, 576);
    handle.Init.Period = newPeriod;
    TIM_Base_SetConfig(handle.Instance, &handle.Init);
}
