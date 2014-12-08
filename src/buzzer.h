/*
 * This file is part of baseflight
 * Licensed under GPL V3 or modified DCL - see https://github.com/multiwii/baseflight/blob/master/README.md
 */
#pragma once

void buzzer(uint8_t mode);
void buzzerUpdate(void);

/* Buzzer different modes: (lower number is higher priority)
 * BUZZER_STOP - Stops beeping
 * BUZZER_BAT_CRIT_LOW - Faster warning beeps when battery is critically low (repeats)
 * BUZZER_BAT_LOW - Warning beeps when battery is getting low (repeats)
 * BUZZER_TX_LOST_ARMED - Beeps SOS when armed and TX is turned off or signal lost (autolanding/autodisarm)
 * BUZZER_TX_LOST - Beeps when TX is turned off or signal lost (repeat until TX is okay)
 * BUZZER_DISARMING - One beep when disarming the board
 * BUZZER_ARMING - One beep when arming the board
 * BUZZER_ARMING_GPS_FIX - Beep a tone when arming the board and GPS has fix
 * BUZZER_TX_SET - Beeps when aux channel is set for beep or beep sequence how many satellites has found if GPS enabled.
 * BUZZER_ARMED - Warning beeps when board is armed. (repeats until board is disarmed or throttle is increased)
 * BUZZER_ACC_CALIBRATION - ACC inflight calibration completed confirmation
 * BUZZER_ACC_CALIBRATION_FAIL - ACC inflight calibration failed
 * BUZZER_READY_BEEP - Ring a tone when board is ready to flight (GPS ready).
 */
enum {
    BUZZER_STOP = 0, // Highest priority command which is used only for stopping the buzzer
    BUZZER_BAT_CRIT_LOW,
    BUZZER_BAT_LOW,
    BUZZER_TX_LOST_ARMED,
    BUZZER_TX_LOST,
    BUZZER_DISARMING,
    BUZZER_ARMING,
    BUZZER_ARMING_GPS_FIX,
    BUZZER_TX_SET,
    BUZZER_ARMED,
    BUZZER_ACC_CALIBRATION,
    BUZZER_ACC_CALIBRATION_FAIL,
    BUZZER_READY_BEEP,
    BUZZER_STOPPED // State which is used when buzzer is in idle mode
};
