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


#include <stdbool.h>
#include <stdint.h>
#include <ctype.h>
#include <string.h>
#include <math.h>

#include "platform.h"
#include "debug.h"

#include "common/maths.h"
#include "common/axis.h"

#include "drivers/system.h"
#include "drivers/serial.h"
#include "drivers/serial_uart.h"
#include "drivers/gpio.h"
#include "drivers/light_led.h"

#include "sensors/sensors.h"

#include "io/beeper.h"
#include "io/serial.h"
#include "io/gps.h"
#include "io/rc_controls.h"

#include "flight/pid.h"
#include "flight/navigation.h"
#include "flight/gps_conversion.h"

#include "rx/rx.h"


#include "config/config.h"
#include "config/runtime_config.h"

extern int16_t magHold;

#ifdef GPS

bool areSticksInApModePosition(uint16_t ap_mode);

// **********************
// GPS
// **********************
int16_t GPS_angle[ANGLE_INDEX_COUNT] = { 0, 0, 0 };    // it's the angles that must be applied for GPS correction
int32_t GPS_home[3];
int32_t GPS_hold[3];

uint16_t GPS_distanceToHome;        // distance to home point in meters
int16_t GPS_directionToHome;        // direction to home or hol point in degrees

static int16_t nav[2];
static int16_t nav_rated[2];               // Adding a rate controller to the navigation to make it smoother
navigationMode_e nav_mode = NAV_MODE_NONE;    // Navigation mode

static gpsProfile_t *gpsProfile;

void gpsUseProfile(gpsProfile_t *gpsProfileToUse)
{
    gpsProfile = gpsProfileToUse;
}

// When using PWM input GPS usage reduces number of available channels by 2 - see pwm_common.c/pwmInit()
void navigationInit(gpsProfile_t *initialGpsProfile, pidProfile_t *pidProfile)
{
    gpsUseProfile(initialGpsProfile);
    gpsUsePIDs(pidProfile);
}



/*-----------------------------------------------------------
 *
 * Multiwii GPS code - revision: 1097
 *
 *-----------------------------------------------------------*/
#define POSHOLD_IMAX           20       // degrees
#define POSHOLD_RATE_IMAX      20       // degrees
#define NAV_IMAX               20       // degrees

/* GPS navigation can control the heading */
#define NAV_TAIL_FIRST             0    // true - copter comes in with tail first
#define NAV_SET_TAKEOFF_HEADING    1    // true - when copter arrives to home position it rotates it's head to takeoff direction

#define GPS_FILTERING              1    // add a 5 element moving average filter to GPS coordinates, helps eliminate gps noise but adds latency
#define GPS_LOW_SPEED_D_FILTER     1    // below .5m/s speed ignore D term for POSHOLD_RATE, theoretically this also removed D term induced noise

static bool check_missed_wp(void);
static void GPS_distance_cm_bearing(int32_t * lat1, int32_t * lon1, int32_t * lat2, int32_t * lon2, uint32_t * dist, int32_t * bearing);
//static void GPS_distance(int32_t lat1, int32_t lon1, int32_t lat2, int32_t lon2, uint16_t* dist, int16_t* bearing);
static void GPS_calc_longitude_scaling(int32_t lat);
static void GPS_calc_velocity(void);
static void GPS_calc_location_error(int32_t * target_lat, int32_t * target_lng, int32_t * gps_lat, int32_t * gps_lng);
static void GPS_calc_poshold(void);
static void GPS_calc_nav_rate(uint16_t max_speed);
static void GPS_update_crosstrack(void);
static uint16_t GPS_calc_desired_speed(uint16_t max_speed, bool _slow);

static int32_t wrap_18000(int32_t error);
static int32_t wrap_36000(int32_t angle);

typedef struct {
    int16_t last_velocity;
} LeadFilter_PARAM;

typedef struct {
    float kP;
    float kI;
    float kD;
    float Imax;
} PID_PARAM;

static PID_PARAM posholdPID_PARAM;
static PID_PARAM poshold_ratePID_PARAM;
static PID_PARAM navPID_PARAM;
static PID_PARAM altPID_PARAM;

typedef struct {
    float integrator;          // integrator value
    int32_t last_input;        // last input for derivative
    float last_derivative;     // last derivative for low-pass filter
    float output;
    float derivative;
} PID;

static PID posholdPID[2];
static PID poshold_ratePID[2];
static PID navPID[2];

static int32_t get_P(int32_t error, PID_PARAM *pid)
{
    return (float)error * pid->kP;
}

static int32_t get_I(int32_t error, float *dt, PID *pid, PID_PARAM *pid_param)
{
    pid->integrator += ((float)error * pid_param->kI) * *dt;
    pid->integrator = constrain(pid->integrator, -pid_param->Imax, pid_param->Imax);
    return pid->integrator;
}

static int32_t get_D(int32_t input, float *dt, PID *pid, PID_PARAM *pid_param)
{
    pid->derivative = (input - pid->last_input) / *dt;

    // Low pass filter cut frequency for derivative calculation
    // Set to  "1 / ( 2 * PI * gps_lpf )
    float pidFilter = (1.0f / (2.0f * M_PIf * (float)gpsProfile->gps_lpf));
    // discrete low pass filter, cuts out the
    // high frequency noise that can drive the controller crazy
    pid->derivative = pid->last_derivative + (*dt / (pidFilter + *dt)) * (pid->derivative - pid->last_derivative);
    // update state
    pid->last_input = input;
    pid->last_derivative = pid->derivative;
    // add in derivative component
    return pid_param->kD * pid->derivative;
}

static void reset_PID(PID *pid)
{
    pid->integrator = 0;
    pid->last_input = 0;
    pid->last_derivative = 0;
}

#define GPS_X 1
#define GPS_Y 0

/****************** PI and PID controllers for GPS ********************///32938 -> 33160

#define RADX100                    0.000174532925f
#define CROSSTRACK_GAIN            1
#define NAV_SLOW_NAV               true
#define NAV_BANK_MAX               3000 // 30deg max banking when navigating (just for security and testing)

static float dTnav;             // Delta Time in milliseconds for navigation computations, updated with every good GPS read
static int16_t actual_speed[2] = { 0, 0 };
static float GPS_scaleLonDown = 1.0f;  // this is used to offset the shrinking longitude as we go towards the poles

// The difference between the desired rate of travel and the actual rate of travel
// updated after GPS read - 5-10hz
static int16_t rate_error[2];
static int32_t error[2];

// Currently used WP
static int32_t GPS_WP[2];

////////////////////////////////////////////////////////////////////////////////
// Location & Navigation
////////////////////////////////////////////////////////////////////////////////
// This is the angle from the copter to the "next_WP" location in degrees * 100
static int32_t target_bearing;
////////////////////////////////////////////////////////////////////////////////
// Crosstrack
////////////////////////////////////////////////////////////////////////////////
// deg * 100, The original angle to the next_WP when the next_WP was set
// Also used to check when we pass a WP
static int32_t original_target_bearing;
// The amount of angle correction applied to target_bearing to bring the copter back on its optimum path
static int16_t crosstrack_error;
////////////////////////////////////////////////////////////////////////////////
// The location of the copter in relation to home, updated every GPS read (1deg - 100)
//static int32_t home_to_copter_bearing;
// distance between plane and home in cm
//static int32_t home_distance;
// distance between plane and next_WP in cm
static uint32_t wp_distance;

// used for slow speed wind up when start navigation;
static int16_t waypoint_speed_gov;

////////////////////////////////////////////////////////////////////////////////////
// moving average filter variables
//
#define GPS_FILTER_VECTOR_LENGTH 5

static uint8_t GPS_filter_index = 0;
static int32_t GPS_filter[2][GPS_FILTER_VECTOR_LENGTH];
static int32_t GPS_filter_sum[2];
static int32_t GPS_read[2];
static int32_t GPS_filtered[2];
static int32_t GPS_degree[2];   //the lat lon degree without any decimals (lat/10 000 000)
static uint16_t fraction3[2];

// This is the angle from the copter to the "next_WP" location
// with the addition of Crosstrack error in degrees * 100
static int32_t nav_bearing;
// saves the bearing at takeof (1deg = 1) used to rotate to takeoff direction when arrives at home
static int16_t nav_takeoff_bearing;

void GPS_calculateDistanceAndDirectionToHome(void)
{
    if (STATE(GPS_FIX_HOME)) {      // If we don't have home set, do not display anything
        uint32_t dist;
        int32_t dir;
        GPS_distance_cm_bearing(&GPS_coord[LAT], &GPS_coord[LON], &GPS_home[LAT], &GPS_home[LON], &dist, &dir);
        GPS_distanceToHome = dist / 100;
        GPS_directionToHome = dir / 100;
    } else {
        GPS_distanceToHome = 0;
        GPS_directionToHome = 0;
    }
}

void onGpsNewData(void)
{
    int axis;
    static uint32_t nav_loopTimer;
    uint16_t speed;


    if (!(STATE(GPS_FIX) && GPS_numSat >= 5)) {
        return;
    }

    if (!ARMING_FLAG(ARMED))
        DISABLE_STATE(GPS_FIX_HOME);

    if (!STATE(GPS_FIX_HOME) && ARMING_FLAG(ARMED))
        GPS_reset_home_position();

    // Apply moving average filter to GPS data
#if defined(GPS_FILTERING)
    GPS_filter_index = (GPS_filter_index + 1) % GPS_FILTER_VECTOR_LENGTH;
    for (axis = 0; axis < 2; axis++) {
        GPS_read[axis] = GPS_coord[axis];               // latest unfiltered data is in GPS_latitude and GPS_longitude
        GPS_degree[axis] = GPS_read[axis] / 10000000;   // get the degree to assure the sum fits to the int32_t

        // How close we are to a degree line ? its the first three digits from the fractions of degree
        // later we use it to Check if we are close to a degree line, if yes, disable averaging,
        fraction3[axis] = (GPS_read[axis] - GPS_degree[axis] * 10000000) / 10000;

        GPS_filter_sum[axis] -= GPS_filter[axis][GPS_filter_index];
        GPS_filter[axis][GPS_filter_index] = GPS_read[axis] - (GPS_degree[axis] * 10000000);
        GPS_filter_sum[axis] += GPS_filter[axis][GPS_filter_index];
        GPS_filtered[axis] = GPS_filter_sum[axis] / GPS_FILTER_VECTOR_LENGTH + (GPS_degree[axis] * 10000000);
        if (nav_mode == NAV_MODE_POSHOLD) {             // we use gps averaging only in poshold mode...
            if (fraction3[axis] > 1 && fraction3[axis] < 999)
                GPS_coord[axis] = GPS_filtered[axis];
        }
    }
#endif

    //
    // Calculate time delta for navigation loop, range 0-1.0f, in seconds
    //
    // Time for calculating x,y speed and navigation pids
    dTnav = (float)(millis() - nav_loopTimer) / 1000.0f;
    nav_loopTimer = millis();
    // prevent runup from bad GPS
    dTnav = MIN(dTnav, 1.0f);

    GPS_calculateDistanceAndDirectionToHome();

    // calculate the current velocity based on gps coordinates continously to get a valid speed at the moment when we start navigating
    GPS_calc_velocity();

    if (FLIGHT_MODE(GPS_HOLD_MODE) || FLIGHT_MODE(GPS_HOME_MODE)) {
        // we are navigating

        // gps nav calculations, these are common for nav and poshold
        GPS_distance_cm_bearing(&GPS_coord[LAT], &GPS_coord[LON], &GPS_WP[LAT], &GPS_WP[LON], &wp_distance, &target_bearing);
        GPS_calc_location_error(&GPS_WP[LAT], &GPS_WP[LON], &GPS_coord[LAT], &GPS_coord[LON]);

        switch (nav_mode) {
        case NAV_MODE_POSHOLD:
            // Desired output is in nav_lat and nav_lon where 1deg inclination is 100
            GPS_calc_poshold();
            break;

        case NAV_MODE_WP:
            speed = GPS_calc_desired_speed(gpsProfile->nav_speed_max, NAV_SLOW_NAV);    // slow navigation
            // use error as the desired rate towards the target
            // Desired output is in nav_lat and nav_lon where 1deg inclination is 100
            GPS_calc_nav_rate(speed);

            // Tail control
            if (gpsProfile->nav_controls_heading) {
                if (NAV_TAIL_FIRST) {
                    magHold = wrap_18000(nav_bearing - 18000) / 100;
                } else {
                    magHold = nav_bearing / 100;
                }
            }
            // Are we there yet ?(within x meters of the destination)
            if ((wp_distance <= gpsProfile->gps_wp_radius) || check_missed_wp()) {      // if yes switch to poshold mode
                nav_mode = NAV_MODE_POSHOLD;
                if (NAV_SET_TAKEOFF_HEADING) {
                    magHold = nav_takeoff_bearing;
                }
            }
            break;
        default:
            break;
        }
    }                   //end of gps calcs
}

void GPS_reset_home_position(void)
{
    if (STATE(GPS_FIX) && GPS_numSat >= 5) {
        GPS_home[LAT] = GPS_coord[LAT];
        GPS_home[LON] = GPS_coord[LON];
        GPS_home[ALT] = GPS_altitude;
        GPS_calc_longitude_scaling(GPS_coord[LAT]); // need an initial value for distance and bearing calc
        nav_takeoff_bearing = heading;              // save takeoff heading
        // Set ground altitude
        ENABLE_STATE(GPS_FIX_HOME);
    }
}

// reset navigation (stop the navigation processor, and clear nav)
void GPS_reset_nav(void)
{
    int i;

    for (i = 0; i < 2; i++) {
        GPS_angle[i] = 0;
        nav_rated[i] = 0;
        nav[i] = 0;
        reset_PID(&posholdPID[i]);
        reset_PID(&poshold_ratePID[i]);
        reset_PID(&navPID[i]);
    }
    if (STATE(FIXED_WING))
    {
    	fw_nav_reset();
    }

}

// Get the relevant P I D values and set the PID controllers
void gpsUsePIDs(pidProfile_t *pidProfile)
{
    posholdPID_PARAM.kP = (float)pidProfile->P8[PIDPOS] / 100.0f;
    posholdPID_PARAM.kI = (float)pidProfile->I8[PIDPOS] / 100.0f;
    posholdPID_PARAM.Imax = POSHOLD_RATE_IMAX * 100;

    poshold_ratePID_PARAM.kP = (float)pidProfile->P8[PIDPOSR] / 10.0f;
    poshold_ratePID_PARAM.kI = (float)pidProfile->I8[PIDPOSR] / 100.0f;
    poshold_ratePID_PARAM.kD = (float)pidProfile->D8[PIDPOSR] / 1000.0f;
    poshold_ratePID_PARAM.Imax = POSHOLD_RATE_IMAX * 100;

    navPID_PARAM.kP = (float)pidProfile->P8[PIDNAVR] / 10.0f;
    navPID_PARAM.kI = (float)pidProfile->I8[PIDNAVR] / 100.0f;
    navPID_PARAM.kD = (float)pidProfile->D8[PIDNAVR] / 1000.0f;
    navPID_PARAM.Imax = POSHOLD_RATE_IMAX * 100;

    if (STATE(FIXED_WING)) {
	   altPID_PARAM.kP = (float)pidProfile->P8[PIDALT] / 10.0f;
	   altPID_PARAM.kI = (float)pidProfile->I8[PIDALT] / 100.0f;
	   altPID_PARAM.kD = (float)pidProfile->D8[PIDALT] / 1000.0f;
   }

}

// OK here is the onboard GPS code

////////////////////////////////////////////////////////////////////////////////////
// PID based GPS navigation functions
// Author : EOSBandi
// Based on code and ideas from the Arducopter team: Jason Short,Randy Mackay, Pat Hickey, Jose Julio, Jani Hirvinen
// Andrew Tridgell, Justin Beech, Adam Rivera, Jean-Louis Naudin, Roberto Navoni

////////////////////////////////////////////////////////////////////////////////////
// this is used to offset the shrinking longitude as we go towards the poles
// It's ok to calculate this once per waypoint setting, since it changes a little within the reach of a multicopter
//
static void GPS_calc_longitude_scaling(int32_t lat)
{
    float rads = (ABS((float)lat) / 10000000.0f) * 0.0174532925f;
    GPS_scaleLonDown = cosf(rads);
}

////////////////////////////////////////////////////////////////////////////////////
// Sets the waypoint to navigate, reset neccessary variables and calculate initial values
//
void GPS_set_next_wp(int32_t *lat, int32_t *lon)
{
    GPS_WP[LAT] = *lat;
    GPS_WP[LON] = *lon;

    GPS_calc_longitude_scaling(*lat);
    GPS_distance_cm_bearing(&GPS_coord[LAT], &GPS_coord[LON], &GPS_WP[LAT], &GPS_WP[LON], &wp_distance, &target_bearing);

    nav_bearing = target_bearing;
    GPS_calc_location_error(&GPS_WP[LAT], &GPS_WP[LON], &GPS_coord[LAT], &GPS_coord[LON]);
    original_target_bearing = target_bearing;
    waypoint_speed_gov = gpsProfile->nav_speed_min;
}

////////////////////////////////////////////////////////////////////////////////////
// Check if we missed the destination somehow
//
static bool check_missed_wp(void)
{
    int32_t temp;
    temp = target_bearing - original_target_bearing;
    temp = wrap_18000(temp);
    return (ABS(temp) > 10000); // we passed the waypoint by 100 degrees
}

#define DISTANCE_BETWEEN_TWO_LONGITUDE_POINTS_AT_EQUATOR_IN_HUNDREDS_OF_KILOMETERS 1.113195f
#define TAN_89_99_DEGREES 5729.57795f

////////////////////////////////////////////////////////////////////////////////////
// Get distance between two points in cm
// Get bearing from pos1 to pos2, returns an 1deg = 100 precision
static void GPS_distance_cm_bearing(int32_t *currentLat1, int32_t *currentLon1, int32_t *destinationLat2, int32_t *destinationLon2, uint32_t *dist, int32_t *bearing)
{
    float dLat = *destinationLat2 - *currentLat1; // difference of latitude in 1/10 000 000 degrees
    float dLon = (float)(*destinationLon2 - *currentLon1) * GPS_scaleLonDown;
    *dist = sqrtf(sq(dLat) + sq(dLon)) * DISTANCE_BETWEEN_TWO_LONGITUDE_POINTS_AT_EQUATOR_IN_HUNDREDS_OF_KILOMETERS;

    *bearing = 9000.0f + atan2f(-dLat, dLon) * TAN_89_99_DEGREES;      // Convert the output radians to 100xdeg
    if (*bearing < 0)
        *bearing += 36000;
}

////////////////////////////////////////////////////////////////////////////////////
// keep old calculation function for compatibility (could be removed later) distance in meters, bearing in degree
//
//static void GPS_distance(int32_t lat1, int32_t lon1, int32_t lat2, int32_t lon2, uint16_t* dist, int16_t* bearing) {
//  uint32_t d1;
//  int32_t  d2;
//  GPS_distance_cm_bearing(&lat1,&lon1,&lat2,&lon2,&d1,&d2);
//  *dist = d1 / 100;          //convert to meters
//  *bearing = d2 /  100;      //convert to degrees
//}

////////////////////////////////////////////////////////////////////////////////////
// Calculate our current speed vector from gps position data
//
static void GPS_calc_velocity(void)
{
    static int16_t speed_old[2] = { 0, 0 };

	actual_speed[GPS_X] = (float)(GPS_VELNED[1]); //mm/s
	actual_speed[GPS_Y] = (float)(GPS_VELNED[0]); //mm/s

	// average with previous sample
	actual_speed[GPS_X] = (actual_speed[GPS_X] + speed_old[GPS_X]) / 2;
	actual_speed[GPS_Y] = (actual_speed[GPS_Y] + speed_old[GPS_Y]) / 2;

	speed_old[GPS_X] = actual_speed[GPS_X];
	speed_old[GPS_Y] = actual_speed[GPS_Y];
}

////////////////////////////////////////////////////////////////////////////////////
// Calculate a location error between two gps coordinates
// Because we are using lat and lon to do our distance errors here's a quick chart:
//      100     = 1m
//      1000    = 11m    = 36 feet
//      1800    = 19.80m = 60 feet
//      3000    = 33m
//      10000   = 111m
//
static void GPS_calc_location_error(int32_t *target_lat, int32_t *target_lng, int32_t *gps_lat, int32_t *gps_lng)
{
    error[LON] = (float)(*target_lng - *gps_lng) * GPS_scaleLonDown;   // X Error
    error[LAT] = *target_lat - *gps_lat;        // Y Error
}

////////////////////////////////////////////////////////////////////////////////////
// Calculate nav_lat and nav_lon from the x and y error and the speed
//
static void GPS_calc_poshold(void)
{
    int32_t d;
    int32_t target_speed;
    int axis;

    for (axis = 0; axis < 2; axis++) {
        target_speed = get_P(error[axis], &posholdPID_PARAM);       // calculate desired speed from lon error
        rate_error[axis] = target_speed - actual_speed[axis];       // calc the speed error

        nav[axis] = get_P(rate_error[axis], &poshold_ratePID_PARAM) +
                    get_I(rate_error[axis] + error[axis], &dTnav, &poshold_ratePID[axis], &poshold_ratePID_PARAM);
        d = get_D(error[axis], &dTnav, &poshold_ratePID[axis], &poshold_ratePID_PARAM);
        d = constrain(d, -2000, 2000);

        // get rid of noise
#if defined(GPS_LOW_SPEED_D_FILTER)
        if (ABS(actual_speed[axis]) < 50)
            d = 0;
#endif

        nav[axis] += d;
        nav[axis] = constrain(nav[axis], -NAV_BANK_MAX, NAV_BANK_MAX);
        navPID[axis].integrator = poshold_ratePID[axis].integrator;
    }
}

////////////////////////////////////////////////////////////////////////////////////
// Calculate the desired nav_lat and nav_lon for distance flying such as RTH
//
static void GPS_calc_nav_rate(uint16_t max_speed)
{
    float trig[2];
    float temp;
    int axis;

    // push us towards the original track
    GPS_update_crosstrack();

    // nav_bearing includes crosstrack
    temp = (9000l - nav_bearing) * RADX100;
    trig[GPS_X] = cosf(temp);
    trig[GPS_Y] = sinf(temp);

    for (axis = 0; axis < 2; axis++) {
        rate_error[axis] = (trig[axis] * max_speed) - actual_speed[axis];
        rate_error[axis] = constrain(rate_error[axis], -1000, 1000);
        // P + I + D
        nav[axis] = get_P(rate_error[axis], &navPID_PARAM) +
                    get_I(rate_error[axis], &dTnav, &navPID[axis], &navPID_PARAM) +
                    get_D(rate_error[axis], &dTnav, &navPID[axis], &navPID_PARAM);

        nav[axis] = constrain(nav[axis], -NAV_BANK_MAX, NAV_BANK_MAX);
        poshold_ratePID[axis].integrator = navPID[axis].integrator;
    }
}

////////////////////////////////////////////////////////////////////////////////////
// Calculating cross track error, this tries to keep the copter on a direct line
// when flying to a waypoint.
//
static void GPS_update_crosstrack(void)
{
    if (ABS(wrap_18000(target_bearing - original_target_bearing)) < 4500) {     // If we are too far off or too close we don't do track following
        float temp = (target_bearing - original_target_bearing) * RADX100;
        crosstrack_error = sinf(temp) * (wp_distance * CROSSTRACK_GAIN); // Meters we are off track line
        nav_bearing = target_bearing + constrain(crosstrack_error, -3000, 3000);
        nav_bearing = wrap_36000(nav_bearing);
    } else {
        nav_bearing = target_bearing;
    }
}

////////////////////////////////////////////////////////////////////////////////////
// Determine desired speed when navigating towards a waypoint, also implement slow
// speed rampup when starting a navigation
//
//      |< WP Radius
//      0  1   2   3   4   5   6   7   8m
//      ...|...|...|...|...|...|...|...|
//                100  |  200     300     400cm/s
//                 |                                        +|+
//                 |< we should slow to 1.5 m/s as we hit the target
//
static uint16_t GPS_calc_desired_speed(uint16_t max_speed, bool _slow)
{
    // max_speed is default 400 or 4m/s
    if (_slow) {
        max_speed = MIN(max_speed, wp_distance / 2);
    } else {
        max_speed = MIN(max_speed, wp_distance);
        max_speed = MAX(max_speed, gpsProfile->nav_speed_min);      // go at least 100cm/s
    }

    // limit the ramp up of the speed
    // waypoint_speed_gov is reset to 0 at each new WP command
    if (max_speed > waypoint_speed_gov) {
        waypoint_speed_gov += (int)(100.0f * dTnav);    // increase at .5/ms
        max_speed = waypoint_speed_gov;
    }
    return max_speed;
}

////////////////////////////////////////////////////////////////////////////////////
// Utilities
//
static int32_t wrap_18000(int32_t error)
{
    if (error > 18000)
        error -= 36000;
    if (error < -18000)
        error += 36000;
    return error;
}

static int32_t wrap_36000(int32_t angle)
{
    if (angle > 36000)
        angle -= 36000;
    if (angle < 0)
        angle += 36000;
    return angle;
}

void updateGpsStateForHomeAndHoldMode(void)
{
    float sin_yaw_y = sinf(heading * 0.0174532925f);
    float cos_yaw_x = cosf(heading * 0.0174532925f);
    if(!STATE(FIXED_WING))
    {
    if (gpsProfile->nav_slew_rate) {
        nav_rated[LON] += constrain(wrap_18000(nav[LON] - nav_rated[LON]), -gpsProfile->nav_slew_rate, gpsProfile->nav_slew_rate); // TODO check this on uint8
        nav_rated[LAT] += constrain(wrap_18000(nav[LAT] - nav_rated[LAT]), -gpsProfile->nav_slew_rate, gpsProfile->nav_slew_rate);
        GPS_angle[AI_ROLL] = (nav_rated[LON] * cos_yaw_x - nav_rated[LAT] * sin_yaw_y) / 10;
        GPS_angle[AI_PITCH] = (nav_rated[LON] * sin_yaw_y + nav_rated[LAT] * cos_yaw_x) / 10;
    } else {
        GPS_angle[AI_ROLL] = (nav[LON] * cos_yaw_x - nav[LAT] * sin_yaw_y) / 10;
        GPS_angle[AI_PITCH] = (nav[LON] * sin_yaw_y + nav[LAT] * cos_yaw_x) / 10;
    }
    }
    else{
    	fw_nav();
    }
}

void updateGpsWaypointsAndMode(void)
{
    bool resetNavNow = false;
    static bool gpsReadyBeepDone = false;

    if (STATE(GPS_FIX) && GPS_numSat >= 5) {

        //
        // process HOME mode
        //
        // HOME mode takes priority over HOLD mode.

        if (IS_RC_MODE_ACTIVE(BOXGPSHOME)) {
            if (!FLIGHT_MODE(GPS_HOME_MODE)) {

                // Transition to HOME mode
                ENABLE_FLIGHT_MODE(GPS_HOME_MODE);
                DISABLE_FLIGHT_MODE(GPS_HOLD_MODE);
                GPS_set_next_wp(&GPS_home[LAT], &GPS_home[LON]);
                nav_mode = NAV_MODE_WP;
                resetNavNow = true;
            }
        } else {
            if (FLIGHT_MODE(GPS_HOME_MODE)) {

                // Transition from HOME mode
                DISABLE_FLIGHT_MODE(GPS_HOME_MODE);
                nav_mode = NAV_MODE_NONE;
                resetNavNow = true;
            }

            //
            // process HOLD mode
            //

            if (IS_RC_MODE_ACTIVE(BOXGPSHOLD) && areSticksInApModePosition(gpsProfile->ap_mode)) {
                if (!FLIGHT_MODE(GPS_HOLD_MODE)) {

                    // Transition to HOLD mode
                    ENABLE_FLIGHT_MODE(GPS_HOLD_MODE);
                    GPS_hold[LAT] = GPS_coord[LAT];
                    GPS_hold[LON] = GPS_coord[LON];
                    GPS_set_next_wp(&GPS_hold[LAT], &GPS_hold[LON]);
                    nav_mode = NAV_MODE_POSHOLD;
                    resetNavNow = true;
                }
            } else {
                if (FLIGHT_MODE(GPS_HOLD_MODE)) {

                    // Transition from HOLD mode
                    DISABLE_FLIGHT_MODE(GPS_HOLD_MODE);
                    nav_mode = NAV_MODE_NONE;
                    resetNavNow = true;
                }
            }
        }
        if (!gpsReadyBeepDone) {            //if 'ready' beep not yet done
            beeper(BEEPER_READY_BEEP);      //do ready beep now
            gpsReadyBeepDone = true;        //only beep once
        }
    } else {
        if (FLIGHT_MODE(GPS_HOLD_MODE | GPS_HOME_MODE)) {

            // Transition from HOME or HOLD mode
            DISABLE_FLIGHT_MODE(GPS_HOME_MODE);
            DISABLE_FLIGHT_MODE(GPS_HOLD_MODE);
            nav_mode = NAV_MODE_NONE;
            resetNavNow = true;
        }
    }

    if (resetNavNow) {
        GPS_reset_nav();
    }
}

#include "drivers/system.h"
#include "drivers/pwm_output.h"
#include "drivers/pwm_mapping.h"
#include "drivers/sensor.h"
#include "drivers/accgyro.h"
#include "drivers/system.h"

#include "rx/rx.h"

#include "io/gimbal.h"
#include "io/escservo.h"
#include "io/rc_controls.h"

#include "sensors/sensors.h"
#include "sensors/acceleration.h"

#include "flight/mixer.h"
#include "flight/pid.h"
#include "flight/imu.h"


// from gps.c
extern int32_t nav_bearing;
extern uint32_t wp_distance;
extern PID_PARAM navPID_PARAM;
extern PID_PARAM altPID_PARAM;

#define GPS_UPD_HZ 5 // Set loop time for NavUpdate 5 Hz is enough
#define PITCH_COMP 0.5f // Compensate throttle relative angle of attack
// Candidates for CLI
#define SAFE_NAV_ALT 20 // Safe Altitude during climbouts Wings Level below this Alt. (ex. trees & buildings..)
#define SAFE_DECSCEND_ZONE 50 // Radius around home where descending is OK
// For speedBoost
#define GPS_MINSPEED 500 // 500= ~18km/h
#define I_TERM 0.1f
float navErrorI;
float altErrorI;
static int16_t lastAltDiff;
static int16_t lastnavDiff;
static int16_t speedBoost;
static int16_t altHist[GPS_UPD_HZ + 1]; // shift register
static int16_t navDif[GPS_UPD_HZ + 1];// shift register

void fw_nav_reset(void)
{
	uint8_t i;
	navErrorI = 0;
	altErrorI = 0;
	lastAltDiff = 0;
	lastnavDiff = 0;
	speedBoost = 0;
	for (i = 0; i < GPS_UPD_HZ; i++) {
		altHist[i] = 0;
		navDif[i] = 0;
	}
}

void fw_nav(void)
{
	int16_t GPS_Heading = GPS_ground_course; // Store current bearing
	int16_t Current_Heading;// Store current bearing
	int16_t altDiff = 0;
	int16_t RTH_Alt = poshold_ratePID_PARAM.kD;// conf.pid[PIDALT].D8;
	int16_t delta[2] = {0, 0}; // D-Term
	static int16_t NAV_deltaSum, ALT_deltaSum, GPS_FwTarget, GPS_AltErr, NAV_Thro;
	int16_t TX_Thro = rcData[THROTTLE];// Read and store Throttle pos.
	int16_t navDiff;// Navigation error
	float navDT;
	static uint32_t nav_loopT;
	int16_t groundSpeed;
	int spDiff;
	uint8_t i;
// Nav timer
	static uint32_t gpsTimer = 0;
	static uint16_t gpsFreq = 1000 / GPS_UPD_HZ;// 5HZ 200ms DT
// Calculated Altitude over home in meters
	int16_t currAlt = GPS_altitude - GPS_home[ALT];// GPS
	int16_t navTargetAlt = GPS_hold[ALT] - GPS_home[ALT];// Diff from homeAlt.
// Handles ReSetting RTH alt if rth is enabled to low!
	if (STATE(CLIMBOUT_FW) && currAlt < RTH_Alt) {
		GPS_hold[ALT] = GPS_home[ALT] + RTH_Alt;
	}
// Wrap GPS_Heading 1800
	GPS_Heading = wrap_18000(GPS_Heading * 10) / 10;
// Only use MAG if Mag and GPS_Heading aligns
	if (sensors(SENSOR_MAG)) {
		if (fabs(heading - (GPS_Heading / 10)) > 10 && GPS_speed > 200) {
			Current_Heading = GPS_Heading / 10;
		} else {
			Current_Heading = heading;
		}
	} else {
		Current_Heading = GPS_Heading / 10;
	}
// Calculate Navigation errors
	GPS_FwTarget = nav_bearing / 100;
	navDiff = GPS_FwTarget - Current_Heading;// Navigation Error
	GPS_AltErr = currAlt - navTargetAlt;// Altitude error Negative means you're to low
// Start of NavTimer
	if (millis() - gpsTimer >= gpsFreq) {
		gpsTimer = millis();
// Throttle control
// Deadpan for throttle at correct Alt.
		if (fabs(GPS_AltErr) < 1) { // Just cruise along in deadpan.
			NAV_Thro = gpsProfile->fw_cruise_throttle;
		} else {
// Add AltitudeError and scale up with a factor to throttle
			NAV_Thro = constrain(gpsProfile->fw_cruise_throttle - (GPS_AltErr * gpsProfile->fw_scaler_throttle), gpsProfile->fw_idle_throttle, gpsProfile->fw_climb_throttle);
		}
// Reset Climbout Flag when Alt have been reached
		if (STATE(CLIMBOUT_FW) && GPS_AltErr >= 0) {
			DISABLE_STATE(CLIMBOUT_FW);
		}
// Climb out before RTH
		if (FLIGHT_MODE(GPS_HOME_MODE)) {
			if (STATE(CLIMBOUT_FW)) {
				GPS_AltErr = -(gpsProfile->fw_gps_maxclimb * 10); // Max climbAngle
				NAV_Thro = gpsProfile->fw_climb_throttle;// Max Allowed Throttle
				if (currAlt < SAFE_NAV_ALT){
				navDiff = 0;// Force climb with Level Wings below safe Alt
				}
			}
			if ((GPS_distanceToHome < SAFE_DECSCEND_ZONE) && currAlt > RTH_Alt) {
				GPS_hold[ALT] = GPS_home[ALT] + RTH_Alt; // Start descend to correct RTH Alt.
			}
		}
// Always DISARM when Home is within 10 meters if FC is in failsafe.
		if (STATE(FW_FAILSAFE_RTH_ENABLE) && (GPS_distanceToHome < 10)) {
			DISABLE_ARMING_FLAG(ARMED);
			DISABLE_STATE(CLIMBOUT_FW); // Abort Climbout
			GPS_hold[ALT] = GPS_home[ALT] + 5;// Come down
		}
// Filtering of navDiff around home to stop nervous servos
		if (GPS_distanceToHome < 10) {
			navDiff *= 0.1;
		}
// Wrap Heading 180
		navDiff = wrap_18000(navDiff * 100) / 100;
		if (fabs(navDiff) > 170) {
			navDiff = 175; // Forced turn.
		}
// PID for Navigating planes.
		navDT = (float) (millis() - nav_loopT) / 1000;
		nav_loopT = millis();
// Altitude PID
		if (fabs(GPS_AltErr) <= 3) {
			altErrorI *= navDT; // Remove I-Term in deadspan
		}
		GPS_AltErr *= 10;
		altErrorI += (GPS_AltErr * altPID_PARAM.kI) * navDT; // Acumulate I from PIDPOSR
		altErrorI = constrain(altErrorI, -500, 500);// limits I term influence
		delta[0] = (GPS_AltErr - lastAltDiff);
		lastAltDiff = GPS_AltErr;
		if (fabs(delta[0]) > 100) {
			delta[0] = 0;
		}
		for (i = 0; i < GPS_UPD_HZ; i++) {
			altHist[i] = altHist[i + 1];
		}
		altHist[GPS_UPD_HZ - 1] = delta[0];
// Store 1 sec history for D-term in shift register
		ALT_deltaSum = 0;// Sum History
		for (i = 0; i < GPS_UPD_HZ; i++) {
			ALT_deltaSum += altHist[i];
		}
		ALT_deltaSum = (ALT_deltaSum * altPID_PARAM.kD) / navDT;
		altDiff = GPS_AltErr * altPID_PARAM.kP; // Add P in Elevator compensation.
		altDiff += (altErrorI);// Add I
// Start of NavPID
		if (fabs(navDiff) <= 3) {
			navErrorI *= navDT; // Remove I-Term in deadspan
		}
		navDiff *= 10;
		navErrorI += (navDiff * navPID_PARAM.kI) * navDT;
		navErrorI = constrain(navErrorI, -500, 500);
		delta[1] = (navDiff - lastnavDiff);
		lastnavDiff = navDiff;
		if (fabs(delta[1]) > 100) {
			delta[1] = 0;
		}
// Store 1 sec history for D-term in shift register
		for (i = 0; i < GPS_UPD_HZ; i++) {
			navDif[i] = navDif[i + 1];
		}
		navDif[GPS_UPD_HZ - 1] = delta[1];
		NAV_deltaSum = 0; // Sum History
		for (i = 0; i < GPS_UPD_HZ; i++) {
			NAV_deltaSum += navDif[i];
		}
		NAV_deltaSum = (NAV_deltaSum * navPID_PARAM.kD) / navDT; // Add D
		navDiff *= navPID_PARAM.kP;// Add P
		navDiff += navErrorI;// Add I
// End of NavPID
// Limit outputs
		GPS_angle[AI_PITCH] = constrain(altDiff / 10, -gpsProfile->fw_gps_maxclimb * 10, gpsProfile->fw_gps_maxdive * 10) + ALT_deltaSum;
		GPS_angle[AI_ROLL] = constrain(navDiff / 10, -gpsProfile->fw_gps_maxcorr * 10, gpsProfile->fw_gps_maxcorr * 10) + NAV_deltaSum;
		GPS_angle[AI_YAW] = constrain(navDiff / 10, -gpsProfile->fw_gps_rudder * 10, gpsProfile->fw_gps_rudder * 10) + NAV_deltaSum;
// Elevator compensation depending on behaviour.
// Prevent stall with Disarmed motor
		if (STATE(MOTORS_STOPPED)) {
			GPS_angle[AI_PITCH] = constrain(GPS_angle[PITCH], 0, gpsProfile->fw_gps_maxdive * 10);
		}
// Add elevator compared with rollAngle
		if (!STATE(CLIMBOUT_FW)) {
			GPS_angle[AI_PITCH] -= (fabs(inclination.values.rollDeciDegrees) * gpsProfile->fw_roll_comp);
		}
// Throttle compensation depending on behaviour.
// Compensate throttle with pitch Angle
		NAV_Thro -= constrain(inclination.values.pitchDeciDegrees * PITCH_COMP, 0, 450);
		NAV_Thro = constrain(NAV_Thro, gpsProfile->fw_idle_throttle, gpsProfile->fw_climb_throttle);
// Force the Plane move forward in headwind with speedBoost
		groundSpeed = GPS_speed;
		spDiff = (GPS_MINSPEED - groundSpeed) * I_TERM;
		if (GPS_speed < GPS_MINSPEED - 50 || GPS_speed > GPS_MINSPEED + 50) {
			speedBoost += spDiff;
		}
		speedBoost = constrain(speedBoost, 0, 500);
		NAV_Thro += speedBoost;
	}
// End of NavTimer
// PassThru for throttle In AcroMode
	if ((!FLIGHT_MODE(ANGLE_MODE) && !FLIGHT_MODE(HORIZON_MODE)) || (FLIGHT_MODE(PASSTHRU_MODE) && !STATE(FW_FAILSAFE_RTH_ENABLE))) {
		NAV_Thro = TX_Thro;
		GPS_angle[AI_PITCH] = 0;
		GPS_angle[AI_ROLL] = 0;
		GPS_angle[AI_YAW] = 0;
	}
	rcCommand[THROTTLE] = NAV_Thro;
	rcCommand[YAW] += GPS_angle[AI_YAW];
}
#endif
