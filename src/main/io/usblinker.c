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

// Copy-pasted from simonk
// All transmissions have a leader of 23 1-bits followed by 1 0-bit.
// Bit encoding starts at the least significant bit and is 8 bits wide.
// 1-bits are encoded as 64.0us high, 72.8us low (135.8us total).
// 0-bits are encoded as 27.8us high, 34.5us low, 34.4us high, 37.9 low
// (134.6us total)
// End of encoding adds 34.0us high, then return to input mode.
// The last 0-bit low time is 32.6us instead of 37.9us, for some reason.

#include <stdbool.h>
#include <stdint.h>
#include <string.h>

#include "platform.h"

#include "drivers/system.h"
#include "drivers/gpio.h"
#include "drivers/light_led.h"
#include "drivers/serial.h"
#include "io/serial.h"

#define BIT_DELAY_HALF 34
#define BIT_DELAY 68

volatile uint8_t serialBuffer[255];

void gpio_config_out(void)
{
    gpio_config_t cfg;

    cfg.mode = Mode_Out_PP;
    cfg.pin = GPIO_Pin_8;
    cfg.speed = Speed_2MHz;

    gpioInit(GPIOA, &cfg);
}

void gpio_config_in(void)
{
    gpio_config_t cfg;

    cfg.mode = Mode_IPU;
    cfg.pin = GPIO_Pin_8;
    cfg.speed = Speed_2MHz;

    gpioInit(GPIOA, &cfg);
}

void sendDigital1()
{
    digitalHi(GPIOA, GPIO_Pin_8);
    delayMicroseconds(BIT_DELAY);
    digitalLo(GPIOA, GPIO_Pin_8);
    delayMicroseconds(BIT_DELAY);
}

void sendDigital0()
{
    digitalHi(GPIOA, GPIO_Pin_8);
    delayMicroseconds(BIT_DELAY_HALF);
    digitalLo(GPIOA, GPIO_Pin_8);
    delayMicroseconds(BIT_DELAY_HALF);
    digitalHi(GPIOA, GPIO_Pin_8);
    delayMicroseconds(BIT_DELAY_HALF);
    digitalLo(GPIOA, GPIO_Pin_8);
    delayMicroseconds(BIT_DELAY_HALF);
}

void sendByte(uint8_t byte)
{
    for(uint8_t i = 0; i < 8; i++)
    {
        if(byte & (1 << i))
        {
            sendDigital1();
        } else {
            sendDigital0();
        }
    }
}

void sendBuf(uint8_t txlen)
{
    gpio_config_out();

    // send intro message
    for(uint8_t i = 0; i < 23; i++)
    {
        sendDigital1();
    }
    sendDigital0();

    for(uint8_t i = 0; i < txlen; i++)
    {
        sendByte(serialBuffer[i]);
    }

    // send trailing message
    digitalHi(GPIOA, GPIO_Pin_8);
    delayMicroseconds(BIT_DELAY_HALF);

    gpio_config_in();
}

int8_t readBit(uint32_t bitPeriod)
{
    uint32_t startTime = micros();
    while(digitalIn(GPIOA, GPIO_Pin_8)) // wait to go low
        if (micros() > startTime + 250)
            return -1;
    while(!digitalIn(GPIOA, GPIO_Pin_8)) // wait to go high
        if (micros() > startTime + 250)
            return -1;
    uint32_t endTime = micros();

    if((endTime - startTime) < (bitPeriod / 1.5)) // short pulses
    {
        while(digitalIn(GPIOA, GPIO_Pin_8)) // wait for second half of bit
            if (micros() > startTime + 250)
                return -1;
        while(!digitalIn(GPIOA, GPIO_Pin_8))
            if (micros() > startTime + 250)
                return -1;
        return 0;
    }
    return 1;
}

void USBLinker(void)
{
    // just use motor pin 1 = PWM9 TIM1_CH1 PA8 for now

    // take control
    LED0_OFF;
#ifdef LED1
    LED1_OFF;
#endif
    gpio_config_in();

    // TODO open serial port
    // serialInit(9600);
    serialPort_t *serialPort = NULL;

    uint16_t lastPin = 0;

    while(1)
    {
        if (serialTotalBytesWaiting(serialPort))
        {
            LED1_ON;
            uint16_t rxlen = 0;
            while(serialTotalBytesWaiting(serialPort))
            {
                serialBuffer[rxlen++] = serialRead(serialPort);
                delay(2);

                if (rxlen == 255)
                {
                    while(serialTotalBytesWaiting(serialPort))
                        serialRead(serialPort);
                    break;
                }
            }
#ifdef LED1
            LED1_OFF;
#endif
            sendBuf(rxlen);
            lastPin = 1;
        } else {
            // read from pin
            uint16_t curPin = digitalIn(GPIOA, GPIO_Pin_8);

            if ((lastPin == 0) && (curPin != 0)) // pin went high from low
            {
                LED0_ON;
                // get sync time from header
                volatile uint32_t startTime, endTime, bitPeriod;

                startTime = micros();

                // get starting time at next low-high transition
                while(digitalIn(GPIOA, GPIO_Pin_8)) // wait to go low
                    if (micros() > startTime + 250)
                                break;
                while(!digitalIn(GPIOA, GPIO_Pin_8)) // wait to go high
                    if (micros() > startTime + 250)
                                break;
                startTime = micros();

                // get ending time at next low-high transition
                while(digitalIn(GPIOA, GPIO_Pin_8)) // wait to go low
                    if (micros() > startTime + 250)
                                break;
                while(!digitalIn(GPIOA, GPIO_Pin_8)) // wait to go high
                    if (micros() > startTime + 250)
                                break;
                endTime = micros();

                bitPeriod = endTime - startTime; // doesn't include overflow case

                uint8_t introCount = 0;
                while(readBit(bitPeriod) == 1) // exit on last intro bit, which is 0
                {
                    introCount++;
                }
                if (introCount > 10) // decent threshold
                {
                    uint8_t rxlen = 0;
                    int8_t tmp;
                    uint8_t timeout = 0;
                    while(timeout == 0)
                    {
                        for (int8_t i = 0; i < 8; i++)
                        {
                            if (i == 0)
                                serialBuffer[rxlen] = 0; // reset byte for bitwise operations
                            tmp = readBit(bitPeriod);
                            if (tmp == -1) // timeout reached
                            {
                                timeout = 1;
                                break;
                            } else {
                                serialBuffer[rxlen] |=  (tmp << i); // LSB first
                                if (i == 7)
                                    rxlen++;
                            }
                        }
                    }

                    for (uint8_t i; i < rxlen; i++)
                    {
                        serialWrite(serialPort, serialBuffer[i]);
                    }
                }
                LED0_OFF;
            }
            lastPin = curPin;
        }
    }
}
