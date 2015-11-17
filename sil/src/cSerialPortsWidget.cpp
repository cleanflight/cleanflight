#include <qheaderview.h>
#include <qserialportinfo.h>
#include <qsettings.h>
#include "cSerialPortsWidget.h"
#include "main.h"

cSerialPortsWidget::cSerialPortsWidget( QWidget* parent ) : QTreeWidget(parent) {

	headerItem()->setText( 0 , "Port"   );
	headerItem()->setText( 1 , "Path"   );
	headerItem()->setText( 2 , "Baud"   );
	headerItem()->setText( 3 , "Parity" );
	headerItem()->setText( 4 , "Stop"   );
	headerItem()->setText( 5 , "Rx"     );
	headerItem()->setText( 6 , "Tx"     );
	headerItem()->setText( 7 , "Status" );

	for( int c=0 ; c < columnCount() - 1 ; c++ ){
		header()->setSectionResizeMode( c , QHeaderView::ResizeToContents );
	}



	add( "USART1" );
	add( "USART2" );
	add( "USART3" );
	add( "SOFTSERIAL1" );
	add( "SOFTSERIAL2" );


	connect( &timer , &QTimer::timeout , this , &cSerialPortsWidget::refresh );

	timer.start(500);
}


cSerialPortsWidget::~cSerialPortsWidget( ){
	QSettings s;

	for( Port& p : ports ){
		s.setValue( p.name , p.cb->currentText() );
	}

}


void cSerialPortsWidget::add( QString name ){
	Port p;
	p.index = ports.count();
	p.name  = name;
	p.item  = new QTreeWidgetItem( this );
	p.cb    = new QComboBox(this);


	p.item->setText( 0 , name );


	connect( p.cb , &QComboBox::currentTextChanged , this , [=]( const QString& path ){
		serial_set_path( p.index , path );
	});


	p.cb->addItem("");

	for( QSerialPortInfo& info : QSerialPortInfo::availablePorts() ){
		p.cb->addItem( info.portName() );
	}

	p.cb->setCurrentIndex( p.cb->findText( QSettings().value(p.name).toString() ) );

	setItemWidget( p.item , 1 , p.cb  );

	ports.append( p );
}


void cSerialPortsWidget::refresh( ){
	for( Port& p : ports ){

		cSerialInfo info;
		serial_get_info( p.index , &info );

		p.item->setText( 2 , QString::number(info.baud)      );
		p.item->setText( 3 , info.parity ? "even" : "none"   );
		p.item->setText( 4 , QString::number(info.stop)      );
		p.item->setText( 5 , QString::number(info.received)  );
		p.item->setText( 6 , QString::number(info.sent)      );
		p.item->setText( 7 , info.status                     );
	}
}

