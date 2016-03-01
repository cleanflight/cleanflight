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

#define PITOT_SAMPLE_COUNT_MAX   48

typedef struct pitotmeterConfig_s {
    uint8_t pitot_sample_count;              // size of baro filter array
    float pitot_noise_lpf;                   // additional LPF to reduce baro noise
    float pitot_scale;                       // scale value
} pitotmeterConfig_t;

#ifdef PITOT
void usePitotmeterConfig(pitotmeterConfig_t *pitotmeterConfigToUse);
bool isPitotCalibrationComplete(void);
void pitotSetCalibrationCycles(uint16_t calibrationCyclesRequired);
void pitotUpdate(uint32_t currentTime);
bool isPitotReady(void);
int32_t pitotCalculateAirSpeed(void);
void performPitotCalibrationCycle(void);
#endif
