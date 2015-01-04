#ifndef _NRF24L01P_H_
#define _NRF24L01P_H_
#include "stm32f10x.h"
//************************************************参数设定********************************************************
/*说明
1、对应CE CSN引脚
2、需要spi中的spi_RW(u8 dat)函数
3、注意初始化
4、不需要中断
5、可在主函数中加入以下来判断事件

void nRF_checkEvent(void)
{
	u8 sta=nRF_writeCmd(NOP);
	if( sta & MAX_RT ) 	//达到最大重发次数
	{
		nRF_clearFlag(STATUS,MAX_RT);
	}
	if( sta & TX_DS )		//发送完成
	{
		nRF_clearFlag(STATUS,TX_DS);
	}
	if( sta & RX_DR )		//接收到数据
	{
		nRF_clearFlag(STATUS,RX_DR);
	}
}
*/

#include "spi2.h"							//需要spi.h中的u8 spi_RW(u8 dat)函数
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

//设备内部指令和寄存器的定义
//**********************************************寄存器指令********************************************************
#define NRF_READ_REG    		0x00  // 读寄存器
#define NRF_WRITE_REG   		0x20 	// 写寄存器
#define RD_RX_PLOAD     		0x61  // 读取接收数据
#define WR_TX_PLOAD     		0xA0  // 写待发数据
#define FLUSH_TX        		0xE1 	// 清除TX缓存(用于TX模式)
#define FLUSH_RX        		0xE2  // 清除RX缓存(用于RX模式)
#define REUSE_TX_PL     		0xE3  // 定义重复装载数据指令 (TX)
#define NOP             		0xFF  // 无操作
//如果使用一下三条指令必须设置FEATURE寄存器
#define R_RX_PL_WID   			0x60	// 读取接收数据长度
#define W_ACK_PAYLOAD				0xA8	// ACK包附带发送数据
#define W_TX_PAYLOAD_NOACK	0xB0 	// 指定的数据包不自动ACK

//**********************************************寄存器地址********************************************************
#define CONFIG          0x00  // 配置收发状态，CRC校验模式以及收发状态响应方式
#define EN_AA           0x01  // 自动应答功能设置
#define EN_RXADDR       0x02  // 可用信道设置
#define SETUP_AW        0x03  // 收发地址宽度设置
#define SETUP_RETR      0x04  // 自动重发功能设置
#define RF_CH           0x05  // 工作频率设置
#define RF_SETUP        0x06  // 发射速率、功耗功能设置
#define STATUS    			0x07  // 状态寄存器
#define OBSERVE_TX      0x08  // 发送监测功能
#define RPD             0x09 	// 接收能量探测           
#define RX_ADDR_P0      0x0A  // 频道0接收数据地址
#define RX_ADDR_P1      0x0B  // 频道1接收数据地址
#define RX_ADDR_P2      0x0C  // 频道2接收数据地址
#define RX_ADDR_P3      0x0D  // 频道3接收数据地址
#define RX_ADDR_P4      0x0E  // 频道4接收数据地址
#define RX_ADDR_P5      0x0F  // 频道5接收数据地址
#define TX_ADDR         0x10  // 发送地址寄存器
#define RX_PW_P0        0x11  // 接收频道0接收数据长度
#define RX_PW_P1        0x12  // 接收频道1接收数据长度
#define RX_PW_P2        0x13  // 接收频道2接收数据长度
#define RX_PW_P3        0x14  // 接收频道3接收数据长度
#define RX_PW_P4        0x15  // 接收频道4接收数据长度
#define RX_PW_P5        0x16  // 接收频道5接收数据长度
#define FIFO_STATUS     0x17  // FIFO状态寄存器
#define DYNPD						0x1C	// 允许动态有效数据长度
#define FEATURE					0x1D	// 特征寄存器

//**********************************************寄存器标志位******************************************************
//STATUS
#define RX_DR				0x40		//RX Data Ready
#define TX_DS				0x20		//TX Data Sent
#define MAX_RT			0x10		//MAX number of TX retransmits interrupt

//************************************************模式选择********************************************************
#define MODEL_RX				1			//普通接收
#define MODEL_TX				2			//普通发送
#define MODEL_RX2				3			//接收模式2,用于双向传输
#define MODEL_TX2				4			//发送模式2,用于双向传输

//***********************************************全局变量声明*****************************************************
extern 	u8 	NRF24L01_RXDATA[RX_PLOAD_WIDTH];		//nrf24l01接收到的数据
extern 	u8 	NRF24L01_TXDATA[RX_PLOAD_WIDTH];		//nrf24l01待发送的数据

//*************************************************函数声明*******************************************************
void 	nRF_clearFlag(u8 reg,u8 flagBit);						//清除标志位
void 	nRF_init(u8 model, u8 ch);									//初始化,ch为使用的通道号
u8 		nRF_check(void);														//设备检测
u8		nRF_readReg(u8 reg);												//读寄存器
u8 		nRF_writeReg(u8 reg, u8 value);							//写寄存器
u8 		nRF_writeCmd(u8 cmd);												//写指令
u8 		nRF_readBuf(u8 reg, u8 *pBuf, u8 uchars);		//读缓冲区
void 	nRF_TxPacket(u8 * tx_buf, u8 len);					//发送数据包
void 	nRF_TxPacket_AP(u8 * tx_buf, u8 len);				//被动发送(MODEL_RX2)
#endif
