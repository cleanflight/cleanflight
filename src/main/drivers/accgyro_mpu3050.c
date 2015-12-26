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

#include "platform.h"

#include "common/maths.h"

#include "system.h"
#include "exti.h"
#include "bus_i2c.h"

#include "sensor.h"
#include "accgyro.h"
#include "accgyro_mpu.h"
#include "accgyro_mpu3050.h"
#include "gyro_sync.h"

// MPU3050, Standard address 0x68
#define MPU3050_ADDRESS         0x68

// Bits
#define MPU3050_FS_SEL_2000DPS  0x18
#define MPU3050_DLPF_10HZ       0x05
#define MPU3050_DLPF_20HZ       0x04
#define MPU3050_DLPF_42HZ       0x03
#define MPU3050_DLPF_98HZ       0x02
#define MPU3050_DLPF_188HZ      0x01
#define MPU3050_DLPF_256HZ      0x00

#define MPU3050_USER_RESET      0x01
#define MPU3050_CLK_SEL_PLL_GX  0x01

static void mpu3050Init(uint8_t lpf);
static bool mpu3050ReadTemp(int16_t *tempData);

bool mpu3050Detect(gyro_t *gyro)
{
    if (mpuDetectionResult.sensor != MPU_3050) {
        return false;
    }
    gyro->init = mpu3050Init;
    gyro->read = mpuGyroRead;
    gyro->temperature = mpu3050ReadTemp;
    gyro->intStatus = checkMPUDataReady;

    // 16.4 dps/lsb scalefactor
    gyro->scale = 1.0f / 16.4f;

    return true;
}

static void mpu3050Init(uint8_t lpf)
{
    bool ack;

    delay(25); // datasheet page 13 says 20ms. other stuff could have been running meanwhile. but we'll be safe

    ack = mpuConfiguration.write(MPU3050_SMPLRT_DIV, 0);
    if (!ack)
        failureMode(FAILURE_ACC_INIT);

    mpuConfiguration.write(MPU3050_DLPF_FS_SYNC, MPU3050_FS_SEL_2000DPS | lpf);
    mpuConfiguration.write(MPU3050_INT_CFG, 0);
    mpuConfiguration.write(MPU3050_USER_CTRL, MPU3050_USER_RESET);
    mpuConfiguration.write(MPU3050_PWR_MGM, MPU3050_CLK_SEL_PLL_GX);
}

static bool mpu3050ReadTemp(int16_t *tempData)
{
    uint8_t buf[2];
    if (!mpuConfiguration.read(MPU3050_TEMP_OUT, 2, buf)) {
        return false;
    }

    *tempData = 35 + ((int32_t)(buf[0] << 8 | buf[1]) + 13200) / 280;

    return true;
}
