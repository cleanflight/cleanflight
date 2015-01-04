#include "data_upload.h"
#define BYTE0(dwTemp)	(*(char*)(&dwTemp))
#define BYTE1(dwTemp)	(*((char*)(&dwTemp)+1))
#define BYTE2(dwTemp)	(*((char*)(&dwTemp)+2))
#define BYTE3(dwTemp)	(*((char*)(&dwTemp)+3))

#include "nRF24L01p.h"


u16 RC_DAT[8]={1500,1500,1500,1000,1000,1000,1000,1000};


u8 data_to_send[50]= {0};


void Data_Send_Check(u16 check)
{
	u8 sum = 0;
	u8 i;
	data_to_send[0]=0xAA;
	data_to_send[1]=0xAA;
	data_to_send[2]=0xF0;
	data_to_send[3]=3;
	data_to_send[4]=0xBA;

	data_to_send[5]=BYTE1(check);
	data_to_send[6]=BYTE0(check);

	for(i=0; i<7; i++)
		sum += data_to_send[i];

	data_to_send[7]=sum;
#ifdef DATA_TRANSFER_USE_USART
	Uart1_Put_Buf(data_to_send,8);
#else
	nRF_TxPacket(data_to_send,8);
#endif
}

u8
DataUpLoad_Flag,
Send_PID1,
Send_PID2,
Send_PID3;

extern u16 RC_timeout;
void Data_Receive_Anl(u8 *data_buf,u8 len)
{
	u8 sum = 0;
	u8 i;
	for(i=0; i<(len-1); i++)
		sum += *(data_buf+i);
	if(!(sum==*(data_buf+len-1)))	return;
	if(!(*(data_buf)==0xAA && *(data_buf+1)==0xAF))	return;

	if(*(data_buf+2)==0X01) {	//校准
		if(*(data_buf+4)==0X01)
			calibratingA = CALIBRATING_ACC_CYCLES;
		if(*(data_buf+4)==0X02)
			calibratingG = CALIBRATING_GYRO_CYCLES;
		if(*(data_buf+4)==0X03) {
			calibratingA = CALIBRATING_ACC_CYCLES;
			calibratingG = CALIBRATING_GYRO_CYCLES;
		}
	} else if(*(data_buf+2)==0X02) {	//数据回传
		if(*(data_buf+4)==0X01) {
			Send_PID1 = 1;
			Send_PID2 = 1;
			Send_PID3 = 1;
		}
	} else if(*(data_buf+2)==0X03) {
		RC_DAT[0]	= (int16_t)(*(data_buf+4)<<8)	| *(data_buf+5);
		RC_DAT[1] = (int16_t)(*(data_buf+6)<<8)	| *(data_buf+7);
		RC_DAT[2] = (int16_t)(*(data_buf+8)<<8)	| *(data_buf+9);
		RC_DAT[3] = (int16_t)(*(data_buf+10)<<8)| *(data_buf+11);
		RC_DAT[4]	= (int16_t)(*(data_buf+12)<<8)	| *(data_buf+13);
		RC_DAT[5] = (int16_t)(*(data_buf+14)<<8)	| *(data_buf+15);
		RC_DAT[6] = (int16_t)(*(data_buf+16)<<8)	| *(data_buf+17);
		RC_DAT[7] = (int16_t)(*(data_buf+18)<<8)	| *(data_buf+19);
		RC_timeout=0;
	} else if(*(data_buf+2)==0X10) {							//PID1  设定PID
		cfg.P8[ROLL]  = (u8)((vs16)(*(data_buf+4)<<8)|*(data_buf+5));
		cfg.I8[ROLL]  = (u8)((vs16)(*(data_buf+6)<<8)|*(data_buf+7));
		cfg.D8[ROLL]  = (u8)((vs16)(*(data_buf+8)<<8)|*(data_buf+9));
		cfg.P8[PITCH] = (u8)((vs16)(*(data_buf+10)<<8)|*(data_buf+11));
		cfg.I8[PITCH] = (u8)((vs16)(*(data_buf+12)<<8)|*(data_buf+13));
		cfg.D8[PITCH] = (u8)((vs16)(*(data_buf+14)<<8)|*(data_buf+15));
		cfg.P8[YAW]   = (u8)((vs16)(*(data_buf+16)<<8)|*(data_buf+17));
		cfg.I8[YAW] 	= (u8)((vs16)(*(data_buf+18)<<8)|*(data_buf+19));
		cfg.D8[YAW] 	= (u8)((vs16)(*(data_buf+20)<<8)|*(data_buf+21));
		Data_Send_Check(sum);
	} else if(*(data_buf+2)==0X11) {							//PID2	磁场 气压的PID
		cfg.P8[PIDALT] = (u8)((*(data_buf+4)<<8)|*(data_buf+5));
		cfg.I8[PIDALT] = (u8)((*(data_buf+6)<<8)|*(data_buf+7));
		cfg.D8[PIDALT] = (u8)((*(data_buf+8)<<8)|*(data_buf+9));
//		PID_POS.P = (float)((vs16)(*(data_buf+10)<<8)|*(data_buf+11))/100;
//		PID_POS.I = (float)((vs16)(*(data_buf+12)<<8)|*(data_buf+13))/100;
//		PID_POS.D = (float)((vs16)(*(data_buf+14)<<8)|*(data_buf+15))/100;
		cfg.P8[PIDLEVEL] = (u8)((*(data_buf+16)<<8)|*(data_buf+17));
		cfg.I8[PIDLEVEL] = (u8)((*(data_buf+18)<<8)|*(data_buf+19));
		cfg.D8[PIDLEVEL] = (u8)((*(data_buf+20)<<8)|*(data_buf+21));
		Data_Send_Check(sum);
	} else if(*(data_buf+2)==0X12) {							//PID3
//		PID_PID_2.P = (float)((vs16)(*(data_buf+4)<<8)|*(data_buf+5))/100;
//		PID_PID_2.I = (float)((vs16)(*(data_buf+6)<<8)|*(data_buf+7))/100;
//		PID_PID_2.D = (float)((vs16)(*(data_buf+8)<<8)|*(data_buf+9))/100;
//		EE_SAVE_PID();
		Data_Send_Check(sum);
	} else if(*(data_buf+2)==0X13) {
		Data_Send_Check(sum);
	} else if(*(data_buf+2)==0X14) {
		Data_Send_Check(sum);
	} else if(*(data_buf+2)==0X15) {
		Data_Send_Check(sum);
	}
}



void Data_Send_Senser(void)
{
	u8 _cnt=0;
	u8 sum = 0;
	u8 i;
	u8 axis;
	data_to_send[_cnt++]=0xAA;
	data_to_send[_cnt++]=0xAA;
	data_to_send[_cnt++]=0x02;
	data_to_send[_cnt++]=0;

	for(axis=0; axis<3; axis++) {
		data_to_send[_cnt++]=BYTE1(accADC[axis]);
		data_to_send[_cnt++]=BYTE0(accADC[axis]);
	}

	for(axis=0; axis<3; axis++) {
		data_to_send[_cnt++]=BYTE1(gyroADC[axis]);
		data_to_send[_cnt++]=BYTE0(gyroADC[axis]);
	}

	for(axis=0; axis<3; axis++) {
		data_to_send[_cnt++]=BYTE1(magADC[axis]);
		data_to_send[_cnt++]=BYTE0(magADC[axis]);
	}

	data_to_send[3] = _cnt-4;

	for(i=0; i<_cnt; i++)
		sum += data_to_send[i];
	data_to_send[_cnt++] = sum;

#ifdef DATA_TRANSFER_USE_USART
	Uart1_Put_Buf(data_to_send,_cnt);
#else
	nRF_TxPacket(data_to_send,_cnt);
#endif
}



void Nrf_Check_Event(void)
{
	u8 sta=nRF_writeCmd(NOP);
	if( sta & MAX_RT ) {	//达到最大重发次数
		nRF_writeCmd(FLUSH_TX);
	}
	if( sta & TX_DS ) {	//发送完成
	}
	if( sta & RX_DR ) {	//接收到数据
		u8 rx_len = nRF_readReg(R_RX_PL_WID);
		if(rx_len<33) {
			nRF_readBuf(RD_RX_PLOAD,NRF24L01_RXDATA,rx_len);// read receive payload from RX_FIFO buffer
			Data_Receive_Anl(NRF24L01_RXDATA,rx_len);
		} else {
			nRF_writeCmd(FLUSH_RX);
		}
	}
	nRF_clearFlag(STATUS,sta);
}

void data_exchange(void)
{
	u8 sta=0;
	Nrf_Check_Event();
	sta = nRF_readReg(FIFO_STATUS);
	if((sta & 0x10) == 0) return;	//0表示TX不是空的
	Data_Send_Senser();
}

