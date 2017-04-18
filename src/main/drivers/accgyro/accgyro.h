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

#include "platform.h"
#include "common/axis.h"
#include "drivers/exti.h"
#include "drivers/sensor.h"
#include "drivers/accgyro/accgyro_mpu.h"
#if defined(SIMULATOR_BUILD) && defined(SIMULATOR_MULTITHREAD)
#include <pthread.h>
#endif

#ifndef MPU_I2C_INSTANCE
#define MPU_I2C_INSTANCE I2C_DEVICE
#endif

#define GYRO_LPF_256HZ      0
#define GYRO_LPF_188HZ      1
#define GYRO_LPF_98HZ       2
#define GYRO_LPF_42HZ       3
#define GYRO_LPF_20HZ       4
#define GYRO_LPF_10HZ       5
#define GYRO_LPF_5HZ        6
#define GYRO_LPF_NONE       7

typedef enum {
    GYRO_RATE_1_kHz,
    GYRO_RATE_3200_Hz,
    GYRO_RATE_8_kHz,
    GYRO_RATE_32_kHz,
} gyroRateKHz_e;

typedef struct gyroDev_s {
    sensorGyroInitFuncPtr init;                             // initialize function
    sensorGyroReadFuncPtr read;                             // read 3 axis data function
    sensorGyroReadDataFuncPtr temperature;                  // read temperature if available
    sensorGyroInterruptStatusFuncPtr intStatus;
    sensorGyroUpdateFuncPtr update;
    extiCallbackRec_t exti;
    busDevice_t bus;
    float scale;                                            // scalefactor
    int16_t gyroADCRaw[XYZ_AXIS_COUNT];
    int32_t gyroZero[XYZ_AXIS_COUNT];
    int32_t gyroADC[XYZ_AXIS_COUNT];                        // gyro data after calibration and alignment
    uint8_t lpf;
    gyroRateKHz_e gyroRateKHz;
    uint8_t mpuDividerDrops;
    bool dataReady;
#if defined(SIMULATOR_BUILD) && defined(SIMULATOR_MULTITHREAD)
    pthread_mutex_t lock;
#endif
    sensor_align_e gyroAlign;
    mpuDetectionResult_t mpuDetectionResult;
    ioTag_t mpuIntExtiTag;
    mpuConfiguration_t mpuConfiguration;
} gyroDev_t;

typedef struct accDev_s {
    sensorAccInitFuncPtr init;                              // initialize function
    sensorAccReadFuncPtr read;                              // read 3 axis data function
    busDevice_t bus;
    uint16_t acc_1G;
    int16_t ADCRaw[XYZ_AXIS_COUNT];
    char revisionCode;                                      // a revision code for the sensor, if known
    bool dataReady;
#if defined(SIMULATOR_BUILD) && defined(SIMULATOR_MULTITHREAD)
    pthread_mutex_t lock;
#endif
    sensor_align_e accAlign;
    mpuDetectionResult_t mpuDetectionResult;
    mpuConfiguration_t mpuConfiguration;
} accDev_t;

static inline void accDevLock(accDev_t *acc)
{
#if defined(SIMULATOR_BUILD) && defined(SIMULATOR_MULTITHREAD)
    pthread_mutex_lock(&acc->lock);
#else
    (void)acc;
#endif
}

static inline void accDevUnLock(accDev_t *acc)
{
#if defined(SIMULATOR_BUILD) && defined(SIMULATOR_MULTITHREAD)
    pthread_mutex_unlock(&acc->lock);
#else
    (void)acc;
#endif
}

static inline void gyroDevLock(gyroDev_t *gyro)
{
#if defined(SIMULATOR_BUILD) && defined(SIMULATOR_MULTITHREAD)
    pthread_mutex_lock(&gyro->lock);
#else
    (void)gyro;
#endif
}

static inline void gyroDevUnLock(gyroDev_t *gyro)
{
#if defined(SIMULATOR_BUILD) && defined(SIMULATOR_MULTITHREAD)
    pthread_mutex_unlock(&gyro->lock);
#else
    (void)gyro;
#endif
}
