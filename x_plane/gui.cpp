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
	int               lcd_width  = 0;
	int               lcd_height = 0;
	std::vector<char> lcd_data;
	bool              lcd_updated;


}


static void update_lcd( ){
	if( lcd_updated ){
		lcd_updated = false;

		QString text;
		text.fill( ' ' , (lcd_width + 1)* lcd_height );

		for( int row=0 ; row<lcd_height ; row++ ){

			for( int col=0 ; col<lcd_width ; col++ ){
				int  is = col + row*(lcd_width  );
				int  id = col + row*(lcd_width+1);
				char ch = lcd_data[is];

				if( ch && ch !=' ' ){
					text[id] = ch;
				}
			}

			text[ row*(lcd_width+1) + lcd_width ] = '\n';
		}

		mw->ui.lcd->setText( text );

	}
}



void gui_toggle_led( int id , int direction ){
	QMetaObject::invokeMethod( mw , "toggle_leds" , Q_ARG(int,id) , Q_ARG(int,direction) );
}


void gui_lcd_init ( int width , int height ){
	lcd_width  = width;
	lcd_height = height;
	lcd_data.resize( width * height );
}

void gui_lcd_put( int x , int y , char ch ){
	if( x < 0 || y < 0 || x >= lcd_width || y >= lcd_height ){
		return;
	}

	lcd_data[y * lcd_width + x] = ch;

	lcd_updated = true;
}


void gui_lcd_clear( ){
	memset( lcd_data.data() , 0 , lcd_data.size() );
	lcd_updated = true;
}





#undef main

int main( int argc , char* argv[] ){

	QApplication app( argc , argv );

	QTimer lcd_timer;
	QObject::connect( &lcd_timer , &QTimer::timeout , update_lcd );
	lcd_timer.start( 50 );

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


