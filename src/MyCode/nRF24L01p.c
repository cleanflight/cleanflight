#include "nrf24l01p.h"

u8 NRF24L01_RXDATA[RX_PLOAD_WIDTH];			//nrf24l01���յ�������
u8 NRF24L01_TXDATA[RX_PLOAD_WIDTH];			//nrf24l01��Ҫ���͵�����
u8  TX_ADDRESS[TX_ADR_WIDTH]= {NRF_ADDR_TX};	//���ص�ַ
u8  RX_ADDRESS[RX_ADR_WIDTH]= {NRF_ADDR_RX};	//���յ�ַ


//-----------------------------------
//дָ��
u8 nRF_writeCmd(u8 cmd)
{
	u8 status;
	NRF_CSN_L();
	status = spi_RW(cmd);
	NRF_CSN_H();
	return status;
}

//-----------------------------------
//д�Ĵ���
u8 nRF_writeReg(u8 reg, u8 value)
{
	u8 status;
	NRF_CSN_L();					//ѡͨ����
	status = spi_RW(reg); //д�Ĵ�����ַ
	spi_RW(value);		  	//д����
	NRF_CSN_H();					//��ֹ������
	return 	status;
}

//-----------------------------------
//���Ĵ���
u8 nRF_readReg(u8 reg)
{
	u8 reg_val;
	NRF_CSN_L();					//ѡͨ����
	spi_RW(reg);			  	//д�Ĵ�����ַ
	reg_val = spi_RW(0);	//��ȡ�üĴ�����������
	NRF_CSN_H();					//��ֹ������
	return 	reg_val;
}

//-----------------------------------
//д������
u8 nRF_writeBuf(u8 reg, u8 *pBuf, u8 uchars)
{
	u8 i;
	u8 status;
	NRF_CSN_L();				    //ѡͨ����
	status = spi_RW(reg);		//д�Ĵ�����ַ
	for(i=0; i<uchars; i++) {
		spi_RW(pBuf[i]);			//д����
	}
	NRF_CSN_H();						//��ֹ������
	return 	status;
}

//-----------------------------------
//��������
u8 nRF_readBuf(u8 reg, u8 *pBuf, u8 uchars)
{
	u8 i;
	u8 status;
	NRF_CSN_L();						//ѡͨ����
	status = spi_RW(reg);		//д�Ĵ�����ַ
	for(i=0; i<uchars; i++) {
		pBuf[i] = spi_RW(0); 	//��ȡ��������
	}
	NRF_CSN_H();						//��ֹ������
	return status;
}

//-----------------------------------
//д���ݰ�
void nRF_TxPacket(u8 * tx_buf, u8 len)
{
	NRF_CE_L();		 																	//StandBy Iģʽ
//nRF_writeBuf(NRF_WRITE_REG + RX_ADDR_P0, TX_ADDRESS, TX_ADR_WIDTH); // װ�ؽ��ն˵�ַ
	nRF_writeBuf(WR_TX_PLOAD, tx_buf, len); 			 	// װ������
	NRF_CE_H();		 																	//�ø�CE���������ݷ���
}

//-----------------------------------
//д�����������ݰ�
void nRF_TxPacket_AP(u8 * tx_buf, u8 len)
{
	NRF_CE_L();		 										//StandBy Iģʽ
	nRF_writeBuf(0xa8, tx_buf, len); 	//װ������
	NRF_CE_H();		 										//�ø�CE
}

//-----------------------------------
//д1�����־λ
void nRF_clearFlag(u8 reg,u8 flagBit)
{
//	NRF_CE_L();
	nRF_writeReg(NRF_WRITE_REG + reg,flagBit);
//	NRF_CE_H();
}

//-----------------------------------
//���nRF�豸
u8 nRF_check(void)
{
	u8 buf1[TX_ADR_WIDTH];
	u8 i;
	nRF_writeBuf(NRF_WRITE_REG+TX_ADDR,TX_ADDRESS,TX_ADR_WIDTH); 	//д��5���ֽڵĵ�ַ
	nRF_readBuf(TX_ADDR,buf1,TX_ADR_WIDTH); 											//����д��ĵ�ַ
	for(i=0; i<TX_ADR_WIDTH; i++) {
		if(buf1[i]!=TX_ADDRESS[i])
			break;
	}
	if(i==5)
		return SUCCESS ; 	//MCU��NRF�ɹ�����
	else
		return ERROR ; 		//MCU��NRF����������
}

//-----------------------------------
//��ʼ��
void nRF_init(u8 model, u8 ch)
{
	NRF_CE_L();
	nRF_writeBuf(NRF_WRITE_REG+RX_ADDR_P0,	RX_ADDRESS,RX_ADR_WIDTH);	//дRXͨ��0�ڵ��ַ
	nRF_writeBuf(NRF_WRITE_REG+TX_ADDR,			TX_ADDRESS,TX_ADR_WIDTH); //дTX�ڵ��ַ
	nRF_writeReg(NRF_WRITE_REG+EN_AA,				0x01	); 									//ʹ��ͨ��0���Զ�Ӧ��
	nRF_writeReg(NRF_WRITE_REG+EN_RXADDR,		0x01	);									//ʹ��ͨ��0�Ľ��յ�ַ
	nRF_writeReg(NRF_WRITE_REG+SETUP_RETR,	0x1a	);									//�����Զ��ط����ʱ��:500us;����Զ��ط�����:10��
	nRF_writeReg(NRF_WRITE_REG+RF_CH,				ch		);									//����RFͨ��CHANAL
	nRF_writeReg(NRF_WRITE_REG+RF_SETUP,		0x0f	); 									//����TX�������,0db����,2Mbps,���������濪��
//nRF_writeReg(NRF_WRITE_REG+RF_SETUP,		0x07	); 									//����TX�������,0db����,1Mbps,���������濪��

	if(model==1) {			//RX
		nRF_writeReg(NRF_WRITE_REG+RX_PW_P0,RX_PLOAD_WIDTH);						//ѡ��ͨ��0����Ч���ݿ��
		nRF_writeReg(NRF_WRITE_REG + CONFIG, 0x0f);   		 							//IRQ�շ�����жϿ���,16λCRC,������
	} else if(model==2) {	//TX
		nRF_writeReg(NRF_WRITE_REG+RX_PW_P0,RX_PLOAD_WIDTH);						//ѡ��ͨ��0����Ч���ݿ��
		nRF_writeReg(NRF_WRITE_REG + CONFIG, 0x0e);   		 							//IRQ�շ�����жϿ���,16λCRC,������
	} else if(model==3) {	//RX2
		nRF_writeCmd(FLUSH_TX);
		nRF_writeCmd(FLUSH_RX);
		nRF_writeReg(NRF_WRITE_REG + CONFIG, 0x0f);   		 							//IRQ�շ�����жϿ���,16λCRC,������

		//spi_RW(0x50);spi_RW(0x73);	//nRF24L01+ȡ��������ָ��
		nRF_writeReg(NRF_WRITE_REG+DYNPD	,	0x01);		//ͨ��0��̬���ݳ���
		nRF_writeReg(NRF_WRITE_REG+FEATURE,	0x06);		//����Я������ACK�Ͷ�̬���ݳ���
	} else {
		nRF_writeCmd(FLUSH_TX);
		nRF_writeCmd(FLUSH_RX);
		nRF_writeReg(NRF_WRITE_REG + CONFIG, 0x0e);   		 							//IRQ�շ�����жϿ���,16λCRC,������

		//spi_RW(0x50);spi_RW(0x73);	//nRF24L01+ȡ��������ָ��
		nRF_writeReg(NRF_WRITE_REG+DYNPD,		0x01);		//ͨ��0��̬���ݳ���
		nRF_writeReg(NRF_WRITE_REG+FEATURE,	0x06);		//����Я������ACK�Ͷ�̬���ݳ���
	}
	NRF_CE_H();
}
