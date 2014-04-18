#include "stdbool.h"
#include "stdint.h"

#include "platform.h"
#include "drivers/sound_beeper.h"
#include "drivers/system_common.h"
#include "drivers/serial_common.h" // FIXME this file should not have a dependency on serial ports, see core_t from runtime_config.h
#include "failsafe.h"
#include "sensors_common.h"
#include "runtime_config.h"
#include "feature.h"

#include "buzzer.h"

#define LONG_PAUSE_DELAY 50

static uint8_t buzzerIsOn = 0, beepDone = 0;
static uint32_t buzzerLastToggleTime;
static void beep(uint16_t pulse);
static void beep_code(char first, char second, char third, char pause);

uint8_t toggleBeep = 0;

typedef enum {
    FAILSAFE_IDLE = 0,
    FAILSAFE_LANDING,
    FAILSAFE_FIND_ME
} failsafeBuzzerWarnings_e;

void buzzer(bool warn_vbat)
{
    static uint8_t beeperOnBox;
    static uint8_t warn_noGPSfix = 0;
    static failsafeBuzzerWarnings_e warn_failsafe = FAILSAFE_IDLE;
    static uint8_t warn_runtime = 0;

    //=====================  BeeperOn via rcOptions =====================
    if (rcOptions[BOXBEEPERON]) {       // unconditional beeper on via AUXn switch
        beeperOnBox = 1;
    } else {
        beeperOnBox = 0;
    }
    //===================== Beeps for failsafe =====================
    if (feature(FEATURE_FAILSAFE)) {
        if (shouldFailsafeForceLanding(f.ARMED)) {
            warn_failsafe = FAILSAFE_LANDING;

            if (shouldFailsafeHaveCausedLandingByNow()) {
                warn_failsafe = FAILSAFE_FIND_ME;
            }
        }

        if (hasFailsafeTimerElapsed() && !f.ARMED) {
            warn_failsafe = FAILSAFE_FIND_ME;
        }

        if (isFailsafeIdle()) {
            warn_failsafe = FAILSAFE_IDLE;      // turn off alarm if TX is okay
        }
    }

    //===================== GPS fix notification handling =====================
    if (sensors(SENSOR_GPS)) {
        if ((rcOptions[BOXGPSHOME] || rcOptions[BOXGPSHOLD]) && !f.GPS_FIX) {     // if no fix and gps funtion is activated: do warning beeps
            warn_noGPSfix = 1;
        } else {
            warn_noGPSfix = 0;
        }
    }

    //===================== Priority driven Handling =====================
    // beepcode(length1,length2,length3,pause)
    // D: Double, L: Long, M: Middle, S: Short, N: None
    if (warn_failsafe == 2)
        beep_code('L','N','N','D');                 // failsafe "find me" signal
    else if (warn_failsafe == 1)
        beep_code('S','M','L','M');                 // failsafe landing active
    else if (warn_noGPSfix == 1)
        beep_code('S','S','N','M');
    else if (beeperOnBox == 1)
        beep_code('S','S','S','M');                 // beeperon
    else if (warn_vbat)
        beep_code('S','M','M','D');
    else if (warn_runtime == 1 && f.ARMED)
        beep_code('S','S','M','N');                 // Runtime warning
    else if (toggleBeep > 0)
        beep(50);                                   // fast confirmation beep
    else {
        buzzerIsOn = 0;
        BEEP_OFF;
    }
}

void beep_code(char first, char second, char third, char pause)
{
    char patternChar[4];
    uint16_t Duration;
    static uint8_t icnt = 0;

    patternChar[0] = first;
    patternChar[1] = second;
    patternChar[2] = third;
    patternChar[3] = pause;
    switch(patternChar[icnt]) {
        case 'M':
            Duration = 100;
            break;
        case 'L':
            Duration = 200;
            break;
        case 'D':
            Duration = 2000;
            break;
        case 'N':
            Duration = 0;
            break;
        default:
            Duration = LONG_PAUSE_DELAY;
            break;
    }

    if (icnt < 3 && Duration != 0)
        beep(Duration);
    if (icnt >= 3 && (buzzerLastToggleTime < millis() - Duration)) {
        icnt = 0;
        toggleBeep = 0;
    }
    if (beepDone == 1 || Duration == 0) {
        if (icnt < 3)
            icnt++;
        beepDone = 0;
        buzzerIsOn = 0;
        BEEP_OFF;
    }
}

static void beep(uint16_t pulse)
{
    if (!buzzerIsOn && (millis() >= (buzzerLastToggleTime + LONG_PAUSE_DELAY))) {         // Buzzer is off and long pause time is up -> turn it on
        buzzerIsOn = 1;
        BEEP_ON;
        buzzerLastToggleTime = millis();      // save the time the buzer turned on
    } else if (buzzerIsOn && (millis() >= buzzerLastToggleTime + pulse)) {         // Buzzer is on and time is up -> turn it off
        buzzerIsOn = 0;
        BEEP_OFF;
        buzzerLastToggleTime = millis();
        if (toggleBeep >0)
            toggleBeep--;
        beepDone = 1;
    }
}
