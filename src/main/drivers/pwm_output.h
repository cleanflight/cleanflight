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

void pwmWriteMotor(uint8_t index, uint16_t value);
void pwmShutdownPulsesForAllMotors(uint8_t motorCount);
void pwmCompleteOneshotMotorUpdate(uint8_t motorCount);

void pwmWriteServo(uint8_t index, uint16_t value);

bool isMotorBrushed(uint16_t motorPwmRate);
