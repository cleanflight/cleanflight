#include "cMainWindow.h"
#include <qthread.h>
#include <qtimer.h>
#include <vector>

extern "C"{
	#include "gui.h"
	#include "xplane.h"
	void FLASH_Read(void);
	int  cf_main   (void);
}

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


	mw = new cMainWindow;
	mw->show();

	FLASH_Read();

	xplane_init();

	CleanflightLoop cf;
	cf.start();

	app.exec();

	cf.terminate();
	cf.wait();

	return 0;
}


