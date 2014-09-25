/*
 * This file is part of baseflight
 * Licensed under GPL V3 or modified DCL - see https://github.com/multiwii/baseflight/blob/master/README.md
 */
 
#include "board.h"
 
// only the mag driver is included here as the accel/mag are the same as mpu6050.
 
// MPU9150, mag sensor address
#define MPU9150_MAG_I2C_ADDRESS     0x0C
#define MPU9150_MAG_ID_ADDRESS      0x00
#define MPU9150_MAG_DATA_ADDRESS    0x03
#define MPU9150_MAG_CONTROL_ADDRESS 0x0A
 
static sensor_align_e magAlign = CW180_DEG;
 
bool mpu9150detect(sensor_t * mag)
{
    bool ack = false;
    uint8_t sig = 0;
  
    // device ID is in register 0 and is equal to 'H'
    ack = i2cRead((MPU9150_MAG_I2C_ADDRESS), MPU9150_MAG_ID_ADDRESS, 1, &sig);
    if (!ack || sig != 'H')
        return false;

    mag->init = mpu9150Init;
    mag->read = mpu9150Read;
    
    return true;
}

void mpu9150Init(sensor_align_e align)
{
    if (align > 0)
    magAlign = align;
    
    i2cWrite(MPU9150_MAG_I2C_ADDRESS, MPU9150_MAG_CONTROL_ADDRESS, 0x01); // start reading
}

void mpu9150Read(int16_t *magData)
{
    uint8_t buf[6];
    int16_t mag[3];
    
    i2cRead(MPU9150_MAG_I2C_ADDRESS, MPU9150_MAG_DATA_ADDRESS, 6, buf);
    // align sensors to match MPU6050:
    // x -> y
    // y -> x
    // z-> -z
    mag[X] = -(int16_t)(buf[3] << 8 | buf[2]) *4;
    mag[Y] = -(int16_t)(buf[1] << 8 | buf[0]) *4;
    mag[Z] = -(int16_t)(buf[5] << 8 | buf[4]) *4;
    
    alignSensors(mag, magData, magAlign);
    
    i2cWrite(MPU9150_MAG_I2C_ADDRESS, MPU9150_MAG_CONTROL_ADDRESS, 0x01); // start reading again
}
