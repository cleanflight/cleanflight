#include "cMainWindow.h"
#include <qsettings.h>
#include <qcombobox.h>
#include <qserialportinfo.h>
#include "main.h"

cMainWindow::cMainWindow( ){
    ui.setupUi( this );

	QRect window = QSettings().value("window").toRect();
	this->resize( window.size()    );
	this->move  ( window.topLeft() );


}


cMainWindow::~cMainWindow( ){
	QRect window;
	window.setTopLeft( this->pos()  );
	window.setSize   ( this->size() );
	QSettings().setValue("window",window);
}



void cMainWindow::toggle_leds( int id , int direction ){
    QWidget* widget;
    QColor   color;

    switch( id ){
    case 0:
        widget = ui.LED0;
        color  = Qt::green;
        break;

    case 1:
        widget = ui.LED1;
		color  = Qt::blue;
        break;

    case 2:
        widget = ui.LED2;
		color  = Qt::red;
        break;

    default:
        return;
    }

    QPalette pal = widget->palette();

    switch( direction ){
    case -1:
        pal.setColor( QPalette::Window , Qt::transparent );
        break;

    case +1:
        pal.setColor( QPalette::Window , color );
        break;

    case 0:
        if( pal.color(QPalette::Window) == color ){
            pal.setColor( QPalette::Window , Qt::transparent );
        }else{
            pal.setColor( QPalette::Window , color );
        }
        break;
    }

    widget->setPalette( pal );

}
