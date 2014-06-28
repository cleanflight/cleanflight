/*
 * This file is part of baseflight
 * Licensed under GPL V3 or modified DCL - see https://github.com/multiwii/baseflight/blob/master/README.md
 */
#pragma once

typedef enum I2CDevice {
    I2CDEV_1,
    I2CDEV_2,
    I2CDEV_MAX = I2CDEV_2,
} I2CDevice;

void i2cInit(I2CDevice index);
bool i2cWriteBuffer(uint8_t addr_, uint8_t reg_, uint8_t len_, uint8_t *data);
bool i2cWrite(uint8_t addr_, uint8_t reg, uint8_t data);
bool i2cRead(uint8_t addr_, uint8_t reg, uint8_t len, uint8_t* buf);
uint16_t i2cGetErrorCounter(void);
