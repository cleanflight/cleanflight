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
 * This is a direct copy of the MS5611 driver, with the only differences
 * being the changes to the scaling factors and the second order factors
 * used when calculating temperature compensated pressure due to the
 * lower resolution of the MS5607 vs the MS5611.
 */

#include <stdbool.h>
#include <stdint.h>

#include <platform.h>

#include "barometer.h"

#include "gpio.h"
#include "system.h"
#include "bus_i2c.h"

// MS5607, Standard address 0x77
#define MS5607_ADDR                 0x77

#define CMD_RESET               0x1E // ADC reset command
#define CMD_ADC_READ            0x00 // ADC read command
#define CMD_ADC_CONV            0x40 // ADC conversion command
#define CMD_ADC_D1              0x00 // ADC D1 conversion
#define CMD_ADC_D2              0x10 // ADC D2 conversion
#define CMD_ADC_256             0x00 // ADC OSR=256
#define CMD_ADC_512             0x02 // ADC OSR=512
#define CMD_ADC_1024            0x04 // ADC OSR=1024
#define CMD_ADC_2048            0x06 // ADC OSR=2048
#define CMD_ADC_4096            0x08 // ADC OSR=4096
#define CMD_PROM_RD             0xA0 // Prom read command
#define PROM_NB                 8

static void ms5607_reset(void);
static uint16_t ms5607_prom(int8_t coef_num);
static int8_t ms5607_crc(uint16_t *prom);
static uint32_t ms5607_read_adc(void);
static void ms5607_start_ut(void);
static void ms5607_get_ut(void);
static void ms5607_start_up(void);
static void ms5607_get_up(void);
static void ms5607_calculate(int32_t *pressure, int32_t *temperature);

static uint32_t ms5607_ut;  // static result of temperature measurement
static uint32_t ms5607_up;  // static result of pressure measurement
static uint16_t ms5607_c[PROM_NB];  // on-chip ROM
static uint8_t ms5607_osr = CMD_ADC_4096;

bool ms5607Detect(baro_t *baro)
{
    bool ack = false;
    uint8_t sig;
    int i;

    delay(10); // No idea how long the chip takes to power-up, but let's make it 10ms

    ack = i2cRead(MS5607_ADDR, CMD_PROM_RD, 1, &sig);
    if (!ack)
        return false;

    ms5607_reset();
    // read all coefficients
    for (i = 0; i < PROM_NB; i++)
        ms5607_c[i] = ms5607_prom(i);
    // check crc, bail out if wrong - we are probably talking to BMP085 w/o XCLR line!
    if (ms5607_crc(ms5607_c) != 0)
        return false;

    // TODO prom + CRC
    baro->ut_delay = 10000;
    baro->up_delay = 10000;
    baro->start_ut = ms5607_start_ut;
    baro->get_ut = ms5607_get_ut;
    baro->start_up = ms5607_start_up;
    baro->get_up = ms5607_get_up;
    baro->calculate = ms5607_calculate;

    return true;
}

static void ms5607_reset(void)
{
    i2cWrite(MS5607_ADDR, CMD_RESET, 1);
    delayMicroseconds(2800);
}

static uint16_t ms5607_prom(int8_t coef_num)
{
    uint8_t rxbuf[2] = { 0, 0 };
    i2cRead(MS5607_ADDR, CMD_PROM_RD + coef_num * 2, 2, rxbuf); // send PROM READ command
    return rxbuf[0] << 8 | rxbuf[1];
}

static int8_t ms5607_crc(uint16_t *prom)
{
    int32_t i, j;
    uint32_t res = 0;
    uint8_t crc = prom[7] & 0xF;
    prom[7] &= 0xFF00;

    bool blankEeprom = true;

    for (i = 0; i < 16; i++) {
        if (prom[i >> 1]) {
            blankEeprom = false;
        }
        if (i & 1)
            res ^= ((prom[i >> 1]) & 0x00FF);
        else
            res ^= (prom[i >> 1] >> 8);
        for (j = 8; j > 0; j--) {
            if (res & 0x8000)
                res ^= 0x1800;
            res <<= 1;
        }
    }
    prom[7] |= crc;
    if (!blankEeprom && crc == ((res >> 12) & 0xF))
        return 0;

    return -1;
}

static uint32_t ms5607_read_adc(void)
{
    uint8_t rxbuf[3];
    i2cRead(MS5607_ADDR, CMD_ADC_READ, 3, rxbuf); // read ADC
    return (rxbuf[0] << 16) | (rxbuf[1] << 8) | rxbuf[2];
}

static void ms5607_start_ut(void)
{
    i2cWrite(MS5607_ADDR, CMD_ADC_CONV + CMD_ADC_D2 + ms5607_osr, 1); // D2 (temperature) conversion start!
}

static void ms5607_get_ut(void)
{
    ms5607_ut = ms5607_read_adc();
}

static void ms5607_start_up(void)
{
    i2cWrite(MS5607_ADDR, CMD_ADC_CONV + CMD_ADC_D1 + ms5607_osr, 1); // D1 (pressure) conversion start!
}

static void ms5607_get_up(void)
{
    ms5607_up = ms5607_read_adc();
}

static void ms5607_calculate(int32_t *pressure, int32_t *temperature)
{
    uint32_t press;
    int64_t temp;
    int64_t delt;
    int32_t dT = (int64_t)ms5607_ut - ((uint64_t)ms5607_c[5] * 256);
    int64_t off = ((int64_t)ms5607_c[2] << 17) + (((int64_t)ms5607_c[4] * dT) >> 6);
    int64_t sens = ((int64_t)ms5607_c[1] << 16) + (((int64_t)ms5607_c[3] * dT) >> 7);
    int32_t T2 = 0;

    if (temp < 2000) { // temperature lower than 20degC
        delt = temp - 2000;
        delt = delt * delt;
        T2 = (dT * dT) >> 31;
        off -= (61 * delt) >> 4;
        sens -= 2 * delt;
        if (temp < -1500) { // temperature lower than -15degC
            delt = temp + 1500;
            delt = delt * delt;
            off -= 15 * delt;
            sens -= 8 * delt;
        }
    }
    temp = 2000 + ((dT * (int64_t)ms5607_c[6]) >> 23) - T2;
    press = ((((int64_t)ms5607_up * sens) >> 21) - off) >> 15;

    if (pressure)
        *pressure = press;
    if (temperature)
        *temperature = temp;
}
