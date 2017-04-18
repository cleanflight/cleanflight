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

#ifdef USE_MAG_HMC5883

#include "build/debug.h"

#include "common/axis.h"
#include "common/maths.h"

#include "drivers/system.h"
#include "drivers/nvic.h"
#include "drivers/io.h"
#include "drivers/exti.h"
#include "drivers/bus_i2c.h"
#include "drivers/light_led.h"

#include "drivers/sensor.h"
#include "compass.h"

#include "compass_hmc5883l.h"
#include "compass_spi_hmc5883l.h"

//#define DEBUG_MAG_DATA_READY_INTERRUPT

// HMC5883L, default address 0x1E
// NAZE Target connections
// PB12 connected to MAG_DRDY on rev4 hardware
// PC14 connected to MAG_DRDY on rev5 hardware

/* CTRL_REGA: Control Register A
 * Read Write
 * Default value: 0x10
 * 7:5  0   These bits must be cleared for correct operation.
 * 4:2 DO2-DO0: Data Output Rate Bits
 *             DO2 |  DO1 |  DO0 |   Minimum Data Output Rate (Hz)
 *            ------------------------------------------------------
 *              0  |  0   |  0   |            0.75
 *              0  |  0   |  1   |            1.5
 *              0  |  1   |  0   |            3
 *              0  |  1   |  1   |            7.5
 *              1  |  0   |  0   |           15 (default)
 *              1  |  0   |  1   |           30
 *              1  |  1   |  0   |           75
 *              1  |  1   |  1   |           Not Used
 * 1:0 MS1-MS0: Measurement Configuration Bits
 *             MS1 | MS0 |   MODE
 *            ------------------------------
 *              0  |  0   |  Normal
 *              0  |  1   |  Positive Bias
 *              1  |  0   |  Negative Bias
 *              1  |  1   |  Not Used
 *
 * CTRL_REGB: Control RegisterB
 * Read Write
 * Default value: 0x20
 * 7:5 GN2-GN0: Gain Configuration Bits.
 *             GN2 |  GN1 |  GN0 |   Mag Input   | Gain       | Output Range
 *                 |      |      |  Range[Ga]    | [LSB/mGa]  |
 *            ------------------------------------------------------
 *              0  |  0   |  0   |  �0.88Ga      |   1370     | 0xF800?0x07FF (-2048:2047)
 *              0  |  0   |  1   |  �1.3Ga (def) |   1090     | 0xF800?0x07FF (-2048:2047)
 *              0  |  1   |  0   |  �1.9Ga       |   820      | 0xF800?0x07FF (-2048:2047)
 *              0  |  1   |  1   |  �2.5Ga       |   660      | 0xF800?0x07FF (-2048:2047)
 *              1  |  0   |  0   |  �4.0Ga       |   440      | 0xF800?0x07FF (-2048:2047)
 *              1  |  0   |  1   |  �4.7Ga       |   390      | 0xF800?0x07FF (-2048:2047)
 *              1  |  1   |  0   |  �5.6Ga       |   330      | 0xF800?0x07FF (-2048:2047)
 *              1  |  1   |  1   |  �8.1Ga       |   230      | 0xF800?0x07FF (-2048:2047)
 *                               |Not recommended|
 *
 * 4:0 CRB4-CRB: 0 This bit must be cleared for correct operation.
 *
 * _MODE_REG: Mode Register
 * Read Write
 * Default value: 0x02
 * 7:2  0   These bits must be cleared for correct operation.
 * 1:0 MD1-MD0: Mode Select Bits
 *             MS1 | MS0 |   MODE
 *            ------------------------------
 *              0  |  0   |  Continuous-Conversion Mode.
 *              0  |  1   |  Single-Conversion Mode
 *              1  |  0   |  Negative Bias
 *              1  |  1   |  Sleep Mode
 */

#define MAG_ADDRESS 0x1E
#define MAG_DATA_REGISTER 0x03

#define HMC58X3_R_CONFA 0
#define HMC58X3_R_CONFB 1
#define HMC58X3_R_MODE 2
#define HMC58X3_X_SELF_TEST_GAUSS (+1.16f)       // X axis level when bias current is applied.
#define HMC58X3_Y_SELF_TEST_GAUSS (+1.16f)       // Y axis level when bias current is applied.
#define HMC58X3_Z_SELF_TEST_GAUSS (+1.08f)       // Z axis level when bias current is applied.
#define SELF_TEST_LOW_LIMIT  (243.0f / 390.0f)    // Low limit when gain is 5.
#define SELF_TEST_HIGH_LIMIT (575.0f / 390.0f)    // High limit when gain is 5.
#define HMC_POS_BIAS 1
#define HMC_NEG_BIAS 2

static float magGain[3] = { 1.0f, 1.0f, 1.0f };

#ifdef USE_MAG_DATA_READY_SIGNAL

static IO_t hmc5883InterruptIO;
static extiCallbackRec_t hmc5883_extiCallbackRec;

static void hmc5883_extiHandler(extiCallbackRec_t* cb)
{
    UNUSED(cb);
#ifdef DEBUG_MAG_DATA_READY_INTERRUPT
    // Measure the delta between calls to the interrupt handler
    // currently should be around 65/66 milli seconds / 15hz output rate
    static uint32_t lastCalledAt = 0;
    static int32_t callDelta = 0;

    uint32_t now = millis();
    callDelta = now - lastCalledAt;

    //UNUSED(callDelta);
    debug[0] = callDelta;

    lastCalledAt = now;
#endif
}
#endif

static void hmc5883lConfigureDataReadyInterruptHandling(void)
{
#ifdef USE_MAG_DATA_READY_SIGNAL

    if (!(hmc5883InterruptIO)) {
        return;
    }
#ifdef ENSURE_MAG_DATA_READY_IS_HIGH
    uint8_t status = IORead(hmc5883InterruptIO);
    if (!status) {
        return;
    }
#endif

    EXTIHandlerInit(&hmc5883_extiCallbackRec, hmc5883_extiHandler);
    EXTIConfig(hmc5883InterruptIO, &hmc5883_extiCallbackRec, NVIC_PRIO_MAG_INT_EXTI, EXTI_Trigger_Rising);
    EXTIEnable(hmc5883InterruptIO, true);
#endif
}

static bool hmc5883lRead(int16_t *magData)
{
    uint8_t buf[6];
#ifdef USE_MAG_SPI_HMC5883
	bool ack = hmc5883SpiReadCommand(MAG_DATA_REGISTER, 6, buf);
#else
    bool ack = i2cRead(MAG_I2C_INSTANCE, MAG_ADDRESS, MAG_DATA_REGISTER, 6, buf);
#endif
    if (!ack) {
        return false;
    }
    // During calibration, magGain is 1.0, so the read returns normal non-calibrated values.
    // After calibration is done, magGain is set to calculated gain values.

    magData[X] = (int16_t)(buf[0] << 8 | buf[1]) * magGain[X];
    magData[Z] = (int16_t)(buf[2] << 8 | buf[3]) * magGain[Z];
    magData[Y] = (int16_t)(buf[4] << 8 | buf[5]) * magGain[Y];

    return true;
}

static bool hmc5883lInit(void)
{
    int16_t magADC[3];
    int i;
    int32_t xyz_total[3] = { 0, 0, 0 }; // 32 bit totals so they won't overflow.
    bool bret = true;           // Error indicator

    delay(50);
#ifdef USE_MAG_SPI_HMC5883
    hmc5883SpiWriteCommand(HMC58X3_R_CONFA, 0x010 + HMC_POS_BIAS);   // Reg A DOR = 0x010 + MS1, MS0 set to pos bias
#else
    i2cWrite(MAG_I2C_INSTANCE, MAG_ADDRESS, HMC58X3_R_CONFA, 0x010 + HMC_POS_BIAS);   // Reg A DOR = 0x010 + MS1, MS0 set to pos bias
#endif
    // Note that the  very first measurement after a gain change maintains the same gain as the previous setting.
    // The new gain setting is effective from the second measurement and on.
#ifdef USE_MAG_SPI_HMC5883
	hmc5883SpiWriteCommand(HMC58X3_R_CONFB, 0x60); // Set the Gain to 2.5Ga (7:5->011)
#else
    i2cWrite(MAG_I2C_INSTANCE, MAG_ADDRESS, HMC58X3_R_CONFB, 0x60); // Set the Gain to 2.5Ga (7:5->011)
#endif
    delay(100);
    hmc5883lRead(magADC);

    for (i = 0; i < 10; i++) {  // Collect 10 samples
#ifdef USE_MAG_SPI_HMC5883
		hmc5883SpiWriteCommand(HMC58X3_R_MODE, 1);
#else
        i2cWrite(MAG_I2C_INSTANCE, MAG_ADDRESS, HMC58X3_R_MODE, 1);
#endif
        delay(50);
        hmc5883lRead(magADC);       // Get the raw values in case the scales have already been changed.

        // Since the measurements are noisy, they should be averaged rather than taking the max.
        xyz_total[X] += magADC[X];
        xyz_total[Y] += magADC[Y];
        xyz_total[Z] += magADC[Z];

        // Detect saturation.
        if (-4096 >= MIN(magADC[X], MIN(magADC[Y], magADC[Z]))) {
            bret = false;
            break;              // Breaks out of the for loop.  No sense in continuing if we saturated.
        }
        LED1_TOGGLE;
    }

    // Apply the negative bias. (Same gain)
#ifdef USE_MAG_SPI_HMC5883
	hmc5883SpiWriteCommand(HMC58X3_R_CONFA, 0x010 + HMC_NEG_BIAS);   // Reg A DOR = 0x010 + MS1, MS0 set to negative bias.
#else
    i2cWrite(MAG_I2C_INSTANCE, MAG_ADDRESS, HMC58X3_R_CONFA, 0x010 + HMC_NEG_BIAS);   // Reg A DOR = 0x010 + MS1, MS0 set to negative bias.
#endif
    for (i = 0; i < 10; i++) {
#ifdef USE_MAG_SPI_HMC5883
        hmc5883SpiWriteCommand(HMC58X3_R_MODE, 1);
#else
        i2cWrite(MAG_I2C_INSTANCE, MAG_ADDRESS, HMC58X3_R_MODE, 1);
#endif
        delay(50);
        hmc5883lRead(magADC);               // Get the raw values in case the scales have already been changed.

        // Since the measurements are noisy, they should be averaged.
        xyz_total[X] -= magADC[X];
        xyz_total[Y] -= magADC[Y];
        xyz_total[Z] -= magADC[Z];

        // Detect saturation.
        if (-4096 >= MIN(magADC[X], MIN(magADC[Y], magADC[Z]))) {
            bret = false;
            break;              // Breaks out of the for loop.  No sense in continuing if we saturated.
        }
        LED1_TOGGLE;
    }

    magGain[X] = fabsf(660.0f * HMC58X3_X_SELF_TEST_GAUSS * 2.0f * 10.0f / xyz_total[X]);
    magGain[Y] = fabsf(660.0f * HMC58X3_Y_SELF_TEST_GAUSS * 2.0f * 10.0f / xyz_total[Y]);
    magGain[Z] = fabsf(660.0f * HMC58X3_Z_SELF_TEST_GAUSS * 2.0f * 10.0f / xyz_total[Z]);

    // leave test mode
#ifdef USE_MAG_SPI_HMC5883
    hmc5883SpiWriteCommand(HMC58X3_R_CONFA, 0x70);   // Configuration Register A  -- 0 11 100 00  num samples: 8 ; output rate: 15Hz ; normal measurement mode
    hmc5883SpiWriteCommand(HMC58X3_R_CONFB, 0x20);   // Configuration Register B  -- 001 00000    configuration gain 1.3Ga
    hmc5883SpiWriteCommand(HMC58X3_R_MODE, 0x00);    // Mode register             -- 000000 00    continuous Conversion Mode
#else
    i2cWrite(MAG_I2C_INSTANCE, MAG_ADDRESS, HMC58X3_R_CONFA, 0x70);   // Configuration Register A  -- 0 11 100 00  num samples: 8 ; output rate: 15Hz ; normal measurement mode
    i2cWrite(MAG_I2C_INSTANCE, MAG_ADDRESS, HMC58X3_R_CONFB, 0x20);   // Configuration Register B  -- 001 00000    configuration gain 1.3Ga
    i2cWrite(MAG_I2C_INSTANCE, MAG_ADDRESS, HMC58X3_R_MODE, 0x00);    // Mode register             -- 000000 00    continuous Conversion Mode
#endif
    delay(100);

    if (!bret) {                // Something went wrong so get a best guess
        magGain[X] = 1.0f;
        magGain[Y] = 1.0f;
        magGain[Z] = 1.0f;
    }

    hmc5883lConfigureDataReadyInterruptHandling();
    return true;
}

bool hmc5883lDetect(magDev_t* mag, ioTag_t interruptTag)
{
#ifdef USE_MAG_DATA_READY_SIGNAL
    hmc5883InterruptIO = IOGetByTag(interruptTag);
#else
    UNUSED(interruptTag);
#endif

    uint8_t sig = 0;
#ifdef USE_MAG_SPI_HMC5883
    hmc5883SpiInit();
    bool ack = hmc5883SpiReadCommand(0x0A, 1, &sig);
#else
    bool ack = i2cRead(MAG_I2C_INSTANCE, MAG_ADDRESS, 0x0A, 1, &sig);
#endif

    if (!ack || sig != 'H')
        return false;

    mag->init = hmc5883lInit;
    mag->read = hmc5883lRead;

    return true;
}
#endif
