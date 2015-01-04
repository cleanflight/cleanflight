#ifndef _NRF24L01P_H_
#define _NRF24L01P_H_
#include "stm32f10x.h"
//************************************************�����趨********************************************************
/*˵��
1����ӦCE CSN����
2����Ҫspi�е�spi_RW(u8 dat)����
3��ע���ʼ��
4������Ҫ�ж�
5�������������м����������ж��¼�

void nRF_checkEvent(void)
{
	u8 sta=nRF_writeCmd(NOP);
	if( sta & MAX_RT ) 	//�ﵽ����ط�����
	{
		nRF_clearFlag(STATUS,MAX_RT);
	}
	if( sta & TX_DS )		//�������
	{
		nRF_clearFlag(STATUS,TX_DS);
	}
	if( sta & RX_DR )		//���յ�����
	{
		nRF_clearFlag(STATUS,RX_DR);
	}
}
*/

#include "spi2.h"							//��Ҫspi.h�е�u8 spi_RW(u8 dat)����
#define NRF_CE_H()	GPIO_SetBits(GPIOC,GPIO_Pin_7);
#define NRF_CE_L()	GPIO_ResetBits(GPIOC,GPIO_Pin_7);
#define NRF_CSN_H()	GPIO_SetBits(GPIOC,GPIO_Pin_6);
#define NRF_CSN_L()	GPIO_ResetBits(GPIOC,GPIO_Pin_6);

#define RX_PLOAD_WIDTH  32
#define TX_PLOAD_WIDTH  32
#define TX_ADR_WIDTH    5
#define RX_ADR_WIDTH    5
#define NRF_ADDR_RX 		0xE1,0xE2,0xE3,0xE4,0xE5
#define NRF_ADDR_TX 		0xE1,0xE2,0xE3,0xE4,0xE5
//****************************************************************************************************************

//�豸�ڲ�ָ��ͼĴ����Ķ���
//**********************************************�Ĵ���ָ��********************************************************
#define NRF_READ_REG    		0x00  // ���Ĵ���
#define NRF_WRITE_REG   		0x20 	// д�Ĵ���
#define RD_RX_PLOAD     		0x61  // ��ȡ��������
#define WR_TX_PLOAD     		0xA0  // д��������
#define FLUSH_TX        		0xE1 	// ���TX����(����TXģʽ)
#define FLUSH_RX        		0xE2  // ���RX����(����RXģʽ)
#define REUSE_TX_PL     		0xE3  // �����ظ�װ������ָ�� (TX)
#define NOP             		0xFF  // �޲���
//���ʹ��һ������ָ���������FEATURE�Ĵ���
#define R_RX_PL_WID   			0x60	// ��ȡ�������ݳ���
#define W_ACK_PAYLOAD				0xA8	// ACK��������������
#define W_TX_PAYLOAD_NOACK	0xB0 	// ָ�������ݰ����Զ�ACK

//**********************************************�Ĵ�����ַ********************************************************
#define CONFIG          0x00  // �����շ�״̬��CRCУ��ģʽ�Լ��շ�״̬��Ӧ��ʽ
#define EN_AA           0x01  // �Զ�Ӧ��������
#define EN_RXADDR       0x02  // �����ŵ�����
#define SETUP_AW        0x03  // �շ���ַ�������
#define SETUP_RETR      0x04  // �Զ��ط���������
#define RF_CH           0x05  // ����Ƶ������
#define RF_SETUP        0x06  // �������ʡ����Ĺ�������
#define STATUS    			0x07  // ״̬�Ĵ���
#define OBSERVE_TX      0x08  // ���ͼ�⹦��
#define RPD             0x09 	// ��������̽��           
#define RX_ADDR_P0      0x0A  // Ƶ��0�������ݵ�ַ
#define RX_ADDR_P1      0x0B  // Ƶ��1�������ݵ�ַ
#define RX_ADDR_P2      0x0C  // Ƶ��2�������ݵ�ַ
#define RX_ADDR_P3      0x0D  // Ƶ��3�������ݵ�ַ
#define RX_ADDR_P4      0x0E  // Ƶ��4�������ݵ�ַ
#define RX_ADDR_P5      0x0F  // Ƶ��5�������ݵ�ַ
#define TX_ADDR         0x10  // ���͵�ַ�Ĵ���
#define RX_PW_P0        0x11  // ����Ƶ��0�������ݳ���
#define RX_PW_P1        0x12  // ����Ƶ��1�������ݳ���
#define RX_PW_P2        0x13  // ����Ƶ��2�������ݳ���
#define RX_PW_P3        0x14  // ����Ƶ��3�������ݳ���
#define RX_PW_P4        0x15  // ����Ƶ��4�������ݳ���
#define RX_PW_P5        0x16  // ����Ƶ��5�������ݳ���
#define FIFO_STATUS     0x17  // FIFO״̬�Ĵ���
#define DYNPD						0x1C	// ����̬��Ч���ݳ���
#define FEATURE					0x1D	// �����Ĵ���

//**********************************************�Ĵ�����־λ******************************************************
//STATUS
#define RX_DR				0x40		//RX Data Ready
#define TX_DS				0x20		//TX Data Sent
#define MAX_RT			0x10		//MAX number of TX retransmits interrupt

//************************************************ģʽѡ��********************************************************
#define MODEL_RX				1			//��ͨ����
#define MODEL_TX				2			//��ͨ����
#define MODEL_RX2				3			//����ģʽ2,����˫����
#define MODEL_TX2				4			//����ģʽ2,����˫����

//***********************************************ȫ�ֱ�������*****************************************************
extern 	u8 	NRF24L01_RXDATA[RX_PLOAD_WIDTH];		//nrf24l01���յ�������
extern 	u8 	NRF24L01_TXDATA[RX_PLOAD_WIDTH];		//nrf24l01�����͵�����

//*************************************************��������*******************************************************
void 	nRF_clearFlag(u8 reg,u8 flagBit);						//�����־λ
void 	nRF_init(u8 model, u8 ch);									//��ʼ��,chΪʹ�õ�ͨ����
u8 		nRF_check(void);														//�豸���
u8		nRF_readReg(u8 reg);												//���Ĵ���
u8 		nRF_writeReg(u8 reg, u8 value);							//д�Ĵ���
u8 		nRF_writeCmd(u8 cmd);												//дָ��
u8 		nRF_readBuf(u8 reg, u8 *pBuf, u8 uchars);		//��������
void 	nRF_TxPacket(u8 * tx_buf, u8 len);					//�������ݰ�
void 	nRF_TxPacket_AP(u8 * tx_buf, u8 len);				//��������(MODEL_RX2)
#endif
