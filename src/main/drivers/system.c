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

#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

//#include <platform.h>

//#include "build/build_config.h"

//#include "dma.h"
//#include "gpio.h"
//#include "light_led.h"
//#include "sound_beeper.h"
//#include "nvic.h"
//#include "serial.h"

#include "serial_uart.h"
#include "timer_setup.h"

//#include "system.h"

// cycles per microsecond
static uint32_t usTicks = 0;            //Used to calculate time elapsed in microseconds
// current uptime for 1kHz systick timer. will rollover after 49 days. hopefully we won't care.
static volatile uint32_t sysTickUptime = 0;
// cached value of RCC->CSR
//uint32_t cachedRccCsrValue;


// SysTick
//Setup timer to go off every millisecond with this as the handler. Use this to then measure system up time
void SysTick_Handler(void)
{
    sysTickUptime++;
}

uint32_t micros(void)
{
    return sysTickUptime*1000;   
}


uint32_t millis(void)
{
    return sysTickUptime;
}

void print(void)                        //for testing. uncomment the line in systick_setup to enable this function
{
    printf("%d\n",millis());
}

void Systick_setup(void)
{
    start_timer(SysTick_Handler, 1000, 1);
    //start_timer(print, 1, 1);
}


void systemInit(void)               //Only needed to initialize uart?
{
/*#ifdef CC3D               //Not needed for edison
    //Accounts for OP Bootloader, set the Vector Table base address as specified in .ld file
    extern void *isr_vector_table_base;

    NVIC_SetVectorTable((uint32_t)&isr_vector_table_base, 0x0);             //Not needed. Necessary interrupts are initialized when writing code for the peripherals

#endif
*/
    // Configure NVIC preempt/priority groups
    //NVIC_PriorityGroupConfig(NVIC_PRIORITY_GROUPING);                       //Priority handled by the mraa library.

/*#ifdef STM32F10X                                                            //Not necessary.
    // Turn on clocks for stuff we use
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);
#endif
*/
    // cache RCC->CSR value to use it in isMPUSoftreset() and others
    /*cachedRccCsrValue = RCC->CSR;                         //Gets the cached value of register. Unnecessary.
    RCC_ClearFlag();
    */
    //enableGPIOPowerUsageAndNoiseReductions();             //Not necessary for now

    //usartInitAllIOSignals();                                //Replace with code for initializing uart
    Systick_setup();

/*
#ifdef STM32F10X
    // Turn off JTAG port 'cause we're using the GPIO for leds
#define AFIO_MAPR_SWJ_CFG_NO_JTAG_SW            (0x2 << 24)
    AFIO->MAPR |= AFIO_MAPR_SWJ_CFG_NO_JTAG_SW;
#endif
*/                                                           //No JTAG port on the edison
    // Init cycle counter
    //cycleCounterInit();                                    //Calculates cycles per Microsecond. Unecessary

    // SysTick
    //SysTick_Config(SystemCoreClock / 1000);             //Systick generates interrupts at a regular interval. OS is gonna do this anyway. Not needed
}



/*
static void cycleCounterInit(void)
{
    RCC_ClocksTypeDef clocks;
    RCC_GetClocksFreq(&clocks);
    usTicks = clocks.SYSCLK_Frequency / 1000000;
}
*/

/*
// Return system uptime in microseconds (rollover in 70minutes)
uint32_t micros(void)
{
    register uint32_t ms, cycle_cnt;
    do {
        ms = sysTickUptime;
        cycle_cnt = SysTick->VAL;

        
         // If the SysTick timer expired during the previous instruction, we need to give it a little time for that
         // interrupt to be delivered before we can recheck sysTickUptime:
         
        asm volatile("\tnop\n");
    } while (ms != sysTickUptime);
    return (ms * 1000) + (usTicks * 1000 - cycle_cnt) / usTicks;
}
*/

// Return system uptime in milliseconds (rollover in 49 days)

/*
#if 1
void delayMicroseconds(uint32_t us)
{
    uint32_t now = micros();
    while (micros() - now < us);
}
#else
void delayMicroseconds(uint32_t us)
{
    uint32_t elapsed = 0;
    uint32_t lastCount = SysTick->VAL;

    for (;;) {
        register uint32_t current_count = SysTick->VAL;
        uint32_t elapsed_us;

        // measure the time elapsed since the last time we checked
        elapsed += current_count - lastCount;
        lastCount = current_count;

        // convert to microseconds
        elapsed_us = elapsed / usTicks;
        if (elapsed_us >= us)
            break;

        // reduce the delay by the elapsed time
        us -= elapsed_us;

        // keep fractional microseconds for the next iteration
        elapsed %= usTicks;
    }
}
#endif

void delay(uint32_t ms)
{
    while (ms--)
        delayMicroseconds(1000);
}

#define SHORT_FLASH_DURATION 50
#define CODE_FLASH_DURATION 250

void failureMode(failureMode_e mode)
{
    int codeRepeatsRemaining = 10;
    int codeFlashesRemaining;
    int shortFlashesRemaining;

    while (codeRepeatsRemaining--) {
        LED1_ON;
        LED0_OFF;
        shortFlashesRemaining = 5;
        codeFlashesRemaining = mode + 1;
        uint8_t flashDuration = SHORT_FLASH_DURATION;

        while (shortFlashesRemaining || codeFlashesRemaining) {
            LED1_TOGGLE;
            LED0_TOGGLE;
            BEEP_ON;
            delay(flashDuration);

            LED1_TOGGLE;
            LED0_TOGGLE;
            BEEP_OFF;
            delay(flashDuration);

            if (shortFlashesRemaining) {
                shortFlashesRemaining--;
                if (shortFlashesRemaining == 0) {
                    delay(500);
                    flashDuration = CODE_FLASH_DURATION;
                }
            } else {
                codeFlashesRemaining--;
            }
        }
        delay(1000);
    }

#ifdef DEBUG
    systemReset();
#else
    systemResetToBootloader();
#endif
}
*/