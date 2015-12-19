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
}

#include "unittest_macros.h"
#include "gtest/gtest.h"

extern "C" {
    void pidSetController(pidControllerType_e type);
    typedef void (*pidControllerFuncPtr)(pidProfile_t *pidProfile, controlRateConfig_t *controlRateConfig,
            uint16_t max_angle_inclination, rollAndPitchTrims_t *angleTrim, rxConfig_t *rxConfig);            // pid controller function prototype
    extern pidControllerFuncPtr pid_controller;
    extern uint8_t PIDweight[3];
    float dT = 0.001f; // seconds, same as cycleTime
}

void resetPidProfile(pidProfile_t *pidProfile)
{
    pidProfile->pidController = 1;

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
    pidProfile->gyro_soft_lpf = 0;   // no filtering by default
    pidProfile->yaw_pterm_cut_hz = 0;
    pidProfile->dterm_cut_hz = 0;

    pidProfile->P_f[ROLL] = 1.4f;     // new PID with preliminary defaults test carefully
    pidProfile->I_f[ROLL] = 0.4f;
    pidProfile->D_f[ROLL] = 0.03f;
    pidProfile->P_f[PITCH] = 1.4f;
    pidProfile->I_f[PITCH] = 0.4f;
    pidProfile->D_f[PITCH] = 0.03f;
    pidProfile->P_f[YAW] = 3.5f;
    pidProfile->I_f[YAW] = 0.4f;
    pidProfile->D_f[YAW] = 0.01f;
    pidProfile->A_level = 5.0f;
    pidProfile->H_level = 3.0f;
    pidProfile->H_sensitivity = 75;

#ifdef GTUNE
    pidProfile->gtune_lolimP[ROLL] = 10;          // [0..200] Lower limit of ROLL P during G tune.
    pidProfile->gtune_lolimP[PITCH] = 10;         // [0..200] Lower limit of PITCH P during G tune.
    pidProfile->gtune_lolimP[YAW] = 10;           // [0..200] Lower limit of YAW P during G tune.
    pidProfile->gtune_hilimP[ROLL] = 100;         // [0..200] Higher limit of ROLL P during G tune. 0 Disables tuning for that axis.
    pidProfile->gtune_hilimP[PITCH] = 100;        // [0..200] Higher limit of PITCH P during G tune. 0 Disables tuning for that axis.
    pidProfile->gtune_hilimP[YAW] = 100;          // [0..200] Higher limit of YAW P during G tune. 0 Disables tuning for that axis.
    pidProfile->gtune_pwr = 0;                    // [0..10] Strength of adjustment
    pidProfile->gtune_settle_time = 450;          // [200..1000] Settle time in ms
    pidProfile->gtune_average_cycles = 16;        // [8..128] Number of looptime cycles used for gyro average calculation
#endif
}


TEST(PIDUnittest, TestLuxFloat)
{
    pidProfile_t pidProfile;
    resetPidProfile(&pidProfile);

    controlRateConfig_t controlRate;

    const uint16_t max_angle_inclination = 500; // 50 degrees
    rollAndPitchTrims_t rollAndPitchTrims;
    resetRollAndPitchTrims(&rollAndPitchTrims);
    rxConfig_t rxConfig;
    pidSetController(PID_CONTROLLER_LUX_FLOAT);

    // set up the PIDWeights to 100%, so they are neutral in the tests
    PIDweight[FD_ROLL] = 100;
    PIDweight[FD_PITCH] = 100;
    PIDweight[FD_YAW] = 100;

    // set up for RateError of zero on all axes
    rcCommand[FD_ROLL] = 0;
    controlRate.rates[ROLL] = 0;
    rcCommand[FD_PITCH] = 0;
    controlRate.rates[PITCH] = 0;
    rcCommand[FD_YAW] = 0;
    controlRate.rates[YAW] = 0;
    pid_controller(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);
    EXPECT_EQ(0, axisPID_P[FD_ROLL]);
    EXPECT_EQ(0, axisPID_I[FD_ROLL]);
    EXPECT_EQ(0, axisPID_D[FD_ROLL]);
    EXPECT_EQ(0, axisPID_P[FD_PITCH]);
    EXPECT_EQ(0, axisPID_I[FD_PITCH]);
    EXPECT_EQ(0, axisPID_D[FD_PITCH]);
    EXPECT_EQ(0, axisPID_P[FD_YAW]);
    EXPECT_EQ(0, axisPID_I[FD_YAW]);
    EXPECT_EQ(0, axisPID_D[FD_YAW]);

    // set up an RateError of 100 on the roll and pitch axes, this should be reflected directly in the PIDs
    rcCommand[FD_ROLL] = 500;
    controlRate.rates[ROLL] = 80;
    float rateErrorRoll = ((controlRate.rates[FD_ROLL] + 20) * rcCommand[FD_ROLL]) / 50.0f; // for FD_ROLL and FD_PITCH
    EXPECT_EQ(1000, rateErrorRoll);
    rcCommand[FD_PITCH] = 500;
    controlRate.rates[FD_PITCH] = 80;
    float rateErrorPitch = ((controlRate.rates[FD_PITCH] + 20) * rcCommand[FD_PITCH]) / 50.0f; // for FD_ROLL and FD_PITCH
    EXPECT_EQ(1000, rateErrorPitch);

    pid_controller(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);
    EXPECT_FLOAT_EQ(pidProfile.P_f[ROLL] * rateErrorRoll, axisPID_P[FD_ROLL]);
    EXPECT_FLOAT_EQ(pidProfile.I_f[ROLL] * rateErrorRoll * dT * 10.0, axisPID_I[FD_ROLL]); // I values are multiplied by 10
    EXPECT_FLOAT_EQ(pidProfile.D_f[ROLL] * rateErrorRoll * 10.0, axisPID_D[FD_ROLL]); // D values are multiplied by 10
    EXPECT_FLOAT_EQ(pidProfile.P_f[PITCH] * rateErrorPitch, axisPID_P[FD_PITCH]);
    EXPECT_FLOAT_EQ(pidProfile.I_f[PITCH] * rateErrorPitch * dT * 10.0, axisPID_I[FD_PITCH]);
    EXPECT_FLOAT_EQ(pidProfile.D_f[PITCH] * rateErrorPitch * 10.0, axisPID_D[FD_PITCH]);

    // run the PID controller a second time. Error rates unchanged, so expect P and D unchanged, I integrated
    pid_controller(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);
    EXPECT_FLOAT_EQ(pidProfile.P_f[ROLL] * rateErrorRoll, axisPID_P[FD_ROLL]);
    EXPECT_FLOAT_EQ(2 * pidProfile.I_f[ROLL] * rateErrorRoll * dT * 10.0, axisPID_I[FD_ROLL]); // I values are multiplied by 10
    EXPECT_FLOAT_EQ(pidProfile.D_f[ROLL] * rateErrorRoll * 10.0, axisPID_D[FD_ROLL]); // D values are multiplied by 10
    EXPECT_FLOAT_EQ(pidProfile.P_f[PITCH] * rateErrorPitch, axisPID_P[FD_PITCH]);
    EXPECT_FLOAT_EQ(2 * pidProfile.I_f[PITCH] * rateErrorPitch * dT * 10.0, axisPID_I[FD_PITCH]);
    EXPECT_FLOAT_EQ(pidProfile.D_f[PITCH] * rateErrorPitch * 10.0, axisPID_D[FD_PITCH]);

    // run the PID controller a third time. Error rates unchanged, so expect P and D unchanged, I integrated
    pid_controller(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);
    EXPECT_FLOAT_EQ(pidProfile.P_f[ROLL] * rateErrorRoll, axisPID_P[FD_ROLL]);
    EXPECT_FLOAT_EQ(3 * pidProfile.I_f[ROLL] * rateErrorRoll * dT * 10.0, axisPID_I[FD_ROLL]); // I values are multiplied by 10
    EXPECT_FLOAT_EQ(pidProfile.D_f[ROLL] * rateErrorRoll * 10.0, axisPID_D[FD_ROLL]); // D values are multiplied by 10
    EXPECT_FLOAT_EQ(pidProfile.P_f[PITCH] * rateErrorPitch, axisPID_P[FD_PITCH]);
    EXPECT_FLOAT_EQ(3 * pidProfile.I_f[PITCH] * rateErrorPitch * dT * 10.0, axisPID_I[FD_PITCH]);
    EXPECT_FLOAT_EQ(pidProfile.D_f[PITCH] * rateErrorPitch * 10.0, axisPID_D[FD_PITCH]);


    // now do some yaw
    rcCommand[FD_YAW] = 500;
    controlRate.rates[YAW] = 90;
    float rateErrorYaw = ((controlRate.rates[FD_YAW] + 10) * rcCommand[FD_YAW]) / 50.0f; // for FD_YAW
    EXPECT_EQ(1000, rateErrorYaw);
    pid_controller(&pidProfile, &controlRate, max_angle_inclination, &rollAndPitchTrims, &rxConfig);
    EXPECT_FLOAT_EQ(pidProfile.P_f[YAW] * rateErrorYaw, axisPID_P[FD_YAW]);
    EXPECT_FLOAT_EQ(pidProfile.I_f[YAW] * rateErrorYaw * dT * 10.0, axisPID_I[FD_YAW]); // I values are multiplied by 10
}

extern "C" {
int16_t GPS_angle[ANGLE_INDEX_COUNT] = { 0, 0 };
int32_t getRcStickDeflection(int32_t axis, uint16_t midrc) {return MIN(ABS(rcData[axis] - midrc), 500);}
attitudeEulerAngles_t attitude = { { 0, 0, 0 } };
void resetRollAndPitchTrims(rollAndPitchTrims_t *rollAndPitchTrims) {rollAndPitchTrims->values.roll = 0;rollAndPitchTrims->values.pitch = 0;};
int32_t cycleTime = 1000; //microseconds
uint16_t flightModeFlags = 0; // acro mode
uint8_t motorCount = 4;
gyro_t gyro;
int16_t gyroADC[XYZ_AXIS_COUNT];
int16_t rcCommand[4] = {1500,0,0,0};           // interval [1000;2000] for THROTTLE and [-500;+500] for ROLL/PITCH/YAW
int16_t rcData[MAX_SUPPORTED_RC_CHANNEL_COUNT];     // interval [1000;2000]
}
