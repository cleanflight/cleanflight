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

#pragma once

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64

#define FONT_WIDTH 5
#define FONT_HEIGHT 7
#define HORIZONTAL_PADDING 1
#define VERTICAL_PADDING 1

#define CHARACTER_WIDTH_TOTAL (FONT_WIDTH + HORIZONTAL_PADDING)
#define CHARACTER_HEIGHT_TOTAL (FONT_HEIGHT + VERTICAL_PADDING)

#define SCREEN_CHARACTER_COLUMN_COUNT (SCREEN_WIDTH / CHARACTER_WIDTH_TOTAL)
#define SCREEN_CHARACTER_ROW_COUNT (SCREEN_HEIGHT / CHARACTER_HEIGHT_TOTAL)

#define VERTICAL_BARGRAPH_ZERO_CHARACTER (128 + 32)
#define VERTICAL_BARGRAPH_CHARACTER_COUNT 7

bool ug2864hsweg01InitI2C(void);

void i2c_OLED_set_xy(uint8_t col, uint8_t row);
void i2c_OLED_set_line(uint8_t row);
void i2c_OLED_send_char(unsigned char ascii);
void i2c_OLED_send_string(const char *string);
void i2c_OLED_clear_display(void);
void i2c_OLED_clear_display_quick(void);

