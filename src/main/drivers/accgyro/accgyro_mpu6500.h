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

#pragma once

#define MPU6500_WHO_AM_I_CONST              (0x70)
#define MPU9250_WHO_AM_I_CONST              (0x71)
#define MPU9255_WHO_AM_I_CONST              (0x73)
#define ICM20601_WHO_AM_I_CONST             (0xAC)
#define ICM20602_WHO_AM_I_CONST             (0x12)
#define ICM20608G_WHO_AM_I_CONST            (0xAF)

#define MPU6500_BIT_RESET                   (0x80)

// Register 0x37/55 - INT_PIN_CFG / Pin Bypass Enable Configuration
#define MPU6500_BIT_RESERVED                (1 << 0)
#define MPU6500_BIT_BYPASS_EN               (1 << 1)
#define MPU6500_BIT_INT_ANYRD_2CLEAR        (1 << 4)

// Register 0x38/56 INT_ENABLE
#define MPU6500_BIT_RAW_RDY_EN              (1 << 0)

// Register 0x6a/106 - USER_CTRL / User Control
#define MPU6500_BIT_I2C_IF_DIS              (1 << 4)

bool mpu6500AccDetect(accDev_t *acc);
bool mpu6500GyroDetect(gyroDev_t *gyro);

void mpu6500AccInit(accDev_t *acc);
void mpu6500GyroInit(gyroDev_t *gyro);
