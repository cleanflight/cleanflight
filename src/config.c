/*
 * This file is part of baseflight
 * Licensed under GPL V3 or modified DCL - see https://github.com/multiwii/baseflight/blob/master/README.md
 */

#include "board.h"
#include "mw.h"
#include <string.h>

#define ASSERT_CONCAT_(a, b) a##b
#define ASSERT_CONCAT(a, b) ASSERT_CONCAT_(a, b)
#define ct_assert(e) enum { ASSERT_CONCAT(assert_line_, __LINE__) = 1/(!!(e)) }

// define this symbol to increase or decrease flash size. not rely on flash_size_register.
#ifndef FLASH_PAGE_COUNT
#define FLASH_PAGE_COUNT 128
#endif

#define FLASH_PAGE_SIZE                 ((uint16_t)0x400)
// if sizeof(mcfg) is over this number, compile-time error will occur. so, need to add another page to config data.
#define CONFIG_SIZE                     (FLASH_PAGE_SIZE * 2)

master_t mcfg;  // master config struct with data independent from profiles
config_t cfg;   // profile config struct
const char rcChannelLetters[] = "AERT1234";

static const uint8_t EEPROM_CONF_VERSION = 72;
static uint32_t enabledSensors = 0;
static void resetConf(void);
static const uint32_t FLASH_WRITE_ADDR = 0x08000000 + (FLASH_PAGE_SIZE * (FLASH_PAGE_COUNT - (CONFIG_SIZE / 1024)));

void initEEPROM(void)
{
    // make sure (at compile time) that config struct doesn't overflow allocated flash pages
    ct_assert(sizeof(mcfg) < CONFIG_SIZE);
}

void parseRcChannels(const char *input)
{
    const char *c, *s;

    for (c = input; *c; c++) {
        s = strchr(rcChannelLetters, *c);
        if (s)
            mcfg.rcmap[s - rcChannelLetters] = c - input;
    }
}

static uint8_t validEEPROM(void)
{
    const master_t *temp = (const master_t *)FLASH_WRITE_ADDR;
    const uint8_t *p;
    uint8_t chk = 0;

    // check version number
    if (EEPROM_CONF_VERSION != temp->version)
        return 0;

    // check size and magic numbers
    if (temp->size != sizeof(master_t) || temp->magic_be != 0xBE || temp->magic_ef != 0xEF)
        return 0;

    // verify integrity of temporary copy
    for (p = (const uint8_t *)temp; p < ((const uint8_t *)temp + sizeof(master_t)); p++)
        chk ^= *p;

    // checksum failed
    if (chk != 0)
        return 0;

    // looks good, let's roll!
    return 1;
}

void readEEPROM(void)
{
    // Sanity check
    if (!validEEPROM())
        failureMode(10);

    // Read flash
    memcpy(&mcfg, (char *)FLASH_WRITE_ADDR, sizeof(master_t));
    // Copy current profile
    if (mcfg.current_profile > 2) // sanity check
        mcfg.current_profile = 0;
    memcpy(&cfg, &mcfg.profile[mcfg.current_profile], sizeof(config_t));
}

void activateConfig(void)
{
    uint8_t i;
    for (i = 0; i < PITCH_LOOKUP_LENGTH; i++)
        lookupPitchRollRC[i] = (2500 + cfg.rcExpo8 * (i * i - 25)) * i * (int32_t)cfg.rcRate8 / 2500;

    for (i = 0; i < THROTTLE_LOOKUP_LENGTH; i++) {
        int16_t tmp = 10 * i - cfg.thrMid8;
        uint8_t y = 1;
        if (tmp > 0)
            y = 100 - cfg.thrMid8;
        if (tmp < 0)
            y = cfg.thrMid8;
        lookupThrottleRC[i] = 10 * cfg.thrMid8 + tmp * (100 - cfg.thrExpo8 + (int32_t)cfg.thrExpo8 * (tmp * tmp) / (y * y)) / 10;
        lookupThrottleRC[i] = mcfg.minthrottle + (int32_t)(mcfg.maxthrottle - mcfg.minthrottle) * lookupThrottleRC[i] / 1000; // [MINTHROTTLE;MAXTHROTTLE]
    }

    setPIDController(cfg.pidController);
#ifdef GPS
    gpsSetPIDs();
#endif
}

void loadAndActivateConfig(void)
{
    readEEPROM();
    activateConfig();
}

void writeEEPROM(uint8_t b, uint8_t updateProfile)
{
    FLASH_Status status;
    uint8_t chk = 0;
    const uint8_t *p;

    // prepare checksum/version constants
    mcfg.version = EEPROM_CONF_VERSION;
    mcfg.size = sizeof(master_t);
    mcfg.magic_be = 0xBE;
    mcfg.magic_ef = 0xEF;
    mcfg.chk = 0;

    // when updateProfile = true, we copy contents of cfg to global configuration. when false, only profile number is updated, and then that profile is loaded on readEEPROM()
    if (updateProfile) {
        // copy current in-memory profile to stored configuration
        memcpy(&mcfg.profile[mcfg.current_profile], &cfg, sizeof(config_t));
    }

    // recalculate checksum before writing
    for (p = (const uint8_t *)&mcfg; p < ((const uint8_t *)&mcfg + sizeof(master_t)); p++)
        chk ^= *p;
    mcfg.chk = chk;

    // write it
    FLASH_Unlock();
    for (unsigned int tries = 3; tries; tries--) {
        FLASH_ClearFlag(FLASH_FLAG_EOP | FLASH_FLAG_PGERR | FLASH_FLAG_WRPRTERR);

        FLASH_ErasePage(FLASH_WRITE_ADDR);
        status = FLASH_ErasePage(FLASH_WRITE_ADDR + FLASH_PAGE_SIZE);
        for (unsigned int i = 0; i < sizeof(master_t) && status == FLASH_COMPLETE; i += 4)
            status = FLASH_ProgramWord(FLASH_WRITE_ADDR + i, *(uint32_t *)((char *)&mcfg + i));
        if (status == FLASH_COMPLETE)
            break;
    }
    FLASH_Lock();

    // Flash write failed - just die now
    if (status != FLASH_COMPLETE || !validEEPROM()) {
        failureMode(10);
    }

    // re-read written data
    loadAndActivateConfig();
    if (b)
        blinkLED(15, 20, 1);
}

void checkFirstTime(bool reset)
{
    // check the EEPROM integrity before resetting values
    if (!validEEPROM() || reset) {
        resetConf();
        // no need to memcpy profile again, we just did it in resetConf() above
        writeEEPROM(0, false);
    }
}

// Default settings
static void resetConf(void)
{
    int i;
    int8_t servoRates[8] = { 30, 30, 100, 100, 100, 100, 100, 100 };

    // Clear all configuration
    memset(&mcfg, 0, sizeof(master_t));
    memset(&cfg, 0, sizeof(config_t));

    mcfg.version = EEPROM_CONF_VERSION;
    mcfg.mixerConfiguration = MULTITYPE_QUADX;
    featureClearAll();
#ifdef CJMCU
    featureSet(FEATURE_PPM);
#else
    featureSet(FEATURE_VBAT);
#endif

    // global settings
    mcfg.current_profile = 0;       // default profile
    mcfg.gyro_cmpf_factor = 600;    // default MWC
    mcfg.gyro_cmpfm_factor = 250;   // default MWC
    mcfg.gyro_lpf = 42;             // supported by all gyro drivers now. In case of ST gyro, will default to 32Hz instead
    mcfg.accZero[0] = 0;
    mcfg.accZero[1] = 0;
    mcfg.accZero[2] = 0;
    mcfg.gyro_align = ALIGN_DEFAULT;
    mcfg.acc_align = ALIGN_DEFAULT;
    mcfg.mag_align = ALIGN_DEFAULT;
    mcfg.board_align_roll = 0;
    mcfg.board_align_pitch = 0;
    mcfg.board_align_yaw = 0;
    mcfg.acc_hardware = ACC_DEFAULT;     // default/autodetect
    mcfg.mag_hardware = MAG_DEFAULT;
    mcfg.max_angle_inclination = 300;    // 30 degrees
    mcfg.yaw_control_direction = 1;
    mcfg.moron_threshold = 32;
    mcfg.currentscale = 400; // for Allegro ACS758LCB-100U (40mV/A)
    mcfg.vbatscale = 110;	//11 * (val/1024)*3.3
    mcfg.vbatmaxcellvoltage = 43;	//4.3V min
    mcfg.vbatmincellvoltage = 33;	//3.3V max
    mcfg.vbatwarningcellvoltage = 35;
    mcfg.power_adc_channel = 0;
    mcfg.serialrx_type = 0;
    mcfg.spektrum_sat_bind = 0;
    mcfg.telemetry_provider = TELEMETRY_PROVIDER_FRSKY;
    mcfg.telemetry_port = TELEMETRY_PORT_UART;
    mcfg.telemetry_switch = 0;
    mcfg.midrc = 1500;
    mcfg.mincheck = 1100;
    mcfg.maxcheck = 1900;
    mcfg.retarded_arm = 0;       // disable arm/disarm on roll left/right
    mcfg.disarm_kill_switch = 1; // AUX disarm independently of throttle value
    mcfg.fw_althold_dir = 1;
    // Motor/ESC/Servo
    mcfg.minthrottle = 1060;
    mcfg.maxthrottle = 1850;
    mcfg.mincommand = 1000;
    mcfg.deadband3d_low = 1406;
    mcfg.deadband3d_high = 1514;
    mcfg.neutral3d = 1460;
    mcfg.deadband3d_throttle = 50;
    mcfg.motor_pwm_rate = MOTOR_PWM_RATE;
    mcfg.servo_pwm_rate = 50;
    // gps/nav stuff
    mcfg.gps_type = GPS_NMEA;
    mcfg.gps_baudrate = GPS_BAUD_115200;
    // serial (USART1) baudrate
    mcfg.serial_baudrate = 115200;
    mcfg.softserial_baudrate = 9600;
    mcfg.softserial_1_inverted = 0;
    mcfg.softserial_2_inverted = 0;
    mcfg.looptime = 3500;
    mcfg.emf_avoidance = 0;
    mcfg.rssi_aux_channel = 0;
    mcfg.rssi_adc_max = 4095;

    cfg.pidController = 0;
    cfg.P8[ROLL] = 55;
    cfg.I8[ROLL] = 15;
    cfg.D8[ROLL] = 30;
    cfg.P8[PITCH] = 55;
    cfg.I8[PITCH] = 15;
    cfg.D8[PITCH] = 30;
    cfg.P8[YAW] = 85;
    cfg.I8[YAW] = 45;
    cfg.D8[YAW] = 0;
    cfg.P8[PIDALT] = 50;
    cfg.I8[PIDALT] = 10;
    cfg.D8[PIDALT] = 10;
    cfg.P8[PIDPOS] = 11; // POSHOLD_P * 100;
    cfg.I8[PIDPOS] = 0; // POSHOLD_I * 100;
    cfg.D8[PIDPOS] = 0;
    cfg.P8[PIDPOSR] = 50; // POSHOLD_RATE_P * 10;
    cfg.I8[PIDPOSR] = 8; // POSHOLD_RATE_I * 100;
    cfg.D8[PIDPOSR] = 45; // POSHOLD_RATE_D * 1000;
    cfg.P8[PIDNAVR] = 14; // NAV_P * 10;
    cfg.I8[PIDNAVR] = 20; // NAV_I * 100;
    cfg.D8[PIDNAVR] = 80; // NAV_D * 1000;
    cfg.P8[PIDLEVEL] = 80;
    cfg.I8[PIDLEVEL] = 10;
    cfg.D8[PIDLEVEL] = 80;
    cfg.P8[PIDMAG] = 40;
    cfg.P8[PIDVEL] = 120;
    cfg.I8[PIDVEL] = 45;
    cfg.D8[PIDVEL] = 1;
    cfg.rcRate8 = 90;
    cfg.rcExpo8 = 65;
    cfg.rollPitchRate = 0;
    cfg.yawRate = 0;
    cfg.dynThrPID = 0;
    cfg.tpa_breakpoint = 1500;
    cfg.thrMid8 = 50;
    cfg.thrExpo8 = 0;
    // for (i = 0; i < CHECKBOXITEMS; i++)
    //     cfg.activate[i] = 0;
    cfg.angleTrim[0] = 0;
    cfg.angleTrim[1] = 0;
    cfg.mag_declination = 0;    // For example, -6deg 37min, = -637 Japan, format is [sign]dddmm (degreesminutes) default is zero.
    cfg.acc_lpf_factor = 10;
    cfg.accz_deadband = 40;
    cfg.accxy_deadband = 40;
    cfg.baro_tab_size = 21;
    cfg.baro_noise_lpf = 0.6f;
    cfg.baro_cf_vel = 0.985f;
    cfg.baro_cf_alt = 0.965f;
    cfg.accz_lpf_cutoff = 5.0f;
    cfg.acc_unarmedcal = 1;
    cfg.small_angle = 25;

    // Radio
    parseRcChannels("AETR1234");//TERA1234
    cfg.deadband = 0;
    cfg.yawdeadband = 0;
    cfg.alt_hold_throttle_neutral = 40;
    cfg.alt_hold_fast_change = 0; //slow alt change
    cfg.throttle_correction_value = 0;      // could 10 with althold or 40 for fpv
    cfg.throttle_correction_angle = 800;    // could be 80.0 deg with atlhold or 45.0 for fpv

    // Failsafe Variables
    cfg.failsafe_delay = 10;                // 1sec
    cfg.failsafe_off_delay = 200;           // 20sec
    cfg.failsafe_throttle = 1200;           // decent default which should always be below hover throttle for people.
    cfg.failsafe_detect_threshold = 985;    // any of first 4 channels below this value will trigger failsafe

    // servos
    for (i = 0; i < 8; i++) {
        cfg.servoConf[i].min = 1020;
        cfg.servoConf[i].max = 2000;
        cfg.servoConf[i].middle = 1500;
        cfg.servoConf[i].rate = servoRates[i];
    }

    cfg.yaw_direction = 1;
    cfg.tri_unarmed_servo = 1;

    // gimbal
    cfg.gimbal_flags = GIMBAL_NORMAL;

    // gps/nav stuff
    cfg.gps_wp_radius = 200;
    cfg.gps_lpf = 20;
    cfg.nav_slew_rate = 30;
    cfg.nav_controls_heading = 1;
    cfg.nav_speed_min = 100;
    cfg.nav_speed_max = 300;
    cfg.ap_mode = 40;
    // fw stuff
    cfg.fw_roll_throw = 0.5f;
    cfg.fw_pitch_throw = 0.5f;
    cfg.fw_gps_maxcorr = 20;
    cfg.fw_gps_rudder = 15;
    cfg.fw_gps_maxclimb = 15;
    cfg.fw_gps_maxdive = 15;
    cfg.fw_climb_throttle = 1900;
    cfg.fw_cruise_throttle = 1500;
    cfg.fw_idle_throttle = 1300;
    cfg.fw_scaler_throttle = 8;
    cfg.fw_roll_comp = 1;
    // control stuff
    mcfg.reboot_character = 'R';

    // custom mixer. clear by defaults.
    for (i = 0; i < MAX_MOTORS; i++)
        mcfg.customMixer[i].throttle = 0.0f;

    // alternative defaults AlienWii32 (activate via OPTIONS="ALIENWII32" during make for NAZE target)
#ifdef ALIENWII32
    featureSet(FEATURE_SERIALRX);
    featureSet(FEATURE_MOTOR_STOP);
    mcfg.serialrx_type = 1;
    mcfg.spektrum_sat_bind = 5;
    mcfg.minthrottle = 1000;
    mcfg.maxthrottle = 2000;
    cfg.rcRate8 = 130;
    cfg.rollPitchRate = 20;
    cfg.yawRate = 60;
    parseRcChannels("TAER1234");
#endif

    // copy default config into all 3 profiles
    for (i = 0; i < 3; i++)
        memcpy(&mcfg.profile[i], &cfg, sizeof(config_t));
}

bool sensors(uint32_t mask)
{
    return enabledSensors & mask;
}

void sensorsSet(uint32_t mask)
{
    enabledSensors |= mask;
}

void sensorsClear(uint32_t mask)
{
    enabledSensors &= ~(mask);
}

uint32_t sensorsMask(void)
{
    return enabledSensors;
}

bool feature(uint32_t mask)
{
    return mcfg.enabledFeatures & mask;
}

void featureSet(uint32_t mask)
{
    mcfg.enabledFeatures |= mask;
}

void featureClear(uint32_t mask)
{
    mcfg.enabledFeatures &= ~(mask);
}

void featureClearAll()
{
    mcfg.enabledFeatures = 0;
}

uint32_t featureMask(void)
{
    return mcfg.enabledFeatures;
}
