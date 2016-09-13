/*
 * smartport.h
 *
 *  Created on: 25 October 2014
 *      Author: Frank26080115
 */

#ifndef TELEMETRY_SMARTPORT_H_
#define TELEMETRY_SMARTPORT_H_

void initSmartPortTelemetry(void);

void handleSmartPortTelemetry(void);
bool checkSmartPortTelemetryState(void);

void configureSmartPortTelemetryPort(void);
void freeSmartPortTelemetryPort(void);

bool isSmartPortTimedOut(void);

#endif /* TELEMETRY_SMARTPORT_H_ */
