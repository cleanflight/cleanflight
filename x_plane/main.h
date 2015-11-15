#pragma once

void xplane_start( );
void xplane_stop( );
void xplane_write_motor( int index , int value );
void xplane_write_servo( int index , int value );

void gui_toggle_led    ( int id , int direction );
void gui_lcd_put       ( int x , int y , char ch );
void gui_lcd_clear     ( );

void serial_stop();

void flash_load( );
void flash_save( );
