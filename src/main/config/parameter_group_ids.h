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

// FC configuration
#define PG_FAILSAFE_CONFIG 1 // struct OK
#define PG_BOARD_ALIGNMENT 2 // struct OK
#define PG_GIMBAL_CONFIG 3 // struct OK
#define PG_MOTOR_MIXER 4 // two structs mixerConfig_t servoMixerConfig_t
#define PG_BLACKBOX_CONFIG 5 // struct OK
#define PG_MOTOR_CONFIG 6 // struct OK
#define PG_SENSOR_SELECTION_CONFIG 7 // struct OK
#define PG_SENSOR_ALIGNMENT_CONFIG 8 // struct OK
#define PG_SENSOR_TRIMS 9 // struct OK
#define PG_GYRO_CONFIG 10 // PR outstanding, need to think about pid_process_denom
#define PG_BATTERY_CONFIG 11 // struct OK
#define PG_CONTROL_RATE_PROFILES 12 // struct OK, needs to be split out of rc_controls.h into rate_profile.h
#define PG_SERIAL_CONFIG 13 // struct OK
#define PG_PID_PROFILE 14 // struct OK, CF differences
#define PG_ARMING_CONFIG 16 // structs OK, CF naming differences
#define PG_TRANSPONDER_CONFIG 17 // struct OK
#define PG_SYSTEM_CONFIG 18 // just has i2c_highspeed
#define PG_FEATURE_CONFIG 19 // just has enabledFeatures
#define PG_MIXER_CONFIG 20 // Cleanflight has single struct mixerConfig_t, betaflight has mixerConfig_t and servoMixerConfig_t
#define PG_SERVO_MIXER 21 // Cleanflight has servoParam_t for each servo, betaflight has single servoParam_t
#define PG_IMU_CONFIG 22 // Cleanflight has imuConfig_t, betaflight has imuRuntimeConfig_t with additional parameters
#define PG_PROFILE_SELECTION 23 // just contains current_profile_index
#define PG_RX_CONFIG 24 // betaflight rxConfig_t contains different values
#define PG_RC_CONTROLS_CONFIG 25 // Cleanflight has more parameters in rcControlsConfig_t
#define PG_MOTOR_3D_CONFIG 26 // Cleanflight has motor3DConfig_t, betaflight has flight3DConfig_t with more parameters
#define PG_LED_STRIP_CONFIG 27 // structs OK
#define PG_COLOR_CONFIG 28 // part of led strip, structs OK
#define PG_AIRPLANE_CONFIG 29 // struct OK
#define PG_GPS_CONFIG 30 // struct OK
#define PG_TELEMETRY_CONFIG 31 // betaflight has more and different data in telemetryConfig_t
#define PG_FRSKY_TELEMETRY_CONFIG 32 // Cleanflight has split data out of PG_TELEMETRY_CONFIG
#define PG_HOTT_TELEMETRY_CONFIG 33 // Cleanflight has split data out of PG_TELEMETRY_CONFIG
#define PG_NAVIGATION_CONFIG 34 // structs OK
#define PG_ACCELEROMETER_CONFIG 35 // no accelerometerConfig_t in betaflight
#define PG_RATE_PROFILE_SELECTION 36 // part of profile in betaflight
//#define PG_ADJUSTMENT_PROFILE 37 // array needs to be made into struct
#define PG_ADJUSTMENT_RANGE_CONFIG 37
#define PG_BAROMETER_CONFIG 38 // structs OK
#define PG_THROTTLE_CORRECTION_CONFIG 39
#define PG_COMPASS_CONFIG 40 // structs OK
#define PG_MODE_ACTIVATION_PROFILE 41 // array needs to be made into struct
//#define PG_SERVO_PROFILE 42
#define PG_SERVO_PARAMS 42
//#define PG_FAILSAFE_CHANNEL_CONFIG 43 // structs OK
#define PG_RX_FAILSAFE_CHANNEL_CONFIG 43
//#define PG_CHANNEL_RANGE_CONFIG 44 // structs OK
#define PG_RX_CHANNEL_RANGE_CONFIG 44
#define PG_MODE_COLOR_CONFIG 45  // part of led strip, structs OK
#define PG_SPECIAL_COLOR_CONFIG 46  // part of led strip, structs OK
#define PG_PILOT_CONFIG 47 // does not exist in betaflight
#define PG_MSP_SERVER_CONFIG 48 // does not exist in betaflight
#define PG_VOLTAGE_METER_CONFIG 49 // Cleanflight has voltageMeterConfig_t, betaflight has batteryConfig_t
#define PG_AMPERAGE_METER_CONFIG 50 // Cleanflight has amperageMeterConfig_t, betaflight has batteryConfig_t
#define PG_SERVO_CONFIG 52

// Driver configuration
#define PG_DRIVER_PWM_RX_CONFIG 100 // does not exist in betaflight
#define PG_DRIVER_FLASHCHIP_CONFIG 101 // does not exist in betaflight

// betaflight specific parameter group ids start at 500
#define PG_BETAFLIGHT_START 500
#define PG_MODE_ACTIVATION_OPERATOR_CONFIG 500
#define PG_OSD_CONFIG 501
#define PG_BEEPER_CONFIG 502
#define PG_BEEPER_DEV_CONFIG 503
#define PG_PID_CONFIG 504
#define PG_STATUS_LED_CONFIG 505
#define PG_FLASH_CONFIG 506
#define PG_PPM_CONFIG 507
#define PG_PWM_CONFIG 508
#define PG_SERIAL_PIN_CONFIG 509
#define PG_ADC_CONFIG 510
#define PG_SDCARD_CONFIG 511
#define PG_DISPLAY_PORT_MSP_CONFIG 512
#define PG_DISPLAY_PORT_MAX7456_CONFIG 513
#define PG_VCD_CONFIG 514
#define PG_VTX_CONFIG 515
#define PG_SONAR_CONFIG 516
#define PG_BETAFLIGHT_END 516


// OSD configuration (subject to change)
#define PG_OSD_FONT_CONFIG 2047
#define PG_OSD_VIDEO_CONFIG 2046
#define PG_OSD_ELEMENT_CONFIG 2045

// 4095 is currently the highest number that can be used for a PGN due to the top 4 bits of the 16 bit value being reserved for the version when the PG is stored in an EEPROM.
#define PG_RESERVED_FOR_TESTING_1 4095
#define PG_RESERVED_FOR_TESTING_2 4094
#define PG_RESERVED_FOR_TESTING_3 4093

