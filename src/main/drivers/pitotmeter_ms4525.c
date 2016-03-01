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

#include <platform.h>

#include "build_config.h"

#include "pitotmeter.h"

#include "gpio.h"
#include "system.h"
#include "bus_i2c.h"

// MS4525, Standard address 0x28
#define MS4525_ADDR                 0x28

static void ms4525_start(void);
static void ms4525_read(void);
static void ms4525_calculate(float *pressure, float *temperature);

static uint16_t ms4525_ut;  // static result of temperature measurement
static uint16_t ms4525_up;  // static result of pressure measurement
static uint16_t zeropointvalue;  // measured zeropoint
static bool zeropoint = false;
static uint16_t calibrationCount = 0;
static uint32_t filter_reg = 0; // Barry Dorr filter register

bool ms4525Detect(pitot_t *pitot)
{
    bool ack = false;
    uint8_t sig;

    ack = i2cRead(MS4525_ADDR, 0xFF, 1, &sig, MS4525_BUS);
    if (!ack)
        return false;

    pitot->delay = 10000;
    pitot->start = ms4525_start;
    pitot->get = ms4525_read;
    pitot->calculate = ms4525_calculate;
    ms4525_read();
    return true;
}

static void ms4525_start(void)
{
    uint8_t sig;
    i2cRead(MS4525_ADDR, 0xFF, 1, &sig, MS4525_BUS);
}

static void ms4525_read(void)
{
    uint8_t rxbuf[4];
    i2cRead(MS4525_ADDR, 0xFF, 4, rxbuf, MS4525_BUS); // read ADC
    ms4525_up = (rxbuf[0] << 8) | (rxbuf[1] << 0);
    ms4525_ut = ((rxbuf[2] << 8) | (rxbuf[3] << 0))>>5;
}


void voltage_correction(float *pressure, float *temperature)
{
    UNUSED(pressure);
    UNUSED(temperature);
}

static void ms4525_calculate(float *pressure, float *temperature)
{
	uint8_t status = (ms4525_up & 0xC000) >> 14;
	switch (status) {
		case 0:
			break;
		case 1:
			/* fallthrough */
		case 2:
			/* fallthrough */
		case 3:
			return;
	}
	int16_t dp_raw = 0, dT_raw = 0;

	/* mask the used bits */
	dp_raw = 0x3FFF & ms4525_up;
	dT_raw = ms4525_ut;

	if (!zeropoint) {
	   if (calibrationCount <= 0) {
		   calibrationCount++;
		   filter_reg = (dp_raw << 5);
		   return;
	   } else if (calibrationCount <= 100) {
		   calibrationCount++;
		   filter_reg = filter_reg - (filter_reg >> 5) + dp_raw;
		   if (calibrationCount > 100) {
			   zeropointvalue = (uint16_t)(filter_reg >> 5);
			   zeropoint=true;
			   calibrationCount = 0;
		   }
		   return;
	   }
	}

	float dP = (10 * (int32_t)(dp_raw - zeropointvalue)) * 0.1052120688f;
	float T  = (float)(200 * (int32_t)dT_raw - 102350) / 2047 + 273.15f;

    if (pressure)
        *pressure = dP;	// Pa
    if (temperature)
        *temperature = T; // K
}


