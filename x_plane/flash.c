#include <stdbool.h>
#include "platform.h"
#include "drivers/flash_m25p16.h"
#include "drivers/serial.h"
#include <stdio.h>

char CONFIG_FLASH[ FLASH_SIZE * 1024 ];

void FLASH_Read(void){
	FILE* f = fopen( "eeprom.bin" , "rb" );
	if( f ){
		fread( CONFIG_FLASH , 1 , sizeof(CONFIG_FLASH) , f );
		fclose( f );
		puts( "EEPROM loaded" );
	}
}


void FLASH_Unlock(void){
}


void FLASH_Lock(void){
	FILE* f = fopen( "eeprom.bin" , "wb" );
	if( f ){
		fwrite( CONFIG_FLASH , 1 , sizeof(CONFIG_FLASH) , f );
		fclose( f );
		puts( "EEPROM saved" );
	}
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
