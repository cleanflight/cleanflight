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

// Menu contents for PID, RATES, RC preview, misc
// Should be part of the relevant .c file.

#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <ctype.h>

#include "platform.h"

#ifdef CMS

#include "build/version.h"

#include "drivers/system.h"

#include "cms/cms.h"
#include "cms/cms_types.h"
#include "cms/cms_menu_imu.h"

#include "common/utils.h"

#include "config/config_profile.h"
#include "config/feature.h"
#include "config/parameter_group.h"

#include "fc/config.h"
#include "fc/controlrate_profile.h"
#include "fc/rc_controls.h"
#include "fc/runtime_config.h"

#include "flight/pid.h"

#include "sensors/gyro.h"


//
// PID
//
static uint8_t tmpPidProfileIndex;
static uint8_t pidProfileIndex;
static char pidProfileIndexString[] = " p";
static uint8_t tempPid[3][3];

static uint8_t tmpRateProfileIndex;
static uint8_t rateProfileIndex;
static char rateProfileIndexString[] = " p-r";
static controlRateConfig_t rateProfile;

static long cmsx_menuImu_onEnter(void)
{
    pidProfileIndex = getCurrentPidProfileIndex();
    tmpPidProfileIndex = pidProfileIndex + 1;

    rateProfileIndex = getCurrentControlRateProfileIndex();
    tmpRateProfileIndex = rateProfileIndex + 1;

    return 0;
}

static long cmsx_menuImu_onExit(const OSD_Entry *self)
{
    UNUSED(self);

    changePidProfile(pidProfileIndex);
    changeControlRateProfile(rateProfileIndex);

    return 0;
}

static long cmsx_profileIndexOnChange(displayPort_t *displayPort, const void *ptr)
{
    UNUSED(displayPort);
    UNUSED(ptr);

    pidProfileIndex = tmpPidProfileIndex - 1;

    return 0;
}

static long cmsx_rateProfileIndexOnChange(displayPort_t *displayPort, const void *ptr)
{
    UNUSED(displayPort);
    UNUSED(ptr);

    rateProfileIndex = tmpRateProfileIndex - 1;

    return 0;
}

static long cmsx_PidRead(void)
{

    const pidProfile_t *pidProfile = pidProfiles(pidProfileIndex);
    for (uint8_t i = 0; i < 3; i++) {
        tempPid[i][0] = pidProfile->P8[i];
        tempPid[i][1] = pidProfile->I8[i];
        tempPid[i][2] = pidProfile->D8[i];
    }

    return 0;
}

static long cmsx_PidOnEnter(void)
{
    pidProfileIndexString[1] = '0' + tmpPidProfileIndex;
    cmsx_PidRead();

    return 0;
}

static long cmsx_PidWriteback(const OSD_Entry *self)
{
    UNUSED(self);

    pidProfile_t *pidProfile = currentPidProfile;
    for (uint8_t i = 0; i < 3; i++) {
        pidProfile->P8[i] = tempPid[i][0];
        pidProfile->I8[i] = tempPid[i][1];
        pidProfile->D8[i] = tempPid[i][2];
    }
    pidInitConfig(currentPidProfile);

    return 0;
}

static OSD_Entry cmsx_menuPidEntries[] =
{
    { "-- PID --", OME_Label, NULL, pidProfileIndexString, 0},

    { "ROLL  P", OME_UINT8, NULL, &(OSD_UINT8_t){ &tempPid[PIDROLL][0],  0, 200, 1 }, 0 },
    { "ROLL  I", OME_UINT8, NULL, &(OSD_UINT8_t){ &tempPid[PIDROLL][1],  0, 200, 1 }, 0 },
    { "ROLL  D", OME_UINT8, NULL, &(OSD_UINT8_t){ &tempPid[PIDROLL][2],  0, 200, 1 }, 0 },

    { "PITCH P", OME_UINT8, NULL, &(OSD_UINT8_t){ &tempPid[PIDPITCH][0], 0, 200, 1 }, 0 },
    { "PITCH I", OME_UINT8, NULL, &(OSD_UINT8_t){ &tempPid[PIDPITCH][1], 0, 200, 1 }, 0 },
    { "PITCH D", OME_UINT8, NULL, &(OSD_UINT8_t){ &tempPid[PIDPITCH][2], 0, 200, 1 }, 0 },

    { "YAW   P", OME_UINT8, NULL, &(OSD_UINT8_t){ &tempPid[PIDYAW][0],   0, 200, 1 }, 0 },
    { "YAW   I", OME_UINT8, NULL, &(OSD_UINT8_t){ &tempPid[PIDYAW][1],   0, 200, 1 }, 0 },
    { "YAW   D", OME_UINT8, NULL, &(OSD_UINT8_t){ &tempPid[PIDYAW][2],   0, 200, 1 }, 0 },

    { "BACK", OME_Back, NULL, NULL, 0 },
    { NULL, OME_END, NULL, NULL, 0 }
};

static CMS_Menu cmsx_menuPid = {
    .GUARD_text = "XPID",
    .GUARD_type = OME_MENU,
    .onEnter = cmsx_PidOnEnter,
    .onExit = cmsx_PidWriteback,
    .onGlobalExit = NULL,
    .entries = cmsx_menuPidEntries
};

//
// Rate & Expo
//

static long cmsx_RateProfileRead(void)
{
    memcpy(&rateProfile, controlRateProfiles(rateProfileIndex), sizeof(controlRateConfig_t));

    return 0;
}

static long cmsx_RateProfileWriteback(const OSD_Entry *self)
{
    UNUSED(self);

    memcpy(controlRateProfilesMutable(rateProfileIndex), &rateProfile, sizeof(controlRateConfig_t));

    return 0;
}

static long cmsx_RateProfileOnEnter(void)
{
    rateProfileIndexString[1] = '0' + tmpPidProfileIndex;
    rateProfileIndexString[3] = '0' + tmpRateProfileIndex;
    cmsx_RateProfileRead();

    return 0;
}

static OSD_Entry cmsx_menuRateProfileEntries[] =
{
    { "-- RATE --", OME_Label, NULL, rateProfileIndexString, 0 },

    { "RC RATE",     OME_FLOAT,  NULL, &(OSD_FLOAT_t) { &rateProfile.rcRate8,    0, 255, 1, 10 }, 0 },
    { "RC YAW RATE", OME_FLOAT,  NULL, &(OSD_FLOAT_t) { &rateProfile.rcYawRate8, 0, 255, 1, 10 }, 0 },

    { "ROLL SUPER",  OME_FLOAT,  NULL, &(OSD_FLOAT_t) { &rateProfile.rates[0],   0, 100, 1, 10 }, 0 },
    { "PITCH SUPER", OME_FLOAT,  NULL, &(OSD_FLOAT_t) { &rateProfile.rates[1],   0, 100, 1, 10 }, 0 },
    { "YAW SUPER",   OME_FLOAT,  NULL, &(OSD_FLOAT_t) { &rateProfile.rates[2],   0, 100, 1, 10 }, 0 },

    { "RC EXPO",     OME_FLOAT,  NULL, &(OSD_FLOAT_t) { &rateProfile.rcExpo8,    0, 100, 1, 10 }, 0 },
    { "RC YAW EXP",  OME_FLOAT,  NULL, &(OSD_FLOAT_t) { &rateProfile.rcYawExpo8, 0, 100, 1, 10 }, 0 },

    { "THRPID ATT",  OME_FLOAT,  NULL, &(OSD_FLOAT_t) { &rateProfile.dynThrPID,  0, 100, 1, 10}, 0 },
    { "TPA BRKPT",   OME_UINT16, NULL, &(OSD_UINT16_t){ &rateProfile.tpa_breakpoint, 1000, 2000, 10}, 0 },

    { "BACK", OME_Back, NULL, NULL, 0 },
    { NULL, OME_END, NULL, NULL, 0 }
};

static CMS_Menu cmsx_menuRateProfile = {
    .GUARD_text = "MENURATE",
    .GUARD_type = OME_MENU,
    .onEnter = cmsx_RateProfileOnEnter,
    .onExit = cmsx_RateProfileWriteback,
    .onGlobalExit = NULL,
    .entries = cmsx_menuRateProfileEntries
};

static uint8_t cmsx_dtermSetpointWeight;
static uint8_t cmsx_setpointRelaxRatio;
static uint8_t cmsx_angleStrength;
static uint8_t cmsx_horizonStrength;
static uint8_t cmsx_horizonTransition;

static long cmsx_profileOtherOnEnter(void)
{
    pidProfileIndexString[1] = '0' + tmpPidProfileIndex;

    const pidProfile_t *pidProfile = pidProfiles(pidProfileIndex);
    cmsx_dtermSetpointWeight = pidProfile->dtermSetpointWeight;
    cmsx_setpointRelaxRatio  = pidProfile->setpointRelaxRatio;

    cmsx_angleStrength =     pidProfile->P8[PIDLEVEL];
    cmsx_horizonStrength =   pidProfile->I8[PIDLEVEL];
    cmsx_horizonTransition = pidProfile->D8[PIDLEVEL];

    return 0;
}

static long cmsx_profileOtherOnExit(const OSD_Entry *self)
{
    UNUSED(self);

    pidProfile_t *pidProfile = pidProfilesMutable(pidProfileIndex);
    pidProfile->dtermSetpointWeight = cmsx_dtermSetpointWeight;
    pidProfile->setpointRelaxRatio = cmsx_setpointRelaxRatio;
    pidInitConfig(currentPidProfile);

    pidProfile->P8[PIDLEVEL] = cmsx_angleStrength;
    pidProfile->I8[PIDLEVEL] = cmsx_horizonStrength;
    pidProfile->D8[PIDLEVEL] = cmsx_horizonTransition;

    return 0;
}

static OSD_Entry cmsx_menuProfileOtherEntries[] = {
    { "-- OTHER PP --", OME_Label, NULL, pidProfileIndexString, 0 },

    { "D SETPT WT",  OME_FLOAT, NULL, &(OSD_FLOAT_t) { &cmsx_dtermSetpointWeight, 0, 255, 1, 10 }, 0 },
    { "SETPT TRS",   OME_FLOAT, NULL, &(OSD_FLOAT_t) { &cmsx_setpointRelaxRatio,  0, 100, 1, 10 }, 0 },
    { "ANGLE STR",   OME_UINT8, NULL, &(OSD_UINT8_t) { &cmsx_angleStrength,       0, 200, 1 }    , 0 },
    { "HORZN STR",   OME_UINT8, NULL, &(OSD_UINT8_t) { &cmsx_horizonStrength,     0, 200, 1 }    , 0 },
    { "HORZN TRS",   OME_UINT8, NULL, &(OSD_UINT8_t) { &cmsx_horizonTransition,   0, 200, 1 }    , 0 },

    { "BACK", OME_Back, NULL, NULL, 0 },
    { NULL, OME_END, NULL, NULL, 0 }
};

static CMS_Menu cmsx_menuProfileOther = {
    .GUARD_text = "XPROFOTHER",
    .GUARD_type = OME_MENU,
    .onEnter = cmsx_profileOtherOnEnter,
    .onExit = cmsx_profileOtherOnExit,
    .onGlobalExit = NULL,
    .entries = cmsx_menuProfileOtherEntries,
};

static uint8_t gyroConfig_gyro_soft_lpf_hz;
static uint16_t gyroConfig_gyro_soft_notch_hz_1;
static uint16_t gyroConfig_gyro_soft_notch_cutoff_1;
static uint16_t gyroConfig_gyro_soft_notch_hz_2;
static uint16_t gyroConfig_gyro_soft_notch_cutoff_2;

static long cmsx_menuGyro_onEnter(void)
{
    gyroConfig_gyro_soft_lpf_hz =  gyroConfig()->gyro_soft_lpf_hz;
    gyroConfig_gyro_soft_notch_hz_1 = gyroConfig()->gyro_soft_notch_hz_1;
    gyroConfig_gyro_soft_notch_cutoff_1 = gyroConfig()->gyro_soft_notch_cutoff_1;
    gyroConfig_gyro_soft_notch_hz_2 = gyroConfig()->gyro_soft_notch_hz_2;
    gyroConfig_gyro_soft_notch_cutoff_2 = gyroConfig()->gyro_soft_notch_cutoff_2;

    return 0;
}

static long cmsx_menuGyro_onExit(const OSD_Entry *self)
{
    UNUSED(self);

    gyroConfigMutable()->gyro_soft_lpf_hz =  gyroConfig_gyro_soft_lpf_hz;
    gyroConfigMutable()->gyro_soft_notch_hz_1 = gyroConfig_gyro_soft_notch_hz_1;
    gyroConfigMutable()->gyro_soft_notch_cutoff_1 = gyroConfig_gyro_soft_notch_cutoff_1;
    gyroConfigMutable()->gyro_soft_notch_hz_2 = gyroConfig_gyro_soft_notch_hz_2;
    gyroConfigMutable()->gyro_soft_notch_cutoff_2 = gyroConfig_gyro_soft_notch_cutoff_2;

    return 0;
}

static OSD_Entry cmsx_menuFilterGlobalEntries[] =
{
    { "-- FILTER GLB  --", OME_Label, NULL, NULL, 0 },

    { "GYRO LPF",   OME_UINT8,  NULL, &(OSD_UINT8_t)  { &gyroConfig_gyro_soft_lpf_hz,         0, 255, 1 }, 0 },
    { "GYRO NF1",   OME_UINT16, NULL, &(OSD_UINT16_t) { &gyroConfig_gyro_soft_notch_hz_1,     0, 500, 1 }, 0 },
    { "GYRO NF1C",  OME_UINT16, NULL, &(OSD_UINT16_t) { &gyroConfig_gyro_soft_notch_cutoff_1, 0, 500, 1 }, 0 },
    { "GYRO NF2",   OME_UINT16, NULL, &(OSD_UINT16_t) { &gyroConfig_gyro_soft_notch_hz_2,     0, 500, 1 }, 0 },
    { "GYRO NF2C",  OME_UINT16, NULL, &(OSD_UINT16_t) { &gyroConfig_gyro_soft_notch_cutoff_2, 0, 500, 1 }, 0 },

    { "BACK", OME_Back, NULL, NULL, 0 },
    { NULL, OME_END, NULL, NULL, 0 }
};

static CMS_Menu cmsx_menuFilterGlobal = {
    .GUARD_text = "XFLTGLB",
    .GUARD_type = OME_MENU,
    .onEnter = cmsx_menuGyro_onEnter,
    .onExit = cmsx_menuGyro_onExit,
    .onGlobalExit = NULL,
    .entries = cmsx_menuFilterGlobalEntries,
};

static uint16_t cmsx_dterm_lpf_hz;
static uint16_t cmsx_dterm_notch_hz;
static uint16_t cmsx_dterm_notch_cutoff;
static uint16_t cmsx_yaw_lpf_hz;

static long cmsx_FilterPerProfileRead(void)
{
    const pidProfile_t *pidProfile = pidProfiles(pidProfileIndex);
    cmsx_dterm_lpf_hz =       pidProfile->dterm_lpf_hz;
    cmsx_dterm_notch_hz =     pidProfile->dterm_notch_hz;
    cmsx_dterm_notch_cutoff = pidProfile->dterm_notch_cutoff;
    cmsx_yaw_lpf_hz =         pidProfile->yaw_lpf_hz;

    return 0;
}

static long cmsx_FilterPerProfileWriteback(const OSD_Entry *self)
{
    UNUSED(self);

    pidProfile_t *pidProfile = currentPidProfile;
    pidProfile->dterm_lpf_hz =       cmsx_dterm_lpf_hz;
    pidProfile->dterm_notch_hz =     cmsx_dterm_notch_hz;
    pidProfile->dterm_notch_cutoff = cmsx_dterm_notch_cutoff;
    pidProfile->yaw_lpf_hz =         cmsx_yaw_lpf_hz;

    return 0;
}

static OSD_Entry cmsx_menuFilterPerProfileEntries[] =
{
    { "-- FILTER PP  --", OME_Label, NULL, NULL, 0 },

    { "DTERM LPF",  OME_UINT16, NULL, &(OSD_UINT16_t){ &cmsx_dterm_lpf_hz,         0, 500, 1 }, 0 },
    { "DTERM NF",   OME_UINT16, NULL, &(OSD_UINT16_t){ &cmsx_dterm_notch_hz,       0, 500, 1 }, 0 },
    { "DTERM NFCO", OME_UINT16, NULL, &(OSD_UINT16_t){ &cmsx_dterm_notch_cutoff,   0, 500, 1 }, 0 },
    { "YAW LPF",    OME_UINT16, NULL, &(OSD_UINT16_t){ &cmsx_yaw_lpf_hz,           0, 500, 1 }, 0 },

    { "BACK", OME_Back, NULL, NULL, 0 },
    { NULL, OME_END, NULL, NULL, 0 }
};

static CMS_Menu cmsx_menuFilterPerProfile = {
    .GUARD_text = "XFLTPP",
    .GUARD_type = OME_MENU,
    .onEnter = cmsx_FilterPerProfileRead,
    .onExit = cmsx_FilterPerProfileWriteback,
    .onGlobalExit = NULL,
    .entries = cmsx_menuFilterPerProfileEntries,
};

static OSD_Entry cmsx_menuImuEntries[] =
{
    { "-- IMU --", OME_Label, NULL, NULL, 0},

    {"PID PROF",  OME_UINT8,   cmsx_profileIndexOnChange,     &(OSD_UINT8_t){ &tmpPidProfileIndex, 1, MAX_PROFILE_COUNT, 1},    0},
    {"PID",       OME_Submenu, cmsMenuChange,                 &cmsx_menuPid,                                                 0},
    {"MISC PP",   OME_Submenu, cmsMenuChange,                 &cmsx_menuProfileOther,                                        0},
    {"FILT PP",   OME_Submenu, cmsMenuChange,                 &cmsx_menuFilterPerProfile,                                    0},

    {"RATE PROF", OME_UINT8,   cmsx_rateProfileIndexOnChange, &(OSD_UINT8_t){ &tmpRateProfileIndex, 1, CONTROL_RATE_PROFILE_COUNT, 1}, 0},
    {"RATE",      OME_Submenu, cmsMenuChange,                 &cmsx_menuRateProfile,                                         0},

    {"FILT GLB",  OME_Submenu, cmsMenuChange,                 &cmsx_menuFilterGlobal,                                        0},

    {"BACK", OME_Back, NULL, NULL, 0},
    {NULL, OME_END, NULL, NULL, 0}
};

CMS_Menu cmsx_menuImu = {
    .GUARD_text = "XIMU",
    .GUARD_type = OME_MENU,
    .onEnter = cmsx_menuImu_onEnter,
    .onExit = cmsx_menuImu_onExit,
    .onGlobalExit = NULL,
    .entries = cmsx_menuImuEntries,
};
#endif // CMS
