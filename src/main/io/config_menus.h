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

#ifndef _CONFIG_MENUS_H
#define _CONFIG_MENUS_H

#define NO_COMMAND			0x00
#define EXIT_EDITING_MODE	0x01	// THR_LO + YAW_CE + PIT_LO + ROL_LO
#define ENTER_EDITING_MODE	0x02	// THR_LO + YAW_CE + PIT_LO + ROL_HI
#define INC_COMMAND    		0x0B	// THR_LO + YAW_CE + PIT_HI + ROL_CE
#define DEC_COMMAND			0x0D	// THR_LO + YAW_CE + PIT_LO + ROL_CE
#define SET_COMMAND			0x09	// THR_LO + YAW_HI + PIT_HI + ROL_CE
#define NEXT_COMMAND		0x0E	// THR_LO + YAW_CE + PIT_CE + ROL_HI
#define PREV_COMMAND		0x07	// THR_LO + YAW_CE + PIT_CE + ROL_LO


/*#if defined(FLASH_SIZE) && (FLASH_SIZE > 128)
# define DATA_SETTING_FULL_VERSION 1
# else
# define DATA_SETTING_FULL_VERSION 0
#endif

#if (!DATA_SETTING_FULL_VERSION)
typedef enum {
	SELECTION_PAGE = 0,
	ALL_DATA_PAGE
} indexOfPages_e;
static const char * const pageNames[] = {
	"All CleanF data"
};
// pageNames[] and indexOfPages must be kept synchronized

static const char * const sharedLines[] = {
    "CleanFlight page ?",
    "        Save"
};
static const char * const allDataPage[] = {
    " ",
    " index : %3i",
    " %s",
    " value : %9s",
    "   min : %9d",
    "   max : %9d"
};

#else

typedef enum {
	SELECTION_PAGE = 0,
	FIRMWARE_PAGE,
    ALL_DATA_PAGE,
    FEATURES_PAGE,
	MEASURES_PAGE,
    BATTERY_PAGE,
    CURRENTMETER_PAGE,
    ESCMOTORS_PAGE,
    PID_PROFILE_PAGE,
    RATE_PROFILE_PAGE,
    GPS_PAGE,
    RECEIVER_PAGE,
    MOTORS_PAGE,
    SERVOS_PAGE
} indexOfPages_e;*/

/*const char * const pageNames[] = {
	"Firmware",
    "All CleanF data",
    "Features",
    "Measures",
    "Battery",
    "Current_meter",
    "ESC_Motors",
    "PID_profile",
    "Rate_profile",
    "GPS",
    "Receiver",
    "Motors",
    "Servos"
};
// pageNames[] and indexOfPages must be kept synchronized

const char * const sharedLines[] = {
    "CleanFlight page ?",
    "        Save"
};
const char * const firmwarePage[] = {
	" target   %10s",
	" version   %9s",
	" date   %12s",
	" time   %12s",
	" Git rev.   %8s",
	"",
	" mixer  %12s"
};
const char * const allDataPage[] = {
    " ",
    " index   %3i",
    " %s",
    " value   %9s",
    "   min   %9d",
    "   max   %9d"
};
const char * const measuresPage[] = {
	" Battery %iS   %2i.%1i V",
	" Current     %3i.%1i A",
	" Drawn     %5d mAh",
	" RSSI          %3d",
	" Alarm voice TX    %c",
	" Alarm period  %3d s"
};
const char * const batteryPage[] = {
	" Feature  VBAT     %c",
	" min cell volt.  %1i.%1i",
	" max cell volt.  %1i.%1i",
	" warning   ==    %1i.%1i",
	" Voltage scale   %i"
};
const char * const currentMeterPage[] = {
	" Feature C_meter   %c",
	" Output scale %c %4d",
	" Offset        %5d",
	" MWii output       %c",
	" meter type  %7s"
};
const char * const escMotorsPage[] = {
	" Feature MotorStop %c",
	" Feature Oneshot   %c",
	" min throttle   %4d",
	" middle  ==     %4d",
	" max throttle   %4d",
	" min command    %4d"
};
const char * const pidTuningPage[] = {
    " Profile  %i",
    " Control  %s",
    "       P    I    D",
    " Rol %2i.%1i %1i.%03i %3d",
    " Pit %2i.%1i %1i.%03i %3d",
    " Yaw %2i.%1i %1i.%03i %3d"
};
const char * const rateProfilePage[] = {
    " Profile  %i",
    "       Rol Pit Yaw",
    " Rate  %3i %3i %3i",
    "",
    " TPA       %3i",
    " Brk_Pt   %4i"
};
const char * const gpsPage[] = {
	" Feature  GPS      %c",
	" protocol      %5s",
	" baudrate     %6d",
	" assistance    %5s",
	" mag_decl.  %c%3id%02i'"
};
const char * const receiverPage[] = {
	" Throttle mid    %3i",
	"       Thr   RC  Yaw",
	" Expo  %3i  %3i  %3i",
	" RC rate         %3i",
	" Rssi channel     %2i",
	" Chan. Map  %8s"
};
const char * const motorsPage[] = {
    " mot. 1 %4d  2 %4d",
    "  --  3 %4d  4 %4d",
    "  --  5 %4d  6 %4d",
    "  --  7 %4d  8 %4d",
    " propellers OFF !  %c",
    " command :   %4i us"
};
const char * const servosPage[] = {
    " servo  %i",
    " min %4i   max %4i",
    " mid %4i  rate %c%3i",
    " angle at min    %3i",
    " angle at max    %3i",
    " channel         %3s",
    "      no servos"
};
const char * const servoForwardChannel[] = {"CH1", "CH2", "CH3", "CH4", "A1",
    "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "A11", "A12", " no"};*/
//#endif


bool onGoingDataEditingWithSticks;

void sendContentOfPageToDisplay(void);
void processDataEditingWithSticks(uint8_t rcSticks);
void processDataEditing(uint8_t commandID);
void initDataEditingStructures(void);

#endif //_CONFIG_MENUS_H
