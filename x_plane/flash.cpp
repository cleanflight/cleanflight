#include <stdbool.h>
#include <qfile.h>

extern "C"{
	#include "platform.h"
}

char CONFIG_FLASH[ FLASH_SIZE * 1024 ];

void flash_load( ){
	QFile file( "eeprom.bin" );
	if( file.open(QFile::ReadOnly) ){
		file.read( CONFIG_FLASH , sizeof(CONFIG_FLASH) );
		puts( "EEPROM loaded" );
	}
}


void flash_save( ){
	QFile file( "eeprom.bin" );
	if( file.open(QFile::WriteOnly) ){
		file.write( CONFIG_FLASH , sizeof(CONFIG_FLASH) );
		puts( "EEPROM saved" );
	}
}

