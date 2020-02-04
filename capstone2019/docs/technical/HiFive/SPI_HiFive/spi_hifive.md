# SPI

_Most of this info is in the soc manual so when I refer to page number, it references to the manual (fe310-g002-manual-v19p05.pdf)._

The board has 3 SPI instances (pg 10):

1. (SPI0) 1 is used for SPI flash - it uses quad MISO (master rx) + MOSI (master tx) lines to transmit data for faster memory access - SPI protocol is quad

2. (SPI1) 1 SPI has 1 MISO (master rx) + MOSI (master tx) lines - SPI protocol is single

3. (SPI2) 1 SPI has dual MISO (master rx) + MOSI (master tx) lines - SPI protocol is dual




For interfacing with external devices, we only have access to (SPI1). The address is 0x1002_4000 - 0x1002_4fff (4MB memory space) (pg 85).

## SPI1

**header pin 16 - GPIO_10 - SPI1_SS3**

**header pin 15 - GPIO_9 - SPI1_SS2**

**header pin 13 - GPIO_5 - SPI1_SCK**

**header pin 12 - GPIO_4 - SPI1_MISO**

**header pin 11 - GPIO_3 - SPI1_MOSI**

**header pin 10 - GPIO_2 - SPI1_SS0**



For programming exernal sensors to SPI, we need to know the following:

- **endianess of SPI**: SPI endianess is MSB (pg 90)
- **clock rate**: SPI clock rate is less than 100MHz (pg 84)
- **protocol**: SPI protocol is single
- **\# of bits per frame**: 8 bits per frame


Here's example code used to implement SPI:

	
	 https://github.com/sifive/riscv-zephyr/blob/hifive1-revb/drivers/spi/spi_sifive.h

	 https://github.com/sifive/riscv-zephyr/blob/hifive1-revb/drivers/spi/spi_sifive.c
	
	
which looks like was originated from 

	
	https://github.com/sifive/freedom-metal/blob/master/src/drivers/sifive_spi0.c






