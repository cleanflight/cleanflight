#pragma once

#define SPI_DEVICE_NONE     (0)
#define SPI_DEVICE_FLASH    (1)
#define SPI_DEVICE_MPU      (2)

int spiInit(void);
void spiSelect(bool select);
uint8_t spiTransferByte(uint8_t in);
bool spiTransfer(uint8_t *out, uint8_t *in, int len);
