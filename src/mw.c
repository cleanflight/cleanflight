#include "board.h"
#include "mw.h"

#include "common/maths.h"
#include "common/typeconversion.h"

#include "flight_common.h"
#include "serial_cli.h"
#include "telemetry_common.h"
#include "gps_common.h"
#include "rx_common.h"
#include "rx_sbus.h"
#include "rx_sumd.h"
#include "rx_spektrum.h"
#include "failsafe.h"
#include "statusindicator.h"

// June 2013     V2.2-dev

int16_t debug[4];
uint32_t currentTime = 0;
uint32_t previousTime = 0;
uint16_t cycleTime = 0;         // this is the number in micro second to achieve a full loop, it can differ a little and is taken into account in the PID loop
int16_t headFreeModeHold;

int16_t telemTemperature1;      // gyro sensor temperature

int16_t rcCommand[4];           // interval [1000;2000] for THROTTLE and [-500;+500] for ROLL/PITCH/YAW
uint16_t rssi;                  // range: [0;1023]

static void pidMultiWii(void);
static void pidRewrite(void);
pidControllerFuncPtr pid_controller = pidMultiWii; // which pid controller are we using, defaultMultiWii

uint8_t dynP8[3], dynI8[3], dynD8[3];

int16_t axisPID[3];

// **********************
// GPS
// **********************
int32_t GPS_coord[2];
int32_t GPS_home[2];
int32_t GPS_hold[2];
uint8_t GPS_numSat;
uint16_t GPS_distanceToHome;        // distance to home point in meters
int16_t GPS_directionToHome;        // direction to home or hol point in degrees
uint16_t GPS_altitude, GPS_speed;   // altitude in 0.1m and speed in 0.1m/s
uint8_t GPS_update = 0;             // it's a binary toogle to distinct a GPS position update
int16_t GPS_angle[2] = { 0, 0 };    // it's the angles that must be applied for GPS correction
uint16_t GPS_ground_course = 0;     // degrees * 10
int16_t nav[2];
int16_t nav_rated[2];               // Adding a rate controller to the navigation to make it smoother
int8_t nav_mode = NAV_MODE_NONE;    // Navigation mode
uint8_t GPS_numCh;                  // Number of channels
uint8_t GPS_svinfo_chn[16];         // Channel number
uint8_t GPS_svinfo_svid[16];        // Satellite ID
uint8_t GPS_svinfo_quality[16];     // Bitfield Qualtity
uint8_t GPS_svinfo_cno[16];         // Carrier to Noise Ratio (Signal Strength)

// Automatic ACC Offset Calibration
bool AccInflightCalibrationArmed = false;
bool AccInflightCalibrationMeasurementDone = false;
bool AccInflightCalibrationSavetoEEProm = false;
bool AccInflightCalibrationActive = false;
uint16_t InflightcalibratingA = 0;

void annexCode(void)
{
    static uint32_t calibratedAccTime;
    int32_t tmp, tmp2;
    int32_t axis, totalPidAttenutation, throttlePidAttenuation;

    static uint8_t batteryWarningEnabled = false;

    static uint8_t vbatTimer = 0;

    // PITCH & ROLL only dynamic PID adjustemnt,  depending on throttle value
    if (rcData[THROTTLE] < cfg.tpaBreakPoint) {
        throttlePidAttenuation = 100;
    } else {
        if (rcData[THROTTLE] < 2000) {
            throttlePidAttenuation =  100 - (uint16_t)cfg.dynThrPID * (rcData[THROTTLE] - cfg.tpaBreakPoint) / (2000 - cfg.tpaBreakPoint);
        } else {
            throttlePidAttenuation = 100 - cfg.dynThrPID;
        }
    }

    for (axis = 0; axis < 3; axis++) {
        tmp = min(abs(rcData[axis] - mcfg.rxConfig.midrc), 500);
        if (axis != 2) {        // ROLL & PITCH
            if (cfg.deadband) {
                if (tmp > cfg.deadband) {
                    tmp -= cfg.deadband;
                } else {
                    tmp = 0;
                }
            }

            tmp2 = tmp / 100;
            rcCommand[axis] = lookupPitchRollRC[tmp2] + (tmp - tmp2 * 100) * (lookupPitchRollRC[tmp2 + 1] - lookupPitchRollRC[tmp2]) / 100;
            totalPidAttenutation = 100 - (uint16_t)cfg.controlRateConfig.rollPitchRate * tmp / 500;
            totalPidAttenutation = (uint16_t)totalPidAttenutation * throttlePidAttenuation / 100;
        } else {                // YAW
            if (cfg.yawdeadband) {
                if (tmp > cfg.yawdeadband) {
                    tmp -= cfg.yawdeadband;
                } else {
                    tmp = 0;
                }
            }
            rcCommand[axis] = tmp * -mcfg.yaw_control_direction;
            totalPidAttenutation = 100 - (uint16_t)cfg.controlRateConfig.yawRate * abs(tmp) / 500;
        }
        dynP8[axis] = (uint16_t)cfg.P8[axis] * totalPidAttenutation / 100;
        dynI8[axis] = (uint16_t)cfg.I8[axis] * totalPidAttenutation / 100;
        dynD8[axis] = (uint16_t)cfg.D8[axis] * totalPidAttenutation / 100;
        if (rcData[axis] < mcfg.rxConfig.midrc)
            rcCommand[axis] = -rcCommand[axis];
    }

    tmp = constrain(rcData[THROTTLE], mcfg.rxConfig.mincheck, 2000);
    tmp = (uint32_t)(tmp - mcfg.rxConfig.mincheck) * 1000 / (2000 - mcfg.rxConfig.mincheck);       // [MINCHECK;2000] -> [0;1000]
    tmp2 = tmp / 100;
    rcCommand[THROTTLE] = lookupThrottleRC[tmp2] + (tmp - tmp2 * 100) * (lookupThrottleRC[tmp2 + 1] - lookupThrottleRC[tmp2]) / 100;    // [0;1000] -> expo -> [MINTHROTTLE;MAXTHROTTLE]

    if (f.HEADFREE_MODE) {
        float radDiff = degreesToRadians(heading - headFreeModeHold);
        float cosDiff = cosf(radDiff);
        float sinDiff = sinf(radDiff);
        int16_t rcCommand_PITCH = rcCommand[PITCH] * cosDiff + rcCommand[ROLL] * sinDiff;
        rcCommand[ROLL] = rcCommand[ROLL] * cosDiff - rcCommand[PITCH] * sinDiff;
        rcCommand[PITCH] = rcCommand_PITCH;
    }

    if (feature(FEATURE_VBAT)) {
        if (!(++vbatTimer % VBATFREQ)) {
            updateBatteryVoltage();

            batteryWarningEnabled = shouldSoundBatteryAlarm();
        }
    }

    buzzer(batteryWarningEnabled); // external buzzer routine that handles buzzer events globally now

    if ((calibratingA > 0 && sensors(SENSOR_ACC)) || (calibratingG > 0)) {      // Calibration phasis
        LED0_TOGGLE;
    } else {
        if (f.ACC_CALIBRATED)
            LED0_OFF;
        if (f.ARMED)
            LED0_ON;

        checkTelemetryState();
    }

#ifdef LEDRING
    if (feature(FEATURE_LED_RING)) {
        static uint32_t LEDTime;
        if ((int32_t)(currentTime - LEDTime) >= 0) {
            LEDTime = currentTime + 50000;
            ledringState(f.ARMED, angle[AI_PITCH], angle[AI_ROLL]);
        }
    }
#endif

    if ((int32_t)(currentTime - calibratedAccTime) >= 0) {
        if (!f.SMALL_ANGLES_25) {
            f.ACC_CALIBRATED = 0; // the multi uses ACC and is not calibrated or is too much inclinated
            LED0_TOGGLE;
            calibratedAccTime = currentTime + 500000;
        } else {
            f.ACC_CALIBRATED = 1;
        }
    }

    serialCom();

    if (!cliMode && feature(FEATURE_TELEMETRY)) {
        handleTelemetry();
    }

    if (sensors(SENSOR_GPS)) {
        static uint32_t GPSLEDTime;
        if ((int32_t)(currentTime - GPSLEDTime) >= 0 && (GPS_numSat >= 5)) {
            GPSLEDTime = currentTime + 150000;
            LED1_TOGGLE;
        }
    }

    // Read out gyro temperature. can use it for something somewhere. maybe get MCU temperature instead? lots of fun possibilities.
    if (gyro.temperature)
        gyro.temperature(&telemTemperature1);
    else {
        // TODO MCU temp
    }
}


static void mwArm(void)
{
    if (calibratingG == 0 && f.ACC_CALIBRATED) {
        // TODO: feature(FEATURE_FAILSAFE) && failsafeCnt < 2
        // TODO: && ( !feature || ( feature && ( failsafecnt > 2) )
        if (!f.ARMED) {         // arm now!
            f.ARMED = 1;
            headFreeModeHold = heading;
        }
    } else if (!f.ARMED) {
        blinkLedAndSoundBeeper(2, 255, 1);
    }
}

static void mwVario(void)
{

}

static int32_t errorGyroI[3] = { 0, 0, 0 };
static int32_t errorAngleI[2] = { 0, 0 };

static void pidMultiWii(void)
{
    int axis, prop;
    int32_t error, errorAngle;
    int32_t PTerm, ITerm, PTermACC = 0, ITermACC = 0, PTermGYRO = 0, ITermGYRO = 0, DTerm;
    static int16_t lastGyro[3] = { 0, 0, 0 };
    static int32_t delta1[3], delta2[3];
    int32_t deltaSum;
    int32_t delta;

    // **** PITCH & ROLL & YAW PID ****
    prop = max(abs(rcCommand[PITCH]), abs(rcCommand[ROLL])); // range [0;500]
    for (axis = 0; axis < 3; axis++) {
        if ((f.ANGLE_MODE || f.HORIZON_MODE) && axis < 2) { // MODE relying on ACC
            // 50 degrees max inclination
            errorAngle = constrain(2 * rcCommand[axis] + GPS_angle[axis], -((int)mcfg.max_angle_inclination), +mcfg.max_angle_inclination) - angle[axis] + cfg.angleTrim[axis];
            PTermACC = errorAngle * cfg.P8[PIDLEVEL] / 100; // 32 bits is needed for calculation: errorAngle*P8[PIDLEVEL] could exceed 32768   16 bits is ok for result
            PTermACC = constrain(PTermACC, -cfg.D8[PIDLEVEL] * 5, +cfg.D8[PIDLEVEL] * 5);

            errorAngleI[axis] = constrain(errorAngleI[axis] + errorAngle, -10000, +10000); // WindUp
            ITermACC = (errorAngleI[axis] * cfg.I8[PIDLEVEL]) >> 12;
        }
        if (!f.ANGLE_MODE || f.HORIZON_MODE || axis == 2) { // MODE relying on GYRO or YAW axis
            error = (int32_t)rcCommand[axis] * 10 * 8 / cfg.P8[axis];
            error -= gyroData[axis];

            PTermGYRO = rcCommand[axis];

            errorGyroI[axis] = constrain(errorGyroI[axis] + error, -16000, +16000); // WindUp
            if (abs(gyroData[axis]) > 640)
                errorGyroI[axis] = 0;
            ITermGYRO = (errorGyroI[axis] / 125 * cfg.I8[axis]) >> 6;
        }
        if (f.HORIZON_MODE && axis < 2) {
            PTerm = (PTermACC * (500 - prop) + PTermGYRO * prop) / 500;
            ITerm = (ITermACC * (500 - prop) + ITermGYRO * prop) / 500;
        } else {
            if (f.ANGLE_MODE && axis < 2) {
                PTerm = PTermACC;
                ITerm = ITermACC;
            } else {
                PTerm = PTermGYRO;
                ITerm = ITermGYRO;
            }
        }

        PTerm -= (int32_t)gyroData[axis] * dynP8[axis] / 10 / 8; // 32 bits is needed for calculation
        delta = gyroData[axis] - lastGyro[axis];
        lastGyro[axis] = gyroData[axis];
        deltaSum = delta1[axis] + delta2[axis] + delta;
        delta2[axis] = delta1[axis];
        delta1[axis] = delta;
        DTerm = (deltaSum * dynD8[axis]) / 32;
        axisPID[axis] = PTerm + ITerm - DTerm;
    }
}

#define GYRO_I_MAX 256

static void pidRewrite(void)
{
    int32_t errorAngle = 0;
    int axis;
    int32_t delta, deltaSum;
    static int32_t delta1[3], delta2[3];
    int32_t PTerm, ITerm, DTerm;
    static int32_t lastError[3] = { 0, 0, 0 };
    int32_t AngleRateTmp, RateError;

    // ----------PID controller----------
    for (axis = 0; axis < 3; axis++) {
        // -----Get the desired angle rate depending on flight mode
        if ((f.ANGLE_MODE || f.HORIZON_MODE) && axis < 2) { // MODE relying on ACC
            // calculate error and limit the angle to max configured inclination
            errorAngle = constrain((rcCommand[axis] << 1) + GPS_angle[axis], -((int)mcfg.max_angle_inclination), +mcfg.max_angle_inclination) - angle[axis] + cfg.angleTrim[axis]; // 16 bits is ok here
        }
        if (axis == 2) { // YAW is always gyro-controlled (MAG correction is applied to rcCommand)
            AngleRateTmp = (((int32_t)(cfg.controlRateConfig.yawRate + 27) * rcCommand[2]) >> 5);
         } else {
            if (!f.ANGLE_MODE) { //control is GYRO based (ACRO and HORIZON - direct sticks control is applied to rate PID
                AngleRateTmp = ((int32_t) (cfg.controlRateConfig.rollPitchRate + 27) * rcCommand[axis]) >> 4;
                if (f.HORIZON_MODE) {
                    // mix up angle error to desired AngleRateTmp to add a little auto-level feel
                    AngleRateTmp += (errorAngle * cfg.I8[PIDLEVEL]) >> 8;
                }
            } else { // it's the ANGLE mode - control is angle based, so control loop is needed
                AngleRateTmp = (errorAngle * cfg.P8[PIDLEVEL]) >> 4;
            }
        }

        // --------low-level gyro-based PID. ----------
        // Used in stand-alone mode for ACRO, controlled by higher level regulators in other modes
        // -----calculate scaled error.AngleRates
        // multiplication of rcCommand corresponds to changing the sticks scaling here
        RateError = AngleRateTmp - gyroData[axis];

        // -----calculate P component
        PTerm = (RateError * cfg.P8[axis]) >> 7;
        // -----calculate I component
        // there should be no division before accumulating the error to integrator, because the precision would be reduced.
        // Precision is critical, as I prevents from long-time drift. Thus, 32 bits integrator is used.
        // Time correction (to avoid different I scaling for different builds based on average cycle time)
        // is normalized to cycle time = 2048.
        errorGyroI[axis] = errorGyroI[axis] + ((RateError * cycleTime) >> 11) * cfg.I8[axis];

        // limit maximum integrator value to prevent WindUp - accumulating extreme values when system is saturated.
        // I coefficient (I8) moved before integration to make limiting independent from PID settings
        errorGyroI[axis] = constrain(errorGyroI[axis], (int32_t)-GYRO_I_MAX << 13, (int32_t)+GYRO_I_MAX << 13);
        ITerm = errorGyroI[axis] >> 13;

        //-----calculate D-term
        delta = RateError - lastError[axis];  // 16 bits is ok here, the dif between 2 consecutive gyro reads is limited to 800
        lastError[axis] = RateError;

        // Correct difference by cycle time. Cycle time is jittery (can be different 2 times), so calculated difference
        // would be scaled by different dt each time. Division by dT fixes that.
        delta = (delta * ((uint16_t)0xFFFF / (cycleTime >> 4))) >> 6;
        // add moving average here to reduce noise
        deltaSum = delta1[axis] + delta2[axis] + delta;
        delta2[axis] = delta1[axis];
        delta1[axis] = delta;
        DTerm = (deltaSum * cfg.D8[axis]) >> 8;

        // -----calculate total PID output
        axisPID[axis] = PTerm + ITerm + DTerm;
    }
}

void setPIDController(int type)
{
    switch (type) {
        case 0:
        default:
            pid_controller = pidMultiWii;
            break;
        case 1:
            pid_controller = pidRewrite;
            break;
    }
}

void loop(void)
{
    static uint8_t rcDelayCommand;      // this indicates the number of time (multiple of RC measurement at 50Hz) the sticks must be maintained to run or switch off motors
    static uint8_t rcSticks;            // this hold sticks position for command combos
    uint8_t stTmp = 0;
    int i;
    static uint32_t rcTime = 0;
    static int16_t initialThrottleHold;
    static uint32_t loopTime;
    uint16_t auxState = 0;
    static uint8_t GPSNavReset = 1;
    bool isThrottleLow = false;
    bool rcReady = false;

    currentTime = micros();
    if (mcfg.looptime == 0 || (int32_t)(currentTime - loopTime) >= 0) {
        loopTime = currentTime + mcfg.looptime;

        computeIMU();
        annexCode();
        // Measure loop rate just afer reading the sensors
        currentTime = micros();
        cycleTime = (int32_t)(currentTime - previousTime);
        previousTime = currentTime;

        if (sensors(SENSOR_MAG)) {
            if (abs(rcCommand[YAW]) < 70 && f.MAG_MODE) {
                int16_t dif = heading - magHold;
                if (dif <= -180)
                    dif += 360;
                if (dif >= +180)
                    dif -= 360;
                dif *= -mcfg.yaw_control_direction;
                if (f.SMALL_ANGLES_25)
                    rcCommand[YAW] -= dif * cfg.P8[PIDMAG] / 30;    // 18 deg
            } else
                magHold = heading;
        }

        if (sensors(SENSOR_BARO)) {
            if (f.BARO_MODE) {
                static uint8_t isAltHoldChanged = 0;
                static int16_t AltHoldCorr = 0;
                if (!f.FIXED_WING) {
                    // multirotor alt hold
                    if (cfg.alt_hold_fast_change) {
                        // rapid alt changes
                        if (abs(rcCommand[THROTTLE] - initialThrottleHold) > cfg.alt_hold_throttle_neutral) {
                            errorAltitudeI = 0;
                            isAltHoldChanged = 1;
                            rcCommand[THROTTLE] += (rcCommand[THROTTLE] > initialThrottleHold) ? -cfg.alt_hold_throttle_neutral : cfg.alt_hold_throttle_neutral;
                        } else {
                            if (isAltHoldChanged) {
                                AltHold = EstAlt;
                                isAltHoldChanged = 0;
                            }
                            rcCommand[THROTTLE] = initialThrottleHold + BaroPID;
                        }
                    } else {
                        // slow alt changes for apfags
                        if (abs(rcCommand[THROTTLE] - initialThrottleHold) > cfg.alt_hold_throttle_neutral) {
                            // Slowly increase/decrease AltHold proportional to stick movement ( +100 throttle gives ~ +50 cm in 1 second with cycle time about 3-4ms)
                            AltHoldCorr += rcCommand[THROTTLE] - initialThrottleHold;
                            AltHold += AltHoldCorr / 2000;
                            AltHoldCorr %= 2000;
                            isAltHoldChanged = 1;
                        } else if (isAltHoldChanged) {
                            AltHold = EstAlt;
                            AltHoldCorr = 0;
                            isAltHoldChanged = 0;
                        }
                        rcCommand[THROTTLE] = initialThrottleHold + BaroPID;
                        rcCommand[THROTTLE] = constrain(rcCommand[THROTTLE], mcfg.minthrottle + 150, mcfg.maxthrottle);
                    }
                } else {
                    // handle fixedwing-related althold. UNTESTED! and probably wrong
                    // most likely need to check changes on pitch channel and 'reset' althold similar to
                    // how throttle does it on multirotor
                    rcCommand[PITCH] += BaroPID * mcfg.fixedwing_althold_dir;
                }
            }
        }

        if (cfg.throttle_correction_value && (f.ANGLE_MODE || f.HORIZON_MODE)) {
            rcCommand[THROTTLE] += throttleAngleCorrection;
        }

        if (sensors(SENSOR_GPS)) {
            if ((f.GPS_HOME_MODE || f.GPS_HOLD_MODE) && f.GPS_FIX_HOME) {
                updateGpsState();
            }
        }

        // PID - note this is function pointer set by setPIDController()
        pid_controller();

        mixTable();
        writeServos();
        writeMotors();

        // calculate rc stuff from serial-based receivers (spek/sbus)
        if (feature(FEATURE_SERIALRX)) {
            switch (mcfg.rxConfig.serialrx_type) {
                case SERIALRX_SPEKTRUM1024:
                case SERIALRX_SPEKTRUM2048:
                    rcReady = spektrumFrameComplete();
                    break;
                case SERIALRX_SBUS:
                    rcReady = sbusFrameComplete();
                    break;
                case SERIALRX_SUMD:
                    rcReady = sumdFrameComplete();
                    break;
            }
        }

        if (((int32_t)(currentTime - rcTime) >= 0) || rcReady) { // 50Hz or data driven
            rcReady = false;
            rcTime = currentTime + 20000;
            computeRC(&mcfg.rxConfig);

            // in 3D mode, we need to be able to disarm by switch at any time
            if (feature(FEATURE_3D)) {
                if (!rcOptions[BOXARM])
                    mwDisarm();
            }

            // Read value of AUX channel as rssi
            // 0 is disable, 1-4 is AUX{1..4}
            if (mcfg.rssi_aux_channel > 0) {
                const int16_t rssiChannelData = rcData[AUX1 + mcfg.rssi_aux_channel - 1];
                // Range of rssiChannelData is [1000;2000]. rssi should be in [0;1023];
                rssi = (uint16_t)((constrain(rssiChannelData - 1000, 0, 1000) / 1000.0f) * 1023.0f);
            }

            updateFailsafeState();

            // ------------------ STICKS COMMAND HANDLER --------------------
            // checking sticks positions
            for (i = 0; i < 4; i++) {
                stTmp >>= 2;
                if (rcData[i] > mcfg.rxConfig.mincheck)
                    stTmp |= 0x80;  // check for MIN
                if (rcData[i] < mcfg.rxConfig.maxcheck)
                    stTmp |= 0x40;  // check for MAX
            }
            if (stTmp == rcSticks) {
                if (rcDelayCommand < 250)
                    rcDelayCommand++;
            } else
                rcDelayCommand = 0;
            rcSticks = stTmp;

            // perform actions
            if (feature(FEATURE_3D) && (rcData[THROTTLE] > (mcfg.rxConfig.midrc - mcfg.deadband3d_throttle) && rcData[THROTTLE] < (mcfg.rxConfig.midrc + mcfg.deadband3d_throttle)))
                isThrottleLow = true;
            else if (!feature(FEATURE_3D) && (rcData[THROTTLE] < mcfg.rxConfig.mincheck))
                isThrottleLow = true;
            if (isThrottleLow) {
                errorGyroI[ROLL] = 0;
                errorGyroI[PITCH] = 0;
                errorGyroI[YAW] = 0;
                errorAngleI[ROLL] = 0;
                errorAngleI[PITCH] = 0;
                if (cfg.activate[BOXARM] > 0) { // Arming/Disarming via ARM BOX
                    if (rcOptions[BOXARM] && f.OK_TO_ARM)
                        mwArm();
                    else if (f.ARMED)
                        mwDisarm();
                }
            }

            if (rcDelayCommand == 20) {
                if (f.ARMED) {      // actions during armed
                    // Disarm on throttle down + yaw
                    if (cfg.activate[BOXARM] == 0 && (rcSticks == THR_LO + YAW_LO + PIT_CE + ROL_CE))
                        mwDisarm();
                    // Disarm on roll (only when retarded_arm is enabled)
                    if (mcfg.retarded_arm && cfg.activate[BOXARM] == 0 && (rcSticks == THR_LO + YAW_CE + PIT_CE + ROL_LO))
                        mwDisarm();
                } else {            // actions during not armed
                    i = 0;
                    // GYRO calibration
                    if (rcSticks == THR_LO + YAW_LO + PIT_LO + ROL_CE) {
                        calibratingG = CALIBRATING_GYRO_CYCLES;
                        if (feature(FEATURE_GPS))
                            GPS_reset_home_position();
                        if (sensors(SENSOR_BARO))
                            calibratingB = 10; // calibrate baro to new ground level (10 * 25 ms = ~250 ms non blocking)
                        if (!sensors(SENSOR_MAG))
                            heading = 0; // reset heading to zero after gyro calibration
                    // Inflight ACC Calibration
                    } else if (feature(FEATURE_INFLIGHT_ACC_CAL) && (rcSticks == THR_LO + YAW_LO + PIT_HI + ROL_HI)) {
                        if (AccInflightCalibrationMeasurementDone) {        // trigger saving into eeprom after landing
                            AccInflightCalibrationMeasurementDone = false;
                            AccInflightCalibrationSavetoEEProm = true;
                        } else {
                            AccInflightCalibrationArmed = !AccInflightCalibrationArmed;
                            if (AccInflightCalibrationArmed) {
                                toggleBeep = 2;
                            } else {
                                toggleBeep = 3;
                            }
                        }
                    }

                    // Multiple configuration profiles
                    if (rcSticks == THR_LO + YAW_LO + PIT_CE + ROL_LO)          // ROLL left  -> Profile 1
                        i = 1;
                    else if (rcSticks == THR_LO + YAW_LO + PIT_HI + ROL_CE)     // PITCH up   -> Profile 2
                        i = 2;
                    else if (rcSticks == THR_LO + YAW_LO + PIT_CE + ROL_HI)     // ROLL right -> Profile 3
                        i = 3;
                    if (i) {
                        mcfg.current_profile = i - 1;
                        writeEEPROM(0, false);
                        blinkLedAndSoundBeeper(2, 40, i);
                        // TODO alarmArray[0] = i;
                    }

                    // Arm via YAW
                    if (cfg.activate[BOXARM] == 0 && (rcSticks == THR_LO + YAW_HI + PIT_CE + ROL_CE))
                        mwArm();
                    // Arm via ROLL
                    else if (mcfg.retarded_arm && cfg.activate[BOXARM] == 0 && (rcSticks == THR_LO + YAW_CE + PIT_CE + ROL_HI))
                        mwArm();
                    // Calibrating Acc
                    else if (rcSticks == THR_HI + YAW_LO + PIT_LO + ROL_CE)
                        calibratingA = CALIBRATING_ACC_CYCLES;
                    // Calibrating Mag
                    else if (rcSticks == THR_HI + YAW_HI + PIT_LO + ROL_CE)
                        f.CALIBRATE_MAG = 1;
                    i = 0;
                    // Acc Trim
                    if (rcSticks == THR_HI + YAW_CE + PIT_HI + ROL_CE) {
                        cfg.angleTrim[PITCH] += 2;
                        i = 1;
                    } else if (rcSticks == THR_HI + YAW_CE + PIT_LO + ROL_CE) {
                        cfg.angleTrim[PITCH] -= 2;
                        i = 1;
                    } else if (rcSticks == THR_HI + YAW_CE + PIT_CE + ROL_HI) {
                        cfg.angleTrim[ROLL] += 2;
                        i = 1;
                    } else if (rcSticks == THR_HI + YAW_CE + PIT_CE + ROL_LO) {
                        cfg.angleTrim[ROLL] -= 2;
                        i = 1;
                    }
                    if (i) {
                        writeEEPROM(1, true);
                        rcDelayCommand = 0; // allow autorepetition
                    }
                }
            }

            if (feature(FEATURE_INFLIGHT_ACC_CAL)) {
                if (AccInflightCalibrationArmed && f.ARMED && rcData[THROTTLE] > mcfg.rxConfig.mincheck && !rcOptions[BOXARM]) {   // Copter is airborne and you are turning it off via boxarm : start measurement
                    InflightcalibratingA = 50;
                    AccInflightCalibrationArmed = false;
                }
                if (rcOptions[BOXCALIB]) {      // Use the Calib Option to activate : Calib = TRUE Meausrement started, Land and Calib = 0 measurement stored
                    if (!AccInflightCalibrationActive && !AccInflightCalibrationMeasurementDone)
                        InflightcalibratingA = 50;
                        AccInflightCalibrationActive = true;
                } else if (AccInflightCalibrationMeasurementDone && !f.ARMED) {
                    AccInflightCalibrationMeasurementDone = false;
                    AccInflightCalibrationSavetoEEProm = true;
                }
            }

            // Check AUX switches
            for (i = 0; i < 4; i++)
                auxState |= (rcData[AUX1 + i] < 1300) << (3 * i) | (1300 < rcData[AUX1 + i] && rcData[AUX1 + i] < 1700) << (3 * i + 1) | (rcData[AUX1 + i] > 1700) << (3 * i + 2);
            for (i = 0; i < CHECKBOX_ITEM_COUNT; i++)
                rcOptions[i] = (auxState & cfg.activate[i]) > 0;

            // note: if FAILSAFE is disable, hasFailsafeTimerElapsed() is always false
            if ((rcOptions[BOXANGLE] || hasFailsafeTimerElapsed()) && (sensors(SENSOR_ACC))) {
                // bumpless transfer to Level mode
                if (!f.ANGLE_MODE) {
                    errorAngleI[ROLL] = 0;
                    errorAngleI[PITCH] = 0;
                    f.ANGLE_MODE = 1;
                }
            } else {
                f.ANGLE_MODE = 0;        // failsave support
            }

            if (rcOptions[BOXHORIZON]) {
                f.ANGLE_MODE = 0;
                if (!f.HORIZON_MODE) {
                    errorAngleI[ROLL] = 0;
                    errorAngleI[PITCH] = 0;
                    f.HORIZON_MODE = 1;
                }
            } else {
                f.HORIZON_MODE = 0;
            }

            if ((rcOptions[BOXARM]) == 0)
                f.OK_TO_ARM = 1;
            if (f.ANGLE_MODE || f.HORIZON_MODE) {
                LED1_ON;
            } else {
                LED1_OFF;
            }

            if (sensors(SENSOR_BARO)) {
                // Baro alt hold activate
                if (rcOptions[BOXBARO]) {
                    if (!f.BARO_MODE) {
                        f.BARO_MODE = 1;
                        AltHold = EstAlt;
                        initialThrottleHold = rcCommand[THROTTLE];
                        errorAltitudeI = 0;
                        BaroPID = 0;
                    }
                } else {
                    f.BARO_MODE = 0;
                }
                // Vario signalling activate
                if (feature(FEATURE_VARIO)) {
                    if (rcOptions[BOXVARIO]) {
                        if (!f.VARIO_MODE) {
                            f.VARIO_MODE = 1;
                        }
                    } else {
                        f.VARIO_MODE = 0;
                    }
                }
            }


            if (sensors(SENSOR_ACC) || sensors(SENSOR_MAG)) {
                if (rcOptions[BOXMAG]) {
                    if (!f.MAG_MODE) {
                        f.MAG_MODE = 1;
                        magHold = heading;
                    }
                } else {
                    f.MAG_MODE = 0;
                }
                if (rcOptions[BOXHEADFREE]) {
                    if (!f.HEADFREE_MODE) {
                        f.HEADFREE_MODE = 1;
                    }
                } else {
                    f.HEADFREE_MODE = 0;
                }
                if (rcOptions[BOXHEADADJ]) {
                    headFreeModeHold = heading; // acquire new heading
                }
            }


            if (sensors(SENSOR_GPS)) {
                if (f.GPS_FIX && GPS_numSat >= 5) {
                    // if both GPS_HOME & GPS_HOLD are checked => GPS_HOME is the priority
                    if (rcOptions[BOXGPSHOME]) {
                        if (!f.GPS_HOME_MODE) {
                            f.GPS_HOME_MODE = 1;
                            f.GPS_HOLD_MODE = 0;
                            GPSNavReset = 0;
                            GPS_set_next_wp(&GPS_home[LAT], &GPS_home[LON]);
                            nav_mode = NAV_MODE_WP;
                        }
                    } else {
                        f.GPS_HOME_MODE = 0;
                        if (rcOptions[BOXGPSHOLD] && abs(rcCommand[ROLL]) < cfg.ap_mode && abs(rcCommand[PITCH]) < cfg.ap_mode) {
                            if (!f.GPS_HOLD_MODE) {
                                f.GPS_HOLD_MODE = 1;
                                GPSNavReset = 0;
                                GPS_hold[LAT] = GPS_coord[LAT];
                                GPS_hold[LON] = GPS_coord[LON];
                                GPS_set_next_wp(&GPS_hold[LAT], &GPS_hold[LON]);
                                nav_mode = NAV_MODE_POSHOLD;
                            }
                        } else {
                            f.GPS_HOLD_MODE = 0;
                            // both boxes are unselected here, nav is reset if not already done
                            if (GPSNavReset == 0) {
                                GPSNavReset = 1;
                                GPS_reset_nav();
                            }
                        }
                    }
                } else {
                    f.GPS_HOME_MODE = 0;
                    f.GPS_HOLD_MODE = 0;
                    nav_mode = NAV_MODE_NONE;
                }
            }

            if (rcOptions[BOXPASSTHRU]) {
                f.PASSTHRU_MODE = 1;
            } else {
                f.PASSTHRU_MODE = 0;
            }

            if (mcfg.mixerConfiguration == MULTITYPE_FLYING_WING || mcfg.mixerConfiguration == MULTITYPE_AIRPLANE) {
                f.HEADFREE_MODE = 0;
            }
        } else {                    // not in rc loop
            static int taskOrder = 0;    // never call all function in the same loop, to avoid high delay spikes
            switch (taskOrder) {
            case 0:
                taskOrder++;
                if (sensors(SENSOR_MAG) && Mag_getADC())
                    break;
            case 1:
                taskOrder++;
                if (sensors(SENSOR_BARO) && Baro_update())
                    break;
            case 2:
                taskOrder++;
                if (sensors(SENSOR_BARO) && getEstimatedAltitude())
                    break;
            case 3:
                // if GPS feature is enabled, gpsThread() will be called at some intervals to check for stuck
                // hardware, wrong baud rates, init GPS if needed, etc. Don't use SENSOR_GPS here as gpsThread() can and will
                // change this based on available hardware
                taskOrder++;
                if (feature(FEATURE_GPS)) {
                    gpsThread();
                    break;
                }
            case 4:
                taskOrder = 0;
                if (sensors(SENSOR_SONAR)) {
                    Sonar_update();
                }
                if (feature(FEATURE_VARIO) && f.VARIO_MODE)
                    mwVario();
                break;
            }
        }


    }
}
