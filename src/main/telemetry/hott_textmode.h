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
 *  Created on: 22 janv. 2015
 *  Author: Pierre Archambault
 */

#ifndef HOTT_TEXTMODE_H_
#define HOTT_TEXTMODE_H_

//FIXME : Inc and Dec arrows are switched when any part of the TX display is reversed
// this is known by Graupner but not corrected in v1.185 MX20 firmware

typedef enum {
    HOTT_EAM_ALARM1_FLAG_NONE = 0,
    HOTT_EAM_ALARM1_FLAG_MAH = (1 << 0),
    HOTT_EAM_ALARM1_FLAG_BATTERY_1 = (1 << 1),
    HOTT_EAM_ALARM1_FLAG_BATTERY_2 = (1 << 2),
    HOTT_EAM_ALARM1_FLAG_TEMPERATURE_1 = (1 << 3),
    HOTT_EAM_ALARM1_FLAG_TEMPERATURE_2 = (1 << 4),
    HOTT_EAM_ALARM1_FLAG_ALTITUDE = (1 << 5),
    HOTT_EAM_ALARM1_FLAG_CURRENT = (1 << 6),
    HOTT_EAM_ALARM1_FLAG_MAIN_VOLTAGE = (1 << 7),
} hottEamAlarm1Flag_e;

#define HOTTV4_BUTTON_INC    0x0B	// UP arrow
#define HOTTV4_BUTTON_DEC    0x0D	// DOWN arrow
#define HOTTV4_BUTTON_SET    0x09	// ESC (right button)
#define HOTTV4_BUTTON_NIL    0x0F
#define HOTTV4_BUTTON_NEXT   0x0E	// RIGHT arrow
#define HOTTV4_BUTTON_PREV   0x07	// LEFT arrow

#define HOTT_BINARY_MODE_REQUEST_ID 	0x80
#define HOTT_TELEMETRY_NO_SENSOR_ID     0x80	// no sensor has been found during the bus scan
#define HOTT_TELEMETRY_VARIO_SENSOR_ID  0x89	// Graupner #33601 Vario Module
#define HOTT_TELEMETRY_GPS_SENSOR_ID    0x8a	// Graupner #33600 GPS Module
#define HOTT_TELEMETRY_AIRESC_SENSOR_ID 0x8c	// Graupner #337xx Air ESC
#define HOTT_TELEMETRY_GAM_SENSOR_ID    0x8d	// Graupner #33611 General Air Module
#define HOTT_TELEMETRY_EAM_SENSOR_ID    0x8e	// Graupner #33620 Electric Air Module


#define HOTT_TEXT_MODE_REQUEST_ID   	0x7F
#define HOTT_RECEIVER_ID				0x00		// "Receiver" selected on TX for text mode
#define HOTT_VARIO_SENSOR_TEXT_ID		0x90		// "Vario Module"     --      --
#define HOTT_GPS_SENSOR_TEXT_ID  		0xA0		// "GPS Module"       --      --
#define HOTT_GAM_SENSOR_TEXT_ID			0xD0		// "General Air Module"       --
#define HOTT_EAM_SENSOR_TEXT_ID			0xE0		// "Electric Air Module"      --

#define MAX_HOTT_ALARM_SOUND_CLOCK	120	// seconds  (default maximum 120s is probably too much for an alarm signal)

#define MILLISECONDS_IN_A_SECOND 		1000

#define HOTT_TEXTMODE_MSG_COLUMNS 		21
#define HOTT_TEXTMODE_MSG_LINES 		8


typedef enum {
    PIXEL_NORMAL = 0,
    PIXEL_INVERTED = (1 << 0),
    PIXEL_MIXED = (1 << 1)
} pixelColor_e;

static const char * const servoDirectn[] = {"REV", "NOR"};

static const char * const servoForwardChannel[] = {"CH1", "CH2", "CH3", "CH4", "A01",
		"A02", "A03", "A04", "A05", "A06", "A07", "A08", "A09", "A10", "A11", "A12", " no"};

static const char * const currentMeterTypes[] = {"none", "ADC", "virtual"};

static const char * const gpsProtocols[] = {" NMEA", "UBLOX"};

static const int gpsBaudrates[] = {9600, 19200, 38400, 57600, 115200};

static const char * const gpsAssistances[] = {" none", "EGNOS", " WAAS", " MSAS", "GAGAN"};

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

static const char * const staticMeasuresPage[] = {
    " Battery %iS : %2i.%1i V",
    " Current :   %3i.%1i A",
    " Cons.:    %5d mAh",
    " RSSI :       %2i.%1i %%",
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

static const char * const pidControllerTitles[] = {
    "MultiWii old",
    "MultiWii rewrite",
    "LuxFloat",
    "MultiW23 latest",
    "MultiW23 hybrid",
    "Harakiri",
    NULL
};

static const char * const textModePageNames[] = {
	"Firmware",
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
    "Servos",
    NULL
};

typedef enum {
	SELECTION_PAGE = 0,
	FIRMWARE_PAGE,
    FEATURES_PAGE,
	MEASURES_PAGE,
    BATTERY_PAGE,
    CURRENTMETER_PAGE,
    ESCMOTEURS_PAGE,
    PIDCONTROLLER_PAGE,
    PID_PROFILE_PAGE,
    RATE_PROFILE_PAGE,
    GPS_PAGE,
    RECEIVER_PAGE,
    MOTORS_PAGE,
    SERVOS_PAGE
} hottTextModePages_e;

// hottTextModePageTitles[] and hottTextModePages_e must be kept synchronized


typedef struct hottDisplayLine_s {
    bool isActive;			//true if any editable item is on the line
    uint8_t itemsOnLine;
} hottDisplayLine_s;

typedef struct hottDisplayActiveItem_s {
    uint8_t line;
    uint8_t leftPosition;
    uint8_t rightPosition;
    uint8_t color;			// 0: normal  -  1: inverted pixels - 2: mixed
    uint8_t data;
    uint8_t minValue;
    uint8_t maxValue;
    bool alive;
} hottDisplayActiveItem_s;

#define NBR_OF_EDITABLE_ITEMS     24    // default : 3 editable items per line
typedef struct HOTT_TEXT_DISPLAY_s {
	hottDisplayLine_s displayLine [HOTT_TEXTMODE_MSG_LINES];
    hottDisplayActiveItem_s editField[NBR_OF_EDITABLE_ITEMS];
} HOTT_TEXT_DISPLAY_t;


//Graupner Text mode message structure
typedef struct HOTT_TEXT_MSG_s {
    uint8_t startByte;				// 0x7B
    uint8_t esc;					// 0x00 : normal  -  0x01 : exit text mode
    uint8_t warningBeeps;			// 0 = none, 1=A 2=B ... (see codes in telemetry/hott.h)
    char lineOfText [HOTT_TEXTMODE_MSG_LINES] [HOTT_TEXTMODE_MSG_COLUMNS]; // MSB = 1 -> inverse character contrast on display
    uint8_t stopByte;				// 0x7D
} HOTT_TEXT_MSG_t;

void initialiseTextMessage(HOTT_TEXT_MSG_t *msg, size_t size);
void initialiseHottTXDisplay(HOTT_TEXT_DISPLAY_t *msg, size_t size);
void processTextModeRequest(HOTT_TEXT_MSG_t *hottTEXTMessage, HOTT_TEXT_DISPLAY_t *TxtModTXscreen, uint8_t address);


#endif /* HOTT_TEXTMODE_H_ */
