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

#include <stdint.h>
#include <math.h>

extern "C" {
    #include "build_config.h"
    #include "debug.h"

    #include "common/axis.h"
    #include "common/maths.h"

    #include "drivers/sensor.h"
    #include "drivers/accgyro.h"
    #include "sensors/sensors.h"
    #include "sensors/acceleration.h"

    #include "rx/rx.h"
    #include "io/rc_controls.h"

    #include "flight/pid.h"
    #include "flight/imu.h"

    #include "config/runtime_config.h"
    #include "config/config_unittest.h"
}

#include "unittest_macros.h"
#include "gtest/gtest.h"

extern "C" {
    void pidSetController(pidControllerType_e type);
    typedef void (*pidControllerFuncPtr)(pidProfile_t *pidProfile, controlRateConfig_t *controlRateConfig,
            uint16_t max_angle_inclination, rollAndPitchTrims_t *angleTrim, rxConfig_t *rxConfig);            // pid controller function prototype
    extern pidControllerFuncPtr pid_controller;
    extern uint8_t PIDweight[3];
    float dT = 0.1f; // normalised dT for pidLuxFloat
    int32_t cycleTime = 2048; // normalised cycleTime for pidMultiWiiRewrite
    float unittest_pidLuxFloat_lastError[3];
    float unittest_pidLuxFloat_PTerm[3];
    float unittest_pidLuxFloat_ITerm[3];
    float unittest_pidLuxFloat_DTerm[3];
    int32_t unittest_pidMultiWiiRewrite_PTerm[3];
    int32_t unittest_pidMultiWiiRewrite_ITerm[3];
    int32_t unittest_pidMultiWiiRewrite_DTerm[3];
}

void resetPidProfile(pidProfile_t *pidProfile)
{
    pidProfile->pidController = 1;

    pidProfile->P8[PIDROLL] = 40;
    pidProfile->I8[PIDROLL] = 30;
    pidProfile->D8[PIDROLL] = 23;
    pidProfile->P8[PIDPITCH] = 40;
    pidProfile->I8[PIDPITCH] = 30;
    pidProfile->D8[PIDPITCH] = 23;
    pidProfile->P8[PIDYAW] = 85;
    pidProfile->I8[PIDYAW] = 45;
    pidProfile->D8[PIDYAW] = 0;
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
    pidProfile->gyro_soft_lpf = 0;   // no filtering by default
    pidProfile->yaw_pterm_cut_hz = 0;
    pidProfile->dterm_cut_hz = 0;

    pidProfile->P_f[FD_ROLL] = 1.4f;     // new PID with preliminary defaults test carefully
    pidProfile->I_f[FD_ROLL] = 0.4f;
    pidProfile->D_f[FD_ROLL] = 0.03f;
    pidProfile->P_f[FD_PITCH] = 1.4f;
    pidProfile->I_f[FD_PITCH] = 0.4f;
    pidProfile->D_f[FD_PITCH] = 0.03f;
    pidProfile->P_f[FD_YAW] = 3.5f;
    pidProfile->I_f[FD_YAW] = 0.4f;
    pidProfile->D_f[FD_YAW] = 0.01f;
    pidProfile->A_level = 5.0f;
    pidProfile->H_level = 3.0f;
    pidProfile->H_sensitivity = 75;

#ifdef GTUNE
    pidProfile->gtune_lolimP[FD_ROLL] = 10;          // [0..200] Lower limit of ROLL P during G tune.
    pidProfile->gtune_lolimP[FD_PITCH] = 10;         // [0..200] Lower limit of PITCH P during G tune.
    pidProfile->gtune_lolimP[FD_YAW] = 10;           // [0..200] Lower limit of YAW P during G tune.
    pidProfile->gtune_hilimP[FD_ROLL] = 100;         // [0..200] Higher limit of ROLL P during G tune. 0 Disables tuning for that axis.
    pidProfile->gtune_hilimP[FD_PITCH] = 100;        // [0..200] Higher limit of PITCH P during G tune. 0 Disables tuning for that axis.
    pidProfile->gtune_hilimP[FD_YAW] = 100;          // [0..200] Higher limit of YAW P during G tune. 0 Disables tuning for that axis.
    pidProfile->gtune_pwr = 0;                    // [0..10] Strength of adjustment
    pidProfile->gtune_settle_time = 450;          // [200..1000] Settle time in ms
    pidProfile->gtune_average_cycles = 16;        // [8..128] Number of looptime cycles used for gyro average calculation
#endif
}

void pidControllerInitLuxFloat(pidProfile_t *pidProfile, controlRateConfig_t *controlRate, uint16_t max_angle_inclination, rollAndPitchTrims_t *rollAndPitchTrims, rxConfig_t *rxConfig)
{
    UNUSED(max_angle_inclination);
    UNUSED(rxConfig);

    resetPidProfile(pidProfile);
    controlRate->rates[ROLL] = 80;
    controlRate->rates[PITCH] = 80;
    controlRate->rates[YAW] = 90;
    resetRollAndPitchTrims(rollAndPitchTrims);
    pidResetErrorAngle();
    pidResetErrorGyro();
    // set up the PIDWeights to 100%, so they are neutral in the tests
    PIDweight[FD_ROLL] = 100;
    PIDweight[FD_PITCH] = 100;
    PIDweight[FD_YAW] = 100;
    unittest_pidLuxFloat_lastError[FD_ROLL] = 0.0f;
    unittest_pidLuxFloat_lastError[FD_PITCH] = 0.0f;
    unittest_pidLuxFloat_lastError[FD_YAW] = 0.0f;
}

/*
 * calculate the value of rcCommand[ROLL] required to give a desired rateError
 */
int16_t calcRcCommandRoll(float rateError, const controlRateConfig_t *controlRate) {
    return 50.0f * rateError / (controlRate->rates[ROLL] + 20);
}

/*
 * calculate the angleRate as done in pidLuxFloat, used for cross checking
 */
float calcAngleRateRoll(const controlRateConfig_t *controlRate) {
    return ((controlRate->rates[ROLL] + 20) * rcCommand[ROLL]) / 50.0f;
}

/*
 * calculate the value of rcCommand[PITCH] required to give a desired rateError
 */
int16_t calcRcCommandPitch(float rateError, const controlRateConfig_t *controlRate) {
    return 50.0f * rateError / (controlRate->rates[PITCH] + 20);
}

/*
 * calculate the angleRate as done in pidLuxFloat, used for cross checking
 */
float calcAngleRatePitch(const controlRateConfig_t *controlRate) {
    return ((controlRate->rates[PITCH] + 20) * rcCommand[PITCH]) / 50.0f;
}

/*
 * calculate the value of rcCommand[YAW] required to give a desired rateError
 */
int16_t calcRcCommandYaw(float rateError, const controlRateConfig_t *controlRate) {
    return 50.0f * rateError / (controlRate->rates[YAW] + 10);
}

/*
 * calculate the angleRate as done in pidLuxFloat, used for cross checking
 */
float calcAngleRateYaw(const controlRateConfig_t *controlRate) {
    return ((controlRate->rates[YAW] + 10) * rcCommand[YAW]) / 50.0f;
}
float calcPTerm(pidProfile_t *pidProfile, flight_dynamics_index_t axis, float rateError) {
    return pidProfile->P_f[axis] * rateError;
}

float calcITerm(pidProfile_t *pidProfile, flight_dynamics_index_t axis, float rateError) {
    return pidProfile->I_f[axis] * rateError * dT * 10;
}

float calcDTerm(pidProfile_t *pidProfile, flight_dynamics_index_t axis, float rateError) {
    return pidProfile->D_f[axis] * rateError * 1.0f / dT;
}

TEST(PIDUnittest, TestPidLuxFloat)
{
    pidProfile_t pidProfile;
    controlRateConfig_t controlRate;
    const uint16_t max_angle_inclination = 500; // 50 degrees
    rollAndPitchTrims_t rollAndPitchTrims;
    rxConfig_t rxConfig;

    pidSetController(PID_CONTROLLER_LUX_FLOAT);
    pidControllerInitLuxFloat(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);

    // set up for rateError of zero on all axes
    rcCommand[ROLL] = calcRcCommandRoll(0, &controlRate);
    rcCommand[PITCH] = calcRcCommandPitch(0, &controlRate);
    rcCommand[YAW] = calcRcCommandYaw(0, &controlRate);
    pid_controller(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);
    EXPECT_EQ(0, unittest_pidLuxFloat_PTerm[FD_ROLL]);
    EXPECT_EQ(0, unittest_pidLuxFloat_ITerm[FD_ROLL]);
    EXPECT_EQ(0, unittest_pidLuxFloat_DTerm[FD_ROLL]);
    EXPECT_EQ(0, unittest_pidLuxFloat_PTerm[FD_PITCH]);
    EXPECT_EQ(0, unittest_pidLuxFloat_ITerm[FD_PITCH]);
    EXPECT_EQ(0, unittest_pidLuxFloat_DTerm[FD_PITCH]);
    EXPECT_EQ(0, unittest_pidLuxFloat_PTerm[FD_YAW]);
    EXPECT_EQ(0, unittest_pidLuxFloat_ITerm[FD_YAW]);
    EXPECT_EQ(0, unittest_pidLuxFloat_DTerm[FD_YAW]);

    // set up an rateError of 100 on the roll axis
    rcCommand[ROLL] = calcRcCommandRoll(100, &controlRate);
    const float rateErrorRoll = calcAngleRateRoll(&controlRate);
    EXPECT_EQ(100, rateErrorRoll);// cross check

    // set up an rateError of 100 on the pitch axis
    rcCommand[PITCH] = calcRcCommandPitch(100, &controlRate);
    const float rateErrorPitch = calcAngleRatePitch(&controlRate);
    EXPECT_EQ(100, rateErrorPitch); // cross check

    // set up an rateError of 100 on the yaw axis
    rcCommand[YAW] = calcRcCommandYaw(100, &controlRate);
    const float rateErrorYaw = calcAngleRateYaw(&controlRate);
    EXPECT_EQ(100, rateErrorYaw); // cross check

    // run the PID controller. Check expected PID values
    // Note D value is multiplied by 1/3 because it is part of 3 point moving average, first two terms initially zero.
    pid_controller(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);
    EXPECT_FLOAT_EQ(calcPTerm(&pidProfile, FD_ROLL, rateErrorRoll), unittest_pidLuxFloat_PTerm[FD_ROLL]);
    EXPECT_FLOAT_EQ(calcITerm(&pidProfile, FD_ROLL, rateErrorRoll), unittest_pidLuxFloat_ITerm[FD_ROLL]); // I values are multiplied by 10
    EXPECT_FLOAT_EQ(calcDTerm(&pidProfile, FD_ROLL, rateErrorRoll) / 3.0f, unittest_pidLuxFloat_DTerm[FD_ROLL]);
    EXPECT_FLOAT_EQ(calcPTerm(&pidProfile, FD_PITCH, rateErrorPitch), unittest_pidLuxFloat_PTerm[FD_PITCH]);
    EXPECT_FLOAT_EQ(calcITerm(&pidProfile, FD_PITCH, rateErrorPitch), unittest_pidLuxFloat_ITerm[FD_PITCH]); // I values are multiplied by 10
    EXPECT_FLOAT_EQ(calcDTerm(&pidProfile, FD_PITCH, rateErrorPitch) / 3.0f, unittest_pidLuxFloat_DTerm[FD_PITCH]);
    EXPECT_FLOAT_EQ(calcPTerm(&pidProfile, FD_YAW, rateErrorYaw), unittest_pidLuxFloat_PTerm[FD_YAW]);
    EXPECT_FLOAT_EQ(calcITerm(&pidProfile, FD_YAW, rateErrorYaw), unittest_pidLuxFloat_ITerm[FD_YAW]); // I values are multiplied by 10
    EXPECT_FLOAT_EQ(calcDTerm(&pidProfile, FD_YAW, rateErrorYaw) / 3.0f, unittest_pidLuxFloat_DTerm[FD_YAW]);

    // run the PID controller a second time.
    // Error rates unchanged, so expect P unchanged, I integrated and D multiplied by 1/3 (2 of 3 terms in moving average are zero)
    pid_controller(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);
    EXPECT_FLOAT_EQ(calcPTerm(&pidProfile, FD_ROLL, rateErrorRoll), unittest_pidLuxFloat_PTerm[FD_ROLL]);
    EXPECT_FLOAT_EQ(2 * calcITerm(&pidProfile, FD_ROLL, rateErrorRoll), unittest_pidLuxFloat_ITerm[FD_ROLL]); // I values are multiplied by 10
    EXPECT_FLOAT_EQ(calcDTerm(&pidProfile, FD_ROLL, rateErrorRoll) / 3.0f, unittest_pidLuxFloat_DTerm[FD_ROLL]);
    EXPECT_FLOAT_EQ(calcPTerm(&pidProfile, FD_PITCH, rateErrorPitch), unittest_pidLuxFloat_PTerm[FD_PITCH]);
    EXPECT_FLOAT_EQ(2 * calcITerm(&pidProfile, FD_PITCH, rateErrorPitch), unittest_pidLuxFloat_ITerm[FD_PITCH]); // I values are multiplied by 10
    EXPECT_FLOAT_EQ(calcDTerm(&pidProfile, FD_PITCH, rateErrorPitch) / 3.0f, unittest_pidLuxFloat_DTerm[FD_PITCH]);

    // run the PID controller a third time. Error rates unchanged, so expect P and D unchanged, I integrated
    // Error rates unchanged, so expect P unchanged, I integrated and D multiplied by 1/3 (2 of 3 terms in moving average are zero)
    pid_controller(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);
    EXPECT_FLOAT_EQ(calcPTerm(&pidProfile, FD_ROLL, rateErrorRoll), unittest_pidLuxFloat_PTerm[FD_ROLL]);
    EXPECT_FLOAT_EQ(3 * calcITerm(&pidProfile, FD_ROLL, rateErrorRoll), unittest_pidLuxFloat_ITerm[FD_ROLL]); // I values are multiplied by 10
    EXPECT_FLOAT_EQ(calcDTerm(&pidProfile, FD_ROLL, rateErrorRoll) / 3.0f, unittest_pidLuxFloat_DTerm[FD_ROLL]);
    EXPECT_FLOAT_EQ(calcPTerm(&pidProfile, FD_PITCH, rateErrorPitch), unittest_pidLuxFloat_PTerm[FD_PITCH]);
    EXPECT_FLOAT_EQ(3 * calcITerm(&pidProfile, FD_PITCH, rateErrorPitch), unittest_pidLuxFloat_ITerm[FD_PITCH]); // I values are multiplied by 10
    EXPECT_FLOAT_EQ(calcDTerm(&pidProfile, FD_PITCH, rateErrorPitch) / 3.0f, unittest_pidLuxFloat_DTerm[FD_PITCH]);

    // run the PID controller a fourth time.
    // Error rates unchanged, so expect P unchanged, I integrated and D zero, since all terms in moving average are now zero
    pid_controller(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);
    EXPECT_FLOAT_EQ(calcPTerm(&pidProfile, FD_ROLL, rateErrorRoll), unittest_pidLuxFloat_PTerm[FD_ROLL]);
    EXPECT_FLOAT_EQ(4 * calcITerm(&pidProfile, FD_ROLL, rateErrorRoll), unittest_pidLuxFloat_ITerm[FD_ROLL]); // I values are multiplied by 10
    EXPECT_FLOAT_EQ(0, unittest_pidLuxFloat_DTerm[FD_ROLL]);
    EXPECT_FLOAT_EQ(calcPTerm(&pidProfile, FD_PITCH, rateErrorPitch), unittest_pidLuxFloat_PTerm[FD_PITCH]);
    EXPECT_FLOAT_EQ(4 * calcITerm(&pidProfile, FD_PITCH, rateErrorPitch), unittest_pidLuxFloat_ITerm[FD_PITCH]); // I values are multiplied by 10
    EXPECT_FLOAT_EQ(0, unittest_pidLuxFloat_DTerm[FD_PITCH]);
}

TEST(PIDUnittest, TestPidLuxFloatIntegrationForLinearFunction)
{
    pidProfile_t pidProfile;
    controlRateConfig_t controlRate;
    const uint16_t max_angle_inclination = 500; // 50 degrees
    rollAndPitchTrims_t rollAndPitchTrims;
    rxConfig_t rxConfig;

    pidSetController(PID_CONTROLLER_LUX_FLOAT);
    pidControllerInitLuxFloat(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);

    // Test PID integration for a linear function:
    //    rateError = k * t
    // Integral:
    //    IrateError = 0.5 * k * t ^ 2
    // dT = 0.1s, t ranges from 0.0 to 1.0 in steps of 0.1s

    // set up an rateError of 0 on the roll axis
    const float k = 100; // arbitrary value of k
    float t = 0.0f;
    rcCommand[ROLL] = calcRcCommandRoll(k * t, &controlRate);
    EXPECT_FLOAT_EQ(k * t, calcAngleRateRoll(&controlRate)); // cross check
    pid_controller(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);
    float ITermRaw = 0.5 * k * t * t; // calculate integral
    float ITerm = ITermRaw * pidProfile.I_f[ROLL] * 10; // scale using PID value
    EXPECT_FLOAT_EQ(ITerm, unittest_pidLuxFloat_ITerm[FD_ROLL]);

    const float epsilon = 0.0001;// to allow for rounding errors in float comparisons
    for (int ii = 1; ii <= 10;++ii) {
        t += dT;
        rcCommand[ROLL] = calcRcCommandRoll(k * t, &controlRate);
        EXPECT_FLOAT_EQ(k * t, calcAngleRateRoll(&controlRate)); // cross check
        pid_controller(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);
        ITermRaw = 0.5 * k * t * t; // calculate integral
        ITerm =  ITermRaw * pidProfile.I_f[FD_ROLL] * 10; // scale using PID value
        // pidLuxFloat uses rectangular method of integration, so for an monotonically increasing function (eg rateError = k * t) it overestimates the integral
        const float ITermError = unittest_pidLuxFloat_ITerm[FD_ROLL] - ITerm;
        EXPECT_LE(0 - epsilon, ITermError);
    }
}

TEST(PIDUnittest, TestPidMultiWiiRewrite)
{
    pidProfile_t pidProfile;
    resetPidProfile(&pidProfile);

    controlRateConfig_t controlRate;

    const uint16_t max_angle_inclination = 500; // 50 degrees
    rollAndPitchTrims_t rollAndPitchTrims;
    resetRollAndPitchTrims(&rollAndPitchTrims);
    rxConfig_t rxConfig;
    pidSetController(PID_CONTROLLER_MWREWRITE);

    // set up the PIDWeights to 100%, so they are neutral in the tests
    PIDweight[FD_ROLL] = 100;
    PIDweight[FD_PITCH] = 100;
    PIDweight[FD_YAW] = 100;

    // set up for rateError of zero on all axes
    rcCommand[ROLL] = 0;
    controlRate.rates[ROLL] = 0;
    rcCommand[PITCH] = 0;
    controlRate.rates[PITCH] = 0;
    rcCommand[YAW] = 0;
    controlRate.rates[YAW] = 0;
    pid_controller(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);
    EXPECT_EQ(0, unittest_pidMultiWiiRewrite_PTerm[FD_ROLL]);
    EXPECT_EQ(0, unittest_pidMultiWiiRewrite_ITerm[FD_ROLL]);
    EXPECT_EQ(0, unittest_pidMultiWiiRewrite_DTerm[FD_ROLL]);
    EXPECT_EQ(0, unittest_pidMultiWiiRewrite_PTerm[FD_PITCH]);
    EXPECT_EQ(0, unittest_pidMultiWiiRewrite_ITerm[FD_PITCH]);
    EXPECT_EQ(0, unittest_pidMultiWiiRewrite_DTerm[FD_PITCH]);
    EXPECT_EQ(0, unittest_pidMultiWiiRewrite_PTerm[FD_YAW]);
    EXPECT_EQ(0, unittest_pidMultiWiiRewrite_ITerm[FD_YAW]);
    EXPECT_EQ(0, unittest_pidMultiWiiRewrite_DTerm[FD_YAW]);

    // set up an rateError of 1000 on the roll axis
    rcCommand[ROLL] = 160;
    controlRate.rates[ROLL] = 73;
    const int32_t rateErrorRoll = ((int32_t)(controlRate.rates[ROLL] + 27) * rcCommand[ROLL]) >> 4;
    EXPECT_EQ(1000, rateErrorRoll);
    // set up an rateError of 1000 on the pitch axis
    rcCommand[PITCH] = 160;
    controlRate.rates[PITCH] = 73;
    const int32_t rateErrorPitch = ((int32_t)(controlRate.rates[PITCH] + 27) * rcCommand[PITCH]) >> 4;
    EXPECT_EQ(1000, rateErrorPitch);
    // set up an rateError of 1000 on the yaw axis
    rcCommand[YAW] = 320;
    controlRate.rates[YAW] = 73;
    const int32_t rateErrorYaw = ((int32_t)(controlRate.rates[YAW] + 27) * rcCommand[YAW]) >> 5;
    EXPECT_EQ(1000, rateErrorYaw);

    // run the PID controller. Check expected PID values
    pid_controller(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);
    EXPECT_EQ((pidProfile.P8[PIDROLL] * rateErrorRoll) / 128, unittest_pidMultiWiiRewrite_PTerm[FD_ROLL]);
    EXPECT_EQ(pidProfile.I8[PIDROLL]  * (rateErrorRoll * cycleTime / 2048) / 8192, unittest_pidMultiWiiRewrite_ITerm[FD_ROLL]);
    EXPECT_EQ((pidProfile.D8[PIDROLL] * (rateErrorRoll * ((uint16_t) 0xFFFF / (cycleTime / 16))) / 64) / 256, unittest_pidMultiWiiRewrite_DTerm[FD_ROLL]);
    EXPECT_EQ((pidProfile.P8[PIDPITCH] * rateErrorRoll) / 128, unittest_pidMultiWiiRewrite_PTerm[FD_PITCH]);
    EXPECT_EQ(pidProfile.I8[PIDPITCH]  * (rateErrorRoll * cycleTime / 2048) / 8192, unittest_pidMultiWiiRewrite_ITerm[FD_PITCH]);
    EXPECT_EQ((pidProfile.D8[PIDPITCH] * (rateErrorRoll * ((uint16_t) 0xFFFF / (cycleTime / 16))) / 64) / 256, unittest_pidMultiWiiRewrite_DTerm[FD_PITCH]);
    EXPECT_EQ((pidProfile.P8[PIDYAW] * rateErrorRoll) / 128, unittest_pidMultiWiiRewrite_PTerm[FD_YAW]);
    EXPECT_EQ(pidProfile.I8[PIDYAW]  * (rateErrorRoll * cycleTime / 2048) / 8192, unittest_pidMultiWiiRewrite_ITerm[FD_YAW]);
    EXPECT_EQ((pidProfile.D8[PIDYAW] * (rateErrorRoll * ((uint16_t) 0xFFFF / (cycleTime / 16))) / 64) / 256, unittest_pidMultiWiiRewrite_DTerm[FD_YAW]);
}

extern "C" {
int16_t GPS_angle[ANGLE_INDEX_COUNT] = { 0, 0 };
int32_t getRcStickDeflection(int32_t axis, uint16_t midrc) {return MIN(ABS(rcData[axis] - midrc), 500);}
attitudeEulerAngles_t attitude = { { 0, 0, 0 } };
void resetRollAndPitchTrims(rollAndPitchTrims_t *rollAndPitchTrims) {rollAndPitchTrims->values.roll = 0;rollAndPitchTrims->values.pitch = 0;};
uint16_t flightModeFlags = 0; // acro mode
uint8_t motorCount = 4;
gyro_t gyro;
int16_t gyroADC[XYZ_AXIS_COUNT];
int16_t rcCommand[4] = {1500,0,0,0};           // interval [1000;2000] for THROTTLE and [-500;+500] for ROLL/PITCH/YAW
int16_t rcData[MAX_SUPPORTED_RC_CHANNEL_COUNT];     // interval [1000;2000]
}
