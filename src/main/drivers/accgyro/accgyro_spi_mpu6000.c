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


/*
 * Authors:
 * Dominic Clifton - Cleanflight implementation
 * John Ihlein - Initial FF32 code
*/

#include <stdbool.h>
#include <stdint.h>

#include "platform.h"

#include "common/axis.h"
#include "common/maths.h"

#include "drivers/system.h"
#include "drivers/io.h"
#include "drivers/exti.h"
#include "drivers/bus_spi.h"

#include "drivers/gyro_sync.h"

#include "drivers/sensor.h"
#include "accgyro.h"
#include "accgyro_mpu.h"

#if defined(USE_GYRO_SPI_MPU6000) || defined(USE_ACC_SPI_MPU6000)

#include "accgyro_spi_mpu6000.h"

static void mpu6000AccAndGyroInit(gyroDev_t *gyro);

static bool mpuSpi6000InitDone = false;


// Bits
#define BIT_SLEEP                   0x40
#define BIT_H_RESET                 0x80
#define BITS_CLKSEL                 0x07
#define MPU_CLK_SEL_PLLGYROX        0x01
#define MPU_CLK_SEL_PLLGYROZ        0x03
#define MPU_EXT_SYNC_GYROX          0x02
#define BITS_FS_250DPS              0x00
#define BITS_FS_500DPS              0x08
#define BITS_FS_1000DPS             0x10
#define BITS_FS_2000DPS             0x18
#define BITS_FS_2G                  0x00
#define BITS_FS_4G                  0x08
#define BITS_FS_8G                  0x10
#define BITS_FS_16G                 0x18
#define BITS_FS_MASK                0x18
#define BITS_DLPF_CFG_256HZ         0x00
#define BITS_DLPF_CFG_188HZ         0x01
#define BITS_DLPF_CFG_98HZ          0x02
#define BITS_DLPF_CFG_42HZ          0x03
#define BITS_DLPF_CFG_20HZ          0x04
#define BITS_DLPF_CFG_10HZ          0x05
#define BITS_DLPF_CFG_5HZ           0x06
#define BITS_DLPF_CFG_2100HZ_NOLPF  0x07
#define BITS_DLPF_CFG_MASK          0x07
#define BIT_INT_ANYRD_2CLEAR        0x10
#define BIT_RAW_RDY_EN              0x01
#define BIT_I2C_IF_DIS              0x10
#define BIT_INT_STATUS_DATA         0x01
#define BIT_GYRO                    3
#define BIT_ACC                     2
#define BIT_TEMP                    1

// Product ID Description for MPU6000
// high 4 bits low 4 bits
// Product Name Product Revision
#define MPU6000ES_REV_C4 0x14
#define MPU6000ES_REV_C5 0x15
#define MPU6000ES_REV_D6 0x16
#define MPU6000ES_REV_D7 0x17
#define MPU6000ES_REV_D8 0x18
#define MPU6000_REV_C4 0x54
#define MPU6000_REV_C5 0x55
#define MPU6000_REV_D6 0x56
#define MPU6000_REV_D7 0x57
#define MPU6000_REV_D8 0x58
#define MPU6000_REV_D9 0x59
#define MPU6000_REV_D10 0x5A

#define DISABLE_MPU6000(spiCsnPin)       IOHi(spiCsnPin)
#define ENABLE_MPU6000(spiCsnPin)        IOLo(spiCsnPin)

bool mpu6000SpiWriteRegister(const busDevice_t *bus, uint8_t reg, uint8_t data)
{
    ENABLE_MPU6000(bus->spi.csnPin);
    spiTransferByte(MPU6000_SPI_INSTANCE, reg);
    spiTransferByte(MPU6000_SPI_INSTANCE, data);
    DISABLE_MPU6000(bus->spi.csnPin);

    return true;
}

bool mpu6000SpiReadRegister(const busDevice_t *bus, uint8_t reg, uint8_t length, uint8_t *data)
{
    ENABLE_MPU6000(bus->spi.csnPin);
    spiTransferByte(MPU6000_SPI_INSTANCE, reg | 0x80); // read transaction
    spiTransfer(MPU6000_SPI_INSTANCE, data, NULL, length);
    DISABLE_MPU6000(bus->spi.csnPin);

    return true;
}

void mpu6000SpiGyroInit(gyroDev_t *gyro)
{
    mpuGyroInit(gyro);

    mpu6000AccAndGyroInit(gyro);

    spiSetDivisor(MPU6000_SPI_INSTANCE, SPI_CLOCK_INITIALIZATON);

    // Accel and Gyro DLPF Setting
    mpu6000SpiWriteRegister(&gyro->bus, MPU6000_CONFIG, gyro->lpf);
    delayMicroseconds(1);

    spiSetDivisor(MPU6000_SPI_INSTANCE, SPI_CLOCK_FAST);  // 18 MHz SPI clock

    mpuGyroRead(gyro);

    if (((int8_t)gyro->gyroADCRaw[1]) == -1 && ((int8_t)gyro->gyroADCRaw[0]) == -1) {
        failureMode(FAILURE_GYRO_INIT_FAILED);
    }
}

void mpu6000SpiAccInit(accDev_t *acc)
{
    acc->acc_1G = 512 * 4;
}

bool mpu6000SpiDetect(const busDevice_t *bus)
{
    uint8_t in;
    uint8_t attemptsRemaining = 5;

    IOInit(bus->spi.csnPin, OWNER_MPU_CS, 0);
    IOConfigGPIO(bus->spi.csnPin, SPI_IO_CS_CFG);

    spiSetDivisor(MPU6000_SPI_INSTANCE, SPI_CLOCK_INITIALIZATON);

    mpu6000SpiWriteRegister(bus, MPU_RA_PWR_MGMT_1, BIT_H_RESET);

    do {
        delay(150);

        mpu6000SpiReadRegister(bus, MPU_RA_WHO_AM_I, 1, &in);
        if (in == MPU6000_WHO_AM_I_CONST) {
            break;
        }
        if (!attemptsRemaining) {
            return false;
        }
    } while (attemptsRemaining--);

    mpu6000SpiReadRegister(bus, MPU_RA_PRODUCT_ID, 1, &in);

    /* look for a product ID we recognise */

    // verify product revision
    switch (in) {
        case MPU6000ES_REV_C4:
        case MPU6000ES_REV_C5:
        case MPU6000_REV_C4:
        case MPU6000_REV_C5:
        case MPU6000ES_REV_D6:
        case MPU6000ES_REV_D7:
        case MPU6000ES_REV_D8:
        case MPU6000_REV_D6:
        case MPU6000_REV_D7:
        case MPU6000_REV_D8:
        case MPU6000_REV_D9:
        case MPU6000_REV_D10:
            return true;
    }

    return false;
}

static void mpu6000AccAndGyroInit(gyroDev_t *gyro)
{
    if (mpuSpi6000InitDone) {
        return;
    }

    spiSetDivisor(MPU6000_SPI_INSTANCE, SPI_CLOCK_INITIALIZATON);

    // Device Reset
    mpu6000SpiWriteRegister(&gyro->bus, MPU_RA_PWR_MGMT_1, BIT_H_RESET);
    delay(150);

    mpu6000SpiWriteRegister(&gyro->bus, MPU_RA_SIGNAL_PATH_RESET, BIT_GYRO | BIT_ACC | BIT_TEMP);
    delay(150);

    // Clock Source PPL with Z axis gyro reference
    mpu6000SpiWriteRegister(&gyro->bus, MPU_RA_PWR_MGMT_1, MPU_CLK_SEL_PLLGYROZ);
    delayMicroseconds(15);

    // Disable Primary I2C Interface
    mpu6000SpiWriteRegister(&gyro->bus, MPU_RA_USER_CTRL, BIT_I2C_IF_DIS);
    delayMicroseconds(15);

    mpu6000SpiWriteRegister(&gyro->bus, MPU_RA_PWR_MGMT_2, 0x00);
    delayMicroseconds(15);

    // Accel Sample Rate 1kHz
    // Gyroscope Output Rate =  1kHz when the DLPF is enabled
    mpu6000SpiWriteRegister(&gyro->bus, MPU_RA_SMPLRT_DIV, gyroMPU6xxxGetDividerDrops(gyro));
    delayMicroseconds(15);

    // Gyro +/- 1000 DPS Full Scale
    mpu6000SpiWriteRegister(&gyro->bus, MPU_RA_GYRO_CONFIG, INV_FSR_2000DPS << 3);
    delayMicroseconds(15);

    // Accel +/- 8 G Full Scale
    mpu6000SpiWriteRegister(&gyro->bus, MPU_RA_ACCEL_CONFIG, INV_FSR_8G << 3);
    delayMicroseconds(15);

    mpu6000SpiWriteRegister(&gyro->bus, MPU_RA_INT_PIN_CFG, 0 << 7 | 0 << 6 | 0 << 5 | 1 << 4 | 0 << 3 | 0 << 2 | 0 << 1 | 0 << 0);  // INT_ANYRD_2CLEAR
    delayMicroseconds(15);

#ifdef USE_MPU_DATA_READY_SIGNAL
    mpu6000SpiWriteRegister(&gyro->bus, MPU_RA_INT_ENABLE, MPU_RF_DATA_RDY_EN);
    delayMicroseconds(15);
#endif

    spiSetDivisor(MPU6000_SPI_INSTANCE, SPI_CLOCK_FAST);
    delayMicroseconds(1);

    mpuSpi6000InitDone = true;
}

bool mpu6000SpiAccDetect(accDev_t *acc)
{
    if (acc->mpuDetectionResult.sensor != MPU_60x0_SPI) {
        return false;
    }

    acc->init = mpu6000SpiAccInit;
    acc->read = mpuAccRead;

    return true;
}

bool mpu6000SpiGyroDetect(gyroDev_t *gyro)
{
    if (gyro->mpuDetectionResult.sensor != MPU_60x0_SPI) {
        return false;
    }

    gyro->init = mpu6000SpiGyroInit;
    gyro->read = mpuGyroRead;
    gyro->intStatus = mpuCheckDataReady;
    // 16.4 dps/lsb scalefactor
    gyro->scale = 1.0f / 16.4f;

    return true;
}

#endif
