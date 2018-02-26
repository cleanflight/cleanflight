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

typedef enum yupif4HardwareRevision_t {
    UNKNOWN = 0,
    YUPIF4_RACE1,       // Race V1
    YUPIF4_RACE2,       // Race V2
    YUPIF4_RACE3,       // Race V3
    YUPIF4_MINI,        // Mini
    YUPIF4_NAV          // Navigation
} yupif4HardwareRevision_e;

extern uint8_t hardwareRevision;

void detectHardwareRevision(void);
void updateHardwareRevision(void);

ioTag_t selectMPUIntExtiConfigByHardwareRevision(void);
