/*
 * This file is part of Cleanflight.
 *
 * Cleanflight is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Cleanflight is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Cleanflight.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <stdbool.h>
#include <stdint.h>

#include <platform.h>

#include "build_config.h"

#include "gpio.h"

#include "bus_spi_soft.h"

#ifdef USE_SOFT_SPI

void softSpiInit(SoftSPIDevice *dev)
{
    GPIO_InitTypeDef PORT;
    PORT.GPIO_Speed = GPIO_Speed_50MHz;

    PORT.GPIO_Pin = dev->csn_pin;
    PORT.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(dev->csn_port, &PORT);

    PORT.GPIO_Pin = dev->sck_pin;
    PORT.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(dev->sck_port, &PORT);

    PORT.GPIO_Pin = dev->miso_pin;
    PORT.GPIO_Mode = GPIO_Mode_IN_FLOATING;
    GPIO_Init(dev->miso_port, &PORT);

    PORT.GPIO_Pin = dev->mosi_pin;
    PORT.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(dev->mosi_port, &PORT);
}


uint8_t softSpiTransferByte(SoftSPIDevice *dev, uint8_t byte)
{
    for(int i = 0; i < 8; i++) {

        if(byte & 0x80)
        {
            GPIO_SetBits(dev->mosi_port, dev->mosi_pin);
        }
        else
        {
            GPIO_ResetBits(dev->mosi_port, dev->mosi_pin);
        }

        GPIO_SetBits(dev->sck_port, dev->sck_pin);        
        byte <<= 1;

        if(GPIO_ReadInputDataBit(dev->miso_port, dev->miso_pin) == 1)
        {
            byte |= 1;
        }

        GPIO_ResetBits(dev->sck_port, dev->sck_pin);
    }

    return byte;
}

#endif // USE_SOFT_SPI
