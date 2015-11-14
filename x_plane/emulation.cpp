#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

extern "C"{
	void SetSysClock(bool overclock);
	#include "platform.h"
	#include "common/color.h"
	#include "drivers/gpio.h"
	#include "drivers/system.h"
	#include "drivers/light_led.h"
	#include "drivers/timer.h"
	#include "drivers/bus_i2c.h"
	#include "drivers/adc.h"
	#include "drivers/pwm_rx.h"
	#include "drivers/pwm_mapping.h"
	#include "drivers/sound_beeper.h"
	#include "drivers/flash_m25p16.h"
	#include "drivers/serial.h"
	#include "drivers/sensor.h"
	#include "drivers/exti.h"
	#include "drivers/accgyro.h"
	#include "drivers/accgyro_mpu.h"
	#include "drivers/accgyro_mpu6500.h"
	#include "drivers/barometer.h"
	#include "drivers/barometer_bmp280.h"
	#include "drivers/compass.h"
	#include "drivers/compass_hmc5883l.h"
	#include "drivers/sonar_hcsr04.h"
	#include "drivers/display_ug2864hsweg01.h"
	#include "drivers/light_led.h"
	#include "drivers/light_ws2811strip.h"
	#include "drivers/serial.h"
	#include "drivers/serial_softserial.h"
	#include "drivers/serial_uart.h"
	#include "drivers/pwm_output.h"


}

char CONFIG_FLASH[ FLASH_SIZE * 1024 ];



void SetSysClock( bool overclock ){
	UNUSED(overclock);
	puts( "SetSysClock" );
}


void systemInit(){
}

bool isMPUSoftReset(void){
	return false;
}


void ledInit( ){
}

void timerInit( ){
}

void timerStart( ){
}

void i2cInit(I2CDevice index){
	UNUSED(index);
}

void i2cSetOverclock(uint8_t OverClock){
	UNUSED(OverClock);
}
/*
bool i2cWriteBuffer(uint8_t addr_, uint8_t reg_, uint8_t len_, uint8_t *data){
}

bool i2cWrite(uint8_t addr_, uint8_t reg, uint8_t data){
}

bool i2cRead(uint8_t addr_, uint8_t reg, uint8_t len, uint8_t* buf){
}

uint16_t i2cGetErrorCounter(void){
}
*/

void adcInit(drv_adc_config_t *init){
	UNUSED(init);
}

uint16_t adcGetChannel(uint8_t channel){
}



extern "C" pwmOutputConfiguration_t *pwmInit( drv_pwm_config_t* init ){
	static pwmOutputConfiguration_t pwm;
	pwm.motorCount = 16;
	pwm.servoCount = 16;
	return &pwm;
}

void ppmInConfig(const timerHardware_t *timerHardwarePtr){
	UNUSED(timerHardwarePtr);
}

void ppmAvoidPWMTimerClash(const timerHardware_t *timerHardwarePtr, TIM_TypeDef *sharedPwmTimer){
	UNUSED(timerHardwarePtr);
	UNUSED(sharedPwmTimer);
}

uint16_t ppmRead(uint8_t channel){
	UNUSED(channel);
	return 0;
}


uint16_t pwmRead(uint8_t channel){
	UNUSED(channel);
	return 0;
}

bool isPPMDataBeingReceived(void){
	return true;
}

void resetPPMDataReceivedState(void){
}

void pwmRxInit(inputFilteringMode_e initialInputFilteringMode){
	UNUSED(initialInputFilteringMode);
}

bool isPWMDataBeingReceived(void){
	return false;
}


void systemBeep(bool onoff){
}

void beeperInit(beeperConfig_t *beeperConfig){
}

//void initBeeperHardware(beeperConfig_t *config){}



void failureMode(uint8_t mode){
	exit(-1000 - mode);
}

void digitalHi(GPIO_TypeDef *p, int i){
}
void digitalLo(GPIO_TypeDef *p, int i){
}
void digitalToggle(GPIO_TypeDef *p, int i){
}
//int  digitalIn(GPIO_TypeDef *p, int i){}


bool m25p16_init(){
	return true;
}

void m25p16_eraseSector(uint32_t address){
}
void m25p16_eraseCompletely(){
}

void m25p16_pageProgram(uint32_t address, const uint8_t *data, int length){
}

void m25p16_pageProgramBegin(uint32_t address){
}
void m25p16_pageProgramContinue(const uint8_t *data, int length){
}
void m25p16_pageProgramFinish(){
}

int m25p16_readBytes(uint32_t address, uint8_t *buffer, int length){
}

bool m25p16_isReady(){
	return true;
}
bool m25p16_waitForReady(uint32_t timeoutMillis){
	return true;
}

const flashGeometry_t* m25p16_getGeometry(){
}


serialPort_t *uartOpen(USART_TypeDef *USARTx, serialReceiveCallbackPtr callback, uint32_t baudRate, portMode_t mode, portOptions_t options){
}

void serialWrite(serialPort_t *instance, uint8_t ch){
}
uint8_t serialRxBytesWaiting(serialPort_t *instance){
}
uint8_t serialTxBytesFree(serialPort_t *instance){
}
uint8_t serialRead(serialPort_t *instance){
}
void serialSetBaudRate(serialPort_t *instance, uint32_t baudRate){
}
void serialSetMode(serialPort_t *instance, portMode_t mode){
}
bool isSerialTransmitBufferEmpty(serialPort_t *instance){
}
void serialPrint(serialPort_t *instance, const char *str){
}
uint32_t serialGetBaudRate(serialPort_t *instance){
}


serialPort_t *openSoftSerial(softSerialPortIndex_e portIndex, serialReceiveCallbackPtr callback, uint32_t baud, portOptions_t options){
}

// serialPort API
void softSerialWriteByte(serialPort_t *instance, uint8_t ch){
}

uint8_t softSerialRxBytesWaiting(serialPort_t *instance){
}

uint8_t softSerialTxBytesFree(serialPort_t *instance){
}

uint8_t softSerialReadByte(serialPort_t *instance){
}

void softSerialSetBaudRate(serialPort_t *s, uint32_t baudRate){
}

bool isSoftSerialTransmitBufferEmpty(serialPort_t *s){
}


static void acc_init( ){
}
static bool acc_read( int16_t* data ){
}


static void gyro_init( uint16_t lpf ){
	UNUSED(lpf);
}

static bool gyro_read( int16_t* data ){

}

static bool gyro_temp( int16_t* data ){

}

bool mpu6500AccDetect(acc_t *acc){
	acc->init = acc_init;
	acc->read = acc_read;
	acc->revisionCode = 0;
	acc_1G = 4096;
	return true;
}


bool mpu6500GyroDetect(gyro_t *gyro){
	gyro->init        = gyro_init;
	gyro->read        = gyro_read;
	gyro->temperature = gyro_temp;
	gyro->scale       = 1.0 / 16.0;
	return true;
}

mpuDetectionResult_t *detectMpu( const extiConfig_t *configToUse ){
	UNUSED(configToUse);

	static mpuDetectionResult_t r;
	r.resolution = MPU_FULL_RESOLUTION;
	r.sensor     = MPU_65xx_I2C;
	return &r;
}

//void mpu6500AccInit(void);
//void mpu6500GyroInit(uint16_t lpf);


static void baro_nop(){
}
static void baro_calculate(int32_t *pressure, int32_t *temperature){
}

bool bmp280Detect(baro_t *baro){
	baro->get_up    = baro_nop;
	baro->get_ut    = baro_nop;
	baro->start_up  = baro_nop;
	baro->start_ut  = baro_nop;
	baro->calculate = baro_calculate;
}

static void mag_init( ){

}

static bool mag_read( int16_t* data ){

}


bool hmc5883lDetect(mag_t* mag, const hmc5883Config_t *hmc5883ConfigToUse){
	UNUSED(hmc5883ConfigToUse);
	mag->init = mag_init;
	mag->read = mag_read;
	return true;
}



void hcsr04_init( const sonarHardware_t* sonarHardware ){
	UNUSED( sonarHardware );
}

void hcsr04_start_reading( ){
}

int32_t hcsr04_get_distance( ){
}



bool ug2864hsweg01InitI2C(void){
}

void i2c_OLED_set_xy(uint8_t col, uint8_t row){
}

void i2c_OLED_set_line(uint8_t row){
}

void i2c_OLED_send_char(unsigned char ascii){
}

void i2c_OLED_send_string(const char *string){
}

void i2c_OLED_clear_display(void){
}

void i2c_OLED_clear_display_quick(void){
}



void ws2811LedStripInit(void){
}
void ws2811UpdateStrip(void){
}

bool isWS2811LedStripReady(void){
}

void setLedHsv(uint16_t index, const hsvColor_t *color){
}
void getLedHsv(uint16_t index, hsvColor_t *color){
}

void setStripColor(const hsvColor_t *color){
}



void systemReset(void){
	throw 0;
}

void systemResetToBootloader(void){
	throw 0;
}



void pwmWriteMotor(uint8_t index, uint16_t value){
}
void pwmShutdownPulsesForAllMotors(uint8_t motorCount){
}
void pwmCompleteOneshotMotorUpdate(uint8_t motorCount){
}

void pwmWriteServo(uint8_t index, uint16_t value){
}

bool isMotorBrushed(uint16_t motorPwmRate){
}
