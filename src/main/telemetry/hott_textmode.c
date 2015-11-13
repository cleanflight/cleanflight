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

#ifdef TELEMETRY

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

#include "io/escservo.h"
#include "io/gps.h"
#include "io/gimbal.h"
#include "io/rc_controls.h"
#include "io/serial.h"
#include "io/serial_cli.h"
#include "io/ledstrip.h"

#include "rx/rx.h"
#include "rx/spektrum.h"

#include "sensors/battery.h"
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

#include "telemetry/hott_textmode.h"

void hottSendResponse(HOTT_TEXT_MSG_t *hottTextMes, int length);

extern uint16_t rssi;
extern uint8_t motorCount;
extern uint8_t servoCount;

#define DISPLAY_LINES_MINUS1	7
#define DISPLAY_LINES_MINUS2	6
#define CHARACTERS_PER_LINE		21
#define THREE_ITEMS_PER_LINE	3

static uint8_t 	lastActiveLineOnDisplay;
static uint8_t 	numberOfSecondaryPagesForThatPage = 0;
static uint8_t 	whichOfPages 	= 0;
static uint8_t	selectedPage	= SELECTION_PAGE;
static uint8_t	selectedLine	= 1;
static int8_t	editionLine		= -1;
static int8_t	selectedItem 	= -1;

static bool shouldInitialiseThePage 	= true;
static bool onGoingEditionProcess 		= false;

static uint32_t lastTextModeAlarmSoundTime;
static bool isTextModeAlarmSoundOn 		= true;
static char selectedReceiverMapping[8];


//======================================  Utilities  =======================================
void initialiseTextMessage(HOTT_TEXT_MSG_t *msg, size_t size)
{
    memset(msg, 0, size);
    msg->startByte = 0x7B;
    msg->esc = 0;
    msg->warningBeeps = 0;
    msg->stopByte = 0x7D;
}

void initialiseHottTXDisplay(HOTT_TEXT_DISPLAY_t *msg, size_t size)
{
    memset(msg, 0, size);
}

static void initialiseTextModeSpace(HOTT_TEXT_DISPLAY_t *txtModPage)
{
	uint8_t i;

	for (i = 0; i < HOTT_TEXTMODE_MSG_LINES; i++) {
		txtModPage->displayLine[i].isActive = false;
		txtModPage->displayLine[i].itemsOnLine = 1;
	}
	for (i = 0; i < NBR_OF_EDITABLE_ITEMS; i++)
		txtModPage->editField[i].alive = false;

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

static void invertDisplayForPartOfLine(HOTT_TEXT_MSG_t *txtModMessage, uint8_t lineNumber, uint8_t firstChar, uint8_t lastChar, uint8_t pixelColor)
{
    for(int charIndex = firstChar; charIndex <= lastChar; charIndex++){
        if ((txtModMessage->lineOfText[lineNumber][charIndex]>>7 == 0x01) && (pixelColor == PIXEL_NORMAL))
        	txtModMessage->lineOfText[lineNumber][charIndex] &=0xEF;
        else
            if ((txtModMessage->lineOfText[lineNumber][charIndex]>>7 == 0x00) && (pixelColor == PIXEL_INVERTED))
        	    txtModMessage->lineOfText[lineNumber][charIndex] ^=0x80;
    }
}

static void processInversionOfDisplayForItems(HOTT_TEXT_MSG_t *txtModMessage, HOTT_TEXT_DISPLAY_t *txtModPage)
{
	uint8_t i, line, item;

	for (line = 0; line <= DISPLAY_LINES_MINUS1; line++)
		if (txtModPage->displayLine[line].isActive){
			item = firstItemOnLine(line) - 1;
			for (i = 0; i < THREE_ITEMS_PER_LINE; i++){
				item++;
	            if ((txtModPage->editField[item].alive) && (txtModPage->editField[item].color != PIXEL_MIXED))
	            	invertDisplayForPartOfLine (txtModMessage, txtModPage->editField[item].line, txtModPage->editField[item].leftPosition,
                		txtModPage->editField[item].rightPosition, txtModPage->editField[item].color);
			}
		}
}

static void completeStringWithSpaces(char lineString[HOTT_TEXTMODE_MSG_COLUMNS])
{
    uint8_t length = strlen(lineString);

    while (length < HOTT_TEXTMODE_MSG_COLUMNS - 1)
    	lineString[length++] = 0x20;
}

static bool shouldTriggerTextModeVoiceAlarmNow(void)
{
	return ((millis() - lastTextModeAlarmSoundTime) >= (uint32_t)(masterConfig.telemetryConfig.hottAlarmSoundInterval * MILLISECONDS_IN_A_SECOND));
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

static void checkForBatteryAndRSSIWarningLevels(HOTT_TEXT_MSG_t *txtModMessage)
{
    if (isTextModeAlarmSoundOn && shouldTriggerTextModeVoiceAlarmNow()){
    	lastTextModeAlarmSoundTime = millis();
        if ((isBatteryLevelOK()) && (isRssiLevelOK()))
            txtModMessage->warningBeeps = 0;
        else
    	    txtModMessage->warningBeeps = HOTT_EAM_ALARM1_FLAG_BATTERY_1;
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
    	selectedReceiverMapping[masterConfig.rxConfig.rcmap[i]] = rcChannelLetters[i];
}

static uint8_t getChannelIndex(HOTT_TEXT_DISPLAY_t *txtModPage)
{
	for (int i = 0; i < MAX_MAPPABLE_RX_INPUTS; i++)
    	if (selectedReceiverMapping[txtModPage->editField[19].data] == rcChannelLetters[i])
            return i;
    return -1;
}

static bool theRCMappingStringIsValid(void)
{
	for (int i = 0; i < 8; i++)
		for (int j = i + 1; j < 8; j++)
			if (selectedReceiverMapping[i] == selectedReceiverMapping[j])
				return false;
	return true;
}
//==================================  end of Utilities  ===================================

//======================  initialization of active/editable items  =======================
static void defineActiveItem(HOTT_TEXT_DISPLAY_t *txtModPage, uint8_t item, uint8_t line, uint8_t leftPosition,
															uint8_t rightPosition, uint8_t minValue, uint8_t maxValue)
{
	txtModPage->displayLine[line].isActive = true;

	txtModPage->editField[item].line = line;
	txtModPage->editField[item].leftPosition = leftPosition;
	txtModPage->editField[item].rightPosition = rightPosition;
	txtModPage->editField[item].color = PIXEL_NORMAL;
	txtModPage->editField[item].data = 0;
	txtModPage->editField[item].minValue = minValue;
	txtModPage->editField[item].maxValue = maxValue;
	txtModPage->editField[item].alive = true;
}

static void defineOnOffItem(HOTT_TEXT_DISPLAY_t *txtModPage, uint8_t item, uint8_t line, uint8_t leftPosition, uint8_t rightPosition)
{
    defineActiveItem (txtModPage, item, line, leftPosition, rightPosition, 0, 1);
}

static void defineThreeItemsOnLine(HOTT_TEXT_DISPLAY_t *txtModPage, uint8_t line,
							uint8_t leftLeftPosition, uint8_t interval, uint8_t field_width_minus1, uint8_t minValue, uint8_t maxValue)
{
	uint8_t i, leftPosition;

	for (i = 0; i < THREE_ITEMS_PER_LINE; i++){
		leftPosition = leftLeftPosition + i * (interval + field_width_minus1);
        defineActiveItem (txtModPage, firstItemOnLine(line) + i, line, leftPosition, leftPosition + field_width_minus1, minValue, maxValue);
        txtModPage->displayLine[line].itemsOnLine = 3;
	}
}

static uint8_t numberOfElementsInTable(char *table[])
{
	for (int i = 0; ; i++)
	    if (table[i] == NULL)
		    return i;
	return 0;
}

static void initialiseItemsForThatPage(HOTT_TEXT_DISPLAY_t *txtModPage, char *listOfItems[], uint8_t numberOfDisplayLines)
{
    uint8_t numberOfElementsInList;

	numberOfElementsInList = numberOfElementsInTable(listOfItems);
	numberOfSecondaryPagesForThatPage = ceil((float)numberOfElementsInList / numberOfDisplayLines) - 1;

	if (whichOfPages != numberOfSecondaryPagesForThatPage)
		lastActiveLineOnDisplay = numberOfDisplayLines;
	else
		lastActiveLineOnDisplay = (numberOfElementsInList - (numberOfDisplayLines * numberOfSecondaryPagesForThatPage));

	for (int i = 1; i <= lastActiveLineOnDisplay; i++)
	    defineOnOffItem(txtModPage, firstItemOnLine(i), i, 19, 19);
}

static void initialiseItemsOfTheSelectedPage(HOTT_TEXT_DISPLAY_t *txtModPage)
{
	uint8_t line;

    defineActiveItem (txtModPage, 21, 7, 8, 11, 0, 0);    // item "save"

	switch (selectedPage){
        case SELECTION_PAGE : {
	    	initialiseItemsForThatPage(txtModPage, (char**)textModePageNames, DISPLAY_LINES_MINUS1);
	    	break;
        }
	    case FEATURES_PAGE : {
	    	initialiseItemsForThatPage(txtModPage, (char**)featureNames, DISPLAY_LINES_MINUS2);
	        break;
	    }
        case MEASURES_PAGE : {
            defineActiveItem(txtModPage, 3, 1, 14, 19, 0, 100);
            defineActiveItem (txtModPage, 12, 3, 15, 19, 0, 100);
            defineOnOffItem(txtModPage, 15, 5, 19, 19);
            defineActiveItem (txtModPage, 18, 6, 15, 17, 0, 120);
		    break;
		}
        case BATTERY_PAGE : {
            defineOnOffItem(txtModPage, 3, 1, 19, 19);
        	for (line = 2; line <= 4; line++)
        		defineActiveItem (txtModPage, firstItemOnLine(line), line, 17, 19, 30, 50);
    		defineActiveItem (txtModPage, 15, 5, 17, 19, VBAT_SCALE_MIN, VBAT_SCALE_MAX);
		    break;
		}
        case CURRENTMETER_PAGE : {
            for (line = 2; line <= 3; line++)
    		    defineActiveItem (txtModPage, firstItemOnLine(line), line, 16, 19, 0, 250);
            defineOnOffItem(txtModPage, 3, 1, 19, 19);
            defineOnOffItem(txtModPage, 7, 2, 15, 15);
        	txtModPage->displayLine[2].itemsOnLine = 2;
            defineOnOffItem(txtModPage, 12, 4, 19, 19);
            defineActiveItem (txtModPage, 15, 5, 13, 19, 0, CURRENT_SENSOR_MAX);
		    break;
		}
        case ESCMOTEURS_PAGE : {
            for (line = 1; line <= 2; line++)
                defineOnOffItem(txtModPage, firstItemOnLine(line), line, 19, 19);
            for (line = 3; line <= 6; line++)
                defineActiveItem (txtModPage, firstItemOnLine(line), line, 16, 19, 90, 200);
		    break;
		}
	    case PIDCONTROLLER_PAGE : {
	    	initialiseItemsForThatPage(txtModPage, (char**)pidControllerTitles, DISPLAY_LINES_MINUS2);
		    break;
	    }
	    case PID_PROFILE_PAGE : {
			defineActiveItem (txtModPage, 3, 1, 10, 10, 0, MAX_PROFILE_COUNT - 1);
			for (line = 3; line<= 5; line++)
				defineThreeItemsOnLine (txtModPage, line, 7, 2, 2, 0, 200);
		    break;
	    }
	    case RATE_PROFILE_PAGE : {
			defineActiveItem (txtModPage, 3, 1, 10, 10, 0, MAX_CONTROL_RATE_PROFILE_COUNT - 1);
			defineThreeItemsOnLine (txtModPage, 3, 7, 2, 2, 0, 100);
			defineActiveItem (txtModPage, 15, 5, 11, 13, 0, 100);
			defineActiveItem (txtModPage, 18, 6, 10, 13, 100, 200);
		    break;
	    }
	    case GPS_PAGE : {
            defineOnOffItem(txtModPage, 3, 1, 19, 19);
	    	defineActiveItem (txtModPage, 6, 2, 15, 19, 0, GPS_PROVIDER_MAX);
	    	defineActiveItem (txtModPage, 9, 3, 14, 19, 0, 4);
			defineActiveItem (txtModPage, 12, 4, 15, 19, 0, SBAS_MODE_MAX);
            defineOnOffItem(txtModPage, 15, 5, 12, 12);
			defineActiveItem (txtModPage, 16, 5, 13, 15, 0, 180);
			defineActiveItem (txtModPage, 17, 5, 17, 18, 0, 59);
			txtModPage->displayLine[5].itemsOnLine = 3;
	        break;
	    }
        case RECEIVER_PAGE : {
        	for (line = 1; line <= 4; line++)
        		defineActiveItem(txtModPage, firstItemOnLine(line), line, 17, 19, 0, 200);
        	defineActiveItem (txtModPage, 15, 5, 18, 19, 0, 15);
        	defineActiveItem (txtModPage, 18, 6, 12, 19, 0, MAX_MAPPABLE_RX_INPUTS - 1);
            getReceiverMapping();
		    break;
		}
        case MOTORS_PAGE : {
        	int motorLines = numberOfActiveDisplayLinesForMotorsPlusOne();
			for (line = 1; line < motorLines; line++) {
	            defineOnOffItem(txtModPage, firstItemOnLine(line), line, 7, 7);
	            defineOnOffItem(txtModPage, firstItemOnLine(line)+1, line, 15, 15);
				txtModPage->displayLine[line].itemsOnLine = 2;
			}
            defineOnOffItem(txtModPage, 18, 6, 19, 19);
			defineActiveItem (txtModPage, 21, 7, 13, 16, 100, 200);
	    	txtModPage->editField[21].data = masterConfig.escAndServoConfig.mincommand / 10;
	        break;
	    }
	    case SERVOS_PAGE : {
			if (servoCount != 0) {
				defineActiveItem (txtModPage, 3, 1, 8, 8, 0, MAX_SUPPORTED_SERVOS - 1);
				defineActiveItem (txtModPage, 6, 2, 6, 9, 100, 200);
				defineActiveItem (txtModPage, 7, 2, 16, 19, 100, 200);
				txtModPage->displayLine[2].itemsOnLine = 2;
				defineActiveItem (txtModPage, 9, 3, 6, 9, 100, 200);
	            defineOnOffItem(txtModPage, 10, 3, 16, 16);
				defineActiveItem (txtModPage, 11, 3, 17, 19, 0, 100);
				txtModPage->displayLine[3].itemsOnLine = 3;
				defineActiveItem (txtModPage, 12, 4, 17, 19, 0, 16);
	            defineOnOffItem(txtModPage, 15, 5, 19, 19);
				defineActiveItem (txtModPage, 18, 6, 13, 16, 100, 200);
				txtModPage->editField[3].data = 0;
			}
	        break;
	    }
	}
}

//====================  update of values currently used in Cleanflight  ====================
static void updatePIDValuesForThatProfile(HOTT_TEXT_DISPLAY_t *txtModPage)
{
	for (int line = 3; line <= 5; line++){
		txtModPage->editField[firstItemOnLine(line)].data = masterConfig.profile[txtModPage->editField[3].data].pidProfile.P8[line-3];
		txtModPage->editField[firstItemOnLine(line)+1].data = masterConfig.profile[txtModPage->editField[3].data].pidProfile.I8[line-3];
		txtModPage->editField[firstItemOnLine(line)+2].data = masterConfig.profile[txtModPage->editField[3].data].pidProfile.D8[line-3];
	}
}

static void updateRateValuesForThatProfile(HOTT_TEXT_DISPLAY_t *txtModPage)
{
	txtModPage->editField[9].data = masterConfig.controlRateProfiles[txtModPage->editField[3].data].rates[FD_ROLL];
	txtModPage->editField[10].data = masterConfig.controlRateProfiles[txtModPage->editField[3].data].rates[FD_PITCH];
	txtModPage->editField[11].data = masterConfig.controlRateProfiles[txtModPage->editField[3].data].rates[FD_YAW];
	txtModPage->editField[15].data = masterConfig.controlRateProfiles[txtModPage->editField[3].data].dynThrPID;
	txtModPage->editField[18].data = masterConfig.controlRateProfiles[txtModPage->editField[3].data].tpa_breakpoint / 10;
}

static void updateValuesForThatServo(HOTT_TEXT_DISPLAY_t *txtModPage)
{
    txtModPage->editField[6].data = currentProfile->servoConf[txtModPage->editField[3].data].min / 10;
    txtModPage->editField[7].data = currentProfile->servoConf[txtModPage->editField[3].data].max / 10;
    txtModPage->editField[9].data = currentProfile->servoConf[txtModPage->editField[3].data].middle / 10;
    txtModPage->editField[10].data = (currentProfile->servoConf[txtModPage->editField[3].data].rate > 0);
    txtModPage->editField[11].data = abs(currentProfile->servoConf[txtModPage->editField[3].data].rate);
    if (currentProfile->servoConf[txtModPage->editField[3].data].forwardFromChannel == (int8_t)CHANNEL_FORWARDING_DISABLED)
        txtModPage->editField[12].data = 16;
    txtModPage->editField[18].data = servo[txtModPage->editField[3].data] / 10;
}

static void updateValuesForThatPage(HOTT_TEXT_DISPLAY_t *txtModPage)
{
	uint8_t index;

	switch (selectedPage){
	    case FEATURES_PAGE : {
	    	for (int line = 0; line < lastActiveLineOnDisplay; line++){
	    		index = whichOfPages * DISPLAY_LINES_MINUS2 + (line);
	            txtModPage->editField[firstItemOnLine(line+1)].data = ((featureMask() & (1 << index)) != 0);
	        }
	        break;
	    }
        case MEASURES_PAGE : {
        	txtModPage->editField[3].color = !isBatteryLevelOK();
        	txtModPage->editField[12].color = !isRssiLevelOK();
        	txtModPage->editField[15].data = isTextModeAlarmSoundOn;
        	txtModPage->editField[18].data = masterConfig.telemetryConfig.hottAlarmSoundInterval;
		    break;
		}
        case BATTERY_PAGE : {
        	txtModPage->editField[3].data = feature(FEATURE_VBAT) ;
        	txtModPage->editField[6].data = masterConfig.batteryConfig.vbatmincellvoltage;
        	txtModPage->editField[9].data = masterConfig.batteryConfig.vbatmaxcellvoltage;
        	txtModPage->editField[12].data = masterConfig.batteryConfig.vbatwarningcellvoltage;
        	txtModPage->editField[15].data = masterConfig.batteryConfig.vbatscale;
		    break;
		}
        case CURRENTMETER_PAGE : {
        	txtModPage->editField[3].data = feature(FEATURE_CURRENT_METER) ;
        	txtModPage->editField[6].data = abs(masterConfig.batteryConfig.currentMeterScale) / 10;
        	txtModPage->editField[7].data = (masterConfig.batteryConfig.currentMeterScale >= 0);
        	txtModPage->editField[9].data = masterConfig.batteryConfig.currentMeterOffset / 10;
        	txtModPage->editField[12].data = masterConfig.batteryConfig.multiwiiCurrentMeterOutput;
        	txtModPage->editField[15].data = masterConfig.batteryConfig.currentMeterType;
		    break;
		}
        case ESCMOTEURS_PAGE : {
        	txtModPage->editField[3].data = feature(FEATURE_MOTOR_STOP);
        	txtModPage->editField[6].data = feature(FEATURE_ONESHOT125);
        	txtModPage->editField[9].data = masterConfig.escAndServoConfig.minthrottle / 10;
        	txtModPage->editField[12].data = masterConfig.escAndServoConfig.servoCenterPulse / 10;
        	txtModPage->editField[15].data = masterConfig.escAndServoConfig.maxthrottle / 10;
        	txtModPage->editField[18].data = masterConfig.escAndServoConfig.mincommand / 10;
		    break;
		}
	    case PIDCONTROLLER_PAGE : {
	    	pidProfile_t *pidProfileConfig = &masterConfig.profile[getCurrentProfile()].pidProfile;
	        txtModPage->editField[firstItemOnLine(pidProfileConfig->pidController + 1)].data = 1;
		    break;
	    }
	    case PID_PROFILE_PAGE : {
	    	txtModPage->editField[3].data = getCurrentProfile();
	    	updatePIDValuesForThatProfile(txtModPage);
		    break;
	    }
	    case RATE_PROFILE_PAGE : {
	    	txtModPage->editField[17].data = getCurrentControlRateProfile();
	    	updateRateValuesForThatProfile(txtModPage);
		    break;
	    }
	    case GPS_PAGE : {
	    	txtModPage->editField[3].data = feature(FEATURE_GPS) ;
	    	txtModPage->editField[6].data = masterConfig.gpsConfig.provider;
	    	txtModPage->editField[9].data = gpsData.baudrateIndex;
	    	txtModPage->editField[12].data = masterConfig.gpsConfig.sbasMode;
	    	index = getCurrentProfile();
			txtModPage->editField[15].data = (masterConfig.profile[index].mag_declination >= 0);
			txtModPage->editField[16].data = abs(masterConfig.profile[index].mag_declination / 100);
			txtModPage->editField[17].data = abs(masterConfig.profile[index].mag_declination) % 100;
	        break;
	    }
        case RECEIVER_PAGE : {
	    	index = getCurrentControlRateProfile();
        	txtModPage->editField[3].data = masterConfig.controlRateProfiles[index].thrMid8;
        	txtModPage->editField[6].data = masterConfig.controlRateProfiles[index].thrExpo8;
        	txtModPage->editField[9].data = masterConfig.controlRateProfiles[index].rcRate8;
        	txtModPage->editField[12].data = masterConfig.controlRateProfiles[index].rcExpo8;
        	txtModPage->editField[15].data = masterConfig.rxConfig.rssi_channel;
		    break;
		}
	    case SERVOS_PAGE : {
	    	updateValuesForThatServo(txtModPage);
			break;
	    }
	}
}
//=========================================================================================

//==========================  applying new values to Cleanflight  =========================
static void testAndPositionThatBit(uint8_t testValue, uint32_t bitMask)
{
	if (testValue)
	    featureSet(bitMask);
	else
	    featureClear(bitMask);
}

static void applyNewValuesOfThatPage(HOTT_TEXT_DISPLAY_t *txtModPage)
{
	uint8_t item, index;

	switch (selectedPage){
	    case FEATURES_PAGE : {
	        index = (whichOfPages * DISPLAY_LINES_MINUS2) + (selectedLine-1);
	    	testAndPositionThatBit(txtModPage->editField[selectedItem].data, (1 << index));
	        break;
	    }
        case MEASURES_PAGE : {
        	isTextModeAlarmSoundOn = txtModPage->editField[15].data;
        	masterConfig.telemetryConfig.hottAlarmSoundInterval = txtModPage->editField[18].data;
		    break;
		}
        case BATTERY_PAGE : {
	    	testAndPositionThatBit(txtModPage->editField[3].data, FEATURE_VBAT);
			masterConfig.batteryConfig.vbatmincellvoltage = txtModPage->editField[6].data;
			masterConfig.batteryConfig.vbatmaxcellvoltage = txtModPage->editField[9].data;
			masterConfig.batteryConfig.vbatwarningcellvoltage = txtModPage->editField[12].data;
			masterConfig.batteryConfig.vbatscale = txtModPage->editField[15].data;

			batteryWarningVoltage = batteryCellCount * masterConfig.batteryConfig.vbatwarningcellvoltage;
			batteryCriticalVoltage = batteryCellCount * masterConfig.batteryConfig.vbatmincellvoltage;
		    break;
		}
        case CURRENTMETER_PAGE : {
	    	testAndPositionThatBit(txtModPage->editField[3].data, FEATURE_CURRENT_METER);
        	masterConfig.batteryConfig.currentMeterScale = 10 * (2 * txtModPage->editField[7].data - 1) * txtModPage->editField[6].data;
        	masterConfig.batteryConfig.currentMeterOffset = 10 * txtModPage->editField[9].data;
        	masterConfig.batteryConfig.multiwiiCurrentMeterOutput = txtModPage->editField[12].data;
        	masterConfig.batteryConfig.currentMeterType = txtModPage->editField[15].data;
		    break;
		}
        case ESCMOTEURS_PAGE : {
	    	testAndPositionThatBit(txtModPage->editField[3].data, FEATURE_MOTOR_STOP);
	    	testAndPositionThatBit(txtModPage->editField[6].data, FEATURE_ONESHOT125);
			masterConfig.escAndServoConfig.minthrottle = (txtModPage->editField[9].data * 10);
			masterConfig.escAndServoConfig.servoCenterPulse = (txtModPage->editField[12].data * 10);
			masterConfig.escAndServoConfig.maxthrottle = (txtModPage->editField[15].data * 10);
			masterConfig.escAndServoConfig.mincommand = (txtModPage->editField[18].data * 10);
		    break;
		}
	    case PIDCONTROLLER_PAGE : {
	    	index = getCurrentProfile();
	    	index = firstItemOnLine(masterConfig.profile[index].pidProfile.pidController + 1);
	    	txtModPage->editField[index].data = 0;
	    	masterConfig.profile[getCurrentProfile()].pidProfile.pidController = selectedLine - 1;
		    break;
	    }
	    case PID_PROFILE_PAGE : {
			if (selectedItem == 3) {
				setCurrentPIDprofileConfig(txtModPage->editField[3].data);
				updatePIDValuesForThatProfile(txtModPage);
			}
			else {
				index = txtModPage->editField[3].data;
				masterConfig.profile[index].pidProfile.P8[ROLL] = txtModPage->editField[9].data;
				masterConfig.profile[index].pidProfile.I8[ROLL] = txtModPage->editField[10].data;
				masterConfig.profile[index].pidProfile.D8[ROLL] = txtModPage->editField[11].data;
				masterConfig.profile[index].pidProfile.P8[PITCH] = txtModPage->editField[12].data;
				masterConfig.profile[index].pidProfile.I8[PITCH] = txtModPage->editField[13].data;
				masterConfig.profile[index].pidProfile.D8[PITCH] = txtModPage->editField[14].data;
				masterConfig.profile[index].pidProfile.P8[YAW] = txtModPage->editField[15].data;
				masterConfig.profile[index].pidProfile.I8[YAW] = txtModPage->editField[16].data;
				masterConfig.profile[index].pidProfile.D8[YAW] = txtModPage->editField[17].data;
			}
		    break;
	    }
	    case RATE_PROFILE_PAGE : {
			if (selectedItem == 3) {
				setControlRateProfile(txtModPage->editField[3].data);
				updateRateValuesForThatProfile(txtModPage);
			}
			else {
				index = txtModPage->editField[3].data;
				masterConfig.controlRateProfiles[index].rates[FD_ROLL] = txtModPage->editField[9].data;
				masterConfig.controlRateProfiles[index].rates[FD_PITCH] = txtModPage->editField[10].data;
				masterConfig.controlRateProfiles[index].rates[FD_YAW] = txtModPage->editField[11].data;
				masterConfig.controlRateProfiles[index].dynThrPID = txtModPage->editField[15].data;
				masterConfig.controlRateProfiles[index].tpa_breakpoint = txtModPage->editField[18].data * 10;
			}
		    break;
	    }
	    case GPS_PAGE : {
	    	testAndPositionThatBit(txtModPage->editField[3].data, FEATURE_GPS);
	    	masterConfig.gpsConfig.provider = txtModPage->editField[6].data;
	    	gpsData.baudrateIndex = txtModPage->editField[9].data;
	    	masterConfig.gpsConfig.sbasMode = txtModPage->editField[12].data;

            index = getCurrentProfile();
	    	masterConfig.profile[index].mag_declination = txtModPage->editField[16].data * 100 + txtModPage->editField[17].data;
	    	if (masterConfig.profile[index].mag_declination > 18000)
	    		masterConfig.profile[index].mag_declination = 18000;
	    	masterConfig.profile[index].mag_declination = (2 * txtModPage->editField[15].data -1) * masterConfig.profile[index].mag_declination;
	        break;
	    }
	    case RECEIVER_PAGE : {
			if (selectedItem == 18)
				selectedReceiverMapping[txtModPage->editField[19].data] = rcChannelLetters[txtModPage->editField[18].data];
			else {
				index = getCurrentControlRateProfile();
				masterConfig.controlRateProfiles[index].thrMid8 = txtModPage->editField[3].data;
				masterConfig.controlRateProfiles[index].thrExpo8 = txtModPage->editField[6].data;
				masterConfig.controlRateProfiles[index].rcRate8 = txtModPage->editField[9].data;
				masterConfig.controlRateProfiles[index].rcExpo8 = txtModPage->editField[12].data;
				masterConfig.rxConfig.rssi_channel = txtModPage->editField[15].data;
			}
		break;
	}
        case MOTORS_PAGE : {
        	for (index = 0; index < motorCount; index++) {
        		item = (THREE_ITEMS_PER_LINE + (index / (THREE_ITEMS_PER_LINE - 1)) * THREE_ITEMS_PER_LINE + index % (THREE_ITEMS_PER_LINE - 1));
            	if (txtModPage->editField[item].data && txtModPage->editField[18].data)
            		motor_disarmed[index] = txtModPage->editField[21].data * 10;
            	else
            		motor_disarmed[index] = masterConfig.escAndServoConfig.mincommand;
        	}
	        break;
	    }
	    case SERVOS_PAGE : {
			if (selectedItem == 3)
				updateValuesForThatServo(txtModPage);
			else {
				index = txtModPage->editField[3].data;
				currentProfile->servoConf[index].min = txtModPage->editField[6].data * 10;
				currentProfile->servoConf[index].max = txtModPage->editField[7].data * 10;
				currentProfile->servoConf[index].middle = txtModPage->editField[9].data * 10;
				currentProfile->servoConf[index].rate = (2 * txtModPage->editField[10].data - 1) * txtModPage->editField[11].data;
				if (txtModPage->editField[12].data == 16)
					currentProfile->servoConf[index].forwardFromChannel = (int8_t)CHANNEL_FORWARDING_DISABLED;
				else
					currentProfile->servoConf[index].forwardFromChannel = txtModPage->editField[12].data;
				if (txtModPage->editField[15].data)
					servo[index] = txtModPage->editField[18].data * 10;
				else
					servo[index] = currentProfile->servoConf[index].middle;
			}
			break;
	    }
	}
}
//=========================================================================================

//========================= preparation of the text mode message  =========================
static char charForSelectionBox(uint8_t currentValue)
{
	return (0x58 * currentValue + 0x2D * (1 - currentValue));
}

static void includeTitleLine(HOTT_TEXT_MSG_t *txtModMessage)
{
	if (selectedPage != SELECTION_PAGE)
	    snprintf(txtModMessage->lineOfText[0],CHARACTERS_PER_LINE, textModePageNames[selectedPage-1]);
	else
	    snprintf(txtModMessage->lineOfText[0],CHARACTERS_PER_LINE, staticSharedLines[0]);

	completeStringWithSpaces(txtModMessage->lineOfText[0]);
    txtModMessage->lineOfText[0][19] = 0x3C;
}

static void includeEmptyLine(HOTT_TEXT_MSG_t *txtModMessage, uint8_t line)
{
	for (int i = 0; i < 21; i++)
		txtModMessage->lineOfText[line][i] = 0x20;
}
static void includeComandLines(HOTT_TEXT_MSG_t *txtModMessage, HOTT_TEXT_DISPLAY_t *txtModPage)
{
	uint8_t i;

	i = (DISPLAY_LINES_MINUS1 - 2) + (selectedPage - SERVOS_PAGE) / (MOTORS_PAGE - SERVOS_PAGE);
	snprintf(txtModMessage->lineOfText[i],CHARACTERS_PER_LINE, staticMotorsPage[4],charForSelectionBox(txtModPage->editField[i * 3].data));
	snprintf(txtModMessage->lineOfText[i + 1],CHARACTERS_PER_LINE, staticMotorsPage[5], txtModPage->editField[(i+1) * 3].data * 10);
}

static void includeLineWithItemSave(HOTT_TEXT_MSG_t *txtModMessage)
{
	snprintf(txtModMessage->lineOfText[7], CHARACTERS_PER_LINE, staticSharedLines[1]);
}

static void prepareMessageForThatList(HOTT_TEXT_MSG_t *txtModMessage, char *listOfItems[], uint8_t numberOfLinesPerPage)
{
	uint8_t line;

	for (line = 1; line <= lastActiveLineOnDisplay; line++){
		strcpy(txtModMessage->lineOfText[line], " ");
		strcat(txtModMessage->lineOfText[line], listOfItems[whichOfPages * numberOfLinesPerPage + (line - 1)]);
		completeStringWithSpaces(txtModMessage->lineOfText[line]);
	}

	for (line = (lastActiveLineOnDisplay + 1); line < (numberOfLinesPerPage + 1); line++)
		includeEmptyLine(txtModMessage, line);
}

static void prepareThatPage(HOTT_TEXT_MSG_t *txtModMessage, HOTT_TEXT_DISPLAY_t *txtModPage, char *listOfItems[], uint8_t numberOfLinesPerPage)
{
	prepareMessageForThatList(txtModMessage, listOfItems, numberOfLinesPerPage);
	for (int line = 1; line <= lastActiveLineOnDisplay; line++)
	    txtModMessage->lineOfText[line][19] = charForSelectionBox(txtModPage->editField[firstItemOnLine(line)].data);
	includeLineWithItemSave(txtModMessage);
}

static void prepareMessageForThatPage(HOTT_TEXT_MSG_t *txtModMessage, HOTT_TEXT_DISPLAY_t *txtModPage)
{
    includeTitleLine(txtModMessage);
	snprintf(txtModMessage->lineOfText[7], CHARACTERS_PER_LINE, staticSharedLines[1]);

	switch (selectedPage){
        case SELECTION_PAGE : {
        	prepareMessageForThatList(txtModMessage, (char**)textModePageNames, DISPLAY_LINES_MINUS1);
	        break;
        }
        case FIRMWARE_PAGE : {
			snprintf(txtModMessage->lineOfText[1],CHARACTERS_PER_LINE, staticFirmwarePage[0], targetName);
			snprintf(txtModMessage->lineOfText[2],CHARACTERS_PER_LINE, staticFirmwarePage[1], FC_VERSION_STRING);
			snprintf(txtModMessage->lineOfText[3],CHARACTERS_PER_LINE, staticFirmwarePage[2], buildDate);
			snprintf(txtModMessage->lineOfText[4],CHARACTERS_PER_LINE, staticFirmwarePage[3], buildTime);
			snprintf(txtModMessage->lineOfText[5],CHARACTERS_PER_LINE, staticFirmwarePage[4], shortGitRevision);
			includeEmptyLine(txtModMessage, 6);
			snprintf(txtModMessage->lineOfText[7],CHARACTERS_PER_LINE, staticFirmwarePage[6], mixerNames[masterConfig.mixerMode - 1]);
	        break;
        }
	    case FEATURES_PAGE : {
			prepareThatPage(txtModMessage, txtModPage, (char**)featureNames, DISPLAY_LINES_MINUS2);
	        break;
	    }
        case MEASURES_PAGE : {
			snprintf(txtModMessage->lineOfText[1],CHARACTERS_PER_LINE, staticMeasuresPage[0], batteryCellCount, vbat/10, vbat%10);
			snprintf(txtModMessage->lineOfText[2],CHARACTERS_PER_LINE, staticMeasuresPage[1], amperage/100, amperage%100);
			snprintf(txtModMessage->lineOfText[3],CHARACTERS_PER_LINE, staticMeasuresPage[2], mAhDrawn);
			snprintf(txtModMessage->lineOfText[4],CHARACTERS_PER_LINE, staticMeasuresPage[3], rssi/10, rssi%10);
			snprintf(txtModMessage->lineOfText[5],CHARACTERS_PER_LINE, staticMeasuresPage[4], charForSelectionBox(txtModPage->editField[15].data));
			snprintf(txtModMessage->lineOfText[6],CHARACTERS_PER_LINE, staticMeasuresPage[5], txtModPage->editField[18].data);
			break;
		}
        case BATTERY_PAGE : {
			snprintf(txtModMessage->lineOfText[1],CHARACTERS_PER_LINE, staticBatteryPage[0], charForSelectionBox(txtModPage->editField[3].data));
			for (int i = 2; i < 5; i++)
				snprintf(txtModMessage->lineOfText[i],CHARACTERS_PER_LINE, staticBatteryPage[i-1], txtModPage->editField[i*3].data/10, txtModPage->editField[i*3].data%10);
			snprintf(txtModMessage->lineOfText[5],CHARACTERS_PER_LINE, staticBatteryPage[4], txtModPage->editField[15].data);
			includeEmptyLine(txtModMessage, 6);
			break;
		}
        case CURRENTMETER_PAGE : {
			snprintf(txtModMessage->lineOfText[1],CHARACTERS_PER_LINE, staticCurrentMeterPage[0], charForSelectionBox(txtModPage->editField[3].data));
			snprintf(txtModMessage->lineOfText[2],CHARACTERS_PER_LINE, staticCurrentMeterPage[1], (0x2B * txtModPage->editField[7].data + 0x2D * (1 - txtModPage->editField[7].data)), txtModPage->editField[6].data * 10);
			snprintf(txtModMessage->lineOfText[3],CHARACTERS_PER_LINE, staticCurrentMeterPage[2], txtModPage->editField[9].data * 10);
			snprintf(txtModMessage->lineOfText[4],CHARACTERS_PER_LINE, staticCurrentMeterPage[3], charForSelectionBox(txtModPage->editField[12].data));
			snprintf(txtModMessage->lineOfText[5],CHARACTERS_PER_LINE, staticCurrentMeterPage[4], currentMeterTypes[txtModPage->editField[15].data]);
			includeEmptyLine(txtModMessage, 6);
			break;
		}
        case ESCMOTEURS_PAGE : {
        	snprintf(txtModMessage->lineOfText[1],CHARACTERS_PER_LINE, staticEscMotorsPage[0], charForSelectionBox(txtModPage->editField[3].data));
			snprintf(txtModMessage->lineOfText[2],CHARACTERS_PER_LINE, staticEscMotorsPage[1], charForSelectionBox(txtModPage->editField[6].data));
			for (int i = 3; i < 7; i++)
			    snprintf(txtModMessage->lineOfText[i],CHARACTERS_PER_LINE, staticEscMotorsPage[i-1], (uint16_t) txtModPage->editField[i*3].data * 10);
		    break;
		}
	    case PIDCONTROLLER_PAGE : {
			prepareThatPage(txtModMessage, txtModPage, (char**)pidControllerTitles, DISPLAY_LINES_MINUS2);
			break;
	    }
	    case PID_PROFILE_PAGE : {
	    	snprintf(txtModMessage->lineOfText[1],CHARACTERS_PER_LINE, staticPIDprofilePage[0], txtModPage->editField[3].data);
	    	snprintf(txtModMessage->lineOfText[2],CHARACTERS_PER_LINE, staticPIDprofilePage[1]);
	    	for (int i = 3; i < 6; i++){
	    		int j = i * 3;
		    	snprintf(txtModMessage->lineOfText[i],CHARACTERS_PER_LINE, staticPIDprofilePage[i-1], txtModPage->editField[j].data, txtModPage->editField[j+1].data, txtModPage->editField[j+2].data);
	    	}
	    	includeEmptyLine(txtModMessage, 6);
	    	break;
	    }
	    case RATE_PROFILE_PAGE : {
	    	snprintf(txtModMessage->lineOfText[1],CHARACTERS_PER_LINE, staticRateprofilePage[0], txtModPage->editField[3].data);
	    	snprintf(txtModMessage->lineOfText[2],CHARACTERS_PER_LINE, staticRateprofilePage[1]);
	    	snprintf(txtModMessage->lineOfText[3],CHARACTERS_PER_LINE, staticRateprofilePage[2], txtModPage->editField[9].data, txtModPage->editField[10].data, txtModPage->editField[11].data);
			includeEmptyLine(txtModMessage, 4);
			snprintf(txtModMessage->lineOfText[5],CHARACTERS_PER_LINE, staticRateprofilePage[4], txtModPage->editField[15].data);
	    	snprintf(txtModMessage->lineOfText[6],CHARACTERS_PER_LINE, staticRateprofilePage[5], txtModPage->editField[18].data * 10);
	    	break;
	    }
	    case GPS_PAGE : {
			snprintf(txtModMessage->lineOfText[1],CHARACTERS_PER_LINE, staticGPSPage[0], charForSelectionBox(txtModPage->editField[3].data));
			snprintf(txtModMessage->lineOfText[2],CHARACTERS_PER_LINE, staticGPSPage[1], gpsProtocols[txtModPage->editField[6].data]);
			snprintf(txtModMessage->lineOfText[3],CHARACTERS_PER_LINE, staticGPSPage[2], gpsBaudrates[txtModPage->editField[9].data]);
			snprintf(txtModMessage->lineOfText[4],CHARACTERS_PER_LINE, staticGPSPage[3], gpsAssistances[txtModPage->editField[12].data]);
			snprintf(txtModMessage->lineOfText[5],CHARACTERS_PER_LINE, staticGPSPage[4], (0x2B * txtModPage->editField[15].data + 0x2D * (1 - txtModPage->editField[15].data)),
																	txtModPage->editField[16].data, txtModPage->editField[17].data);
			includeEmptyLine(txtModMessage, 6);
			break;
	    }
        case RECEIVER_PAGE : {
        	for (int i = 1; i < 6; i++)
    			snprintf(txtModMessage->lineOfText[i],CHARACTERS_PER_LINE, staticReceiverPage[i-1], txtModPage->editField[i*3].data);

			snprintf(txtModMessage->lineOfText[6],CHARACTERS_PER_LINE, staticReceiverPage[5], selectedReceiverMapping);
			if (txtModPage->editField[18].color == PIXEL_MIXED)
				txtModMessage->lineOfText[editionLine][txtModPage->editField[19].data + txtModPage->editField[18].leftPosition] ^= 0x80;
		    break;
		}
        case MOTORS_PAGE : {
        	for (int i = 0; i < 4; i++)
    			snprintf(txtModMessage->lineOfText[i+1],CHARACTERS_PER_LINE, staticMotorsPage[i], motor[2*i], motor[2*i + 1]);
			includeEmptyLine(txtModMessage, 5);
			includeComandLines(txtModMessage, txtModPage);
        	int motorLines = numberOfActiveDisplayLinesForMotorsPlusOne();
			for (int i = 1; i < motorLines; i++) {
				txtModMessage->lineOfText[i][7] = (0x3A * txtModPage->editField[firstItemOnLine(i)].data + 0x2D * (1 - txtModPage->editField[firstItemOnLine(i)].data));
				txtModMessage->lineOfText[i][15] = (0x3A * txtModPage->editField[firstItemOnLine(i) + 1].data + 0x2D * (1 - txtModPage->editField[firstItemOnLine(i) + 1].data));
			}
	        break;
	    }
	    case SERVOS_PAGE : {
			if (servoCount == 0) {
				for (int i = 1; i < 4; i++) {
					includeEmptyLine(txtModMessage, i);
					includeEmptyLine(txtModMessage, i+4);
				}
				snprintf(txtModMessage->lineOfText[4],CHARACTERS_PER_LINE, staticServosPage[4]);
			}
			else {
				snprintf(txtModMessage->lineOfText[1],CHARACTERS_PER_LINE, staticServosPage[0], txtModPage->editField[3].data);
				snprintf(txtModMessage->lineOfText[2],CHARACTERS_PER_LINE, staticServosPage[1], txtModPage->editField[6].data * 10, txtModPage->editField[7].data * 10);
				snprintf(txtModMessage->lineOfText[3],CHARACTERS_PER_LINE, staticServosPage[2], txtModPage->editField[9].data * 10, txtModPage->editField[11].data);
				txtModMessage->lineOfText[3][16] = (0x2B * txtModPage->editField[10].data + 0x2D * (1 - txtModPage->editField[10].data));
				snprintf(txtModMessage->lineOfText[4],CHARACTERS_PER_LINE, staticServosPage[3], servoForwardChannel[txtModPage->editField[12].data]);
				includeComandLines(txtModMessage, txtModPage);
	        }
			break;
	    }
	}
}
//=========================================================================================

//===========================  processing interface and events  ===========================
static void initialiseNewTxtModePage(HOTT_TEXT_DISPLAY_t *txtModPage)
{
 	initialiseTextModeSpace(txtModPage);
 	initialiseItemsOfTheSelectedPage(txtModPage);
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

static void processIncDecEvent(HOTT_TEXT_DISPLAY_t *txtModPage, int8_t whichWay)
{
	if ((selectedItem == 21) && (selectedPage != MOTORS_PAGE)){
	    txtModPage->editField[selectedItem].color = PIXEL_NORMAL;
		getOutOfEditionProcess();
		return;
	}

	if (onGoingEditionProcess){
		txtModPage->editField[selectedItem].data = newValueAfterEvent(whichWay, txtModPage->editField[selectedItem].data,
				                txtModPage->editField[selectedItem].minValue, txtModPage->editField[selectedItem].maxValue);
		applyNewValuesOfThatPage(txtModPage);
	}
	else
		if (selectedItem != -1){
			txtModPage->editField[selectedItem].color = PIXEL_NORMAL;
			if ((selectedLine > 1) && (selectedLine < 7))
				selectedLine -= whichWay;
			getOutOfEditionProcess();
		}
}

static void processNextPrevEvent(HOTT_TEXT_DISPLAY_t *txtModPage, int8_t whichWay)
{
    if ((selectedPage == RECEIVER_PAGE) && (selectedItem == 18)) {
    	txtModPage->editField[19].data = newValueAfterEvent(whichWay, txtModPage->editField[19].data, 0, (MAX_MAPPABLE_RX_INPUTS - 1));
		txtModPage->editField[selectedItem].data = getChannelIndex(txtModPage);
    }
    else
		if ((selectedItem != -1) && (onGoingEditionProcess)){
			txtModPage->editField[selectedItem].color = PIXEL_NORMAL;
			selectedItem = newValueAfterEvent(whichWay, selectedItem, firstItemOnLine(editionLine),
					       (firstItemOnLine(editionLine) + txtModPage->displayLine[editionLine].itemsOnLine -1));
			txtModPage->editField[selectedItem].color = PIXEL_INVERTED;
		}
}

static void processEventsForLineSelection(HOTT_TEXT_DISPLAY_t *txtModPage, uint8_t hottTXbuttonID)
{
	switch(hottTXbuttonID) {
		case HOTTV4_BUTTON_INC : {
			if (selectedLine > 1)
				selectedLine--;
			break;
		}
		case HOTTV4_BUTTON_DEC : {
			if (selectedLine < DISPLAY_LINES_MINUS1)
				selectedLine++;
			break;
		}
		case HOTTV4_BUTTON_SET : {
			if ((hottTXbuttonID == HOTTV4_BUTTON_SET) && (txtModPage->displayLine[selectedLine].isActive))
			    editionLine = selectedLine ;
			break;
		}
	}
}

static void processInterfaceOfThePage(HOTT_TEXT_DISPLAY_t *txtModPage, uint8_t hottTXbuttonID)
{
	if (editionLine == -1){
	    processEventsForLineSelection(txtModPage, hottTXbuttonID);
		if (editionLine != -1){
			if (selectedPage == SELECTION_PAGE){
	            selectedPage = selectedLine + (whichOfPages * DISPLAY_LINES_MINUS1);
	        	whichOfPages = 0;
	        	initialiseNewTxtModePage(txtModPage);
			}
			else {
				selectedItem = firstItemOnLine(editionLine);
				txtModPage->editField[selectedItem].color = PIXEL_INVERTED;
				onGoingEditionProcess = true;
				if ((selectedPage == RECEIVER_PAGE) && (selectedItem == 18)) {
	        		txtModPage->editField[19].data = 0;
	        		getReceiverMapping();
					txtModPage->editField[selectedItem].color = PIXEL_MIXED;
	        		txtModPage->editField[selectedItem].data = getChannelIndex(txtModPage);
				}
			}
		}
		else
			getOutOfEditionProcess();
	}
	else

	switch (hottTXbuttonID) {
		case HOTTV4_BUTTON_INC : {
			processIncDecEvent(txtModPage, 1);
			break;
		}
		case HOTTV4_BUTTON_DEC : {
			processIncDecEvent(txtModPage, -1);
			break;
		}
		case HOTTV4_BUTTON_NEXT : {
			processNextPrevEvent (txtModPage, 1);
			break;
		}
		case HOTTV4_BUTTON_PREV : {
			processNextPrevEvent (txtModPage, -1);
			break;
		}
		case HOTTV4_BUTTON_SET : {
			if ((selectedItem == 21) && (selectedPage != MOTORS_PAGE)){
			    saveConfigAndNotify();
			    txtModPage->editField[selectedItem].color = PIXEL_NORMAL;
				getOutOfEditionProcess();
			}
			else {
				if ((selectedPage == RECEIVER_PAGE) && (selectedItem == 18)){
					if (txtModPage->editField[selectedItem].color == PIXEL_INVERTED)
						txtModPage->editField[selectedItem].color = PIXEL_MIXED;
					else {
						if (theRCMappingStringIsValid()){
							parseRcChannels(selectedReceiverMapping, &masterConfig.rxConfig);
							txtModPage->editField[selectedItem].color = PIXEL_NORMAL;
							getOutOfEditionProcess();
						}
						else // FIXME the string is not valid => which code for error beep ?
							txtModPage->editField[selectedItem].color = PIXEL_INVERTED;
					}
				}
				else
					if (onGoingEditionProcess){
						txtModPage->editField[selectedItem].color = PIXEL_NORMAL;
						getOutOfEditionProcess();
					}
			}
			break;
		}
	}
}
//=======================  end of processing interface of the page  ========================

//=================================  process SelectedPage  ==================================
static void writeSignOfSelectedLine(HOTT_TEXT_MSG_t *txtModMessage)
{
	txtModMessage->lineOfText[selectedLine][0] = 0x3E;
}

static void writeSignOfNextPage(HOTT_TEXT_MSG_t *txtModMessage)
{
	txtModMessage->lineOfText[0][CHARACTERS_PER_LINE-1] = 0x20;
	if (whichOfPages < numberOfSecondaryPagesForThatPage)
	    txtModMessage->lineOfText[0][CHARACTERS_PER_LINE-1] = 0x3E;
	for (int i = 1; i <= DISPLAY_LINES_MINUS1; i++)	{				    // a trace of this sign remains on lines 1 to 7
		txtModMessage->lineOfText[i][CHARACTERS_PER_LINE-1] = 0x20;	    // due to the Graupner down->up process for completing the display
	    completeStringWithSpaces(txtModMessage->lineOfText[i]);
	}
}

static void processSelectedPage(HOTT_TEXT_MSG_t *txtModMessage, HOTT_TEXT_DISPLAY_t *txtModPage, uint8_t hottTXbuttonID)
{
    if (shouldInitialiseThePage)
    	initialiseNewTxtModePage(txtModPage);

	processInterfaceOfThePage(txtModPage, hottTXbuttonID);
 	updateValuesForThatPage(txtModPage);
 	prepareMessageForThatPage(txtModMessage, txtModPage);
    writeSignOfNextPage(txtModMessage);

    if (selectedPage != FIRMWARE_PAGE){
    	writeSignOfSelectedLine(txtModMessage);
        processInversionOfDisplayForItems(txtModMessage, txtModPage);
    }
}

//==============================  processing TextMode request  =================================
void processTextModeRequest(HOTT_TEXT_MSG_t *txtModMessage, HOTT_TEXT_DISPLAY_t *txtModPage, uint8_t address)
{
	//static uint8_t hottModuleID;
	//hottModuleID = address & 0xF0;
	static uint8_t hottTXbuttonID;

	hottTXbuttonID = address & 0x0F;
    txtModMessage->esc = 0;

	if (!onGoingEditionProcess) {
		switch(hottTXbuttonID) {
			case HOTTV4_BUTTON_NEXT : {
				if (whichOfPages < numberOfSecondaryPagesForThatPage) {
					whichOfPages++;
					shouldInitialiseThePage = true;
				}
				break;
			}
			case HOTTV4_BUTTON_PREV : {
				if (whichOfPages > 0)
					whichOfPages--;
				else {
					if (selectedPage == SELECTION_PAGE){
						txtModMessage->esc = 1;
						hottSendResponse(txtModMessage, sizeof(*txtModMessage));
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

    checkForBatteryAndRSSIWarningLevels(txtModMessage);
    processSelectedPage(txtModMessage, txtModPage, hottTXbuttonID);
    hottSendResponse(txtModMessage, sizeof(*txtModMessage));
}
//============================  end of processing TextMode Request  =============================

#endif
