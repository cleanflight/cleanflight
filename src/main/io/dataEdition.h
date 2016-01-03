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

/*
 * Authors:
 * Dominic Clifton/Hydra
 * Carsten Giesen
 * Adam Majerczyk (majerczyk.adam@gmail.com)
 * Texmode add-on by Michi (mamaretti32@gmail.com)
 *
 *  Created on: december 2015
 *  Author: Pierre Archambault
 */

#define NO_COMMAND			0x00
#define EXIT_EDITION_MODE	0x01	// THR_LO + YAW_CE + PIT_LO + ROL_LO
#define ENTER_EDITION_MODE	0x02	// THR_LO + YAW_CE + PIT_LO + ROL_HI
#define INC_COMMAND    		0x0B	// THR_LO + YAW_CE + PIT_HI + ROL_CE
#define DEC_COMMAND			0x0D	// THR_LO + YAW_CE + PIT_LO + ROL_CE
#define SET_COMMAND			0x09	// THR_LO + YAW_HI + PIT_HI + ROL_CE
#define NEXT_COMMAND		0x0E	// THR_LO + YAW_CE + PIT_CE + ROL_HI
#define PREV_COMMAND		0x07	// THR_LO + YAW_CE + PIT_CE + ROL_LO

#define MILLISECONDS_IN_A_SECOND 	1000

#define DEFAULT_DISPLAY_COLUMNS 	21
#define DEFAULT_DISPLAY_LINES 		8


typedef enum {
    PIXEL_NORMAL = 0,
    PIXEL_INVERTED = (1 << 0),
    PIXEL_MIXED = (1 << 1)
} pixelColor_e;

#define LOWER_FLASH_SIZE_FOR_FULL_EDITION_MENUS    128
#define DATA_EDITION_FULL_VERSION    (defined(FLASH_SIZE) && (FLASH_SIZE > LOWER_FLASH_SIZE_FOR_FULL_EDITION_MENUS))

#if (!DATA_EDITION_FULL_VERSION)
static const char * const pageNames[] = {
	"All CleanF data"
};
typedef enum {
	SELECTION_PAGE = 0,
	ALL_DATA_PAGE
} indexOfPages_e;
// pageNames[] and indexOfPages must be kept synchronized

static const char * const staticSharedLines[] = {
    "CleanFlight page ?",
    "        Save"
};
static const char * const staticDataPage[] = {
    " ",
    " index : %3i",
    " %s",
    " value : %9s",
    "   min : %9d",
    "   max : %9d"
};

#else

static const char * const servoForwardChannel[] = {"CH1", "CH2", "CH3", "CH4", "A01",
    "A02", "A03", "A04", "A05", "A06", "A07", "A08", "A09", "A10", "A11", "A12", " no"};

static const char * const pageNames[] = {
	"Firmware",
    "All CleanF data",
    "Features",
    "Measures",
    "Battery",
    "Current_meter",
    "ESC_Motors",
    "PID_controller",
    "PID_profile",
    "Rate_profile",
    "GPS",
    "Receiver",
    "Motors",
    "Servos"
};
typedef enum {
	SELECTION_PAGE = 0,
	FIRMWARE_PAGE,
    ALL_DATA_PAGE,
    FEATURES_PAGE,
	MEASURES_PAGE,
    BATTERY_PAGE,
    CURRENTMETER_PAGE,
    ESCMOTORS_PAGE,
    PIDCONTROLLER_PAGE,
    PID_PROFILE_PAGE,
    RATE_PROFILE_PAGE,
    GPS_PAGE,
    RECEIVER_PAGE,
    MOTORS_PAGE,
    SERVOS_PAGE
} indexOfPages_e;
// pageNames[] and indexOfPages must be kept synchronized

static const char * const staticSharedLines[] = {
    "CleanFlight page ?",
    "        Save"
};
static const char * const staticFirmwarePage[] = {
	" target : %10s",
	" version : %9s",
	" date : %12s",
	" time : %12s",
	" Git rev. : %8s",
	"",
	" mixer: %12s"
};
static const char * const staticDataPage[] = {
    " ",
    " index : %3i",
    " %s",
    " value : %9s",
    "   min : %9d",
    "   max : %9d"
};
static const char * const staticMeasuresPage[] = {
	" Battery %iS : %2i.%1i V",
	" Current :   %3i.%1i A",
	" Cons.:    %5d mAh",
	" RSSI :        %3d",
	" Alarm voice TX    %c",
	" Alarm period :%3d s"
};
static const char * const staticBatteryPage[] = {
	" Feature  VBAT     %c",
	" min cell volt.  %1i.%1i",
	" max cell volt.  %1i.%1i",
	" warning   ==    %1i.%1i",
	" Voltage scale   %i"
};
static const char * const staticCurrentMeterPage[] = {
	" Feature C_meter   %c",
	" Output scale  %c%4d",
	" Offset        %5d",
	" MWii output       %c",
	" meter type  %7s"
};
static const char * const staticEscMotorsPage[] = {
	" Feature MotorStop %c",
	" Feature Oneshot   %c",
	" min throttle   %4d",
	" middle  ==     %4d",
	" max throttle   %4d",
	" min command    %4d"
};
static const char * const staticPIDprofilePage[] = {
    " Profile: %i",
    "        P   I   D",
    " Rol   %3i %3i %3i",
    " Pit   %3i %3i %3i",
    " Yaw   %3i %3i %3i"
};
static const char * const staticRateprofilePage[] = {
    " Profile: %i",
    "       Rol Pit Yaw",
    " Rate  %3i %3i %3i",
    "",
    " TPA    :  %3i",
    " Brk_Pt : %4i"
};
static const char * const staticGPSPage[] = {
	" Feature  GPS      %c",
	" protocol      %5s",
	" baudrate     %6d",
	" assistance    %5s",
	" mag_decl.  %c%3id%02i'"
};
static const char * const staticReceiverPage[] = {
	" Throttle mid    %3i",
	" Throttle expo   %3i",
	" RC rate         %3i",
	" RC expo         %3i",
	" Rssi channel     %2i",
	" Chan. Map  %8s"
};
static const char * const staticMotorsPage[] = {
    " mot. 1 %4d  2 %4d",
    "  --  3 %4d  4 %4d",
    "  --  5 %4d  6 %4d",
    "  --  7 %4d  8 %4d",
    " propellers OFF !  %c",
    " command :   %4i us"
};
static const char * const staticServosPage[] = {
    " servo: %i",
    " min: %4i max: %4i",
    " mid: %4i rate  %3i",
    " frwrd_frm_chanl %s",
    "      no servos"
};
#endif


bool onGoingDataEditionWithSticks;

void sendContentOfPageToDisplay(void);
void processDataEditionWithSticks(uint8_t rcSticks);
void processDataEdition(uint8_t commandID);
void initDataEditionStructures(void);
