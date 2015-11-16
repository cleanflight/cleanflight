#include "cMainWindow.h"
#include <qsettings.h>
#include "main.h"

cMainWindow::cMainWindow( ){
    ui.setupUi( this );

	QRect window = QSettings().value("window").toRect();
	this->resize( window.size()    );
	this->move  ( window.topLeft() );


	for( int c=0 ; c < ui.ports->columnCount() - 1 ; c++ ){
		ui.ports->header()->setSectionResizeMode( c , QHeaderView::ResizeToContents );
	}

	connect( &serial_timer , &QTimer::timeout , this , &cMainWindow::update_serial );

	serial_timer.start(500);
}


cMainWindow::~cMainWindow( ){
	QRect window;
	window.setTopLeft( this->pos()  );
	window.setSize   ( this->size() );
	QSettings().setValue("window",window);
}



void cMainWindow::update_serial( ){
	for( int c=0 ; c < ui.ports->topLevelItemCount() ; c++ ){
		QTreeWidgetItem* item = ui.ports->topLevelItem(c);

		cSerialInfo info;
		serial_get_info( c , &info );

		item->setText( 1 , info.path                       );
		item->setText( 2 , QString::number(info.baud)      );
		item->setText( 3 , info.parity ? "even" : "none"   );
		item->setText( 4 , QString::number(info.stop)      );
		item->setText( 5 , QString::number(info.received)  );
		item->setText( 6 , QString::number(info.sent)      );
		item->setText( 7 , info.status                     );
	}
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
