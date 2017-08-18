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

#include "platform.h"

#ifdef CMS

#include "common/printf.h"
#include "common/utils.h"

#include "cms/cms.h"
#include "cms/cms_types.h"
#include "cms/cms_menu_vtx_smartaudio.h"

#include "io/vtx_string.h"
#include "io/vtx_smartaudio.h"

// Interface to CMS

// Operational Model and RF modes (CMS)

#define SACMS_OPMODEL_UNDEF        0 // Not known yet
#define SACMS_OPMODEL_FREE         1 // Freestyle model: Power up transmitting
#define SACMS_OPMODEL_RACE         2 // Race model: Power up in pit mode

uint8_t  saCmsOpmodel = SACMS_OPMODEL_UNDEF;

#define SACMS_TXMODE_NODEF         0
#define SACMS_TXMODE_PIT_OUTRANGE  1
#define SACMS_TXMODE_PIT_INRANGE   2
#define SACMS_TXMODE_ACTIVE        3

uint8_t  saCmsRFState;          // RF state; ACTIVE, PIR, POR XXX Not currently used

uint8_t  saCmsBand = 0;
uint8_t  saCmsChan = 0;
uint8_t  saCmsPower = 0;

// Frequency derived from channel table (used for reference in band/channel mode)
uint16_t saCmsFreqRef = 0;

uint16_t saCmsDeviceFreq = 0;

uint8_t  saCmsDeviceStatus = 0;
uint8_t  saCmsPower;
uint8_t  saCmsPitFMode;          // Undef(0), In-Range(1) or Out-Range(2)
uint8_t  saCmsFselMode;          // Channel(0) or User defined(1)

uint16_t saCmsORFreq = 0;       // POR frequency
uint16_t saCmsORFreqNew;        // POR frequency

uint16_t saCmsUserFreq = 0;     // User defined frequency
uint16_t saCmsUserFreqNew;      // User defined frequency

void saCmsUpdate(void)
{
// XXX Take care of pit mode update somewhere???

    if (saCmsOpmodel == SACMS_OPMODEL_UNDEF) {
        // This is a first valid response to GET_SETTINGS.
        saCmsOpmodel = (saDevice.mode & SA_MODE_GET_PITMODE) ? SACMS_OPMODEL_RACE : SACMS_OPMODEL_FREE;

        saCmsFselMode = (saDevice.mode & SA_MODE_GET_FREQ_BY_FREQ) ? 1 : 0;

        saCmsBand = (saDevice.channel / 8) + 1;
        saCmsChan = (saDevice.channel % 8) + 1;
        saCmsFreqRef = vtx58frequencyTable[saDevice.channel / 8][saDevice.channel % 8];

        saCmsDeviceFreq = vtx58frequencyTable[saDevice.channel / 8][saDevice.channel % 8];

        if ((saDevice.mode & SA_MODE_GET_PITMODE) == 0) {
            saCmsRFState = SACMS_TXMODE_ACTIVE;
        } else if (saDevice.mode & SA_MODE_GET_IN_RANGE_PITMODE) {
            saCmsRFState = SACMS_TXMODE_PIT_INRANGE;
        } else {
            saCmsRFState = SACMS_TXMODE_PIT_OUTRANGE;
        }

        if (saDevice.version == 2) {
            saCmsPower = saDevice.power + 1; // XXX Take care V1
        } else {
            saCmsPower = saDacToPowerIndex(saDevice.power) + 1;
        }
    }

    saUpdateStatusString();
}

char saCmsStatusString[31] = "- -- ---- ---";
//                            m bc ffff ppp
//                            0123456789012

static long saCmsConfigOpmodelByGvar(displayPort_t *, const void *self);
static long saCmsConfigPitFModeByGvar(displayPort_t *, const void *self);
static long saCmsConfigBandByGvar(displayPort_t *, const void *self);
static long saCmsConfigChanByGvar(displayPort_t *, const void *self);
static long saCmsConfigPowerByGvar(displayPort_t *, const void *self);

void saUpdateStatusString(void)
{
    if (saDevice.version == 0)
        return;

// XXX These should be done somewhere else
if (saCmsDeviceStatus == 0 && saDevice.version != 0)
    saCmsDeviceStatus = saDevice.version;
if (saCmsORFreq == 0 && saDevice.orfreq != 0)
    saCmsORFreq = saDevice.orfreq;
if (saCmsUserFreq == 0 && saDevice.freq != 0)
    saCmsUserFreq = saDevice.freq;

if (saDevice.version == 2) {
    if (saDevice.mode & SA_MODE_GET_OUT_RANGE_PITMODE)
        saCmsPitFMode = 1;
    else
        saCmsPitFMode = 0;
}

    saCmsStatusString[0] = "-FR"[saCmsOpmodel];

    if (saCmsFselMode == 0) {
        saCmsStatusString[2] = "ABEFR"[saDevice.channel / 8];
        saCmsStatusString[3] = '1' + (saDevice.channel % 8);
    } else {
        saCmsStatusString[2] = 'U';
        saCmsStatusString[3] = 'F';
    }

    if ((saDevice.mode & SA_MODE_GET_PITMODE)
       && (saDevice.mode & SA_MODE_GET_OUT_RANGE_PITMODE))
        tfp_sprintf(&saCmsStatusString[5], "%4d", saDevice.orfreq);
    else if (saDevice.mode & SA_MODE_GET_FREQ_BY_FREQ)
        tfp_sprintf(&saCmsStatusString[5], "%4d", saDevice.freq);
    else
        tfp_sprintf(&saCmsStatusString[5], "%4d",
            vtx58frequencyTable[saDevice.channel / 8][saDevice.channel % 8]);

    saCmsStatusString[9] = ' ';

    if (saDevice.mode & SA_MODE_GET_PITMODE) {
        saCmsStatusString[10] = 'P';
        if (saDevice.mode & SA_MODE_GET_IN_RANGE_PITMODE) {
            saCmsStatusString[11] = 'I';
        } else {
            saCmsStatusString[11] = 'O';
        }
        saCmsStatusString[12] = 'R';
        saCmsStatusString[13] = 0;
    } else {
        tfp_sprintf(&saCmsStatusString[10], "%3d", (saDevice.version == 2) ?  saPowerTable[saDevice.power].rfpower : saPowerTable[saDacToPowerIndex(saDevice.power)].rfpower);
    }
}

static long saCmsConfigBandByGvar(displayPort_t *pDisp, const void *self)
{
    UNUSED(pDisp);
    UNUSED(self);

    if (saDevice.version == 0) {
        // Bounce back; not online yet
        saCmsBand = 0;
        return 0;
    }

    if (saCmsBand == 0) {
        // Bouce back, no going back to undef state
        saCmsBand = 1;
        return 0;
    }

    if ((saCmsOpmodel == SACMS_OPMODEL_FREE) && !saDeferred)
        saSetBandAndChannel(saCmsBand - 1, saCmsChan - 1);

    saCmsFreqRef = vtx58frequencyTable[saCmsBand - 1][saCmsChan - 1];

    return 0;
}

static long saCmsConfigChanByGvar(displayPort_t *pDisp, const void *self)
{
    UNUSED(pDisp);
    UNUSED(self);

    if (saDevice.version == 0) {
        // Bounce back; not online yet
        saCmsChan = 0;
        return 0;
    }

    if (saCmsChan == 0) {
        // Bounce back; no going back to undef state
        saCmsChan = 1;
        return 0;
    }

    if ((saCmsOpmodel == SACMS_OPMODEL_FREE) && !saDeferred)
        saSetBandAndChannel(saCmsBand - 1, saCmsChan - 1);

    saCmsFreqRef = vtx58frequencyTable[saCmsBand - 1][saCmsChan - 1];

    return 0;
}

static long saCmsConfigPowerByGvar(displayPort_t *pDisp, const void *self)
{
    UNUSED(pDisp);
    UNUSED(self);

    if (saDevice.version == 0) {
        // Bounce back; not online yet
        saCmsPower = 0;
        return 0;
    }

    if (saCmsPower == 0) {
        // Bouce back; no going back to undef state
        saCmsPower = 1;
        return 0;
    }

    if (saCmsOpmodel == SACMS_OPMODEL_FREE)
        saSetPowerByIndex(saCmsPower - 1);

    return 0;
}

static long saCmsConfigPitFModeByGvar(displayPort_t *pDisp, const void *self)
{
    UNUSED(pDisp);
    UNUSED(self);

    if (saDevice.version == 1) {
        // V1 device doesn't support PIT mode; bounce back.
        saCmsPitFMode = 0;
        return 0;
    }

    dprintf(("saCmsConfigPitFmodeByGbar: saCmsPitFMode %d\r\n", saCmsPitFMode));

    if (saCmsPitFMode == 0) {
        // Bounce back
        saCmsPitFMode = 1;
        return 0;
    }

    if (saCmsPitFMode == 1) {
        saSetMode(SA_MODE_SET_IN_RANGE_PITMODE);
    } else {
        saSetMode(SA_MODE_SET_OUT_RANGE_PITMODE);
    }

    return 0;
}

static long saCmsConfigFreqModeByGvar(displayPort_t *pDisp, const void *self); // Forward

static long saCmsConfigOpmodelByGvar(displayPort_t *pDisp, const void *self)
{
    UNUSED(pDisp);
    UNUSED(self);

    if (saDevice.version == 1) {
        if (saCmsOpmodel != SACMS_OPMODEL_FREE)
            saCmsOpmodel = SACMS_OPMODEL_FREE;
        return 0;
    }

    uint8_t opmodel = saCmsOpmodel;

    dprintf(("saCmsConfigOpmodelByGvar: opmodel %d\r\n", opmodel));

    if (opmodel == SACMS_OPMODEL_FREE) {
        // VTX should power up transmitting.
        // Turn off In-Range and Out-Range bits
        saSetMode(0);
    } else if (opmodel == SACMS_OPMODEL_RACE) {
        // VTX should power up in pit mode.
        // Default PitFMode is in-range to prevent users without
        // out-range receivers from getting blinded.
        saCmsPitFMode = 0;
        saCmsConfigPitFModeByGvar(pDisp, self);

        // Direct frequency mode is not available in RACE opmodel
        saCmsFselMode = 0;
        saCmsConfigFreqModeByGvar(pDisp, self);
    } else {
        // Trying to go back to unknown state; bounce back
        saCmsOpmodel = SACMS_OPMODEL_UNDEF + 1;
    }

    return 0;
}

static const char * const saCmsDeviceStatusNames[] = {
    "OFFL",
    "ONL V1",
    "ONL V2",
};

static OSD_TAB_t saCmsEntOnline = { &saCmsDeviceStatus, 2, saCmsDeviceStatusNames };

static OSD_Entry saCmsMenuStatsEntries[] = {
    { "- SA STATS -", OME_Label, NULL, NULL, 0 },
    { "STATUS",   OME_TAB,    NULL, &saCmsEntOnline,                              DYNAMIC },
    { "BAUDRATE", OME_UINT16, NULL, &(OSD_UINT16_t){ &sa_smartbaud, 0, 0, 0 },    DYNAMIC },
    { "SENT",     OME_UINT16, NULL, &(OSD_UINT16_t){ &saStat.pktsent, 0, 0, 0 },  DYNAMIC },
    { "RCVD",     OME_UINT16, NULL, &(OSD_UINT16_t){ &saStat.pktrcvd, 0, 0, 0 },  DYNAMIC },
    { "BADPRE",   OME_UINT16, NULL, &(OSD_UINT16_t){ &saStat.badpre, 0, 0, 0 },   DYNAMIC },
    { "BADLEN",   OME_UINT16, NULL, &(OSD_UINT16_t){ &saStat.badlen, 0, 0, 0 },   DYNAMIC },
    { "CRCERR",   OME_UINT16, NULL, &(OSD_UINT16_t){ &saStat.crc, 0, 0, 0 },      DYNAMIC },
    { "OOOERR",   OME_UINT16, NULL, &(OSD_UINT16_t){ &saStat.ooopresp, 0, 0, 0 }, DYNAMIC },
    { "BACK",     OME_Back,   NULL, NULL, 0 },
    { NULL,       OME_END,    NULL, NULL, 0 }
};

static CMS_Menu saCmsMenuStats = {
    .GUARD_text = "XSAST",
    .GUARD_type = OME_MENU,
    .onEnter = NULL,
    .onExit = NULL,
    .onGlobalExit = NULL,
    .entries = saCmsMenuStatsEntries
};

static OSD_TAB_t saCmsEntBand = { &saCmsBand, 5, vtx58BandNames };

static OSD_TAB_t saCmsEntChan = { &saCmsChan, 8, vtx58ChannelNames };

static const char * const saCmsPowerNames[] = {
    "---",
    "25 ",
    "200",
    "500",
    "800",
};

static OSD_TAB_t saCmsEntPower = { &saCmsPower, 4, saCmsPowerNames};

static OSD_UINT16_t saCmsEntFreqRef = { &saCmsFreqRef, 5600, 5900, 0 };

static const char * const saCmsOpmodelNames[] = {
    "----",
    "FREE",
    "RACE",
};

static const char * const saCmsFselModeNames[] = {
    "CHAN",
    "USER"
};

static const char * const saCmsPitFModeNames[] = {
    "---",
    "PIR",
    "POR"
};

static OSD_TAB_t saCmsEntPitFMode = { &saCmsPitFMode, 1, saCmsPitFModeNames };

static long sacms_SetupTopMenu(void); // Forward

static long saCmsConfigFreqModeByGvar(displayPort_t *pDisp, const void *self)
{
    UNUSED(pDisp);
    UNUSED(self);

    if (saCmsFselMode == 0) {
        // CHAN
        saSetBandAndChannel(saCmsBand - 1, saCmsChan - 1);
    } else {
        // USER: User frequency mode is only available in FREE opmodel.
        if (saCmsOpmodel == SACMS_OPMODEL_FREE) {
            saSetFreq(saCmsUserFreq);
        } else {
            // Bounce back
            saCmsFselMode = 0;
        }
    }

    sacms_SetupTopMenu();

    return 0;
}

static long saCmsCommence(displayPort_t *pDisp, const void *self)
{
    UNUSED(pDisp);
    UNUSED(self);

    if (saCmsOpmodel == SACMS_OPMODEL_RACE) {
        // Race model
        // Setup band, freq and power.

        saSetBandAndChannel(saCmsBand - 1, saCmsChan - 1);

        // If in pit mode, cancel it.

        if (saCmsPitFMode == 0)
            saSetMode(SA_MODE_CLR_PITMODE|SA_MODE_SET_IN_RANGE_PITMODE);
        else
            saSetMode(SA_MODE_CLR_PITMODE|SA_MODE_SET_OUT_RANGE_PITMODE);
    } else {
        // Freestyle model
        // Setup band and freq / user freq
        if (saCmsFselMode == 0)
            saSetBandAndChannel(saCmsBand - 1, saCmsChan - 1);
        else
            saSetFreq(saCmsUserFreq);
    }

    saSetPowerByIndex(saCmsPower - 1);

    return MENU_CHAIN_BACK;
}

static long saCmsSetPORFreqOnEnter(void)
{
    if (saDevice.version == 1)
        return MENU_CHAIN_BACK;

    saCmsORFreqNew = saCmsORFreq;

    return 0;
}

static long saCmsSetPORFreq(displayPort_t *pDisp, const void *self)
{
    UNUSED(pDisp);
    UNUSED(self);

    saSetFreq(saCmsORFreqNew|SA_FREQ_SETPIT);

    return 0;
}

static char *saCmsORFreqGetString(void)
{
    static char pbuf[5];

    tfp_sprintf(pbuf, "%4d", saCmsORFreq);

    return pbuf;
}

static char *saCmsUserFreqGetString(void)
{
    static char pbuf[5];

    tfp_sprintf(pbuf, "%4d", saCmsUserFreq);

    return pbuf;
}

static long saCmsSetUserFreqOnEnter(void)
{
    saCmsUserFreqNew = saCmsUserFreq;

    return 0;
}

static long saCmsConfigUserFreq(displayPort_t *pDisp, const void *self)
{
    UNUSED(pDisp);
    UNUSED(self);

    saCmsUserFreq = saCmsUserFreqNew;
    //saSetFreq(saCmsUserFreq);

    return MENU_CHAIN_BACK;
}

static OSD_Entry saCmsMenuPORFreqEntries[] = {
    { "- POR FREQ -", OME_Label,   NULL,             NULL,                                                 0 },

    { "CUR FREQ",     OME_UINT16,  NULL,             &(OSD_UINT16_t){ &saCmsORFreq, 5000, 5900, 0 },       DYNAMIC },
    { "NEW FREQ",     OME_UINT16,  NULL,             &(OSD_UINT16_t){ &saCmsORFreqNew, 5000, 5900, 1 },    0 },
    { "SET",          OME_Funcall, saCmsSetPORFreq,  NULL,                                                 0 },

    { "BACK",         OME_Back,    NULL,             NULL,                                                 0 },
    { NULL,           OME_END,     NULL,             NULL,                                                 0 }
};

static CMS_Menu saCmsMenuPORFreq =
{
    .GUARD_text = "XSAPOR",
    .GUARD_type = OME_MENU,
    .onEnter = saCmsSetPORFreqOnEnter,
    .onExit = NULL,
    .onGlobalExit = NULL,
    .entries = saCmsMenuPORFreqEntries,
};

static OSD_Entry saCmsMenuUserFreqEntries[] = {
    { "- USER FREQ -", OME_Label,   NULL,             NULL,                                                0 },

    { "CUR FREQ",      OME_UINT16,  NULL,             &(OSD_UINT16_t){ &saCmsUserFreq, 5000, 5900, 0 },    DYNAMIC },
    { "NEW FREQ",      OME_UINT16,  NULL,             &(OSD_UINT16_t){ &saCmsUserFreqNew, 5000, 5900, 1 }, 0 },
    { "SET",           OME_Funcall, saCmsConfigUserFreq, NULL,                                                0 },

    { "BACK",          OME_Back,    NULL,             NULL,                                                0 },
    { NULL,            OME_END,     NULL,             NULL,                                                0 }
};

static CMS_Menu saCmsMenuUserFreq =
{
    .GUARD_text = "XSAUFQ",
    .GUARD_type = OME_MENU,
    .onEnter = saCmsSetUserFreqOnEnter,
    .onExit = NULL,
    .onGlobalExit = NULL,
    .entries = saCmsMenuUserFreqEntries,
};

static OSD_TAB_t saCmsEntFselMode = { &saCmsFselMode, 1, saCmsFselModeNames };

static OSD_Entry saCmsMenuConfigEntries[] = {
    { "- SA CONFIG -", OME_Label, NULL, NULL, 0 },

    { "OP MODEL",  OME_TAB,     saCmsConfigOpmodelByGvar,              &(OSD_TAB_t){ &saCmsOpmodel, 2, saCmsOpmodelNames }, DYNAMIC },
    { "FSEL MODE", OME_TAB,     saCmsConfigFreqModeByGvar,             &saCmsEntFselMode,                                   DYNAMIC },
    { "PIT FMODE", OME_TAB,     saCmsConfigPitFModeByGvar,             &saCmsEntPitFMode,                                   0 },
    { "POR FREQ",  OME_Submenu, (CMSEntryFuncPtr)saCmsORFreqGetString, &saCmsMenuPORFreq,                                   OPTSTRING },
    { "STATX",     OME_Submenu, cmsMenuChange,                         &saCmsMenuStats,                                     0 },

    { "BACK", OME_Back, NULL, NULL, 0 },
    { NULL, OME_END, NULL, NULL, 0 }
};

static CMS_Menu saCmsMenuConfig = {
    .GUARD_text = "XSACFG",
    .GUARD_type = OME_MENU,
    .onEnter = NULL,
    .onExit = NULL,
    .onGlobalExit = NULL,
    .entries = saCmsMenuConfigEntries
};

static OSD_Entry saCmsMenuCommenceEntries[] = {
    { "CONFIRM", OME_Label,   NULL,          NULL, 0 },

    { "YES",     OME_Funcall, saCmsCommence, NULL, 0 },

    { "BACK",    OME_Back, NULL, NULL, 0 },
    { NULL,      OME_END, NULL, NULL, 0 }
};

static CMS_Menu saCmsMenuCommence = {
    .GUARD_text = "XVTXCOM",
    .GUARD_type = OME_MENU,
    .onEnter = NULL,
    .onExit = NULL,
    .onGlobalExit = NULL,
    .entries = saCmsMenuCommenceEntries,
};

static OSD_Entry saCmsMenuFreqModeEntries[] = {
    { "- SMARTAUDIO -", OME_Label, NULL, NULL, 0 },

    { "",       OME_Label,   NULL,                                     saCmsStatusString,  DYNAMIC },
    { "FREQ",   OME_Submenu, (CMSEntryFuncPtr)saCmsUserFreqGetString,  &saCmsMenuUserFreq, OPTSTRING },
    { "POWER",  OME_TAB,     saCmsConfigPowerByGvar,                   &saCmsEntPower,     0 },
    { "SET",    OME_Submenu, cmsMenuChange,                            &saCmsMenuCommence, 0 },
    { "CONFIG", OME_Submenu, cmsMenuChange,                            &saCmsMenuConfig,   0 },

    { "BACK", OME_Back, NULL, NULL, 0 },
    { NULL, OME_END, NULL, NULL, 0 }
};

static OSD_Entry saCmsMenuChanModeEntries[] =
{
    { "- SMARTAUDIO -", OME_Label, NULL, NULL, 0 },

    { "",       OME_Label,   NULL,                   saCmsStatusString,  DYNAMIC },
    { "BAND",   OME_TAB,     saCmsConfigBandByGvar,  &saCmsEntBand,      0 },
    { "CHAN",   OME_TAB,     saCmsConfigChanByGvar,  &saCmsEntChan,      0 },
    { "(FREQ)", OME_UINT16,  NULL,                   &saCmsEntFreqRef,   DYNAMIC },
    { "POWER",  OME_TAB,     saCmsConfigPowerByGvar, &saCmsEntPower,     0 },
    { "SET",    OME_Submenu, cmsMenuChange,          &saCmsMenuCommence, 0 },
    { "CONFIG", OME_Submenu, cmsMenuChange,          &saCmsMenuConfig,   0 },

    { "BACK",   OME_Back, NULL, NULL, 0 },
    { NULL,     OME_END, NULL, NULL, 0 }
};

static OSD_Entry saCmsMenuOfflineEntries[] =
{
    { "- VTX SMARTAUDIO -", OME_Label, NULL, NULL, 0 },

    { "",      OME_Label,   NULL,          saCmsStatusString, DYNAMIC },
    { "STATX", OME_Submenu, cmsMenuChange, &saCmsMenuStats,   0 },

    { "BACK",  OME_Back, NULL, NULL, 0 },
    { NULL,    OME_END, NULL, NULL, 0 }
};

CMS_Menu cmsx_menuVtxSmartAudio; // Forward

static long sacms_SetupTopMenu(void)
{
    if (saCmsDeviceStatus) {
        if (saCmsFselMode == 0)
            cmsx_menuVtxSmartAudio.entries = saCmsMenuChanModeEntries;
        else
            cmsx_menuVtxSmartAudio.entries = saCmsMenuFreqModeEntries;
    } else {
        cmsx_menuVtxSmartAudio.entries = saCmsMenuOfflineEntries;
    }

    return 0;
}

CMS_Menu cmsx_menuVtxSmartAudio = {
    .GUARD_text = "XVTXSA",
    .GUARD_type = OME_MENU,
    .onEnter = sacms_SetupTopMenu,
    .onExit = NULL,
    .onGlobalExit = NULL,
    .entries = saCmsMenuOfflineEntries,
};

#endif // CMS
