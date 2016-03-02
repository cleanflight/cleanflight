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
 * MERCHANTABILITY or FITNECS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Cleanflight.  If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Bit banging SPI version of RTC6705 VTX
 *
 * Compatible with vtx_rtc6705.c by sblakemore for ImpulseRC Singularity FCs,
 * originated from Giles Burgess (giles@multiflite.co.uk) for MultiFlite FCs.
 */

#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <strings.h>

#include <platform.h>
#include <config/config.h>

#include "build_config.h"
#include "gpio.h"
#include "system.h"

#include "drivers/vtxbb.h"
#include "drivers/vtx.h"
#include "drivers/vtx_rtc6705.h"

// Magic spell to include config_master.h

#include "common/color.h"
#include "common/axis.h"
#include "common/maths.h"

#include "drivers/sensor.h"
#include "drivers/accgyro.h"
#include "drivers/compass.h"
#include "drivers/gpio.h"
#include "drivers/serial.h"
#include "drivers/timer.h"
#include "drivers/pwm_rx.h"

#include "io/rc_controls.h"

#include "sensors/sensors.h"
#include "sensors/gyro.h"
#include "sensors/acceleration.h"
#include "sensors/boardalignment.h"
#include "sensors/battery.h"

#include "io/serial.h"
#include "io/gimbal.h"
#include "io/escservo.h"
#include "io/ledstrip.h"
#include "io/gps.h"

#include "telemetry/telemetry.h"

#include "flight/mixer.h"
#include "flight/pid.h"
#include "flight/imu.h"
#include "flight/failsafe.h"
#include "flight/altitudehold.h"
#include "flight/navigation.h"

#include "config/config_profile.h"
#include "config/config_master.h"

// End of the spell for config_master.h

#if defined(VTX) && defined(VTXBB)
//
// Bit-banging SPI layer
// Ideally, it would be a separate service with a separate file,
// e.g., drivers/bus_spi_soft.c or something, but since there is no other
// device using the service at the moment, it is kept here.
//

// Requires 3 plain GPIO ports for SS, SCK and MOSI.
// Find out the ports to use from 'port code' variables:
// vtxbb_ss_pcode, vtxbb_sck_pcode and vtxbb_mosi_pcode.
// A port code is a 3-digit decimal number whose 100th
// represent a GPIO (100 = GPIOA, 200=GPIOC, ... 600=GPIOF),
// and 10th & 1th are pin number in decimal, for example,
//     101 = GPIOA, Pin 1 (PA1)
//     204 = GPIOB, Pin 4 (PB4)
//     313 = GPIOC, Pin 13 (PC13)
//     600 = GPIOF, Pin 0 (PF0)
//     0xx = Invalid
// etc. Zero in 100th represents an invalid assignment, and is an initial value
// for the variables.

static bool getGPIOSpecFromCode(int portcode, GPIO_TypeDef **pGPIO, uint16_t *pPin)
{
    int gpionum;
    int pinnum;

    if (portcode < 100)
        return false;

    gpionum = portcode / 100;
    pinnum = portcode % 100;

    switch(gpionum) {
    case 1:
        *pGPIO = GPIOA;
        break;
    case 2:
        *pGPIO = GPIOB;
        break;
    case 3:
        *pGPIO = GPIOC;
        break;
    case 4:
        *pGPIO = GPIOD;
        break;
    case 5:
        *pGPIO = GPIOE;
        break;
    case 6:
        *pGPIO = GPIOF;
        break;
    case 0: // Fall through
    default:
        return false;
    }

    if (pinnum >= 16)
        return false;

    *pPin = 1 << pinnum;

    return true;
}

static bool vtxbbHwChecked = false;
static vtxbbHardware_t vtxbbhw;
static bool vtxbbhwValid = false;

static bool getGPIOSpec()
{
    if (vtxbbHwChecked)
        return vtxbbhwValid;

    if (getGPIOSpecFromCode(masterConfig.vtxbb_ss_pcode,
            &vtxbbhw.ss_gpio, &vtxbbhw.ss_pin)
        && getGPIOSpecFromCode(masterConfig.vtxbb_sck_pcode,
            &vtxbbhw.sck_gpio, &vtxbbhw.sck_pin)
        && getGPIOSpecFromCode(masterConfig.vtxbb_mosi_pcode,
            &vtxbbhw.mosi_gpio, &vtxbbhw.mosi_pin)) {
	vtxbbhwValid = true;
    } else
        vtxbbhwValid = false;

    vtxbbHwChecked = true;

    return vtxbbhwValid;
}

vtxbbHardware_t *vtxbbGetHardwareConfig()
{
    if (getGPIOSpec())
    	return &vtxbbhw;

    return NULL;
}

#define	GPIONAME(x) \
	((x) == GPIOA ? "GPIOA" \
	:(x) == GPIOB ? "GPIOB" \
	:(x) == GPIOC ? "GPIOC" \
	: "UNKNOWN")
#define	GPIOPIN(x) \
	(ffs(x) - 1)

bool vtxbbInit(vtxbb_t *vtxbb)
{
    gpioInit(vtxbb->ss_gpio, &vtxbb->ss_cfg);
    gpioInit(vtxbb->sck_gpio, &vtxbb->sck_cfg);
    gpioInit(vtxbb->mosi_gpio, &vtxbb->mosi_cfg);
    VTXBB_SS_HI(vtxbb);

    vtxbb->active = true;

    return true;
}

void vtxbbWrite(vtxbb_t *vtxbb, uint32_t data, int bits)
{
    int i;

    VTXBB_SS_LO(vtxbb);

    delayMicroseconds(5);

    for (i = 0; i < bits; i++) {

        if (data & 1)
            VTXBB_MOSI_HI(vtxbb);
        else
            VTXBB_MOSI_LO(vtxbb);

		delayMicroseconds(1);	// Wait for data to settle(!!!)

        VTXBB_SCK_HI(vtxbb);

        delayMicroseconds(1);	// Paranoia

        VTXBB_SCK_LO(vtxbb);

            data >>= 1;
    }

    VTXBB_SS_HI(vtxbb);
}

//
// RTC6705 driver layer
//
#define Fosc    8       // Oscillator frequency in MHz
#define RREG    400     // Fixed R divisor

uint16_t freqTab[VTX_BAND_MAX][VTX_CHANNEL_MAX] = {
    { 5865, 5846, 5825, 5805, 5785, 5765, 5746, 5725 },
    { 5733, 5752, 5771, 5790, 5809, 5828, 5847, 5866 },
    { 5705, 5685, 5665, 5665, 5885, 5905, 5905, 5905 },
    { 5740, 5760, 5780, 5800, 5820, 5840, 5860, 5880 },
    { 5658, 5695, 5732, 5769, 5806, 5843, 5880, 5917 }
};

#define RTC6705WDATA(addr, rw, data) \
    ((addr & 0xf) | (rw << 4) | (data << 5))

static void rtc6705_SetFreq(vtxbb_t *vtxbb, int freq)
{
    int g = freq * RREG / (2 * Fosc);
    int ndiv = g / 64;
    int adiv = g % 64;

    vtxbbWrite(vtxbb, RTC6705WDATA(0, 1, RREG), 25);

    delayMicroseconds(20);

    vtxbbWrite(vtxbb, RTC6705WDATA(1, 1, ((ndiv << 7)|adiv)), 25);
}

static void rtc6705_SetChan(vtxbb_t *vtxbb, int band, int chan)
{
    rtc6705_SetFreq(vtxbb, freqTab[band][chan]);
}

//
// VTX instance and API
//

static vtxbb_t vtxbb = {
    .active = false,
    .ss_cfg = { .mode = Mode_Out_PP, .speed = Speed_2MHz },
    .sck_cfg = { .mode = Mode_Out_PP, .speed = Speed_2MHz },
    .mosi_cfg = { .mode = Mode_Out_PP, .speed = Speed_2MHz } 
};

bool vtxInit()
{
    if (!feature(FEATURE_VTXBB) || !getGPIOSpec())
        return false;

    vtxbb.ss_gpio = vtxbbhw.ss_gpio;
    vtxbb.ss_cfg.pin = vtxbbhw.ss_pin;
    vtxbb.sck_gpio = vtxbbhw.sck_gpio;
    vtxbb.sck_cfg.pin = vtxbbhw.sck_pin;
    vtxbb.mosi_gpio = vtxbbhw.mosi_gpio;
    vtxbb.mosi_cfg.pin = vtxbbhw.mosi_pin;

    if (!vtxbbInit(&vtxbb)) {
	return false;
    }

    delayMicroseconds(10000);

    return true;
}

void vtxSetFreq(int mhz)
{
    if (vtxbb.active)
    	rtc6705_SetFreq(&vtxbb, mhz);
}

void vtxSetChan(int band, int chan)
{
    if (vtxbb.active)
    	rtc6705_SetChan(&vtxbb, band - 1, chan - 1);
}
#endif
