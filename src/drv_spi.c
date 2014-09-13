/*
 * This file is part of baseflight
 * Licensed under GPL V3 or modified DCL - see https://github.com/multiwii/baseflight/blob/master/README.md
 */

#include "board.h"

// SPI2 Driver
// PB15     28      SPI2_MOSI
// PB14     27      SPI2_MISO
// PB13     26      SPI2_SCK
// PB12     25      SPI2_NSS

static int spiDetect(void);

#define FLASH_M25P16    (0x202015)

int spiInit(void)
{
    gpio_config_t gpio;
    SPI_InitTypeDef spi;

    // Enable SPI2 clock
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2, ENABLE);

    // MOSI + SCK as output
    gpio.mode = Mode_AF_PP;
    gpio.pin = Pin_13 | Pin_15;
    gpio.speed = Speed_50MHz;
    gpioInit(GPIOB, &gpio);
    // MISO as input
    gpio.pin = Pin_14;
    gpio.mode = Mode_IN_FLOATING;
    gpioInit(GPIOB, &gpio);
    // NSS as gpio slave select
    gpio.pin = Pin_12;
    gpio.mode = Mode_Out_PP;
    gpioInit(GPIOB, &gpio);

    // Init SPI2 hardware
    SPI_I2S_DeInit(SPI2);
    spi.SPI_Mode = SPI_Mode_Master;
    spi.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
    spi.SPI_DataSize = SPI_DataSize_8b;
    spi.SPI_NSS = SPI_NSS_Soft;
    spi.SPI_FirstBit = SPI_FirstBit_MSB;
    spi.SPI_CRCPolynomial = 7;
    spi.SPI_CPOL = SPI_CPOL_High;
    spi.SPI_CPHA = SPI_CPHA_2Edge;
    spi.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_8;
    SPI_Init(SPI2, &spi);
    SPI_Cmd(SPI2, ENABLE);

    return spiDetect();
}

void spiSelect(bool select)
{
    if (select) {
        digitalLo(GPIOB, Pin_12);
    } else {
        digitalHi(GPIOB, Pin_12);
    }
}

uint8_t spiTransferByte(uint8_t in)
{
    uint8_t rx;
    SPI2->DR;
    SPI2->DR = in;
    while (!(SPI2->SR & SPI_I2S_FLAG_RXNE));
    rx = SPI2->DR;
    while (!(SPI2->SR & SPI_I2S_FLAG_TXE));
    while (SPI2->SR & SPI_I2S_FLAG_BSY);
    return rx;
}

bool spiTransfer(uint8_t *out, uint8_t *in, int len)
{
    uint8_t b;
    SPI2->DR;
    while (len--) {
        b = in ? *(in++) : 0xFF;
        while (SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_TXE) == RESET);
        SPI_I2S_SendData(SPI2, b);
        while (SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_RXNE) == RESET);
        b = SPI_I2S_ReceiveData(SPI2);
        if (out)
            *(out++) = b;
    }

    return true;
}

static int spiDetect(void)
{
    uint8_t out[] = { 0x9F, 0, 0, 0 };
    uint8_t in[4];
    uint32_t flash_id;

    // try autodetect flash chip
    spiSelect(true);
    spiTransfer(in, out, sizeof(out));
    spiSelect(false);
    flash_id = in[1] << 16 | in[2] << 8 | in[3];
    if (flash_id == FLASH_M25P16)
        return SPI_DEVICE_FLASH;

    // try autodetect MPU
    delay(50);
    spiSelect(true);
    spiTransferByte(0x75 | 0x80);
    in[0] = spiTransferByte(0xff);
    spiSelect(false);
    if (in[0] == 0x70)
        return SPI_DEVICE_MPU;

    return SPI_DEVICE_NONE;
}
