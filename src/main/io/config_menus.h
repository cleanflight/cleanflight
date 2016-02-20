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

bool onGoingDataEditingWithSticks;

void sendContentOfPageToDisplay(void);
void processDataEditingWithSticks(uint8_t rcSticks);
void processDataEditing(uint8_t commandID);
void initDataEditingStructures(void);

#endif //_CONFIG_MENUS_H
