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

#include <platform.h>

#include "build_config.h"

#include "barometer.h"

#include "system.h"
#include "bus_i2c.h"

#include "barometer_fbm320.h"

#ifdef BARO

// FBM320, default address 0x6D

#define FBM320_I2C_ADDR                      (0x6D)
#define FBM320_DEFAULT_CHIP_ID               (0x42)

#define FBM320_CHIP_ID_REG                   (0x6B)  /* Chip ID Register */
#define FBM320_RST_REG                       (0xE0)  /* Softreset Register */
#define FBM320_CTRL_MEAS_REG                 (0xF4)  /* Ctrl Measure Register */
#define FBM320_DATA_MSB_REG                  (0xF6)  /* Pressure MSB Register */
#define FBM320_DATA_CSB_REG                  (0xF7)  /* Pressure CSB Register */
#define FBM320_DATA_LSB_REG                  (0xF8)  /* Pressure LSB Register */

#define FBM320_T_MEASURE                     (0x2E)  /* temperature measurent*/
#define FBM320_P_MEASURE                     (0xF4)  /* pressure measurement*/

uint16_t C0_I, C1_I, C2_I, C3_I, C6_I, C8_I, C9_I, C10_I, C11_I, C12_I;
uint32_t C4_I, C5_I, C7_I;
static uint8_t fbm32_formula_select = 0;
static uint8_t fbm32_formula_select_read = 0;
static uint8_t fbm320_chip_id = 0;
static bool fbm320InitDone = false;
// uncompensated pressure and temperature
STATIC_UNIT_TESTED int32_t fbm320_up = 0;
STATIC_UNIT_TESTED int32_t fbm320_ut = 0;

static void fbm320_coefficient(void);
static void fbm320_start_ut(void);
static void fbm320_get_ut(void);
static void fbm320_start_up(void);
static void fbm320_get_up(void);
STATIC_UNIT_TESTED void fbm320_calculate(int32_t *pressure, int32_t *temperature);

bool fbm320Detect(baro_t *baro)
{
    if (fbm320InitDone)
        return true;

    delay(20);

    i2cRead(FBM320_I2C_ADDR, FBM320_CHIP_ID_REG, 1, &fbm320_chip_id);  /* read Chip Id */
    if (fbm320_chip_id != FBM320_DEFAULT_CHIP_ID)
        return false;

    i2cRead(FBM320_I2C_ADDR, FBM320_CTRL_MEAS_REG, 1, &fbm32_formula_select_read);
    if (fbm32_formula_select_read & 0x40)
        fbm32_formula_select |= 0x01;

    fbm320_coefficient();

    fbm320InitDone = true;

    baro->ut_delay = 4000;
    baro->get_ut = fbm320_get_ut;
    baro->start_ut = fbm320_start_ut;
    baro->up_delay = 12000;
    baro->start_up = fbm320_start_up;
    baro->get_up = fbm320_get_up;
    baro->calculate = fbm320_calculate;

    return true;
}

static void fbm320_start_ut(void)
{
    // start temperature measurement
    i2cWrite(FBM320_I2C_ADDR, FBM320_CTRL_MEAS_REG, FBM320_T_MEASURE);
}

static void fbm320_get_ut(void)
{
    uint8_t data[3];

    // read data from sensor
    i2cRead(FBM320_I2C_ADDR, FBM320_DATA_MSB_REG, 3, data);
    fbm320_ut = (int32_t)((((uint32_t)(data[0])) << 16) | (((uint32_t)(data[1])) << 8) | ((uint32_t)data[2]));
}

static void fbm320_start_up(void)
{
    // start pressure measurement
    i2cWrite(FBM320_I2C_ADDR, FBM320_CTRL_MEAS_REG, FBM320_P_MEASURE);
}

static void fbm320_get_up(void)
{
    uint8_t data[3];

    // read data from sensor
    i2cRead(FBM320_I2C_ADDR, FBM320_DATA_MSB_REG, 3, data);
    fbm320_up = (int32_t)((((uint32_t)(data[0])) << 16) | (((uint32_t)(data[1])) << 8) | ((uint32_t)data[2]));
}

static void fbm320_coefficient(void)    // Receive Calibrate Coefficient
{
    uint8_t i;
    uint8_t data[18];
    uint16_t R[10];
    uint16_t C0 = 0, C1 = 0, C2 = 0, C3 = 0, C6 = 0, C8 = 0, C9 = 0, C10 = 0, C11 = 0, C12 = 0;
    uint32_t C4 = 0, C5 = 0, C7 = 0;

    i2cRead(FBM320_I2C_ADDR, 0xAA, 18, data);
    for (i = 0; i < 9; i++)
        R[i] = (data[i * 2] << 8) | data[i * 2 + 1];
    i2cRead(FBM320_I2C_ADDR, 0xA4, 1, &data[0]);
    i2cRead(FBM320_I2C_ADDR, 0xF1, 1, &data[1]);
    R[9] = (data[0] << 8) | data[1];

    if ((fbm32_formula_select & 0x0F) == 0x01) {
        C0 = R[0] >> 4;
        C1 = ((R[1] & 0xFF00) >> 5) | (R[2] & 7);
        C2 = ((R[1] & 0xFF) << 1) | (R[4] & 1);
        C3 = R[2] >> 3;
        C4 = ((uint32_t)R[3] << 2) | (R[0] & 3);
        C5 = R[4] >> 1;
        C6 = R[5] >> 3;
        C7 = ((uint32_t)R[6] << 3) | (R[5] & 7);
        C8 = R[7] >> 3;
        C9 = R[8] >> 2;
        C10 = ((R[9] & 0xFF00) >> 6) | (R[8] & 3);
        C11 = R[9] & 0xFF;
        C12 = ((R[0] & 0x0C) << 1) | (R[7] & 7);
    } else {
        C0 = R[0] >> 4;
        C1 = ((R[1] & 0xFF00) >> 5) | (R[2] & 7);
        C2 = ((R[1] & 0xFF) << 1) | (R[4] & 1);
        C3 = R[2] >> 3;
        C4 = ((uint32_t)R[3] << 1) | (R[5] & 1);
        C5 = R[4] >> 1;
        C6 = R[5] >> 3;
        C7 = ((uint32_t)R[6] << 2) | ((R[0] >> 2) & 3);
        C8 = R[7] >> 3;
        C9 = R[8] >> 2;
        C10 = ((R[9] & 0xFF00) >> 6) | (R[8] & 3);
        C11 = R[9] & 0xFF;
        C12 = ((R[5] & 6) << 2) | (R[7] & 7);
    }

    C0_I = C0;
    C1_I = C1;
    C2_I = C2;
    C3_I = C3;
    C4_I = C4;
    C5_I = C5;
    C6_I = C6;
    C7_I = C7;
    C8_I = C8;
    C9_I = C9;
    C10_I = C10;
    C11_I = C11;
    C12_I = C12;
}

STATIC_UNIT_TESTED void fbm320_calculate(int32_t *pressure, int32_t *temperature)
{
    int8_t C12 = 0;
    int16_t C0 = 0, C2 = 0, C3 = 0, C6 = 0, C8 = 0, C9 = 0, C10 = 0, C11 = 0;
    int32_t C1 = 0, C4 = 0, C5 = 0, C7 = 0;
    int32_t RP = 0, RT = 0;
    int32_t DT, DT2, X01, X02, X03, X11, X12, X13, X21, X22, X23, X24, X25, X26, X31, X32, CF, PP1, PP2, PP3, PP4;

    C0 = C0_I;
    C1 = C1_I;
    C2 = C2_I;
    C3 = C3_I;
    C4 = C4_I;
    C5 = C5_I;
    C6 = C6_I;
    C7 = C7_I;
    C8 = C8_I;
    C9 = C9_I;
    C10 = C10_I;
    C11 = C11_I;
    C12 = C12_I;

    if ((fbm32_formula_select & 0x0F) == 0x01) {    // For FBM320-02
        DT  = ((fbm320_ut - 8388608) >> 4) + (C0 << 4);
        X01 = (C1 + 4459) * DT >> 1;
        X02 = ((((C2 - 256) * DT) >> 14) * DT) >> 4;
        X03 = (((((C3 * DT) >> 18) * DT) >> 18) * DT);
        RT  = ((2500 << 15) - X01 - X02 - X03) >> 15;

        DT2 = (X01 + X02 + X03) >> 12;

        X11 = ((C5 - 4443) * DT2);
        X12 = (((C6 * DT2) >> 16) * DT2) >> 2;
        X13 = ((X11 + X12) >> 10) + ((C4 + 120586) << 4);

        X21 = ((C8 + 7180) * DT2) >> 10;
        X22 = (((C9 * DT2) >> 17) * DT2) >> 12;
        if (X22 >= X21)
            X23 = X22 - X21;
        else
            X23 = X21 - X22;
        X24 = (X23 >> 11) * (C7 + 166426);
        X25 = ((X23 & 0x7FF) * (C7 + 166426)) >> 11;
        if ((X22 - X21) < 0)
            X26 = ((0 - X24 - X25) >> 11) + C7 + 166426;
        else
            X26 = ((X24 + X25) >> 11) + C7 + 166426;

        PP1 = ((fbm320_up - 8388608) - X13) >> 3;
        PP2 = (X26 >> 11) * PP1;
        PP3 = ((X26 & 0x7FF) * PP1) >> 11;
        PP4 = (PP2 + PP3) >> 10;

        CF  = (2097152 + C12 * DT2) >> 3;
        X31 = (((CF * C10) >> 17) * PP4) >> 2;
        X32 = (((((CF * C11) >> 15) * PP4) >> 18) * PP4);
        RP  = ((X31 + X32) >> 15) + PP4 + 99880;
    } else {
        DT  = ((fbm320_ut - 8388608) >> 4) + (C0 << 4);
        X01 = (C1 + 4418) * DT >> 1;
        X02 = ((((C2 - 256) * DT) >> 14) * DT) >> 4;
        X03 = (((((C3 * DT) >> 18) * DT) >> 18) * DT);
        RT = ((2500 << 15) - X01 - X02 - X03) >> 15;

        DT2 = (X01 + X02 + X03) >> 12;

        X11 = (C5 * DT2);
        X12 = (((C6 * DT2) >> 16) * DT2) >> 2;
        X13 = ((X11 + X12) >> 10) + ((C4 + 211288) << 4);

        X21 = ((C8 + 7209) * DT2) >> 10;
        X22 = (((C9 * DT2) >> 17) * DT2) >> 12;
        if (X22 >= X21)
            X23 = X22 - X21;
        else
            X23 = X21 - X22;
        X24 = (X23 >> 11) * (C7 + 285594);
        X25 = ((X23 & 0x7FF) * (C7 + 285594)) >> 11;
        if ((X22 - X21) < 0)
            X26 = ((0 - X24 - X25) >> 11) + C7 + 285594;
        else
            X26 = ((X24 + X25) >> 11) + C7 + 285594;
        PP1 = ((fbm320_up - 8388608) - X13) >> 3;
        PP2 = (X26 >> 11) * PP1;
        PP3 = ((X26 & 0x7FF) * PP1) >> 11;
        PP4 = (PP2 + PP3) >> 10;

        CF  = (2097152 + C12 * DT2) >> 3;
        X31 = (((CF * C10) >> 17) * PP4) >> 2;
        X32 = (((((CF * C11) >> 15) * PP4) >> 18) * PP4);
        RP = ((X31 + X32) >> 15) + PP4 + 99880;
    }

    if (pressure)
        *pressure = RP;
    if (temperature)
        *temperature = RT;
}

#endif
