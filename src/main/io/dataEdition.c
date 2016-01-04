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

#include "sensors/battery.h"

#include "io/beeper.h"
#include "io/escservo.h"
#include "io/gps.h"
#include "io/gimbal.h"
#include "io/rc_controls.h"
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

#include "io/dataEdition.h"
#include "telemetry/frsky.h"
#include "telemetry/hott.h"


typedef struct displayLine_s {
    bool isActive;			//true if any editable item is on the line
    uint8_t itemsOnLine;
} displayLine_s;

typedef struct displayActiveItem_s {
    uint8_t line;
    uint8_t leftPosition;
    uint8_t rightPosition;
    uint8_t color;			// 0: normal  -  1: inverted pixels - 2: mixed
    uint8_t data;
    uint8_t minValue;
    uint8_t maxValue;
    bool alive;
} displayActiveItem_s;

#define MAX_OF_EDITABLE_ITEMS     24    // default : 3 editable items per line  x 8 lines
typedef struct PAGE_DISPLAY_s {
	displayLine_s displayLine [DEFAULT_DISPLAY_LINES];
    displayActiveItem_s editField[MAX_OF_EDITABLE_ITEMS];
} page_display_t;

typedef struct PAGE_MESSAGE_s {
    char lineOfText [DEFAULT_DISPLAY_LINES] [DEFAULT_DISPLAY_COLUMNS];
} page_message_t;

static page_message_t contentOfPage;
static page_display_t structureOfPage;

extern unsigned char oledCharFormat;
extern void cliSetVar(const clivalue_t *var, const int_float_value_t value);

#define OLED_DISPLAY		    1
#define DISPLAY_LINES_MINUS1	7
#define DISPLAY_LINES_MINUS2	6
#define CHARS_PER_LINE		    21
#define THREE_ITEMS_PER_LINE	3

static uint8_t 	bottomLineOnDisplay;
static uint8_t 	numberOfSecondaryPagesForThatPage = 0;
static uint8_t  positionInLineOfInvertedChar = 0;
static uint8_t 	whichOfPages 	= 0;
static uint8_t	selectedPage	= SELECTION_PAGE;
static uint8_t	selectedLine	= 1;
static int8_t	editionLine		= -1;
static int8_t	selectedItem 	= -1;

static bool shouldInitialiseThePage 	= true;
static bool onGoingEditionProcess 		= false;

static char tempString[10];

extern const clivalue_t valueTable[];
extern uint8_t numberOfRecordsInCLITable ;
static uint8_t numberOfElementsInList;
static int32_t valueInteger = 0;
static float valueFloat = 0;

#if (DATA_EDITION_FULL_VERSION)
extern uint16_t rssi;
static uint32_t lastAlarmSoundTime;
static bool isAlarmSoundOn 		= true;
extern uint8_t numberOfBaudrateValues ;
extern uint8_t motorCount;
extern uint8_t servoCount;
#endif

//======================================  Utilities  =======================================
void initialiseOledDisplayPage(void)
{
    memset(&structureOfPage, 0, sizeof(structureOfPage));
}

void initDataEditionStructures(void)    // called in main
{
#ifdef DISPLAY
    if (featureConfigured(FEATURE_DISPLAY)) {
    initialiseOledDisplayPage();
    }
#endif
	onGoingDataEditionWithSticks = false;
}

static void initializeEditionModeSpace(void)
{
	for (int i = 0; i < DEFAULT_DISPLAY_LINES; i++) {
		structureOfPage.displayLine[i].isActive = false;
		structureOfPage.displayLine[i].itemsOnLine = 1;
	}
	for (int i = 0; i < MAX_OF_EDITABLE_ITEMS; i++)
		structureOfPage.editField[i].alive = false;

	selectedLine = 1;
	editionLine = -1;
    selectedItem = -1;
    shouldInitialiseThePage = false;
	onGoingEditionProcess = false;
	numberOfSecondaryPagesForThatPage = 0;
}

static uint8_t firstItemOnLine(uint8_t line)
{
    return line * THREE_ITEMS_PER_LINE;
}

static void highlightSelectedItemOnOledDisplay(void)
{
	switch (structureOfPage.editField[selectedItem].color){
		case PIXEL_MIXED :
			oledCharFormat = INVERSE_CHAR_FORMAT;
			i2c_OLED_set_xy(positionInLineOfInvertedChar, editionLine);
			i2c_OLED_send_char(contentOfPage.lineOfText[editionLine][positionInLineOfInvertedChar]);
			break;
		case PIXEL_INVERTED :
			if (structureOfPage.editField[selectedItem].color == PIXEL_INVERTED) {
				oledCharFormat = INVERSE_CHAR_FORMAT;
				for(int i = structureOfPage.editField[selectedItem].leftPosition; i <= structureOfPage.editField[selectedItem].rightPosition; i++){
					i2c_OLED_set_xy(i, editionLine);
					i2c_OLED_send_char(contentOfPage.lineOfText[editionLine][i]);
				}
			}
			break;
	}
	oledCharFormat = NORMAL_CHAR_FORMAT;
}

static void completeStringWithSpaces(uint8_t lineIndex)
{
    uint8_t length = strlen(contentOfPage.lineOfText[lineIndex]);

    while (length < sizeof(contentOfPage.lineOfText[lineIndex]))
    	contentOfPage.lineOfText[lineIndex][length++] = 0x20;
}


#if (DATA_EDITION_FULL_VERSION)
static bool shouldTriggerAlarmNow(void)
{
	return ((millis() - lastAlarmSoundTime) >= (uint32_t)(masterConfig.telemetryConfig.hottAlarmSoundInterval * MILLISECONDS_IN_A_SECOND));
}

static bool isBatteryLevelOK(void)
{
	if ((featureConfigured(FEATURE_VBAT)) && (getBatteryState() != BATTERY_OK))
		return false;
	return true;
}

static bool isRssiLevelOK(void)
{
	if (((masterConfig.rxConfig.rssi_channel > 0) || (featureConfigured(FEATURE_RSSI_ADC))) && (rssi <= masterConfig.rxConfig.rssi_warningLevel))
	    return false;
	return true;
}

static void checkForBatteryAndRSSIWarningLevels(void)
{
    if (isAlarmSoundOn && shouldTriggerAlarmNow()){
    	lastAlarmSoundTime = millis();
	}
}

static uint8_t numberOfActiveDisplayLinesForMotorsPlusOne(void)
{
	return (1 + ceil((float)motorCount / (THREE_ITEMS_PER_LINE - 1)));
}

static void stopAllMotors(void)
{
	for (int index = 0; index < motorCount; index++)
        motor_disarmed[index] = masterConfig.escAndServoConfig.mincommand;
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
	for (int i = 0; i < 8; i++)
		for (int j = i + 1; j < 8; j++)
			if (tempString[i] == tempString[j])
				return false;
	return true;
}
#endif
//=================================  end of Utilities  ===================================

//======================  initialization of active/editable items  =======================
static void defineActiveItem(uint8_t item, uint8_t leftPosition,
                             uint8_t rightPosition, uint8_t minValue, uint8_t maxValue)
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

#if (DATA_EDITION_FULL_VERSION)
static void defineThreeItemsOnLine(uint8_t line, uint8_t leftLeftPosition, uint8_t interval,
							       uint8_t field_width_minus1, uint8_t minValue, uint8_t maxValue)
{
	uint8_t i, leftPosition;

	for (i = 0; i < THREE_ITEMS_PER_LINE; i++){
		leftPosition = leftLeftPosition + i * (interval + field_width_minus1);
        defineActiveItem (firstItemOnLine(line) + i, leftPosition, leftPosition
        		          + field_width_minus1, minValue, maxValue);
        structureOfPage.displayLine[line].itemsOnLine = 3;
	}
}
#endif

static void initialiseItemsForThatPage(uint8_t numberOfDisplayLines)
{
	numberOfSecondaryPagesForThatPage = ceil((float)numberOfElementsInList / numberOfDisplayLines) - 1;

	if ((whichOfPages == 0) && (numberOfElementsInList <= numberOfDisplayLines)){
		bottomLineOnDisplay = numberOfElementsInList;
	}
	else {
		if (whichOfPages != numberOfSecondaryPagesForThatPage)
			bottomLineOnDisplay = numberOfDisplayLines;
		else
			bottomLineOnDisplay = (numberOfElementsInList - (numberOfDisplayLines * numberOfSecondaryPagesForThatPage));
    }
	for (int i = 1; i <= bottomLineOnDisplay; i++)
		defineOnOffItem(firstItemOnLine(i), 19, 19);
}

static void initializeItemsOfTheSelectedPage(void)
{
#if (DATA_EDITION_FULL_VERSION)
	uint8_t line;
#endif

    defineActiveItem (21, 8, 11, 0, 0);    // item "save"

	switch (selectedPage){
		case SELECTION_PAGE : {
			numberOfElementsInList = sizeof(pageNames) / sizeof(char *);
			initialiseItemsForThatPage(DISPLAY_LINES_MINUS1);
			for (int i = 0; i == MAX_OF_EDITABLE_ITEMS; i++)
				structureOfPage.editField[i].alive = false;
		    return;
		}
		case ALL_DATA_PAGE : {
			defineActiveItem(3, 9, 11, 0, numberOfRecordsInCLITable - 1);
			defineActiveItem (6, 1, 20, 0, numberOfRecordsInCLITable - 1);
			structureOfPage.displayLine[2].isActive = false;
			defineActiveItem (9, 9, 17, 0, 1);
            break;
		}
#if (DATA_EDITION_FULL_VERSION)
		case FEATURES_PAGE : {
			numberOfElementsInList = sizeof(featureNames) / sizeof(char *) - 1;
			initialiseItemsForThatPage(DISPLAY_LINES_MINUS2);
			break;
		}
        case MEASURES_PAGE : {
            defineActiveItem(3, 14, 19, 0, 100);
        	structureOfPage.displayLine[1].isActive = false;
            defineActiveItem (12, 15, 19, 0, 100);
        	structureOfPage.displayLine[3].isActive = false;
            defineOnOffItem(15, 19, 19);
            defineActiveItem (18, 15, 17, 0, 120);
		    break;
		}
		case BATTERY_PAGE : {
			defineOnOffItem(3, 19, 19);
			for (line = 2; line <= 4; line++)
				defineActiveItem (firstItemOnLine(line), 17, 19, 30, 50);
			defineActiveItem (15, 17, 19, VBAT_SCALE_MIN, VBAT_SCALE_MAX);
			break;
		}
		case CURRENTMETER_PAGE : {
			for (line = 2; line <= 3; line++)
				defineActiveItem (firstItemOnLine(line), 16, 19, 0, 250);
			defineOnOffItem(3, 19, 19);
			defineOnOffItem(7, 15, 15);
			structureOfPage.displayLine[2].itemsOnLine = 2;
			defineOnOffItem(12, 19, 19);
			defineActiveItem (15, 13, 19, 0, sizeof(lookupTableCurrentSensor) / sizeof(char *) - 1);
			break;
		}
		case ESCMOTORS_PAGE : {
			for (line = 1; line <= 2; line++)
				defineOnOffItem(firstItemOnLine(line), 19, 19);
			for (line = 3; line <= 6; line++)
				defineActiveItem (firstItemOnLine(line), 16, 19, 90, 200);
			break;
		}
	    case PIDCONTROLLER_PAGE : {
			numberOfElementsInList = sizeof(lookupTablePidController) / sizeof(char *);
	    	initialiseItemsForThatPage(DISPLAY_LINES_MINUS2);
		    break;
	    }
	    case PID_PROFILE_PAGE : {
			defineActiveItem (3, 10, 10, 0, MAX_PROFILE_COUNT - 1);
			for (line = 3; line <= 5; line++)
				defineThreeItemsOnLine (line, 7, 2, 2, 0, 200);
		    break;
	    }
	    case RATE_PROFILE_PAGE : {
			defineActiveItem (3, 10, 10, 0, MAX_CONTROL_RATE_PROFILE_COUNT - 1);
			defineThreeItemsOnLine (3, 7, 2, 2, 0, 100);
			defineActiveItem (15, 11, 13, 0, 100);
			defineActiveItem (18, 10, 13, 100, 200);
		    break;
	    }
		case GPS_PAGE : {
#ifdef GPS
			defineOnOffItem(3, 19, 19);
			defineActiveItem (6, 15, 19, 0, sizeof(lookupTableGPSProvider) / sizeof(char *) - 1);
			defineActiveItem (9, 14, 19, 0, numberOfBaudrateValues - 1);
			defineActiveItem (12, 15, 19, 0, sizeof(lookupTableGPSSBASMode) / sizeof(char *) - 1);
			defineOnOffItem(15, 12, 12);
			defineActiveItem (16, 13, 15, 0, 180);
			defineActiveItem (17, 17, 18, 0, 59);
			structureOfPage.displayLine[5].itemsOnLine = 3;
#endif
			break;
		}
		case RECEIVER_PAGE : {
			for (line = 1; line <= 4; line++)
				defineActiveItem(firstItemOnLine(line), 17, 19, 0, 200);
			defineActiveItem (15, 18, 19, 0, 15);
			defineActiveItem (18, 12, 19, 0, MAX_MAPPABLE_RX_INPUTS - 1);
			getReceiverMapping();
			break;
		}
        case MOTORS_PAGE : {
        	int motorLines = numberOfActiveDisplayLinesForMotorsPlusOne();
			for (line = 1; line < motorLines; line++) {
	            defineOnOffItem(firstItemOnLine(line), 7, 7);
	            defineOnOffItem(firstItemOnLine(line)+1, 15, 15);
				structureOfPage.displayLine[line].itemsOnLine = 2;
			}
            defineOnOffItem(18, 19, 19);
			defineActiveItem (21, 13, 16, 100, 200);
	    	structureOfPage.editField[21].data = masterConfig.escAndServoConfig.mincommand / 10;
	        break;
	    }
	    case SERVOS_PAGE : {
			if (servoCount != 0) {
				defineActiveItem (3, 8, 8, 0, MAX_SUPPORTED_SERVOS - 1);
				defineActiveItem (6, 6, 9, 100, 200);
				defineActiveItem (7, 16, 19, 100, 200);
				structureOfPage.displayLine[2].itemsOnLine = 2;
				defineActiveItem (9, 6, 9, 100, 200);
	            defineOnOffItem(10, 16, 16);
				defineActiveItem (11, 17, 19, 0, 100);
				structureOfPage.displayLine[3].itemsOnLine = 3;
				defineActiveItem (12, 17, 19, 0, 16);
	            defineOnOffItem(15, 19, 19);
				defineActiveItem (18, 13, 16, 100, 200);
				structureOfPage.editField[3].data = 0;
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

#if (DATA_EDITION_FULL_VERSION)
static void updatePIDValuesForThatProfile(void)
{
	for (int line = 3; line <= 5; line++){
		structureOfPage.editField[firstItemOnLine(line)].data = masterConfig.profile[structureOfPage.editField[3].data].pidProfile.P8[line-3];
		structureOfPage.editField[firstItemOnLine(line)+1].data = masterConfig.profile[structureOfPage.editField[3].data].pidProfile.I8[line-3];
		structureOfPage.editField[firstItemOnLine(line)+2].data = masterConfig.profile[structureOfPage.editField[3].data].pidProfile.D8[line-3];
	}
}

static void updateRateValuesForThatProfile(void)
{
	structureOfPage.editField[9].data = masterConfig.controlRateProfiles[structureOfPage.editField[3].data].rates[FD_ROLL];
	structureOfPage.editField[10].data = masterConfig.controlRateProfiles[structureOfPage.editField[3].data].rates[FD_PITCH];
	structureOfPage.editField[11].data = masterConfig.controlRateProfiles[structureOfPage.editField[3].data].rates[FD_YAW];
	structureOfPage.editField[15].data = masterConfig.controlRateProfiles[structureOfPage.editField[3].data].dynThrPID;
	structureOfPage.editField[18].data = masterConfig.controlRateProfiles[structureOfPage.editField[3].data].tpa_breakpoint / 10;
}

static void updateValuesForThatServo(void)
{
    structureOfPage.editField[6].data = currentProfile->servoConf[structureOfPage.editField[3].data].min / 10;
    structureOfPage.editField[7].data = currentProfile->servoConf[structureOfPage.editField[3].data].max / 10;
    structureOfPage.editField[9].data = currentProfile->servoConf[structureOfPage.editField[3].data].middle / 10;
    structureOfPage.editField[10].data = (currentProfile->servoConf[structureOfPage.editField[3].data].rate > 0);
    structureOfPage.editField[11].data = abs(currentProfile->servoConf[structureOfPage.editField[3].data].rate);
    if (currentProfile->servoConf[structureOfPage.editField[3].data].forwardFromChannel == (int8_t)CHANNEL_FORWARDING_DISABLED)
        structureOfPage.editField[12].data = 16;
    structureOfPage.editField[18].data = servo[structureOfPage.editField[3].data] / 10;
}
#endif

static void updateValuesForThatPage(void)
{
	switch (selectedPage){
		case ALL_DATA_PAGE : {
			updateDataValue();
			break;
		}
#if (DATA_EDITION_FULL_VERSION)
		case FEATURES_PAGE : {
			for (int line = 0; line < bottomLineOnDisplay; line++){
				int index = whichOfPages * DISPLAY_LINES_MINUS2 + (line);
				structureOfPage.editField[firstItemOnLine(line+1)].data = ((featureMask() & (1 << index)) != 0);
			}
			break;
		}
        case MEASURES_PAGE : {
        	structureOfPage.editField[3].color = !isBatteryLevelOK();
        	structureOfPage.editField[12].color = !isRssiLevelOK();
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
			structureOfPage.editField[6].data = abs(masterConfig.batteryConfig.currentMeterScale) / 10;
			structureOfPage.editField[7].data = (masterConfig.batteryConfig.currentMeterScale >= 0);
			structureOfPage.editField[9].data = masterConfig.batteryConfig.currentMeterOffset / 10;
			structureOfPage.editField[12].data = masterConfig.batteryConfig.multiwiiCurrentMeterOutput;
			structureOfPage.editField[15].data = masterConfig.batteryConfig.currentMeterType;
			break;
		}
		case ESCMOTORS_PAGE : {
			structureOfPage.editField[3].data = featureConfigured(FEATURE_MOTOR_STOP);
			structureOfPage.editField[6].data = featureConfigured(FEATURE_ONESHOT125);
			structureOfPage.editField[9].data = masterConfig.escAndServoConfig.minthrottle / 10;
			structureOfPage.editField[12].data = masterConfig.escAndServoConfig.servoCenterPulse / 10;
			structureOfPage.editField[15].data = masterConfig.escAndServoConfig.maxthrottle / 10;
			structureOfPage.editField[18].data = masterConfig.escAndServoConfig.mincommand / 10;
			break;
		}
	    case PIDCONTROLLER_PAGE : {
	    	pidProfile_t *pidProfileConfig = &masterConfig.profile[getCurrentProfile()].pidProfile;
	        structureOfPage.editField[firstItemOnLine(pidProfileConfig->pidController + 1)].data = 1;
		    break;
	    }
	    case PID_PROFILE_PAGE : {
	    	structureOfPage.editField[3].data = getCurrentProfile();
	    	updatePIDValuesForThatProfile();
		    break;
	    }
	    case RATE_PROFILE_PAGE : {
	    	structureOfPage.editField[17].data = getCurrentControlRateProfile();
	    	updateRateValuesForThatProfile();
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
			structureOfPage.editField[6].data = masterConfig.controlRateProfiles[index].thrExpo8;
			structureOfPage.editField[9].data = masterConfig.controlRateProfiles[index].rcRate8;
			structureOfPage.editField[12].data = masterConfig.controlRateProfiles[index].rcExpo8;
			structureOfPage.editField[15].data = masterConfig.rxConfig.rssi_channel;
			break;
		}
	    case SERVOS_PAGE : {
	    	updateValuesForThatServo();
			break;
	    }
#endif
	}
}
//=========================================================================================

//=======================  apply new values to running Cleanflight  =======================
static void applyNewValuesOnCleanflightDataPage(int8_t whichWay)
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
					valueFloat = constrainf((valueFloat + (whichWay * 0.001f)), valueTable[structureOfPage.editField[3].data].config.minmax.min, valueTable[structureOfPage.editField[3].data].config.minmax.max);
					tmp.float_value = valueFloat;
				}
				else {
					valueInteger = constrain((valueInteger + whichWay), valueTable[structureOfPage.editField[3].data].config.minmax.min, valueTable[structureOfPage.editField[3].data].config.minmax.max);
					tmp.int_value = valueInteger;
				}
			}
			cliSetVar(&valueTable[structureOfPage.editField[3].data], tmp);
			break;
		}
	}
}

#if (DATA_EDITION_FULL_VERSION)
static void testAndPositionThatBit(uint8_t testValue, uint32_t bitMask)
{
	if (testValue == 1)
	    featureSet(bitMask);
	else
	    featureClear(bitMask);
}

static void applyNewValuesOnThatPage(void)
{
	uint8_t item, index;

    switch (selectedPage){
	    case FEATURES_PAGE : {
	        index = (whichOfPages * DISPLAY_LINES_MINUS2) + (selectedLine-1);
	    	testAndPositionThatBit(structureOfPage.editField[selectedItem].data, (1 << index));
	        break;
	    }
        case MEASURES_PAGE : {
        	isAlarmSoundOn = structureOfPage.editField[15].data;
        	masterConfig.telemetryConfig.hottAlarmSoundInterval = structureOfPage.editField[18].data;
		    break;
		}
        case BATTERY_PAGE : {
	    	testAndPositionThatBit(structureOfPage.editField[3].data, FEATURE_VBAT);
			masterConfig.batteryConfig.vbatmincellvoltage = structureOfPage.editField[6].data;
			masterConfig.batteryConfig.vbatmaxcellvoltage = structureOfPage.editField[9].data;
			masterConfig.batteryConfig.vbatwarningcellvoltage = structureOfPage.editField[12].data;
			masterConfig.batteryConfig.vbatscale = structureOfPage.editField[15].data;

			batteryWarningVoltage = batteryCellCount * masterConfig.batteryConfig.vbatwarningcellvoltage;
			batteryCriticalVoltage = batteryCellCount * masterConfig.batteryConfig.vbatmincellvoltage;
		    break;
		}
        case CURRENTMETER_PAGE : {
	    	testAndPositionThatBit(structureOfPage.editField[3].data, FEATURE_CURRENT_METER);
        	masterConfig.batteryConfig.currentMeterScale = 10 * (2 * structureOfPage.editField[7].data - 1)
        			                                       * structureOfPage.editField[6].data;
        	masterConfig.batteryConfig.currentMeterOffset = 10 * structureOfPage.editField[9].data;
        	masterConfig.batteryConfig.multiwiiCurrentMeterOutput = structureOfPage.editField[12].data;
        	masterConfig.batteryConfig.currentMeterType = structureOfPage.editField[15].data;
		    break;
		}
        case ESCMOTORS_PAGE : {
	    	testAndPositionThatBit(structureOfPage.editField[3].data, FEATURE_MOTOR_STOP);
	    	testAndPositionThatBit(structureOfPage.editField[6].data, FEATURE_ONESHOT125);
			masterConfig.escAndServoConfig.minthrottle = (structureOfPage.editField[9].data * 10);
			masterConfig.escAndServoConfig.servoCenterPulse = (structureOfPage.editField[12].data * 10);
			masterConfig.escAndServoConfig.maxthrottle = (structureOfPage.editField[15].data * 10);
			masterConfig.escAndServoConfig.mincommand = (structureOfPage.editField[18].data * 10);
		    break;
		}
	    case PIDCONTROLLER_PAGE : {
	    	index = getCurrentProfile();
	    	index = firstItemOnLine(masterConfig.profile[index].pidProfile.pidController + 1);
	    	structureOfPage.editField[index].data = 0;
	    	masterConfig.profile[getCurrentProfile()].pidProfile.pidController = selectedLine - 1;
		    break;
	    }
	    case PID_PROFILE_PAGE : {
			if (selectedItem == 3) {
				setCurrentPIDprofileConfig(structureOfPage.editField[3].data);
				updatePIDValuesForThatProfile();
			}
			else {
				index = structureOfPage.editField[3].data;
				masterConfig.profile[index].pidProfile.P8[ROLL] = structureOfPage.editField[9].data;
				masterConfig.profile[index].pidProfile.I8[ROLL] = structureOfPage.editField[10].data;
				masterConfig.profile[index].pidProfile.D8[ROLL] = structureOfPage.editField[11].data;
				masterConfig.profile[index].pidProfile.P8[PITCH] = structureOfPage.editField[12].data;
				masterConfig.profile[index].pidProfile.I8[PITCH] = structureOfPage.editField[13].data;
				masterConfig.profile[index].pidProfile.D8[PITCH] = structureOfPage.editField[14].data;
				masterConfig.profile[index].pidProfile.P8[YAW] = structureOfPage.editField[15].data;
				masterConfig.profile[index].pidProfile.I8[YAW] = structureOfPage.editField[16].data;
				masterConfig.profile[index].pidProfile.D8[YAW] = structureOfPage.editField[17].data;
			}
		    break;
	    }
	    case RATE_PROFILE_PAGE : {
			if (selectedItem == 3) {
				setControlRateProfile(structureOfPage.editField[3].data);
				updateRateValuesForThatProfile();
			}
			else {
				index = structureOfPage.editField[3].data;
				masterConfig.controlRateProfiles[index].rates[FD_ROLL] = structureOfPage.editField[9].data;
				masterConfig.controlRateProfiles[index].rates[FD_PITCH] = structureOfPage.editField[10].data;
				masterConfig.controlRateProfiles[index].rates[FD_YAW] = structureOfPage.editField[11].data;
				masterConfig.controlRateProfiles[index].dynThrPID = structureOfPage.editField[15].data;
				masterConfig.controlRateProfiles[index].tpa_breakpoint = structureOfPage.editField[18].data * 10;
			}
		    break;
	    }
	    case GPS_PAGE : {
#ifdef GPS
	    	testAndPositionThatBit(structureOfPage.editField[3].data, FEATURE_GPS);
	    	masterConfig.gpsConfig.provider = structureOfPage.editField[6].data;
	    	gpsData.baudrateIndex = structureOfPage.editField[9].data;
	    	masterConfig.gpsConfig.sbasMode = structureOfPage.editField[12].data;

            index = getCurrentProfile();
	    	masterConfig.profile[index].mag_declination = structureOfPage.editField[16].data * 100
	    			                                      + structureOfPage.editField[17].data;
	    	if (masterConfig.profile[index].mag_declination > 18000)
	    		masterConfig.profile[index].mag_declination = 18000;
	    	masterConfig.profile[index].mag_declination = (2 * structureOfPage.editField[15].data -1)
	    			                                      * masterConfig.profile[index].mag_declination;
#endif
	    	break;
	    }
	    case RECEIVER_PAGE : {
			if (selectedItem == 18)
				tempString[structureOfPage.editField[19].data] = rcChannelLetters[structureOfPage.editField[18].data];
			else {
				index = getCurrentControlRateProfile();
				masterConfig.controlRateProfiles[index].thrMid8 = structureOfPage.editField[3].data;
				masterConfig.controlRateProfiles[index].thrExpo8 = structureOfPage.editField[6].data;
				masterConfig.controlRateProfiles[index].rcRate8 = structureOfPage.editField[9].data;
				masterConfig.controlRateProfiles[index].rcExpo8 = structureOfPage.editField[12].data;
				masterConfig.rxConfig.rssi_channel = structureOfPage.editField[15].data;
			}
		break;
	    }
        case MOTORS_PAGE : {
        	for (index = 0; index < motorCount; index++) {
        		item = (THREE_ITEMS_PER_LINE + (index / (THREE_ITEMS_PER_LINE - 1)) * THREE_ITEMS_PER_LINE
        				+ index % (THREE_ITEMS_PER_LINE - 1));
            	if (structureOfPage.editField[item].data && structureOfPage.editField[18].data)
            		motor_disarmed[index] = structureOfPage.editField[21].data * 10;
            	else
            		motor_disarmed[index] = masterConfig.escAndServoConfig.mincommand;
        	}
	        break;
	    }
	    case SERVOS_PAGE : {
			if (selectedItem == 3)
				updateValuesForThatServo();
			else {
				index = structureOfPage.editField[3].data;
				currentProfile->servoConf[index].min = structureOfPage.editField[6].data * 10;
				currentProfile->servoConf[index].max = structureOfPage.editField[7].data * 10;
				currentProfile->servoConf[index].middle = structureOfPage.editField[9].data * 10;
				currentProfile->servoConf[index].rate = (2 * structureOfPage.editField[10].data - 1)
						                                * structureOfPage.editField[11].data;
				if (structureOfPage.editField[12].data == 16)
					currentProfile->servoConf[index].forwardFromChannel = (int8_t)CHANNEL_FORWARDING_DISABLED;
				else
					currentProfile->servoConf[index].forwardFromChannel = structureOfPage.editField[12].data;
				if (structureOfPage.editField[15].data)
					servo[index] = structureOfPage.editField[18].data * 10;
				else
					servo[index] = currentProfile->servoConf[index].middle;
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
	    snprintf(contentOfPage.lineOfText[0],CHARS_PER_LINE, staticSharedLines[0]);

	completeStringWithSpaces(0);
	contentOfPage.lineOfText[0][DEFAULT_DISPLAY_COLUMNS - 2] = 0x3C;
	if (whichOfPages < numberOfSecondaryPagesForThatPage)
		contentOfPage.lineOfText[0][DEFAULT_DISPLAY_COLUMNS - 1] = 0x3E;
}

static void includeEmptyLine(uint8_t line)
{
	for (int i = 0; i < 21; i++)
		contentOfPage.lineOfText[line][i] = 0x20;
}

static void prepareMessageForThatList(char *listOfItems[], uint8_t numberOfLinesPerPage)
{
	uint8_t line;

	for (line = 1; line <= bottomLineOnDisplay; line++){
		strcpy(contentOfPage.lineOfText[line], " ");
		strcat(contentOfPage.lineOfText[line], listOfItems[whichOfPages * numberOfLinesPerPage + (line - 1)]);
		completeStringWithSpaces(line);
	}

	for (line = (bottomLineOnDisplay + 1); line < (numberOfLinesPerPage + 1); line++)
		includeEmptyLine(line);
}

#if (DATA_EDITION_FULL_VERSION)
static char charForSelectionBox(uint8_t currentValue)
{
	return (0x58 * currentValue + 0x2D * (1 - currentValue));
}

static void includeCommandLines(void)
{
	uint8_t i;

	i = (DISPLAY_LINES_MINUS1 - 2) + (selectedPage - SERVOS_PAGE) / (MOTORS_PAGE - SERVOS_PAGE);
	snprintf(contentOfPage.lineOfText[i],CHARS_PER_LINE, staticMotorsPage[4],
			                        charForSelectionBox(structureOfPage.editField[i * 3].data));
	snprintf(contentOfPage.lineOfText[i + 1],CHARS_PER_LINE, staticMotorsPage[5],
			                        structureOfPage.editField[(i+1) * 3].data * 10);
}

static void includeLineWithItemSave(void)
{
	snprintf(contentOfPage.lineOfText[7], CHARS_PER_LINE, staticSharedLines[1]);
}

static void prepareThatPage(char *listOfItems[], uint8_t numberOfLinesPerPage)
{
	prepareMessageForThatList(listOfItems, numberOfLinesPerPage);
	for (int line = 1; line <= bottomLineOnDisplay; line++)
	    contentOfPage.lineOfText[line][19] = charForSelectionBox(structureOfPage.editField[firstItemOnLine(line)].data);
	includeLineWithItemSave();
}
#endif

static void prepareLinesOfTextForThatPage(void)
{
    includeTitleLine();
	snprintf(contentOfPage.lineOfText[7], CHARS_PER_LINE, staticSharedLines[1]);

	int32_t miniValue, maxiValue;

    switch (selectedPage){
		case SELECTION_PAGE :{
			prepareMessageForThatList((char**)pageNames, DISPLAY_LINES_MINUS1);
			break;
		}
		case ALL_DATA_PAGE : {
			snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, staticDataPage[1], structureOfPage.editField[3].data);
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, staticDataPage[2], valueTable[structureOfPage.editField[3].data].name);
			snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, staticDataPage[3], tempString);
			if ((valueTable[structureOfPage.editField[3].data].type & VALUE_MODE_MASK) == MODE_LOOKUP){
				miniValue = structureOfPage.editField[9].minValue;
				maxiValue = structureOfPage.editField[9].maxValue;
			}
			else {
				miniValue = valueTable[structureOfPage.editField[3].data].config.minmax.min;
				maxiValue = valueTable[structureOfPage.editField[3].data].config.minmax.max;
			}
			snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, staticDataPage[4], miniValue);
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, staticDataPage[5], maxiValue);
			includeEmptyLine(6);
			break;
		}
#if (DATA_EDITION_FULL_VERSION)
        case FIRMWARE_PAGE : {
			snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, staticFirmwarePage[0], targetName);
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, staticFirmwarePage[1], FC_VERSION_STRING);
			snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, staticFirmwarePage[2], buildDate);
			snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, staticFirmwarePage[3], buildTime);
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, staticFirmwarePage[4], shortGitRevision);
			includeEmptyLine(6);
			snprintf(contentOfPage.lineOfText[7],CHARS_PER_LINE, staticFirmwarePage[6], mixerNames[masterConfig.mixerMode - 1]);
	        break;
        }
	    case FEATURES_PAGE : {
			prepareThatPage((char**)featureNames, DISPLAY_LINES_MINUS2);
	        break;
	    }
        case MEASURES_PAGE : {
			snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, staticMeasuresPage[0], batteryCellCount, vbat/10, vbat%10);
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, staticMeasuresPage[1], amperage/100, amperage%100);
			snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, staticMeasuresPage[2], mAhDrawn);
			snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, staticMeasuresPage[3], rssi/10);
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, staticMeasuresPage[4], charForSelectionBox(structureOfPage.editField[15].data));
			snprintf(contentOfPage.lineOfText[6],CHARS_PER_LINE, staticMeasuresPage[5], structureOfPage.editField[18].data);
			break;
		}
        case BATTERY_PAGE : {
			snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, staticBatteryPage[0], charForSelectionBox(structureOfPage.editField[3].data));
			for (int i = 2; i < 5; i++)
				snprintf(contentOfPage.lineOfText[i],CHARS_PER_LINE, staticBatteryPage[i-1], structureOfPage.editField[i*3].data/10, structureOfPage.editField[i*3].data%10);
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, staticBatteryPage[4], structureOfPage.editField[15].data);
            includeEmptyLine(6);
			break;
		}
        case CURRENTMETER_PAGE : {
			snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, staticCurrentMeterPage[0], charForSelectionBox(structureOfPage.editField[3].data));
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, staticCurrentMeterPage[1], (0x2B * structureOfPage.editField[7].data + 0x2D * (1 - structureOfPage.editField[7].data)), structureOfPage.editField[6].data * 10);
			snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, staticCurrentMeterPage[2], structureOfPage.editField[9].data * 10);
			snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, staticCurrentMeterPage[3], charForSelectionBox(structureOfPage.editField[12].data));
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, staticCurrentMeterPage[4], lookupTableCurrentSensor[structureOfPage.editField[15].data]);
			includeEmptyLine(6);
			break;
		}
        case ESCMOTORS_PAGE : {
        	snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, staticEscMotorsPage[0], charForSelectionBox(structureOfPage.editField[3].data));
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, staticEscMotorsPage[1], charForSelectionBox(structureOfPage.editField[6].data));
			for (int i = 3; i < 7; i++)
			    snprintf(contentOfPage.lineOfText[i],CHARS_PER_LINE, staticEscMotorsPage[i-1], (uint16_t) structureOfPage.editField[i*3].data * 10);
		    break;
		}
	    case PIDCONTROLLER_PAGE : {
			prepareThatPage((char**)lookupTablePidController, DISPLAY_LINES_MINUS2);
			break;
	    }
	    case PID_PROFILE_PAGE : {
	    	snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, staticPIDprofilePage[0], structureOfPage.editField[3].data);
	    	snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, staticPIDprofilePage[1]);
	    	for (int i = 3; i < 6; i++){
	    		int j = i * 3;
		    	snprintf(contentOfPage.lineOfText[i],CHARS_PER_LINE, staticPIDprofilePage[i-1], structureOfPage.editField[j].data, structureOfPage.editField[j+1].data, structureOfPage.editField[j+2].data);
	    	}
	    	includeEmptyLine(6);
	    	break;
	    }
	    case RATE_PROFILE_PAGE : {
	    	snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, staticRateprofilePage[0], structureOfPage.editField[3].data);
	    	snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, staticRateprofilePage[1]);
	    	snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, staticRateprofilePage[2], structureOfPage.editField[9].data, structureOfPage.editField[10].data, structureOfPage.editField[11].data);
			includeEmptyLine(4);
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, staticRateprofilePage[4], structureOfPage.editField[15].data);
	    	snprintf(contentOfPage.lineOfText[6],CHARS_PER_LINE, staticRateprofilePage[5], structureOfPage.editField[18].data * 10);
	    	break;
	    }
	    case GPS_PAGE : {
#ifdef GPS
	    	snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, staticGPSPage[0], charForSelectionBox(structureOfPage.editField[3].data));
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, staticGPSPage[1], lookupTableGPSProvider[structureOfPage.editField[6].data]);
			snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, staticGPSPage[2], baudRates[structureOfPage.editField[9].data]);
			snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, staticGPSPage[3], lookupTableGPSSBASMode[structureOfPage.editField[12].data]);
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, staticGPSPage[4], (0x2B * structureOfPage.editField[15].data + 0x2D * (1 - structureOfPage.editField[15].data)),
																	structureOfPage.editField[16].data, structureOfPage.editField[17].data);
			includeEmptyLine(6);
#endif
			break;
	    }
        case RECEIVER_PAGE : {
        	for (int i = 1; i < 6; i++)
    			snprintf(contentOfPage.lineOfText[i],CHARS_PER_LINE, staticReceiverPage[i-1], structureOfPage.editField[i*3].data);

			snprintf(contentOfPage.lineOfText[6],CHARS_PER_LINE, staticReceiverPage[5], tempString);
			if (structureOfPage.editField[18].color == PIXEL_MIXED){
				positionInLineOfInvertedChar = structureOfPage.editField[19].data + structureOfPage.editField[18].leftPosition;
			}
			break;
		}
        case MOTORS_PAGE : {
        	for (int i = 0; i < 4; i++)
    			snprintf(contentOfPage.lineOfText[i+1],CHARS_PER_LINE, staticMotorsPage[i], motor[2*i], motor[2*i + 1]);
			includeEmptyLine(5);
			includeCommandLines();
        	int motorLines = numberOfActiveDisplayLinesForMotorsPlusOne();
			for (int i = 1; i < motorLines; i++) {
				contentOfPage.lineOfText[i][7] = (0x3A * structureOfPage.editField[firstItemOnLine(i)].data + 0x2D * (1 - structureOfPage.editField[firstItemOnLine(i)].data));
				contentOfPage.lineOfText[i][15] = (0x3A * structureOfPage.editField[firstItemOnLine(i) + 1].data + 0x2D * (1 - structureOfPage.editField[firstItemOnLine(i) + 1].data));
			}
	        break;
	    }
	    case SERVOS_PAGE : {
			if (servoCount == 0) {
				for (int i = 1; i < 4; i++) {
					includeEmptyLine(i);
					includeEmptyLine(i+4);
				}
				snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, staticServosPage[4]);
			}
			else {
				snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, staticServosPage[0], structureOfPage.editField[3].data);
				snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, staticServosPage[1], structureOfPage.editField[6].data * 10, structureOfPage.editField[7].data * 10);
				snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, staticServosPage[2], structureOfPage.editField[9].data * 10, structureOfPage.editField[11].data);
				contentOfPage.lineOfText[3][16] = (0x2B * structureOfPage.editField[10].data + 0x2D * (1 - structureOfPage.editField[10].data));
				snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, staticServosPage[3], servoForwardChannel[structureOfPage.editField[12].data]);
				includeCommandLines();
	        }
			break;
	    }
#endif
	}
	for (int i = 1; i <= DISPLAY_LINES_MINUS1; i++)
		completeStringWithSpaces(i);
}
//=========================================================================================

//===========================  processing interface and events  ===========================
static void initializeNewPage(void)
{
 	initializeEditionModeSpace();
 	initializeItemsOfTheSelectedPage();
}

static void exitEditionProcess(void)
{
	selectedItem = -1;
	editionLine = -1;
	onGoingEditionProcess = false;
}

static uint8_t newValueAfterEvent(int8_t whichWay, uint8_t whichValue, uint8_t minValue, uint8_t maxValue)
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
#if (DATA_EDITION_FULL_VERSION)
	if ((selectedItem == 21) && (selectedPage != MOTORS_PAGE)){
		structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
		exitEditionProcess();
		return;
	}
#else
	if (selectedItem == 21){
		structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
		exitEditionProcess();
		return;
	}
#endif

	if (onGoingEditionProcess){
		structureOfPage.editField[selectedItem].data = newValueAfterEvent(whichWay, structureOfPage.editField[selectedItem].data,
				                structureOfPage.editField[selectedItem].minValue, structureOfPage.editField[selectedItem].maxValue);

        if (selectedPage == ALL_DATA_PAGE)
            applyNewValuesOnCleanflightDataPage(whichWay);
#if (DATA_EDITION_FULL_VERSION)
        else
        	applyNewValuesOnThatPage();
#endif
	}
	else
		if (selectedItem != -1){
			structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
			if ((selectedLine > 1) && (selectedLine < 7))
				selectedLine -= whichWay;
			exitEditionProcess();
		}
}

static void processNextPrevEvent(int8_t whichWay)
{
#if (DATA_EDITION_FULL_VERSION)
    if ((selectedPage == RECEIVER_PAGE) && (selectedItem == 18)) {
    	structureOfPage.editField[19].data = newValueAfterEvent(whichWay, structureOfPage.editField[19].data, 0, (MAX_MAPPABLE_RX_INPUTS - 1));
		structureOfPage.editField[selectedItem].data = getChannelIndex();
    }
    else
#endif
		if ((selectedItem != -1) && (onGoingEditionProcess)){
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
				lastLine = DISPLAY_LINES_MINUS1;
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
	            selectedPage = selectedLine + (whichOfPages * DISPLAY_LINES_MINUS1);
	        	whichOfPages = 0;
	        	initializeNewPage();
			}
			else {
				selectedItem = firstItemOnLine(editionLine);
				structureOfPage.editField[selectedItem].color = PIXEL_INVERTED;
				onGoingEditionProcess = true;
#if (DATA_EDITION_FULL_VERSION)
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
			exitEditionProcess();
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
#if (DATA_EDITION_FULL_VERSION)
			if ((selectedItem == 21) && (selectedPage != MOTORS_PAGE)){
			    saveConfigAndNotify();
			    structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
				exitEditionProcess();
			}
			else {
				if ((selectedPage == RECEIVER_PAGE) && (selectedItem == 18)){
					if (structureOfPage.editField[selectedItem].color == PIXEL_INVERTED)
						structureOfPage.editField[selectedItem].color = PIXEL_MIXED;
					else {
						if (theRCMappingStringIsValid()){
							parseRcChannels(tempString, &masterConfig.rxConfig);
							structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
							exitEditionProcess();
						}
						else {
							structureOfPage.editField[selectedItem].color = PIXEL_INVERTED;
					        beeperConfirmationBeeps(2);
						}
					}
				}
				else
					if (onGoingEditionProcess){
						structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
						exitEditionProcess();
					}
			}
#else
			if (selectedItem == 21){
				saveConfigAndNotify();
				structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
				exitEditionProcess();
			}
			else
				if (onGoingEditionProcess){
					structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
					exitEditionProcess();
				}
#endif
			break;
		}
	}
}

//=======================  end of processing interface of the page  ========================

//=================================  process SelectedPage  ==================================
static void writeSignOfSelectedLine(void)
{
	contentOfPage.lineOfText[selectedLine][0] = 0x3E;
}

static void processSelectedPage(uint8_t commandID)
{
    if (shouldInitialiseThePage)
    	initializeNewPage();

	processInterfaceOfThePage(commandID);
 	updateValuesForThatPage();
 	prepareLinesOfTextForThatPage();

#if (DATA_EDITION_FULL_VERSION)
    if (selectedPage != FIRMWARE_PAGE)
    	writeSignOfSelectedLine();
#else
	writeSignOfSelectedLine();
#endif
}

//==============================  processing data Edition  =================================
void sendContentOfPageToDisplay(void)
{
	char tmpChar[22];

	if ((featureConfigured(FEATURE_DISPLAY)) && (onGoingDataEditionWithSticks)){
		for (int i = 0; i <= 7; i++) {
			snprintf(tmpChar,DEFAULT_DISPLAY_COLUMNS+1, contentOfPage.lineOfText[i]);
			tmpChar[DEFAULT_DISPLAY_COLUMNS] = 0;
			i2c_OLED_set_line(i);
			i2c_OLED_send_string(tmpChar);
			if (selectedItem != -1){
                if (i == structureOfPage.editField[selectedItem].line){
		            highlightSelectedItemOnOledDisplay();
                }
			}
		}
	}
}

void processDataEdition(uint8_t commandID)
{
	if (commandID == NO_COMMAND)
		return;

	if (!onGoingEditionProcess) {
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
#if (DATA_EDITION_FULL_VERSION)
						if (selectedPage == MOTORS_PAGE)
							stopAllMotors();
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

#if (DATA_EDITION_FULL_VERSION)
    checkForBatteryAndRSSIWarningLevels();
#endif
    processSelectedPage(commandID);
}
//============================  end of processing data Edition  =============================
