#include "board.h"
#include "mw.h"

// from gps.c
extern int32_t nav_bearing;
extern int32_t wp_distance;
extern PID_PARAM navPID_PARAM;
extern PID_PARAM altPID_PARAM;

#define GPS_UPD_HZ 5            // Set loop time for NavUpdate 5 Hz is enough
#define PITCH_COMP 0.5f         // Compensate throttle relative angle of attack
// Candidates for CLI
#define SAFE_NAV_ALT 20         // Safe Altitude during climbouts Wings Level below this Alt. (ex. trees & buildings..)
#define SAFE_DECSCEND_ZONE 50   // Radius around home where descending is OK
// For speedBoost
#define GPS_MINSPEED 500        // 500= ~18km/h
#define I_TERM 0.1f

float navErrorI;
float altErrorI;
static int16_t lastAltDiff;
static int16_t lastnavDiff;
static int16_t speedBoost;
static int16_t altHist[GPS_UPD_HZ + 1];     // shift register
static int16_t navDif[GPS_UPD_HZ + 1];      // shift register

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
    int16_t GPS_Heading = GPS_ground_course;    // Store current bearing
    int16_t Current_Heading;                    // Store current bearing
    int16_t altDiff = 0;
    int16_t RTH_Alt = cfg.D8[PIDPOSR];          // conf.pid[PIDALT].D8;
    int16_t delta[2] = { 0, 0 };                // D-Term
    static int16_t NAV_deltaSum, ALT_deltaSum, GPS_FwTarget, GPS_AltErr, NAV_Thro;
    int16_t TX_Thro = rcData[THROTTLE];         // Read and store Throttle pos.
    int16_t navDiff;                            // Navigation error
    float navDT;
    static uint32_t nav_loopT;
    int16_t groundSpeed;
    int spDiff;
    uint8_t i;
    
    // Nav timer
    static uint32_t gpsTimer = 0;
    static uint16_t gpsFreq = 1000 / GPS_UPD_HZ;    // 5HZ 200ms DT

    // Calculated Altitude over home in meters
    int16_t currAlt = GPS_altitude - GPS_home[ALT];         // GPS
    int16_t navTargetAlt = GPS_hold[ALT] - GPS_home[ALT];   // Diff from homeAlt.

    // Handles ReSetting RTH alt if rth is enabled to low!
    if (f.CLIMBOUT_FW && currAlt < RTH_Alt)
        GPS_hold[ALT] = GPS_home[ALT] + RTH_Alt;

    // Wrap GPS_Heading 1800
    GPS_Heading = wrap_18000(GPS_Heading * 10) / 10;
    
    // Only use MAG if Mag and GPS_Heading aligns
    if (sensors(SENSOR_MAG)) {
        if (abs(heading - (GPS_Heading / 10)) > 10 && GPS_speed > 200)
            Current_Heading = GPS_Heading / 10;
        else
            Current_Heading = heading;
    } else
        Current_Heading = GPS_Heading / 10;

    // Calculate Navigation errors
    GPS_FwTarget = nav_bearing / 100;
    navDiff = GPS_FwTarget - Current_Heading;   // Navigation Error
    GPS_AltErr = currAlt - navTargetAlt;        // Altitude error Negative means you're to low

    // Start of NavTimer
    if (millis() - gpsTimer >= gpsFreq) {
        gpsTimer = millis();

        // Throttle control
        // Deadpan for throttle at correct Alt.
        if (abs(GPS_AltErr) < 1) // Just cruise along in deadpan.
            NAV_Thro = cfg.fw_cruise_throttle;
        else 
            // Add AltitudeError  and scale up with a factor to throttle
            NAV_Thro = constrain(cfg.fw_cruise_throttle - (GPS_AltErr * cfg.fw_scaler_throttle), cfg.fw_idle_throttle, cfg.fw_climb_throttle);

        // Reset Climbout Flag when Alt have been reached
        if (f.CLIMBOUT_FW && GPS_AltErr >= 0)
            f.CLIMBOUT_FW = 0;

        // Climb out before RTH
        if (f.GPS_HOME_MODE) {
            if (f.CLIMBOUT_FW) {
                GPS_AltErr = -(cfg.fw_gps_maxclimb * 10);  // Max climbAngle
                NAV_Thro = cfg.fw_climb_throttle;          // Max Allowed Throttle
                if (currAlt < SAFE_NAV_ALT)
                    navDiff = 0;                        // Force climb with Level Wings below safe Alt
            }

            if ((GPS_distanceToHome < SAFE_DECSCEND_ZONE) && currAlt > RTH_Alt)
                GPS_hold[ALT] = GPS_home[ALT] + RTH_Alt;    // Start descend to correct RTH Alt.
        }

        // Always DISARM when Home is within 10 meters if FC is in failsafe.
        if (f.FW_FAILSAFE_RTH_ENABLE && (GPS_distanceToHome < 10)) {
            f.ARMED = 0;
            f.CLIMBOUT_FW = 0;                  // Abort Climbout
            GPS_hold[ALT] = GPS_home[ALT] + 5;  // Come down
        }

        // Filtering of navDiff around home to stop nervous servos
        if (GPS_distanceToHome < 10)
            navDiff *= 0.1;

        // Wrap Heading 180
        navDiff = wrap_18000(navDiff * 100) / 100;
        if (abs(navDiff) > 170)
            navDiff = 175;      // Forced turn.


        // PID for Navigating planes.
        navDT = (float) (millis() - nav_loopT) / 1000;
        nav_loopT = millis();

        // Altitude PID
        if (abs(GPS_AltErr) <= 3)
            altErrorI *= navDT; // Remove I-Term in deadspan

        GPS_AltErr *= 10;
        altErrorI += (GPS_AltErr * altPID_PARAM.kI) * navDT;    // Acumulate I from PIDPOSR
        altErrorI = constrain(altErrorI, -500, 500);            // limits I term influence

        delta[0] = (GPS_AltErr - lastAltDiff);
        lastAltDiff = GPS_AltErr;
        if (abs(delta[0]) > 100)
            delta[0] = 0;

        for (i = 0; i < GPS_UPD_HZ; i++)
            altHist[i] = altHist[i + 1];

        altHist[GPS_UPD_HZ - 1] = delta[0];

        // Store 1 sec history for D-term in shift register
        ALT_deltaSum = 0;       // Sum History
        for (i = 0; i < GPS_UPD_HZ; i++)
            ALT_deltaSum += altHist[i];

        ALT_deltaSum = (ALT_deltaSum * altPID_PARAM.kD) / navDT;
        altDiff = GPS_AltErr * altPID_PARAM.kP; // Add P in Elevator compensation.
        altDiff += (altErrorI); // Add I

        // Start of NavPID
        if (abs(navDiff) <= 3)
            navErrorI *= navDT; // Remove I-Term in deadspan

        navDiff *= 10;

        navErrorI += (navDiff * navPID_PARAM.kI) * navDT;
        navErrorI = constrain(navErrorI, -500, 500);

        delta[1] = (navDiff - lastnavDiff);
        lastnavDiff = navDiff;

        if (abs(delta[1]) > 100)
            delta[1] = 0;

        // Store 1 sec history for D-term in shift register
        for (i = 0; i < GPS_UPD_HZ; i++)
            navDif[i] = navDif[i + 1];

        navDif[GPS_UPD_HZ - 1] = delta[1];

        NAV_deltaSum = 0;       // Sum History
        for (i = 0; i < GPS_UPD_HZ; i++)
            NAV_deltaSum += navDif[i];

        NAV_deltaSum = (NAV_deltaSum * navPID_PARAM.kD) / navDT;    // Add D

        navDiff *= navPID_PARAM.kP;                                 // Add P
        navDiff += navErrorI;                                       // Add I
        // End of NavPID 

        // Limit outputs
        GPS_angle[PITCH] = constrain(altDiff / 10, -cfg.fw_gps_maxclimb * 10, cfg.fw_gps_maxdive * 10) + ALT_deltaSum;
        GPS_angle[ROLL] = constrain(navDiff / 10, -cfg.fw_gps_maxcorr * 10, cfg.fw_gps_maxcorr * 10) + NAV_deltaSum;
        GPS_angle[YAW] = constrain(navDiff / 10, -cfg.fw_gps_rudder * 10, cfg.fw_gps_rudder * 10) + NAV_deltaSum;

        // Elevator compensation depending on behaviour.
        // Prevent stall with Disarmed motor
        if (!f.CLIMBOUT_FW)
            GPS_angle[PITCH] -= (abs(angle[ROLL]) *cfg.fw_roll_comp);

        // Add elevator compared with rollAngle
        GPS_angle[PITCH] -= abs(angle[ROLL]);

        // Throttle compensation depending on behaviour.
        // Compensate throttle with pitch Angle
        NAV_Thro -= constrain(angle[PITCH] * PITCH_COMP, 0, 450);
        NAV_Thro = constrain(NAV_Thro, cfg.fw_idle_throttle, cfg.fw_climb_throttle);

        // Force the Plane move forward in headwind with speedBoost
        groundSpeed = GPS_speed;
        spDiff = (GPS_MINSPEED - groundSpeed) * I_TERM;

        if (GPS_speed < GPS_MINSPEED - 50 || GPS_speed > GPS_MINSPEED + 50)
            speedBoost += spDiff;

        speedBoost = constrain(speedBoost, 0, 500);
        NAV_Thro += speedBoost;
    }
    // End of NavTimer

    // PassThru for throttle In AcroMode
    if ((!f.ANGLE_MODE && !f.HORIZON_MODE) || (f.PASSTHRU_MODE && !f.FW_FAILSAFE_RTH_ENABLE)) {
        NAV_Thro = TX_Thro;
        GPS_angle[PITCH] = 0;
        GPS_angle[ROLL] = 0;
        GPS_angle[YAW] = 0;
    }
    rcCommand[THROTTLE] = NAV_Thro;
    rcCommand[YAW] += GPS_angle[YAW];
}
