/*
 * This file is part of baseflight
 * Licensed under GPL V3 or modified DCL - see https://github.com/multiwii/baseflight/blob/master/README.md
 */
 
#include "board.h"

// This sensor is available on MPU-9150. The accel/gyro in that chip use the same driver as MPU-6050.

// AK8975, mag sensor address
#define AK8975_MAG_I2C_ADDRESS     0x0C
#define AK8975_MAG_ID_ADDRESS      0x00
#define AK8975_MAG_DATA_ADDRESS    0x03
#define AK8975_MAG_CONTROL_ADDRESS 0x0A
 
static sensor_align_e magAlign = CW180_DEG;
 
bool ak8975detect(sensor_t * mag)
{
    bool ack = false;
    uint8_t sig = 0;
  
    // device ID is in register 0 and is equal to 'H'
    ack = i2cRead(AK8975_MAG_I2C_ADDRESS, AK8975_MAG_ID_ADDRESS, 1, &sig);
    if (!ack || sig != 'H')
        return false;

    mag->init = ak8975Init;
    mag->read = ak8975Read;
    
    return true;
}

void ak8975Init(sensor_align_e align)
{
    if (align > 0)
        magAlign = align;
    
    i2cWrite(AK8975_MAG_I2C_ADDRESS, AK8975_MAG_CONTROL_ADDRESS, 0x01); // start reading
}

void ak8975Read(int16_t *magData)
{
    uint8_t buf[6];
    int16_t mag[3];
    
    i2cRead(AK8975_MAG_I2C_ADDRESS, AK8975_MAG_DATA_ADDRESS, 6, buf);
    // align sensors to match MPU6050:
    // x -> y
    // y -> x
    // z-> -z
    mag[X] = -(int16_t)(buf[3] << 8 | buf[2]) * 4;
    mag[Y] = -(int16_t)(buf[1] << 8 | buf[0]) * 4;
    mag[Z] = -(int16_t)(buf[5] << 8 | buf[4]) * 4;
    
    alignSensors(mag, magData, magAlign);
    
    i2cWrite(AK8975_MAG_I2C_ADDRESS, AK8975_MAG_CONTROL_ADDRESS, 0x01); // start reading again
}
