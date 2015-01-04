#ifndef __DATA_UPLOAD_H
#define __DATA_UPLOAD_H
#include "stm32f10x.h"

#include "board.h"
#include "mw.h"

extern u8 
DataUpLoad_Flag;


void data_exchange(void);

extern u16 RC_DAT[];
#endif
