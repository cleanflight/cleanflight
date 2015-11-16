#include "cMainWindow.h"
#include <qthread.h>
#include <qtimer.h>
#include <vector>
#include "main.h"
extern "C" int  cf_main   (void);



namespace{

	class CleanflightLoop : public QThread{
	public:
		void run() override{
			for(;;){
				try{
					cf_main();
				}catch(...){
				}
			}
		}
	};


	cMainWindow*      mw;
}





void gui_toggle_led( int id , int direction ){
	QMetaObject::invokeMethod( mw , "toggle_leds" , Q_ARG(int,id) , Q_ARG(int,direction) );
}


void gui_lcd_put( int x , int y , char ch ){
	mw->ui.lcd->put( x , y , ch );
}


void gui_lcd_clear( ){
	mw->ui.lcd->clear( );
}





#undef main

int main( int argc , char* argv[] ){

	QApplication app( argc , argv );

	QApplication::setApplicationName ( "Cleanflight" );
	QApplication::setOrganizationName( "Cleanflight" );


	mw = new cMainWindow();
	mw->show();

	flash_load  ( );
	xplane_start( );

	CleanflightLoop cf;
	cf.start();

	app.exec();

	cf.terminate();
	cf.wait();

	xplane_stop();
	serial_stop();

	delete mw;

	return 0;
}


