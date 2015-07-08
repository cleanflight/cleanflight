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
#include <string.h>
#include <stddef.h>

#include "platform.h"

#include "build_config.h"

#include "common/color.h"
#include "common/axis.h"
#include "common/maths.h"

#include "drivers/sensor.h"
#include "drivers/accgyro.h"
#include "drivers/compass.h"
#include "drivers/system.h"
#include "drivers/gpio.h"
#include "drivers/timer.h"
#include "drivers/pwm_rx.h"
#include "drivers/serial.h"

#include "sensors/sensors.h"
#include "sensors/gyro.h"
#include "sensors/compass.h"
#include "sensors/acceleration.h"
#include "sensors/barometer.h"
#include "sensors/boardalignment.h"
#include "sensors/battery.h"

#include "io/beeper.h"
#include "io/serial.h"
#include "io/gimbal.h"
#include "io/escservo.h"
#include "io/rc_controls.h"
#include "io/rc_curves.h"
#include "io/ledstrip.h"
#include "io/gps.h"

#include "rx/rx.h"

#include "telemetry/telemetry.h"

#include "flight/mixer.h"
#include "flight/pid.h"
#include "flight/imu.h"
#include "flight/failsafe.h"
#include "flight/altitudehold.h"
#include "flight/navigation.h"

#include "config/runtime_config.h"
#include "config/config.h"
#include "config/parameter_group.h"
#include "config/config_streamer.h"

#include "config/config_profile.h"
#include "config/config_master.h"

#define BRUSHED_MOTORS_PWM_RATE 16000
#define BRUSHLESS_MOTORS_PWM_RATE 400

void useRcControlsConfig(modeActivationCondition_t *modeActivationConditions, escAndServoConfig_t *escAndServoConfigToUse, pidProfile_t *pidProfileToUse);

// Header for the saved copy.
typedef struct {
    uint8_t format;
} PG_PACKED configHeader_t;

// Header for each stored PG.
typedef struct {
    // TODO(michaelh): shrink to uint8_t once masterConfig has been
    // split up.
    uint16_t size;
    uint8_t pgn;
    uint8_t format;
    uint8_t pg[];
} PG_PACKED configRecord_t;

// Footer for the saved copy.
typedef struct {
    uint16_t terminator;
    uint8_t chk;
} PG_PACKED configFooter_t;

// Used to check the compiler packing at build time.
typedef struct {
    uint8_t byte;
    uint32_t word;
} PG_PACKED packingTest_t;

#define FLASH_TO_RESERVE_FOR_CONFIG 0x800

master_t masterConfig;                 // master config struct with data independent from profiles
profile_t *currentProfile;
static uint32_t activeFeaturesLatch = 0;

static uint8_t currentControlRateProfileIndex = 0;
controlRateConfig_t *currentControlRateProfile;

static const uint8_t EEPROM_CONF_VERSION = 200;

extern uint8_t __config_start;

static const void *pg_registry_tail PG_REGISTRY_TAIL_SECTION;

static const pgRegistry_t masterRegistry PG_REGISTRY_SECTION = {
    .base = &masterConfig,
    .size = sizeof(masterConfig),
    .pgn = 0,
};

static void resetAccelerometerTrims(flightDynamicsTrims_t *accelerometerTrims)
{
    accelerometerTrims->values.pitch = 0;
    accelerometerTrims->values.roll = 0;
    accelerometerTrims->values.yaw = 0;
}

static void resetPidProfile(pidProfile_t *pidProfile)
{
    pidProfile->pidController = 0;

    pidProfile->P8[ROLL] = 40;
    pidProfile->I8[ROLL] = 30;
    pidProfile->D8[ROLL] = 23;
    pidProfile->P8[PITCH] = 40;
    pidProfile->I8[PITCH] = 30;
    pidProfile->D8[PITCH] = 23;
    pidProfile->P8[YAW] = 85;
    pidProfile->I8[YAW] = 45;
    pidProfile->D8[YAW] = 0;
    pidProfile->P8[PIDALT] = 50;
    pidProfile->I8[PIDALT] = 0;
    pidProfile->D8[PIDALT] = 0;
    pidProfile->P8[PIDPOS] = 15; // POSHOLD_P * 100;
    pidProfile->I8[PIDPOS] = 0; // POSHOLD_I * 100;
    pidProfile->D8[PIDPOS] = 0;
    pidProfile->P8[PIDPOSR] = 34; // POSHOLD_RATE_P * 10;
    pidProfile->I8[PIDPOSR] = 14; // POSHOLD_RATE_I * 100;
    pidProfile->D8[PIDPOSR] = 53; // POSHOLD_RATE_D * 1000;
    pidProfile->P8[PIDNAVR] = 25; // NAV_P * 10;
    pidProfile->I8[PIDNAVR] = 33; // NAV_I * 100;
    pidProfile->D8[PIDNAVR] = 83; // NAV_D * 1000;
    pidProfile->P8[PIDLEVEL] = 90;
    pidProfile->I8[PIDLEVEL] = 10;
    pidProfile->D8[PIDLEVEL] = 100;
    pidProfile->P8[PIDMAG] = 40;
    pidProfile->P8[PIDVEL] = 120;
    pidProfile->I8[PIDVEL] = 45;
    pidProfile->D8[PIDVEL] = 1;

    pidProfile->yaw_p_limit = YAW_P_LIMIT_MAX;
    pidProfile->dterm_cut_hz = 0;
    pidProfile->pterm_cut_hz = 0;
    pidProfile->gyro_cut_hz = 0;

    pidProfile->P_f[ROLL] = 2.5f;     // new PID with preliminary defaults test carefully
    pidProfile->I_f[ROLL] = 0.6f;
    pidProfile->D_f[ROLL] = 0.06f;
    pidProfile->P_f[PITCH] = 2.5f;
    pidProfile->I_f[PITCH] = 0.6f;
    pidProfile->D_f[PITCH] = 0.06f;
    pidProfile->P_f[YAW] = 8.0f;
    pidProfile->I_f[YAW] = 0.5f;
    pidProfile->D_f[YAW] = 0.05f;
    pidProfile->A_level = 5.0f;
    pidProfile->H_level = 3.0f;
    pidProfile->H_sensitivity = 75;
}

#ifdef GPS
void resetGpsProfile(gpsProfile_t *gpsProfile)
{
    gpsProfile->gps_wp_radius = 200;
    gpsProfile->gps_lpf = 20;
    gpsProfile->nav_slew_rate = 30;
    gpsProfile->nav_controls_heading = 1;
    gpsProfile->nav_speed_min = 100;
    gpsProfile->nav_speed_max = 300;
    gpsProfile->ap_mode = 40;
}
#endif

void resetBarometerConfig(barometerConfig_t *barometerConfig)
{
    barometerConfig->baro_sample_count = 21;
    barometerConfig->baro_noise_lpf = 0.6f;
    barometerConfig->baro_cf_vel = 0.985f;
    barometerConfig->baro_cf_alt = 0.965f;
}

void resetSensorAlignment(sensorAlignmentConfig_t *sensorAlignmentConfig)
{
    sensorAlignmentConfig->gyro_align = ALIGN_DEFAULT;
    sensorAlignmentConfig->acc_align = ALIGN_DEFAULT;
    sensorAlignmentConfig->mag_align = ALIGN_DEFAULT;
}

void resetEscAndServoConfig(escAndServoConfig_t *escAndServoConfig)
{
    escAndServoConfig->minthrottle = 1150;
    escAndServoConfig->maxthrottle = 1850;
    escAndServoConfig->mincommand = 1000;
    escAndServoConfig->servoCenterPulse = 1500;
}

void resetFlight3DConfig(flight3DConfig_t *flight3DConfig)
{
    flight3DConfig->deadband3d_low = 1406;
    flight3DConfig->deadband3d_high = 1514;
    flight3DConfig->neutral3d = 1460;
    flight3DConfig->deadband3d_throttle = 50;
}

void resetTelemetryConfig(telemetryConfig_t *telemetryConfig)
{
    telemetryConfig->telemetry_inversion = 0;
    telemetryConfig->telemetry_switch = 0;
    telemetryConfig->gpsNoFixLatitude = 0;
    telemetryConfig->gpsNoFixLongitude = 0;
    telemetryConfig->frsky_coordinate_format = FRSKY_FORMAT_DMS;
    telemetryConfig->frsky_unit = FRSKY_UNIT_METRICS;
    telemetryConfig->frsky_vfas_precision = 0;
    telemetryConfig->hottAlarmSoundInterval = 5;
}

void resetBatteryConfig(batteryConfig_t *batteryConfig)
{
    batteryConfig->vbatscale = VBAT_SCALE_DEFAULT;
    batteryConfig->vbatmaxcellvoltage = 43;
    batteryConfig->vbatmincellvoltage = 33;
    batteryConfig->vbatwarningcellvoltage = 35;
    batteryConfig->currentMeterOffset = 0;
    batteryConfig->currentMeterScale = 400; // for Allegro ACS758LCB-100U (40mV/A)
    batteryConfig->batteryCapacity = 0;
    batteryConfig->currentMeterType = CURRENT_SENSOR_ADC;
}

#ifdef SWAP_SERIAL_PORT_0_AND_1_DEFAULTS
#define FIRST_PORT_INDEX 1
#define SECOND_PORT_INDEX 0
#else
#define FIRST_PORT_INDEX 0
#define SECOND_PORT_INDEX 1
#endif

void resetSerialConfig(serialConfig_t *serialConfig)
{
    uint8_t index;
    memset(serialConfig, 0, sizeof(serialConfig_t));

    for (index = 0; index < SERIAL_PORT_COUNT; index++) {
        serialConfig->portConfigs[index].identifier = serialPortIdentifiers[index];
        serialConfig->portConfigs[index].msp_baudrateIndex = BAUD_115200;
        serialConfig->portConfigs[index].gps_baudrateIndex = BAUD_57600;
        serialConfig->portConfigs[index].telemetry_baudrateIndex = BAUD_AUTO;
        serialConfig->portConfigs[index].blackbox_baudrateIndex = BAUD_115200;
    }

    serialConfig->portConfigs[0].functionMask = FUNCTION_MSP;

#ifdef CC3D
    // This allows MSP connection via USART & VCP so the board can be reconfigured.
    serialConfig->portConfigs[1].functionMask = FUNCTION_MSP;
#endif

    serialConfig->reboot_character = 'R';
}

static void resetControlRateConfig(controlRateConfig_t *controlRateConfig) {
    controlRateConfig->rcRate8 = 90;
    controlRateConfig->rcExpo8 = 65;
    controlRateConfig->thrMid8 = 50;
    controlRateConfig->thrExpo8 = 0;
    controlRateConfig->dynThrPID = 0;
    controlRateConfig->rcYawExpo8 = 0;
    controlRateConfig->tpa_breakpoint = 1500;

    for (uint8_t axis = 0; axis < FLIGHT_DYNAMICS_INDEX_COUNT; axis++) {
        controlRateConfig->rates[axis] = 0;
    }

}

void resetRcControlsConfig(rcControlsConfig_t *rcControlsConfig) {
    rcControlsConfig->deadband = 0;
    rcControlsConfig->yaw_deadband = 0;
    rcControlsConfig->alt_hold_deadband = 40;
    rcControlsConfig->alt_hold_fast_change = 1;
}

void resetMixerConfig(mixerConfig_t *mixerConfig) {
    mixerConfig->pid_at_min_throttle = 1;
    mixerConfig->yaw_direction = 1;
    mixerConfig->yaw_jump_prevention_limit = 200;
#ifdef USE_SERVOS
    mixerConfig->tri_unarmed_servo = 1;
    mixerConfig->servo_lowpass_freq = 400;
    mixerConfig->servo_lowpass_enable = 0;
#endif
}

void resetRollAndPitchTrims(rollAndPitchTrims_t *rollAndPitchTrims)
{
    rollAndPitchTrims->values.roll = 0;
    rollAndPitchTrims->values.pitch = 0;
}

uint8_t getCurrentProfile(void)
{
    return masterConfig.current_profile_index;
}

static void setProfile(uint8_t profileIndex)
{
    currentProfile = &masterConfig.profile[profileIndex];
}

uint8_t getCurrentControlRateProfile(void)
{
    return currentControlRateProfileIndex;
}

controlRateConfig_t *getControlRateConfig(uint8_t profileIndex) {
    return &masterConfig.controlRateProfiles[profileIndex];
}

static void setControlRateProfile(uint8_t profileIndex)
{
    currentControlRateProfileIndex = profileIndex;
    currentControlRateProfile = &masterConfig.controlRateProfiles[profileIndex];
}

// Default settings
static void resetConf(void)
{
    int i;
#ifdef USE_SERVOS
    int8_t servoRates[MAX_SUPPORTED_SERVOS] = { 30, 30, 100, 100, 100, 100, 100, 100 };
    ;
#endif

    // Clear all configuration
    PG_FOREACH(reg) {
        memset(reg->base, 0, reg->size);
    }

    setProfile(0);
    setControlRateProfile(0);

    masterConfig.mixerMode = MIXER_QUADX;
    featureClearAll();
#if defined(CJMCU) || defined(SPARKY)
    featureSet(FEATURE_RX_PPM);
#endif

#ifdef BOARD_HAS_VOLTAGE_DIVIDER
    // only enable the VBAT feature by default if the board has a voltage divider otherwise
    // the user may see incorrect readings and unexpected issues with pin mappings may occur.
    featureSet(FEATURE_VBAT);
#endif

    featureSet(FEATURE_FAILSAFE);

    // global settings
    masterConfig.current_profile_index = 0;     // default profile
    masterConfig.gyro_cmpf_factor = 600;        // default MWC
    masterConfig.gyro_cmpfm_factor = 250;       // default MWC
    masterConfig.gyro_lpf = 42;                 // supported by all gyro drivers now. In case of ST gyro, will default to 32Hz instead

    resetAccelerometerTrims(&masterConfig.accZero);

    resetSensorAlignment(&masterConfig.sensorAlignmentConfig);

    masterConfig.acc_hardware = ACC_DEFAULT;     // default/autodetect
    masterConfig.max_angle_inclination = 500;    // 50 degrees
    masterConfig.yaw_control_direction = 1;
    masterConfig.gyroConfig.gyroMovementCalibrationThreshold = 32;

    masterConfig.mag_hardware = MAG_DEFAULT;     // default/autodetect

    resetBatteryConfig(&masterConfig.batteryConfig);

    resetTelemetryConfig(&masterConfig.telemetryConfig);

    masterConfig.rxConfig.serialrx_provider = 0;
    masterConfig.rxConfig.spektrum_sat_bind = 0;
    masterConfig.rxConfig.midrc = 1500;
    masterConfig.rxConfig.mincheck = 1100;
    masterConfig.rxConfig.maxcheck = 1900;
    masterConfig.rxConfig.rx_min_usec = 985;          // any of first 4 channels below this value will trigger rx loss detection
    masterConfig.rxConfig.rx_max_usec = 2115;         // any of first 4 channels above this value will trigger rx loss detection

    masterConfig.rxConfig.rssi_channel = 0;
    masterConfig.rxConfig.rssi_scale = RSSI_SCALE_DEFAULT;
    masterConfig.rxConfig.rssi_ppm_invert = 0;

    masterConfig.inputFilteringMode = INPUT_FILTERING_DISABLED;

    masterConfig.retarded_arm = 0;
    masterConfig.disarm_kill_switch = 1;
    masterConfig.auto_disarm_delay = 5;
    masterConfig.small_angle = 25;

    resetMixerConfig(&masterConfig.mixerConfig);

    masterConfig.airplaneConfig.flaps_speed = 0;
    masterConfig.airplaneConfig.fixedwing_althold_dir = 1;

    // Motor/ESC/Servo
    resetEscAndServoConfig(&masterConfig.escAndServoConfig);
    resetFlight3DConfig(&masterConfig.flight3DConfig);

#ifdef BRUSHED_MOTORS
    masterConfig.motor_pwm_rate = BRUSHED_MOTORS_PWM_RATE;
#else
    masterConfig.motor_pwm_rate = BRUSHLESS_MOTORS_PWM_RATE;
#endif
    masterConfig.servo_pwm_rate = 50;

#ifdef GPS
    // gps/nav stuff
    masterConfig.gpsConfig.provider = GPS_NMEA;
    masterConfig.gpsConfig.sbasMode = SBAS_AUTO;
    masterConfig.gpsConfig.autoConfig = GPS_AUTOCONFIG_ON;
    masterConfig.gpsConfig.autoBaud = GPS_AUTOBAUD_OFF;
#endif

    resetSerialConfig(&masterConfig.serialConfig);

    masterConfig.looptime = 3500;
    masterConfig.emf_avoidance = 0;

    resetPidProfile(&currentProfile->pidProfile);

    resetControlRateConfig(&masterConfig.controlRateProfiles[0]);

    // for (i = 0; i < CHECKBOXITEMS; i++)
    //     cfg.activate[i] = 0;

    resetRollAndPitchTrims(&currentProfile->accelerometerTrims);

    currentProfile->mag_declination = 0;
    currentProfile->acc_lpf_factor = 4;
    currentProfile->accz_lpf_cutoff = 5.0f;
    currentProfile->accDeadband.xy = 40;
    currentProfile->accDeadband.z = 40;

    resetBarometerConfig(&currentProfile->barometerConfig);

    currentProfile->acc_unarmedcal = 1;

    // Radio
    parseRcChannels("AETR1234", &masterConfig.rxConfig);

    resetRcControlsConfig(&currentProfile->rcControlsConfig);

    currentProfile->throttle_correction_value = 0;      // could 10 with althold or 40 for fpv
    currentProfile->throttle_correction_angle = 800;    // could be 80.0 deg with atlhold or 45.0 for fpv

    // Failsafe Variables
    failsafeConfig.failsafe_delay = 10;              // 1sec
    failsafeConfig.failsafe_off_delay = 200;         // 20sec
    failsafeConfig.failsafe_throttle = 1000;         // default throttle off.

#ifdef USE_SERVOS
    // servos
    for (i = 0; i < MAX_SUPPORTED_SERVOS; i++) {
        currentProfile->servoConf[i].min = DEFAULT_SERVO_MIN;
        currentProfile->servoConf[i].max = DEFAULT_SERVO_MAX;
        currentProfile->servoConf[i].middle = DEFAULT_SERVO_MIDDLE;
        currentProfile->servoConf[i].rate = servoRates[i];
        currentProfile->servoConf[i].angleAtMin = DEFAULT_SERVO_MIN_ANGLE;
        currentProfile->servoConf[i].angleAtMax = DEFAULT_SERVO_MAX_ANGLE;
        currentProfile->servoConf[i].forwardFromChannel = CHANNEL_FORWARDING_DISABLED;
    }

    // gimbal
    currentProfile->gimbalConfig.gimbal_flags = GIMBAL_NORMAL;
#endif

#ifdef GPS
    resetGpsProfile(&currentProfile->gpsProfile);
#endif

    // custom mixer. clear by defaults.
    for (i = 0; i < MAX_SUPPORTED_MOTORS; i++)
        masterConfig.customMixer[i].throttle = 0.0f;

#ifdef LED_STRIP
    applyDefaultColors(masterConfig.colors, CONFIGURABLE_COLOR_COUNT);
    applyDefaultLedStripConfig(masterConfig.ledConfigs);
#endif

#ifdef BLACKBOX
#ifdef SPRACINGF3
    featureSet(FEATURE_BLACKBOX);
    masterConfig.blackbox_device = 1;
#else
    masterConfig.blackbox_device = 0;
#endif
    masterConfig.blackbox_rate_num = 1;
    masterConfig.blackbox_rate_denom = 1;
#endif

    // alternative defaults settings for ALIENWIIF1 and ALIENWIIF3 targets
#ifdef ALIENWII32
    featureSet(FEATURE_RX_SERIAL);
    featureSet(FEATURE_MOTOR_STOP);
#ifdef ALIENWIIF3
    masterConfig.serialConfig.portConfigs[2].functionMask = FUNCTION_RX_SERIAL;
    masterConfig.batteryConfig.vbatscale = 20;
#else
    masterConfig.serialConfig.portConfigs[1].functionMask = FUNCTION_RX_SERIAL;
#endif
    masterConfig.rxConfig.serialrx_provider = 1;
    masterConfig.rxConfig.spektrum_sat_bind = 5;
    masterConfig.escAndServoConfig.minthrottle = 1000;
    masterConfig.escAndServoConfig.maxthrottle = 2000;
    masterConfig.motor_pwm_rate = 32000;
    masterConfig.looptime = 2000;
    currentProfile->pidProfile.pidController = 3;
    currentProfile->pidProfile.P8[ROLL] = 36;
    currentProfile->pidProfile.P8[PITCH] = 36;
    failsafeConfig.failsafe_delay = 2;
    failsafeConfig.failsafe_off_delay = 0;
    currentControlRateProfile->rcRate8 = 130;
    currentControlRateProfile->rates[FD_PITCH] = 20;
    currentControlRateProfile->rates[FD_ROLL] = 20;
    currentControlRateProfile->rates[FD_YAW] = 100;
    parseRcChannels("TAER1234", &masterConfig.rxConfig);

    //  { 1.0f, -0.5f,  1.0f, -1.0f },          // REAR_R
    masterConfig.customMixer[0].throttle = 1.0f;
    masterConfig.customMixer[0].roll = -0.5f;
    masterConfig.customMixer[0].pitch = 1.0f;
    masterConfig.customMixer[0].yaw = -1.0f;

    //  { 1.0f, -0.5f, -1.0f,  1.0f },          // FRONT_R
    masterConfig.customMixer[1].throttle = 1.0f;
    masterConfig.customMixer[1].roll = -0.5f;
    masterConfig.customMixer[1].pitch = -1.0f;
    masterConfig.customMixer[1].yaw = 1.0f;

    //  { 1.0f,  0.5f,  1.0f,  1.0f },          // REAR_L
    masterConfig.customMixer[2].throttle = 1.0f;
    masterConfig.customMixer[2].roll = 0.5f;
    masterConfig.customMixer[2].pitch = 1.0f;
    masterConfig.customMixer[2].yaw = 1.0f;

    //  { 1.0f,  0.5f, -1.0f, -1.0f },          // FRONT_L
    masterConfig.customMixer[3].throttle = 1.0f;
    masterConfig.customMixer[3].roll = 0.5f;
    masterConfig.customMixer[3].pitch = -1.0f;
    masterConfig.customMixer[3].yaw = -1.0f;

    //  { 1.0f, -1.0f, -0.5f, -1.0f },          // MIDFRONT_R
    masterConfig.customMixer[4].throttle = 1.0f;
    masterConfig.customMixer[4].roll = -1.0f;
    masterConfig.customMixer[4].pitch = -0.5f;
    masterConfig.customMixer[4].yaw = -1.0f;

    //  { 1.0f,  1.0f, -0.5f,  1.0f },          // MIDFRONT_L
    masterConfig.customMixer[5].throttle = 1.0f;
    masterConfig.customMixer[5].roll = 1.0f;
    masterConfig.customMixer[5].pitch = -0.5f;
    masterConfig.customMixer[5].yaw = 1.0f;

    //  { 1.0f, -1.0f,  0.5f,  1.0f },          // MIDREAR_R
    masterConfig.customMixer[6].throttle = 1.0f;
    masterConfig.customMixer[6].roll = -1.0f;
    masterConfig.customMixer[6].pitch = 0.5f;
    masterConfig.customMixer[6].yaw = 1.0f;

    //  { 1.0f,  1.0f,  0.5f, -1.0f },          // MIDREAR_L
    masterConfig.customMixer[7].throttle = 1.0f;
    masterConfig.customMixer[7].roll = 1.0f;
    masterConfig.customMixer[7].pitch = 0.5f;
    masterConfig.customMixer[7].yaw = -1.0f;
#endif

    // copy first profile into remaining profile
    for (i = 1; i < MAX_PROFILE_COUNT; i++) {
        memcpy(&masterConfig.profile[i], currentProfile, sizeof(profile_t));
    }

    // copy first control rate config into remaining profile
    for (i = 1; i < MAX_CONTROL_RATE_PROFILE_COUNT; i++) {
        memcpy(&masterConfig.controlRateProfiles[i], currentControlRateProfile, sizeof(controlRateConfig_t));
    }

    for (i = 1; i < MAX_PROFILE_COUNT; i++) {
        masterConfig.profile[i].defaultRateProfileIndex = i % MAX_CONTROL_RATE_PROFILE_COUNT;
    }
}

static uint8_t updateChecksum(uint8_t chk, const void *data, uint32_t length)
{
    const uint8_t *p = (const uint8_t *)data;
    const uint8_t *pend = p + length;

    for (; p != pend; p++) {
        chk ^= *p;
    }
    return chk;
}

// Find a parameter group by PGN.  Returns NULL on not found.
static const pgRegistry_t *findPGN(const configRecord_t *record)
{
    // To save memory, the array is terminated by a single zero
    // instead of a full pgRegistry_t.  This means that 'base' must be
    // the first entry in the struct.
    BUILD_BUG_ON(offsetof(pgRegistry_t, base) != 0);

    PG_FOREACH(reg) {
        if (reg->pgn == record->pgn && reg->format == record->format) {
            return reg;
        }
    }
    return NULL;
}

// Load a PG into RAM, upgrading and downgrading as needed.
static bool loadPG(const configRecord_t *record)
{
    const pgRegistry_t *reg = findPGN(record);

    if (reg == NULL) {
        return false;
    }

    // Clear the in-memory copy.  Sets any ungraded fields to zero.
    memset(reg->base, 0, reg->size);
    memcpy(reg->base, record->pg, MIN(reg->size, record->size - sizeof(*record)));
    return true;
}

// Scan the EEPROM config.  Optionally also load into memory.  Returns
// true if the config is valid.
static bool scanEEPROM(bool andLoad)
{
    uint8_t chk = 0;
    const uint8_t *p = &__config_start;
    const configHeader_t *header = (const configHeader_t *)p;

    if (header->format != EEPROM_CONF_VERSION) {
        return false;
    }
    chk = updateChecksum(chk, header, sizeof(*header));
    p += sizeof(*header);

    for (;;) {
        const configRecord_t *record = (const configRecord_t *)p;

        if (record->size == 0) {
            // Found the end.  Stop scanning.
            break;
        }
        if (record->size >= FLASH_TO_RESERVE_FOR_CONFIG
            || record->size < sizeof(*record)) {
            // Too big or too small.
            return false;
        }

        chk = updateChecksum(chk, p, record->size);

        if (andLoad) {
            loadPG(record);
        }
        p += record->size;
    }

    const configFooter_t *footer = (const configFooter_t *)p;
    chk = updateChecksum(chk, footer, sizeof(*footer));
    return chk == 0xFF;
}

static bool isEEPROMContentValid(void)
{
    return scanEEPROM(false);
}

void activateControlRateConfig(void)
{
    generatePitchRollCurve(currentControlRateProfile);
    generateYawCurve(currentControlRateProfile);
    generateThrottleCurve(currentControlRateProfile, &masterConfig.escAndServoConfig);
}

void activateConfig(void)
{
    static imuRuntimeConfig_t imuRuntimeConfig;

    activateControlRateConfig();

    resetAdjustmentStates();

    useRcControlsConfig(
        currentProfile->modeActivationConditions,
        &masterConfig.escAndServoConfig,
        &currentProfile->pidProfile
    );

    useGyroConfig(&masterConfig.gyroConfig);

#ifdef TELEMETRY
    telemetryUseConfig(&masterConfig.telemetryConfig);
#endif

    pidSetController(currentProfile->pidProfile.pidController);

#ifdef GPS
    gpsUseProfile(&currentProfile->gpsProfile);
    gpsUsePIDs(&currentProfile->pidProfile);
#endif

    useFailsafeConfig();
    setAccelerationTrims(&masterConfig.accZero);

    mixerUseConfigs(
#ifdef USE_SERVOS
        currentProfile->servoConf,
        &currentProfile->gimbalConfig,
#endif
        &masterConfig.flight3DConfig,
        &masterConfig.escAndServoConfig,
        &masterConfig.mixerConfig,
        &masterConfig.airplaneConfig,
        &masterConfig.rxConfig
    );

    imuRuntimeConfig.gyro_cmpf_factor = masterConfig.gyro_cmpf_factor;
    imuRuntimeConfig.gyro_cmpfm_factor = masterConfig.gyro_cmpfm_factor;
    imuRuntimeConfig.acc_lpf_factor = currentProfile->acc_lpf_factor;
    imuRuntimeConfig.acc_unarmedcal = currentProfile->acc_unarmedcal;;
    imuRuntimeConfig.small_angle = masterConfig.small_angle;

    imuConfigure(
        &imuRuntimeConfig,
        &currentProfile->pidProfile,
        &currentProfile->accDeadband,
        currentProfile->accz_lpf_cutoff,
        currentProfile->throttle_correction_angle
    );

    configureAltitudeHold(
        &currentProfile->pidProfile,
        &currentProfile->barometerConfig,
        &currentProfile->rcControlsConfig,
        &masterConfig.escAndServoConfig
    );

#ifdef BARO
    useBarometerConfig(&currentProfile->barometerConfig);
#endif
}

void validateAndFixConfig(void)
{
    if (!(featureConfigured(FEATURE_RX_PARALLEL_PWM) || featureConfigured(FEATURE_RX_PPM) || featureConfigured(FEATURE_RX_SERIAL) || featureConfigured(FEATURE_RX_MSP))) {
        featureSet(FEATURE_RX_PARALLEL_PWM); // Consider changing the default to PPM
    }

    if (featureConfigured(FEATURE_RX_PPM)) {
        featureClear(FEATURE_RX_PARALLEL_PWM);
    }

    if (featureConfigured(FEATURE_RX_MSP)) {
        featureClear(FEATURE_RX_SERIAL);
        featureClear(FEATURE_RX_PARALLEL_PWM);
        featureClear(FEATURE_RX_PPM);
    }

    if (featureConfigured(FEATURE_RX_SERIAL)) {
        featureClear(FEATURE_RX_PARALLEL_PWM);
        featureClear(FEATURE_RX_PPM);
    }

    if (featureConfigured(FEATURE_RX_PARALLEL_PWM)) {
#if defined(STM32F10X)
        // rssi adc needs the same ports
        featureClear(FEATURE_RSSI_ADC);
        // current meter needs the same ports
        if (masterConfig.batteryConfig.currentMeterType == CURRENT_SENSOR_ADC) {
            featureClear(FEATURE_CURRENT_METER);
        }
#endif

#if defined(STM32F10X) || defined(CHEBUZZ) || defined(STM32F3DISCOVERY)
        // led strip needs the same ports
        featureClear(FEATURE_LED_STRIP);
#endif

        // software serial needs free PWM ports
        featureClear(FEATURE_SOFTSERIAL);
    }


#if defined(LED_STRIP) && (defined(USE_SOFTSERIAL1) || defined(USE_SOFTSERIAL2))
    if (featureConfigured(FEATURE_SOFTSERIAL) && (
            0
#ifdef USE_SOFTSERIAL1
            || (LED_STRIP_TIMER == SOFTSERIAL_1_TIMER)
#endif
#ifdef USE_SOFTSERIAL2
            || (LED_STRIP_TIMER == SOFTSERIAL_2_TIMER)
#endif
    )) {
        // led strip needs the same timer as softserial
        featureClear(FEATURE_LED_STRIP);
    }
#endif

#if defined(NAZE) && defined(SONAR)
    if (featureConfigured(FEATURE_RX_PARALLEL_PWM) && featureConfigured(FEATURE_SONAR) && featureConfigured(FEATURE_CURRENT_METER) && masterConfig.batteryConfig.currentMeterType == CURRENT_SENSOR_ADC) {
        featureClear(FEATURE_CURRENT_METER);
    }
#endif

#if defined(OLIMEXINO) && defined(SONAR)
    if (feature(FEATURE_SONAR) && feature(FEATURE_CURRENT_METER) && masterConfig.batteryConfig.currentMeterType == CURRENT_SENSOR_ADC) {
        featureClear(FEATURE_CURRENT_METER);
    }
#endif

#if defined(CC3D) && defined(DISPLAY) && defined(USE_USART3)
    if (doesConfigurationUsePort(SERIAL_PORT_USART3) && feature(FEATURE_DISPLAY)) {
        featureClear(FEATURE_DISPLAY);
    }
#endif

    /*
     * The retarded_arm setting is incompatible with pid_at_min_throttle because full roll causes the craft to roll over on the ground.
     * The pid_at_min_throttle implementation ignores yaw on the ground, but doesn't currently ignore roll when retarded_arm is enabled.
     */
    if (masterConfig.retarded_arm && masterConfig.mixerConfig.pid_at_min_throttle) {
        masterConfig.mixerConfig.pid_at_min_throttle = 0;
    }

#if defined(CC3D) && defined(SONAR) && defined(USE_SOFTSERIAL1)
    if (feature(FEATURE_SONAR) && feature(FEATURE_SOFTSERIAL)) {
        featureClear(FEATURE_SONAR);
    }
#endif

    useRxConfig(&masterConfig.rxConfig);

    serialConfig_t *serialConfig = &masterConfig.serialConfig;

    if (!isSerialConfigValid(serialConfig)) {
        resetSerialConfig(serialConfig);
    }
}

void initEEPROM(void)
{
    // Verify that this architecture packs as expected.
    BUILD_BUG_ON(offsetof(packingTest_t, byte) != 0);
    BUILD_BUG_ON(offsetof(packingTest_t, word) != 1);
    BUILD_BUG_ON(sizeof(packingTest_t) != 5);

    BUILD_BUG_ON(sizeof(configHeader_t) != 1);
    BUILD_BUG_ON(sizeof(configFooter_t) != 3);
    BUILD_BUG_ON(sizeof(configRecord_t) != 4);
}

void readEEPROM(void)
{
    // Read flash
    if (!scanEEPROM(true)) {
        failureMode(10);
    }

    if (masterConfig.current_profile_index > MAX_PROFILE_COUNT - 1) // sanity check
        masterConfig.current_profile_index = 0;

    setProfile(masterConfig.current_profile_index);

    if (currentProfile->defaultRateProfileIndex > MAX_CONTROL_RATE_PROFILE_COUNT - 1) // sanity check
        currentProfile->defaultRateProfileIndex = 0;

    setControlRateProfile(currentProfile->defaultRateProfileIndex);

    validateAndFixConfig();
    activateConfig();
}

void readEEPROMAndNotify(void)
{
    // re-read written data
    readEEPROM();
    beeperConfirmationBeeps(1);
}

void writeEEPROM(void)
{
    // Generate compile time error if the config does not fit in the reserved area of flash.
    BUILD_BUG_ON(sizeof(master_t) > FLASH_TO_RESERVE_FOR_CONFIG);

    config_streamer_t streamer;
    config_streamer_init(&streamer);

    // write it
    for (int attempt = 0; attempt < 3; attempt++) {
        config_streamer_start(&streamer, (uintptr_t)&__config_start);

        configHeader_t header = {
            .format = EEPROM_CONF_VERSION,
        };

        config_streamer_write(&streamer, &header, sizeof(header));

        PG_FOREACH(reg) {
            configRecord_t record = {
                .size = sizeof(configRecord_t) + reg->size,
                .pgn = reg->pgn,
                .format = reg->format,
            };

            config_streamer_write(&streamer, &record, sizeof(record));
            config_streamer_write(&streamer, reg->base, reg->size);
        }

        configFooter_t footer = {
            .terminator = 0,
            .chk = ~config_streamer_chk(&streamer),
        };

        if (config_streamer_write(&streamer, &footer, sizeof(footer)) == 0) {
            break;
        }
    }

    // Flash write failed - just die now
    if (config_streamer_finish(&streamer) != 0 || !isEEPROMContentValid()) {
        failureMode(10);
    }
}

void ensureEEPROMContainsValidData(void)
{
    if (isEEPROMContentValid()) {
        return;
    }

    resetEEPROM();
}

void resetEEPROM(void)
{
    resetConf();
    writeEEPROM();
}

void saveConfigAndNotify(void)
{
    writeEEPROM();
    readEEPROMAndNotify();
}

void changeProfile(uint8_t profileIndex)
{
    masterConfig.current_profile_index = profileIndex;
    writeEEPROM();
    readEEPROM();
    beeperConfirmationBeeps(profileIndex + 1);
}

void changeControlRateProfile(uint8_t profileIndex)
{
    if (profileIndex > MAX_CONTROL_RATE_PROFILE_COUNT) {
        profileIndex = MAX_CONTROL_RATE_PROFILE_COUNT - 1;
    }
    setControlRateProfile(profileIndex);
    activateControlRateConfig();
}

void handleOneshotFeatureChangeOnRestart(void)
{
    // Shutdown PWM on all motors prior to soft restart
    StopPwmAllMotors();
    delay(50);
    // Apply additional delay when OneShot125 feature changed from on to off state
    if (feature(FEATURE_ONESHOT125) && !featureConfigured(FEATURE_ONESHOT125)) {
        delay(ONESHOT_FEATURE_CHANGED_DELAY_ON_BOOT_MS);
    }
}

void latchActiveFeatures()
{
    activeFeaturesLatch = masterConfig.enabledFeatures;
}

bool featureConfigured(uint32_t mask)
{
    return masterConfig.enabledFeatures & mask;
}

bool feature(uint32_t mask)
{
    return activeFeaturesLatch & mask;
}

void featureSet(uint32_t mask)
{
    masterConfig.enabledFeatures |= mask;
}

void featureClear(uint32_t mask)
{
    masterConfig.enabledFeatures &= ~(mask);
}

void featureClearAll()
{
    masterConfig.enabledFeatures = 0;
}

uint32_t featureMask(void)
{
    return masterConfig.enabledFeatures;
}

