#include <windows.h>
#include <pthread.h>
#include "main.h"
#include <time.h>

extern "C"{
	#include "platform.h"
	#include "drivers/system.h"
	int cf_main(void);
}


static pthread_t thread;
static bool      terminate;


static void* func( void* ){
	cf_main();
	return 0;
}



void exec_start ( ){
	terminate = false;

	pthread_attr_t attr;
	pthread_attr_init( &attr );
	pthread_attr_setdetachstate( &attr , PTHREAD_CREATE_JOINABLE );

	pthread_create( &thread , &attr , func , 0 );

	pthread_attr_destroy( &attr );
}


void exec_stop( ){
	terminate = true;
	pthread_join  ( thread , NULL );
	pthread_detach( thread );
}


//void exec_pause ( );
//void exec_resume( );



static uint32_t ticks( uint32_t div ){
	static unsigned long long startup = 0;

	if( terminate ){
		pthread_exit( 0 );
	}

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
	timespec ts;
	ts.tv_sec  =  us / 1000000;
	ts.tv_nsec = (us % 1000000) * 1000;
	nanosleep( &ts , NULL );
}


void delay( uint32_t ms ){
	timespec ts;
	ts.tv_sec  =  ms / 1000;
	ts.tv_nsec = (ms % 1000) * 1000000;
	nanosleep( &ts , NULL );
}


uint32_t micros(){
	return ticks(1);
}


uint32_t millis(){
	return ticks(1000);
}
