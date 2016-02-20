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
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <stdio.h>

#include "platform.h"
#include "version.h"

#include "common/axis.h"
#include "common/maths.h"
#include "common/color.h"
#include "common/typeconversion.h"
#include "common/utils.h"

#include "drivers/system.h"
#include "drivers/sensor.h"
#include "drivers/accgyro.h"
#include "drivers/compass.h"
#include "drivers/serial.h"
#include "drivers/bus_i2c.h"
#include "drivers/gpio.h"
#include "drivers/timer.h"
#include "drivers/pwm_rx.h"
#include "drivers/light_led.h"
#include "drivers/display_ug2864hsweg01.h"

#include "io/rc_controls.h"
#include "sensors/battery.h"

#include "io/beeper.h"
#include "io/escservo.h"
#include "io/gps.h"
#include "io/gimbal.h"
#include "io/serial.h"
#include "io/serial_cli.h"
#include "io/ledstrip.h"
#include "io/display.h"

#include "rx/rx.h"
#include "rx/spektrum.h"

#include "sensors/boardalignment.h"
#include "sensors/sensors.h"
#include "sensors/acceleration.h"
#include "sensors/gyro.h"
#include "sensors/compass.h"
#include "sensors/barometer.h"

#include "flight/pid.h"
#include "flight/imu.h"
#include "flight/mixer.h"
#include "flight/navigation.h"
#include "flight/failsafe.h"

#include "telemetry/telemetry.h"

#include "config/runtime_config.h"
#include "config/config.h"
#include "config/config_profile.h"
#include "config/config_master.h"

#include "io/config_menus.h"


extern unsigned char oledCharFormat;
extern void cliSetVar(const clivalue_t *var, const int_float_value_t value);
extern const clivalue_t valueTable[];
extern uint8_t numberOfRecordsInCLITable ;


typedef enum {
    PIXEL_NORMAL = 0,
    PIXEL_INVERTED = (1 << 0),
    PIXEL_MIXED = (1 << 1)
} pixelColor_e;

#if defined(FLASH_SIZE) && (FLASH_SIZE > 128)
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
} indexOfPages_e;

static const char * const pageNames[] = {
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

static const char * const sharedLines[] = {
    "CleanFlight page ?",
    "        Save"
};
static const char * const firmwarePage[] = {
	" target   %10s",
	" version   %9s",
	" date   %12s",
	" time   %12s",
	" Git rev.   %8s",
	"",
	" mixer  %12s"
};
static const char * const allDataPage[] = {
    " ",
    " index   %3i",
    " %s",
    " value   %9s",
    "   min   %9d",
    "   max   %9d"
};
static const char * const measuresPage[] = {
	" Battery %iS   %2i.%1i V",
	" Current     %3i.%1i A",
	" Drawn     %5d mAh",
	" RSSI          %3d",
	" Alarm voice TX    %c",
	" Alarm period  %3d s"
};
static const char * const batteryPage[] = {
	" Feature  VBAT     %c",
	" min cell volt.  %1i.%1i",
	" max cell volt.  %1i.%1i",
	" warning   ==    %1i.%1i",
	" Voltage scale   %i"
};
static const char * const currentMeterPage[] = {
	" Feature C_meter   %c",
	" Output scale %c %4d",
	" Offset        %5d",
	" MWii output       %c",
	" meter type  %7s"
};
static const char * const escMotorsPage[] = {
	" Feature MotorStop %c",
	" Feature Oneshot   %c",
	" min throttle   %4d",
	" middle  ==     %4d",
	" max throttle   %4d",
	" min command    %4d"
};
static const char * const pidTuningPage[] = {
    " Profile  %i",
    " Control  %s",
    "       P    I    D",
    " Rol %2i.%1i %1i.%03i %3d",
    " Pit %2i.%1i %1i.%03i %3d",
    " Yaw %2i.%1i %1i.%03i %3d"
};
static const char * const rateProfilePage[] = {
    " Profile  %i",
    "       Rol Pit Yaw",
    " Rate  %3i %3i %3i",
    "",
    " TPA       %3i",
    " Brk_Pt   %4i"
};
static const char * const gpsPage[] = {
	" Feature  GPS      %c",
	" protocol      %5s",
	" baudrate     %6d",
	" assistance    %5s",
	" mag_decl.  %c%3id%02i'"
};
static const char * const receiverPage[] = {
	" Throttle mid    %3i",
	"       Thr   RC  Yaw",
	" Expo  %3i  %3i  %3i",
	" RC rate         %3i",
	" Rssi channel     %2i",
	" Chan. Map  %8s"
};
static const char * const motorsPage[] = {
    " mot. 1 %4d  2 %4d",
    "  --  3 %4d  4 %4d",
    "  --  5 %4d  6 %4d",
    "  --  7 %4d  8 %4d",
    " propellers OFF !  %c",
    " command :   %4i us"
};
static const char * const servosPage[] = {
    " servo  %i",
    " min %4i   max %4i",
    " mid %4i  rate %c%3i",
    " angle at min    %3i",
    " angle at max    %3i",
    " channel         %3s",
    "      no servos"
};
static const char * const servoForwardChannel[] = {"CH1", "CH2", "CH3", "CH4", "A1",
    "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "A11", "A12", " no"};

#endif

#define DISPLAY_LINES			8
#define CHARS_PER_LINE			21
#define OLED_DISPLAY			1
#define THREE_ITEMS_PER_LINE	3
#define MAX_OF_EDITABLE_ITEMS	24    // default : 3 editable items per line  x 8 lines


typedef struct displayLine_s {
    bool isActive;			//true if any editable item is on the line
    uint8_t itemsOnLine;
} displayLine_t;

typedef struct displayActiveItem_s {
    uint8_t line;
    uint8_t leftPosition;
    uint8_t rightPosition;
    uint8_t color;			// 0: normal  -  1: inverted pixels - 2: mixed
    int32_t data;
    int32_t minValue;
    int32_t maxValue;
    bool alive;
} displayActiveItem_t;

typedef struct PAGE_DISPLAY_s {
	displayLine_t displayLine [DISPLAY_LINES];
    displayActiveItem_t editField[MAX_OF_EDITABLE_ITEMS];
} page_display_t;

typedef struct PAGE_MESSAGE_s {
    char lineOfText [DISPLAY_LINES] [CHARS_PER_LINE];
} page_message_t;

static page_message_t contentOfPage;
static page_display_t structureOfPage;


static uint8_t 	bottomLineOnDisplay;
static uint8_t  positionInLineOfInvertedChar = 0;
static uint8_t 	whichOfPages 	= 0;
static uint8_t	selectedPage	= SELECTION_PAGE;
static uint8_t	selectedLine	= 1;
static int8_t	editionLine		= -1;
static int8_t	selectedItem 	= -1;
static uint8_t  numberOfElementsInList;
static uint8_t 	numberOfSecondaryPagesForThatPage = 0;

static bool shouldInitialiseThePage 	= true;
static bool onGoingEditingProcess 		= false;

static char tempString[10];
static float valueFloat = 0;
static int32_t valueInteger = 0;

#if (DATA_SETTING_FULL_VERSION)
extern uint16_t rssi;
static bool isAlarmSoundOn = true;
extern uint8_t motorCount;
extern uint8_t servoCount;
#define SCALE_P_MW     10
#define SCALE_I_MW     1000
#define SCALE_D_MW     1
#define SCALE_P_LUX    10
#define SCALE_I_LUX    100
#define SCALE_D_LUX    1000
#endif


//======================================  Utilities  =======================================
void initialiseOledDisplayPage(void)
{
    memset(&structureOfPage, 0, sizeof(structureOfPage));
}

void initDataEditingStructures(void)    // called in main
{
#ifdef DISPLAY
    if (featureConfigured(FEATURE_DISPLAY)) {
    initialiseOledDisplayPage();
    }
#endif
	onGoingDataEditingWithSticks = false;
}

static void initialiseEditingModeSpace(void)
{
	for (int i = 0; i < DISPLAY_LINES; i++) {
		structureOfPage.displayLine[i].isActive = false;
		structureOfPage.displayLine[i].itemsOnLine = 1;
	}
	for (int i = 0; i < MAX_OF_EDITABLE_ITEMS; i++)
		structureOfPage.editField[i].alive = false;

	selectedLine = 1;
	editionLine = -1;
    selectedItem = -1;
    shouldInitialiseThePage = false;
	onGoingEditingProcess = false;
	numberOfSecondaryPagesForThatPage = 0;
}

static uint8_t firstItemOnLine(uint8_t line)
{
    return (line * THREE_ITEMS_PER_LINE);
}

static void highlightItemOnOledDisplay(uint8_t item)
{
	oledCharFormat = INVERSE_CHAR_FORMAT;
	switch (structureOfPage.editField[item].color){
		case PIXEL_MIXED :
			i2c_OLED_set_xy(positionInLineOfInvertedChar, structureOfPage.editField[item].line);
			i2c_OLED_send_char(contentOfPage.lineOfText[structureOfPage.editField[item].line][positionInLineOfInvertedChar]);
		break;
		case PIXEL_INVERTED :
				for(int i = structureOfPage.editField[item].leftPosition; i <= structureOfPage.editField[item].rightPosition; i++){
					i2c_OLED_set_xy(i, structureOfPage.editField[item].line);
					i2c_OLED_send_char(contentOfPage.lineOfText[structureOfPage.editField[item].line][i]);
				}
		break;
	}
	oledCharFormat = NORMAL_CHAR_FORMAT;
}

static void completeStringWithSpaces(uint8_t lineIndex)
{
    uint8_t length = strlen(contentOfPage.lineOfText[lineIndex]);

    while (length < sizeof(contentOfPage.lineOfText[lineIndex]))
    	contentOfPage.lineOfText[lineIndex][length++] = ' ';
}

#if (DATA_SETTING_FULL_VERSION)
static bool isBatteryLevelOK(void)
{
	if ((featureConfigured(FEATURE_VBAT)) && (getBatteryState() != BATTERY_OK))
		return false;
	return true;
}

static uint8_t numberOfActiveDisplayLinesForMotorsPlusOne(void)
{
	int TWO_MOTORS_PER_LINE = 2;
	return (1 + (motorCount + (TWO_MOTORS_PER_LINE - 1)) / TWO_MOTORS_PER_LINE);
}

static void stopAllServos(void)
{
	for (int index = 0; index < MAX_SUPPORTED_SERVOS; index++)
		servo[index] = currentProfile->servoConf[index].middle;
}

static void getReceiverMapping(void)
{
    for (int i = 0; i < MAX_MAPPABLE_RX_INPUTS; i++)
    	tempString[masterConfig.rxConfig.rcmap[i]] = rcChannelLetters[i];
}

static uint8_t getChannelIndex(void)
{
	for (int i = 0; i < MAX_MAPPABLE_RX_INPUTS; i++)
    	if (tempString[structureOfPage.editField[19].data] == rcChannelLetters[i])
            return i;
    return -1;
}

static bool theRCMappingStringIsValid(void)
{
	for (int i = 0; i < MAX_MAPPABLE_RX_INPUTS; i++)
		for (int j = i + 1; j < MAX_MAPPABLE_RX_INPUTS; j++)
			if (tempString[i] == tempString[j])
				return false;
	return true;
}
#endif
//=================================  end of Utilities  ===================================

//======================  initialization of active/editable items  =======================
static void defineActiveItem(uint8_t item, uint8_t leftPosition,
                             uint8_t rightPosition, int32_t minValue, int32_t maxValue)
{
	uint8_t line = item / THREE_ITEMS_PER_LINE;
	structureOfPage.displayLine[line].isActive = true;

	structureOfPage.editField[item].line = line;
	structureOfPage.editField[item].leftPosition = leftPosition;
	structureOfPage.editField[item].rightPosition = rightPosition;
	structureOfPage.editField[item].color = PIXEL_NORMAL;
	structureOfPage.editField[item].data = 0;
	structureOfPage.editField[item].minValue = minValue;
	structureOfPage.editField[item].maxValue = maxValue;
	structureOfPage.editField[item].alive = true;
}

static void defineOnOffItem(uint8_t item, uint8_t leftPosition, uint8_t rightPosition)
{
    defineActiveItem (item, leftPosition, rightPosition, 0, 1);
}

static void initialiseItemsForThisPage(uint8_t numberOfDisplayLines)
{
	numberOfSecondaryPagesForThatPage = ((numberOfElementsInList + (numberOfDisplayLines - 1)) / numberOfDisplayLines) - 1;

	if ((whichOfPages == 0) && (numberOfElementsInList <= numberOfDisplayLines)){
		bottomLineOnDisplay = numberOfElementsInList;
	}
	else {
		if (whichOfPages != numberOfSecondaryPagesForThatPage)
			bottomLineOnDisplay = numberOfDisplayLines;
		else
			bottomLineOnDisplay = (numberOfElementsInList - (numberOfDisplayLines * numberOfSecondaryPagesForThatPage));
    }
	for (int i = 0; i < bottomLineOnDisplay; i++)
		defineOnOffItem(firstItemOnLine(i+1), 19, 19);
}

static void initialiseItemsOfTheSelectedPage(void)
{
    defineActiveItem (21, 8, 11, 0, 0);    // item "save"

	switch (selectedPage){
		case SELECTION_PAGE : {
			numberOfElementsInList = ARRAYLEN(pageNames);
			initialiseItemsForThisPage(DISPLAY_LINES-1);
			for (int i = 0; i < MAX_OF_EDITABLE_ITEMS; i++)
				structureOfPage.editField[i].alive = false;
		break;
		}
		case ALL_DATA_PAGE : {
			defineActiveItem(3, 9, 11, 0, numberOfRecordsInCLITable - 1);
			defineActiveItem (6, 1, 20, 0, numberOfRecordsInCLITable - 1);
			structureOfPage.displayLine[2].isActive = false;
			defineActiveItem (9, 9, 19, 0, 1);
        break;
		}
#if (DATA_SETTING_FULL_VERSION)
		case FEATURES_PAGE : {
			numberOfElementsInList = ARRAYLEN(featureNames) - 1;
			initialiseItemsForThisPage(DISPLAY_LINES-2);
	    break;
		}
        case MEASURES_PAGE : {
            defineActiveItem(3, 14, 19, 0, 100);
        	structureOfPage.displayLine[1].isActive = false;
            defineOnOffItem(15, 19, 19);
            defineActiveItem (18, 15, 17, 0, 120);
		    break;
		}
		case BATTERY_PAGE : {
			defineOnOffItem(3, 19, 19);
			for (int i = 0; i < 3; i++)
				defineActiveItem (firstItemOnLine(i+2), 17, 19, 10, 50);
			defineActiveItem (15, 17, 19, VBAT_SCALE_MIN, VBAT_SCALE_MAX);
		break;
		}
		case CURRENTMETER_PAGE : {
			defineOnOffItem(3, 19, 19);
			defineActiveItem (6, 15, 19, 0, 10000);
			defineOnOffItem(7, 14, 14);
			structureOfPage.displayLine[2].itemsOnLine = 2;
			defineActiveItem (9, 16, 19, 0, 3300);
			defineOnOffItem(12, 19, 19);
			defineActiveItem (15, 13, 19, 0, ARRAYLEN(lookupTableCurrentSensor) - 1);
		break;
		}
		case ESCMOTORS_PAGE : {
			for (int i = 0; i < 2; i++)
				defineOnOffItem(firstItemOnLine(i+1), 19, 19);
			for (int i = 0; i < 5; i++)
				defineActiveItem (firstItemOnLine(i+3), 16, 19, PWM_RANGE_ZERO, PWM_RANGE_MAX);
		break;
		}
	    case PID_PROFILE_PAGE : {
			defineActiveItem (3, 10, 10, 0, MAX_PROFILE_COUNT - 1);
			defineActiveItem (6, 10, 19, 0, PID_COUNT - 1);
			for (int i = 0; i < 3; i++){
				int itm = firstItemOnLine(i+4);
				defineActiveItem (itm, 5, 8, PID_MIN, PID_MAX);
				defineActiveItem (itm+1, 10, 14, PID_MIN, PID_MAX);
				defineActiveItem (itm+2, 16, 18, PID_MIN, PID_MAX);
		        structureOfPage.displayLine[i+4].itemsOnLine = 3;
			}
		break;
	    }
	    case RATE_PROFILE_PAGE : {
			defineActiveItem (3, 10, 10, 0, MAX_CONTROL_RATE_PROFILE_COUNT - 1);
			defineActiveItem (9, 7, 9, 0, CONTROL_RATE_CONFIG_ROLL_PITCH_RATE_MAX);
			defineActiveItem (10, 11, 13, 0, CONTROL_RATE_CONFIG_ROLL_PITCH_RATE_MAX);
			defineActiveItem (11, 15, 17, 0, CONTROL_RATE_CONFIG_YAW_RATE_MAX);
	        structureOfPage.displayLine[3].itemsOnLine = 3;
			defineActiveItem (15, 11, 13, 0, CONTROL_RATE_CONFIG_TPA_MAX);
			defineActiveItem (18, 10, 13, PWM_RANGE_MIN, PWM_RANGE_MAX);
		break;
	    }
		case GPS_PAGE : {
#ifdef GPS
			defineOnOffItem(3, 19, 19);
			defineActiveItem (6, 15, 19, 0, ARRAYLEN(lookupTableGPSProvider) - 1);
			defineActiveItem (9, 14, 19, 0, baudRateCount() - 1);
			defineActiveItem (12, 15, 19, 0, ARRAYLEN(lookupTableGPSSBASMode) - 1);
			defineOnOffItem(15, 12, 12);
			defineActiveItem (16, 13, 15, 0, 180);
			defineActiveItem (17, 17, 18, 0, 59);
			structureOfPage.displayLine[5].itemsOnLine = 3;
#endif
		break;
		}
		case RECEIVER_PAGE : {
			defineActiveItem(3, 17, 19, 0, 100);
			defineActiveItem (9, 7, 9, 0, 100);
			defineActiveItem (10, 12, 14, 0, 100);
			defineActiveItem (11, 17, 19, 0, 200);
	        structureOfPage.displayLine[3].itemsOnLine = 3;
			defineActiveItem(12, 17, 19, 0, 250);
			defineActiveItem (15, 18, 19, 0, 15);
			defineActiveItem (18, 12, 19, 0, MAX_MAPPABLE_RX_INPUTS - 1);
			getReceiverMapping();
		break;
		}
        case MOTORS_PAGE : {
        	int motorLinesPlusOne = numberOfActiveDisplayLinesForMotorsPlusOne();
			for (int i = 1; i < motorLinesPlusOne; i++) {
	            defineOnOffItem(firstItemOnLine(i), 7, 7);
	            defineOnOffItem(firstItemOnLine(i)+1, 15, 15);
				structureOfPage.displayLine[i].itemsOnLine = 2;
			}
            defineOnOffItem(18, 19, 19);
			defineActiveItem (21, 13, 16, PWM_RANGE_ZERO, PWM_RANGE_MAX);
	    	structureOfPage.editField[21].data = feature(FEATURE_3D) ? masterConfig.flight3DConfig.neutral3d : masterConfig.escAndServoConfig.mincommand;
	    break;
	    }
	    case SERVOS_PAGE : {
			if (servoCount != 0) {
				defineActiveItem (3, 8, 8, 0, MAX_SUPPORTED_SERVOS - 1);
				defineActiveItem (6, 5, 8, PWM_PULSE_MIN, PWM_PULSE_MAX);
				defineActiveItem (7, 16, 19, PWM_PULSE_MIN, PWM_PULSE_MAX);
				structureOfPage.displayLine[2].itemsOnLine = 2;
				defineActiveItem (9, 5, 8, PWM_PULSE_MIN, PWM_PULSE_MAX);
	            defineOnOffItem(10, 16, 16);
				defineActiveItem (11, 17, 19, 0, 100);
				structureOfPage.displayLine[3].itemsOnLine = 3;
				defineActiveItem (12, 17, 19, 0, 180);
				defineActiveItem (15, 17, 19, 0, 180);
				defineActiveItem (18, 17, 19, 0, MAX_SUPPORTED_RC_CHANNEL_COUNT - 2);
			}
	    break;
	    }
#endif
	}
}

//====================  update of values currently used in Cleanflight  ====================
static void updateDataValue(void)
{
	switch(valueTable[structureOfPage.editField[3].data].type & VALUE_MODE_MASK) {
		case MODE_DIRECT :
			switch (valueTable[structureOfPage.editField[3].data].type & VALUE_TYPE_MASK) {
				case VAR_UINT8:
					valueInteger = *(uint8_t *)valueTable[structureOfPage.editField[3].data].ptr;
				break;
				case VAR_INT8:
					valueInteger = *(int8_t *)valueTable[structureOfPage.editField[3].data].ptr;
				break;
				case VAR_UINT16:
					valueInteger = *(uint16_t *)valueTable[structureOfPage.editField[3].data].ptr;
				break;
				case VAR_INT16:
					valueInteger = *(int16_t *)valueTable[structureOfPage.editField[3].data].ptr;
				break;
				case VAR_UINT32:
					valueInteger = *(uint32_t *)valueTable[structureOfPage.editField[3].data].ptr;
				break;
				case VAR_FLOAT:
					valueFloat = *(float *)valueTable[structureOfPage.editField[3].data].ptr;
					ftoa(valueFloat, tempString);
				return;
			}
			sprintf(tempString, "%d", (int)valueInteger);
		break;

		case MODE_LOOKUP:
			strcpy(tempString, lookupTables[valueTable[structureOfPage.editField[3].data].config.lookup.tableIndex].values[structureOfPage.editField[9].data]);
        break;
	}
}

#if (DATA_SETTING_FULL_VERSION)
static void updatePIDProfileValues(void)
{
	structureOfPage.editField[6].data = masterConfig.profile[structureOfPage.editField[3].data].pidProfile.pidController;
	switch (structureOfPage.editField[6].data){
		case PID_CONTROLLER_MW23 :
		case PID_CONTROLLER_MWREWRITE :
			for (int i = 0; i < 4; i++){
				structureOfPage.editField[firstItemOnLine(i+4)].data = masterConfig.profile[structureOfPage.editField[3].data].pidProfile.P8[i];
				structureOfPage.editField[firstItemOnLine(i+4)+1].data = masterConfig.profile[structureOfPage.editField[3].data].pidProfile.I8[i];
				structureOfPage.editField[firstItemOnLine(i+4)+2].data = masterConfig.profile[structureOfPage.editField[3].data].pidProfile.D8[i];
			}
		break;
		case PID_CONTROLLER_LUX_FLOAT :
			for (int i = 0; i < 4; i++){
				structureOfPage.editField[firstItemOnLine(i+4)].data = round(masterConfig.profile[structureOfPage.editField[3].data].pidProfile.P_f[i] * SCALE_P_LUX);
				structureOfPage.editField[firstItemOnLine(i+4)+1].data = round(masterConfig.profile[structureOfPage.editField[3].data].pidProfile.I_f[i] * SCALE_I_LUX);
				structureOfPage.editField[firstItemOnLine(i+4)+2].data = round(masterConfig.profile[structureOfPage.editField[3].data].pidProfile.D_f[i] * SCALE_D_LUX);
			}
		break;
	}
}

static void updateRateValuesForTheCurrentProfile(void)
{
	structureOfPage.editField[9].data = masterConfig.controlRateProfiles[structureOfPage.editField[3].data].rates[FD_ROLL];
	structureOfPage.editField[10].data = masterConfig.controlRateProfiles[structureOfPage.editField[3].data].rates[FD_PITCH];
	structureOfPage.editField[11].data = masterConfig.controlRateProfiles[structureOfPage.editField[3].data].rates[FD_YAW];
	structureOfPage.editField[15].data = masterConfig.controlRateProfiles[structureOfPage.editField[3].data].dynThrPID;
	structureOfPage.editField[18].data = masterConfig.controlRateProfiles[structureOfPage.editField[3].data].tpa_breakpoint;
}

static void updateValuesForTheSelectedServo(void)
{
    structureOfPage.editField[6].data = currentProfile->servoConf[structureOfPage.editField[3].data].min;
    structureOfPage.editField[7].data = currentProfile->servoConf[structureOfPage.editField[3].data].max;
    structureOfPage.editField[9].data = currentProfile->servoConf[structureOfPage.editField[3].data].middle;
    structureOfPage.editField[10].data = (currentProfile->servoConf[structureOfPage.editField[3].data].rate > 0);
    structureOfPage.editField[11].data = abs(currentProfile->servoConf[structureOfPage.editField[3].data].rate);
    structureOfPage.editField[12].data = currentProfile->servoConf[structureOfPage.editField[3].data].angleAtMin;
    structureOfPage.editField[15].data = currentProfile->servoConf[structureOfPage.editField[3].data].angleAtMax;

    if (currentProfile->servoConf[structureOfPage.editField[3].data].forwardFromChannel == (int8_t)CHANNEL_FORWARDING_DISABLED)
        structureOfPage.editField[18].data = ARRAYLEN(servoForwardChannel) - 1;
}
#endif

static void updateValuesForThisPage(void)
{
	switch (selectedPage){
		case ALL_DATA_PAGE : {
			updateDataValue();
		break;
		}
#if (DATA_SETTING_FULL_VERSION)
		case FEATURES_PAGE : {
			for (int i = 0; i < bottomLineOnDisplay; i++){
				int index = (whichOfPages * (DISPLAY_LINES-2)) + i;
				structureOfPage.editField[firstItemOnLine(i+1)].data = ((featureMask() & (1 << index)) != 0);
			}
		break;
		}
        case MEASURES_PAGE : {
        	structureOfPage.editField[3].color = isBatteryLevelOK() ? PIXEL_NORMAL : PIXEL_INVERTED;
        	structureOfPage.editField[15].data = isAlarmSoundOn;
        	structureOfPage.editField[18].data = masterConfig.telemetryConfig.hottAlarmSoundInterval;
		break;
		}
		case BATTERY_PAGE : {
			structureOfPage.editField[3].data = featureConfigured(FEATURE_VBAT);
			structureOfPage.editField[6].data = masterConfig.batteryConfig.vbatmincellvoltage;
			structureOfPage.editField[9].data = masterConfig.batteryConfig.vbatmaxcellvoltage;
			structureOfPage.editField[12].data = masterConfig.batteryConfig.vbatwarningcellvoltage;
			structureOfPage.editField[15].data = masterConfig.batteryConfig.vbatscale;
		break;
		}
		case CURRENTMETER_PAGE : {
			structureOfPage.editField[3].data = featureConfigured(FEATURE_CURRENT_METER) ;
			structureOfPage.editField[6].data = abs(masterConfig.batteryConfig.currentMeterScale);
			structureOfPage.editField[7].data = (masterConfig.batteryConfig.currentMeterScale >= 0);
			structureOfPage.editField[9].data = masterConfig.batteryConfig.currentMeterOffset;
			structureOfPage.editField[12].data = masterConfig.batteryConfig.multiwiiCurrentMeterOutput;
			structureOfPage.editField[15].data = masterConfig.batteryConfig.currentMeterType;
		break;
		}
		case ESCMOTORS_PAGE : {
			structureOfPage.editField[3].data = featureConfigured(FEATURE_MOTOR_STOP);
			structureOfPage.editField[6].data = featureConfigured(FEATURE_ONESHOT125);
			structureOfPage.editField[9].data = masterConfig.escAndServoConfig.minthrottle;
			structureOfPage.editField[12].data = masterConfig.escAndServoConfig.servoCenterPulse;
			structureOfPage.editField[15].data = masterConfig.escAndServoConfig.maxthrottle;
	    	structureOfPage.editField[18].data = feature(FEATURE_3D) ? masterConfig.flight3DConfig.neutral3d : masterConfig.escAndServoConfig.mincommand;
		break;
		}
	    case PID_PROFILE_PAGE : {
	    	structureOfPage.editField[3].data = getCurrentProfile();
	    	updatePIDProfileValues();
		break;
	    }
	    case RATE_PROFILE_PAGE : {
	    	structureOfPage.editField[17].data = getCurrentControlRateProfile();
	    	updateRateValuesForTheCurrentProfile();
		break;
	    }
		case GPS_PAGE : {
#ifdef GPS
			structureOfPage.editField[3].data = featureConfigured(FEATURE_GPS) ;
			structureOfPage.editField[6].data = masterConfig.gpsConfig.provider;
			structureOfPage.editField[9].data = gpsData.baudrateIndex;
			structureOfPage.editField[12].data = masterConfig.gpsConfig.sbasMode;
			int index = getCurrentProfile();
			structureOfPage.editField[15].data = (masterConfig.profile[index].mag_declination >= 0);
			structureOfPage.editField[16].data = abs(masterConfig.profile[index].mag_declination / 100);
			structureOfPage.editField[17].data = abs(masterConfig.profile[index].mag_declination) % 100;
#endif
		break;
		}
		case RECEIVER_PAGE : {
			int index = getCurrentControlRateProfile();
			structureOfPage.editField[3].data = masterConfig.controlRateProfiles[index].thrMid8;
			structureOfPage.editField[9].data = masterConfig.controlRateProfiles[index].thrExpo8;
			structureOfPage.editField[10].data = masterConfig.controlRateProfiles[index].rcExpo8;
			structureOfPage.editField[11].data = masterConfig.controlRateProfiles[index].rcYawExpo8;
			structureOfPage.editField[12].data = masterConfig.controlRateProfiles[index].rcRate8;
			structureOfPage.editField[15].data = masterConfig.rxConfig.rssi_channel;
		break;
		}
	    case SERVOS_PAGE : {
	    	updateValuesForTheSelectedServo();
		break;
	    }
#endif
	}
}
//=========================================================================================

//=======================  apply new values to running Cleanflight  =======================
static void applyNewValuesOnCleanflightDataPage(int8_t delta)
{
	switch (selectedItem) {
		case 3 :{
			if ((valueTable[structureOfPage.editField[3].data].type & VALUE_MODE_MASK) == MODE_LOOKUP){
				structureOfPage.editField[9].data = *(uint8_t *)valueTable[structureOfPage.editField[3].data].ptr;
				structureOfPage.editField[9].minValue = 0;
				structureOfPage.editField[9].maxValue = lookupTables[valueTable[structureOfPage.editField[3].data].config.lookup.tableIndex].valueCount - 1;
			}
		break;
		}
		case 9 :{
			int_float_value_t tmp;
			tmp.int_value = structureOfPage.editField[9].data; // case of lookup mode
			if ((valueTable[structureOfPage.editField[3].data].type & VALUE_MODE_MASK) == MODE_DIRECT){
				if ((valueTable[structureOfPage.editField[3].data].type & VALUE_TYPE_MASK) == VAR_FLOAT){
					valueFloat = constrainf((valueFloat + (delta * 0.001f)), valueTable[structureOfPage.editField[3].data].config.minmax.min,
							valueTable[structureOfPage.editField[3].data].config.minmax.max);
					tmp.float_value = valueFloat;
				}
				else {
					valueInteger = constrain((valueInteger + delta), valueTable[structureOfPage.editField[3].data].config.minmax.min,
							valueTable[structureOfPage.editField[3].data].config.minmax.max);
					tmp.int_value = valueInteger;
				}
			}
			cliSetVar(&valueTable[structureOfPage.editField[3].data], tmp);
		break;
		}
	}
}

#if (DATA_SETTING_FULL_VERSION)
static void updateFeatureSelection(bool on, uint32_t feature)
{
	on ? featureSet(feature) : featureClear(feature);
}

static void updatePIDProfileValuesInMasterConfig(void)
{
    uint8_t profile = structureOfPage.editField[3].data;
	masterConfig.profile[profile].pidProfile.pidController = structureOfPage.editField[6].data;

	switch (structureOfPage.editField[6].data){
		case PID_CONTROLLER_MW23 :
		case PID_CONTROLLER_MWREWRITE :
			for (int i = 0; i < 3; i++){
				masterConfig.profile[profile].pidProfile.P8[i] = structureOfPage.editField[12 + i*3].data;
				masterConfig.profile[profile].pidProfile.I8[i] = structureOfPage.editField[13 + i*3].data;
				masterConfig.profile[profile].pidProfile.D8[i] = structureOfPage.editField[14 + i*3].data;
			}
		break;
		case PID_CONTROLLER_LUX_FLOAT :
			for (int i = 0; i < 3; i++){
				masterConfig.profile[profile].pidProfile.P_f[i] = (float)structureOfPage.editField[12 + i*3].data / SCALE_P_LUX;
                masterConfig.profile[profile].pidProfile.I_f[i] = (float)structureOfPage.editField[13 + i*3].data / SCALE_I_LUX;
				masterConfig.profile[profile].pidProfile.D_f[i] = (float)structureOfPage.editField[14 + i*3].data / SCALE_D_LUX;
			}
		break;
	}
}

static void applyNewValuesOnTheCurrentPage(void)
{
    switch (selectedPage){
	    case FEATURES_PAGE : {
	        int index = (whichOfPages * (DISPLAY_LINES-2)) + (selectedLine-1);
	        updateFeatureSelection(structureOfPage.editField[selectedItem].data, (1 << index));
	    break;
	    }
        case MEASURES_PAGE : {
        	isAlarmSoundOn = structureOfPage.editField[15].data;
        	masterConfig.telemetryConfig.hottAlarmSoundInterval = structureOfPage.editField[18].data;
		break;
		}
        case BATTERY_PAGE : {
        	updateFeatureSelection(structureOfPage.editField[3].data, FEATURE_VBAT);
			masterConfig.batteryConfig.vbatmincellvoltage = structureOfPage.editField[6].data;
			masterConfig.batteryConfig.vbatmaxcellvoltage = structureOfPage.editField[9].data;
			masterConfig.batteryConfig.vbatwarningcellvoltage = structureOfPage.editField[12].data;
			masterConfig.batteryConfig.vbatscale = structureOfPage.editField[15].data;

			batteryWarningVoltage = batteryCellCount * masterConfig.batteryConfig.vbatwarningcellvoltage;
			batteryCriticalVoltage = batteryCellCount * masterConfig.batteryConfig.vbatmincellvoltage;
		break;
		}
        case CURRENTMETER_PAGE : {
        	updateFeatureSelection(structureOfPage.editField[3].data, FEATURE_CURRENT_METER);
        	masterConfig.batteryConfig.currentMeterScale = (structureOfPage.editField[7].data ? 1 : - 1) * structureOfPage.editField[6].data;
        	masterConfig.batteryConfig.currentMeterOffset = structureOfPage.editField[9].data;
        	masterConfig.batteryConfig.multiwiiCurrentMeterOutput = structureOfPage.editField[12].data;
        	masterConfig.batteryConfig.currentMeterType = structureOfPage.editField[15].data;
		break;
		}
        case ESCMOTORS_PAGE : {
        	updateFeatureSelection(structureOfPage.editField[3].data, FEATURE_MOTOR_STOP);
        	updateFeatureSelection(structureOfPage.editField[6].data, FEATURE_ONESHOT125);
			masterConfig.escAndServoConfig.minthrottle = structureOfPage.editField[9].data;
			masterConfig.escAndServoConfig.servoCenterPulse = structureOfPage.editField[12].data;
			masterConfig.escAndServoConfig.maxthrottle = structureOfPage.editField[15].data;
	    	if(feature(FEATURE_3D))
	    		masterConfig.flight3DConfig.neutral3d = structureOfPage.editField[18].data;
	    	else
	    		masterConfig.escAndServoConfig.mincommand = structureOfPage.editField[18].data;
		break;
		}
	    case PID_PROFILE_PAGE : {
			if (selectedItem == 3) {
				setCurrentPIDprofileConfig(structureOfPage.editField[3].data);
				updatePIDProfileValues();
			}
			else if (selectedItem == 6){
				masterConfig.profile[structureOfPage.editField[3].data].pidProfile.pidController = structureOfPage.editField[6].data;
				updatePIDProfileValues();
			}
			else {
				updatePIDProfileValuesInMasterConfig();
			}
		break;
	    }
	    case RATE_PROFILE_PAGE : {
			if (selectedItem == 3) {
				setControlRateProfile(structureOfPage.editField[3].data);
				updateRateValuesForTheCurrentProfile();
			}
			else {
				int index = structureOfPage.editField[3].data;
				masterConfig.controlRateProfiles[index].rates[FD_ROLL] = structureOfPage.editField[9].data;
				masterConfig.controlRateProfiles[index].rates[FD_PITCH] = structureOfPage.editField[10].data;
				masterConfig.controlRateProfiles[index].rates[FD_YAW] = structureOfPage.editField[11].data;
				masterConfig.controlRateProfiles[index].dynThrPID = structureOfPage.editField[15].data;
				masterConfig.controlRateProfiles[index].tpa_breakpoint = structureOfPage.editField[18].data;
			}
		break;
	    }
	    case GPS_PAGE : {
#ifdef GPS
	    	updateFeatureSelection(structureOfPage.editField[3].data, FEATURE_GPS);
	    	masterConfig.gpsConfig.provider = structureOfPage.editField[6].data;
	    	gpsData.baudrateIndex = structureOfPage.editField[9].data;
	    	masterConfig.gpsConfig.sbasMode = structureOfPage.editField[12].data;

            int16_t declination = structureOfPage.editField[16].data * 100 + structureOfPage.editField[17].data;
	    	if (declination > 18000)
	    		declination = 18000;
	    	declination = declination * (structureOfPage.editField[15].data ? 1 : -1);
	    	masterConfig.profile[getCurrentProfile()].mag_declination = declination;
#endif
	    break;
	    }
	    case RECEIVER_PAGE : {
			if (selectedItem == 18)
				tempString[structureOfPage.editField[19].data] = rcChannelLetters[structureOfPage.editField[18].data];
			else {
				int index = getCurrentControlRateProfile();
				masterConfig.controlRateProfiles[index].thrMid8 = structureOfPage.editField[3].data;

				masterConfig.controlRateProfiles[index].thrExpo8 = structureOfPage.editField[9].data;
				masterConfig.controlRateProfiles[index].rcExpo8 = structureOfPage.editField[10].data;
				masterConfig.controlRateProfiles[index].rcYawExpo8 = structureOfPage.editField[11].data;

				masterConfig.controlRateProfiles[index].rcRate8 = structureOfPage.editField[12].data;
				masterConfig.rxConfig.rssi_channel = structureOfPage.editField[15].data;
			}
		break;
	    }
        case MOTORS_PAGE : {
        	for (int index = 0; index < motorCount; index++) {
        		int item = (THREE_ITEMS_PER_LINE + (index / (THREE_ITEMS_PER_LINE - 1)) * THREE_ITEMS_PER_LINE
        				+ index % (THREE_ITEMS_PER_LINE - 1));
        		if (!structureOfPage.editField[18].data)
            		motor_disarmed[index] = feature(FEATURE_3D) ? masterConfig.flight3DConfig.neutral3d : masterConfig.escAndServoConfig.mincommand;
        		else {
        			if (structureOfPage.editField[item].data)
                		motor_disarmed[index] = structureOfPage.editField[21].data ;
        			else
                		motor_disarmed[index] = feature(FEATURE_3D) ? masterConfig.flight3DConfig.neutral3d : masterConfig.escAndServoConfig.mincommand;;
        		}
        	}
	    break;
	    }
	    case SERVOS_PAGE : {
			if (selectedItem == 3)
				updateValuesForTheSelectedServo();
			else {
				int index = structureOfPage.editField[3].data;
				currentProfile->servoConf[index].min = structureOfPage.editField[6].data;
				currentProfile->servoConf[index].max = structureOfPage.editField[7].data;
				currentProfile->servoConf[index].middle = structureOfPage.editField[9].data;
				currentProfile->servoConf[index].rate = (structureOfPage.editField[10].data ? 1 : -1) * structureOfPage.editField[11].data;
				currentProfile->servoConf[index].angleAtMin = structureOfPage.editField[12].data;
				currentProfile->servoConf[index].angleAtMax = structureOfPage.editField[15].data;
				if (structureOfPage.editField[18].data == ARRAYLEN(servoForwardChannel) - 1)
					currentProfile->servoConf[index].forwardFromChannel = (int8_t)CHANNEL_FORWARDING_DISABLED;
				else
					currentProfile->servoConf[index].forwardFromChannel = structureOfPage.editField[18].data;
			}
		break;
	    }
	}
}
#endif
//========================================================================================

//============================= preparation of the  message  =============================
static void includeTitleLine(void)
{
	if (selectedPage != SELECTION_PAGE)
	    snprintf(contentOfPage.lineOfText[0],CHARS_PER_LINE, pageNames[selectedPage-1]);
	else
	    snprintf(contentOfPage.lineOfText[0],CHARS_PER_LINE, sharedLines[0]);

	completeStringWithSpaces(0);

	contentOfPage.lineOfText[0][CHARS_PER_LINE - 2] = '<';
	if (whichOfPages < numberOfSecondaryPagesForThatPage)
		contentOfPage.lineOfText[0][CHARS_PER_LINE - 1] = '>';
}

static void includeEmptyLine(uint8_t line)
{
	contentOfPage.lineOfText[line][0] = '\0';
	completeStringWithSpaces(line);
}

static void prepareMessageForThisList(char *listOfItems[], uint8_t numberOfLinesPerPage)
{
	for (int i = 0; i < bottomLineOnDisplay; i++){
		strcpy(contentOfPage.lineOfText[i+1], " ");
		strcat(contentOfPage.lineOfText[i+1], listOfItems[whichOfPages * numberOfLinesPerPage + i]);
		completeStringWithSpaces(i+1);
	}
	for (int i = bottomLineOnDisplay; i < numberOfLinesPerPage; i++)
		includeEmptyLine(i+1);
}

#if (DATA_SETTING_FULL_VERSION)
static char charForSelectionBox(uint8_t value)
{
	return (value ? 'X' : '-');
}

static char charPlusOrMinus(uint8_t value)
{
	return (value ? '+' : '-');
}

static void includeCommandLines(void)
{
	uint8_t i;
	if (selectedPage == MOTORS_PAGE)
		i = DISPLAY_LINES-2;
	else
		i = DISPLAY_LINES-3;
	snprintf(contentOfPage.lineOfText[i],CHARS_PER_LINE, motorsPage[4],
			                        charForSelectionBox(structureOfPage.editField[firstItemOnLine(i)].data));
	snprintf(contentOfPage.lineOfText[i + 1],CHARS_PER_LINE, motorsPage[5],
			                        structureOfPage.editField[firstItemOnLine(i+1)].data);
}

static void includeLineWithItemSave(void)
{
	snprintf(contentOfPage.lineOfText[7], CHARS_PER_LINE, sharedLines[1]);
}

static void prepareTheSelectedPage(char *listOfItems[], uint8_t numberOfLinesPerPage)
{
	prepareMessageForThisList(listOfItems, numberOfLinesPerPage);
	for (int i = 0; i < bottomLineOnDisplay; i++)
	    contentOfPage.lineOfText[i+1][19] = charForSelectionBox(structureOfPage.editField[firstItemOnLine(i+1)].data);
	includeLineWithItemSave();
}

static void printPIDLines(void)
{
	uint32_t scaleP = 1;
	uint32_t scaleI = 1;
	uint32_t scaleD = 1;
	uint32_t displayFactor_I = 1;

	switch (structureOfPage.editField[6].data){
		case PID_CONTROLLER_MW23 :
		case PID_CONTROLLER_MWREWRITE :
			scaleP = SCALE_P_MW;
			scaleI = SCALE_I_MW;
			scaleD = SCALE_D_MW;
		break;

		case PID_CONTROLLER_LUX_FLOAT :
			scaleP = SCALE_P_LUX;
			scaleI = SCALE_I_LUX;
			displayFactor_I = 10;
		break;
	}
	for (int line = 4; line < 7; line++){
		int j = firstItemOnLine(line);
		snprintf(contentOfPage.lineOfText[line],CHARS_PER_LINE, pidTuningPage[line-1],
				structureOfPage.editField[j].data/scaleP, structureOfPage.editField[j].data%scaleP,
				structureOfPage.editField[j+1].data/(scaleI*displayFactor_I), structureOfPage.editField[j+1].data%(scaleI*displayFactor_I),
				structureOfPage.editField[j+2].data/scaleD);
	}
}
#endif

static void prepareLinesOfTextForTheSelectedPage(void)
{
    includeTitleLine();
	snprintf(contentOfPage.lineOfText[7], CHARS_PER_LINE, sharedLines[1]);

	int32_t miniValue, maxiValue;

    switch (selectedPage){
		case SELECTION_PAGE :{
			prepareMessageForThisList((char**)pageNames, (DISPLAY_LINES-1));
		break;
		}
		case ALL_DATA_PAGE : {
			snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, allDataPage[1], structureOfPage.editField[3].data);
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, allDataPage[2], valueTable[structureOfPage.editField[3].data].name);
			snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, allDataPage[3], tempString);
			if ((valueTable[structureOfPage.editField[3].data].type & VALUE_MODE_MASK) == MODE_LOOKUP){
				miniValue = structureOfPage.editField[9].minValue;
				maxiValue = structureOfPage.editField[9].maxValue;
			}
			else {
				miniValue = valueTable[structureOfPage.editField[3].data].config.minmax.min;
				maxiValue = valueTable[structureOfPage.editField[3].data].config.minmax.max;
			}
			snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, allDataPage[4], miniValue);
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, allDataPage[5], maxiValue);
			includeEmptyLine(6);
		break;
		}
#if (DATA_SETTING_FULL_VERSION)
        case FIRMWARE_PAGE : {
			snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, firmwarePage[0], targetName);
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, firmwarePage[1], FC_VERSION_STRING);
			snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, firmwarePage[2], buildDate);
			snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, firmwarePage[3], buildTime);
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, firmwarePage[4], shortGitRevision);
			includeEmptyLine(6);
			snprintf(contentOfPage.lineOfText[7],CHARS_PER_LINE, firmwarePage[6], mixerNames[masterConfig.mixerMode - 1]);
	    break;
        }
	    case FEATURES_PAGE : {
	    	prepareTheSelectedPage((char**)featureNames, (DISPLAY_LINES-2));
	    break;
	    }
        case MEASURES_PAGE : {
			snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, measuresPage[0], batteryCellCount, vbat/10, vbat%10);
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, measuresPage[1], amperage/100, amperage%100);
			snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, measuresPage[2], mAhDrawn);
			snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, measuresPage[3], rssi/10);
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, measuresPage[4], charForSelectionBox(structureOfPage.editField[15].data));
			snprintf(contentOfPage.lineOfText[6],CHARS_PER_LINE, measuresPage[5], structureOfPage.editField[18].data);
        break;
		}
        case BATTERY_PAGE : {
			snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, batteryPage[0], charForSelectionBox(structureOfPage.editField[3].data));
			for (int line = 2; line < 5; line++){
				int j = firstItemOnLine(line);
				snprintf(contentOfPage.lineOfText[line],CHARS_PER_LINE, batteryPage[line-1], structureOfPage.editField[j].data/10, structureOfPage.editField[j].data%10);
			}
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, batteryPage[4], structureOfPage.editField[15].data);
            includeEmptyLine(6);
		break;
		}
        case CURRENTMETER_PAGE : {
			snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, currentMeterPage[0], charForSelectionBox(structureOfPage.editField[3].data));
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, currentMeterPage[1], charPlusOrMinus(structureOfPage.editField[7].data), structureOfPage.editField[6].data);
			snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, currentMeterPage[2], structureOfPage.editField[9].data);
			snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, currentMeterPage[3], charForSelectionBox(structureOfPage.editField[12].data));
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, currentMeterPage[4], lookupTableCurrentSensor[structureOfPage.editField[15].data]);
			includeEmptyLine(6);
		break;
		}
        case ESCMOTORS_PAGE : {
        	snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, escMotorsPage[0], charForSelectionBox(structureOfPage.editField[3].data));
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, escMotorsPage[1], charForSelectionBox(structureOfPage.editField[6].data));
			for (int line = 3; line < 7; line++){
				int j = firstItemOnLine(line);
			    snprintf(contentOfPage.lineOfText[line],CHARS_PER_LINE, escMotorsPage[line-1], (uint16_t) structureOfPage.editField[j].data);
			}
		break;
		}
	    case PID_PROFILE_PAGE : {
	    	snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, pidTuningPage[0], structureOfPage.editField[3].data);
	    	snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, pidTuningPage[1], lookupTablePidController[structureOfPage.editField[6].data]);
	    	snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, pidTuningPage[2]);
	    	printPIDLines();
	    break;
	    }
	    case RATE_PROFILE_PAGE : {
	    	snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, rateProfilePage[0], structureOfPage.editField[3].data);
	    	snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, rateProfilePage[1]);
	    	snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, rateProfilePage[2], structureOfPage.editField[9].data,
	    			structureOfPage.editField[10].data, structureOfPage.editField[11].data);
			includeEmptyLine(4);
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, rateProfilePage[4], structureOfPage.editField[15].data);
	    	snprintf(contentOfPage.lineOfText[6],CHARS_PER_LINE, rateProfilePage[5], structureOfPage.editField[18].data);
	    break;
	    }
	    case GPS_PAGE : {
#ifdef GPS
	    	snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, gpsPage[0], charForSelectionBox(structureOfPage.editField[3].data));
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, gpsPage[1], lookupTableGPSProvider[structureOfPage.editField[6].data]);
			snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, gpsPage[2], baudRates[structureOfPage.editField[9].data]);
			snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, gpsPage[3], lookupTableGPSSBASMode[structureOfPage.editField[12].data]);
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, gpsPage[4], charPlusOrMinus(structureOfPage.editField[15].data),
																	structureOfPage.editField[16].data, structureOfPage.editField[17].data);
			includeEmptyLine(6);
#endif
		break;
	    }
        case RECEIVER_PAGE : {
			snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, receiverPage[0], structureOfPage.editField[3].data);
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, receiverPage[1]);
			snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, receiverPage[2], structureOfPage.editField[9].data,
														structureOfPage.editField[10].data, structureOfPage.editField[11].data);
			snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, receiverPage[3], structureOfPage.editField[12].data);
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, receiverPage[4], structureOfPage.editField[15].data);
			snprintf(contentOfPage.lineOfText[6],CHARS_PER_LINE, receiverPage[5], tempString);
			if (structureOfPage.editField[18].color == PIXEL_MIXED)
				positionInLineOfInvertedChar = structureOfPage.editField[19].data + structureOfPage.editField[18].leftPosition;
		break;
		}
        case MOTORS_PAGE : {
        	for (int i = 0; i < 4; i++)
    			snprintf(contentOfPage.lineOfText[i+1],CHARS_PER_LINE, motorsPage[i], motor[2*i], motor[2*i + 1]);
			includeEmptyLine(5);
			includeCommandLines();
			int motorLinesPlusOne = numberOfActiveDisplayLinesForMotorsPlusOne();
			for (int line = 1; line < motorLinesPlusOne; line++) {
				int j = firstItemOnLine(line);
				contentOfPage.lineOfText[line][7] = charPlusOrMinus(structureOfPage.editField[j].data);
				contentOfPage.lineOfText[line][15] = charPlusOrMinus(structureOfPage.editField[j+1].data);
			}
	    break;
	    }
	    case SERVOS_PAGE : {
			if (servoCount != 0){
				snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, servosPage[0], structureOfPage.editField[3].data);
				snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, servosPage[1], structureOfPage.editField[6].data,
																						 structureOfPage.editField[7].data);
				snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, servosPage[2], structureOfPage.editField[9].data,
									charPlusOrMinus(structureOfPage.editField[10].data), structureOfPage.editField[11].data);
				snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, servosPage[3], structureOfPage.editField[12].data);
				snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, servosPage[4], structureOfPage.editField[15].data);
				snprintf(contentOfPage.lineOfText[6],CHARS_PER_LINE, servosPage[5], servoForwardChannel[structureOfPage.editField[18].data]);
	        }
			else {
				for (int line = 1; line < 8; line++)
					includeEmptyLine(line);
				snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, servosPage[6]);
			}
		break;
	    }
#endif
	}
	for (int i = 0; i < (DISPLAY_LINES-1); i++)
		completeStringWithSpaces(i+1);
}
//=========================================================================================

//===========================  processing interface and events  ===========================
static void initializeTheNewSelectedPage(void)
{
 	initialiseEditingModeSpace();
 	initialiseItemsOfTheSelectedPage();
}

static void exitEditingProcess(void)
{
	selectedItem = -1;
	editionLine = -1;
	onGoingEditingProcess = false;
}

static int32_t newValueAfterEvent(int8_t whichWay, int32_t whichValue, int32_t minValue, int32_t maxValue)
{
	if (whichWay == 1) {
		if (whichValue < maxValue)
			return (whichValue + 1);
		else
			return minValue;
	}
	else {
		if (whichValue > minValue)
			return (whichValue - 1);
		else
			return maxValue;
	}
}

static void processIncDecEvent(int8_t whichWay)
{
#if (DATA_SETTING_FULL_VERSION)
	if ((selectedItem == 21) && (selectedPage != MOTORS_PAGE)){
		structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
		exitEditingProcess();
		return;
	}
#else
	if (selectedItem == 21){
		structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
		exitEditingProcess();
		return;
	}
#endif

	if (onGoingEditingProcess){
		structureOfPage.editField[selectedItem].data = newValueAfterEvent(whichWay, structureOfPage.editField[selectedItem].data,
				                structureOfPage.editField[selectedItem].minValue, structureOfPage.editField[selectedItem].maxValue);

        if (selectedPage == ALL_DATA_PAGE)
            applyNewValuesOnCleanflightDataPage(whichWay);
#if (DATA_SETTING_FULL_VERSION)
        else
        	applyNewValuesOnTheCurrentPage();
#endif
	}
	else
		if (selectedItem != -1){
			structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
			if ((selectedLine > 1) && (selectedLine < 7))
				selectedLine -= whichWay;
			exitEditingProcess();
		}
}

static void processNextPrevEvent(int8_t whichWay)
{
#if (DATA_SETTING_FULL_VERSION)
    if ((selectedPage == RECEIVER_PAGE) && (selectedItem == 18)) {
    	structureOfPage.editField[19].data = newValueAfterEvent(whichWay, structureOfPage.editField[19].data, 0, (MAX_MAPPABLE_RX_INPUTS - 1));
		structureOfPage.editField[selectedItem].data = getChannelIndex();
    }
    else
#endif
		if ((selectedItem != -1) && (onGoingEditingProcess)){
			structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
			selectedItem = newValueAfterEvent(whichWay, selectedItem, firstItemOnLine(editionLine),
					       (firstItemOnLine(editionLine) + structureOfPage.displayLine[editionLine].itemsOnLine -1));
			structureOfPage.editField[selectedItem].color = PIXEL_INVERTED;
		}
}

static void processEventsForLineSelection(uint8_t commandID)
{
	uint8_t lastLine;
	switch(commandID) {
		case INC_COMMAND : {
			if (selectedLine > 1)
				selectedLine--;
		break;
		}
		case DEC_COMMAND : {
			if (selectedPage == SELECTION_PAGE)
				lastLine = bottomLineOnDisplay;
			else
				lastLine = DISPLAY_LINES-1;
			if (selectedLine < lastLine)
				selectedLine++;
		break;
		}
		case SET_COMMAND : {
			if (structureOfPage.displayLine[selectedLine].isActive){
			    editionLine = selectedLine ;
		        beeperConfirmationBeeps(1);
			}
		break;
		}
	}
}

static void processInterfaceOfThePage(uint8_t commandID)
{
	if (editionLine == -1){
	    processEventsForLineSelection(commandID);
		if (editionLine != -1){
			if (selectedPage == SELECTION_PAGE){
	            selectedPage = selectedLine + (whichOfPages * (DISPLAY_LINES-1));
	        	whichOfPages = 0;
	        	initializeTheNewSelectedPage();
			}
			else {
				selectedItem = firstItemOnLine(editionLine);
				structureOfPage.editField[selectedItem].color = PIXEL_INVERTED;
				onGoingEditingProcess = true;
#if (DATA_SETTING_FULL_VERSION)
				if ((selectedPage == RECEIVER_PAGE) && (selectedItem == 18)) {
	        		structureOfPage.editField[19].data = 0;
	        		getReceiverMapping();
					structureOfPage.editField[selectedItem].color = PIXEL_MIXED;
	        		structureOfPage.editField[selectedItem].data = getChannelIndex();
				}
#endif
			}
		}
		else
			exitEditingProcess();
	}
	else

	switch (commandID) {
		case INC_COMMAND : {
			processIncDecEvent(1);
		break;
		}
		case DEC_COMMAND : {
			processIncDecEvent(-1);
		break;
		}
		case NEXT_COMMAND : {
			processNextPrevEvent (1);
		break;
		}
		case PREV_COMMAND : {
			processNextPrevEvent (-1);
		break;
		}
		case SET_COMMAND : {
#if (DATA_SETTING_FULL_VERSION)
			if ((selectedItem == 21) && (selectedPage != MOTORS_PAGE)){
			    saveConfigAndNotify();
			    structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
				exitEditingProcess();
			}
			else {
				if ((selectedPage == RECEIVER_PAGE) && (selectedItem == 18)){
					if (structureOfPage.editField[selectedItem].color == PIXEL_INVERTED)
						structureOfPage.editField[selectedItem].color = PIXEL_MIXED;
					else {
						if (theRCMappingStringIsValid()){
							parseRcChannels(tempString, &masterConfig.rxConfig);
							structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
							exitEditingProcess();
						}
						else {
							structureOfPage.editField[selectedItem].color = PIXEL_INVERTED;
					        beeperConfirmationBeeps(2);
						}
					}
				}
				else
					if (onGoingEditingProcess){
						structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
						exitEditingProcess();
					}
			}
#else
			if (selectedItem == 21){
				saveConfigAndNotify();
				structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
				exitEditingProcess();
			}
			else
				if (onGoingEditingProcess){
					structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
					exitEditingProcess();
				}
#endif
		break;
		}
	}
}
//=======================  end of processing interface of the page  ========================

//=================================  process SelectedPage  ==================================
static void highlightSelectedLine(void)
{
	contentOfPage.lineOfText[selectedLine][0] = '>';
}

static void processSelectedPage(uint8_t commandID)
{
    if (shouldInitialiseThePage)
    	initializeTheNewSelectedPage();

	processInterfaceOfThePage(commandID);
 	updateValuesForThisPage();

 	prepareLinesOfTextForTheSelectedPage();

#if (DATA_SETTING_FULL_VERSION)
    if (selectedPage != FIRMWARE_PAGE)
    	highlightSelectedLine();
#else
    highlightSelectedLine();
#endif
}

//==============================  processing data Edition  =================================
void sendContentOfPageToDisplay(void)
{
	char tmpChar[CHARS_PER_LINE+1];

	if ((featureConfigured(FEATURE_DISPLAY)) && (onGoingDataEditingWithSticks)){
		for (int i = 0; i < 8; i++) {
			snprintf(tmpChar,CHARS_PER_LINE+1, contentOfPage.lineOfText[i]);
			tmpChar[CHARS_PER_LINE] = '\0';
			i2c_OLED_set_line(i);
			i2c_OLED_send_string(tmpChar);
			if (selectedItem != -1){
                if (i == structureOfPage.editField[selectedItem].line){
		            highlightItemOnOledDisplay(selectedItem);
                }
			}
		}
	}
}

void processDataEditing(uint8_t commandID)
{
	if (commandID == NO_COMMAND){
#if (DATA_SETTING_FULL_VERSION)
		if(selectedPage == MEASURES_PAGE){
			updateDataValue();
			highlightItemOnOledDisplay(3);
			prepareLinesOfTextForTheSelectedPage();
		}
#endif
		return;
	}

	if (!onGoingEditingProcess) {
		switch(commandID) {
			case NEXT_COMMAND : {
				if (whichOfPages < numberOfSecondaryPagesForThatPage) {
					whichOfPages++;
					shouldInitialiseThePage = true;
				}
			break;
			}
			case PREV_COMMAND : {
				if (whichOfPages > 0){
					whichOfPages--;
				}
				else {
					if (selectedPage == SELECTION_PAGE){
						return;
					}
					else {
#if (DATA_SETTING_FULL_VERSION)
						if (selectedPage == MOTORS_PAGE)
						    stopMotors();
						if (selectedPage == SERVOS_PAGE)
							stopAllServos();
#endif
						selectedPage = SELECTION_PAGE;
					}
				}
				shouldInitialiseThePage = true;
			break;
			}
        }
	}

    processSelectedPage(commandID);
}
//============================  end of processing data Edition  =============================
