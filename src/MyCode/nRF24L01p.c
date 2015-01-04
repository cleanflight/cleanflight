#include "nrf24l01p.h"

u8 NRF24L01_RXDATA[RX_PLOAD_WIDTH];			//nrf24l01接收到的数据
u8 NRF24L01_TXDATA[RX_PLOAD_WIDTH];			//nrf24l01需要发送的数据
u8  TX_ADDRESS[TX_ADR_WIDTH]= {NRF_ADDR_TX};	//本地地址
u8  RX_ADDRESS[RX_ADR_WIDTH]= {NRF_ADDR_RX};	//接收地址


//-----------------------------------
//写指令
u8 nRF_writeCmd(u8 cmd)
{
	u8 status;
	NRF_CSN_L();
	status = spi_RW(cmd);
	NRF_CSN_H();
	return status;
}

//-----------------------------------
//写寄存器
u8 nRF_writeReg(u8 reg, u8 value)
{
	u8 status;
	NRF_CSN_L();					//选通器件
	status = spi_RW(reg); //写寄存器地址
	spi_RW(value);		  	//写数据
	NRF_CSN_H();					//禁止该器件
	return 	status;
}

//-----------------------------------
//读寄存器
u8 nRF_readReg(u8 reg)
{
	u8 reg_val;
	NRF_CSN_L();					//选通器件
	spi_RW(reg);			  	//写寄存器地址
	reg_val = spi_RW(0);	//读取该寄存器返回数据
	NRF_CSN_H();					//禁止该器件
	return 	reg_val;
}

//-----------------------------------
//写缓冲区
u8 nRF_writeBuf(u8 reg, u8 *pBuf, u8 uchars)
{
	u8 i;
	u8 status;
	NRF_CSN_L();				    //选通器件
	status = spi_RW(reg);		//写寄存器地址
	for(i=0; i<uchars; i++) {
		spi_RW(pBuf[i]);			//写数据
	}
	NRF_CSN_H();						//禁止该器件
	return 	status;
}

//-----------------------------------
//读缓冲区
u8 nRF_readBuf(u8 reg, u8 *pBuf, u8 uchars)
{
	u8 i;
	u8 status;
	NRF_CSN_L();						//选通器件
	status = spi_RW(reg);		//写寄存器地址
	for(i=0; i<uchars; i++) {
		pBuf[i] = spi_RW(0); 	//读取返回数据
	}
	NRF_CSN_H();						//禁止该器件
	return status;
}

//-----------------------------------
//写数据包
void nRF_TxPacket(u8 * tx_buf, u8 len)
{
	NRF_CE_L();		 																	//StandBy I模式
//nRF_writeBuf(NRF_WRITE_REG + RX_ADDR_P0, TX_ADDRESS, TX_ADR_WIDTH); // 装载接收端地址
	nRF_writeBuf(WR_TX_PLOAD, tx_buf, len); 			 	// 装载数据
	NRF_CE_H();		 																	//置高CE，激发数据发送
}

//-----------------------------------
//写被动发送数据包
void nRF_TxPacket_AP(u8 * tx_buf, u8 len)
{
	NRF_CE_L();		 										//StandBy I模式
	nRF_writeBuf(0xa8, tx_buf, len); 	//装载数据
	NRF_CE_H();		 										//置高CE
}

//-----------------------------------
//写1清除标志位
void nRF_clearFlag(u8 reg,u8 flagBit)
{
//	NRF_CE_L();
	nRF_writeReg(NRF_WRITE_REG + reg,flagBit);
//	NRF_CE_H();
}

//-----------------------------------
//检测nRF设备
u8 nRF_check(void)
{
	u8 buf1[TX_ADR_WIDTH];
	u8 i;
	nRF_writeBuf(NRF_WRITE_REG+TX_ADDR,TX_ADDRESS,TX_ADR_WIDTH); 	//写入5个字节的地址
	nRF_readBuf(TX_ADDR,buf1,TX_ADR_WIDTH); 											//读出写入的地址
	for(i=0; i<TX_ADR_WIDTH; i++) {
		if(buf1[i]!=TX_ADDRESS[i])
			break;
	}
	if(i==5)
		return SUCCESS ; 	//MCU与NRF成功连接
	else
		return ERROR ; 		//MCU与NRF不正常连接
}

//-----------------------------------
//初始化
void nRF_init(u8 model, u8 ch)
{
	NRF_CE_L();
	nRF_writeBuf(NRF_WRITE_REG+RX_ADDR_P0,	RX_ADDRESS,RX_ADR_WIDTH);	//写RX通道0节点地址
	nRF_writeBuf(NRF_WRITE_REG+TX_ADDR,			TX_ADDRESS,TX_ADR_WIDTH); //写TX节点地址
	nRF_writeReg(NRF_WRITE_REG+EN_AA,				0x01	); 									//使能通道0的自动应答
	nRF_writeReg(NRF_WRITE_REG+EN_RXADDR,		0x01	);									//使能通道0的接收地址
	nRF_writeReg(NRF_WRITE_REG+SETUP_RETR,	0x1a	);									//设置自动重发间隔时间:500us;最大自动重发次数:10次
	nRF_writeReg(NRF_WRITE_REG+RF_CH,				ch		);									//设置RF通道CHANAL
	nRF_writeReg(NRF_WRITE_REG+RF_SETUP,		0x0f	); 									//设置TX发射参数,0db增益,2Mbps,低噪声增益开启
//nRF_writeReg(NRF_WRITE_REG+RF_SETUP,		0x07	); 									//设置TX发射参数,0db增益,1Mbps,低噪声增益开启

	if(model==1) {			//RX
		nRF_writeReg(NRF_WRITE_REG+RX_PW_P0,RX_PLOAD_WIDTH);						//选择通道0的有效数据宽度
		nRF_writeReg(NRF_WRITE_REG + CONFIG, 0x0f);   		 							//IRQ收发完成中断开启,16位CRC,主接收
	} else if(model==2) {	//TX
		nRF_writeReg(NRF_WRITE_REG+RX_PW_P0,RX_PLOAD_WIDTH);						//选择通道0的有效数据宽度
		nRF_writeReg(NRF_WRITE_REG + CONFIG, 0x0e);   		 							//IRQ收发完成中断开启,16位CRC,主发送
	} else if(model==3) {	//RX2
		nRF_writeCmd(FLUSH_TX);
		nRF_writeCmd(FLUSH_RX);
		nRF_writeReg(NRF_WRITE_REG + CONFIG, 0x0f);   		 							//IRQ收发完成中断开启,16位CRC,主接收

		//spi_RW(0x50);spi_RW(0x73);	//nRF24L01+取消了这条指令
		nRF_writeReg(NRF_WRITE_REG+DYNPD	,	0x01);		//通道0动态数据长度
		nRF_writeReg(NRF_WRITE_REG+FEATURE,	0x06);		//开启携带数据ACK和动态数据长度
	} else {
		nRF_writeCmd(FLUSH_TX);
		nRF_writeCmd(FLUSH_RX);
		nRF_writeReg(NRF_WRITE_REG + CONFIG, 0x0e);   		 							//IRQ收发完成中断开启,16位CRC,主发送

		//spi_RW(0x50);spi_RW(0x73);	//nRF24L01+取消了这条指令
		nRF_writeReg(NRF_WRITE_REG+DYNPD,		0x01);		//通道0动态数据长度
		nRF_writeReg(NRF_WRITE_REG+FEATURE,	0x06);		//开启携带数据ACK和动态数据长度
	}
	NRF_CE_H();
}
