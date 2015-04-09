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

#include "rx/rx.h"

#ifndef TELEMETRY_FRSKY_H_
#define TELEMETRY_FRSKY_H_

typedef enum {
    FRSKY_VFAS_PRECISION_LOW = 0,
    FRSKY_VFAS_PRECISION_HIGH
} frskyVFasPrecision_e;

void handleFrSkyTelemetry(rxConfig_t *rxConfig, uint16_t deadband3d_throttle);
void checkFrSkyTelemetryState(void);

void initFrSkyTelemetry(telemetryConfig_t *telemetryConfig);
void configureFrSkyTelemetryPort(void);
void freeFrSkyTelemetryPort(void);

#endif /* TELEMETRY_FRSKY_H_ */
