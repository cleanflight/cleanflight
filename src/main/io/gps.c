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

#include "common/maths.h"

#include "drivers/system.h"

#include "drivers/serial.h"
#include "drivers/serial_uart.h"
#include "io/serial.h"

#include "drivers/gpio.h"
#include "drivers/light_led.h"

#include "common/axis.h"
#include "flight/flight.h"

#include "sensors/sensors.h"

#include "config/config.h"
#include "config/runtime_config.h"

#include "flight/gps_conversion.h"
#include "flight/navigation.h"

#include "io/gps.h"

#ifdef GPS

extern int16_t debug[4];


// **********************
// GPS
// **********************
int32_t GPS_coord[2];               // LAT/LON

uint8_t GPS_numSat;
uint16_t GPS_hdop = 9999;           // Compute GPS quality signal
uint8_t GPS_update = 0;             // it's a binary toggle to distinct a GPS position update

uint16_t GPS_altitude;              // altitude in 0.1m
uint16_t GPS_speed;                 // speed in 0.1m/s
uint16_t GPS_ground_course = 0;     // degrees * 10

uint8_t GPS_numCh;                  // Number of channels
uint8_t GPS_svinfo_chn[16];         // Channel number
uint8_t GPS_svinfo_svid[16];        // Satellite ID
uint8_t GPS_svinfo_quality[16];     // Bitfield Qualtity
uint8_t GPS_svinfo_cno[16];         // Carrier to Noise Ratio (Signal Strength)

static gpsConfig_t *gpsConfig;

// GPS timeout for wrong baud rate/disconnection/etc in milliseconds (default 2.5second)
#define GPS_TIMEOUT (2500)
// How many entries in gpsInitData array below
#define GPS_INIT_ENTRIES (GPS_BAUDRATE_MAX + 1)
#define GPS_BAUDRATE_CHATE_DELAY (100)

static serialConfig_t *serialConfig;
static serialPort_t *gpsPort;

typedef struct gpsInitData_t {
    uint8_t index;
    uint32_t baudrate;
    const char *ubx;
    const char *mtk;
} gpsInitData_t;

// NMEA will cycle through these until valid data is received
static const gpsInitData_t gpsInitData[] = {
    { GPS_BAUDRATE_115200, 115200, "$PUBX,41,1,0003,0001,115200,0*1E\r\n", "$PMTK251,115200*1F\r\n" },
    { GPS_BAUDRATE_57600,   57600, "$PUBX,41,1,0003,0001,57600,0*2D\r\n", "$PMTK251,57600*2C\r\n" },
    { GPS_BAUDRATE_38400,   38400, "$PUBX,41,1,0003,0001,38400,0*26\r\n", "$PMTK251,38400*27\r\n" },
    { GPS_BAUDRATE_19200,   19200, "$PUBX,41,1,0003,0001,19200,0*23\r\n", "$PMTK251,19200*22\r\n" },
    // 9600 is not enough for 5Hz updates - leave for compatibility to dumb NMEA that only runs at this speed
    { GPS_BAUDRATE_9600,     9600, "", "" }
};

#define GPS_INIT_DATA_ENTRY_COUNT (sizeof(gpsInitData) / sizeof(gpsInitData[0]))

#define DEFAULT_BAUD_RATE_INDEX 0

static const uint8_t ubloxInit[] = {
    0xB5, 0x62, 0x06, 0x01, 0x03, 0x00, 0xF0, 0x05, 0x00, 0xFF, 0x19,           // VGS: Course over ground and Ground speed
    0xB5, 0x62, 0x06, 0x01, 0x03, 0x00, 0xF0, 0x03, 0x00, 0xFD, 0x15,           // GSV: GNSS Satellites in View
    0xB5, 0x62, 0x06, 0x01, 0x03, 0x00, 0xF0, 0x01, 0x00, 0xFB, 0x11,           // GLL: Latitude and longitude, with time of position fix and status
    0xB5, 0x62, 0x06, 0x01, 0x03, 0x00, 0xF0, 0x00, 0x00, 0xFA, 0x0F,           // GGA: Global positioning system fix data
    0xB5, 0x62, 0x06, 0x01, 0x03, 0x00, 0xF0, 0x02, 0x00, 0xFC, 0x13,           // GSA: GNSS DOP and Active Satellites
    0xB5, 0x62, 0x06, 0x01, 0x03, 0x00, 0xF0, 0x04, 0x00, 0xFE, 0x17,           // RMC: Recommended Minimum data
    0xB5, 0x62, 0x06, 0x01, 0x03, 0x00, 0x01, 0x02, 0x01, 0x0E, 0x47,           // set POSLLH MSG rate
    0xB5, 0x62, 0x06, 0x01, 0x03, 0x00, 0x01, 0x03, 0x01, 0x0F, 0x49,           // set STATUS MSG rate
    0xB5, 0x62, 0x06, 0x01, 0x03, 0x00, 0x01, 0x06, 0x01, 0x12, 0x4F,           // set SOL MSG rate
    0xB5, 0x62, 0x06, 0x01, 0x03, 0x00, 0x01, 0x12, 0x01, 0x1E, 0x67,           // set VELNED MSG rate
    0xB5, 0x62, 0x06, 0x08, 0x06, 0x00, 0xC8, 0x00, 0x01, 0x00, 0x01, 0x00, 0xDE, 0x6A,             // set rate to 5Hz
};

// UBlox 6 Protocol documentation - GPS.G6-SW-10018-F
// SBAS Configuration Settings Desciption, Page 4/210
// 31.21 CFG-SBAS (0x06 0x16), Page 142/210
// A.10 SBAS Configuration (UBX-CFG-SBAS), Page 198/210 - GPS.G6-SW-10018-F

#define UBLOX_SBAS_MESSAGE_LENGTH 16
typedef struct ubloxSbas_s {
    sbasMode_e mode;
    uint8_t message[UBLOX_SBAS_MESSAGE_LENGTH];
} ubloxSbas_t;



// Note: these must be defined in the same order is sbasMode_e since no lookup table is used.
static const ubloxSbas_t ubloxSbas[] = {
    // NOTE this could be optimized to save a few bytes of flash space since the same prefix is used for each command.
    { SBAS_AUTO,  { 0xB5, 0x62, 0x06, 0x16, 0x08, 0x00, 0x03, 0x07, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0xE5}},
    { SBAS_EGNOS, { 0xB5, 0x62, 0x06, 0x16, 0x08, 0x00, 0x03, 0x07, 0x03, 0x00, 0x51, 0x08, 0x00, 0x00, 0x8A, 0x41}},
    { SBAS_WAAS,  { 0xB5, 0x62, 0x06, 0x16, 0x08, 0x00, 0x03, 0x07, 0x03, 0x00, 0x04, 0xE0, 0x04, 0x00, 0x19, 0x9D}},
    { SBAS_MSAS,  { 0xB5, 0x62, 0x06, 0x16, 0x08, 0x00, 0x03, 0x07, 0x03, 0x00, 0x00, 0x02, 0x02, 0x00, 0x35, 0xEF}},
    { SBAS_GAGAN, { 0xB5, 0x62, 0x06, 0x16, 0x08, 0x00, 0x03, 0x07, 0x03, 0x00, 0x80, 0x01, 0x00, 0x00, 0xB2, 0xE8}}
};


enum {
    GPS_UNKNOWN,
    GPS_INITIALIZING,
    GPS_CHANGE_BAUD,
    GPS_CONFIGURE,
    GPS_RECEIVING_DATA,
    GPS_LOST_COMMUNICATION,
};

gpsData_t gpsData;

static void gpsNewData(uint16_t c);
static bool gpsNewFrameNMEA(char c);
static bool gpsNewFrameUBLOX(uint8_t data);

static void gpsSetState(uint8_t state)
{
    gpsData.state = state;
    gpsData.state_position = 0;
    gpsData.state_ts = millis();
    gpsData.messageState = GPS_MESSAGE_STATE_IDLE;
}

// When using PWM input GPS usage reduces number of available channels by 2 - see pwm_common.c/pwmInit()
void gpsInit(serialConfig_t *initialSerialConfig, gpsConfig_t *initialGpsConfig)
{
    serialConfig = initialSerialConfig;

    gpsData.baudrateIndex = 0;
    while (gpsInitData[gpsData.baudrateIndex].baudrate != serialConfig->gps_baudrate) {
        gpsData.baudrateIndex++;
        if (gpsData.baudrateIndex >= GPS_INIT_DATA_ENTRY_COUNT) {
            gpsData.baudrateIndex = DEFAULT_BAUD_RATE_INDEX;
            break;
        }
    }

    gpsConfig = initialGpsConfig;

    // init gpsData structure. if we're not actually enabled, don't bother doing anything else
    gpsSetState(GPS_UNKNOWN);

    gpsData.lastMessage = millis();
    gpsData.errors = 0;

    portMode_t mode = MODE_RXTX;
    // only RX is needed for NMEA-style GPS
    if (gpsConfig->provider == GPS_NMEA)
        mode = MODE_RX;

    // no callback - buffer will be consumed in gpsThread()
    gpsPort = openSerialPort(FUNCTION_GPS, NULL, gpsInitData[gpsData.baudrateIndex].baudrate, mode, SERIAL_NOT_INVERTED);
    if (!gpsPort) {
        featureClear(FEATURE_GPS);
        return;
    }

    // signal GPS "thread" to initialize when it gets to it
    gpsSetState(GPS_INITIALIZING);
}

void gpsInitNmea(void)
{
    switch(gpsData.state) {
        case GPS_INITIALIZING:
        case GPS_CHANGE_BAUD:
            serialSetBaudRate(gpsPort, gpsInitData[gpsData.baudrateIndex].baudrate);
            gpsSetState(GPS_RECEIVING_DATA);
            break;
    }
}

void gpsInitUblox(void)
{
    uint32_t now;
    // UBX will run at mcfg.gps_baudrate, it shouldn't be "autodetected". So here we force it to that rate

    // Wait until GPS transmit buffer is empty
    if (!isSerialTransmitBufferEmpty(gpsPort))
        return;


    switch (gpsData.state) {
        case GPS_INITIALIZING:
            now = millis();
            if (now - gpsData.state_ts < GPS_BAUDRATE_CHATE_DELAY)
                return;

            if (gpsData.state_position < GPS_INIT_ENTRIES) {
                // try different speed to INIT
                serialSetBaudRate(gpsPort, gpsInitData[gpsData.state_position].baudrate);
                // but print our FIXED init string for the baudrate we want to be at
                serialPrint(gpsPort, gpsInitData[gpsData.baudrateIndex].ubx);

                gpsData.state_position++;
                gpsData.state_ts = now;
            } else {
                // we're now (hopefully) at the correct rate, next state will switch to it
                gpsSetState(GPS_CHANGE_BAUD);
            }
            break;
        case GPS_CHANGE_BAUD:
            serialSetBaudRate(gpsPort, gpsInitData[gpsData.baudrateIndex].baudrate);
            gpsSetState(GPS_CONFIGURE);
            break;
        case GPS_CONFIGURE:
            if (gpsData.messageState == GPS_MESSAGE_STATE_IDLE) {
                gpsData.messageState++;
            }

            if (gpsData.messageState == GPS_MESSAGE_STATE_INIT) {

                if (gpsData.state_position < sizeof(ubloxInit)) {
                    serialWrite(gpsPort, ubloxInit[gpsData.state_position]);
                    gpsData.state_position++;
                } else {
                    gpsData.state_position = 0;
                    gpsData.messageState++;
                }
            }

            if (gpsData.messageState == GPS_MESSAGE_STATE_SBAS) {
                if (gpsData.state_position < UBLOX_SBAS_MESSAGE_LENGTH) {
                    serialWrite(gpsPort, ubloxSbas[gpsConfig->sbasMode].message[gpsData.state_position]);
                    gpsData.state_position++;
                } else {
                    gpsData.messageState++;
                }
            }

            if (gpsData.messageState >= GPS_MESSAGE_STATE_ENTRY_COUNT) {
                gpsSetState(GPS_RECEIVING_DATA);
                // ublox should be init'd, time to try receiving
            }
            break;
    }
}

void gpsInitHardware(void)
{
    switch (gpsConfig->provider) {
        case GPS_NMEA:
            gpsInitNmea();
            break;

        case GPS_UBLOX:
            gpsInitUblox();
            break;
    }

    // clear error counter
    gpsData.errors = 0;
}

void gpsThread(void)
{
    // read out available GPS bytes
    if (gpsPort) {
        while (serialTotalBytesWaiting(gpsPort))
            gpsNewData(serialRead(gpsPort));
    }

    switch (gpsData.state) {
        case GPS_UNKNOWN:
            break;

        case GPS_INITIALIZING:
        case GPS_CHANGE_BAUD:
        case GPS_CONFIGURE:
            gpsInitHardware();
            break;

        case GPS_LOST_COMMUNICATION:
            gpsData.errors++;
            // try another rate
            gpsData.baudrateIndex++;
            gpsData.baudrateIndex %= GPS_INIT_ENTRIES;
            gpsData.lastMessage = millis();
            // TODO - move some / all of these into gpsData
            GPS_numSat = 0;
            DISABLE_STATE(GPS_FIX);
            gpsSetState(GPS_INITIALIZING);
            break;

        case GPS_RECEIVING_DATA:
            // check for no data/gps timeout/cable disconnection etc
            if (millis() - gpsData.lastMessage > GPS_TIMEOUT) {
                // remove GPS from capability
                sensorsClear(SENSOR_GPS);
                gpsSetState(GPS_LOST_COMMUNICATION);
            }
            break;
    }
}

static void gpsNewData(uint16_t c)
{
    if (!gpsNewFrame(c)) {
        return;
    }

    // new data received and parsed, we're in business
    gpsData.lastLastMessage = gpsData.lastMessage;
    gpsData.lastMessage = millis();
    sensorsSet(SENSOR_GPS);

    if (GPS_update == 1)
        GPS_update = 0;
    else
        GPS_update = 1;

#if 0
    debug[3] = GPS_update;
#endif

    onGpsNewData();
}

bool gpsNewFrame(uint8_t c)
{
    switch (gpsConfig->provider) {
        case GPS_NMEA:          // NMEA
            return gpsNewFrameNMEA(c);
        case GPS_UBLOX:         // UBX binary
            return gpsNewFrameUBLOX(c);
    }

    return false;
}


/* This is a light implementation of a GPS frame decoding
   This should work with most of modern GPS devices configured to output NMEA frames.
   It assumes there are some NMEA GGA frames to decode on the serial bus
   Now verifies checksum correctly before applying data

   Here we use only the following data :
     - latitude
     - longitude
     - GPS fix is/is not ok
     - GPS num sat (4 is enough to be +/- reliable)
     // added by Mis
     - GPS altitude (for OSD displaying)
     - GPS speed (for OSD displaying)
*/

#define NO_FRAME   0
#define FRAME_GGA  1
#define FRAME_RMC  2


// This code is used for parsing NMEA data

/* Alex optimization
  The latitude or longitude is coded this way in NMEA frames
  dm.f   coded as degrees + minutes + minute decimal
  Where:
    - d can be 1 or more char long. generally: 2 char long for latitude, 3 char long for longitude
    - m is always 2 char long
    - f can be 1 or more char long
  This function converts this format in a unique unsigned long where 1 degree = 10 000 000

  EOS increased the precision here, even if we think that the gps is not precise enough, with 10e5 precision it has 76cm resolution
  with 10e7 it's around 1 cm now. Increasing it further is irrelevant, since even 1cm resolution is unrealistic, however increased
  resolution also increased precision of nav calculations
static uint32_t GPS_coord_to_degrees(char *coordinateString)
{
    char *p = s, *d = s;
    uint8_t min, deg = 0;
    uint16_t frac = 0, mult = 10000;

    while (*p) {                // parse the string until its end
        if (d != s) {
            frac += (*p - '0') * mult;  // calculate only fractional part on up to 5 digits  (d != s condition is true when the . is located)
            mult /= 10;
        }
        if (*p == '.')
            d = p;              // locate '.' char in the string
        p++;
    }
    if (p == s)
        return 0;
    while (s < d - 2) {
        deg *= 10;              // convert degrees : all chars before minutes ; for the first iteration, deg = 0
        deg += *(s++) - '0';
    }
    min = *(d - 1) - '0' + (*(d - 2) - '0') * 10;       // convert minutes : 2 previous char before '.'
    return deg * 10000000UL + (min * 100000UL + frac) * 10UL / 6;
}
*/

// helper functions
static uint32_t grab_fields(char *src, uint8_t mult)
{                               // convert string to uint32
    uint32_t i;
    uint32_t tmp = 0;
    for (i = 0; src[i] != 0; i++) {
        if (src[i] == '.') {
            i++;
            if (mult == 0)
                break;
            else
                src[i + mult] = 0;
        }
        tmp *= 10;
        if (src[i] >= '0' && src[i] <= '9')
            tmp += src[i] - '0';
        if (i >= 15)
            return 0; // out of bounds
    }
    return tmp;
}

static bool gpsNewFrameNMEA(char c)
{
    typedef struct gpsdata_s {
        int32_t latitude;
        int32_t longitude;
        uint8_t numSat;
        uint16_t altitude;
        uint16_t speed;
        uint16_t ground_course;
    } gpsdata_t;

    static gpsdata_t gps_Msg;

    uint8_t frameOK = 0;
    static uint8_t param = 0, offset = 0, parity = 0;
    static char string[15];
    static uint8_t checksum_param, gps_frame = NO_FRAME;

    switch (c) {
    case '$':
        param = 0;
        offset = 0;
        parity = 0;
        break;
    case ',':
    case '*':
        string[offset] = 0;
        if (param == 0) {       //frame identification
            gps_frame = NO_FRAME;
            if (string[0] == 'G' && string[1] == 'P' && string[2] == 'G' && string[3] == 'G' && string[4] == 'A')
                gps_frame = FRAME_GGA;
            if (string[0] == 'G' && string[1] == 'P' && string[2] == 'R' && string[3] == 'M' && string[4] == 'C')
                gps_frame = FRAME_RMC;
        }

        switch (gps_frame) {
        case FRAME_GGA:        //************* GPGGA FRAME parsing
            switch (param) {
//          case 1:             // Time information
//              break;
            case 2:
                gps_Msg.latitude = GPS_coord_to_degrees(string);
                break;
            case 3:
                if (string[0] == 'S')
                    gps_Msg.latitude *= -1;
                break;
            case 4:
                gps_Msg.longitude = GPS_coord_to_degrees(string);
                break;
            case 5:
                if (string[0] == 'W')
                    gps_Msg.longitude *= -1;
                break;
            case 6:
                if (string[0] > '0') {
                    ENABLE_STATE(GPS_FIX);
                } else {
                    DISABLE_STATE(GPS_FIX);
                }
                break;
            case 7:
                gps_Msg.numSat = grab_fields(string, 0);
                break;
            case 9:
                gps_Msg.altitude = grab_fields(string, 0);     // altitude in meters added by Mis
                break;
            }
            break;
        case FRAME_RMC:        //************* GPRMC FRAME parsing
            switch (param) {
            case 7:
                gps_Msg.speed = ((grab_fields(string, 1) * 5144L) / 1000L);    // speed in cm/s added by Mis
                break;
            case 8:
                gps_Msg.ground_course = (grab_fields(string, 1));      // ground course deg * 10
                break;
            }
            break;
        }

        param++;
        offset = 0;
        if (c == '*')
            checksum_param = 1;
        else
            parity ^= c;
        break;
    case '\r':
    case '\n':
        if (checksum_param) {   //parity checksum
            uint8_t checksum = 16 * ((string[0] >= 'A') ? string[0] - 'A' + 10 : string[0] - '0') + ((string[1] >= 'A') ? string[1] - 'A' + 10 : string[1] - '0');
            if (checksum == parity) {
                switch (gps_frame) {
                case FRAME_GGA:
                  frameOK = 1;
                  if (STATE(GPS_FIX)) {
                        GPS_coord[LAT] = gps_Msg.latitude;
                        GPS_coord[LON] = gps_Msg.longitude;
                        GPS_numSat = gps_Msg.numSat;
                        GPS_altitude = gps_Msg.altitude;
                    }
                    break;
                case FRAME_RMC:
                    GPS_speed = gps_Msg.speed;
                    GPS_ground_course = gps_Msg.ground_course;
                    break;
                } // end switch
            }
        }
        checksum_param = 0;
        break;
    default:
        if (offset < 15)
            string[offset++] = c;
        if (!checksum_param)
            parity ^= c;
    }
    return frameOK;
}

// UBX support
typedef struct {
    uint8_t preamble1;
    uint8_t preamble2;
    uint8_t msg_class;
    uint8_t msg_id;
    uint16_t length;
} ubx_header;

typedef struct {
    uint32_t time;              // GPS msToW
    int32_t longitude;
    int32_t latitude;
    int32_t altitude_ellipsoid;
    int32_t altitude_msl;
    uint32_t horizontal_accuracy;
    uint32_t vertical_accuracy;
} ubx_nav_posllh;

typedef struct {
    uint32_t time;              // GPS msToW
    uint8_t fix_type;
    uint8_t fix_status;
    uint8_t differential_status;
    uint8_t res;
    uint32_t time_to_first_fix;
    uint32_t uptime;            // milliseconds
} ubx_nav_status;

typedef struct {
    uint32_t time;
    int32_t time_nsec;
    int16_t week;
    uint8_t fix_type;
    uint8_t fix_status;
    int32_t ecef_x;
    int32_t ecef_y;
    int32_t ecef_z;
    uint32_t position_accuracy_3d;
    int32_t ecef_x_velocity;
    int32_t ecef_y_velocity;
    int32_t ecef_z_velocity;
    uint32_t speed_accuracy;
    uint16_t position_DOP;
    uint8_t res;
    uint8_t satellites;
    uint32_t res2;
} ubx_nav_solution;

typedef struct {
    uint32_t time;              // GPS msToW
    int32_t ned_north;
    int32_t ned_east;
    int32_t ned_down;
    uint32_t speed_3d;
    uint32_t speed_2d;
    int32_t heading_2d;
    uint32_t speed_accuracy;
    uint32_t heading_accuracy;
} ubx_nav_velned;

typedef struct {
    uint8_t chn;                // Channel number, 255 for SVx not assigned to channel
    uint8_t svid;               // Satellite ID
    uint8_t flags;              // Bitmask
    uint8_t quality;            // Bitfield
    uint8_t cno;                // Carrier to Noise Ratio (Signal Strength)
    uint8_t elev;               // Elevation in integer degrees
    int16_t azim;               // Azimuth in integer degrees
    int32_t prRes;              // Pseudo range residual in centimetres
} ubx_nav_svinfo_channel;

typedef struct {
    uint32_t time;              // GPS Millisecond time of week
    uint8_t numCh;              // Number of channels
    uint8_t globalFlags;        // Bitmask, Chip hardware generation 0:Antaris, 1:u-blox 5, 2:u-blox 6
    uint16_t reserved2;         // Reserved
    ubx_nav_svinfo_channel channel[16];         // 16 satellites * 12 byte
} ubx_nav_svinfo;

enum {
    PREAMBLE1 = 0xb5,
    PREAMBLE2 = 0x62,
    CLASS_NAV = 0x01,
    CLASS_ACK = 0x05,
    CLASS_CFG = 0x06,
    MSG_ACK_NACK = 0x00,
    MSG_ACK_ACK = 0x01,
    MSG_POSLLH = 0x2,
    MSG_STATUS = 0x3,
    MSG_SOL = 0x6,
    MSG_VELNED = 0x12,
    MSG_SVINFO = 0x30,
    MSG_CFG_PRT = 0x00,
    MSG_CFG_RATE = 0x08,
    MSG_CFG_SET_RATE = 0x01,
    MSG_CFG_NAV_SETTINGS = 0x24
} ubx_protocol_bytes;

enum {
    FIX_NONE = 0,
    FIX_DEAD_RECKONING = 1,
    FIX_2D = 2,
    FIX_3D = 3,
    FIX_GPS_DEAD_RECKONING = 4,
    FIX_TIME = 5
} ubs_nav_fix_type;

enum {
    NAV_STATUS_FIX_VALID = 1
} ubx_nav_status_bits;

// Packet checksum accumulators
static uint8_t _ck_a;
static uint8_t _ck_b;

// State machine state
static uint8_t _step;
static uint8_t _msg_id;
static uint16_t _payload_length;
static uint16_t _payload_counter;

static bool next_fix;
static uint8_t _class;

// do we have new position information?
static bool _new_position;

// do we have new speed information?
static bool _new_speed;

// Receive buffer
static union {
    ubx_nav_posllh posllh;
    ubx_nav_status status;
    ubx_nav_solution solution;
    ubx_nav_velned velned;
    ubx_nav_svinfo svinfo;
    uint8_t bytes[200];
} _buffer;

void _update_checksum(uint8_t *data, uint8_t len, uint8_t *ck_a, uint8_t *ck_b)
{
    while (len--) {
        *ck_a += *data;
        *ck_b += *ck_a;
        data++;
    }
}


static bool UBLOX_parse_gps(void)
{
    int i;
    switch (_msg_id) {
    case MSG_POSLLH:
        //i2c_dataset.time                = _buffer.posllh.time;
        GPS_coord[LON] = _buffer.posllh.longitude;
        GPS_coord[LAT] = _buffer.posllh.latitude;
        GPS_altitude = _buffer.posllh.altitude_msl / 10 / 100;  //alt in m
        if (next_fix) {
            ENABLE_STATE(GPS_FIX);
        } else {
            DISABLE_STATE(GPS_FIX);
        }
        _new_position = true;
        break;
    case MSG_STATUS:
        next_fix = (_buffer.status.fix_status & NAV_STATUS_FIX_VALID) && (_buffer.status.fix_type == FIX_3D);
        if (!next_fix)
            DISABLE_STATE(GPS_FIX);
        break;
    case MSG_SOL:
        next_fix = (_buffer.solution.fix_status & NAV_STATUS_FIX_VALID) && (_buffer.solution.fix_type == FIX_3D);
        if (!next_fix)
            DISABLE_STATE(GPS_FIX);
        GPS_numSat = _buffer.solution.satellites;
        GPS_hdop = _buffer.solution.position_DOP;
        break;
    case MSG_VELNED:
        // speed_3d                        = _buffer.velned.speed_3d;  // cm/s
        GPS_speed = _buffer.velned.speed_2d;    // cm/s
        GPS_ground_course = (uint16_t) (_buffer.velned.heading_2d / 10000);     // Heading 2D deg * 100000 rescaled to deg * 10
        _new_speed = true;
        break;
    case MSG_SVINFO:
        GPS_numCh = _buffer.svinfo.numCh;
        if (GPS_numCh > 16)
            GPS_numCh = 16;
        for (i = 0; i < GPS_numCh; i++){
            GPS_svinfo_chn[i]= _buffer.svinfo.channel[i].chn;
            GPS_svinfo_svid[i]= _buffer.svinfo.channel[i].svid;
            GPS_svinfo_quality[i]=_buffer.svinfo.channel[i].quality;
            GPS_svinfo_cno[i]= _buffer.svinfo.channel[i].cno;
        }
        break;
    default:
        return false;
    }

    // we only return true when we get new position and speed data
    // this ensures we don't use stale data
    if (_new_position && _new_speed) {
        _new_speed = _new_position = false;
        return true;
    }
    return false;
}

static bool gpsNewFrameUBLOX(uint8_t data)
{
    bool parsed = false;

    switch (_step) {
        case 1:
            if (PREAMBLE2 == data) {
                _step++;
                break;
            }
            _step = 0;
        case 0:
            if (PREAMBLE1 == data)
                _step++;
            break;
        case 2:
            _step++;
            _class = data;
            _ck_b = _ck_a = data;   // reset the checksum accumulators
            break;
        case 3:
            _step++;
            _ck_b += (_ck_a += data);       // checksum byte
            _msg_id = data;
            break;
        case 4:
            _step++;
            _ck_b += (_ck_a += data);       // checksum byte
            _payload_length = data; // payload length low byte
            break;
        case 5:
            _step++;
            _ck_b += (_ck_a += data);       // checksum byte
            _payload_length += (uint16_t)(data << 8);
            if (_payload_length > 512) {
                _payload_length = 0;
                _step = 0;
            }
            _payload_counter = 0;   // prepare to receive payload
            break;
        case 6:
            _ck_b += (_ck_a += data);       // checksum byte
            if (_payload_counter < sizeof(_buffer)) {
                _buffer.bytes[_payload_counter] = data;
            }
            if (++_payload_counter == _payload_length)
                _step++;
            break;
        case 7:
            _step++;
            if (_ck_a != data)
                _step = 0;          // bad checksum
            break;
        case 8:
            _step = 0;
            if (_ck_b != data)
                break;              // bad checksum
            if (UBLOX_parse_gps())
                parsed = true;
    }                           //end switch
    return parsed;
}

gpsEnablePassthroughResult_e gpsEnablePassthrough(void)
{
    if (gpsData.state != GPS_RECEIVING_DATA)
        return GPS_PASSTHROUGH_NO_GPS;

    serialPort_t *gpsPassthroughPort = findOpenSerialPort(FUNCTION_GPS_PASSTHROUGH);
    if (gpsPassthroughPort) {

        waitForSerialPortToFinishTransmitting(gpsPassthroughPort);
        serialSetBaudRate(gpsPassthroughPort, serialConfig->gps_passthrough_baudrate);
    } else {
        gpsPassthroughPort = openSerialPort(FUNCTION_GPS_PASSTHROUGH, NULL, serialConfig->gps_passthrough_baudrate, MODE_RXTX, SERIAL_NOT_INVERTED);
        if (!gpsPassthroughPort) {
            return GPS_PASSTHROUGH_NO_SERIAL_PORT;
        }
    }

    LED0_OFF;
    LED1_OFF;

    while(1) {
        if (serialTotalBytesWaiting(gpsPort)) {
            LED0_ON;
            serialWrite(gpsPassthroughPort, serialRead(gpsPort));
            LED0_OFF;
        }
        if (serialTotalBytesWaiting(gpsPassthroughPort)) {
            LED1_ON;
            serialWrite(gpsPort, serialRead(gpsPassthroughPort));
            LED1_OFF;
        }
    }
    return GPS_PASSTHROUGH_ENABLED;
}

void updateGpsIndicator(uint32_t currentTime)
{
    static uint32_t GPSLEDTime;
    if ((int32_t)(currentTime - GPSLEDTime) >= 0 && (GPS_numSat >= 5)) {
        GPSLEDTime = currentTime + 150000;
        LED1_TOGGLE;
    }
}
#endif
