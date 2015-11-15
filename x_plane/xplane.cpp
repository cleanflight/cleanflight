#include <qudpsocket.h>
#include <qthread.h>
#include "main.h"



extern "C"{
	#include "platform.h"
	#include "drivers/exti.h"
	#include "drivers/sensor.h"
	#include "drivers/accgyro.h"
	#include "drivers/accgyro_mpu.h"
	#include "drivers/accgyro_mpu6500.h"
	#include "drivers/barometer.h"
	#include "drivers/barometer_bmp280.h"
	#include "drivers/compass.h"
	#include "drivers/compass_hmc5883l.h"
	#include "drivers/sonar_hcsr04.h"
	#include "drivers/pwm_output.h"
	#include "drivers/adc.h"
	#include "sensors/battery.h"
}




namespace{
	float        acc_data[3];
	float        gyro_data[3];
	float        bar_pres;
	float        bar_temp;
	int          motor_data[8];
	int          servo_data[8];
	QUdpSocket*  send_sock;
	QHostAddress send_host;
	int          send_port;
	char         send_buf[8192];
	int          send_len;
	float        baterry_voltage;
	float        baterry_amperage;
	bool         terminate_flag;


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



	class XplaneThread : public QThread{
	public:

		void run( ) override{
			QUdpSocket sock;
			sock.bind( 49003 );

			send_sock = &sock;
			send_host = "127.0.0.1";
			send_port = 49000;
			send_len  = 0;

			while( !terminate_flag ){
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

						if( len < 0 ){
							break;
						}

						//printf( "id %d  (len%d)\n" , *id , len );

						switch( *id ){
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

						case 53:
							baterry_amperage = args[0];
							break;

						case 54:
							baterry_voltage = args[0];
							break;
						}
					}

				}


				begin("DATA");

				//put( 8 );
				//for( int c=0 ; c < 8 ; c++ ){
				//	put( (servo_data[c] - 1000) / 1000.0 );
				//}

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











void xplane_start( ){
	terminate_flag = false;
	thread.start();
}


void xplane_stop( ){
	terminate_flag = true;
	thread.wait();
}










bool mpu6500AccDetect(acc_t *acc){
	acc->init = [](){
	};

	acc->read = []( int16_t* data ){
		data[0] = acc_data[0] * 4096;
		data[1] = acc_data[1] * 4096;
		data[2] = acc_data[2] * 4096;
		return true;
	};

	acc->revisionCode = 0;

	acc_1G = 4096;

	return true;
}



bool mpu6500GyroDetect(gyro_t *gyro){
	gyro->init = []( uint16_t lpf ){
		UNUSED(lpf);
	};

	gyro->read = []( int16_t* data ){
		data[0] = gyro_data[0] * 180 / M_PI * 16.4 ;
		data[1] = gyro_data[1] * 180 / M_PI * 16.4;
		data[2] = gyro_data[2] * 180 / M_PI * 16.4;
		return true;
	};

	gyro->temperature = []( int16_t* data ){
		data[0] = 0;
		return true;
	};

	gyro->scale = 1.0 / 16.4;

	return true;
}


bool bmp280Detect(baro_t *baro){
	baro->get_up = [](){
	};

	baro->get_ut = [](){
	};

	baro->start_up = [](){
	};

	baro->start_ut = [](){
	};

	baro->calculate = []( int32_t* pressure , int32_t* temperature ){
		*pressure    = bar_pres * 3386.389;
		*temperature = bar_temp * 10;
	};

	return true;
}




bool hmc5883lDetect(mag_t* mag, const hmc5883Config_t *hmc5883ConfigToUse){
	UNUSED(hmc5883ConfigToUse);

	mag->init = [](){
	};

	mag->read = []( int16_t* data ){
		data[0] = 0;
		data[1] = 0;
		data[2] = 0;
		return false;
	};

	return false;
}




void hcsr04_init( const sonarHardware_t* sonarHardware ){
	UNUSED( sonarHardware );
}


void hcsr04_start_reading( ){
}


int32_t hcsr04_get_distance( ){
	return 0;
}


mpuDetectionResult_t *detectMpu( const extiConfig_t *configToUse ){
	UNUSED(configToUse);

	static mpuDetectionResult_t r;
	r.resolution = MPU_FULL_RESOLUTION;
	r.sensor     = MPU_65xx_I2C;
	return &r;
}




void pwmWriteMotor( uint8_t index , uint16_t value ){
	motor_data[index] = value;
}


void pwmShutdownPulsesForAllMotors( uint8_t motorCount ){
	UNUSED(motorCount);
}


void pwmCompleteOneshotMotorUpdate( uint8_t motorCount ){
	UNUSED(motorCount);
}


void pwmWriteServo(uint8_t index, uint16_t value){
	servo_data[index] = value;
}


bool isMotorBrushed( uint16_t motorPwmRate ){
	UNUSED(motorPwmRate);
	return false;
}



void adcInit( drv_adc_config_t* init ){
	UNUSED(init);
}


uint16_t adcGetChannel( uint8_t channel ){
	int r = 0;

	switch( channel ){
	case ADC_BATTERY:
		r = (baterry_voltage * 10 * VBAT_RESDIVMULTIPLIER_DEFAULT * VBAT_RESDIVVAL_DEFAULT * 0xFFF - 0xFFF * 5) / 33 / VBAT_SCALE_DEFAULT;
		break;

	case ADC_CURRENT:
		r = -baterry_amperage * 0.040 * 4095 / 3.3;
		break;
	}

	if( r < 0 ){
		return 0;
	}
	return r;
}
