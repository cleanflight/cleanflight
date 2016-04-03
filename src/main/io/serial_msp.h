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

#include "io/serial.h"
#include "drivers/serial.h"

/**
 * MSP Guidelines, emphasis is used to clarify.
 *
 * Each FlightController (FC, Server) MUST change the API version when any MSP command is added, deleted, or changed.
 *
 * If you fork the FC source code and release your own version, you MUST change the Flight Controller Identifier.
 *
 * NEVER release a modified copy of this code that shares the same Flight controller IDENT and API version
 * if the API doesn't match EXACTLY.
 *
 * Consumers of the API (API clients) SHOULD first attempt to get a response from the MSP_API_VERSION command.
 * If no response is obtained then client MAY try the legacy MSP_IDENT command.
 *
 * API consumers should ALWAYS handle communication failures gracefully and attempt to continue
 * without the information if possible.  Clients MAY log/display a suitable message.
 *
 * API clients should NOT attempt any communication if they can't handle the returned API MAJOR VERSION.
 *
 * API clients SHOULD attempt communication if the API MINOR VERSION has increased from the time
 * the API client was written and handle command failures gracefully.  Clients MAY disable
 * functionality that depends on the commands while still leaving other functionality intact.
 * Clients SHOULD operate in READ-ONLY mode and SHOULD present a warning to the user to state
 * that the newer API version may cause problems before using API commands that change FC state.
 *
 * It is for this reason that each MSP command should be specific as possible, such that changes
 * to commands break as little client functionality as possible.
 *
 * API client authors MAY use a compatibility matrix/table when determining if they can support
 * a given command from a given flight controller at a given api version level.
 *
 * Developers MUST NOT create new MSP commands that do more than one thing.
 *
 * Failure to follow these guidelines will likely invoke the wrath of developers trying to write tools
 * that use the API and the users of those tools.
 */

#define MSP_PROTOCOL_VERSION                0

#define API_VERSION_MAJOR                   1 // increment when major changes are made
#define API_VERSION_MINOR                   16 // increment when any change is made, reset to zero when major changes are released after changing API_VERSION_MAJOR

#define API_VERSION_LENGTH                  2

#define MULTIWII_IDENTIFIER "MWII";
#define CLEANFLIGHT_IDENTIFIER "CLFL"
#define BASEFLIGHT_IDENTIFIER "BAFL";

#define FLIGHT_CONTROLLER_IDENTIFIER_LENGTH 4
extern const char * const flightControllerIdentifier;

#define FLIGHT_CONTROLLER_VERSION_LENGTH    3
#define FLIGHT_CONTROLLER_VERSION_MASK      0xFFF

static const char * const boardIdentifier = TARGET_BOARD_IDENTIFIER;
#define BOARD_IDENTIFIER_LENGTH             4 // 4 UPPER CASE alpha numeric characters that identify the board being used.
#define BOARD_HARDWARE_REVISION_LENGTH      2

// These are baseflight specific flags but they are useless now since MW 2.3 uses the upper 4 bits for the navigation version.
#define CAP_PLATFORM_32BIT          ((uint32_t)1 << 31)
#define CAP_BASEFLIGHT_CONFIG       ((uint32_t)1 << 30)

// MW 2.3 stores NAVI_VERSION in the top 4 bits of the capability mask.
#define CAP_NAVI_VERSION_BIT_4_MSB  ((uint32_t)1 << 31)
#define CAP_NAVI_VERSION_BIT_3      ((uint32_t)1 << 30)
#define CAP_NAVI_VERSION_BIT_2      ((uint32_t)1 << 29)
#define CAP_NAVI_VERSION_BIT_1_LSB  ((uint32_t)1 << 28)

#define CAP_DYNBALANCE              ((uint32_t)1 << 2)
#define CAP_FLAPS                   ((uint32_t)1 << 3)
#define CAP_NAVCAP                  ((uint32_t)1 << 4)
#define CAP_EXTAUX                  ((uint32_t)1 << 5)

#define MSP_API_VERSION                 1    //out message
#define MSP_FC_VARIANT                  2    //out message
#define MSP_FC_VERSION                  3    //out message
#define MSP_BOARD_INFO                  4    //out message
#define MSP_BUILD_INFO                  5    //out message

//
// MSP commands for Cleanflight original features
//
#define MSP_MODE_RANGES                 34    //out message         Returns all mode ranges
#define MSP_SET_MODE_RANGE              35    //in message          Sets a single mode range

#define MSP_FEATURE                     36
#define MSP_SET_FEATURE                 37

#define MSP_BOARD_ALIGNMENT             38
#define MSP_SET_BOARD_ALIGNMENT         39

#define MSP_CURRENT_METER_CONFIG        40
#define MSP_SET_CURRENT_METER_CONFIG    41

#define MSP_MIXER                       42
#define MSP_SET_MIXER                   43

#define MSP_RX_CONFIG                   44
#define MSP_SET_RX_CONFIG               45

#define MSP_LED_COLORS                  46
#define MSP_SET_LED_COLORS              47

#define MSP_LED_STRIP_CONFIG            48
#define MSP_SET_LED_STRIP_CONFIG        49

#define MSP_RSSI_CONFIG                 50
#define MSP_SET_RSSI_CONFIG             51

#define MSP_ADJUSTMENT_RANGES           52
#define MSP_SET_ADJUSTMENT_RANGE        53

// private - only to be used by the configurator, the commands are likely to change
#define MSP_CF_SERIAL_CONFIG            54
#define MSP_SET_CF_SERIAL_CONFIG        55

#define MSP_VOLTAGE_METER_CONFIG        56
#define MSP_SET_VOLTAGE_METER_CONFIG    57

#define MSP_SONAR_ALTITUDE              58 //out message get sonar altitude [cm]

#define MSP_PID_CONTROLLER              59
#define MSP_SET_PID_CONTROLLER          60

#define MSP_ARMING_CONFIG               61 //out message         Returns auto_disarm_delay and disarm_kill_switch parameters
#define MSP_SET_ARMING_CONFIG           62 //in message          Sets auto_disarm_delay and disarm_kill_switch parameters

#define MSP_DATAFLASH_SUMMARY           70 //out message - get description of dataflash chip
#define MSP_DATAFLASH_READ              71 //out message - get content of dataflash chip
#define MSP_DATAFLASH_ERASE             72 //in message - erase dataflash chip

#define MSP_LOOP_TIME                   73 //out message         Returns FC cycle time i.e looptime parameter
#define MSP_SET_LOOP_TIME               74 //in message          Sets FC cycle time i.e looptime parameter

#define MSP_FAILSAFE_CONFIG             75 //out message         Returns FC Fail-Safe settings
#define MSP_SET_FAILSAFE_CONFIG         76 //in message          Sets FC Fail-Safe settings

#define MSP_RXFAIL_CONFIG               77 //out message         Returns RXFAIL settings
#define MSP_SET_RXFAIL_CONFIG           78 //in message          Sets RXFAIL settings

#define MSP_SDCARD_SUMMARY              79 //out message         Get the state of the SD card

#define MSP_BLACKBOX_CONFIG             80 //out message         Get blackbox settings
#define MSP_SET_BLACKBOX_CONFIG         81 //in message          Set blackbox settings

#define MSP_TRANSPONDER_CONFIG          82 //out message         Get transponder settings
#define MSP_SET_TRANSPONDER_CONFIG      83 //in  message         Set transponder settings

//
// Baseflight MSP commands (if enabled they exist in Cleanflight)
//
#define MSP_RX_MAP                      64 //out message get channel map (also returns number of channels total)
#define MSP_SET_RX_MAP                  65 //in message set rx map, numchannels to set comes from MSP_RX_MAP

// FIXME - Provided for backwards compatibility with configurator code until configurator is updated.
// DEPRECATED - DO NOT USE "MSP_BF_CONFIG" and MSP_SET_BF_CONFIG.  In Cleanflight, isolated commands already exist and should be used instead.
#define MSP_BF_CONFIG                   66 //out message baseflight-specific settings that aren't covered elsewhere
#define MSP_SET_BF_CONFIG               67 //in message baseflight-specific settings save

#define MSP_REBOOT                      68 //in message reboot settings

// DEPRECATED - Use MSP_BUILD_INFO instead
#define MSP_BF_BUILD_INFO               69 //out message build date as well as some space for future expansion

//
// Multwii original MSP commands
//

// DEPRECATED - See MSP_API_VERSION and MSP_MIXER
#define MSP_IDENT                100    //out message         mixerMode + multiwii version + protocol version + capability variable


#define MSP_STATUS               101    //out message         cycletime & errors_count & sensor present & box activation & current setting number
#define MSP_RAW_IMU              102    //out message         9 DOF
#define MSP_SERVO                103    //out message         servos
#define MSP_MOTOR                104    //out message         motors
#define MSP_RC                   105    //out message         rc channels and more
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
#define MSP_SERVO_CONFIGURATIONS 120    //out message         All servo configurations.
#define MSP_NAV_STATUS           121    //out message         Returns navigation status
#define MSP_NAV_CONFIG           122    //out message         Returns navigation parameters
#define MSP_3D                   124    //out message         Settings needed for reversible ESCs
#define MSP_RC_DEADBAND          125    //out message         deadbands for yaw alt pitch roll
#define MSP_SENSOR_ALIGNMENT     126    //out message         orientation of acc,gyro,mag

#define MSP_SET_RAW_RC           200    //in message          8 rc chan
#define MSP_SET_RAW_GPS          201    //in message          fix, numsat, lat, lon, alt, speed
#define MSP_SET_PID              202    //in message          P I D coeff (9 are used currently)
#define MSP_SET_BOX              203    //in message          BOX setup (number is dependant of your setup)
#define MSP_SET_RC_TUNING        204    //in message          rc rate, rc expo, rollpitch rate, yaw rate, dyn throttle PID, yaw expo
#define MSP_ACC_CALIBRATION      205    //in message          no param
#define MSP_MAG_CALIBRATION      206    //in message          no param
#define MSP_SET_MISC             207    //in message          powermeter trig + 8 free for future use
#define MSP_RESET_CONF           208    //in message          no param
#define MSP_SET_WP               209    //in message          sets a given WP (WP#,lat, lon, alt, flags)
#define MSP_SELECT_SETTING       210    //in message          Select Setting Number (0-2)
#define MSP_SET_HEAD             211    //in message          define a new heading hold direction
#define MSP_SET_SERVO_CONFIGURATION 212    //in message          Servo settings
#define MSP_SET_MOTOR            214    //in message          PropBalance function
#define MSP_SET_NAV_CONFIG       215    //in message          Sets nav config parameters - write to the eeprom
#define MSP_SET_3D               217    //in message          Settings needed for reversible ESCs
#define MSP_SET_RC_DEADBAND      218    //in message          deadbands for yaw alt pitch roll
#define MSP_SET_RESET_CURR_PID   219    //in message          resetting the current pid profile to defaults
#define MSP_SET_SENSOR_ALIGNMENT 220    //in message          set the orientation of the acc,gyro,mag

// #define MSP_BIND                 240    //in message          no param
// #define MSP_ALARMS               242

#define MSP_EEPROM_WRITE         250    //in message          no param

#define MSP_DEBUGMSG             253    //out message         debug string buffer
#define MSP_DEBUG                254    //out message         debug1,debug2,debug3,debug4

// Additional commands that are not compatible with MultiWii
#define MSP_STATUS_EX            150    //out message         cycletime, errors_count, CPU load, sensor present etc
#define MSP_UID                  160    //out message         Unique device ID
#define MSP_GPSSVINFO            164    //out message         get Signal Strength (only U-Blox)
#define MSP_ACC_TRIM             240    //out message         get acc angle trim values
#define MSP_SET_ACC_TRIM         239    //in message          set acc angle trim values
#define MSP_SERVO_MIX_RULES      241    //out message         Returns servo mixer configuration
#define MSP_SET_SERVO_MIX_RULE   242    //in message          Sets servo mixer configuration
#define MSP_SET_1WIRE            243    //in message          Sets 1Wire paththrough

// Each MSP port requires state and a receive buffer, revisit this default if someone needs more than 2 MSP ports.
#define MAX_MSP_PORT_COUNT 2

typedef enum {
    IDLE,
    HEADER_START,
    HEADER_M,
    HEADER_ARROW,
    HEADER_SIZE,
    HEADER_CMD,
    COMMAND_RECEIVED
} mspState_e;

#define MSP_PORT_INBUF_SIZE 64

typedef struct mspPort_s {
    serialPort_t *port; // null when port unused.
    uint8_t offset;
    uint8_t dataSize;
    uint8_t checksum;
    uint8_t indRX;
    uint8_t inBuf[MSP_PORT_INBUF_SIZE];
    mspState_e c_state;
    uint8_t cmdMSP;
} mspPort_t;

void mspInit(serialConfig_t *serialConfig);
void mspProcess(void);
void mspAllocateSerialPorts(serialConfig_t *serialConfig);
void mspReleasePortIfAllocated(serialPort_t *serialPort);
