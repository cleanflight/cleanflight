/*
 * This file is part of Cleanflight.
 *
 * Cleanflight is free software. You can redistribute
 * this software and/or modify this software under the terms of the
 * GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option)
 * any later version.
 *
 * Cleanflight is distributed in the hope that it
 * will be useful, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this software.
 *
 * If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#include <stdbool.h>

extern bool cliMode;

void cliProcess(void);
bool hasCustomDefaults(void);
struct serialPort_s;
void cliEnter(struct serialPort_s *serialPort);
bool resetConfigToCustomDefaults(void);

#ifdef USE_CLI_DEBUG_PRINT
void cliPrint(const char *str);
void cliPrintLinefeed(void);
void cliPrintLine(const char *str);
void cliPrintf(const char *format, ...);
void cliPrintLinef(const char *format, ...);
#endif
