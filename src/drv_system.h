#pragma once

void systemInit(void);
void delayMicroseconds(uint32_t us);
void delay(uint32_t ms);

uint32_t micros(void);
uint32_t millis(void);

// failure
void failureMode(uint8_t mode);

// bootloader/IAP
void systemReset(bool toBootloader);

// current auto-detected hardware revision (enum HardwareRevision in board.h)
extern int hw_revision;
// current crystal frequency - 8 or 12MHz
extern uint32_t hse_value;
