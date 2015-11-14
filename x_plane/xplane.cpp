#include <qudpsocket.h>
#include <qthread.h>

extern "C"{
	#include "xplane.h"
}




namespace{

	float      acc_data[3];
	float      gyro_prev[3];
	float      gyro_data[3];
	float      bar_pres;
	float      bar_temp;
	int        motor_data[8];
	int        servo_data[8];

	class XplaneThread : public QThread{
	public:
		QUdpSocket*  send_sock;
		QHostAddress send_host;
		int          send_port;
		char         send_buf[8192];
		int          send_len;

		void begin( const char* type ){
			send_len = strlen(type) + 1;
			memcpy( send_buf , type , send_len );
		}


		void put( double v ){
			*(float*)(send_buf+send_len) = v;
			send_len += 4;
		}

		void put( int v ){
			*(int*)(send_buf+send_len) = v;
			send_len += 4;
		}

		void end( ){
			send_sock->writeDatagram( send_buf , send_len , send_host , send_port );
		}


		void run( ) override{
			QUdpSocket sock;
			sock.bind( 49003 );

			send_sock = &sock;
			send_host = "127.0.0.1";
			send_port = 49000;
			send_len  = 0;

			for(;;){
				sock.waitForReadyRead(5);

				while( sock.hasPendingDatagrams() ){
					char buf[65536];
					int len;

					len = sock.readDatagram( buf , sizeof(buf) );

					if( len < 9 || memcmp(buf,"DATA",4)!=0 ){
						continue;
					}

					char* pos = buf;

					pos += 5;
					len -= 5;

					for(;;){
						int* id = (int*)pos;

						pos += 4;
						len -= 4;

						float* args = (float*)pos;

						pos += 8*4;
						len -= 8*4;

						if( len <= 0 ){
							break;
						}

						//printf( "XPlane: received #%d\n" , *id );

						switch( *id ){
			//			case 3:
			//				pos.spd=fv[2];
			//				break;


						case 4:
							acc_data[0] = args[5];
							acc_data[1] = -args[6];
							acc_data[2] = args[4];
							break;


						case 6:
							bar_pres = args[0];
							bar_temp = args[1];
							break;

						case 16:
							gyro_data[0] = args[1];
							gyro_data[1] = -args[0];
							gyro_data[2] = -args[2];
							break;

			//			case 17:
			//				pos.pt =fv[0];
			//				pos.rl =fv[1];
			//				pos.hdg=fv[2];
			//				break;

			//			case 18:
			//				pos.hpath=fv[2];
			//				pos.vpath=fv[3];
			//				break;

			//			case 20:
			//				pos.lat =fv[0];
			//				pos.lon =fv[1];
			//				pos.alt =fv[2];
			//				break;
						}
					}

				}


				begin("DATA");

				put( 8 );
				for( int c=0 ; c < 8 ; c++ ){
					put( (servo_data[c] - 1000) / 1000.0 );
				}

				put( 25 );
				for( int c=0 ; c < 8 ; c++ ){
					put( (motor_data[c] - 1000) / 1000.0 );
				}
				end();
			}
		}
	};

	XplaneThread thread;
}


bool xplane_acc_read( int16_t* data ){
	data[0] = acc_data[0] * 4096;
	data[1] = acc_data[1] * 4096;
	data[2] = acc_data[2] * 4096;
	//printf( "%d %d %d\n" , data[0] , data[1] , data[2] );
	return true;
}




bool xplane_gyro_read( int16_t* data ){
	data[0] = gyro_data[0] * 180 / M_PI * 16.4 ;
	data[1] = gyro_data[1] * 180 / M_PI * 16.4;
	data[2] = gyro_data[2] * 180 / M_PI * 16.4;

	//printf( "%f %d\n" , gyro_data[2] , data[2] );

	return true;
}


bool xplane_gyro_temp( int16_t* data ){
	data[0] = 0;
	return true;
}


void xplane_baro_read( int32_t* pressure , int32_t* temperature ){
	*pressure    = bar_pres * 33.86389;
	*temperature = bar_temp * 10;
}


bool xplane_mag_read( int16_t* data ){
	data[0] = 0;
	data[1] = 0;
	data[2] = 0;
	return true;
}


void xplane_write_motor( int index , int value ){
	motor_data[index] = value;
}


void xplane_write_servo( int index , int value ){
	servo_data[index] = value;
}


void xplane_init( ){
	thread.start();
}

















/*

void xplane_stop( ){
	duplex.stop();
}





void xplane_respawn( ){
	begin("USEL");
	for( int c=0 ; c<=128 ; c++){
		g_stream<<(qint32)c;
	}
	end();

	begin("DSEL");
	g_stream<<(qint32)3;
	g_stream<<(qint32)4;
	g_stream<<(qint32)16;
	g_stream<<(qint32)17;
	g_stream<<(qint32)18;
	g_stream<<(qint32)19;
	g_stream<<(qint32)20;
	end();

	begin("CHAR");
	g_stream<<(qint8)'r';
	g_stream<<(qint8)'a';
	g_stream<<(qint8)'b';
	g_stream<<(qint8)'3';
	g_stream<<(qint8)'3';
	end();
}
*/
