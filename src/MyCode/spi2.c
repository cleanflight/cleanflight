#include "spi2.h"

void spi2_GPIOInit(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO,  ENABLE);
	
	/*配置 SPI_NRF_SPI的 SCK,MISO,MOSI引脚，GPIOA^5,GPIOA^6,GPIOA^7 */ 
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13|GPIO_Pin_14|GPIO_Pin_15; 
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP; //复用功能 
	GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6|GPIO_Pin_7; 	//CSN  CE
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz; 
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 
	GPIO_Init(GPIOC, &GPIO_InitStructure);
	
	GPIO_SetBits(GPIOC,GPIO_Pin_6);
}

void spi2_modeInit(void)
{
	SPI_InitTypeDef SPI_InitStructure; 
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2, ENABLE);
	
	SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex; 	//双线全双工 
	SPI_InitStructure.SPI_Mode = SPI_Mode_Master; 											//主模式 
	SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b; 									//数据大小8位 
	SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low; 													//时钟极性，空闲时为低 
	SPI_InitStructure.SPI_CPHA = SPI_CPHA_1Edge; 												//第1个边沿有效，上升沿为采样时刻 
	SPI_InitStructure.SPI_NSS = SPI_NSS_Soft; 													//NSS信号由软件产生 
	SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_8; 	//8分频，9MHz 
	SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB; 									//高位在前 
	SPI_InitStructure.SPI_CRCPolynomial = 7; 
	SPI_Init(SPI2, &SPI_InitStructure); 
}

void spi2_init(void)
{
	spi2_GPIOInit();
	spi2_modeInit();
	SPI_Cmd(SPI2, ENABLE);
}

u8 spi_RW(u8 dat) 
{
	while( (SPI2->SR & SPI_I2S_FLAG_TXE )	== 0);
	SPI2->DR = dat; 
	while( (SPI2->SR & SPI_I2S_FLAG_RXNE) == 0);  
	return SPI2->DR;
/*原始库文件代码
	while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_TXE) == RESET); 	//当 SPI发送缓冲器非空时等待
	SPI_I2S_SendData(SPI1, dat); 																			//通过 SPI2发送一字节数据
	while (SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_RXNE) == RESET); 	//当SPI接收缓冲器为空时等待
	return SPI_I2S_ReceiveData(SPI1);																	//Return the byte read from the SPI bus
	*/
}
