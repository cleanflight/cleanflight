/** @file
 *	@brief MAVLink comm protocol generated from common.xml
 *	@see http://mavlink.org
 */
#ifndef MAVLINK_COMMON_H
#define MAVLINK_COMMON_H

#ifndef MAVLINK_H
    #error Wrong include order: MAVLINK_COMMON.H MUST NOT BE DIRECTLY USED. Include mavlink.h from the same directory instead or set ALL AND EVERY defines from MAVLINK.H manually accordingly, including the #define MAVLINK_H call.
#endif

#ifdef __cplusplus
extern "C" {
#endif

// MESSAGE LENGTHS AND CRCS

#ifndef MAVLINK_MESSAGE_LENGTHS
#define MAVLINK_MESSAGE_LENGTHS {9, 31, 12, 0, 14, 28, 3, 32, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 20, 2, 25, 23, 30, 101, 22, 26, 16, 14, 28, 32, 28, 28, 22, 22, 21, 6, 6, 37, 4, 4, 2, 2, 4, 2, 2, 3, 13, 12, 37, 0, 0, 0, 27, 25, 0, 0, 0, 0, 0, 68, 26, 185, 229, 42, 6, 4, 0, 11, 18, 0, 0, 37, 20, 35, 33, 3, 0, 0, 0, 22, 39, 37, 53, 51, 53, 51, 0, 28, 56, 42, 33, 0, 0, 0, 0, 0, 0, 0, 26, 32, 32, 20, 32, 62, 44, 64, 84, 9, 254, 16, 12, 36, 44, 64, 22, 6, 14, 12, 97, 2, 2, 113, 35, 6, 79, 35, 35, 22, 13, 255, 14, 18, 43, 8, 22, 14, 36, 43, 41, 0, 0, 0, 0, 0, 0, 36, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 254, 36, 30, 18, 18, 51, 9, 0}
#endif

#ifndef MAVLINK_MESSAGE_CRCS
#define MAVLINK_MESSAGE_CRCS {50, 124, 137, 0, 237, 217, 104, 119, 0, 0, 0, 89, 0, 0, 0, 0, 0, 0, 0, 0, 214, 159, 220, 168, 24, 23, 170, 144, 67, 115, 39, 246, 185, 104, 237, 244, 222, 212, 9, 254, 230, 28, 28, 132, 221, 232, 11, 153, 41, 39, 78, 0, 0, 0, 15, 3, 0, 0, 0, 0, 0, 153, 183, 51, 59, 118, 148, 21, 0, 243, 124, 0, 0, 38, 20, 158, 152, 143, 0, 0, 0, 106, 49, 22, 143, 140, 5, 150, 0, 231, 183, 63, 54, 0, 0, 0, 0, 0, 0, 0, 175, 102, 158, 208, 56, 93, 138, 108, 32, 185, 84, 34, 174, 124, 237, 4, 76, 128, 56, 116, 134, 237, 203, 250, 87, 203, 220, 25, 226, 46, 29, 223, 85, 6, 229, 203, 1, 195, 109, 168, 181, 0, 0, 0, 0, 0, 0, 154, 178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 204, 49, 170, 44, 83, 46, 0}
#endif

#ifndef MAVLINK_MESSAGE_INFO
#define MAVLINK_MESSAGE_INFO {MAVLINK_MESSAGE_INFO_HEARTBEAT, MAVLINK_MESSAGE_INFO_SYS_STATUS, MAVLINK_MESSAGE_INFO_SYSTEM_TIME, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, MAVLINK_MESSAGE_INFO_PING, MAVLINK_MESSAGE_INFO_CHANGE_OPERATOR_CONTROL, MAVLINK_MESSAGE_INFO_CHANGE_OPERATOR_CONTROL_ACK, MAVLINK_MESSAGE_INFO_AUTH_KEY, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, MAVLINK_MESSAGE_INFO_SET_MODE, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, MAVLINK_MESSAGE_INFO_PARAM_REQUEST_READ, MAVLINK_MESSAGE_INFO_PARAM_REQUEST_LIST, MAVLINK_MESSAGE_INFO_PARAM_VALUE, MAVLINK_MESSAGE_INFO_PARAM_SET, MAVLINK_MESSAGE_INFO_GPS_RAW_INT, MAVLINK_MESSAGE_INFO_GPS_STATUS, MAVLINK_MESSAGE_INFO_SCALED_IMU, MAVLINK_MESSAGE_INFO_RAW_IMU, MAVLINK_MESSAGE_INFO_RAW_PRESSURE, MAVLINK_MESSAGE_INFO_SCALED_PRESSURE, MAVLINK_MESSAGE_INFO_ATTITUDE, MAVLINK_MESSAGE_INFO_ATTITUDE_QUATERNION, MAVLINK_MESSAGE_INFO_LOCAL_POSITION_NED, MAVLINK_MESSAGE_INFO_GLOBAL_POSITION_INT, MAVLINK_MESSAGE_INFO_RC_CHANNELS_SCALED, MAVLINK_MESSAGE_INFO_RC_CHANNELS_RAW, MAVLINK_MESSAGE_INFO_SERVO_OUTPUT_RAW, MAVLINK_MESSAGE_INFO_MISSION_REQUEST_PARTIAL_LIST, MAVLINK_MESSAGE_INFO_MISSION_WRITE_PARTIAL_LIST, MAVLINK_MESSAGE_INFO_MISSION_ITEM, MAVLINK_MESSAGE_INFO_MISSION_REQUEST, MAVLINK_MESSAGE_INFO_MISSION_SET_CURRENT, MAVLINK_MESSAGE_INFO_MISSION_CURRENT, MAVLINK_MESSAGE_INFO_MISSION_REQUEST_LIST, MAVLINK_MESSAGE_INFO_MISSION_COUNT, MAVLINK_MESSAGE_INFO_MISSION_CLEAR_ALL, MAVLINK_MESSAGE_INFO_MISSION_ITEM_REACHED, MAVLINK_MESSAGE_INFO_MISSION_ACK, MAVLINK_MESSAGE_INFO_SET_GPS_GLOBAL_ORIGIN, MAVLINK_MESSAGE_INFO_GPS_GLOBAL_ORIGIN, MAVLINK_MESSAGE_INFO_PARAM_MAP_RC, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, MAVLINK_MESSAGE_INFO_SAFETY_SET_ALLOWED_AREA, MAVLINK_MESSAGE_INFO_SAFETY_ALLOWED_AREA, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, MAVLINK_MESSAGE_INFO_ATTITUDE_QUATERNION_COV, MAVLINK_MESSAGE_INFO_NAV_CONTROLLER_OUTPUT, MAVLINK_MESSAGE_INFO_GLOBAL_POSITION_INT_COV, MAVLINK_MESSAGE_INFO_LOCAL_POSITION_NED_COV, MAVLINK_MESSAGE_INFO_RC_CHANNELS, MAVLINK_MESSAGE_INFO_REQUEST_DATA_STREAM, MAVLINK_MESSAGE_INFO_DATA_STREAM, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, MAVLINK_MESSAGE_INFO_MANUAL_CONTROL, MAVLINK_MESSAGE_INFO_RC_CHANNELS_OVERRIDE, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, MAVLINK_MESSAGE_INFO_MISSION_ITEM_INT, MAVLINK_MESSAGE_INFO_VFR_HUD, MAVLINK_MESSAGE_INFO_COMMAND_INT, MAVLINK_MESSAGE_INFO_COMMAND_LONG, MAVLINK_MESSAGE_INFO_COMMAND_ACK, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, MAVLINK_MESSAGE_INFO_MANUAL_SETPOINT, MAVLINK_MESSAGE_INFO_SET_ATTITUDE_TARGET, MAVLINK_MESSAGE_INFO_ATTITUDE_TARGET, MAVLINK_MESSAGE_INFO_SET_POSITION_TARGET_LOCAL_NED, MAVLINK_MESSAGE_INFO_POSITION_TARGET_LOCAL_NED, MAVLINK_MESSAGE_INFO_SET_POSITION_TARGET_GLOBAL_INT, MAVLINK_MESSAGE_INFO_POSITION_TARGET_GLOBAL_INT, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, MAVLINK_MESSAGE_INFO_LOCAL_POSITION_NED_SYSTEM_GLOBAL_OFFSET, MAVLINK_MESSAGE_INFO_HIL_STATE, MAVLINK_MESSAGE_INFO_HIL_CONTROLS, MAVLINK_MESSAGE_INFO_HIL_RC_INPUTS_RAW, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, MAVLINK_MESSAGE_INFO_OPTICAL_FLOW, MAVLINK_MESSAGE_INFO_GLOBAL_VISION_POSITION_ESTIMATE, MAVLINK_MESSAGE_INFO_VISION_POSITION_ESTIMATE, MAVLINK_MESSAGE_INFO_VISION_SPEED_ESTIMATE, MAVLINK_MESSAGE_INFO_VICON_POSITION_ESTIMATE, MAVLINK_MESSAGE_INFO_HIGHRES_IMU, MAVLINK_MESSAGE_INFO_OPTICAL_FLOW_RAD, MAVLINK_MESSAGE_INFO_HIL_SENSOR, MAVLINK_MESSAGE_INFO_SIM_STATE, MAVLINK_MESSAGE_INFO_RADIO_STATUS, MAVLINK_MESSAGE_INFO_FILE_TRANSFER_PROTOCOL, MAVLINK_MESSAGE_INFO_TIMESYNC, MAVLINK_MESSAGE_INFO_CAMERA_TRIGGER, MAVLINK_MESSAGE_INFO_HIL_GPS, MAVLINK_MESSAGE_INFO_HIL_OPTICAL_FLOW, MAVLINK_MESSAGE_INFO_HIL_STATE_QUATERNION, MAVLINK_MESSAGE_INFO_SCALED_IMU2, MAVLINK_MESSAGE_INFO_LOG_REQUEST_LIST, MAVLINK_MESSAGE_INFO_LOG_ENTRY, MAVLINK_MESSAGE_INFO_LOG_REQUEST_DATA, MAVLINK_MESSAGE_INFO_LOG_DATA, MAVLINK_MESSAGE_INFO_LOG_ERASE, MAVLINK_MESSAGE_INFO_LOG_REQUEST_END, MAVLINK_MESSAGE_INFO_GPS_INJECT_DATA, MAVLINK_MESSAGE_INFO_GPS2_RAW, MAVLINK_MESSAGE_INFO_POWER_STATUS, MAVLINK_MESSAGE_INFO_SERIAL_CONTROL, MAVLINK_MESSAGE_INFO_GPS_RTK, MAVLINK_MESSAGE_INFO_GPS2_RTK, MAVLINK_MESSAGE_INFO_SCALED_IMU3, MAVLINK_MESSAGE_INFO_DATA_TRANSMISSION_HANDSHAKE, MAVLINK_MESSAGE_INFO_ENCAPSULATED_DATA, MAVLINK_MESSAGE_INFO_DISTANCE_SENSOR, MAVLINK_MESSAGE_INFO_TERRAIN_REQUEST, MAVLINK_MESSAGE_INFO_TERRAIN_DATA, MAVLINK_MESSAGE_INFO_TERRAIN_CHECK, MAVLINK_MESSAGE_INFO_TERRAIN_REPORT, MAVLINK_MESSAGE_INFO_SCALED_PRESSURE2, MAVLINK_MESSAGE_INFO_ATT_POS_MOCAP, MAVLINK_MESSAGE_INFO_SET_ACTUATOR_CONTROL_TARGET, MAVLINK_MESSAGE_INFO_ACTUATOR_CONTROL_TARGET, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, MAVLINK_MESSAGE_INFO_BATTERY_STATUS, MAVLINK_MESSAGE_INFO_AUTOPILOT_VERSION, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}, MAVLINK_MESSAGE_INFO_V2_EXTENSION, MAVLINK_MESSAGE_INFO_MEMORY_VECT, MAVLINK_MESSAGE_INFO_DEBUG_VECT, MAVLINK_MESSAGE_INFO_NAMED_VALUE_FLOAT, MAVLINK_MESSAGE_INFO_NAMED_VALUE_INT, MAVLINK_MESSAGE_INFO_STATUSTEXT, MAVLINK_MESSAGE_INFO_DEBUG, {"EMPTY",0,{{"","",MAVLINK_TYPE_CHAR,0,0,0}}}}
#endif

#include "../protocol.h"

#define MAVLINK_ENABLED_COMMON

// ENUM DEFINITIONS


/** @brief Micro air vehicle / autopilot classes. This identifies the individual model. */
#ifndef HAVE_ENUM_MAV_AUTOPILOT
#define HAVE_ENUM_MAV_AUTOPILOT
typedef enum MAV_AUTOPILOT
{
	MAV_AUTOPILOT_GENERIC=0, /* Generic autopilot, full support for everything | */
	MAV_AUTOPILOT_PIXHAWK=1, /* PIXHAWK autopilot, http://pixhawk.ethz.ch | */
	MAV_AUTOPILOT_SLUGS=2, /* SLUGS autopilot, http://slugsuav.soe.ucsc.edu | */
	MAV_AUTOPILOT_ARDUPILOTMEGA=3, /* ArduPilotMega / ArduCopter, http://diydrones.com | */
	MAV_AUTOPILOT_OPENPILOT=4, /* OpenPilot, http://openpilot.org | */
	MAV_AUTOPILOT_GENERIC_WAYPOINTS_ONLY=5, /* Generic autopilot only supporting simple waypoints | */
	MAV_AUTOPILOT_GENERIC_WAYPOINTS_AND_SIMPLE_NAVIGATION_ONLY=6, /* Generic autopilot supporting waypoints and other simple navigation commands | */
	MAV_AUTOPILOT_GENERIC_MISSION_FULL=7, /* Generic autopilot supporting the full mission command set | */
	MAV_AUTOPILOT_INVALID=8, /* No valid autopilot, e.g. a GCS or other MAVLink component | */
	MAV_AUTOPILOT_PPZ=9, /* PPZ UAV - http://nongnu.org/paparazzi | */
	MAV_AUTOPILOT_UDB=10, /* UAV Dev Board | */
	MAV_AUTOPILOT_FP=11, /* FlexiPilot | */
	MAV_AUTOPILOT_PX4=12, /* PX4 Autopilot - http://pixhawk.ethz.ch/px4/ | */
	MAV_AUTOPILOT_SMACCMPILOT=13, /* SMACCMPilot - http://smaccmpilot.org | */
	MAV_AUTOPILOT_AUTOQUAD=14, /* AutoQuad -- http://autoquad.org | */
	MAV_AUTOPILOT_ARMAZILA=15, /* Armazila -- http://armazila.com | */
	MAV_AUTOPILOT_AEROB=16, /* Aerob -- http://aerob.ru | */
	MAV_AUTOPILOT_ASLUAV=17, /* ASLUAV autopilot -- http://www.asl.ethz.ch | */
	MAV_AUTOPILOT_ENUM_END=18, /*  | */
} MAV_AUTOPILOT;
#endif

/** @brief  */
#ifndef HAVE_ENUM_MAV_TYPE
#define HAVE_ENUM_MAV_TYPE
typedef enum MAV_TYPE
{
	MAV_TYPE_GENERIC=0, /* Generic micro air vehicle. | */
	MAV_TYPE_FIXED_WING=1, /* Fixed wing aircraft. | */
	MAV_TYPE_QUADROTOR=2, /* Quadrotor | */
	MAV_TYPE_COAXIAL=3, /* Coaxial helicopter | */
	MAV_TYPE_HELICOPTER=4, /* Normal helicopter with tail rotor. | */
	MAV_TYPE_ANTENNA_TRACKER=5, /* Ground installation | */
	MAV_TYPE_GCS=6, /* Operator control unit / ground control station | */
	MAV_TYPE_AIRSHIP=7, /* Airship, controlled | */
	MAV_TYPE_FREE_BALLOON=8, /* Free balloon, uncontrolled | */
	MAV_TYPE_ROCKET=9, /* Rocket | */
	MAV_TYPE_GROUND_ROVER=10, /* Ground rover | */
	MAV_TYPE_SURFACE_BOAT=11, /* Surface vessel, boat, ship | */
	MAV_TYPE_SUBMARINE=12, /* Submarine | */
	MAV_TYPE_HEXAROTOR=13, /* Hexarotor | */
	MAV_TYPE_OCTOROTOR=14, /* Octorotor | */
	MAV_TYPE_TRICOPTER=15, /* Octorotor | */
	MAV_TYPE_FLAPPING_WING=16, /* Flapping wing | */
	MAV_TYPE_KITE=17, /* Flapping wing | */
	MAV_TYPE_ONBOARD_CONTROLLER=18, /* Onboard companion controller | */
	MAV_TYPE_VTOL_DUOROTOR=19, /* Two-rotor VTOL using control surfaces in vertical operation in addition. Tailsitter. | */
	MAV_TYPE_VTOL_QUADROTOR=20, /* Quad-rotor VTOL using a V-shaped quad config in vertical operation. Tailsitter. | */
	MAV_TYPE_VTOL_RESERVED1=21, /* VTOL reserved 1 | */
	MAV_TYPE_VTOL_RESERVED2=22, /* VTOL reserved 2 | */
	MAV_TYPE_VTOL_RESERVED3=23, /* VTOL reserved 3 | */
	MAV_TYPE_VTOL_RESERVED4=24, /* VTOL reserved 4 | */
	MAV_TYPE_VTOL_RESERVED5=25, /* VTOL reserved 5 | */
	MAV_TYPE_GIMBAL=26, /* Onboard gimbal | */
	MAV_TYPE_ENUM_END=27, /*  | */
} MAV_TYPE;
#endif

/** @brief These flags encode the MAV mode. */
#ifndef HAVE_ENUM_MAV_MODE_FLAG
#define HAVE_ENUM_MAV_MODE_FLAG
typedef enum MAV_MODE_FLAG
{
	MAV_MODE_FLAG_CUSTOM_MODE_ENABLED=1, /* 0b00000001 Reserved for future use. | */
	MAV_MODE_FLAG_TEST_ENABLED=2, /* 0b00000010 system has a test mode enabled. This flag is intended for temporary system tests and should not be used for stable implementations. | */
	MAV_MODE_FLAG_AUTO_ENABLED=4, /* 0b00000100 autonomous mode enabled, system finds its own goal positions. Guided flag can be set or not, depends on the actual implementation. | */
	MAV_MODE_FLAG_GUIDED_ENABLED=8, /* 0b00001000 guided mode enabled, system flies MISSIONs / mission items. | */
	MAV_MODE_FLAG_STABILIZE_ENABLED=16, /* 0b00010000 system stabilizes electronically its attitude (and optionally position). It needs however further control inputs to move around. | */
	MAV_MODE_FLAG_HIL_ENABLED=32, /* 0b00100000 hardware in the loop simulation. All motors / actuators are blocked, but internal software is full operational. | */
	MAV_MODE_FLAG_MANUAL_INPUT_ENABLED=64, /* 0b01000000 remote control input is enabled. | */
	MAV_MODE_FLAG_SAFETY_ARMED=128, /* 0b10000000 MAV safety set to armed. Motors are enabled / running / can start. Ready to fly. | */
	MAV_MODE_FLAG_ENUM_END=129, /*  | */
} MAV_MODE_FLAG;
#endif

/** @brief These values encode the bit positions of the decode position. These values can be used to read the value of a flag bit by combining the base_mode variable with AND with the flag position value. The result will be either 0 or 1, depending on if the flag is set or not. */
#ifndef HAVE_ENUM_MAV_MODE_FLAG_DECODE_POSITION
#define HAVE_ENUM_MAV_MODE_FLAG_DECODE_POSITION
typedef enum MAV_MODE_FLAG_DECODE_POSITION
{
	MAV_MODE_FLAG_DECODE_POSITION_CUSTOM_MODE=1, /* Eighth bit: 00000001 | */
	MAV_MODE_FLAG_DECODE_POSITION_TEST=2, /* Seventh bit: 00000010 | */
	MAV_MODE_FLAG_DECODE_POSITION_AUTO=4, /* Sixt bit:   00000100 | */
	MAV_MODE_FLAG_DECODE_POSITION_GUIDED=8, /* Fifth bit:  00001000 | */
	MAV_MODE_FLAG_DECODE_POSITION_STABILIZE=16, /* Fourth bit: 00010000 | */
	MAV_MODE_FLAG_DECODE_POSITION_HIL=32, /* Third bit:  00100000 | */
	MAV_MODE_FLAG_DECODE_POSITION_MANUAL=64, /* Second bit: 01000000 | */
	MAV_MODE_FLAG_DECODE_POSITION_SAFETY=128, /* First bit:  10000000 | */
	MAV_MODE_FLAG_DECODE_POSITION_ENUM_END=129, /*  | */
} MAV_MODE_FLAG_DECODE_POSITION;
#endif

/** @brief Override command, pauses current mission execution and moves immediately to a position */
#ifndef HAVE_ENUM_MAV_GOTO
#define HAVE_ENUM_MAV_GOTO
typedef enum MAV_GOTO
{
	MAV_GOTO_DO_HOLD=0, /* Hold at the current position. | */
	MAV_GOTO_DO_CONTINUE=1, /* Continue with the next item in mission execution. | */
	MAV_GOTO_HOLD_AT_CURRENT_POSITION=2, /* Hold at the current position of the system | */
	MAV_GOTO_HOLD_AT_SPECIFIED_POSITION=3, /* Hold at the position specified in the parameters of the DO_HOLD action | */
	MAV_GOTO_ENUM_END=4, /*  | */
} MAV_GOTO;
#endif

/** @brief These defines are predefined OR-combined mode flags. There is no need to use values from this enum, but it
               simplifies the use of the mode flags. Note that manual input is enabled in all modes as a safety override. */
#ifndef HAVE_ENUM_MAV_MODE
#define HAVE_ENUM_MAV_MODE
typedef enum MAV_MODE
{
	MAV_MODE_PREFLIGHT=0, /* System is not ready to fly, booting, calibrating, etc. No flag is set. | */
	MAV_MODE_MANUAL_DISARMED=64, /* System is allowed to be active, under manual (RC) control, no stabilization | */
	MAV_MODE_TEST_DISARMED=66, /* UNDEFINED mode. This solely depends on the autopilot - use with caution, intended for developers only. | */
	MAV_MODE_STABILIZE_DISARMED=80, /* System is allowed to be active, under assisted RC control. | */
	MAV_MODE_GUIDED_DISARMED=88, /* System is allowed to be active, under autonomous control, manual setpoint | */
	MAV_MODE_AUTO_DISARMED=92, /* System is allowed to be active, under autonomous control and navigation (the trajectory is decided onboard and not pre-programmed by MISSIONs) | */
	MAV_MODE_MANUAL_ARMED=192, /* System is allowed to be active, under manual (RC) control, no stabilization | */
	MAV_MODE_TEST_ARMED=194, /* UNDEFINED mode. This solely depends on the autopilot - use with caution, intended for developers only. | */
	MAV_MODE_STABILIZE_ARMED=208, /* System is allowed to be active, under assisted RC control. | */
	MAV_MODE_GUIDED_ARMED=216, /* System is allowed to be active, under autonomous control, manual setpoint | */
	MAV_MODE_AUTO_ARMED=220, /* System is allowed to be active, under autonomous control and navigation (the trajectory is decided onboard and not pre-programmed by MISSIONs) | */
	MAV_MODE_ENUM_END=221, /*  | */
} MAV_MODE;
#endif

/** @brief  */
#ifndef HAVE_ENUM_MAV_STATE
#define HAVE_ENUM_MAV_STATE
typedef enum MAV_STATE
{
	MAV_STATE_UNINIT=0, /* Uninitialized system, state is unknown. | */
	MAV_STATE_BOOT=1, /* System is booting up. | */
	MAV_STATE_CALIBRATING=2, /* System is calibrating and not flight-ready. | */
	MAV_STATE_STANDBY=3, /* System is grounded and on standby. It can be launched any time. | */
	MAV_STATE_ACTIVE=4, /* System is active and might be already airborne. Motors are engaged. | */
	MAV_STATE_CRITICAL=5, /* System is in a non-normal flight mode. It can however still navigate. | */
	MAV_STATE_EMERGENCY=6, /* System is in a non-normal flight mode. It lost control over parts or over the whole airframe. It is in mayday and going down. | */
	MAV_STATE_POWEROFF=7, /* System just initialized its power-down sequence, will shut down now. | */
	MAV_STATE_ENUM_END=8, /*  | */
} MAV_STATE;
#endif

/** @brief  */
#ifndef HAVE_ENUM_MAV_COMPONENT
#define HAVE_ENUM_MAV_COMPONENT
typedef enum MAV_COMPONENT
{
	MAV_COMP_ID_ALL=0, /*  | */
	MAV_COMP_ID_CAMERA=100, /*  | */
	MAV_COMP_ID_SERVO1=140, /*  | */
	MAV_COMP_ID_SERVO2=141, /*  | */
	MAV_COMP_ID_SERVO3=142, /*  | */
	MAV_COMP_ID_SERVO4=143, /*  | */
	MAV_COMP_ID_SERVO5=144, /*  | */
	MAV_COMP_ID_SERVO6=145, /*  | */
	MAV_COMP_ID_SERVO7=146, /*  | */
	MAV_COMP_ID_SERVO8=147, /*  | */
	MAV_COMP_ID_SERVO9=148, /*  | */
	MAV_COMP_ID_SERVO10=149, /*  | */
	MAV_COMP_ID_SERVO11=150, /*  | */
	MAV_COMP_ID_SERVO12=151, /*  | */
	MAV_COMP_ID_SERVO13=152, /*  | */
	MAV_COMP_ID_SERVO14=153, /*  | */
	MAV_COMP_ID_GIMBAL=154, /*  | */
	MAV_COMP_ID_MAPPER=180, /*  | */
	MAV_COMP_ID_MISSIONPLANNER=190, /*  | */
	MAV_COMP_ID_PATHPLANNER=195, /*  | */
	MAV_COMP_ID_IMU=200, /*  | */
	MAV_COMP_ID_IMU_2=201, /*  | */
	MAV_COMP_ID_IMU_3=202, /*  | */
	MAV_COMP_ID_GPS=220, /*  | */
	MAV_COMP_ID_UDP_BRIDGE=240, /*  | */
	MAV_COMP_ID_UART_BRIDGE=241, /*  | */
	MAV_COMP_ID_SYSTEM_CONTROL=250, /*  | */
	MAV_COMPONENT_ENUM_END=251, /*  | */
} MAV_COMPONENT;
#endif

/** @brief These encode the sensors whose status is sent as part of the SYS_STATUS message. */
#ifndef HAVE_ENUM_MAV_SYS_STATUS_SENSOR
#define HAVE_ENUM_MAV_SYS_STATUS_SENSOR
typedef enum MAV_SYS_STATUS_SENSOR
{
	MAV_SYS_STATUS_SENSOR_3D_GYRO=1, /* 0x01 3D gyro | */
	MAV_SYS_STATUS_SENSOR_3D_ACCEL=2, /* 0x02 3D accelerometer | */
	MAV_SYS_STATUS_SENSOR_3D_MAG=4, /* 0x04 3D magnetometer | */
	MAV_SYS_STATUS_SENSOR_ABSOLUTE_PRESSURE=8, /* 0x08 absolute pressure | */
	MAV_SYS_STATUS_SENSOR_DIFFERENTIAL_PRESSURE=16, /* 0x10 differential pressure | */
	MAV_SYS_STATUS_SENSOR_GPS=32, /* 0x20 GPS | */
	MAV_SYS_STATUS_SENSOR_OPTICAL_FLOW=64, /* 0x40 optical flow | */
	MAV_SYS_STATUS_SENSOR_VISION_POSITION=128, /* 0x80 computer vision position | */
	MAV_SYS_STATUS_SENSOR_LASER_POSITION=256, /* 0x100 laser based position | */
	MAV_SYS_STATUS_SENSOR_EXTERNAL_GROUND_TRUTH=512, /* 0x200 external ground truth (Vicon or Leica) | */
	MAV_SYS_STATUS_SENSOR_ANGULAR_RATE_CONTROL=1024, /* 0x400 3D angular rate control | */
	MAV_SYS_STATUS_SENSOR_ATTITUDE_STABILIZATION=2048, /* 0x800 attitude stabilization | */
	MAV_SYS_STATUS_SENSOR_YAW_POSITION=4096, /* 0x1000 yaw position | */
	MAV_SYS_STATUS_SENSOR_Z_ALTITUDE_CONTROL=8192, /* 0x2000 z/altitude control | */
	MAV_SYS_STATUS_SENSOR_XY_POSITION_CONTROL=16384, /* 0x4000 x/y position control | */
	MAV_SYS_STATUS_SENSOR_MOTOR_OUTPUTS=32768, /* 0x8000 motor outputs / control | */
	MAV_SYS_STATUS_SENSOR_RC_RECEIVER=65536, /* 0x10000 rc receiver | */
	MAV_SYS_STATUS_SENSOR_3D_GYRO2=131072, /* 0x20000 2nd 3D gyro | */
	MAV_SYS_STATUS_SENSOR_3D_ACCEL2=262144, /* 0x40000 2nd 3D accelerometer | */
	MAV_SYS_STATUS_SENSOR_3D_MAG2=524288, /* 0x80000 2nd 3D magnetometer | */
	MAV_SYS_STATUS_GEOFENCE=1048576, /* 0x100000 geofence | */
	MAV_SYS_STATUS_AHRS=2097152, /* 0x200000 AHRS subsystem health | */
	MAV_SYS_STATUS_TERRAIN=4194304, /* 0x400000 Terrain subsystem health | */
	MAV_SYS_STATUS_SENSOR_ENUM_END=4194305, /*  | */
} MAV_SYS_STATUS_SENSOR;
#endif

/** @brief  */
#ifndef HAVE_ENUM_MAV_FRAME
#define HAVE_ENUM_MAV_FRAME
typedef enum MAV_FRAME
{
	MAV_FRAME_GLOBAL=0, /* Global coordinate frame, WGS84 coordinate system. First value / x: latitude, second value / y: longitude, third value / z: positive altitude over mean sea level (MSL) | */
	MAV_FRAME_LOCAL_NED=1, /* Local coordinate frame, Z-up (x: north, y: east, z: down). | */
	MAV_FRAME_MISSION=2, /* NOT a coordinate frame, indicates a mission command. | */
	MAV_FRAME_GLOBAL_RELATIVE_ALT=3, /* Global coordinate frame, WGS84 coordinate system, relative altitude over ground with respect to the home position. First value / x: latitude, second value / y: longitude, third value / z: positive altitude with 0 being at the altitude of the home location. | */
	MAV_FRAME_LOCAL_ENU=4, /* Local coordinate frame, Z-down (x: east, y: north, z: up) | */
	MAV_FRAME_GLOBAL_INT=5, /* Global coordinate frame, WGS84 coordinate system. First value / x: latitude in degrees*1.0e-7, second value / y: longitude in degrees*1.0e-7, third value / z: positive altitude over mean sea level (MSL) | */
	MAV_FRAME_GLOBAL_RELATIVE_ALT_INT=6, /* Global coordinate frame, WGS84 coordinate system, relative altitude over ground with respect to the home position. First value / x: latitude in degrees*10e-7, second value / y: longitude in degrees*10e-7, third value / z: positive altitude with 0 being at the altitude of the home location. | */
	MAV_FRAME_LOCAL_OFFSET_NED=7, /* Offset to the current local frame. Anything expressed in this frame should be added to the current local frame position. | */
	MAV_FRAME_BODY_NED=8, /* Setpoint in body NED frame. This makes sense if all position control is externalized - e.g. useful to command 2 m/s^2 acceleration to the right. | */
	MAV_FRAME_BODY_OFFSET_NED=9, /* Offset in body NED frame. This makes sense if adding setpoints to the current flight path, to avoid an obstacle - e.g. useful to command 2 m/s^2 acceleration to the east. | */
	MAV_FRAME_GLOBAL_TERRAIN_ALT=10, /* Global coordinate frame with above terrain level altitude. WGS84 coordinate system, relative altitude over terrain with respect to the waypoint coordinate. First value / x: latitude in degrees, second value / y: longitude in degrees, third value / z: positive altitude in meters with 0 being at ground level in terrain model. | */
	MAV_FRAME_GLOBAL_TERRAIN_ALT_INT=11, /* Global coordinate frame with above terrain level altitude. WGS84 coordinate system, relative altitude over terrain with respect to the waypoint coordinate. First value / x: latitude in degrees*10e-7, second value / y: longitude in degrees*10e-7, third value / z: positive altitude in meters with 0 being at ground level in terrain model. | */
	MAV_FRAME_ENUM_END=12, /*  | */
} MAV_FRAME;
#endif

/** @brief  */
#ifndef HAVE_ENUM_MAVLINK_DATA_STREAM_TYPE
#define HAVE_ENUM_MAVLINK_DATA_STREAM_TYPE
typedef enum MAVLINK_DATA_STREAM_TYPE
{
	MAVLINK_DATA_STREAM_IMG_JPEG=1, /*  | */
	MAVLINK_DATA_STREAM_IMG_BMP=2, /*  | */
	MAVLINK_DATA_STREAM_IMG_RAW8U=3, /*  | */
	MAVLINK_DATA_STREAM_IMG_RAW32U=4, /*  | */
	MAVLINK_DATA_STREAM_IMG_PGM=5, /*  | */
	MAVLINK_DATA_STREAM_IMG_PNG=6, /*  | */
	MAVLINK_DATA_STREAM_TYPE_ENUM_END=7, /*  | */
} MAVLINK_DATA_STREAM_TYPE;
#endif

/** @brief  */
#ifndef HAVE_ENUM_FENCE_ACTION
#define HAVE_ENUM_FENCE_ACTION
typedef enum FENCE_ACTION
{
	FENCE_ACTION_NONE=0, /* Disable fenced mode | */
	FENCE_ACTION_GUIDED=1, /* Switched to guided mode to return point (fence point 0) | */
	FENCE_ACTION_REPORT=2, /* Report fence breach, but don't take action | */
	FENCE_ACTION_GUIDED_THR_PASS=3, /* Switched to guided mode to return point (fence point 0) with manual throttle control | */
	FENCE_ACTION_ENUM_END=4, /*  | */
} FENCE_ACTION;
#endif

/** @brief  */
#ifndef HAVE_ENUM_FENCE_BREACH
#define HAVE_ENUM_FENCE_BREACH
typedef enum FENCE_BREACH
{
	FENCE_BREACH_NONE=0, /* No last fence breach | */
	FENCE_BREACH_MINALT=1, /* Breached minimum altitude | */
	FENCE_BREACH_MAXALT=2, /* Breached maximum altitude | */
	FENCE_BREACH_BOUNDARY=3, /* Breached fence boundary | */
	FENCE_BREACH_ENUM_END=4, /*  | */
} FENCE_BREACH;
#endif

/** @brief Enumeration of possible mount operation modes */
#ifndef HAVE_ENUM_MAV_MOUNT_MODE
#define HAVE_ENUM_MAV_MOUNT_MODE
typedef enum MAV_MOUNT_MODE
{
	MAV_MOUNT_MODE_RETRACT=0, /* Load and keep safe position (Roll,Pitch,Yaw) from permant memory and stop stabilization | */
	MAV_MOUNT_MODE_NEUTRAL=1, /* Load and keep neutral position (Roll,Pitch,Yaw) from permanent memory. | */
	MAV_MOUNT_MODE_MAVLINK_TARGETING=2, /* Load neutral position and start MAVLink Roll,Pitch,Yaw control with stabilization | */
	MAV_MOUNT_MODE_RC_TARGETING=3, /* Load neutral position and start RC Roll,Pitch,Yaw control with stabilization | */
	MAV_MOUNT_MODE_GPS_POINT=4, /* Load neutral position and start to point to Lat,Lon,Alt | */
	MAV_MOUNT_MODE_ENUM_END=5, /*  | */
} MAV_MOUNT_MODE;
#endif

/** @brief Commands to be executed by the MAV. They can be executed on user request, or as part of a mission script. If the action is used in a mission, the parameter mapping to the waypoint/mission message is as follows: Param 1, Param 2, Param 3, Param 4, X: Param 5, Y:Param 6, Z:Param 7. This command list is similar what ARINC 424 is for commercial aircraft: A data format how to interpret waypoint/mission data. */
#ifndef HAVE_ENUM_MAV_CMD
#define HAVE_ENUM_MAV_CMD
typedef enum MAV_CMD
{
	MAV_CMD_NAV_WAYPOINT=16, /* Navigate to MISSION. |Hold time in decimal seconds. (ignored by fixed wing, time to stay at MISSION for rotary wing)| Acceptance radius in meters (if the sphere with this radius is hit, the MISSION counts as reached)| 0 to pass through the WP, if > 0 radius in meters to pass by WP. Positive value for clockwise orbit, negative value for counter-clockwise orbit. Allows trajectory control.| Desired yaw angle at MISSION (rotary wing)| Latitude| Longitude| Altitude|  */
	MAV_CMD_NAV_LOITER_UNLIM=17, /* Loiter around this MISSION an unlimited amount of time |Empty| Empty| Radius around MISSION, in meters. If positive loiter clockwise, else counter-clockwise| Desired yaw angle.| Latitude| Longitude| Altitude|  */
	MAV_CMD_NAV_LOITER_TURNS=18, /* Loiter around this MISSION for X turns |Turns| Empty| Radius around MISSION, in meters. If positive loiter clockwise, else counter-clockwise| Desired yaw angle.| Latitude| Longitude| Altitude|  */
	MAV_CMD_NAV_LOITER_TIME=19, /* Loiter around this MISSION for X seconds |Seconds (decimal)| Empty| Radius around MISSION, in meters. If positive loiter clockwise, else counter-clockwise| Desired yaw angle.| Latitude| Longitude| Altitude|  */
	MAV_CMD_NAV_RETURN_TO_LAUNCH=20, /* Return to launch location |Empty| Empty| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_NAV_LAND=21, /* Land at location |Empty| Empty| Empty| Desired yaw angle.| Latitude| Longitude| Altitude|  */
	MAV_CMD_NAV_TAKEOFF=22, /* Takeoff from ground / hand |Minimum pitch (if airspeed sensor present), desired pitch without sensor| Empty| Empty| Yaw angle (if magnetometer present), ignored without magnetometer| Latitude| Longitude| Altitude|  */
	MAV_CMD_NAV_CONTINUE_AND_CHANGE_ALT=30, /* Continue on the current course and climb/descend to specified altitude.  When the altitude is reached continue to the next command (i.e., don't proceed to the next command until the desired altitude is reached. |Empty| Empty| Empty| Empty| Empty| Empty| Desired altitude in meters|  */
	MAV_CMD_NAV_ROI=80, /* Sets the region of interest (ROI) for a sensor set or the vehicle itself. This can then be used by the vehicles control system to control the vehicle attitude and the attitude of various sensors such as cameras. |Region of intereset mode. (see MAV_ROI enum)| MISSION index/ target ID. (see MAV_ROI enum)| ROI index (allows a vehicle to manage multiple ROI's)| Empty| x the location of the fixed ROI (see MAV_FRAME)| y| z|  */
	MAV_CMD_NAV_PATHPLANNING=81, /* Control autonomous path planning on the MAV. |0: Disable local obstacle avoidance / local path planning (without resetting map), 1: Enable local path planning, 2: Enable and reset local path planning| 0: Disable full path planning (without resetting map), 1: Enable, 2: Enable and reset map/occupancy grid, 3: Enable and reset planned route, but not occupancy grid| Empty| Yaw angle at goal, in compass degrees, [0..360]| Latitude/X of goal| Longitude/Y of goal| Altitude/Z of goal|  */
	MAV_CMD_NAV_SPLINE_WAYPOINT=82, /* Navigate to MISSION using a spline path. |Hold time in decimal seconds. (ignored by fixed wing, time to stay at MISSION for rotary wing)| Empty| Empty| Empty| Latitude/X of goal| Longitude/Y of goal| Altitude/Z of goal|  */
	MAV_CMD_NAV_GUIDED_ENABLE=92, /* hand control over to an external controller |On / Off (> 0.5f on)| Empty| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_NAV_LAST=95, /* NOP - This command is only used to mark the upper limit of the NAV/ACTION commands in the enumeration |Empty| Empty| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_CONDITION_DELAY=112, /* Delay mission state machine. |Delay in seconds (decimal)| Empty| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_CONDITION_CHANGE_ALT=113, /* Ascend/descend at rate.  Delay mission state machine until desired altitude reached. |Descent / Ascend rate (m/s)| Empty| Empty| Empty| Empty| Empty| Finish Altitude|  */
	MAV_CMD_CONDITION_DISTANCE=114, /* Delay mission state machine until within desired distance of next NAV point. |Distance (meters)| Empty| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_CONDITION_YAW=115, /* Reach a certain target angle. |target angle: [0-360], 0 is north| speed during yaw change:[deg per second]| direction: negative: counter clockwise, positive: clockwise [-1,1]| relative offset or absolute angle: [ 1,0]| Empty| Empty| Empty|  */
	MAV_CMD_CONDITION_LAST=159, /* NOP - This command is only used to mark the upper limit of the CONDITION commands in the enumeration |Empty| Empty| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_SET_MODE=176, /* Set system mode. |Mode, as defined by ENUM MAV_MODE| Custom mode - this is system specific, please refer to the individual autopilot specifications for details.| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_JUMP=177, /* Jump to the desired command in the mission list.  Repeat this action only the specified number of times |Sequence number| Repeat count| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_CHANGE_SPEED=178, /* Change speed and/or throttle set points. |Speed type (0=Airspeed, 1=Ground Speed)| Speed  (m/s, -1 indicates no change)| Throttle  ( Percent, -1 indicates no change)| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_SET_HOME=179, /* Changes the home location either to the current location or a specified location. |Use current (1=use current location, 0=use specified location)| Empty| Empty| Empty| Latitude| Longitude| Altitude|  */
	MAV_CMD_DO_SET_PARAMETER=180, /* Set a system parameter.  Caution!  Use of this command requires knowledge of the numeric enumeration value of the parameter. |Parameter number| Parameter value| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_SET_RELAY=181, /* Set a relay to a condition. |Relay number| Setting (1=on, 0=off, others possible depending on system hardware)| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_REPEAT_RELAY=182, /* Cycle a relay on and off for a desired number of cyles with a desired period. |Relay number| Cycle count| Cycle time (seconds, decimal)| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_SET_SERVO=183, /* Set a servo to a desired PWM value. |Servo number| PWM (microseconds, 1000 to 2000 typical)| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_REPEAT_SERVO=184, /* Cycle a between its nominal setting and a desired PWM for a desired number of cycles with a desired period. |Servo number| PWM (microseconds, 1000 to 2000 typical)| Cycle count| Cycle time (seconds)| Empty| Empty| Empty|  */
	MAV_CMD_DO_FLIGHTTERMINATION=185, /* Terminate flight immediately |Flight termination activated if > 0.5| Empty| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_LAND_START=189, /* Mission command to perform a landing. This is used as a marker in a mission to tell the autopilot where a sequence of mission items that represents a landing starts. It may also be sent via a COMMAND_LONG to trigger a landing, in which case the nearest (geographically) landing sequence in the mission will be used. The Latitude/Longitude is optional, and may be set to 0/0 if not needed. If specified then it will be used to help find the closest landing sequence. |Empty| Empty| Empty| Empty| Latitude| Longitude| Empty|  */
	MAV_CMD_DO_RALLY_LAND=190, /* Mission command to perform a landing from a rally point. |Break altitude (meters)| Landing speed (m/s)| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_GO_AROUND=191, /* Mission command to safely abort an autonmous landing. |Altitude (meters)| Empty| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_CONTROL_VIDEO=200, /* Control onboard camera system. |Camera ID (-1 for all)| Transmission: 0: disabled, 1: enabled compressed, 2: enabled raw| Transmission mode: 0: video stream, >0: single images every n seconds (decimal)| Recording: 0: disabled, 1: enabled compressed, 2: enabled raw| Empty| Empty| Empty|  */
	MAV_CMD_DO_SET_ROI=201, /* Sets the region of interest (ROI) for a sensor set or the vehicle itself. This can then be used by the vehicles control system to control the vehicle attitude and the attitude of various sensors such as cameras. |Region of intereset mode. (see MAV_ROI enum)| MISSION index/ target ID. (see MAV_ROI enum)| ROI index (allows a vehicle to manage multiple ROI's)| Empty| x the location of the fixed ROI (see MAV_FRAME)| y| z|  */
	MAV_CMD_DO_DIGICAM_CONFIGURE=202, /* Mission command to configure an on-board camera controller system. |Modes: P, TV, AV, M, Etc| Shutter speed: Divisor number for one second| Aperture: F stop number| ISO number e.g. 80, 100, 200, Etc| Exposure type enumerator| Command Identity| Main engine cut-off time before camera trigger in seconds/10 (0 means no cut-off)|  */
	MAV_CMD_DO_DIGICAM_CONTROL=203, /* Mission command to control an on-board camera controller system. |Session control e.g. show/hide lens| Zoom's absolute position| Zooming step value to offset zoom from the current position| Focus Locking, Unlocking or Re-locking| Shooting Command| Command Identity| Empty|  */
	MAV_CMD_DO_MOUNT_CONFIGURE=204, /* Mission command to configure a camera or antenna mount |Mount operation mode (see MAV_MOUNT_MODE enum)| stabilize roll? (1 = yes, 0 = no)| stabilize pitch? (1 = yes, 0 = no)| stabilize yaw? (1 = yes, 0 = no)| Empty| Empty| Empty|  */
	MAV_CMD_DO_MOUNT_CONTROL=205, /* Mission command to control a camera or antenna mount |pitch or lat in degrees, depending on mount mode.| roll or lon in degrees depending on mount mode| yaw or alt (in meters) depending on mount mode| reserved| reserved| reserved| MAV_MOUNT_MODE enum value|  */
	MAV_CMD_DO_SET_CAM_TRIGG_DIST=206, /* Mission command to set CAM_TRIGG_DIST for this flight |Camera trigger distance (meters)| Empty| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_FENCE_ENABLE=207, /* Mission command to enable the geofence |enable? (0=disable, 1=enable)| Empty| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_PARACHUTE=208, /* Mission command to trigger a parachute |action (0=disable, 1=enable, 2=release, for some systems see PARACHUTE_ACTION enum, not in general message set.)| Empty| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_INVERTED_FLIGHT=210, /* Change to/from inverted flight |inverted (0=normal, 1=inverted)| Empty| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_MOUNT_CONTROL_QUAT=220, /* Mission command to control a camera or antenna mount, using a quaternion as reference. |q1 - quaternion param #1, w (1 in null-rotation)| q2 - quaternion param #2, x (0 in null-rotation)| q3 - quaternion param #3, y (0 in null-rotation)| q4 - quaternion param #4, z (0 in null-rotation)| Empty| Empty| Empty|  */
	MAV_CMD_DO_GUIDED_MASTER=221, /* set id of master controller |System ID| Component ID| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_DO_GUIDED_LIMITS=222, /* set limits for external control |timeout - maximum time (in seconds) that external controller will be allowed to control vehicle. 0 means no timeout| absolute altitude min (in meters, AMSL) - if vehicle moves below this alt, the command will be aborted and the mission will continue.  0 means no lower altitude limit| absolute altitude max (in meters)- if vehicle moves above this alt, the command will be aborted and the mission will continue.  0 means no upper altitude limit| horizontal move limit (in meters, AMSL) - if vehicle moves more than this distance from it's location at the moment the command was executed, the command will be aborted and the mission will continue. 0 means no horizontal altitude limit| Empty| Empty| Empty|  */
	MAV_CMD_DO_LAST=240, /* NOP - This command is only used to mark the upper limit of the DO commands in the enumeration |Empty| Empty| Empty| Empty| Empty| Empty| Empty|  */
	MAV_CMD_PREFLIGHT_CALIBRATION=241, /* Trigger calibration. This command will be only accepted if in pre-flight mode. |Gyro calibration: 0: no, 1: yes| Magnetometer calibration: 0: no, 1: yes| Ground pressure: 0: no, 1: yes| Radio calibration: 0: no, 1: yes| Accelerometer calibration: 0: no, 1: yes| Compass/Motor interference calibration: 0: no, 1: yes| Empty|  */
	MAV_CMD_PREFLIGHT_SET_SENSOR_OFFSETS=242, /* Set sensor offsets. This command will be only accepted if in pre-flight mode. |Sensor to adjust the offsets for: 0: gyros, 1: accelerometer, 2: magnetometer, 3: barometer, 4: optical flow, 5: second magnetometer| X axis offset (or generic dimension 1), in the sensor's raw units| Y axis offset (or generic dimension 2), in the sensor's raw units| Z axis offset (or generic dimension 3), in the sensor's raw units| Generic dimension 4, in the sensor's raw units| Generic dimension 5, in the sensor's raw units| Generic dimension 6, in the sensor's raw units|  */
	MAV_CMD_PREFLIGHT_STORAGE=245, /* Request storage of different parameter values and logs. This command will be only accepted if in pre-flight mode. |Parameter storage: 0: READ FROM FLASH/EEPROM, 1: WRITE CURRENT TO FLASH/EEPROM| Mission storage: 0: READ FROM FLASH/EEPROM, 1: WRITE CURRENT TO FLASH/EEPROM| Reserved| Reserved| Empty| Empty| Empty|  */
	MAV_CMD_PREFLIGHT_REBOOT_SHUTDOWN=246, /* Request the reboot or shutdown of system components. |0: Do nothing for autopilot, 1: Reboot autopilot, 2: Shutdown autopilot.| 0: Do nothing for onboard computer, 1: Reboot onboard computer, 2: Shutdown onboard computer.| Reserved| Reserved| Empty| Empty| Empty|  */
	MAV_CMD_OVERRIDE_GOTO=252, /* Hold / continue the current action |MAV_GOTO_DO_HOLD: hold MAV_GOTO_DO_CONTINUE: continue with next item in mission plan| MAV_GOTO_HOLD_AT_CURRENT_POSITION: Hold at current position MAV_GOTO_HOLD_AT_SPECIFIED_POSITION: hold at specified position| MAV_FRAME coordinate frame of hold point| Desired yaw angle in degrees| Latitude / X position| Longitude / Y position| Altitude / Z position|  */
	MAV_CMD_MISSION_START=300, /* start running a mission |first_item: the first mission item to run| last_item:  the last mission item to run (after this item is run, the mission ends)|  */
	MAV_CMD_COMPONENT_ARM_DISARM=400, /* Arms / Disarms a component |1 to arm, 0 to disarm|  */
	MAV_CMD_START_RX_PAIR=500, /* Starts receiver pairing |0:Spektrum| 0:Spektrum DSM2, 1:Spektrum DSMX|  */
	MAV_CMD_REQUEST_AUTOPILOT_CAPABILITIES=520, /* Request autopilot capabilities |1: Request autopilot version| Reserved (all remaining params)|  */
	MAV_CMD_IMAGE_START_CAPTURE=2000, /* Start image capture sequence |Duration between two consecutive pictures (in seconds)| Number of images to capture total - 0 for unlimited capture| Resolution in megapixels (0.3 for 640x480, 1.3 for 1280x720, etc)|  */
	MAV_CMD_IMAGE_STOP_CAPTURE=2001, /* Stop image capture sequence |Reserved| Reserved|  */
	MAV_CMD_DO_TRIGGER_CONTROL=2003, /* Enable or disable on-board camera triggering system. |Trigger enable/disable (0 for disable, 1 for start)| Shutter integration time (in ms)| Reserved|  */
	MAV_CMD_VIDEO_START_CAPTURE=2500, /* Starts video capture |Camera ID (0 for all cameras), 1 for first, 2 for second, etc.| Frames per second| Resolution in megapixels (0.3 for 640x480, 1.3 for 1280x720, etc)|  */
	MAV_CMD_VIDEO_STOP_CAPTURE=2501, /* Stop the current video capture |Reserved| Reserved|  */
	MAV_CMD_PANORAMA_CREATE=2800, /* Create a panorama at the current position |Viewing angle horizontal of the panorama (in degrees, +- 0.5 the total angle)| Viewing angle vertical of panorama (in degrees)| Speed of the horizontal rotation (in degrees per second)| Speed of the vertical rotation (in degrees per second)|  */
	MAV_CMD_PAYLOAD_PREPARE_DEPLOY=30001, /* Deploy payload on a Lat / Lon / Alt position. This includes the navigation to reach the required release position and velocity. |Operation mode. 0: prepare single payload deploy (overwriting previous requests), but do not execute it. 1: execute payload deploy immediately (rejecting further deploy commands during execution, but allowing abort). 2: add payload deploy to existing deployment list.| Desired approach vector in degrees compass heading (0..360). A negative value indicates the system can define the approach vector at will.| Desired ground speed at release time. This can be overriden by the airframe in case it needs to meet minimum airspeed. A negative value indicates the system can define the ground speed at will.| Minimum altitude clearance to the release position in meters. A negative value indicates the system can define the clearance at will.| Latitude unscaled for MISSION_ITEM or in 1e7 degrees for MISSION_ITEM_INT| Longitude unscaled for MISSION_ITEM or in 1e7 degrees for MISSION_ITEM_INT| Altitude, in meters AMSL|  */
	MAV_CMD_PAYLOAD_CONTROL_DEPLOY=30002, /* Control the payload deployment. |Operation mode. 0: Abort deployment, continue normal mission. 1: switch to payload deploment mode. 100: delete first payload deployment request. 101: delete all payload deployment requests.| Reserved| Reserved| Reserved| Reserved| Reserved| Reserved|  */
	MAV_CMD_ENUM_END=30003, /*  | */
} MAV_CMD;
#endif

/** @brief Data stream IDs. A data stream is not a fixed set of messages, but rather a
     recommendation to the autopilot software. Individual autopilots may or may not obey
     the recommended messages. */
#ifndef HAVE_ENUM_MAV_DATA_STREAM
#define HAVE_ENUM_MAV_DATA_STREAM
typedef enum MAV_DATA_STREAM
{
	MAV_DATA_STREAM_ALL=0, /* Enable all data streams | */
	MAV_DATA_STREAM_RAW_SENSORS=1, /* Enable IMU_RAW, GPS_RAW, GPS_STATUS packets. | */
	MAV_DATA_STREAM_EXTENDED_STATUS=2, /* Enable GPS_STATUS, CONTROL_STATUS, AUX_STATUS | */
	MAV_DATA_STREAM_RC_CHANNELS=3, /* Enable RC_CHANNELS_SCALED, RC_CHANNELS_RAW, SERVO_OUTPUT_RAW | */
	MAV_DATA_STREAM_RAW_CONTROLLER=4, /* Enable ATTITUDE_CONTROLLER_OUTPUT, POSITION_CONTROLLER_OUTPUT, NAV_CONTROLLER_OUTPUT. | */
	MAV_DATA_STREAM_POSITION=6, /* Enable LOCAL_POSITION, GLOBAL_POSITION/GLOBAL_POSITION_INT messages. | */
	MAV_DATA_STREAM_EXTRA1=10, /* Dependent on the autopilot | */
	MAV_DATA_STREAM_EXTRA2=11, /* Dependent on the autopilot | */
	MAV_DATA_STREAM_EXTRA3=12, /* Dependent on the autopilot | */
	MAV_DATA_STREAM_ENUM_END=13, /*  | */
} MAV_DATA_STREAM;
#endif

/** @brief  The ROI (region of interest) for the vehicle. This can be
                be used by the vehicle for camera/vehicle attitude alignment (see
                MAV_CMD_NAV_ROI). */
#ifndef HAVE_ENUM_MAV_ROI
#define HAVE_ENUM_MAV_ROI
typedef enum MAV_ROI
{
	MAV_ROI_NONE=0, /* No region of interest. | */
	MAV_ROI_WPNEXT=1, /* Point toward next MISSION. | */
	MAV_ROI_WPINDEX=2, /* Point toward given MISSION. | */
	MAV_ROI_LOCATION=3, /* Point toward fixed location. | */
	MAV_ROI_TARGET=4, /* Point toward of given id. | */
	MAV_ROI_ENUM_END=5, /*  | */
} MAV_ROI;
#endif

/** @brief ACK / NACK / ERROR values as a result of MAV_CMDs and for mission item transmission. */
#ifndef HAVE_ENUM_MAV_CMD_ACK
#define HAVE_ENUM_MAV_CMD_ACK
typedef enum MAV_CMD_ACK
{
	MAV_CMD_ACK_OK=1, /* Command / mission item is ok. | */
	MAV_CMD_ACK_ERR_FAIL=2, /* Generic error message if none of the other reasons fails or if no detailed error reporting is implemented. | */
	MAV_CMD_ACK_ERR_ACCESS_DENIED=3, /* The system is refusing to accept this command from this source / communication partner. | */
	MAV_CMD_ACK_ERR_NOT_SUPPORTED=4, /* Command or mission item is not supported, other commands would be accepted. | */
	MAV_CMD_ACK_ERR_COORDINATE_FRAME_NOT_SUPPORTED=5, /* The coordinate frame of this command / mission item is not supported. | */
	MAV_CMD_ACK_ERR_COORDINATES_OUT_OF_RANGE=6, /* The coordinate frame of this command is ok, but he coordinate values exceed the safety limits of this system. This is a generic error, please use the more specific error messages below if possible. | */
	MAV_CMD_ACK_ERR_X_LAT_OUT_OF_RANGE=7, /* The X or latitude value is out of range. | */
	MAV_CMD_ACK_ERR_Y_LON_OUT_OF_RANGE=8, /* The Y or longitude value is out of range. | */
	MAV_CMD_ACK_ERR_Z_ALT_OUT_OF_RANGE=9, /* The Z or altitude value is out of range. | */
	MAV_CMD_ACK_ENUM_END=10, /*  | */
} MAV_CMD_ACK;
#endif

/** @brief Specifies the datatype of a MAVLink parameter. */
#ifndef HAVE_ENUM_MAV_PARAM_TYPE
#define HAVE_ENUM_MAV_PARAM_TYPE
typedef enum MAV_PARAM_TYPE
{
	MAV_PARAM_TYPE_UINT8=1, /* 8-bit unsigned integer | */
	MAV_PARAM_TYPE_INT8=2, /* 8-bit signed integer | */
	MAV_PARAM_TYPE_UINT16=3, /* 16-bit unsigned integer | */
	MAV_PARAM_TYPE_INT16=4, /* 16-bit signed integer | */
	MAV_PARAM_TYPE_UINT32=5, /* 32-bit unsigned integer | */
	MAV_PARAM_TYPE_INT32=6, /* 32-bit signed integer | */
	MAV_PARAM_TYPE_UINT64=7, /* 64-bit unsigned integer | */
	MAV_PARAM_TYPE_INT64=8, /* 64-bit signed integer | */
	MAV_PARAM_TYPE_REAL32=9, /* 32-bit floating-point | */
	MAV_PARAM_TYPE_REAL64=10, /* 64-bit floating-point | */
	MAV_PARAM_TYPE_ENUM_END=11, /*  | */
} MAV_PARAM_TYPE;
#endif

/** @brief result from a mavlink command */
#ifndef HAVE_ENUM_MAV_RESULT
#define HAVE_ENUM_MAV_RESULT
typedef enum MAV_RESULT
{
	MAV_RESULT_ACCEPTED=0, /* Command ACCEPTED and EXECUTED | */
	MAV_RESULT_TEMPORARILY_REJECTED=1, /* Command TEMPORARY REJECTED/DENIED | */
	MAV_RESULT_DENIED=2, /* Command PERMANENTLY DENIED | */
	MAV_RESULT_UNSUPPORTED=3, /* Command UNKNOWN/UNSUPPORTED | */
	MAV_RESULT_FAILED=4, /* Command executed, but failed | */
	MAV_RESULT_ENUM_END=5, /*  | */
} MAV_RESULT;
#endif

/** @brief result in a mavlink mission ack */
#ifndef HAVE_ENUM_MAV_MISSION_RESULT
#define HAVE_ENUM_MAV_MISSION_RESULT
typedef enum MAV_MISSION_RESULT
{
	MAV_MISSION_ACCEPTED=0, /* mission accepted OK | */
	MAV_MISSION_ERROR=1, /* generic error / not accepting mission commands at all right now | */
	MAV_MISSION_UNSUPPORTED_FRAME=2, /* coordinate frame is not supported | */
	MAV_MISSION_UNSUPPORTED=3, /* command is not supported | */
	MAV_MISSION_NO_SPACE=4, /* mission item exceeds storage space | */
	MAV_MISSION_INVALID=5, /* one of the parameters has an invalid value | */
	MAV_MISSION_INVALID_PARAM1=6, /* param1 has an invalid value | */
	MAV_MISSION_INVALID_PARAM2=7, /* param2 has an invalid value | */
	MAV_MISSION_INVALID_PARAM3=8, /* param3 has an invalid value | */
	MAV_MISSION_INVALID_PARAM4=9, /* param4 has an invalid value | */
	MAV_MISSION_INVALID_PARAM5_X=10, /* x/param5 has an invalid value | */
	MAV_MISSION_INVALID_PARAM6_Y=11, /* y/param6 has an invalid value | */
	MAV_MISSION_INVALID_PARAM7=12, /* param7 has an invalid value | */
	MAV_MISSION_INVALID_SEQUENCE=13, /* received waypoint out of sequence | */
	MAV_MISSION_DENIED=14, /* not accepting any mission commands from this communication partner | */
	MAV_MISSION_RESULT_ENUM_END=15, /*  | */
} MAV_MISSION_RESULT;
#endif

/** @brief Indicates the severity level, generally used for status messages to indicate their relative urgency. Based on RFC-5424 using expanded definitions at: http://www.kiwisyslog.com/kb/info:-syslog-message-levels/. */
#ifndef HAVE_ENUM_MAV_SEVERITY
#define HAVE_ENUM_MAV_SEVERITY
typedef enum MAV_SEVERITY
{
	MAV_SEVERITY_EMERGENCY=0, /* System is unusable. This is a "panic" condition. | */
	MAV_SEVERITY_ALERT=1, /* Action should be taken immediately. Indicates error in non-critical systems. | */
	MAV_SEVERITY_CRITICAL=2, /* Action must be taken immediately. Indicates failure in a primary system. | */
	MAV_SEVERITY_ERROR=3, /* Indicates an error in secondary/redundant systems. | */
	MAV_SEVERITY_WARNING=4, /* Indicates about a possible future error if this is not resolved within a given timeframe. Example would be a low battery warning. | */
	MAV_SEVERITY_NOTICE=5, /* An unusual event has occured, though not an error condition. This should be investigated for the root cause. | */
	MAV_SEVERITY_INFO=6, /* Normal operational messages. Useful for logging. No action is required for these messages. | */
	MAV_SEVERITY_DEBUG=7, /* Useful non-operational messages that can assist in debugging. These should not occur during normal operation. | */
	MAV_SEVERITY_ENUM_END=8, /*  | */
} MAV_SEVERITY;
#endif

/** @brief Power supply status flags (bitmask) */
#ifndef HAVE_ENUM_MAV_POWER_STATUS
#define HAVE_ENUM_MAV_POWER_STATUS
typedef enum MAV_POWER_STATUS
{
	MAV_POWER_STATUS_BRICK_VALID=1, /* main brick power supply valid | */
	MAV_POWER_STATUS_SERVO_VALID=2, /* main servo power supply valid for FMU | */
	MAV_POWER_STATUS_USB_CONNECTED=4, /* USB power is connected | */
	MAV_POWER_STATUS_PERIPH_OVERCURRENT=8, /* peripheral supply is in over-current state | */
	MAV_POWER_STATUS_PERIPH_HIPOWER_OVERCURRENT=16, /* hi-power peripheral supply is in over-current state | */
	MAV_POWER_STATUS_CHANGED=32, /* Power status has changed since boot | */
	MAV_POWER_STATUS_ENUM_END=33, /*  | */
} MAV_POWER_STATUS;
#endif

/** @brief SERIAL_CONTROL device types */
#ifndef HAVE_ENUM_SERIAL_CONTROL_DEV
#define HAVE_ENUM_SERIAL_CONTROL_DEV
typedef enum SERIAL_CONTROL_DEV
{
	SERIAL_CONTROL_DEV_TELEM1=0, /* First telemetry port | */
	SERIAL_CONTROL_DEV_TELEM2=1, /* Second telemetry port | */
	SERIAL_CONTROL_DEV_GPS1=2, /* First GPS port | */
	SERIAL_CONTROL_DEV_GPS2=3, /* Second GPS port | */
	SERIAL_CONTROL_DEV_ENUM_END=4, /*  | */
} SERIAL_CONTROL_DEV;
#endif

/** @brief SERIAL_CONTROL flags (bitmask) */
#ifndef HAVE_ENUM_SERIAL_CONTROL_FLAG
#define HAVE_ENUM_SERIAL_CONTROL_FLAG
typedef enum SERIAL_CONTROL_FLAG
{
	SERIAL_CONTROL_FLAG_REPLY=1, /* Set if this is a reply | */
	SERIAL_CONTROL_FLAG_RESPOND=2, /* Set if the sender wants the receiver to send a response as another SERIAL_CONTROL message | */
	SERIAL_CONTROL_FLAG_EXCLUSIVE=4, /* Set if access to the serial port should be removed from whatever driver is currently using it, giving exclusive access to the SERIAL_CONTROL protocol. The port can be handed back by sending a request without this flag set | */
	SERIAL_CONTROL_FLAG_BLOCKING=8, /* Block on writes to the serial port | */
	SERIAL_CONTROL_FLAG_MULTI=16, /* Send multiple replies until port is drained | */
	SERIAL_CONTROL_FLAG_ENUM_END=17, /*  | */
} SERIAL_CONTROL_FLAG;
#endif

/** @brief Enumeration of distance sensor types */
#ifndef HAVE_ENUM_MAV_DISTANCE_SENSOR
#define HAVE_ENUM_MAV_DISTANCE_SENSOR
typedef enum MAV_DISTANCE_SENSOR
{
	MAV_DISTANCE_SENSOR_LASER=0, /* Laser altimeter, e.g. LightWare SF02/F or PulsedLight units | */
	MAV_DISTANCE_SENSOR_ULTRASOUND=1, /* Ultrasound altimeter, e.g. MaxBotix units | */
	MAV_DISTANCE_SENSOR_ENUM_END=2, /*  | */
} MAV_DISTANCE_SENSOR;
#endif

/** @brief Bitmask of (optional) autopilot capabilities (64 bit). If a bit is set, the autopilot supports this capability. */
#ifndef HAVE_ENUM_MAV_PROTOCOL_CAPABILITY
#define HAVE_ENUM_MAV_PROTOCOL_CAPABILITY
typedef enum MAV_PROTOCOL_CAPABILITY
{
	MAV_PROTOCOL_CAPABILITY_MISSION_FLOAT=1, /* Autopilot supports MISSION float message type. | */
	MAV_PROTOCOL_CAPABILITY_PARAM_FLOAT=2, /* Autopilot supports the new param float message type. | */
	MAV_PROTOCOL_CAPABILITY_MISSION_INT=4, /* Autopilot supports MISSION_INT scaled integer message type. | */
	MAV_PROTOCOL_CAPABILITY_COMMAND_INT=8, /* Autopilot supports COMMAND_INT scaled integer message type. | */
	MAV_PROTOCOL_CAPABILITY_PARAM_UNION=16, /* Autopilot supports the new param union message type. | */
	MAV_PROTOCOL_CAPABILITY_FTP=32, /* Autopilot supports the new param union message type. | */
	MAV_PROTOCOL_CAPABILITY_SET_ATTITUDE_TARGET=64, /* Autopilot supports commanding attitude offboard. | */
	MAV_PROTOCOL_CAPABILITY_SET_POSITION_TARGET_LOCAL_NED=128, /* Autopilot supports commanding position and velocity targets in local NED frame. | */
	MAV_PROTOCOL_CAPABILITY_SET_POSITION_TARGET_GLOBAL_INT=256, /* Autopilot supports commanding position and velocity targets in global scaled integers. | */
	MAV_PROTOCOL_CAPABILITY_TERRAIN=512, /* Autopilot supports terrain protocol / data handling. | */
	MAV_PROTOCOL_CAPABILITY_SET_ACTUATOR_TARGET=1024, /* Autopilot supports direct actuator control. | */
	MAV_PROTOCOL_CAPABILITY_ENUM_END=1025, /*  | */
} MAV_PROTOCOL_CAPABILITY;
#endif

/** @brief Enumeration of estimator types */
#ifndef HAVE_ENUM_MAV_ESTIMATOR_TYPE
#define HAVE_ENUM_MAV_ESTIMATOR_TYPE
typedef enum MAV_ESTIMATOR_TYPE
{
	MAV_ESTIMATOR_TYPE_NAIVE=1, /* This is a naive estimator without any real covariance feedback. | */
	MAV_ESTIMATOR_TYPE_VISION=2, /* Computer vision based estimate. Might be up to scale. | */
	MAV_ESTIMATOR_TYPE_VIO=3, /* Visual-inertial estimate. | */
	MAV_ESTIMATOR_TYPE_GPS=4, /* Plain GPS estimate. | */
	MAV_ESTIMATOR_TYPE_GPS_INS=5, /* Estimator integrating GPS and inertial sensing. | */
	MAV_ESTIMATOR_TYPE_ENUM_END=6, /*  | */
} MAV_ESTIMATOR_TYPE;
#endif

/** @brief Enumeration of battery types */
#ifndef HAVE_ENUM_MAV_BATTERY_TYPE
#define HAVE_ENUM_MAV_BATTERY_TYPE
typedef enum MAV_BATTERY_TYPE
{
	MAV_BATTERY_TYPE_UNKNOWN=0, /* Not specified. | */
	MAV_BATTERY_TYPE_LIPO=1, /* Lithium polymere battery | */
	MAV_BATTERY_TYPE_LIFE=2, /* Lithium ferrite battery | */
	MAV_BATTERY_TYPE_LION=3, /* Lithium-ION battery | */
	MAV_BATTERY_TYPE_NIMH=4, /* Nickel metal hydride battery | */
	MAV_BATTERY_TYPE_ENUM_END=5, /*  | */
} MAV_BATTERY_TYPE;
#endif

/** @brief Enumeration of battery functions */
#ifndef HAVE_ENUM_MAV_BATTERY_FUNCTION
#define HAVE_ENUM_MAV_BATTERY_FUNCTION
typedef enum MAV_BATTERY_FUNCTION
{
	MAV_BATTERY_FUNCTION_UNKNOWN=0, /* Lithium polymere battery | */
	MAV_BATTERY_FUNCTION_ALL=1, /* Battery supports all flight systems | */
	MAV_BATTERY_FUNCTION_PROPULSION=2, /* Battery for the propulsion system | */
	MAV_BATTERY_FUNCTION_AVIONICS=3, /* Avionics battery | */
	MAV_BATTERY_TYPE_PAYLOAD=4, /* Payload battery | */
	MAV_BATTERY_FUNCTION_ENUM_END=5, /*  | */
} MAV_BATTERY_FUNCTION;
#endif



// MAVLINK VERSION

#ifndef MAVLINK_VERSION
#define MAVLINK_VERSION 3
#endif

#if (MAVLINK_VERSION == 0)
#undef MAVLINK_VERSION
#define MAVLINK_VERSION 3
#endif

// MESSAGE DEFINITIONS
#include "./mavlink_msg_heartbeat.h"
#include "./mavlink_msg_sys_status.h"
#include "./mavlink_msg_system_time.h"
#include "./mavlink_msg_ping.h"
#include "./mavlink_msg_change_operator_control.h"
#include "./mavlink_msg_change_operator_control_ack.h"
#include "./mavlink_msg_auth_key.h"
#include "./mavlink_msg_set_mode.h"
#include "./mavlink_msg_param_request_read.h"
#include "./mavlink_msg_param_request_list.h"
#include "./mavlink_msg_param_value.h"
#include "./mavlink_msg_param_set.h"
#include "./mavlink_msg_gps_raw_int.h"
#include "./mavlink_msg_gps_status.h"
#include "./mavlink_msg_scaled_imu.h"
#include "./mavlink_msg_raw_imu.h"
#include "./mavlink_msg_raw_pressure.h"
#include "./mavlink_msg_scaled_pressure.h"
#include "./mavlink_msg_attitude.h"
#include "./mavlink_msg_attitude_quaternion.h"
#include "./mavlink_msg_local_position_ned.h"
#include "./mavlink_msg_global_position_int.h"
#include "./mavlink_msg_rc_channels_scaled.h"
#include "./mavlink_msg_rc_channels_raw.h"
#include "./mavlink_msg_servo_output_raw.h"
#include "./mavlink_msg_mission_request_partial_list.h"
#include "./mavlink_msg_mission_write_partial_list.h"
#include "./mavlink_msg_mission_item.h"
#include "./mavlink_msg_mission_request.h"
#include "./mavlink_msg_mission_set_current.h"
#include "./mavlink_msg_mission_current.h"
#include "./mavlink_msg_mission_request_list.h"
#include "./mavlink_msg_mission_count.h"
#include "./mavlink_msg_mission_clear_all.h"
#include "./mavlink_msg_mission_item_reached.h"
#include "./mavlink_msg_mission_ack.h"
#include "./mavlink_msg_set_gps_global_origin.h"
#include "./mavlink_msg_gps_global_origin.h"
#include "./mavlink_msg_param_map_rc.h"
#include "./mavlink_msg_safety_set_allowed_area.h"
#include "./mavlink_msg_safety_allowed_area.h"
#include "./mavlink_msg_attitude_quaternion_cov.h"
#include "./mavlink_msg_nav_controller_output.h"
#include "./mavlink_msg_global_position_int_cov.h"
#include "./mavlink_msg_local_position_ned_cov.h"
#include "./mavlink_msg_rc_channels.h"
#include "./mavlink_msg_request_data_stream.h"
#include "./mavlink_msg_data_stream.h"
#include "./mavlink_msg_manual_control.h"
#include "./mavlink_msg_rc_channels_override.h"
#include "./mavlink_msg_mission_item_int.h"
#include "./mavlink_msg_vfr_hud.h"
#include "./mavlink_msg_command_int.h"
#include "./mavlink_msg_command_long.h"
#include "./mavlink_msg_command_ack.h"
#include "./mavlink_msg_manual_setpoint.h"
#include "./mavlink_msg_set_attitude_target.h"
#include "./mavlink_msg_attitude_target.h"
#include "./mavlink_msg_set_position_target_local_ned.h"
#include "./mavlink_msg_position_target_local_ned.h"
#include "./mavlink_msg_set_position_target_global_int.h"
#include "./mavlink_msg_position_target_global_int.h"
#include "./mavlink_msg_local_position_ned_system_global_offset.h"
#include "./mavlink_msg_hil_state.h"
#include "./mavlink_msg_hil_controls.h"
#include "./mavlink_msg_hil_rc_inputs_raw.h"
#include "./mavlink_msg_optical_flow.h"
#include "./mavlink_msg_global_vision_position_estimate.h"
#include "./mavlink_msg_vision_position_estimate.h"
#include "./mavlink_msg_vision_speed_estimate.h"
#include "./mavlink_msg_vicon_position_estimate.h"
#include "./mavlink_msg_highres_imu.h"
#include "./mavlink_msg_optical_flow_rad.h"
#include "./mavlink_msg_hil_sensor.h"
#include "./mavlink_msg_sim_state.h"
#include "./mavlink_msg_radio_status.h"
#include "./mavlink_msg_file_transfer_protocol.h"
#include "./mavlink_msg_timesync.h"
#include "./mavlink_msg_camera_trigger.h"
#include "./mavlink_msg_hil_gps.h"
#include "./mavlink_msg_hil_optical_flow.h"
#include "./mavlink_msg_hil_state_quaternion.h"
#include "./mavlink_msg_scaled_imu2.h"
#include "./mavlink_msg_log_request_list.h"
#include "./mavlink_msg_log_entry.h"
#include "./mavlink_msg_log_request_data.h"
#include "./mavlink_msg_log_data.h"
#include "./mavlink_msg_log_erase.h"
#include "./mavlink_msg_log_request_end.h"
#include "./mavlink_msg_gps_inject_data.h"
#include "./mavlink_msg_gps2_raw.h"
#include "./mavlink_msg_power_status.h"
#include "./mavlink_msg_serial_control.h"
#include "./mavlink_msg_gps_rtk.h"
#include "./mavlink_msg_gps2_rtk.h"
#include "./mavlink_msg_scaled_imu3.h"
#include "./mavlink_msg_data_transmission_handshake.h"
#include "./mavlink_msg_encapsulated_data.h"
#include "./mavlink_msg_distance_sensor.h"
#include "./mavlink_msg_terrain_request.h"
#include "./mavlink_msg_terrain_data.h"
#include "./mavlink_msg_terrain_check.h"
#include "./mavlink_msg_terrain_report.h"
#include "./mavlink_msg_scaled_pressure2.h"
#include "./mavlink_msg_att_pos_mocap.h"
#include "./mavlink_msg_set_actuator_control_target.h"
#include "./mavlink_msg_actuator_control_target.h"
#include "./mavlink_msg_battery_status.h"
#include "./mavlink_msg_autopilot_version.h"
#include "./mavlink_msg_v2_extension.h"
#include "./mavlink_msg_memory_vect.h"
#include "./mavlink_msg_debug_vect.h"
#include "./mavlink_msg_named_value_float.h"
#include "./mavlink_msg_named_value_int.h"
#include "./mavlink_msg_statustext.h"
#include "./mavlink_msg_debug.h"

#ifdef __cplusplus
}
#endif // __cplusplus
#endif // MAVLINK_COMMON_H
