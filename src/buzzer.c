/*
 * This file is part of baseflight
 * Licensed under GPL V3 or modified DCL - see https://github.com/multiwii/baseflight/blob/master/README.md
 */
#include "board.h"
#include "mw.h"
#include "buzzer.h"

/* Buzzer Sound Sequences: (Square wave generation)
 * Sequence must end with 0xFF or 0xFE. 0xFE repeats the sequence from
 * start when 0xFF stops the sound when it's completed.
 * If repeat is used then BUZZER_STOP call must be used for stopping the sound.
 *
 * "Sound" Sequences are made so that 1st, 3rd, 5th.. are the delays how
 * long the buzzer is on and 2nd, 4th, 6th.. are the delays how long buzzer
 * is off.
 */
// fast beep:
static const uint8_t buzz_shortBeep[] = {
    5,5, 0xFF
};
// fast beep:
static const uint8_t buzz_BatteryBeep[] = {
    10,5, 0xFF
};
// medium beep
static const uint8_t buzz_mediumBeepFast[] = {
    35, 30, 0xFF
};
// medium beep and pause after that
static const uint8_t buzz_mediumBeep[] = {
    35, 150, 0xFF
};
// Long beep and pause after that
static const uint8_t buzz_longBeep[] = {
    70, 200, 0xFF
};
// SOS morse code:
static const uint8_t buzz_sos[] = {
    10,10, 10,10, 10,40, 40,10, 40,10, 40,40, 10,10, 10,10, 10,70, 0xFF
};
// Arming when GPS is fixed
static const uint8_t buzz_armed[] = {
    5,5, 15,5, 5,5, 15,30, 0xFF
};
// Ready beeps. When gps has fix and copter is ready to fly.
static const uint8_t buzz_readyBeep[] = {
    4,5, 4,5, 8,5, 15,5, 8,5, 4,5, 4,5, 0xFF
};
// 2 fast short beeps
static const uint8_t buzz_2shortBeeps[] = {
    5,5, 5,5, 0xFF
};
// 3 fast short beeps
static const uint8_t buzz_3shortBeeps[] = {
    5,5, 5,5, 5,5, 0xFF
};
// Array used for beeps when reporting GPS satellite count (up to 10 satellites)
static uint8_t buzz_countSats[22];

// Current Buzzer mode
static uint8_t buzzerMode = BUZZER_STOPPED;
// Buzzer off = 0 Buzzer on = 1
static uint8_t buzzerIsOn = 0;
// Pointer to current sequence
static const uint8_t* buzzerPtr = NULL;
// Place in current sequence
static uint16_t buzzerPos = 0;
// Time when buzzer routine must act next time
static uint32_t buzzerNextToggleTime = 0;
// Variable for checking if ready beep has been done
static uint8_t readyBeepDone = 0;

static void buzzerCalculations(void);

/* Buzzer -function is used to activate/deactive buzzer.
 * Parameter defines the used sequence.
 */
void buzzer(uint8_t mode)
{
    uint8_t i = 0;

    // Just return if same or higher priority sound is active.
    if (buzzerMode <= mode)
        return;
    switch (mode) {
        case BUZZER_STOP:
            buzzerMode = BUZZER_STOPPED;
            buzzerNextToggleTime = millis();
            BEEP_OFF;
            buzzerIsOn = 0;
            buzzerPtr = NULL;
            break;
        case BUZZER_READY_BEEP:
            if (readyBeepDone)
                return;
            buzzerPtr = buzz_readyBeep;
            buzzerMode = mode;
            readyBeepDone = 1;
            break;
        case BUZZER_ARMING:
        case BUZZER_DISARMING:
            buzzerPtr = buzz_mediumBeepFast;
            buzzerMode = mode;
            buzzerNextToggleTime = 0;
            break;
        case BUZZER_ACC_CALIBRATION:
            buzzerPtr = buzz_2shortBeeps;
            buzzerMode = mode;
            break;
        case BUZZER_ACC_CALIBRATION_FAIL:
            buzzerPtr = buzz_3shortBeeps;
            buzzerMode = mode;
            break;
        case BUZZER_TX_LOST_ARMED:
            buzzerPtr = buzz_sos;
            buzzerMode = mode;
            break;
        case BUZZER_BAT_LOW:
            buzzerPtr = buzz_longBeep;
            buzzerMode = mode;
            break;
        case BUZZER_BAT_CRIT_LOW:
            buzzerPtr = buzz_BatteryBeep;
            buzzerMode = mode;
            break;
        case BUZZER_ARMED:
        case BUZZER_TX_LOST:
            buzzerPtr = buzz_mediumBeep;
            buzzerMode = mode;
            break;
        case BUZZER_ARMING_GPS_FIX:
            buzzerPtr = buzz_armed;
            buzzerMode = mode;
            buzzerNextToggleTime = 0;
            break;
        case BUZZER_TX_SET:
#ifdef GPS
            if (feature(FEATURE_GPS) && f.GPS_FIX && GPS_numSat >= 5) {
                do {
                    buzz_countSats[i] = 5;
                    buzz_countSats[i + 1] = 15;
                    i += 2;
                } while (i < 20 && GPS_numSat > i / 2);
                buzz_countSats[i + 1] = 100;
                buzz_countSats[i + 2] = 0xFF;
                buzzerPtr = buzz_countSats;
                buzzerMode = mode;
                break;
            }
#endif
            buzzerPtr = buzz_shortBeep;
            buzzerMode = mode;
            break;
        default:
            return;
            break;
    }
    buzzerPos = 0;
}

/* buzzerUpdate -function is used in loop. It will update buzzer state
 * when the time is correct.
 */
void buzzerUpdate(void)
{
    // If beeper option from AUX switch has been selected
    if (rcOptions[BOXBEEPERON])
        if (buzzerMode > BUZZER_TX_SET)
            buzzer(BUZZER_TX_SET);

    // Buzzer routine doesn't need to update if there aren't any sounds ongoing
    if (buzzerMode == BUZZER_STOPPED || buzzerPtr == NULL)
        return;

    if (!buzzerIsOn && buzzerNextToggleTime <= millis()) {
        buzzerIsOn = 1;
        if (buzzerPtr[buzzerPos] != 0)
            BEEP_ON;
        buzzerCalculations();
    } else if (buzzerIsOn && buzzerNextToggleTime <= millis()) {
        buzzerIsOn = 0;
        if (buzzerPtr[buzzerPos] != 0)
            BEEP_OFF;
        buzzerCalculations();
    }
}

/* buzzerCalculation -function calculates position when is the next time
 * to change buzzer state
 */
void buzzerCalculations(void)
{
    // If sequence is 0xFE then repeat from start
    if (buzzerPtr[buzzerPos] == 0xFE)
        buzzerPos = 0;
    // If sequence is 0xFF then stop
    else if (buzzerPtr[buzzerPos] == 0xFF) {
        buzzerMode = BUZZER_STOPPED;
        BEEP_OFF;
        buzzerIsOn = 0;
    // Otherwise advance the sequence and calculate next toggle time
    } else {
        buzzerNextToggleTime = millis() + 10 * buzzerPtr[buzzerPos];
        buzzerPos++;
    }
}
