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

#include <math.h>

#include "platform.h"

#ifdef USE_MAG_AK8963

#include "build/build_config.h"

#include "build/debug.h"

#include "common/axis.h"
#include "common/maths.h"

#include "config/parameter_group.h"

#include "system.h"
#include "gpio.h"
#include "exti.h"
#include "bus_i2c.h"
#include "bus_spi.h"

#include "sensor.h"
#include "compass.h"

#include "accgyro.h"
#include "accgyro_mpu.h"
#include "accgyro_mpu6500.h"
#include "accgyro_spi_mpu6500.h"
#include "compass_ak8963.h"

// This sensor is available in MPU-9250.
#ifndef AK8963_I2C_INSTANCE
#define AK8963_I2C_INSTANCE I2C_DEVICE
#endif

// AK8963, mag sensor address
#define AK8963_MAG_I2C_ADDRESS          0x0C
#define AK8963_Device_ID                0x48

// Registers
#define AK8963_MAG_REG_WHO_AM_I         0x00
#define AK8963_MAG_REG_INFO             0x01
#define AK8963_MAG_REG_STATUS1          0x02
#define AK8963_MAG_REG_HXL              0x03
#define AK8963_MAG_REG_HXH              0x04
#define AK8963_MAG_REG_HYL              0x05
#define AK8963_MAG_REG_HYH              0x06
#define AK8963_MAG_REG_HZL              0x07
#define AK8963_MAG_REG_HZH              0x08
#define AK8963_MAG_REG_STATUS2          0x09
#define AK8963_MAG_REG_CNTL             0x0a
#define AK8963_MAG_REG_ASCT             0x0c // self test
#define AK8963_MAG_REG_ASAX             0x10 // Fuse ROM x-axis sensitivity adjustment value
#define AK8963_MAG_REG_ASAY             0x11 // Fuse ROM y-axis sensitivity adjustment value
#define AK8963_MAG_REG_ASAZ             0x12 // Fuse ROM z-axis sensitivity adjustment value

#define READ_FLAG                       0x80

#define STATUS1_DATA_READY              0x01
#define STATUS1_DATA_OVERRUN            0x02

#define STATUS2_DATA_ERROR              0x02
#define STATUS2_MAG_SENSOR_OVERFLOW     0x03

#define CNTL_MODE_POWER_DOWN            0x00
#define CNTL_MODE_ONCE                  0x01
#define CNTL_MODE_CONT1                 0x02
#define CNTL_MODE_CONT2                 0x06
#define CNTL_MODE_SELF_TEST             0x08
#define CNTL_MODE_FUSE_ROM              0x0F

static float magGain[3] = { 1.0f, 1.0f, 1.0f };

// FIXME pretend we have real MPU9250 support
// Is an separate MPU9250 driver really needed? The GYRO/ACC part between MPU6500 and MPU9250 is exactly the same.
#ifdef MPU6500_SPI_INSTANCE
#define MPU9250_SPI_INSTANCE
#define verifympu9250WriteRegister mpu6500WriteRegister
#define mpu9250WriteRegister mpu6500WriteRegister
#define mpu9250ReadRegister mpu6500ReadRegister
#endif

#if defined(USE_SPI) && defined(MPU9250_SPI_INSTANCE)

typedef struct queuedReadState_s {
    bool waiting;
    uint8_t len;
    uint32_t readStartedAt; // time read was queued in micros.
} queuedReadState_t;

typedef enum {
    CHECK_STATUS = 0,
    WAITING_FOR_STATUS,
    WAITING_FOR_DATA
} ak8963ReadState_e;

static queuedReadState_t queuedRead = { false, 0, 0};

bool ak8963SensorRead(uint8_t addr_, uint8_t reg_, uint8_t len_, uint8_t *buf)
{
    verifympu9250WriteRegister(MPU_RA_I2C_SLV0_ADDR, addr_ | READ_FLAG);   // set I2C slave address for read
    verifympu9250WriteRegister(MPU_RA_I2C_SLV0_REG, reg_);                 // set I2C slave register
    verifympu9250WriteRegister(MPU_RA_I2C_SLV0_CTRL, len_ | 0x80);         // read number of bytes
    delay(8);
    __disable_irq();
    mpu9250ReadRegister(MPU_RA_EXT_SENS_DATA_00, len_, buf);               // read I2C
    __enable_irq();
    return true;
}

bool ak8963SensorWrite(uint8_t addr_, uint8_t reg_, uint8_t data)
{
    verifympu9250WriteRegister(MPU_RA_I2C_SLV0_ADDR, addr_);               // set I2C slave address for write
    verifympu9250WriteRegister(MPU_RA_I2C_SLV0_REG, reg_);                 // set I2C slave register
    verifympu9250WriteRegister(MPU_RA_I2C_SLV0_DO, data);                  // set I2C salve value
    verifympu9250WriteRegister(MPU_RA_I2C_SLV0_CTRL, 0x81);                // write 1 byte
    return true;
}

bool ak8963SensorStartRead(uint8_t addr_, uint8_t reg_, uint8_t len_)
{
    if (queuedRead.waiting) {
        return false;
    }

    queuedRead.len = len_;

    verifympu9250WriteRegister(MPU_RA_I2C_SLV0_ADDR, addr_ | READ_FLAG);   // set I2C slave address for read
    verifympu9250WriteRegister(MPU_RA_I2C_SLV0_REG, reg_);                 // set I2C slave register
    verifympu9250WriteRegister(MPU_RA_I2C_SLV0_CTRL, len_ | 0x80);         // read number of bytes

    queuedRead.readStartedAt = micros();
    queuedRead.waiting = true;

    return true;
}

static uint32_t ak8963SensorQueuedReadTimeRemaining(void)
{
    if (!queuedRead.waiting) {
        return 0;
    }

    int32_t timeSinceStarted = micros() - queuedRead.readStartedAt;

    int32_t timeRemaining = 8000 - timeSinceStarted;

    if (timeRemaining < 0) {
        return 0;
    }

    return timeRemaining;
}

bool ak8963SensorCompleteRead(uint8_t *buf)
{
    uint32_t timeRemaining = ak8963SensorQueuedReadTimeRemaining();

    if (timeRemaining > 0) {
        delayMicroseconds(timeRemaining);
    }

    queuedRead.waiting = false;

    mpu9250ReadRegister(MPU_RA_EXT_SENS_DATA_00, queuedRead.len, buf);               // read I2C buffer
    return true;
}
#else
bool ak8963SensorRead(uint8_t addr_, uint8_t reg_, uint8_t len, uint8_t* buf)
{
    return i2cRead(addr_, reg_, len, buf);
}

bool ak8963SensorWrite(uint8_t addr_, uint8_t reg_, uint8_t data)
{
    return i2cWrite(addr_, reg_, data);
}
#endif

bool ak8963Detect(mag_t *mag)
{
    bool ack = false;
    uint8_t sig = 0;

#if defined(USE_SPI) && defined(MPU9250_SPI_INSTANCE)
    // initialze I2C master via SPI bus (MPU9250)

    ack = verifympu9250WriteRegister(MPU_RA_INT_PIN_CFG, 0x10);               // INT_ANYRD_2CLEAR
    delay(10);

    ack = verifympu9250WriteRegister(MPU_RA_I2C_MST_CTRL, 0x0D);              // I2C multi-master / 400kHz
    delay(10);

    ack = verifympu9250WriteRegister(MPU_RA_USER_CTRL, 0x30);                 // I2C master mode, SPI mode only
    delay(10);
#endif

    // check for AK8963
    ack = ak8963SensorRead(AK8963_MAG_I2C_ADDRESS, AK8963_MAG_REG_WHO_AM_I, 1, &sig);
    if (ack && sig == AK8963_Device_ID) // 0x48 / 01001000 / 'H'
    {
        mag->init = ak8963Init;
        mag->read = ak8963Read;

        return true;
    }
    return false;
}

bool ak8963Init()
{
    bool ack;
    UNUSED(ack);
    uint8_t calibration[3];
    uint8_t status;

    ack = ak8963SensorWrite(AK8963_MAG_I2C_ADDRESS, AK8963_MAG_REG_CNTL, CNTL_MODE_POWER_DOWN); // power down before entering fuse mode
    delay(20);

    ack = ak8963SensorWrite(AK8963_MAG_I2C_ADDRESS, AK8963_MAG_REG_CNTL, CNTL_MODE_FUSE_ROM); // Enter Fuse ROM access mode
    delay(10);

    ack = ak8963SensorRead(AK8963_MAG_I2C_ADDRESS, AK8963_MAG_REG_ASAX, sizeof(calibration), calibration); // Read the x-, y-, and z-axis calibration values
    delay(10);

    magGain[X] = (((((float)(int8_t)calibration[X] - 128) / 256) + 1) * 30);
    magGain[Y] = (((((float)(int8_t)calibration[Y] - 128) / 256) + 1) * 30);
    magGain[Z] = (((((float)(int8_t)calibration[Z] - 128) / 256) + 1) * 30);

    ack = ak8963SensorWrite(AK8963_MAG_I2C_ADDRESS, AK8963_MAG_REG_CNTL, CNTL_MODE_POWER_DOWN); // power down after reading.
    delay(10);

    // Clear status registers
    ack = ak8963SensorRead(AK8963_MAG_I2C_ADDRESS, AK8963_MAG_REG_STATUS1, 1, &status);
    ack = ak8963SensorRead(AK8963_MAG_I2C_ADDRESS, AK8963_MAG_REG_STATUS2, 1, &status);

    // Trigger first measurement
#if defined(USE_SPI) && defined(MPU9250_SPI_INSTANCE)
    ack = ak8963SensorWrite(AK8963_MAG_I2C_ADDRESS, AK8963_MAG_REG_CNTL, CNTL_MODE_CONT1);
#else
    ack = ak8963SensorWrite(AK8963_MAG_I2C_ADDRESS, AK8963_MAG_REG_CNTL, CNTL_MODE_ONCE);
#endif
    return true;
}

bool ak8963Read(int16_t *magData)
{
    bool ack = false;
    uint8_t buf[7];

#if defined(USE_SPI) && defined(MPU9250_SPI_INSTANCE)

    // we currently need a different approach for the MPU9250 connected via SPI.
    // we cannot use the ak8963SensorRead() method for SPI, it is to slow and blocks for far too long.

    static ak8963ReadState_e state = CHECK_STATUS;

    bool retry = true;

restart:
    switch (state) {
        case CHECK_STATUS:
            ak8963SensorStartRead(AK8963_MAG_I2C_ADDRESS, AK8963_MAG_REG_STATUS1, 1);
            state++;
            return false;

        case WAITING_FOR_STATUS: {
            uint32_t timeRemaining = ak8963SensorQueuedReadTimeRemaining();
            if (timeRemaining) {
                return false;
            }

            ack = ak8963SensorCompleteRead(&buf[0]);

            uint8_t status = buf[0];

            if (!ack || ((status & STATUS1_DATA_READY) == 0 && (status & STATUS1_DATA_OVERRUN) == 0)) {
                // too early. queue the status read again
                state = CHECK_STATUS;
                if (retry) {
                    retry = false;
                    goto restart;
                }
                return false;
            }


            // read the 6 bytes of data and the status2 register
            ak8963SensorStartRead(AK8963_MAG_I2C_ADDRESS, AK8963_MAG_REG_HXL, 7);

            state++;

            return false;
        }

        case WAITING_FOR_DATA: {
            uint32_t timeRemaining = ak8963SensorQueuedReadTimeRemaining();
            if (timeRemaining) {
                return false;
            }

            ack = ak8963SensorCompleteRead(&buf[0]);
        }
    }
#else
    ack = ak8963SensorRead(AK8963_MAG_I2C_ADDRESS, AK8963_MAG_REG_STATUS1, 1, &buf[0]);

    uint8_t status = buf[0];

    if (!ack || (status & STATUS1_DATA_READY) == 0) {
        return false;
    }

    ack = ak8963SensorRead(AK8963_MAG_I2C_ADDRESS, AK8963_MAG_REG_HXL, 7, &buf[0]);
#endif
    uint8_t status2 = buf[6];
    if (!ack || (status2 & STATUS2_DATA_ERROR) || (status2 & STATUS2_MAG_SENSOR_OVERFLOW)) {
        return false;
    }

    magData[X] = -(int16_t)(buf[1] << 8 | buf[0]) * magGain[X];
    magData[Y] = -(int16_t)(buf[3] << 8 | buf[2]) * magGain[Y];
    magData[Z] = -(int16_t)(buf[5] << 8 | buf[4]) * magGain[Z];

#if defined(USE_SPI) && defined(MPU9250_SPI_INSTANCE)
    state = CHECK_STATUS;
    return true;
#else
    return ak8963SensorWrite(AK8963_MAG_I2C_ADDRESS, AK8963_MAG_REG_CNTL, CNTL_MODE_ONCE); // start reading again
#endif
}
#endif
