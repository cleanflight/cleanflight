/*
 * telemetry_common.h
 *
 *  Created on: 6 Apr 2014
 *      Author: Hydra
 */

#ifndef TELEMETRY_COMMON_H_
#define TELEMETRY_COMMON_H_

// telemetry
void initTelemetry(void);
void updateTelemetryState(void);
void handleTelemetry(void);
bool isTelemetryEnabled(void);

#endif /* TELEMETRY_COMMON_H_ */
