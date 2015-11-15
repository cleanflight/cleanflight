#include <stdbool.h>

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
}

#include "main.h"


static void noop( ){
}


static void noop_lpf( uint16_t lpf ){
	UNUSED(lpf);
}


bool mpu6500AccDetect(acc_t *acc){
	acc->init = noop;
	acc->read = xplane_acc_read;
	acc->revisionCode = 0;
	acc_1G = 4096;
	return true;
}


bool mpu6500GyroDetect(gyro_t *gyro){
	gyro->init        = noop_lpf;
	gyro->read        = xplane_gyro_read;
	gyro->temperature = xplane_gyro_temp;
	gyro->scale       = 1.0 / 16.4;
	return true;
}

mpuDetectionResult_t *detectMpu( const extiConfig_t *configToUse ){
	UNUSED(configToUse);

	static mpuDetectionResult_t r;
	r.resolution = MPU_FULL_RESOLUTION;
	r.sensor     = MPU_65xx_I2C;
	return &r;
}

bool bmp280Detect(baro_t *baro){
	baro->get_up    = noop;
	baro->get_ut    = noop;
	baro->start_up  = noop;
	baro->start_ut  = noop;
	baro->calculate = xplane_baro_read;
	return true;
}


bool hmc5883lDetect(mag_t* mag, const hmc5883Config_t *hmc5883ConfigToUse){
	UNUSED(hmc5883ConfigToUse);
	mag->init = noop;
	mag->read = xplane_mag_read;
	return true;
}



void hcsr04_init( const sonarHardware_t* sonarHardware ){
	UNUSED( sonarHardware );
}

void hcsr04_start_reading( ){
}

int32_t hcsr04_get_distance( ){
	return 0;
}


