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

#define MAX_OF_EDITABLE_ITEMS     24    // default : 3 editable items per line
typedef struct PAGE_DISPLAY_s {
	displayLine_s displayLine [DEFAULT_DISPLAY_LINES];
    displayActiveItem_s editField[MAX_OF_EDITABLE_ITEMS];
} PAGE_DISPLAY_t;


//Graupner Text mode message structure
typedef struct PAGE_MESSAGE_s {
    uint8_t startByte;				// 0x7B
    uint8_t esc;					// 0x00 : normal  -  0x01 : exit text mode
    uint8_t warningBeeps;			// 0 = none, 1=A 2=B ... (see codes in telemetry/hott.h)
    char lineOfText [DEFAULT_DISPLAY_LINES] [DEFAULT_DISPLAY_COLUMNS]; // MSB = 1 -> inverse character contrast on display
    uint8_t stopByte;				// 0x7D
} PAGE_MESSAGE_t;

static PAGE_MESSAGE_t contentOfPage;
static PAGE_DISPLAY_t structureOfPage;


void hottSendResponse(PAGE_MESSAGE_t *contentOfPage, int length);

extern unsigned char oledCharFormat;

extern uint16_t rssi;
extern uint8_t motorCount;
extern uint8_t servoCount;

#define TX_DISPLAY		    0
#define OLED_DISPLAY		    1
#define DISPLAY_LINES_MINUS1	7
#define DISPLAY_LINES_MINUS2	6
#define CHARS_PER_LINE		    21
#define THREE_ITEMS_PER_LINE	3

static uint8_t 	bottomLineOnDisplay;
static uint8_t 	numberOfSecondaryPagesForThatPage = 0;
static uint8_t 	whichOfPages 	= 0;
static uint8_t	selectedPage	= SELECTION_PAGE;
static uint8_t	selectedLine	= 1;
static int8_t	editionLine		= -1;
static int8_t	selectedItem 	= -1;

static bool shouldInitialiseThePage 	= true;
static bool onGoingEditionProcess 		= false;

static uint32_t lastAlarmSoundTime;
static bool isAlarmSoundOn 		= true;

static char tempString[8];

void cliSetVar(const clivalue_t *var, const int_float_value_t value);
extern uint8_t nmbrOfRecordsInTable;
extern const clivalue_t valueTable[];
static int32_t valueInteger = 0;
static float valueFloat = 0;


//======================================  Utilities  =======================================
void initialiseContentOfPageStructure(void)
{
    memset(&contentOfPage, 0, sizeof(contentOfPage));
    contentOfPage.startByte = 0x7B;    // these four parameters are specific to the Graupner Hott system
    contentOfPage.esc = 0;
    contentOfPage.warningBeeps = 0;
    contentOfPage.stopByte = 0x7D;
}

void initialiseDisplayPageStructure(void)
{
    memset(&structureOfPage, 0, sizeof(structureOfPage));
}

void initDataEditionStructures(void)    // called in main
{
    initialiseContentOfPageStructure();
    initialiseDisplayPageStructure();
	onGoingDataEditionWithSticks = false;
}

static void initializeEditionModeSpace(void)
{
	uint8_t i;

	for (i = 0; i < DEFAULT_DISPLAY_LINES; i++) {
		structureOfPage.displayLine[i].isActive = false;
		structureOfPage.displayLine[i].itemsOnLine = 1;
	}
	for (i = 0; i < MAX_OF_EDITABLE_ITEMS; i++)
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

static void processInvertingDisplayForThatItem(uint8_t whichDisplay, uint8_t item)
{
	uint8_t line = structureOfPage.editField[item].line;

	for(int i = structureOfPage.editField[item].leftPosition; i <= structureOfPage.editField[item].rightPosition; i++){
		contentOfPage.lineOfText[line][i] &= INVERSE_CHAR_FORMAT;    // upper bit = 0 by default
		if (structureOfPage.editField[item].color == PIXEL_INVERTED)
		    switch (whichDisplay){
		        case TX_DISPLAY :
		            contentOfPage.lineOfText[line][i] |= ~INVERSE_CHAR_FORMAT;
		            break;
		        case OLED_DISPLAY :
		        	i2c_OLED_set_xy(i, line);
					oledCharFormat = INVERSE_CHAR_FORMAT;
					i2c_OLED_send_char(contentOfPage.lineOfText[line][i]);
					oledCharFormat = NORMAL_CHAR_FORMAT;
		            break;
			}
	}
}

static void processInversionOfDisplayForItems(uint8_t whichDisplay)
{
	uint8_t i, line, item;

	for (line = 0; line <= DISPLAY_LINES_MINUS1; line++){
		if (structureOfPage.displayLine[line].isActive){
			item = firstItemOnLine(line) - 1;
			for (i = 0; i < THREE_ITEMS_PER_LINE; i++){
				item++;
	            if ((structureOfPage.editField[item].alive) && (structureOfPage.editField[item].color != PIXEL_MIXED))
	            	processInvertingDisplayForThatItem(whichDisplay, item);
			}
		}
	}
}

static void completeStringWithSpaces(uint8_t lineIndex)
{
    uint8_t length = strlen(contentOfPage.lineOfText[lineIndex]);

    while (length < sizeof(contentOfPage.lineOfText[lineIndex]))
    	contentOfPage.lineOfText[lineIndex][length++] = 0x20;
}

static bool shouldTriggerAlarmNow(void)
{
	return ((millis() - lastAlarmSoundTime) >= (uint32_t)(masterConfig.telemetryConfig.hottAlarmSoundInterval * MILLISECONDS_IN_A_SECOND));
}

static bool isBatteryLevelOK(void)
{
	if ((feature(FEATURE_VBAT)) && (calculateBatteryState() != BATTERY_OK))
		return false;
	return true;
}

static bool isRssiLevelOK(void)
{
	if (((masterConfig.rxConfig.rssi_channel > 0) || (feature(FEATURE_RSSI_ADC))) && (rssi <= masterConfig.rxConfig.rssi_warningLevel))
	    return false;
	return true;
}

static void checkForBatteryAndRSSIWarningLevels(void)
{
    if (isAlarmSoundOn && shouldTriggerAlarmNow()){
    	lastAlarmSoundTime = millis();
        if ((isBatteryLevelOK()) && (isRssiLevelOK()))
            contentOfPage.warningBeeps = 0;
        else {
    	    contentOfPage.warningBeeps = (1 << 1);    // HOTT_EAM_ALARM1_FLAG_BATTERY_1 for Hott system
        }
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

#if (DATA_EDITION_FULL_VERSION)
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
static void defineActiveItem(uint8_t item, uint8_t line, uint8_t leftPosition,
                             uint8_t rightPosition, uint8_t minValue, uint8_t maxValue)
{
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

static void defineOnOffItem(uint8_t item, uint8_t line, uint8_t leftPosition, uint8_t rightPosition)
{
    defineActiveItem (item, line, leftPosition, rightPosition, 0, 1);
}

static void defineThreeItemsOnLine(uint8_t line, uint8_t leftLeftPosition, uint8_t interval,
							       uint8_t field_width_minus1, uint8_t minValue, uint8_t maxValue)
{
	uint8_t i, leftPosition;

	for (i = 0; i < THREE_ITEMS_PER_LINE; i++){
		leftPosition = leftLeftPosition + i * (interval + field_width_minus1);
        defineActiveItem (firstItemOnLine(line) + i, line, leftPosition, leftPosition
        		          + field_width_minus1, minValue, maxValue);
        structureOfPage.displayLine[line].itemsOnLine = 3;
	}
}

static uint8_t numberOfElementsInTable(char *table[])
{
	for (int i = 0; ; i++)
	    if (table[i] == NULL)
		    return i;
	return 0;
}

static void initialiseItemsForThatPage(char *listOfItems[], uint8_t numberOfDisplayLines)
{
    uint8_t numberOfElementsInList;

	numberOfElementsInList = numberOfElementsInTable(listOfItems);
	numberOfSecondaryPagesForThatPage = ceil((float)numberOfElementsInList / numberOfDisplayLines) - 1;

	if (whichOfPages != numberOfSecondaryPagesForThatPage)
		bottomLineOnDisplay = numberOfDisplayLines;
	else
		bottomLineOnDisplay = (numberOfElementsInList - (numberOfDisplayLines * numberOfSecondaryPagesForThatPage));

	for (int i = 1; i <= bottomLineOnDisplay; i++)
	    defineOnOffItem(firstItemOnLine(i), i, 19, 19);
}

static void initializeItemsOfTheSelectedPage(void)
{
	uint8_t line;

    defineActiveItem (21, 7, 8, 11, 0, 0);    // item "save"

	if (selectedPage == SELECTION_PAGE) {
		initialiseItemsForThatPage((char**)pageNames, DISPLAY_LINES_MINUS1);
		for (int i = 0; i == MAX_OF_EDITABLE_ITEMS; i++)
			structureOfPage.editField[i].alive = false;
		return;
	}

	switch (selectedPage){
#if (DATA_EDITION_FULL_VERSION)
		case FEATURES_PAGE : {
			initialiseItemsForThatPage((char**)featureNames, DISPLAY_LINES_MINUS2);
			break;
		}
		case BATTERY_PAGE : {
			defineOnOffItem(3, 1, 19, 19);
			for (line = 2; line <= 4; line++)
				defineActiveItem (firstItemOnLine(line), line, 17, 19, 30, 50);
			defineActiveItem (15, 5, 17, 19, VBAT_SCALE_MIN, VBAT_SCALE_MAX);
			break;
		}
		case CURRENTMETER_PAGE : {
			for (line = 2; line <= 3; line++)
				defineActiveItem (firstItemOnLine(line), line, 16, 19, 0, 250);
			defineOnOffItem(3, 1, 19, 19);
			defineOnOffItem(7, 2, 15, 15);
			structureOfPage.displayLine[2].itemsOnLine = 2;
			defineOnOffItem(12, 4, 19, 19);
			defineActiveItem (15, 5, 13, 19, 0, CURRENT_SENSOR_MAX);
			break;
		}
		case ESCMOTEURS_PAGE : {
			for (line = 1; line <= 2; line++)
				defineOnOffItem(firstItemOnLine(line), line, 19, 19);
			for (line = 3; line <= 6; line++)
				defineActiveItem (firstItemOnLine(line), line, 16, 19, 90, 200);
			break;
		}
		case GPS_PAGE : {
			defineOnOffItem(3, 1, 19, 19);
			defineActiveItem (6, 2, 15, 19, 0, GPS_PROVIDER_MAX);
			defineActiveItem (9, 3, 14, 19, 0, 4);
			defineActiveItem (12, 4, 15, 19, 0, SBAS_MODE_MAX);
			defineOnOffItem(15, 5, 12, 12);
			defineActiveItem (16, 5, 13, 15, 0, 180);
			defineActiveItem (17, 5, 17, 18, 0, 59);
			structureOfPage.displayLine[5].itemsOnLine = 3;
			break;
		}
		case RECEIVER_PAGE : {
			for (line = 1; line <= 4; line++)
				defineActiveItem(firstItemOnLine(line), line, 17, 19, 0, 200);
			defineActiveItem (15, 5, 18, 19, 0, 15);
			defineActiveItem (18, 6, 12, 19, 0, MAX_MAPPABLE_RX_INPUTS - 1);
			getReceiverMapping();
			break;
		}
#endif
		case DATA_PAGE : {
			defineActiveItem(3, 1, 9, 11, 0, nmbrOfRecordsInTable - 1);
			defineActiveItem (6, 2, 1, 20, 0, nmbrOfRecordsInTable - 1);
			defineActiveItem (9, 3, 9, 16, 0, 1);
		    break;
		}
        case MEASURES_PAGE : {
            defineActiveItem(3, 1, 14, 19, 0, 100);
            defineActiveItem (12, 3, 15, 19, 0, 100);
            defineOnOffItem(15, 5, 19, 19);
            defineActiveItem (18, 6, 15, 17, 0, 120);
		    break;
		}
	    case PIDCONTROLLER_PAGE : {
	    	initialiseItemsForThatPage((char**)pidControllerTitles, DISPLAY_LINES_MINUS2);
		    break;
	    }
	    case PID_PROFILE_PAGE : {
			defineActiveItem (3, 1, 10, 10, 0, MAX_PROFILE_COUNT - 1);
			for (line = 3; line <= 5; line++)
				defineThreeItemsOnLine (line, 7, 2, 2, 0, 200);
		    break;
	    }
	    case RATE_PROFILE_PAGE : {
			defineActiveItem (3, 1, 10, 10, 0, MAX_CONTROL_RATE_PROFILE_COUNT - 1);
			defineThreeItemsOnLine (3, 7, 2, 2, 0, 100);
			defineActiveItem (15, 5, 11, 13, 0, 100);
			defineActiveItem (18, 6, 10, 13, 100, 200);
		    break;
	    }
        case MOTORS_PAGE : {
        	int motorLines = numberOfActiveDisplayLinesForMotorsPlusOne();
			for (line = 1; line < motorLines; line++) {
	            defineOnOffItem(firstItemOnLine(line), line, 7, 7);
	            defineOnOffItem(firstItemOnLine(line)+1, line, 15, 15);
				structureOfPage.displayLine[line].itemsOnLine = 2;
			}
            defineOnOffItem(18, 6, 19, 19);
			defineActiveItem (21, 7, 13, 16, 100, 200);
	    	structureOfPage.editField[21].data = masterConfig.escAndServoConfig.mincommand / 10;
	        break;
	    }
	    case SERVOS_PAGE : {
			if (servoCount != 0) {
				defineActiveItem (3, 1, 8, 8, 0, MAX_SUPPORTED_SERVOS - 1);
				defineActiveItem (6, 2, 6, 9, 100, 200);
				defineActiveItem (7, 2, 16, 19, 100, 200);
				structureOfPage.displayLine[2].itemsOnLine = 2;
				defineActiveItem (9, 3, 6, 9, 100, 200);
	            defineOnOffItem(10, 3, 16, 16);
				defineActiveItem (11, 3, 17, 19, 0, 100);
				structureOfPage.displayLine[3].itemsOnLine = 3;
				defineActiveItem (12, 4, 17, 19, 0, 16);
	            defineOnOffItem(15, 5, 19, 19);
				defineActiveItem (18, 6, 13, 16, 100, 200);
				structureOfPage.editField[3].data = 0;
			}
	        break;
	    }
	}
}

//====================  update of values currently used in Cleanflight  ====================
static void updateDataValue(void)
{
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
}

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

static void updateValuesForThatPage(void)
{
	switch (selectedPage){
#if (DATA_EDITION_FULL_VERSION)
		case FEATURES_PAGE : {
			for (int line = 0; line < bottomLineOnDisplay; line++){
				int index = whichOfPages * DISPLAY_LINES_MINUS2 + (line);
				structureOfPage.editField[firstItemOnLine(line+1)].data = ((featureMask() & (1 << index)) != 0);
			}
			break;
		}
		case BATTERY_PAGE : {
			structureOfPage.editField[3].data = feature(FEATURE_VBAT) ;
			structureOfPage.editField[6].data = masterConfig.batteryConfig.vbatmincellvoltage;
			structureOfPage.editField[9].data = masterConfig.batteryConfig.vbatmaxcellvoltage;
			structureOfPage.editField[12].data = masterConfig.batteryConfig.vbatwarningcellvoltage;
			structureOfPage.editField[15].data = masterConfig.batteryConfig.vbatscale;
			break;
		}
		case CURRENTMETER_PAGE : {
			structureOfPage.editField[3].data = feature(FEATURE_CURRENT_METER) ;
			structureOfPage.editField[6].data = abs(masterConfig.batteryConfig.currentMeterScale) / 10;
			structureOfPage.editField[7].data = (masterConfig.batteryConfig.currentMeterScale >= 0);
			structureOfPage.editField[9].data = masterConfig.batteryConfig.currentMeterOffset / 10;
			structureOfPage.editField[12].data = masterConfig.batteryConfig.multiwiiCurrentMeterOutput;
			structureOfPage.editField[15].data = masterConfig.batteryConfig.currentMeterType;
			break;
		}
		case ESCMOTEURS_PAGE : {
			structureOfPage.editField[3].data = feature(FEATURE_MOTOR_STOP);
			structureOfPage.editField[6].data = feature(FEATURE_ONESHOT125);
			structureOfPage.editField[9].data = masterConfig.escAndServoConfig.minthrottle / 10;
			structureOfPage.editField[12].data = masterConfig.escAndServoConfig.servoCenterPulse / 10;
			structureOfPage.editField[15].data = masterConfig.escAndServoConfig.maxthrottle / 10;
			structureOfPage.editField[18].data = masterConfig.escAndServoConfig.mincommand / 10;
			break;
		}
		case GPS_PAGE : {
			structureOfPage.editField[3].data = feature(FEATURE_GPS) ;
			structureOfPage.editField[6].data = masterConfig.gpsConfig.provider;
			structureOfPage.editField[9].data = gpsData.baudrateIndex;
			structureOfPage.editField[12].data = masterConfig.gpsConfig.sbasMode;
			int index = getCurrentProfile();
			structureOfPage.editField[15].data = (masterConfig.profile[index].mag_declination >= 0);
			structureOfPage.editField[16].data = abs(masterConfig.profile[index].mag_declination / 100);
			structureOfPage.editField[17].data = abs(masterConfig.profile[index].mag_declination) % 100;
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
#endif
		case DATA_PAGE : {
			updateDataValue();
			break;
		}
        case MEASURES_PAGE : {
        	structureOfPage.editField[3].color = !isBatteryLevelOK();
        	structureOfPage.editField[12].color = !isRssiLevelOK();
        	structureOfPage.editField[15].data = isAlarmSoundOn;
        	structureOfPage.editField[18].data = masterConfig.telemetryConfig.hottAlarmSoundInterval;
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
	    case SERVOS_PAGE : {
	    	updateValuesForThatServo();
			break;
	    }
	}
}
//=========================================================================================

//=======================  apply new values to running Cleanflight  =======================
#if (DATA_EDITION_FULL_VERSION)
static void testAndPositionThatBit(uint8_t testValue, uint32_t bitMask)
{
	if (testValue)
	    featureSet(bitMask);
	else
	    featureClear(bitMask);
}
#endif

static void applyNewValuesOfThatPage(int8_t whichWay)
{
	uint8_t item, index;

    switch (selectedPage){
#if (DATA_EDITION_FULL_VERSION)
	    case FEATURES_PAGE : {
	        index = (whichOfPages * DISPLAY_LINES_MINUS2) + (selectedLine-1);
	    	testAndPositionThatBit(structureOfPage.editField[selectedItem].data, (1 << index));
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
        case ESCMOTEURS_PAGE : {
	    	testAndPositionThatBit(structureOfPage.editField[3].data, FEATURE_MOTOR_STOP);
	    	testAndPositionThatBit(structureOfPage.editField[6].data, FEATURE_ONESHOT125);
			masterConfig.escAndServoConfig.minthrottle = (structureOfPage.editField[9].data * 10);
			masterConfig.escAndServoConfig.servoCenterPulse = (structureOfPage.editField[12].data * 10);
			masterConfig.escAndServoConfig.maxthrottle = (structureOfPage.editField[15].data * 10);
			masterConfig.escAndServoConfig.mincommand = (structureOfPage.editField[18].data * 10);
		    break;
		}
	    case GPS_PAGE : {
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
#endif
		case DATA_PAGE : {
			switch (selectedItem) {
				case 3 :{
					structureOfPage.editField[6].data = structureOfPage.editField[3].data;
					break;
				}
				case 6 :{
					structureOfPage.editField[3].data = structureOfPage.editField[6].data;
					break;
				}
				case 9 :{
					int_float_value_t tmp;
					if (valueTable[structureOfPage.editField[3].data].type & VAR_FLOAT){
						valueFloat = constrainf((valueFloat + (whichWay * 0.001f)), valueTable[structureOfPage.editField[6].data].min, valueTable[structureOfPage.editField[6].data].max);
						tmp.float_value = valueFloat;
					}
					else {
						valueInteger = constrain((valueInteger + whichWay), valueTable[structureOfPage.editField[6].data].min, valueTable[structureOfPage.editField[6].data].max);
						tmp.int_value = valueInteger;
					}
					cliSetVar(&valueTable[structureOfPage.editField[3].data], tmp);
					break;
					}
				}
			break;
		}
        case MEASURES_PAGE : {
        	isAlarmSoundOn = structureOfPage.editField[15].data;
        	masterConfig.telemetryConfig.hottAlarmSoundInterval = structureOfPage.editField[18].data;
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
//========================================================================================

//============================= preparation of the  message  =============================
static char charForSelectionBox(uint8_t currentValue)
{
	return (0x58 * currentValue + 0x2D * (1 - currentValue));
}

static void includeTitleLine(void)
{
	if (selectedPage != SELECTION_PAGE)
	    snprintf(contentOfPage.lineOfText[0],CHARS_PER_LINE, pageNames[selectedPage-1]);
	else
	    snprintf(contentOfPage.lineOfText[0],CHARS_PER_LINE, staticSharedLines[0]);

	completeStringWithSpaces(0);
    contentOfPage.lineOfText[0][19] = 0x3C;
}

static void includeEmptyLine(uint8_t line)
{
	for (int i = 0; i < 21; i++)
		contentOfPage.lineOfText[line][i] = 0x20;
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

static void prepareThatPage(char *listOfItems[], uint8_t numberOfLinesPerPage)
{
	prepareMessageForThatList(listOfItems, numberOfLinesPerPage);
	for (int line = 1; line <= bottomLineOnDisplay; line++)
	    contentOfPage.lineOfText[line][19] = charForSelectionBox(structureOfPage.editField[firstItemOnLine(line)].data);
	includeLineWithItemSave();
}
static void prepareLinesOfTextForThatPage(void)
{
    includeTitleLine();
	snprintf(contentOfPage.lineOfText[7], CHARS_PER_LINE, staticSharedLines[1]);


    if (selectedPage == SELECTION_PAGE){
    	prepareMessageForThatList((char**)pageNames, DISPLAY_LINES_MINUS1);
    	return;
    }

    switch (selectedPage){
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
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, staticCurrentMeterPage[4], currentMeterTypes[structureOfPage.editField[15].data]);
			includeEmptyLine(6);
			break;
		}
        case ESCMOTEURS_PAGE : {
        	snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, staticEscMotorsPage[0], charForSelectionBox(structureOfPage.editField[3].data));
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, staticEscMotorsPage[1], charForSelectionBox(structureOfPage.editField[6].data));
			for (int i = 3; i < 7; i++)
			    snprintf(contentOfPage.lineOfText[i],CHARS_PER_LINE, staticEscMotorsPage[i-1], (uint16_t) structureOfPage.editField[i*3].data * 10);
		    break;
		}
	    case GPS_PAGE : {
			snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, staticGPSPage[0], charForSelectionBox(structureOfPage.editField[3].data));
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, staticGPSPage[1], gpsProtocols[structureOfPage.editField[6].data]);
			snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, staticGPSPage[2], gpsBaudrates[structureOfPage.editField[9].data]);
			snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, staticGPSPage[3], gpsAssistances[structureOfPage.editField[12].data]);
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, staticGPSPage[4], (0x2B * structureOfPage.editField[15].data + 0x2D * (1 - structureOfPage.editField[15].data)),
																	structureOfPage.editField[16].data, structureOfPage.editField[17].data);
			includeEmptyLine(6);
			break;
	    }
        case RECEIVER_PAGE : {
        	for (int i = 1; i < 6; i++)
    			snprintf(contentOfPage.lineOfText[i],CHARS_PER_LINE, staticReceiverPage[i-1], structureOfPage.editField[i*3].data);

			snprintf(contentOfPage.lineOfText[6],CHARS_PER_LINE, staticReceiverPage[5], tempString);
			if (structureOfPage.editField[18].color == PIXEL_MIXED)
				contentOfPage.lineOfText[editionLine][structureOfPage.editField[19].data + structureOfPage.editField[18].leftPosition] ^= 0x80;
		    break;
		}
#endif
		case DATA_PAGE : {
			snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, staticDataPage[1], structureOfPage.editField[3].data);
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, staticDataPage[2], valueTable[structureOfPage.editField[6].data].name);
			snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, staticDataPage[3], tempString);
			snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, staticDataPage[4], valueTable[structureOfPage.editField[6].data].min);
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, staticDataPage[5], valueTable[structureOfPage.editField[6].data].max);
			includeEmptyLine(6);
			break;
		}
        case MEASURES_PAGE : {
			snprintf(contentOfPage.lineOfText[1],CHARS_PER_LINE, staticMeasuresPage[0], batteryCellCount, vbat/10, vbat%10);
			snprintf(contentOfPage.lineOfText[2],CHARS_PER_LINE, staticMeasuresPage[1], amperage/100, amperage%100);
			snprintf(contentOfPage.lineOfText[3],CHARS_PER_LINE, staticMeasuresPage[2], mAhDrawn);
			snprintf(contentOfPage.lineOfText[4],CHARS_PER_LINE, staticMeasuresPage[3], rssi/10, rssi%10);
			snprintf(contentOfPage.lineOfText[5],CHARS_PER_LINE, staticMeasuresPage[4], charForSelectionBox(structureOfPage.editField[15].data));
			snprintf(contentOfPage.lineOfText[6],CHARS_PER_LINE, staticMeasuresPage[5], structureOfPage.editField[18].data);
			break;
		}
	    case PIDCONTROLLER_PAGE : {
			prepareThatPage((char**)pidControllerTitles, DISPLAY_LINES_MINUS2);
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
	}
}
//=========================================================================================

//===========================  processing interface and events  ===========================
static void initializeNewPage(void)
{
 	initializeEditionModeSpace();
 	initializeItemsOfTheSelectedPage();
}

static void getOutOfEditionProcess(void)
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
	if ((selectedItem == 21) && (selectedPage != MOTORS_PAGE)){
	    structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
		getOutOfEditionProcess();
		return;
	}

	if (onGoingEditionProcess){
		structureOfPage.editField[selectedItem].data = newValueAfterEvent(whichWay, structureOfPage.editField[selectedItem].data,
				                structureOfPage.editField[selectedItem].minValue, structureOfPage.editField[selectedItem].maxValue);
		applyNewValuesOfThatPage(whichWay);
	}
	else
		if (selectedItem != -1){
			structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
			if ((selectedLine > 1) && (selectedLine < 7))
				selectedLine -= whichWay;
			getOutOfEditionProcess();
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
		if ((selectedItem != -1) && (onGoingEditionProcess)){
			structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
			selectedItem = newValueAfterEvent(whichWay, selectedItem, firstItemOnLine(editionLine),
					       (firstItemOnLine(editionLine) + structureOfPage.displayLine[editionLine].itemsOnLine -1));
			structureOfPage.editField[selectedItem].color = PIXEL_INVERTED;
		}
#else
	if ((selectedItem != -1) && (onGoingEditionProcess)){
		structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
		selectedItem = newValueAfterEvent(whichWay, selectedItem, firstItemOnLine(editionLine),
					   (firstItemOnLine(editionLine) + structureOfPage.displayLine[editionLine].itemsOnLine -1));
		structureOfPage.editField[selectedItem].color = PIXEL_INVERTED;
	}
#endif
}

static void processEventsForLineSelection(uint8_t commandID)
{
	switch(commandID) {
		case INC_COMMAND : {
			if (selectedLine > 1)
				selectedLine--;
			break;
		}
		case DEC_COMMAND : {
			if (selectedLine < DISPLAY_LINES_MINUS1)
				selectedLine++;
			break;
		}
		case SET_COMMAND : {
			if ((commandID == SET_COMMAND) && (structureOfPage.displayLine[selectedLine].isActive)){
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
			getOutOfEditionProcess();
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
			if ((selectedItem == 21) && (selectedPage != MOTORS_PAGE)){
			    saveConfigAndNotify();
			    structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
				getOutOfEditionProcess();
			}
			else {
#if (DATA_EDITION_FULL_VERSION)
				if ((selectedPage == RECEIVER_PAGE) && (selectedItem == 18)){
					if (structureOfPage.editField[selectedItem].color == PIXEL_INVERTED)
						structureOfPage.editField[selectedItem].color = PIXEL_MIXED;
					else {
						if (theRCMappingStringIsValid()){
							parseRcChannels(tempString, &masterConfig.rxConfig);
							structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
							getOutOfEditionProcess();
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
						getOutOfEditionProcess();
					}
#else
				if (onGoingEditionProcess){
					structureOfPage.editField[selectedItem].color = PIXEL_NORMAL;
					getOutOfEditionProcess();
				}
#endif
			}
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

static void writeSignOfNextPage(void)
{
	contentOfPage.lineOfText[0][CHARS_PER_LINE-1] = 0x20;
	if (whichOfPages < numberOfSecondaryPagesForThatPage)
	    contentOfPage.lineOfText[0][CHARS_PER_LINE-1] = 0x3E;
	for (int i = 1; i <= DISPLAY_LINES_MINUS1; i++)	{				// to erase any trace of this sign on other lines
		contentOfPage.lineOfText[i][CHARS_PER_LINE-1] = 0x20;	    // (due to the Graupner down.up process for completing the display)
	    completeStringWithSpaces(i);
	}
}

static void processSelectedPage(uint8_t commandID)
{
    if (shouldInitialiseThePage)
    	initializeNewPage();

	processInterfaceOfThePage(commandID);
 	updateValuesForThatPage();
 	prepareLinesOfTextForThatPage();
    writeSignOfNextPage();

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

	if (hottTelemetryEnabled){
		processInversionOfDisplayForItems(TX_DISPLAY);
		hottSendResponse(&contentOfPage, sizeof(contentOfPage));
	}

	if ((feature(FEATURE_DISPLAY)) && (onGoingDataEditionWithSticks)){
		for (int i = 0; i <= 7; i++) {
			snprintf(tmpChar,CHARS_PER_LINE, contentOfPage.lineOfText[i]);
			tmpChar[20] = 0x20; // this tmpChar is needed to account for differences
			tmpChar[21] = 0;    // between Hott and Oled display management
			i2c_OLED_set_line(i);
			i2c_OLED_send_string(tmpChar);
		}
		processInversionOfDisplayForItems(OLED_DISPLAY);
	}
}

void processDataEdition(uint8_t commandID)
{
	if (commandID == 0)
		return;
    contentOfPage.esc = 0;

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
				if (whichOfPages > 0)
					whichOfPages--;
				else {
					if (selectedPage == SELECTION_PAGE){
						contentOfPage.esc = 1;
						return;
					}
					else {
						if (selectedPage == MOTORS_PAGE)
							stopAllMotors();
						if (selectedPage == SERVOS_PAGE)
							stopAllServos();
						selectedPage = SELECTION_PAGE;
					}
				}
				shouldInitialiseThePage = true;
				break;
			}
        }
	}

    checkForBatteryAndRSSIWarningLevels();
    processSelectedPage(commandID);
}
//============================  end of processing data Edition  =============================
