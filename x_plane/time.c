#include <stdbool.h>
#include "platform.h"
#include "drivers/system.h"
#include <windows.h>


static uint32_t ticks( uint32_t div ){
	static unsigned long long startup = 0;

	FILETIME t;
	GetSystemTimePreciseAsFileTime(&t);
	unsigned long long r;


	r   = t.dwHighDateTime;
	r <<= 32;
	r  |= t.dwLowDateTime;
	r  /= 10;

	if( startup == 0 ){
		startup = r;
	}

	return (r - startup) / div;
}



void delayMicroseconds( uint32_t us ){
	if( us < 1000 ){
		Sleep(1);
	}else{
		Sleep( us / 1000 );
	}
}

void delay(uint32_t ms){
	Sleep(ms);
}

uint32_t micros(){
	return ticks(1);
}

uint32_t millis(){
	return ticks(1000);
}
