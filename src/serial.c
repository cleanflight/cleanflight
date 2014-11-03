/*
 * This file is part of baseflight
 * Licensed under GPL V3 or modified DCL - see https://github.com/multiwii/baseflight/blob/master/README.md
 */

#include "board.h"
#include "mw.h"

#include "cli.h"
#include "telemetry_common.h"

// Multiwii Serial Protocol 0
#define MSP_VERSION              0
#define CAP_PLATFORM_32BIT          ((uint32_t)1 << 31)
#define CAP_BASEFLIGHT_CONFIG       ((uint32_t)1 << 30)
#define CAP_DYNBALANCE              ((uint32_t)1 << 2)
#define CAP_FLAPS                   ((uint32_t)1 << 3)

#define MSP_IDENT                100    //out message         multitype + multiwii version + protocol version + capability variable
#define MSP_STATUS               101    //out message         cycletime & errors_count & sensor present & box activation & current setting number
#define MSP_RAW_IMU              102    //out message         9 DOF
#define MSP_SERVO                103    //out message         8 servos
#define MSP_MOTOR                104    //out message         8 motors
#define MSP_RC                   105    //out message         8 rc chan and more
#define MSP_RAW_GPS              106    //out message         fix, numsat, lat, lon, alt, speed, ground course
#define MSP_COMP_GPS             107    //out message         distance home, direction home
#define MSP_ATTITUDE             108    //out message         2 angles 1 heading
#define MSP_ALTITUDE             109    //out message         altitude, variometer
#define MSP_ANALOG               110    //out message         vbat, powermetersum, rssi if available on RX
#define MSP_RC_TUNING            111    //out message         rc rate, rc expo, rollpitch rate, yaw rate, dyn throttle PID
#define MSP_PID                  112    //out message         P I D coeff (9 are used currently)
#define MSP_BOX                  113    //out message         BOX setup (number is dependant of your setup)
#define MSP_MISC                 114    //out message         powermeter trig
#define MSP_MOTOR_PINS           115    //out message         which pins are in use for motors & servos, for GUI
#define MSP_BOXNAMES             116    //out message         the aux switch names
#define MSP_PIDNAMES             117    //out message         the PID names
#define MSP_WP                   118    //out message         get a WP, WP# is in the payload, returns (WP#, lat, lon, alt, flags) WP#0-home, WP#16-poshold
#define MSP_BOXIDS               119    //out message         get the permanent IDs associated to BOXes
#define MSP_SERVO_CONF           120    //out message         Servo settings
#define MSP_NAV_STATUS           121    //out message         Returns navigation status
#define MSP_NAV_CONFIG           122    //out message         Returns navigation parameters

#define MSP_SET_RAW_RC           200    //in message          8 rc chan
#define MSP_SET_RAW_GPS          201    //in message          fix, numsat, lat, lon, alt, speed
#define MSP_SET_PID              202    //in message          P I D coeff (9 are used currently)
#define MSP_SET_BOX              203    //in message          BOX setup (number is dependant of your setup)
#define MSP_SET_RC_TUNING        204    //in message          rc rate, rc expo, rollpitch rate, yaw rate, dyn throttle PID
#define MSP_ACC_CALIBRATION      205    //in message          no param
#define MSP_MAG_CALIBRATION      206    //in message          no param
#define MSP_SET_MISC             207    //in message          powermeter trig + 8 free for future use
#define MSP_RESET_CONF           208    //in message          no param
#define MSP_SET_WP               209    //in message          sets a given WP (WP#,lat, lon, alt, flags)
#define MSP_SELECT_SETTING       210    //in message          Select Setting Number (0-2)
#define MSP_SET_HEAD             211    //in message          define a new heading hold direction
#define MSP_SET_SERVO_CONF       212    //in message          Servo settings
#define MSP_SET_MOTOR            214    //in message          PropBalance function
#define MSP_SET_NAV_CONFIG       215    //in message          Sets nav config parameters - write to the eeprom

// #define MSP_BIND                 240    //in message          no param

#define MSP_EEPROM_WRITE         250    //in message          no param

#define MSP_DEBUGMSG             253    //out message         debug string buffer
#define MSP_DEBUG                254    //out message         debug1,debug2,debug3,debug4

// Additional commands that are not compatible with MultiWii
#define MSP_UID                  160    //out message         Unique device ID
#define MSP_ACC_TRIM             240    //out message         get acc angle trim values
#define MSP_SET_ACC_TRIM         239    //in message          set acc angle trim values
#define MSP_GPSSVINFO            164    //out message         get Signal Strength (only U-Blox)

// Additional private MSP for baseflight configurator
#define MSP_RCMAP                64     //out message         get channel map (also returns number of channels total)
#define MSP_SET_RCMAP            65     //in message          set rc map, numchannels to set comes from MSP_RCMAP
#define MSP_CONFIG               66     //out message         baseflight-specific settings that aren't covered elsewhere
#define MSP_SET_CONFIG           67     //in message          baseflight-specific settings save
#define MSP_REBOOT               68     //in message          reboot settings
#define MSP_BUILDINFO            69     //out message         build date as well as some space for future expansion

#define INBUF_SIZE 64

typedef struct box_t {
    const uint8_t boxIndex;         // this is from boxnames enum
    const char *boxName;            // GUI-readable box name
    const uint8_t permanentId;      // Permanent ID for reporting to GUI
} box_t;

static const box_t boxes[] = {
    { BOXARM, "ARM;", 0 },
    { BOXANGLE, "ANGLE;", 1 },
    { BOXHORIZON, "HORIZON;", 2 },
    { BOXBARO, "BARO;", 3 },
    { BOXVARIO, "VARIO;", 4 },
    { BOXMAG, "MAG;", 5 },
    { BOXHEADFREE, "HEADFREE;", 6 },
    { BOXHEADADJ, "HEADADJ;", 7 },
    { BOXCAMSTAB, "CAMSTAB;", 8 },
    { BOXCAMTRIG, "CAMTRIG;", 9 },
    { BOXGPSHOME, "GPS HOME;", 10 },
    { BOXGPSHOLD, "GPS HOLD;", 11 },
    { BOXPASSTHRU, "PASSTHRU;", 12 },
    { BOXBEEPERON, "BEEPER;", 13 },
    { BOXLEDMAX, "LEDMAX;", 14 },
    { BOXLEDLOW, "LEDLOW;", 15 },
    { BOXLLIGHTS, "LLIGHTS;", 16 },
    { BOXCALIB, "CALIB;", 17 },
    { BOXGOV, "GOVERNOR;", 18 },
    { BOXOSD, "OSD SW;", 19 },
    { BOXTELEMETRY, "TELEMETRY;", 20 },
    { CHECKBOXITEMS, NULL, 0xFF }
};

// this is calculated at startup based on enabled features.
static uint8_t availableBoxes[CHECKBOXITEMS];
// this is the number of filled indexes in above array
static uint8_t numberBoxItems = 0;
// from mixer.c
extern int16_t motor_disarmed[MAX_MOTORS];
// cause reboot after MSP processing complete
static bool pendReboot = false;

static const char pidnames[] =
    "ROLL;"
    "PITCH;"
    "YAW;"
    "ALT;"
    "Pos;"
    "PosR;"
    "NavR;"
    "LEVEL;"
    "MAG;"
    "VEL;";

typedef enum serialState_t {
    IDLE,
    HEADER_START,
    HEADER_M,
    HEADER_ARROW,
    HEADER_SIZE,
    HEADER_CMD,
} serialState_t;

typedef  struct mspPortState_t {
    serialPort_t *port;
    uint8_t checksum;
    uint8_t indRX;
    uint8_t inBuf[INBUF_SIZE];
    uint8_t cmdMSP;
    uint8_t offset;
    uint8_t dataSize;
    serialState_t c_state;
} mspPortState_t;

static mspPortState_t ports[2];
static mspPortState_t *currentPortState = &ports[0];
static int numTelemetryPorts = 0;

// static uint8_t checksum, indRX, inBuf[INBUF_SIZE];
// static uint8_t cmdMSP;

void serialize8(uint8_t a)
{
    serialWrite(currentPortState->port, a);
    currentPortState->checksum ^= a;
}

void serialize32(uint32_t a)
{
    serialize8(a & 0xFF);
    serialize8((a >> 8) & 0xFF);
    serialize8((a >> 16) & 0xFF);
    serialize8((a >> 24) & 0xFF);
}

void serialize16(int16_t a)
{
    serialize8(a & 0xFF);
    serialize8((a >> 8) & 0xFF);
}

uint8_t read8(void)
{
    return currentPortState->inBuf[currentPortState->indRX++] & 0xff;
}

uint16_t read16(void)
{
    uint16_t t = read8();
    t += (uint16_t)read8() << 8;
    return t;
}

uint32_t read32(void)
{
    uint32_t t = read16();
    t += (uint32_t)read16() << 16;
    return t;
}

void headSerialResponse(uint8_t err, uint8_t s)
{
    serialize8('$');
    serialize8('M');
    serialize8(err ? '!' : '>');
    currentPortState->checksum = 0;               // start calculating a new checksum
    serialize8(s);
    serialize8(currentPortState->cmdMSP);
}

void headSerialReply(uint8_t s)
{
    headSerialResponse(0, s);
}

void headSerialError(uint8_t s)
{
    headSerialResponse(1, s);
}

void tailSerialReply(void)
{
    serialize8(currentPortState->checksum);
}

void s_struct(uint8_t *cb, uint8_t siz)
{
    headSerialReply(siz);
    while (siz--)
        serialize8(*cb++);
}

void serializeNames(const char *s)
{
    const char *c;
    for (c = s; *c; c++)
        serialize8(*c);
}

void serializeBoxNamesReply(void)
{
    int i, idx, j, flag = 1, count = 0, len;

reset:
    // in first run of the loop, we grab total size of junk to be sent
    // then come back and actually send it
    for (i = 0; i < numberBoxItems; i++) {
        idx = availableBoxes[i];
        len = strlen(boxes[idx].boxName);
        if (flag) {
            count += len;
        } else {
            for (j = 0; j < len; j++)
                serialize8(boxes[idx].boxName[j]);
        }
    }

    if (flag) {
        headSerialReply(count);
        flag = 0;
        goto reset;
    }
}

void serialInit(uint32_t baudrate)
{
    int idx;

    numTelemetryPorts = 0;
    core.mainport = uartOpen(USART1, NULL, baudrate, MODE_RXTX);
    ports[0].port = core.mainport;
    numTelemetryPorts++;

    // additional telemetry port available only if spektrum sat isn't already assigned there
    if (hw_revision >= NAZE32_SP  && !mcfg.spektrum_sat_on_flexport) {
        core.flexport = uartOpen(USART3, NULL, baudrate, MODE_RXTX);
        ports[1].port = core.flexport;
        numTelemetryPorts++;
    }

    // calculate used boxes based on features and fill availableBoxes[] array
    memset(availableBoxes, 0xFF, sizeof(availableBoxes));

    idx = 0;
    availableBoxes[idx++] = BOXARM;
    if (sensors(SENSOR_ACC)) {
        availableBoxes[idx++] = BOXANGLE;
        availableBoxes[idx++] = BOXHORIZON;
    }
    if (sensors(SENSOR_BARO)) {
        availableBoxes[idx++] = BOXBARO;
        if (feature(FEATURE_VARIO))
            availableBoxes[idx++] = BOXVARIO;
    }
    if (sensors(SENSOR_ACC) || sensors(SENSOR_MAG)) {
        availableBoxes[idx++] = BOXMAG;
        availableBoxes[idx++] = BOXHEADFREE;
        availableBoxes[idx++] = BOXHEADADJ;
    }
    if (feature(FEATURE_SERVO_TILT))
        availableBoxes[idx++] = BOXCAMSTAB;
    if (feature(FEATURE_GPS)) {
        availableBoxes[idx++] = BOXGPSHOME;
        availableBoxes[idx++] = BOXGPSHOLD;
    }
    if (mcfg.mixerConfiguration == MULTITYPE_FLYING_WING || mcfg.mixerConfiguration == MULTITYPE_AIRPLANE)
        availableBoxes[idx++] = BOXPASSTHRU;
    availableBoxes[idx++] = BOXBEEPERON;
    if (feature(FEATURE_INFLIGHT_ACC_CAL))
        availableBoxes[idx++] = BOXCALIB;
    availableBoxes[idx++] = BOXOSD;
    if (feature(FEATURE_TELEMETRY && mcfg.telemetry_switch))
        availableBoxes[idx++] = BOXTELEMETRY;
    numberBoxItems = idx;
}

static void evaluateCommand(void)
{
    uint32_t i, j, tmp, junk;
#ifdef GPS
    uint8_t wp_no;
    int32_t lat = 0, lon = 0, alt = 0;
#endif
    const char *build = __DATE__;

    switch (currentPortState->cmdMSP) {
    case MSP_SET_RAW_RC:
        for (i = 0; i < 8; i++)
            rcData[i] = read16();
        headSerialReply(0);
        mspFrameRecieve();
        break;
    case MSP_SET_ACC_TRIM:
        cfg.angleTrim[PITCH] = read16();
        cfg.angleTrim[ROLL]  = read16();
        headSerialReply(0);
        break;
#ifdef GPS
    case MSP_SET_RAW_GPS:
        f.GPS_FIX = read8();
        GPS_numSat = read8();
        GPS_coord[LAT] = read32();
        GPS_coord[LON] = read32();
        GPS_altitude = read16();
        GPS_speed = read16();
        GPS_update |= 2;        // New data signalisation to GPS functions
        headSerialReply(0);
        break;
#endif
    case MSP_SET_PID:
        for (i = 0; i < PIDITEMS; i++) {
            cfg.P8[i] = read8();
            cfg.I8[i] = read8();
            cfg.D8[i] = read8();
        }
        headSerialReply(0);
        break;
    case MSP_SET_BOX:
        for (i = 0; i < numberBoxItems; i++)
            cfg.activate[availableBoxes[i]] = read16();
        headSerialReply(0);
        break;
    case MSP_SET_RC_TUNING:
        cfg.rcRate8 = read8();
        cfg.rcExpo8 = read8();
        cfg.rollPitchRate = read8();
        cfg.yawRate = read8();
        cfg.dynThrPID = read8();
        cfg.thrMid8 = read8();
        cfg.thrExpo8 = read8();
        headSerialReply(0);
        break;
    case MSP_SET_MISC:
        tmp = read16();
        // sanity check
        if (tmp < 1600 && tmp > 1400)
            mcfg.midrc = tmp;
        mcfg.minthrottle = read16();
        mcfg.maxthrottle = read16();
        mcfg.mincommand = read16();
        cfg.failsafe_throttle = read16();
        mcfg.gps_type = read8();
        mcfg.gps_baudrate = read8();
        mcfg.gps_ubx_sbas = read8();
        mcfg.multiwiicurrentoutput = read8();
        mcfg.rssi_aux_channel = read8();
        read8();
        cfg.mag_declination = read16() * 10;
        mcfg.vbatscale = read8();           // actual vbatscale as intended
        mcfg.vbatmincellvoltage = read8();  // vbatlevel_warn1 in MWC2.3 GUI
        mcfg.vbatmaxcellvoltage = read8();  // vbatlevel_warn2 in MWC2.3 GUI
        read8();                            // vbatlevel_crit (unused)
        headSerialReply(0);
        break;
    case MSP_SET_MOTOR:
        for (i = 0; i < 8; i++)
            motor_disarmed[i] = read16();
        headSerialReply(0);
        break;
    case MSP_SELECT_SETTING:
        if (!f.ARMED) {
            mcfg.current_profile = read8();
            if (mcfg.current_profile > 2)
                mcfg.current_profile = 0;
            // this writes new profile index and re-reads it
            writeEEPROM(0, false);
        }
        headSerialReply(0);
        break;
    case MSP_SET_HEAD:
        magHold = read16();
        headSerialReply(0);
        break;
    case MSP_IDENT:
        headSerialReply(7);
        serialize8(VERSION);                // multiwii version
        serialize8(mcfg.mixerConfiguration); // type of multicopter
        serialize8(MSP_VERSION);            // MultiWii Serial Protocol Version
        serialize32(CAP_PLATFORM_32BIT | CAP_BASEFLIGHT_CONFIG | CAP_DYNBALANCE | (mcfg.flaps_speed ? CAP_FLAPS : 0));        // "capability"
        break;
    case MSP_STATUS:
        headSerialReply(11);
        serialize16(cycleTime);
        serialize16(i2cGetErrorCounter());
        serialize16(sensors(SENSOR_ACC) | sensors(SENSOR_BARO) << 1 | sensors(SENSOR_MAG) << 2 | sensors(SENSOR_GPS) << 3 | sensors(SENSOR_SONAR) << 4);
        // OK, so you waste all the fucking time to have BOXNAMES and BOXINDEXES etc, and then you go ahead and serialize enabled shit simply by stuffing all
        // the bits in order, instead of setting the enabled bits based on BOXINDEX. WHERE IS THE FUCKING LOGIC IN THIS, FUCKWADS.
        // Serialize the boxes in the order we delivered them, until multiwii retards fix their shit
        junk = 0;
        tmp = f.ANGLE_MODE << BOXANGLE | f.HORIZON_MODE << BOXHORIZON |
                    f.BARO_MODE << BOXBARO | f.MAG_MODE << BOXMAG | f.HEADFREE_MODE << BOXHEADFREE | rcOptions[BOXHEADADJ] << BOXHEADADJ |
                    rcOptions[BOXCAMSTAB] << BOXCAMSTAB | rcOptions[BOXCAMTRIG] << BOXCAMTRIG |
                    f.GPS_HOME_MODE << BOXGPSHOME | f.GPS_HOLD_MODE << BOXGPSHOLD |
                    f.PASSTHRU_MODE << BOXPASSTHRU |
                    rcOptions[BOXBEEPERON] << BOXBEEPERON |
                    rcOptions[BOXLEDMAX] << BOXLEDMAX |
                    rcOptions[BOXLLIGHTS] << BOXLLIGHTS |
                    rcOptions[BOXVARIO] << BOXVARIO |
                    rcOptions[BOXCALIB] << BOXCALIB |
                    rcOptions[BOXGOV] << BOXGOV |
                    rcOptions[BOXOSD] << BOXOSD |
                    rcOptions[BOXTELEMETRY] << BOXTELEMETRY |
                    f.ARMED << BOXARM;
        for (i = 0; i < numberBoxItems; i++) {
            int flag = (tmp & (1 << availableBoxes[i]));
            if (flag)
                junk |= 1 << i;
        }
        serialize32(junk);
        serialize8(mcfg.current_profile);
        break;
    case MSP_RAW_IMU:
        headSerialReply(18);
        // Retarded hack until multiwiidorks start using real units for sensor data
        if (acc_1G > 1024) {
            for (i = 0; i < 3; i++)
                serialize16(accSmooth[i] / 8);
        } else {
            for (i = 0; i < 3; i++)
                serialize16(accSmooth[i]);
        }
        for (i = 0; i < 3; i++)
            serialize16(gyroData[i]);
        for (i = 0; i < 3; i++)
            serialize16(magADC[i]);
        break;
    case MSP_SERVO:
        s_struct((uint8_t *)&servo, 16);
        break;
    case MSP_SERVO_CONF:
        headSerialReply(56);
        for (i = 0; i < MAX_SERVOS; i++) {
            serialize16(cfg.servoConf[i].min);
            serialize16(cfg.servoConf[i].max);
            serialize16(cfg.servoConf[i].middle);
            serialize8(cfg.servoConf[i].rate);
        }
        break;
    case MSP_SET_SERVO_CONF:
        headSerialReply(0);
        for (i = 0; i < MAX_SERVOS; i++) {
            cfg.servoConf[i].min = read16();
            cfg.servoConf[i].max = read16();
            cfg.servoConf[i].middle = read16();
            cfg.servoConf[i].rate = read8();
        }
        break;
    case MSP_MOTOR:
        s_struct((uint8_t *)motor, 16);
        break;
    case MSP_RC:
        headSerialReply(16);
        for (i = 0; i < 8; i++)
            serialize16(rcData[i]);
        break;
#ifdef GPS
    case MSP_RAW_GPS:
        headSerialReply(16);
        serialize8(f.GPS_FIX);
        serialize8(GPS_numSat);
        serialize32(GPS_coord[LAT]);
        serialize32(GPS_coord[LON]);
        serialize16(GPS_altitude);
        serialize16(GPS_speed);
        serialize16(GPS_ground_course);
        break;
    case MSP_COMP_GPS:
        headSerialReply(5);
        serialize16(GPS_distanceToHome);
        serialize16(GPS_directionToHome);
        serialize8(GPS_update & 1);
        break;
#endif
    case MSP_ATTITUDE:
        headSerialReply(6);
        for (i = 0; i < 2; i++)
            serialize16(angle[i]);
        serialize16(heading);
        break;
    case MSP_ALTITUDE:
        headSerialReply(6);
        serialize32(EstAlt);
        serialize16(vario);
        break;
    case MSP_ANALOG:
        headSerialReply(7);
        serialize8((uint8_t)constrain(vbat, 0, 255));
        serialize16((uint16_t)constrain(mAhdrawn, 0, 0xFFFF)); // milliamphours drawn from battery
        serialize16(rssi);
        if (mcfg.multiwiicurrentoutput)
            serialize16((uint16_t)constrain((abs(amperage) * 10), 0, 0xFFFF)); // send amperage in 0.001 A steps
        else
            serialize16((uint16_t)constrain(abs(amperage), 0, 0xFFFF)); // send amperage in 0.01 A steps
        break;
    case MSP_RC_TUNING:
        headSerialReply(7);
        serialize8(cfg.rcRate8);
        serialize8(cfg.rcExpo8);
        serialize8(cfg.rollPitchRate);
        serialize8(cfg.yawRate);
        serialize8(cfg.dynThrPID);
        serialize8(cfg.thrMid8);
        serialize8(cfg.thrExpo8);
        break;
    case MSP_PID:
        headSerialReply(3 * PIDITEMS);
        for (i = 0; i < PIDITEMS; i++) {
            serialize8(cfg.P8[i]);
            serialize8(cfg.I8[i]);
            serialize8(cfg.D8[i]);
        }
        break;
    case MSP_PIDNAMES:
        headSerialReply(sizeof(pidnames) - 1);
        serializeNames(pidnames);
        break;
    case MSP_BOX:
        headSerialReply(2 * numberBoxItems);
        for (i = 0; i < numberBoxItems; i++)
            serialize16(cfg.activate[availableBoxes[i]]);
        break;
    case MSP_BOXNAMES:
        // headSerialReply(sizeof(boxnames) - 1);
        serializeBoxNamesReply();
        break;
    case MSP_BOXIDS:
        headSerialReply(numberBoxItems);
        for (i = 0; i < numberBoxItems; i++) {
            for  (j = 0; j < CHECKBOXITEMS; j++) {
                if (boxes[j].permanentId == availableBoxes[i])
                    serialize8(boxes[j].permanentId);
            }
        }
        break;
    case MSP_MISC:
        headSerialReply(2 * 6 + 4 + 2 + 4);
        serialize16(mcfg.midrc);
        serialize16(mcfg.minthrottle);
        serialize16(mcfg.maxthrottle);
        serialize16(mcfg.mincommand);
        serialize16(cfg.failsafe_throttle);
        serialize8(mcfg.gps_type);
        serialize8(mcfg.gps_baudrate);
        serialize8(mcfg.gps_ubx_sbas);
        serialize8(mcfg.multiwiicurrentoutput);
        serialize8(mcfg.rssi_aux_channel);
        serialize8(0);
        serialize16(cfg.mag_declination / 10); // TODO check this shit
        serialize8(mcfg.vbatscale);
        serialize8(mcfg.vbatmincellvoltage);
        serialize8(mcfg.vbatmaxcellvoltage);
        serialize8(0);
        break;
    case MSP_MOTOR_PINS:
        headSerialReply(8);
        for (i = 0; i < 8; i++)
            serialize8(i + 1);
        break;
#ifdef GPS
    case MSP_WP:
        wp_no = read8();    // get the wp number
        headSerialReply(18);
        if (wp_no == 0) {
            lat = GPS_home[LAT];
            lon = GPS_home[LON];
        } else if (wp_no == 16) {
            lat = GPS_hold[LAT];
            lon = GPS_hold[LON];
        }
        serialize8(wp_no);
        serialize32(lat);
        serialize32(lon);
        serialize32(AltHold);           // altitude (cm) will come here -- temporary implementation to test feature with apps
        serialize16(0);                 // heading  will come here (deg)
        serialize16(0);                 // time to stay (ms) will come here
        serialize8(0);                  // nav flag will come here
        break;
    case MSP_SET_WP:
        wp_no = read8();    //get the wp number
        lat = read32();
        lon = read32();
        alt = read32();     // to set altitude (cm)
        read16();           // future: to set heading (deg)
        read16();           // future: to set time to stay (ms)
        read8();            // future: to set nav flag
        if (wp_no == 0) {
            GPS_home[LAT] = lat;
            GPS_home[LON] = lon;
            f.GPS_HOME_MODE = 0;        // with this flag, GPS_set_next_wp will be called in the next loop -- OK with SERIAL GPS / OK with I2C GPS
            f.GPS_FIX_HOME = 1;
            if (alt != 0)
                AltHold = alt;          // temporary implementation to test feature with apps
        } else if (wp_no == 16) {       // OK with SERIAL GPS  --  NOK for I2C GPS / needs more code dev in order to inject GPS coord inside I2C GPS
            GPS_hold[LAT] = lat;
            GPS_hold[LON] = lon;
            if (alt != 0)
                AltHold = alt;          // temporary implementation to test feature with apps
            nav_mode = NAV_MODE_WP;
            GPS_set_next_wp(&GPS_hold[LAT], &GPS_hold[LON]);
        }
        headSerialReply(0);
        break;
#endif /* GPS */
    case MSP_RESET_CONF:
        if (!f.ARMED)
            checkFirstTime(true);
        headSerialReply(0);
        break;
    case MSP_ACC_CALIBRATION:
        if (!f.ARMED)
            calibratingA = CALIBRATING_ACC_CYCLES;
        headSerialReply(0);
        break;
    case MSP_MAG_CALIBRATION:
        if (!f.ARMED)
            f.CALIBRATE_MAG = 1;
        headSerialReply(0);
        break;
    case MSP_EEPROM_WRITE:
        if (f.ARMED) {
            headSerialError(0);
        } else {
            writeEEPROM(0, true);
            headSerialReply(0);
        }
        break;
    case MSP_DEBUG:
        headSerialReply(8);
        // make use of this crap, output some useful QA statistics
        debug[3] = ((hse_value / 1000000) * 1000) + (SystemCoreClock / 1000000);         // XX0YY [crystal clock : core clock]
        for (i = 0; i < 4; i++)
            serialize16(debug[i]);      // 4 variables are here for general monitoring purpose
        break;

    // Additional commands that are not compatible with MultiWii
    case MSP_ACC_TRIM:
        headSerialReply(4);
        serialize16(cfg.angleTrim[PITCH]);
        serialize16(cfg.angleTrim[ROLL]);
        break;
    case MSP_UID:
        headSerialReply(12);
        serialize32(U_ID_0);
        serialize32(U_ID_1);
        serialize32(U_ID_2);
        break;
    case MSP_GPSSVINFO:
        headSerialReply(1 + (GPS_numCh * 4));
        serialize8(GPS_numCh);
           for (i = 0; i < GPS_numCh; i++){
               serialize8(GPS_svinfo_chn[i]);
               serialize8(GPS_svinfo_svid[i]);
               serialize8(GPS_svinfo_quality[i]);
               serialize8(GPS_svinfo_cno[i]);
            }
        break;

    case MSP_SET_CONFIG:
        headSerialReply(0);
        mcfg.mixerConfiguration = read8(); // multitype
        featureClearAll();
        featureSet(read32()); // features bitmap
        mcfg.serialrx_type = read8(); // serialrx_type
        mcfg.board_align_roll = read16(); // board_align_roll
        mcfg.board_align_pitch = read16(); // board_align_pitch
        mcfg.board_align_yaw = read16(); // board_align_yaw
        mcfg.currentscale = read16();
        mcfg.currentoffset = read16();
        /// ???
        break;
    case MSP_CONFIG:
        headSerialReply(1 + 4 + 1 + 2 + 2 + 2 + 4);
        serialize8(mcfg.mixerConfiguration);
        serialize32(featureMask());
        serialize8(mcfg.serialrx_type);
        serialize16(mcfg.board_align_roll);
        serialize16(mcfg.board_align_pitch);
        serialize16(mcfg.board_align_yaw);
        serialize16(mcfg.currentscale);
        serialize16(mcfg.currentoffset);
        /// ???
        break;

    case MSP_RCMAP:
        headSerialReply(MAX_INPUTS); // TODO fix this
        for (i = 0; i < MAX_INPUTS; i++)
            serialize8(mcfg.rcmap[i]);
        break;
    case MSP_SET_RCMAP:
        headSerialReply(0);
        for (i = 0; i < MAX_INPUTS; i++)
            mcfg.rcmap[i] = read8();
        break;

    case MSP_REBOOT:
        headSerialReply(0);
        pendReboot = true;
        break;

    case MSP_BUILDINFO:
        headSerialReply(11 + 4 + 4);
        for (i = 0; i < 11; i++)
            serialize8(build[i]); // MMM DD YYYY as ascii, MMM = Jan/Feb... etc
        serialize32(0); // future exp
        serialize32(0); // future exp
        break;

    default:                   // we do not know how to handle the (valid) message, indicate error MSP $M!
        headSerialError(0);
        break;
    }
    tailSerialReply();
}

// evaluate all other incoming serial data
static void evaluateOtherData(uint8_t sr)
{
    if (sr == '#')
        cliProcess();
    else if (sr == mcfg.reboot_character)
        systemReset(true);      // reboot to bootloader
}

void serialCom(void)
{
    uint8_t c;
    int i;

    for (i = 0; i < numTelemetryPorts; i++) {
        currentPortState = &ports[i];

        // in cli mode, all serial stuff goes to here. enter cli mode by sending #
        if (cliMode) {
            cliProcess();
            return;
        }

        if (pendReboot)
            systemReset(false); // noreturn

        while (serialTotalBytesWaiting(currentPortState->port)) {
            c = serialRead(currentPortState->port);

            if (currentPortState->c_state == IDLE) {
                currentPortState->c_state = (c == '$') ? HEADER_START : IDLE;
                if (currentPortState->c_state == IDLE && !f.ARMED)
                    evaluateOtherData(c); // if not armed evaluate all other incoming serial data
            } else if (currentPortState->c_state == HEADER_START) {
                currentPortState->c_state = (c == 'M') ? HEADER_M : IDLE;
            } else if (currentPortState->c_state == HEADER_M) {
                currentPortState->c_state = (c == '<') ? HEADER_ARROW : IDLE;
            } else if (currentPortState->c_state == HEADER_ARROW) {
                if (c > INBUF_SIZE) {       // now we are expecting the payload size
                    currentPortState->c_state = IDLE;
                    continue;
                }
                currentPortState->dataSize = c;
                currentPortState->offset = 0;
                currentPortState->checksum = 0;
                currentPortState->indRX = 0;
                currentPortState->checksum ^= c;
                currentPortState->c_state = HEADER_SIZE;      // the command is to follow
            } else if (currentPortState->c_state == HEADER_SIZE) {
                currentPortState->cmdMSP = c;
                currentPortState->checksum ^= c;
                currentPortState->c_state = HEADER_CMD;
            } else if (currentPortState->c_state == HEADER_CMD && currentPortState->offset < currentPortState->dataSize) {
                currentPortState->checksum ^= c;
                currentPortState->inBuf[currentPortState->offset++] = c;
            } else if (currentPortState->c_state == HEADER_CMD && currentPortState->offset >= currentPortState->dataSize) {
                if (currentPortState->checksum == c) {        // compare calculated and transferred checksum
                    evaluateCommand();      // we got a valid packet, evaluate it
                }
                currentPortState->c_state = IDLE;
            }
        }
    }
}
