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


#ifdef SRC_MAIN_FLIGHT_ALTITUDEHOLD_C_
#ifdef UNIT_TEST
uint32_t unittest_calculateEstimatedAltitude_previousTime;
float unittest_calculateEstimatedAltitude_vel;
float unittest_calculateEstimatedAltitude_accAlt;
float unittest_calculateEstimatedAltitude_vel_acc;

#define SET_CALCULATED_ESTIMATED_ALTITUDE_LOCALS() \
    { \
        previousTime = unittest_calculateEstimatedAltitude_previousTime; \
        vel = unittest_calculateEstimatedAltitude_vel; \
        accAlt = unittest_calculateEstimatedAltitude_accAlt; \
        vel_acc = unittest_calculateEstimatedAltitude_vel_acc; \
    }

#define GET_CALCULATED_ESTIMATED_ALTITUDE_LOCALS() \
    { \
        unittest_calculateEstimatedAltitude_previousTime = previousTime; \
        unittest_calculateEstimatedAltitude_vel = vel; \
        unittest_calculateEstimatedAltitude_accAlt = accAlt; \
        unittest_calculateEstimatedAltitude_vel_acc = vel_acc; \
    }
#else
#define SET_CALCULATED_ESTIMATED_ALTITUDE_LOCALS() {}
#define GET_CALCULATED_ESTIMATED_ALTITUDE_LOCALS() {}
#endif // UNIT_TEST
#endif // SRC_MAIN_FLIGHT_ALTITUDEHOLD_C_

