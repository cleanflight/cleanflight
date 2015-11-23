extern "C"{
	#include "platform.h"
	#include "drivers/system.h"
	#include "drivers/serial.h"
	#include "drivers/serial_softserial.h"
	#include "drivers/serial_uart.h"
}

#include <qserialport.h>
#include <qmutex.h>
#include <qthread.h>
#include "main.h"

namespace{

	struct Fifo{
		static const int mask = 0xFFF;

		char buf[mask+1];
		int  rpos;
		int  wpos;
		int  total;

		Fifo( ){
			rpos  = 0;
			wpos  = 0;
			total = 0;
		}


		bool push( char v ){
			total++;

			if( ((wpos + 1) & mask) == rpos ){
				return false;
			}

			buf[ wpos & mask ] = v;
			wpos++;

			return true;
		}

		bool pop( char* v ){
			if( rpos == wpos ){
				return false;
			}

			*v = buf[ rpos & mask ];
			rpos++;

			return true;
		}

		int length( ){
			return (wpos - rpos) & mask;
		}
	};


	class PortThread : public QThread{
	public:
		serialPort_t cfg;
		int          index;
		bool         terminate_flag;
		Fifo         recv_buf;
		Fifo         send_buf;
		QString      status;
		QString      path;
		QMutex       mutex;
		bool         reopen;

		PortThread( ){
			reopen = false;
		}

		void run( ) override{
			QSerialPort s;

			while( !terminate_flag ){

				if( !s.isOpen() || reopen ){
					s.close();

					reopen = false;

					mutex.lock();

					s.setPortName( path );
					s.setBaudRate( cfg.baudRate );

					if( cfg.options & SERIAL_STOPBITS_2 ){
						s.setStopBits( QSerialPort::TwoStop );
					}else{
						s.setStopBits( QSerialPort::OneStop );
					}

					if( cfg.options & SERIAL_PARITY_EVEN ){
						s.setParity( QSerialPort::EvenParity );
					}else{
						s.setParity( QSerialPort::NoParity );
					}

					mutex.unlock();

					s.open( QIODevice::ReadWrite );

					mutex.lock();
						if( s.isOpen() ){
							status = "ok";
						}else{
							status = s.errorString();
						}
					mutex.unlock();

					if( !s.isOpen() ){
						msleep(1000);
					}
				}else{
					char buf[1024];
					int  len;


					len = 0;

					while( len < (int)sizeof(buf) ){
						if( !send_buf.pop( &buf[len] ) ){
							break;
						}

						len++;
					}

					if( len ){
						//printf( "send %d\n" , len );

						s.write( buf , len );
						s.waitForBytesWritten(1000);
					}


					s.waitForReadyRead(10);

					len = std::min( (int)s.bytesAvailable() , (int)sizeof(buf) );

					if( len ){
						s.read(buf,len);

						if( cfg.callback ){
							for( int c=0 ; c < len ; c++ ){
								cfg.callback( buf[c] & 0xFF );
							}

							recv_buf.total += len;
						}else{
							for( int c=0 ; c < len ; c++ ){
								recv_buf.push( buf[c] );
							}
						}

					}
				}
			}
		}

		void stop( ){
			terminate_flag = true;
			wait();
		}

		void start( ){
			terminate_flag = false;
			QThread::start();
		}
	};
}


static PortThread threads[SERIAL_PORT_COUNT];


static PortThread* find( serialPort_t* instance ){
	for( PortThread& p : threads ){
		if( &p.cfg == instance ){
			return &p;
		}
	}
	return 0;
}

void serial_stop(){
	for( PortThread& p : threads ){
		p.stop();
	}
}



void serial_get_info( int index , cSerialInfo* info ){
	PortThread* p = &threads[index];
	info->baud     = p->cfg.baudRate;
	info->stop     = (p->cfg.options & SERIAL_STOPBITS_2 ) ? 2 : 1;
	info->parity   = (p->cfg.options & SERIAL_PARITY_EVEN) ? 2 : 0;
	info->sent     = p->send_buf.total;
	info->received = p->recv_buf.total;

	p->mutex.lock();
	info->status = p->status;
	info->path   = p->path;
	p->mutex.unlock();
}


void serial_set_path( int index , QString path ){
	PortThread* p = &threads[index];

	p->mutex.lock();
	p->path   = path;
	p->reopen = true;
	p->mutex.unlock();
}


serialPort_t* uartOpen( USART_TypeDef* USARTx , serialReceiveCallbackPtr callback , uint32_t baudRate , portMode_t mode , portOptions_t options ){
	int id = (int)USARTx;

	if( id < 0 || id >= 5 ){
		return 0;
	}

	PortThread* p = &threads[id];
	p->index          = id;
	p->cfg.callback   = callback;
	p->cfg.baudRate   = baudRate;
	p->cfg.mode       = mode;
	p->cfg.options    = options;
	p->stop ();
	p->start();
	return &p->cfg;
}



void serialWrite( serialPort_t* instance , uint8_t ch ){
	PortThread* p = find(instance);
	p->send_buf.push( ch );
}


uint8_t serialRxBytesWaiting( serialPort_t* instance ){
	PortThread* p = find(instance);
	return std::min( p->recv_buf.length() , 255 );
}


uint8_t serialTxBytesFree( serialPort_t* instance ){
	UNUSED(instance);
	return 127;
}


uint8_t serialRead( serialPort_t* instance ){
	PortThread* p = find(instance);

	char r = 0;
	p->recv_buf.pop( &r );
	return r;
}


void serialSetBaudRate( serialPort_t* instance , uint32_t baudRate ){
	PortThread* p = find(instance);
	if( p->cfg.baudRate != baudRate ){
		p->cfg.baudRate = baudRate;
		p->stop ();
		p->start();
	}

}


void serialSetMode( serialPort_t* instance , portMode_t mode ){
	UNUSED( instance );
	UNUSED( mode );
}


bool isSerialTransmitBufferEmpty( serialPort_t* instance ){
	UNUSED(instance);
	return true;
}


void serialPrint( serialPort_t* instance , const char* str ){
	while( *str ){
		serialWrite( instance , *str );
		str++;
	}
}


uint32_t serialGetBaudRate( serialPort_t* instance ){
	return instance->baudRate;
}


serialPort_t *openSoftSerial(softSerialPortIndex_e portIndex, serialReceiveCallbackPtr callback, uint32_t baud, portOptions_t options){
	return uartOpen( (USART_TypeDef*)(3 + portIndex) , callback , baud , MODE_RXTX , options );
}


void softSerialWriteByte( serialPort_t* instance , uint8_t ch ){
	serialWrite( instance , ch );
}


uint8_t softSerialRxBytesWaiting( serialPort_t* instance ){
	return serialRxBytesWaiting( instance );
}


uint8_t softSerialTxBytesFree( serialPort_t* instance ){
	return serialTxBytesFree( instance );
}


uint8_t softSerialReadByte( serialPort_t* instance ){
	return serialRead( instance );
}


void softSerialSetBaudRate( serialPort_t* instance , uint32_t baudRate ){
	return serialSetBaudRate( instance , baudRate );
}

//bool isSoftSerialTransmitBufferEmpty(serialPort_t * instance ){
//	return uartTotalTxBytesFree( instance );
//}
