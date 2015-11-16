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

	#include "drivers/sound_beeper.h"
	#include "drivers/flash_m25p16.h"
	#include "drivers/serial.h"
	#include "drivers/exti.h"

	#include "drivers/display_ug2864hsweg01.h"
	#include "drivers/light_led.h"
	#include "drivers/light_ws2811strip.h"
	#include "drivers/flash_m25p16.h"
	#include "drivers/serial.h"
}

#include "main.h"







void systemInit(){

}


void SetSysClock( bool overclock ){
	UNUSED(overclock);
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






void systemBeep(bool onoff){
}

void beeperInit(beeperConfig_t *beeperConfig){
}

//void initBeeperHardware(beeperConfig_t *config){}



void failureMode(uint8_t mode){
	exit(-1000 - mode);
}

void digitalHi( GPIO_TypeDef* p , int i ){
	UNUSED(p);
	gui_toggle_led( i - 10 , +1 );
}

void digitalLo( GPIO_TypeDef* p , int i ){
	UNUSED(p);
	gui_toggle_led( i - 10 , -1 );
}

void digitalToggle( GPIO_TypeDef* p , int i ){
	UNUSED(p);
	gui_toggle_led( i - 10 , 0 );
}




void FLASH_Unlock(void){
}


void FLASH_Lock(void){
	flash_save();
}


FLASH_Status FLASH_ErasePage( uint32_t Page_Address ){
	UNUSED(Page_Address);
	return FLASH_COMPLETE;
}


FLASH_Status FLASH_ProgramWord( uint32_t Address , uint32_t Data ){
	*(uint32_t*)Address = Data;
	return FLASH_COMPLETE;
}


void FLASH_ClearFlag( uint32_t FLASH_FLAG ){
	UNUSED(FLASH_FLAG);
}


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





static int OLED_x;
static int OLED_y;

bool ug2864hsweg01InitI2C(){
	return true;
}

void i2c_OLED_set_xy( uint8_t col , uint8_t row ){
	OLED_x = col;
	OLED_y = row;
}

void i2c_OLED_set_line( uint8_t row ){
	OLED_x = 0;
	OLED_y = row;
}

void i2c_OLED_send_char( unsigned char ascii ){
	gui_lcd_put( OLED_x , OLED_y , ascii );
	OLED_x++;
}

void i2c_OLED_send_string( const char* string ){
	for( const char* c = string ; *c ; c++ ){
		i2c_OLED_send_char( *c );
	}
}

void i2c_OLED_clear_display_quick(void){
	gui_lcd_clear( );
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


