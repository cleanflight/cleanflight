/*
 * butterworth.c

 *
 *  Created on: 17 jun. 2015
 *      Author: borisb
 */

#include <stdbool.h>
#include <stdint.h>
#include <math.h>

#include "flight/butterworth.h"


#define BB0 15191
#define BB1 30381
#define BB2 15191
#define BFACTOR (4096*1024)

#define BA0 4096
#define BA1 7466
#define BA2 -3429
#define AFACTOR BA0

int16_t ButterWs[9]={0,0,0,0,0,0,0,0,0};

int16_t Butter(int16_t *w, int16_t NewValue)
{
    int32_t Acc;

    Acc = NewValue*BA0;
    Acc += (BA1 * w[1]);
    Acc += (BA2 * w[2]);
    w[0] = (int16_t) (Acc/AFACTOR);
    Acc = (BB0 * w[0]);
    Acc += (BB1 * w[1]);
    Acc += (BB2 * w[2]);
    w[2] = w[1];
    w[1] = w[0];
    return (int16_t)(Acc/BFACTOR);
}



int16_t Butterworth(int axis, int16_t delta) {
	int16_t NewDelta;

    NewDelta = Butter(&(ButterWs[3*axis]), delta);
    return NewDelta;
}
