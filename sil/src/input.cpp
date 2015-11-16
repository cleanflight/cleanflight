#include <stdbool.h>
#include <windows.h>

extern "C"{
	#include "platform.h"
	#include "drivers/gpio.h"
	#include "drivers/timer.h"
	#include "drivers/pwm_rx.h"
	#include "drivers/pwm_mapping.h"
}



pwmOutputConfiguration_t *pwmInit( drv_pwm_config_t* init ){
	UNUSED(init);

	static pwmOutputConfiguration_t pwm;
	pwm.motorCount = 8;
	pwm.servoCount = 8;
	return &pwm;
}

void ppmInConfig(const timerHardware_t *timerHardwarePtr){
	UNUSED(timerHardwarePtr);
}

void ppmAvoidPWMTimerClash(const timerHardware_t *timerHardwarePtr, TIM_TypeDef *sharedPwmTimer){
	UNUSED(timerHardwarePtr);
	UNUSED(sharedPwmTimer);
}

uint16_t ppmRead(uint8_t channel){
	static JOYINFOEX joy;
	static int       pov;
	static int       button;

	if( channel == 0 ){
		joy.dwSize  = sizeof(joy);
		joy.dwFlags = JOY_RETURNALL;
		joyGetPosEx( 0 , &joy );
	}

	int v = 0;

	switch( channel ){
	case 0:
		v = joy.dwXpos;
		break;

	case 1:
		v = joy.dwYpos;
		break;

	case 2:
		v = joy.dwZpos;
		break;;

	case 3:
		v = joy.dwRpos;
		break;

	case 4:
		v = joy.dwUpos;
		break;

	case 5:
		v = joy.dwVpos;
		break;

	case 6:
		if( joy.dwPOV != 0xFFFF ){
			pov = joy.dwPOV;
		}

		v = pov * 0xFFFF / 35900;
		break;

	case 7:
		if( joy.dwButtons ){
			button = 0;

			for( int c=0 ; c < 32 ; c++ ){
				if( joy.dwButtons & (1<<c) ){
					button = 1 + c;
				}
			}
		}

		v = button * 0xFFFF / 16;
		break;
	}

	return 1000 + v * 1000 / 0xFFFF;
}

bool isPPMDataBeingReceived(void){
	return true;
}



uint16_t pwmRead(uint8_t channel){
	UNUSED(channel);
	return 0;
}


void resetPPMDataReceivedState(void){
}

void pwmRxInit(inputFilteringMode_e initialInputFilteringMode){
	UNUSED(initialInputFilteringMode);
}

bool isPWMDataBeingReceived(void){
	return false;
}
