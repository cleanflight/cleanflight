#pragma once
#include <qstring.h>

void xplane_start( );
void xplane_stop( );
void xplane_write_motor( int index , int value );
void xplane_write_servo( int index , int value );

void gui_toggle_led    ( int id , int direction );
void gui_lcd_put       ( int x , int y , char ch );
void gui_lcd_clear     ( );

void exec_start ( );
void exec_pause ( );
void exec_resume( );
void exec_stop  ( );

struct cSerialInfo{
	QString status;
	QString path;
	int     baud;
	int     parity;
	int     stop;
	int     sent;
	int     received;
};

void serial_stop();
void serial_get_info( int index , cSerialInfo* info );
void serial_set_path( int index , QString path );

void flash_load( );
void flash_save( );

void geomag_get( float lat , float lon , float alt , float* mag_x , float* mag_y , float* mag_z );
