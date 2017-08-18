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

/* Created by jflyper */

#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <ctype.h>

#include "platform.h"

#if defined(VTX_SMARTAUDIO) && defined(VTX_CONTROL)
#include "build/build_config.h"
#include "build/debug.h"


#include "cms/cms.h"
#include "cms/cms_types.h"
#include "cms/cms_menu_vtx_smartaudio.h"

#include "common/printf.h"
#include "common/utils.h"

#include "config/parameter_group.h"
#include "config/parameter_group_ids.h"

#include "drivers/serial.h"
#include "drivers/time.h"
#include "drivers/vtx_common.h"

#include "fc/rc_controls.h"
#include "fc/runtime_config.h"

#include "flight/pid.h"

#include "io/serial.h"
#include "io/vtx_smartaudio.h"
#include "io/vtx_string.h"

//#define SMARTAUDIO_DPRINTF
//#define SMARTAUDIO_DEBUG_MONITOR

#ifdef SMARTAUDIO_DPRINTF
serialPort_t *debugSerialPort = NULL;
#endif // SMARTAUDIO_DPRINTF

static serialPort_t *smartAudioSerialPort = NULL;

#if defined(CMS) || defined(VTX_COMMON)
static const char * const saPowerNames[] = {
    "---", "25 ", "200", "500", "800",
};
#endif

#ifdef VTX_COMMON
static const vtxVTable_t saVTable;    // Forward
static vtxDevice_t vtxSmartAudio = {
    .vTable = &saVTable,
    .capability.bandCount = 5,
    .capability.channelCount = 8,
    .capability.powerCount = 4,
    .bandNames = (char **)vtx58BandNames,
    .channelNames = (char **)vtx58ChannelNames,
    .powerNames = (char **)saPowerNames,
};
#endif

// SmartAudio command and response codes
enum {
    SA_CMD_NONE = 0x00,
    SA_CMD_GET_SETTINGS = 0x01,
    SA_CMD_SET_POWER,
    SA_CMD_SET_CHAN,
    SA_CMD_SET_FREQ,
    SA_CMD_SET_MODE,
    SA_CMD_GET_SETTINGS_V2 = 0x09        // Response only
} smartAudioCommand_e;

// This is not a good design; can't distinguish command from response this way.
#define SACMD(cmd) (((cmd) << 1) | 1)


#define SA_IS_PITMODE(n) ((n) & SA_MODE_GET_PITMODE)
#define SA_IS_PIRMODE(n) (((n) & SA_MODE_GET_PITMODE) && ((n) & SA_MODE_GET_IN_RANGE_PITMODE))
#define SA_IS_PORMODE(n) (((n) & SA_MODE_GET_PITMODE) && ((n) & SA_MODE_GET_OUT_RANGE_PITMODE))


// Statistical counters, for user side trouble shooting.

smartAudioStat_t saStat = {
    .pktsent = 0,
    .pktrcvd = 0,
    .badpre = 0,
    .badlen = 0,
    .crc = 0,
    .ooopresp = 0,
    .badcode = 0,
};

saPowerTable_t saPowerTable[] = {
    {  25,   7,   0 },
    { 200,  16,   1 },
    { 500,  25,   2 },
    { 800,  40,   3 },
};

// Last received device ('hard') states

smartAudioDevice_t saDevice = {
    .version = 0,
    .channel = -1,
    .power = -1,
    .mode = 0,
    .freq = 0,
    .orfreq = 0,
};

static smartAudioDevice_t saDevicePrev = {
    .version = 0,
};

// XXX Possible compliance problem here. Need LOCK/UNLOCK menu?
static uint8_t saLockMode = SA_MODE_SET_UNLOCK; // saCms variable?

// XXX Should be configurable by user?
bool saDeferred = true; // saCms variable?

// Receive frame reassembly buffer
#define SA_MAX_RCVLEN 11
static uint8_t sa_rbuf[SA_MAX_RCVLEN+4]; // XXX delete 4 byte guard

//
// CRC8 computations
//

#define POLYGEN 0xd5

static uint8_t CRC8(const uint8_t *data, const int8_t len)
{
    uint8_t crc = 0; /* start with 0 so first byte can be 'xored' in */
    uint8_t currByte;

    for (int i = 0 ; i < len ; i++) {
        currByte = data[i];

        crc ^= currByte; /* XOR-in the next input byte */

        for (int i = 0; i < 8; i++) {
            if ((crc & 0x80) != 0) {
                crc = (uint8_t)((crc << 1) ^ POLYGEN);
            } else {
                crc <<= 1;
            }
        }
    }
    return crc;
}


static void saPrintSettings(void)
{
#ifdef SMARTAUDIO_DPRINTF
    dprintf(("Current status: version: %d\r\n", saDevice.version));
    dprintf(("  mode(0x%x): fmode=%s", saDevice.mode,  (saDevice.mode & 1) ? "freq" : "chan"));
    dprintf((" pit=%s ", (saDevice.mode & 2) ? "on " : "off"));
    dprintf((" inb=%s", (saDevice.mode & 4) ? "on " : "off"));
    dprintf((" outb=%s", (saDevice.mode & 8) ? "on " : "off"));
    dprintf((" lock=%s", (saDevice.mode & 16) ? "unlocked" : "locked"));
    dprintf((" deferred=%s\r\n", (saDevice.mode & 32) ? "on" : "off"));
    dprintf(("  channel: %d ", saDevice.channel));
    dprintf(("freq: %d ", saDevice.freq));
    dprintf(("power: %d ", saDevice.power));
    dprintf(("pitfreq: %d ", saDevice.orfreq));
    dprintf(("\r\n"));
#endif
}

int saDacToPowerIndex(int dac)
{
    for (int idx = 3 ; idx >= 0 ; idx--) {
        if (saPowerTable[idx].valueV1 <= dac)
            return idx;
    }
    return 0;
}

//
// Autobauding
//

#define SMARTBAUD_MIN 4800
#define SMARTBAUD_MAX 4950
uint16_t sa_smartbaud = SMARTBAUD_MIN;
static int sa_adjdir = 1; // -1=going down, 1=going up
static int sa_baudstep = 50;

#define SMARTAUDIO_CMD_TIMEOUT    120

static void saAutobaud(void)
{
    if (saStat.pktsent < 10)
        // Not enough samples collected
        return;

#if 0
    dprintf(("autobaud: %d rcvd %d/%d (%d)\r\n",
        sa_smartbaud, saStat.pktrcvd, saStat.pktsent, ((saStat.pktrcvd * 100) / saStat.pktsent)));
#endif

    if (((saStat.pktrcvd * 100) / saStat.pktsent) >= 70) {
        // This is okay
        saStat.pktsent = 0; // Should be more moderate?
        saStat.pktrcvd = 0;
        return;
    }

    dprintf(("autobaud: adjusting\r\n"));

    if ((sa_adjdir == 1) && (sa_smartbaud == SMARTBAUD_MAX)) {
       sa_adjdir = -1;
       dprintf(("autobaud: now going down\r\n"));
    } else if ((sa_adjdir == -1 && sa_smartbaud == SMARTBAUD_MIN)) {
       sa_adjdir = 1;
       dprintf(("autobaud: now going up\r\n"));
    }

    sa_smartbaud += sa_baudstep * sa_adjdir;

    dprintf(("autobaud: %d\r\n", sa_smartbaud));

    smartAudioSerialPort->vTable->serialSetBaudRate(smartAudioSerialPort, sa_smartbaud);

    saStat.pktsent = 0;
    saStat.pktrcvd = 0;
}

// Transport level variables

static uint32_t sa_lastTransmission = 0;
static uint8_t sa_outstanding = SA_CMD_NONE; // Outstanding command
static uint8_t sa_osbuf[32]; // Outstanding comamnd frame for retransmission
static int sa_oslen;         // And associate length

#ifdef CMS
void saCmsUpdate(void);
#endif

static void saProcessResponse(uint8_t *buf, int len)
{
    uint8_t resp = buf[0];

    if (resp == sa_outstanding) {
        sa_outstanding = SA_CMD_NONE;
    } else if ((resp == SA_CMD_GET_SETTINGS_V2) && (sa_outstanding == SA_CMD_GET_SETTINGS)) {
        sa_outstanding = SA_CMD_NONE;
    } else {
        saStat.ooopresp++;
        dprintf(("processResponse: outstanding %d got %d\r\n", sa_outstanding, resp));
    }

    switch (resp) {
    case SA_CMD_GET_SETTINGS_V2: // Version 2 Get Settings
    case SA_CMD_GET_SETTINGS:    // Version 1 Get Settings
        if (len < 7)
            break;

        saDevice.version = (buf[0] == SA_CMD_GET_SETTINGS) ? 1 : 2;
        saDevice.channel = buf[2];
        saDevice.power = buf[3];
        saDevice.mode = buf[4];
        saDevice.freq = (buf[5] << 8)|buf[6];

#ifdef SMARTAUDIO_DEBUG_MONITOR
        debug[0] = saDevice.version * 100 + saDevice.mode;
        debug[1] = saDevice.channel;
        debug[2] = saDevice.freq;
        debug[3] = saDevice.power;
#endif
        break;

    case SA_CMD_SET_POWER: // Set Power
        break;

    case SA_CMD_SET_CHAN: // Set Channel
        break;

    case SA_CMD_SET_FREQ: // Set Frequency
        if (len < 5)
            break;

        uint16_t freq = (buf[2] << 8)|buf[3];

        if (freq & SA_FREQ_GETPIT) {
            saDevice.orfreq = freq & SA_FREQ_MASK;
            dprintf(("saProcessResponse: GETPIT freq %d\r\n", saDevice.orfreq));
        } else if (freq & SA_FREQ_SETPIT) {
            saDevice.orfreq = freq & SA_FREQ_MASK;
            dprintf(("saProcessResponse: SETPIT freq %d\r\n", saDevice.orfreq));
        } else {
            saDevice.freq = freq;
            dprintf(("saProcessResponse: SETFREQ freq %d\r\n", freq));
        }
        break;

    case SA_CMD_SET_MODE: // Set Mode
        dprintf(("saProcessResponse: SET_MODE 0x%x\r\n", buf[2]));
        break;

    default:
        saStat.badcode++;
        return;
    }

    // Debug
    if (memcmp(&saDevice, &saDevicePrev, sizeof(smartAudioDevice_t)))
        saPrintSettings();
    saDevicePrev = saDevice;

#ifdef VTX_COMMON
    // Todo: Update states in saVtxDevice?
#endif

#ifdef CMS
    // Export current device status for CMS
    saCmsUpdate();
    saUpdateStatusString();
#endif
}

//
// Datalink
//

static void saReceiveFramer(uint8_t c)
{

    static enum saFramerState_e {
        S_WAITPRE1, // Waiting for preamble 1 (0xAA)
        S_WAITPRE2, // Waiting for preamble 2 (0x55)
        S_WAITRESP, // Waiting for response code
        S_WAITLEN,  // Waiting for length
        S_DATA,     // Receiving data
        S_WAITCRC,  // Waiting for CRC
    } state = S_WAITPRE1;

    static int len;
    static int dlen;

    switch (state) {
    case S_WAITPRE1:
        if (c == 0xAA) {
            state = S_WAITPRE2;
        } else {
            state = S_WAITPRE1; // Don't need this (no change)
        }
        break;

    case S_WAITPRE2:
        if (c == 0x55) {
            state = S_WAITRESP;
        } else {
            saStat.badpre++;
            state = S_WAITPRE1;
        }
        break;

    case S_WAITRESP:
        sa_rbuf[0] = c;
        state = S_WAITLEN;
        break;

    case S_WAITLEN:
        sa_rbuf[1] = c;
        len = c;

        if (len > SA_MAX_RCVLEN - 2) {
            saStat.badlen++;
            state = S_WAITPRE1;
        } else if (len == 0) {
            state = S_WAITCRC;
        } else {
            dlen = 0;
            state = S_DATA;
        }
        break;

    case S_DATA:
        // XXX Should check buffer overflow (-> saerr_overflow)
        sa_rbuf[2 + dlen] = c;
        if (++dlen == len) {
            state = S_WAITCRC;
        }
        break;

    case S_WAITCRC:
        if (CRC8(sa_rbuf, 2 + len) == c) {
            // Got a response
            saProcessResponse(sa_rbuf, len + 2);
            saStat.pktrcvd++;
        } else if (sa_rbuf[0] & 1) {
            // Command echo
            // XXX There is an exceptional case (V2 response)
            // XXX Should check crc in the command format?
        } else {
            saStat.crc++;
        }
        state = S_WAITPRE1;
        break;
    }
}

static void saSendFrame(uint8_t *buf, int len)
{
    int i;

    serialWrite(smartAudioSerialPort, 0x00); // Generate 1st start bit

    for (i = 0 ; i < len ; i++)
        serialWrite(smartAudioSerialPort, buf[i]);

    serialWrite(smartAudioSerialPort, 0x00); // XXX Probably don't need this

    sa_lastTransmission = millis();
    saStat.pktsent++;
}

/*
 * Retransmission and command queuing
 *
 *   The transport level support includes retransmission on response timeout
 * and command queueing.
 *
 * Resend buffer:
 *   The smartaudio returns response for valid command frames in no less
 * than 60msec, which we can't wait. So there's a need for a resend buffer.
 *
 * Command queueing:
 *   The driver autonomously sends GetSettings command for auto-bauding,
 * asynchronous to user initiated commands; commands issued while another
 * command is outstanding must be queued for later processing.
 *   The queueing also handles the case in which multiple commands are
 * required to implement a user level command.
 */

// Retransmission

static void saResendCmd(void)
{
    saSendFrame(sa_osbuf, sa_oslen);
}

static void saSendCmd(uint8_t *buf, int len)
{
    int i;

    for (i = 0 ; i < len ; i++)
        sa_osbuf[i] = buf[i];

    sa_oslen = len;
    sa_outstanding = (buf[2] >> 1);

    saSendFrame(sa_osbuf, sa_oslen);
}

// Command queue management

typedef struct saCmdQueue_s {
    uint8_t *buf;
    int len;
} saCmdQueue_t;

#define SA_QSIZE 4     // 1 heartbeat (GetSettings) + 2 commands + 1 slack
static saCmdQueue_t sa_queue[SA_QSIZE];
static uint8_t sa_qhead = 0;
static uint8_t sa_qtail = 0;

#ifdef DPRINTF_SMARTAUDIO
static int saQueueLength()
{
    if (sa_qhead >= sa_qtail) {
        return sa_qhead - sa_qtail;
    } else {
        return SA_QSIZE + sa_qhead - sa_qtail;
    }
}
#endif

static bool saQueueEmpty()
{
    return sa_qhead == sa_qtail;
}

static bool saQueueFull()
{
    return ((sa_qhead + 1) % SA_QSIZE) == sa_qtail;
}

static void saQueueCmd(uint8_t *buf, int len)
{
    if (saQueueFull())
         return;

    sa_queue[sa_qhead].buf = buf;
    sa_queue[sa_qhead].len = len;
    sa_qhead = (sa_qhead + 1) % SA_QSIZE;
}

static void saSendQueue(void)
{
    if (saQueueEmpty())
         return;

    saSendCmd(sa_queue[sa_qtail].buf, sa_queue[sa_qtail].len);
    sa_qtail = (sa_qtail + 1) % SA_QSIZE;
}

// Individual commands

static void saGetSettings(void)
{
    static uint8_t bufGetSettings[5] = {0xAA, 0x55, SACMD(SA_CMD_GET_SETTINGS), 0x00, 0x9F};

    saQueueCmd(bufGetSettings, 5);
}

void saSetFreq(uint16_t freq)
{
    static uint8_t buf[7] = { 0xAA, 0x55, SACMD(SA_CMD_SET_FREQ), 2 };

    if (freq & SA_FREQ_GETPIT) {
        dprintf(("smartAudioSetFreq: GETPIT\r\n"));
    } else if (freq & SA_FREQ_SETPIT) {
        dprintf(("smartAudioSetFreq: SETPIT %d\r\n", freq & SA_FREQ_MASK));
    } else {
        dprintf(("smartAudioSetFreq: SET %d\r\n", freq));
    }

    buf[4] = (freq >> 8) & 0xff;
    buf[5] = freq & 0xff;
    buf[6] = CRC8(buf, 6);

    saQueueCmd(buf, 7);
}

#if 0
static void saSetPitFreq(uint16_t freq)
{
    saSetFreq(freq | SA_FREQ_SETPIT);
}

static void saGetPitFreq(void)
{
    saSetFreq(SA_FREQ_GETPIT);
}
#endif

void saSetBandAndChannel(uint8_t band, uint8_t channel)
{
    static uint8_t buf[6] = { 0xAA, 0x55, SACMD(SA_CMD_SET_CHAN), 1 };

    buf[4] = band * 8 + channel;
    buf[5] = CRC8(buf, 5);

    saQueueCmd(buf, 6);
}

void saSetMode(int mode)
{
    static uint8_t buf[6] = { 0xAA, 0x55, SACMD(SA_CMD_SET_MODE), 1 };

    buf[4] = (mode & 0x3f)|saLockMode;
    buf[5] = CRC8(buf, 5);

    saQueueCmd(buf, 6);
}

void saSetPowerByIndex(uint8_t index)
{
    static uint8_t buf[6] = { 0xAA, 0x55, SACMD(SA_CMD_SET_POWER), 1 };

    dprintf(("saSetPowerByIndex: index %d\r\n", index));

    if (saDevice.version == 0) {
        // Unknown or yet unknown version.
        return;
    }

    if (index > 3)
        return;

    buf[4] = (saDevice.version == 1) ? saPowerTable[index].valueV1 : saPowerTable[index].valueV2;
    buf[5] = CRC8(buf, 5);
    saQueueCmd(buf, 6);
}

bool vtxSmartAudioInit()
{
#ifdef SMARTAUDIO_DPRINTF
    // Setup debugSerialPort

    debugSerialPort = openSerialPort(DPRINTF_SERIAL_PORT, FUNCTION_NONE, NULL, 115200, MODE_RXTX, 0);
    if (debugSerialPort) {
        setPrintfSerialPort(debugSerialPort);
        dprintf(("smartAudioInit: OK\r\n"));
    }
#endif

    serialPortConfig_t *portConfig = findSerialPortConfig(FUNCTION_VTX_SMARTAUDIO);
    if (portConfig) {
        smartAudioSerialPort = openSerialPort(portConfig->identifier, FUNCTION_VTX_SMARTAUDIO, NULL, 4800, MODE_RXTX, SERIAL_BIDIR|SERIAL_BIDIR_PP);
    }

    if (!smartAudioSerialPort) {
        return false;
    }

    vtxCommonRegisterDevice(&vtxSmartAudio);

    return true;
}

void vtxSAProcess(uint32_t now)
{
    static char initPhase = 0;

    if (smartAudioSerialPort == NULL)
        return;

    while (serialRxBytesWaiting(smartAudioSerialPort) > 0) {
        uint8_t c = serialRead(smartAudioSerialPort);
        saReceiveFramer((uint16_t)c);
    }

    // Re-evaluate baudrate after each frame reception
    saAutobaud();

    switch (initPhase) {
    case 0:
        saGetSettings();
        saSendQueue();
        ++initPhase;
        return;

    case 1:
        // Don't send SA_FREQ_GETPIT to V1 device; it act as plain SA_CMD_SET_FREQ,
        // and put the device into user frequency mode with uninitialized freq.
        if (saDevice.version == 2)
            saSetFreq(SA_FREQ_GETPIT);
        ++initPhase;
        break;
    }

    if ((sa_outstanding != SA_CMD_NONE)
            && (now - sa_lastTransmission > SMARTAUDIO_CMD_TIMEOUT)) {
        // Last command timed out
        // dprintf(("process: resending 0x%x\r\n", sa_outstanding));
        // XXX Todo: Resend termination and possible offline transition
        saResendCmd();
    } else if (!saQueueEmpty()) {
        // Command pending. Send it.
        // dprintf(("process: sending queue\r\n"));
        saSendQueue();
    } else if (now - sa_lastTransmission >= 1000) {
        // Heart beat for autobauding
        //dprintf(("process: sending heartbeat\r\n"));
        saGetSettings();
        saSendQueue();
    }

#ifdef SMARTAUDIO_TEST_VTX_COMMON
    // Testing VTX_COMMON API
    {
        static uint32_t lastMonitorUs = 0;
        if (cmp32(now, lastMonitorUs) < 5 * 1000 * 1000)
            return;

        static uint8_t monBand;
        static uint8_t monChan;
        static uint8_t monPower;

        vtxCommonGetBandAndChannel(&monBand, &monChan);
        vtxCommonGetPowerIndex(&monPower);
        debug[0] = monBand;
        debug[1] = monChan;
        debug[2] = monPower;
    }
#endif
}

#ifdef VTX_COMMON
// Interface to common VTX API

vtxDevType_e vtxSAGetDeviceType(void)
{
    return VTXDEV_SMARTAUDIO;
}

bool vtxSAIsReady(void)
{
    return !(saDevice.version == 0);
}

void vtxSASetBandAndChannel(uint8_t band, uint8_t channel)
{
    if (band && channel)
        saSetBandAndChannel(band - 1, channel - 1);
}

void vtxSASetPowerByIndex(uint8_t index)
{
    if (index == 0) {
        // SmartAudio doesn't support power off.
        return;
    }

    saSetPowerByIndex(index - 1);
}

void vtxSASetPitMode(uint8_t onoff)
{
    if (!(vtxSAIsReady() && (saDevice.version == 2)))
        return;

    if (onoff) {
        // SmartAudio can not turn pit mode on by software.
        return;
    }

    uint8_t newmode = SA_MODE_CLR_PITMODE;

    if (saDevice.mode & SA_MODE_GET_IN_RANGE_PITMODE)
        newmode |= SA_MODE_SET_IN_RANGE_PITMODE;

    if (saDevice.mode & SA_MODE_GET_OUT_RANGE_PITMODE)
        newmode |= SA_MODE_SET_OUT_RANGE_PITMODE;

    saSetMode(newmode);

    return;
}

bool vtxSAGetBandAndChannel(uint8_t *pBand, uint8_t *pChannel)
{
    if (!vtxSAIsReady())
        return false;

    *pBand = (saDevice.channel / 8) + 1;
    *pChannel = (saDevice.channel % 8) + 1;
    return true;
}

bool vtxSAGetPowerIndex(uint8_t *pIndex)
{
    if (!vtxSAIsReady())
        return false;

    *pIndex = ((saDevice.version == 1) ? saDacToPowerIndex(saDevice.power) : saDevice.power) + 1;
    return true;
}

bool vtxSAGetPitMode(uint8_t *pOnOff)
{
    if (!(vtxSAIsReady() && (saDevice.version == 2)))
        return false;

    *pOnOff = (saDevice.mode & SA_MODE_GET_PITMODE) ? 1 : 0;
    return true;
}

static const vtxVTable_t saVTable = {
    .process = vtxSAProcess,
    .getDeviceType = vtxSAGetDeviceType,
    .isReady = vtxSAIsReady,
    .setBandAndChannel = vtxSASetBandAndChannel,
    .setPowerByIndex = vtxSASetPowerByIndex,
    .setPitMode = vtxSASetPitMode,
    .getBandAndChannel = vtxSAGetBandAndChannel,
    .getPowerIndex = vtxSAGetPowerIndex,
    .getPitMode = vtxSAGetPitMode,
};
#endif // VTX_COMMON


#endif // VTX_SMARTAUDIO
