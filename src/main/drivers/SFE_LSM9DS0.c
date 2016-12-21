/******************************************************************************
SFE_LSM9DS0.c
C port of SFE_LSM9DS0 Library Source File

Zhenjie Ruan @ Boston University
Sean Smith @ Boston University
Zhuoqun Cheng @ Boston University

Original CPP Library Author:
Jim Lindblom @ SparkFun Electronics
Original Creation Date: February 14, 2014 (Happy Valentines Day!)
Modified 14 Jul 2015 by Mike Hord to add Edison support
https://github.com/sparkfun/SparkFun_9DOF_Block_for_Edison_CPP_Library

This file implements all functions of the LSM9DS0 class. Functions here range
from higher level stuff, like reading/writing LSM9DS0 registers to low-level,
hardware reads and writes.

** Supports only I2C connections!!! **

Development environment specifics:
  Code developed in Intel's Eclipse IOT-DK
  This code requires the Intel mraa library to function; for more
  information see https://github.com/intel-iot-devkit/mraa

This code is beerware; if you see me (or any other SparkFun employee) at the
local, and you've found our code helpful, please buy us a round!

Distributed as-is; no warranty is given.
******************************************************************************/

#include "SFE_LSM9DS0.h"

// Setup the imu
void imu_setup(LSM9DS0_t* imu, uint8_t gAddr, uint8_t xmAddr)
{
	imu->gx = 0;
	imu->gy = 0;
	imu->gz = 0;

	imu->ax = 0;
	imu->ay = 0;
	imu->az = 0;

	imu->mx = 0;
	imu->my = 0;
	imu->mz = 0;

	imu->temperature = 0;

	imu->gScale = G_SCALE_245DPS;
	imu->aScale = A_SCALE_4G;
	imu->mScale = M_SCALE_2GS;

	imu->gRes = 0;
	imu->aRes = 0;
	imu->mRes = 0;

	// setting up the i2c
	//mraa_add_subplatform(MRAA_GENERIC_FIRMATA, "/dev/ttyACM0");
	imu->gyro = mraa_i2c_init(1);
	mraa_i2c_address(imu->gyro, gAddr);
	imu->xm = mraa_i2c_init(1);
	mraa_i2c_address(imu->xm, xmAddr);
}

uint16_t begin(LSM9DS0_t* imu, gyro_scale gScl, accel_scale aScl,
		mag_scale mScl, gyro_odr gODR, accel_odr aODR, mag_odr mODR)
{
	// Store the given scales in imu struct. These scale variables
	// are used throughout to calculate the actual g's, DPS,and Gs's.
	imu->gScale = gScl;
	imu->aScale = aScl;
	imu->mScale = mScl;

	// Once we have the scale values, we can calculate the resolution
	// of each sensor. That's what these functions are for. One for each sensor
	calcgRes(imu); // Calculate DPS / ADC tick, stored in gRes variable
	calcaRes(imu); // Calculate g / ADC tick, stored in aRes variable
	calcmRes(imu); // Calculate Gs / ADC tick, stored in mRes variable

	// To verify communication, we can read from the WHO_AM_I register of
	// each device. Store those in a variable so we can return them.
	uint8_t gTest = gReadByte(imu->gyro, WHO_AM_I_G);		// Read the gyro WHO_AM_I
	uint8_t xmTest = xmReadByte(imu->xm, WHO_AM_I_XM);	// Read the accel/mag WHO_AM_I
	
	// Gyro initialization stuff:
	initGyro(imu->gyro);	// This will "turn on" the gyro. Setting up interrupts, etc.
	setGyroODR(imu->gyro, gODR); // Set the gyro output data rate and bandwidth.
	setGyroScale(imu, imu->gScale); // Set the gyro range

	// Accelerometer initialization stuff:
	initAccel(imu->xm); // "Turn on" all axes of the accel. Set up interrupts, etc.
	setAccelODR(imu->xm, aODR); // Set the accel data rate.
	setAccelScale(imu, imu->aScale); // Set the accel range.

	// Magnetometer initializetion stuff:
	initMag(imu->xm); // "Turn on" all axes of the mag. Set up interrupts, etc.
	setMagODR(imu->xm, mODR); // Set the magnetometer output data rate.
	setMagScale(imu, imu->mScale); // Set the magnetometer's range.

	// Once everything is initialized, return the WHO_AN_I registers we read:
	return (xmTest << 8) | gTest;
}

void initGyro(mraa_i2c_context gyro)
{
	/* CTRL_REG1_G sets output data rate, bandwidth, power-down and enables
	Bits[7:0]: DR1 DR0 BW1 BW0 PD Zen Xen Yen
	DR[1:0] - Output data rate selection
		00=95Hz, 01=190Hz, 10=380Hz, 11=760Hz
	BW[1:0] - Bandwidth selection (sets cutoff frequency)
		 Value depends on ODR. See datasheet table 21.
	PD - Power down enable (0=power down mode, 1=normal or sleep mode)
	Zen, Xen, Yen - Axis enable (o=disabled, 1=enabled)	*/
	gWriteByte(gyro, CTRL_REG1_G, 0x0F); // Normal mode, enable all axes
	
	/* CTRL_REG2_G sets up the HPF
	Bits[7:0]: 0 0 HPM1 HPM0 HPCF3 HPCF2 HPCF1 HPCF0
	HPM[1:0] - High pass filter mode selection
		00=normal (reset reading HP_RESET_FILTER, 01=ref signal for filtering,
		10=normal, 11=autoreset on interrupt
	HPCF[3:0] - High pass filter cutoff frequency
		Value depends on data rate. See datasheet table 26.
	*/
	gWriteByte(gyro, CTRL_REG2_G, 0x00); // Normal mode, high cutoff frequency
	
	/* CTRL_REG3_G sets up interrupt and DRDY_G pins
	Bits[7:0]: I1_IINT1 I1_BOOT H_LACTIVE PP_OD I2_DRDY I2_WTM I2_ORUN I2_EMPTY
	I1_INT1 - Interrupt enable on INT_G pin (0=disable, 1=enable)
	I1_BOOT - Boot status available on INT_G (0=disable, 1=enable)
	H_LACTIVE - Interrupt active configuration on INT_G (0:high, 1:low)
	PP_OD - Push-pull/open-drain (0=push-pull, 1=open-drain)
	I2_DRDY - Data ready on DRDY_G (0=disable, 1=enable)
	I2_WTM - FIFO watermark interrupt on DRDY_G (0=disable 1=enable)
	I2_ORUN - FIFO overrun interrupt on DRDY_G (0=disable 1=enable)
	I2_EMPTY - FIFO empty interrupt on DRDY_G (0=disable 1=enable) */
	// Int1 enabled (pp, active low), data read on DRDY_G:
	gWriteByte(gyro, CTRL_REG3_G, 0x88); 
	
	/* CTRL_REG4_G sets the scale, update mode
	Bits[7:0] - BDU BLE FS1 FS0 - ST1 ST0 SIM
	BDU - Block data update (0=continuous, 1=output not updated until read
	BLE - Big/little endian (0=data LSB @ lower address, 1=LSB @ higher add)
	FS[1:0] - Full-scale selection
		00=245dps, 01=500dps, 10=2000dps, 11=2000dps
	ST[1:0] - Self-test enable
		00=disabled, 01=st 0 (x+, y-, z-), 10=undefined, 11=st 1 (x-, y+, z+)
	SIM - SPI serial interface mode select
		0=4 wire, 1=3 wire */
	gWriteByte(gyro, CTRL_REG4_G, 0x00); // Set scale to 245 dps
	
	/* CTRL_REG5_G sets up the FIFO, HPF, and INT1
	Bits[7:0] - BOOT FIFO_EN - HPen INT1_Sel1 INT1_Sel0 Out_Sel1 Out_Sel0
	BOOT - Reboot memory content (0=normal, 1=reboot)
	FIFO_EN - FIFO enable (0=disable, 1=enable)
	HPen - HPF enable (0=disable, 1=enable)
	INT1_Sel[1:0] - Int 1 selection configuration
	Out_Sel[1:0] - Out selection configuration */
	gWriteByte(gyro, CTRL_REG5_G, 0x00);
	
}

void initAccel(mraa_i2c_context xm)
{
	/* CTRL_REG0_XM (0x1F) (Default value: 0x00)
	Bits (7-0): BOOT FIFO_EN WTM_EN 0 0 HP_CLICK HPIS1 HPIS2
	BOOT - Reboot memory content (0: normal, 1: reboot)
	FIFO_EN - Fifo enable (0: disable, 1: enable)
	WTM_EN - FIFO watermark enable (0: disable, 1: enable)
	HP_CLICK - HPF enabled for click (0: filter bypassed, 1: enabled)
	HPIS1 - HPF enabled for interrupt generator 1 (0: bypassed, 1: enabled)
	HPIS2 - HPF enabled for interrupt generator 2 (0: bypassed, 1 enabled)   */
	xmWriteByte(xm, CTRL_REG0_XM, 0x00);
	
	/* CTRL_REG1_XM (0x20) (Default value: 0x07)
	Bits (7-0): AODR3 AODR2 AODR1 AODR0 BDU AZEN AYEN AXEN
	AODR[3:0] - select the acceleration data rate:
		0000=power down, 0001=3.125Hz, 0010=6.25Hz, 0011=12.5Hz, 
		0100=25Hz, 0101=50Hz, 0110=100Hz, 0111=200Hz, 1000=400Hz,
		1001=800Hz, 1010=1600Hz, (remaining combinations undefined).
	BDU - block data update for accel AND mag
		0: Continuous update
		1: Output registers aren't updated until MSB and LSB have been read.
	AZEN, AYEN, and AXEN - Acceleration x/y/z-axis enabled.
		0: Axis disabled, 1: Axis enabled									 */	
	xmWriteByte(xm, CTRL_REG1_XM, 0x57); // 100Hz data rate, x/y/z all enabled
	
	//Serial.println(xmReadByte(CTRL_REG1_XM));
	/* CTRL_REG2_XM (0x21) (Default value: 0x00)
	Bits (7-0): ABW1 ABW0 AFS2 AFS1 AFS0 AST1 AST0 SIM
	ABW[1:0] - Accelerometer anti-alias filter bandwidth
		00=773Hz, 01=194Hz, 10=362Hz, 11=50Hz
	AFS[2:0] - Accel full-scale selection
		000=+/-2g, 001=+/-4g, 010=+/-6g, 011=+/-8g, 100=+/-16g
	AST[1:0] - Accel self-test enable
		00=normal (no self-test), 01=positive st, 10=negative st, 11=not allowed
	SIM - SPI mode selection
		0=4-wire, 1=3-wire													 */
	xmWriteByte(xm, CTRL_REG2_XM, 0x00); // Set scale to 2g
	
	/* CTRL_REG3_XM is used to set interrupt generators on INT1_XM
	Bits (7-0): P1_BOOT P1_TAP P1_INT1 P1_INT2 P1_INTM P1_DRDYA P1_DRDYM P1_EMPTY
	*/
	// Accelerometer data ready on INT1_XM (0x04)
	xmWriteByte(xm, CTRL_REG3_XM, 0x04); 
}

void initMag(mraa_i2c_context xm)
{	
	/* CTRL_REG5_XM enables temp sensor, sets mag resolution and data rate
	Bits (7-0): TEMP_EN M_RES1 M_RES0 M_ODR2 M_ODR1 M_ODR0 LIR2 LIR1
	TEMP_EN - Enable temperature sensor (0=disabled, 1=enabled)
	M_RES[1:0] - Magnetometer resolution select (0=low, 3=high)
	M_ODR[2:0] - Magnetometer data rate select
		000=3.125Hz, 001=6.25Hz, 010=12.5Hz, 011=25Hz, 100=50Hz, 101=100Hz
	LIR2 - Latch interrupt request on INT2_SRC (cleared by reading INT2_SRC)
		0=interrupt request not latched, 1=interrupt request latched
	LIR1 - Latch interrupt request on INT1_SRC (cleared by readging INT1_SRC)
		0=irq not latched, 1=irq latched 									 */
	xmWriteByte(xm, CTRL_REG5_XM, 0x94); // Mag data rate - 100 Hz, enable temperature sensor
	
	/* CTRL_REG6_XM sets the magnetometer full-scale
	Bits (7-0): 0 MFS1 MFS0 0 0 0 0 0
	MFS[1:0] - Magnetic full-scale selection
	00:+/-2Gauss, 01:+/-4Gs, 10:+/-8Gs, 11:+/-12Gs							 */
	xmWriteByte(xm, CTRL_REG6_XM, 0x00); // Mag scale to +/- 2GS
	
	/* CTRL_REG7_XM sets magnetic sensor mode, low power mode, and filters
	AHPM1 AHPM0 AFDS 0 0 MLP MD1 MD0
	AHPM[1:0] - HPF mode selection
		00=normal (resets reference registers), 01=reference signal for filtering, 
		10=normal, 11=autoreset on interrupt event
	AFDS - Filtered acceleration data selection
		0=internal filter bypassed, 1=data from internal filter sent to FIFO
	MLP - Magnetic data low-power mode
		0=data rate is set by M_ODR bits in CTRL_REG5
		1=data rate is set to 3.125Hz
	MD[1:0] - Magnetic sensor mode selection (default 10)
		00=continuous-conversion, 01=single-conversion, 10 and 11=power-down */
	xmWriteByte(xm, CTRL_REG7_XM, 0x00); // Continuous conversion mode
	
	/* CTRL_REG4_XM is used to set interrupt generators on INT2_XM
	Bits (7-0): P2_TAP P2_INT1 P2_INT2 P2_INTM P2_DRDYA P2_DRDYM P2_Overrun P2_WTM
	*/
	xmWriteByte(xm, CTRL_REG4_XM, 0x04); // Magnetometer data ready on INT2_XM (0x08)
	
	/* INT_CTRL_REG_M to set push-pull/open drain, and active-low/high
	Bits[7:0] - XMIEN YMIEN ZMIEN PP_OD IEA IEL 4D MIEN
	XMIEN, YMIEN, ZMIEN - Enable interrupt recognition on axis for mag data
	PP_OD - Push-pull/open-drain interrupt configuration (0=push-pull, 1=od)
	IEA - Interrupt polarity for accel and magneto
		0=active-low, 1=active-high
	IEL - Latch interrupt request for accel and magneto
		0=irq not latched, 1=irq latched
	4D - 4D enable. 4D detection is enabled when 6D bit in INT_GEN1_REG is set
	MIEN - Enable interrupt generation for magnetic data
		0=disable, 1=enable) */
	xmWriteByte(xm, INT_CTRL_REG_M, 0x09); // Enable interrupts for mag, active-low, push-pull
}

void readGyro(LSM9DS0_t* imu)
{
	uint8_t temp[6]; // We'll read six bytes from the gyro into temp
	gReadBytes(imu->gyro, OUT_X_L_G, temp, 6); // Read 6 bytes, beginning at OUT_X_L_G
	imu->gx = (temp[1] << 8) | temp[0]; // Store x-axis values into gx
	imu->gy = (temp[3] << 8) | temp[2]; // Store y-axis values into gy
	imu->gz = (temp[5] << 8) | temp[4]; // Store z-axis values into gz
}

void readAccel(LSM9DS0_t* imu)
{
	uint8_t temp[6]; // We'll read six bytes from the accelerometer into temp
	xmReadBytes(imu->xm, OUT_X_L_A, temp, 6); // Read 6 bytes, beginning at OUT_X_L_A
	imu->ax = (temp[1] << 8) | temp[0]; // Store x-axis values into ax
	imu->ay = (temp[3] << 8) | temp[2]; // Store y-axis values into ay
	imu->az = (temp[5] << 8) | temp[4]; // Store z-axis values into az
}

void readMag(LSM9DS0_t* imu)
{
	uint8_t temp[6]; // We'll read six bytes from the mag into temp	
	xmReadBytes(imu->xm, OUT_X_L_M, temp, 6); // Read 6 bytes, beginning at OUT_X_L_M
	imu->mx = (temp[1] << 8) | temp[0]; // Store x-axis values into mx
	imu->my = (temp[3] << 8) | temp[2]; // Store y-axis values into my
	imu->mz = (temp[5] << 8) | temp[4]; // Store z-axis values into mz
}

void readTemp(LSM9DS0_t* imu)
{
	uint8_t temp[2]; // We'll read two bytes from the temperature sensor into temp	
	xmReadBytes(imu->xm, OUT_TEMP_L_XM, temp, 2); // Read 2 bytes, beginning at OUT_TEMP_L_M
	imu->temperature =  (int16_t)temp[0] + (((int16_t)temp[1]) << 8) ; // Temperature is a 12-bit signed integer
}

float calcGyro(LSM9DS0_t* imu, int16_t gyro)
{
	// Return the gyro raw reading times our pre-calculated DPS / (ADC tick):
	return imu->gRes * gyro; 
}

float calcAccel(LSM9DS0_t* imu, int16_t accel)
{
	// Return the accel raw reading times our pre-calculated g's / (ADC tick):
	return imu->aRes * accel;
}

float calcMag(LSM9DS0_t* imu, int16_t mag)
{
	// Return the mag raw reading times our pre-calculated Gs / (ADC tick):
	return imu->mRes * mag;
}

void setGyroScale(LSM9DS0_t* imu, gyro_scale gScl)
{
	// We need to preserve the other bytes in CTRL_REG4_G. So, first read it:
	uint8_t temp = gReadByte(imu->gyro, CTRL_REG4_G);
	// Then mask out the gyro scale bits:
	temp &= 0xFF^(0x3 << 4);
	// Then shift in our new scale bits:
	temp |= gScl << 4;
	// And write the new register value back into CTRL_REG4_G:
	gWriteByte(imu->gyro, CTRL_REG4_G, temp);
	
	// We've updated the sensor, but we also need to update our class variables
	// First update gScale:
	imu->gScale = gScl;
	// Then calculate a new gRes, which relies on gScale being set correctly:
	calcgRes(imu);
}

void setAccelScale(LSM9DS0_t* imu, accel_scale aScl)
{
	// We need to preserve the other bytes in CTRL_REG2_XM. So, first read it:
	uint8_t temp = xmReadByte(imu->xm, CTRL_REG2_XM);
	// Then mask out the accel scale bits:
	temp &= 0xFF^(0x3 << 3);
	// Then shift in our new scale bits:
	temp |= aScl << 3;
	// And write the new register value back into CTRL_REG2_XM:
	xmWriteByte(imu->xm, CTRL_REG2_XM, temp);
	
	// We've updated the sensor, but we also need to update our class variables
	// First update aScale:
	imu->aScale = aScl;
	// Then calculate a new aRes, which relies on aScale being set correctly:
	calcaRes();
}

void setMagScale(LSM9DS0_t* imu, mag_scale mScl)
{
	// We need to preserve the other bytes in CTRL_REG6_XM. So, first read it:
	uint8_t temp = xmReadByte(imu->xm, CTRL_REG6_XM);
	// Then mask out the mag scale bits:
	temp &= 0xFF^(0x3 << 5);
	// Then shift in our new scale bits:
	temp |= mScl << 5;
	// And write the new register value back into CTRL_REG6_XM:
	xmWriteByte(imu->xm, CTRL_REG6_XM, temp);
	
	// We've updated the sensor, but we also need to update our class variables
	// First update mScale:
	imu->mScale = mScl;
	// Then calculate a new mRes, which relies on mScale being set correctly:
	calcmRes();
}

void setGyroODR(mraa_i2c_context gyro, gyro_odr gRate)
{
	// We need to preserve the other bytes in CTRL_REG1_G. So, first read it:
	uint8_t temp = gReadByte(gyro, CTRL_REG1_G);
	// Then mask out the gyro ODR bits:
	temp &= 0xFF^(0xF << 4);
	// Then shift in our new ODR bits:
	temp |= (gRate << 4);
	// And write the new register value back into CTRL_REG1_G:
	gWriteByte(gyro, CTRL_REG1_G, temp);
}

void setAccelODR(mraa_i2c_context xm, accel_odr aRate)
{
	// We need to preserve the other bytes in CTRL_REG1_XM. So, first read it:
	uint8_t temp = xmReadByte(xm, CTRL_REG1_XM);
	// Then mask out the accel ODR bits:
	temp &= 0xFF^(0xF << 4);
	// Then shift in our new ODR bits:
	temp |= (aRate << 4);
	// And write the new register value back into CTRL_REG1_XM:
	xmWriteByte(xm, CTRL_REG1_XM, temp);
}

void setAccelABW(mraa_i2c_context xm, accel_abw abwRate)
{
	// We need to preserve the other bytes in CTRL_REG2_XM. So, first read it:
	uint8_t temp = xmReadByte(xm, CTRL_REG2_XM);
	// Then mask out the accel ABW bits:
	temp &= 0xFF^(0x3 << 6);
	// Then shift in our new ODR bits:
	temp |= (abwRate << 6);
	// And write the new register value back into CTRL_REG2_XM:
	xmWriteByte(xm, CTRL_REG2_XM, temp);
}

void setMagODR(mraa_i2c_context xm, mag_odr mRate)
{
	// We need to preserve the other bytes in CTRL_REG5_XM. So, first read it:
	uint8_t temp = xmReadByte(xm, CTRL_REG5_XM);
	// Then mask out the mag ODR bits:
	temp &= 0xFF^(0x7 << 2);
	// Then shift in our new ODR bits:
	temp |= (mRate << 2);
	// And write the new register value back into CTRL_REG5_XM:
	xmWriteByte(xm, CTRL_REG5_XM, temp);
}

void calcgRes(LSM9DS0_t* imu)
{
	// Possible gyro scales (and their register bit settings) are:
	// 245 DPS (00), 500 DPS (01), 2000 DPS (10). Here's a bit of an algorithm
	// to calculate DPS/(ADC tick) based on that 2-bit value:
	switch (imu->gScale)
	{
	case G_SCALE_245DPS:
		imu->gRes = 245.0 / 32768.0;
		break;
	case G_SCALE_500DPS:
		imu->gRes = 500.0 / 32768.0;
		break;
	case G_SCALE_2000DPS:
		imu->gRes = 2000.0 / 32768.0;
		break;
	}
}

void calcaRes(LSM9DS0_t* imu)
{
	// Possible accelerometer scales (and their register bit settings) are:
	// 2 g (000), 4g (001), 6g (010) 8g (011), 16g (100). Here's a bit of an 
	// algorithm to calculate g/(ADC tick) based on that 3-bit value:
	imu->aRes = imu->aScale == A_SCALE_16G ? 16.0 / 32768.0 : 
		   (((float) imu->aScale + 1.0) * 2.0) / 32768.0;
}

void calcmRes(LSM9DS0_t* imu)
{
	// Possible magnetometer scales (and their register bit settings) are:
	// 2 Gs (00), 4 Gs (01), 8 Gs (10) 12 Gs (11). Here's a bit of an algorithm
	// to calculate Gs/(ADC tick) based on that 2-bit value:
	imu->mRes = imu->mScale == M_SCALE_2GS ? 2.0 / 32768.0 : 
	       (float) (imu->mScale << 2) / 32768.0;
}

bool newXData(mraa_i2c_context xm)
{
  const uint8_t dReadyMask = 0b00001000;
  uint8_t statusRegVal = xmReadByte(xm, STATUS_REG_A);
  if ((dReadyMask & statusRegVal) != 0)
  {
    return true;
  }
  return false;
}

bool newMData(mraa_i2c_context xm)
{
  const uint8_t dReadyMask = 0b00001000;
  uint8_t statusRegVal = xmReadByte(xm, STATUS_REG_M);
  if ((dReadyMask & statusRegVal) != 0)
  {
    return true;
  }
  return false;
}

bool newGData(mraa_i2c_context gyro)
{
  const uint8_t dReadyMask = 0b00001000;
  uint8_t statusRegVal = gReadByte(gyro, STATUS_REG_G);
  if ((dReadyMask & statusRegVal) != 0)
  {
    return true;
  }
  return false;
}

bool xDataOverflow(mraa_i2c_context xm)
{
  const uint8_t dOverflowMask = 0b10000000;
  uint8_t statusRegVal = xmReadByte(xm, STATUS_REG_A);
  if ((dOverflowMask & statusRegVal) != 0)
  {
    return true;
  }
  return false;
}

bool gDataOverflow(mraa_i2c_context xm)
{
  const uint8_t dOverflowMask = 0b10000000;
  uint8_t statusRegVal = xmReadByte(xm, STATUS_REG_A);
  if ((dOverflowMask & statusRegVal) != 0)
  {
    return true;
  }
  return false;
}

bool mDataOverflow(mraa_i2c_context xm)
	{
  const uint8_t dOverflowMask = 0b10000000;
  uint8_t statusRegVal = xmReadByte(xm, STATUS_REG_M);
  if ((dOverflowMask & statusRegVal) != 0)
  {
    return true;
  }
  return false;
}

void gWriteByte(mraa_i2c_context gyro, uint8_t subAddress, uint8_t data)
{
	mraa_i2c_write_byte_data(gyro, data, subAddress);
}

void xmWriteByte(mraa_i2c_context xm, uint8_t subAddress, uint8_t data)
{
	mraa_i2c_write_byte_data(xm, data, subAddress);
}

uint8_t gReadByte(mraa_i2c_context gyro, uint8_t subAddress)
{
  return mraa_i2c_read_byte_data(gyro, subAddress);
}

void gReadBytes(mraa_i2c_context gyro, uint8_t subAddress, uint8_t* dest, uint8_t count)
{
	mraa_i2c_read_bytes_data(gyro, (subAddress|0x80), dest, count);
}

uint8_t xmReadByte(mraa_i2c_context xm, uint8_t subAddress)
{
  return mraa_i2c_read_byte_data(xm, subAddress);
}

void xmReadBytes(mraa_i2c_context xm, uint8_t subAddress, uint8_t* dest, uint8_t count)
{
	mraa_i2c_read_bytes_data(xm, (subAddress|0x80), dest, count);
}
