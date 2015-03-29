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

// navigation mode
typedef enum {
    NAV_MODE_NONE = 0,
    NAV_MODE_POSHOLD,
    NAV_MODE_WP
} navigationMode_e;

// FIXME ap_mode is badly named, it's a value that is compared to rcCommand, not a flag at it's name implies.

typedef struct gpsProfile_s {
    uint16_t gps_wp_radius;                 // if we are within this distance to a waypoint then we consider it reached (distance is in cm)
    uint8_t gps_lpf;                        // Low pass filter cut frequency for derivative calculation (default 20Hz)
    uint8_t nav_slew_rate;                  // Adds a rate control to nav output, will smoothen out nav angle spikes
    uint8_t nav_controls_heading;           // copter faces toward the navigation point, maghold must be enabled for it
    uint16_t nav_speed_min;                 // cm/sec
    uint16_t nav_speed_max;                 // cm/sec
    uint16_t ap_mode;                       // Temporarily Disables GPS_HOLD_MODE to be able to make it possible to adjust the Hold-position when moving the sticks, creating a deadspan for GPS

   uint8_t fw_vector_trust;
   uint8_t fw_flaperons_invert;
   int16_t fw_gps_maxcorr; // Degrees banking Allowed by GPS.
   int16_t fw_gps_rudder; // Maximum Rudder
   int16_t fw_gps_maxclimb; // Degrees climbing . To much can stall the plane.
   int16_t fw_gps_maxdive; // Degrees Diving . To much can overspeed the plane.
   uint16_t fw_climb_throttle; // Max allowed throttle in GPS modes.
   uint16_t fw_cruise_throttle; // Throttle to set for cruisespeed.
   uint16_t fw_idle_throttle; // Lowest throttleValue during Descend
   uint16_t fw_scaler_throttle; // Adjust to Match Power/Weight ratio of your model
   float fw_roll_comp;

} gpsProfile_t;

extern int16_t GPS_angle[ANGLE_INDEX_COUNT];                // it's the angles that must be applied for GPS correction

extern int32_t GPS_home[3];
extern int32_t GPS_hold[3];

extern uint16_t GPS_distanceToHome;        // distance to home point in meters
extern int16_t GPS_directionToHome;        // direction to home or hol point in degrees

extern navigationMode_e nav_mode;          // Navigation mode

void GPS_reset_home_position(void);
void GPS_reset_nav(void);
void GPS_set_next_wp(int32_t* lat, int32_t* lon);
void gpsUseProfile(gpsProfile_t *gpsProfileToUse);
void gpsUsePIDs(pidProfile_t *pidProfile);
void updateGpsStateForHomeAndHoldMode(void);
void updateGpsWaypointsAndMode(void);
void fw_nav(void);
void fw_nav_reset(void);

void onGpsNewData(void);
