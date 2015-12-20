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


#ifdef SRC_MAIN_FLIGHT_PID_C_
#ifdef UNIT_TEST
float unittest_pidLuxFloat_PTerm[3];
float unittest_pidLuxFloat_ITerm[3];
float unittest_pidLuxFloat_DTerm[3];

#define GET_PID_LUX_FLOAT_LOCALS(axis) \
    { \
        unittest_pidLuxFloat_PTerm[axis] = PTerm; \
        unittest_pidLuxFloat_ITerm[axis] = ITerm; \
        unittest_pidLuxFloat_DTerm[axis] = DTerm; \
    }
#else
#define GET_PID_LUX_FLOAT_LOCALS() {}
#endif // UNIT_TEST
#endif // SRC_MAIN_FLIGHT_PID_C_

