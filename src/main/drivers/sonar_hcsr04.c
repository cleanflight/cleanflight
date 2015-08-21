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

#include "platform.h"

#include "system.h"
#include "gpio.h"
#include "nvic.h"
#include "sonar_hcsr04.h"

#ifdef SONAR

/* HC-SR04 consists of ultrasonic transmitter, receiver, and control circuits.
 * When trigged it sends out a series of 40KHz ultrasonic pulses and receives
 * echo froman object. The distance between the unit and the object is calculated
 * by measuring the traveling time of sound and output it as the width of a TTL pulse.
 *
 * *** Warning: HC-SR04 operates at +5V ***
 *
 */
/* Lidar Lite V2 is a laser range measurement using flight time
 * when enabled (trigger low) it run continuously until disabled.
 * The distance between the unit and the object is calculated
 * by measuring the traveling time of light and output it as the width of a TTL pulse
 * of 10µs per centimeter.
 * *** Warning: Lidar Lite V2  operates at +5V (4.5v to 6v)***
 */

static uint32_t lastMeasurementAt;
static volatile int32_t measurement = -1;
static sonarHardware_t const *sonarHardware;
static bool SonarIsLidarLite = false;

static void ECHO_EXTI_IRQHandler(void)
{
    static uint32_t timing_start;
    static uint32_t previous_measurement=0;
    uint32_t timing_stop;
    uint32_t diff_timing;

    if (digitalIn(GPIOB, sonarHardware->echo_pin) != 0) {
        timing_start = micros();
    } else {
        timing_stop = micros();
        if (timing_stop > timing_start) {
            measurement = timing_stop - timing_start;

            // there are some spurious values arriving but always almost
            // 1ms over or under (don't know why at the moment)
            // we detect them and remove the suspect ones
            if(SonarIsLidarLite == true) {
                // calculate difference
                if(measurement>previous_measurement ) {
                    diff_timing = measurement - previous_measurement;
                } else {
                    diff_timing = previous_measurement - measurement;
                }
                // remove it if in the filter
                if(diff_timing>900 && diff_timing<1100) {
                    measurement = previous_measurement;
                } else {
                    previous_measurement = measurement;
                }
            }
        }
    }

    EXTI_ClearITPendingBit(sonarHardware->exti_line);
}

void EXTI0_IRQHandler(void)
{
    ECHO_EXTI_IRQHandler();
}

void EXTI1_IRQHandler(void)
{
    ECHO_EXTI_IRQHandler();
}

void EXTI9_5_IRQHandler(void)
{
    ECHO_EXTI_IRQHandler();
}

void hcsr04_init(const sonarHardware_t *initialSonarHardware)
{
    gpio_config_t gpio;
    EXTI_InitTypeDef EXTIInit;

    sonarHardware = initialSonarHardware;

#ifdef STM32F10X
    // enable AFIO for EXTI support
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);
#endif

#ifdef STM32F303xC
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB, ENABLE);

    /* Enable SYSCFG clock otherwise the EXTI irq handlers are not called */
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
#endif

    // trigger pin
    gpio.pin = sonarHardware->trigger_pin;
    gpio.mode = Mode_Out_PP;
    gpio.speed = Speed_2MHz;
    gpioInit(GPIOB, &gpio);

    // echo pin
    gpio.pin = sonarHardware->echo_pin;
    gpio.mode = Mode_IN_FLOATING;
    gpioInit(GPIOB, &gpio);

#ifdef STM32F10X
    // setup external interrupt on echo pin
    gpioExtiLineConfig(GPIO_PortSourceGPIOB, sonarHardware->exti_pin_source);
#endif

#ifdef STM32F303xC
    gpioExtiLineConfig(EXTI_PortSourceGPIOB, sonarHardware->exti_pin_source);
#endif

    EXTI_ClearITPendingBit(sonarHardware->exti_line);

    EXTIInit.EXTI_Line = sonarHardware->exti_line;
    EXTIInit.EXTI_Mode = EXTI_Mode_Interrupt;
    EXTIInit.EXTI_Trigger = EXTI_Trigger_Rising_Falling;
    EXTIInit.EXTI_LineCmd = ENABLE;
    EXTI_Init(&EXTIInit);

    NVIC_InitTypeDef NVIC_InitStructure;

    NVIC_InitStructure.NVIC_IRQChannel = sonarHardware->exti_irqn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = NVIC_PRIORITY_BASE(NVIC_PRIO_SONAR_ECHO);
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = NVIC_PRIORITY_SUB(NVIC_PRIO_SONAR_ECHO);
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);

    // Lidar Lite Detection
    digitalLo(GPIOB, sonarHardware->trigger_pin);    // ensure that HCsr04 stopped or LIDAR running
    delay(10);  // case of spurious on hcsr04 (seen on the scope)
    measurement = -1;
    delay(100); // wait for 100 milliseconds (may be as low as 50ms)

    if(measurement>-1) {
        SonarIsLidarLite = true;
    }

    lastMeasurementAt = millis() - 60; // force 1st measurement in hcsr04_start_reading
}

// measurement reading is done asynchronously, using interrupt
void hcsr04_start_reading(void)
{
    //if(SonarIsLidarLite == true) return; // not used for Lidar

    uint32_t now = millis();

    if (now < (lastMeasurementAt + 60)) {
        // the repeat interval of trig signal should be greater than 60ms
        // to avoid interference between connective measurements.
        return;
    }

    lastMeasurementAt = now;

    // start HCRS04
    digitalHi(GPIOB, sonarHardware->trigger_pin);
    //  The width of trig signal must be greater than 10us
    delayMicroseconds(11);
    digitalLo(GPIOB, sonarHardware->trigger_pin);
}

/**
 * Get the distance that was measured by the last pulse, in centimeters. When the ground is too far away to be
 * reliably read by the sonar, -1 is returned instead.
 */
int32_t hcsr04_get_distance(void)
{
    int32_t distance;

    if(SonarIsLidarLite == false) {
        // HCRS04 side
        // The speed of sound is 340 m/s or approx. 29 microseconds per centimeter.
        // The ping travels out and back, so to find the distance of the
        // object we take half of the distance traveled.
        //
        // 340 m/s = 0.034 cm/microsecond = 29.41176471 *2 = 58.82352941 rounded to 59
        distance = measurement / 59;

        // this sonar range is up to 4meter , but 3meter is the safe working range (+tilted and roll)
        if (distance > 300)
            distance = -1;
    }
    else {
        // Lidar Lite side
        // conversion is 10µs per centimeter
        distance = measurement / 10;

        if (distance > 3000) // max is 40m, clamped to 30m for security
            distance = -1;
    }

    return distance;
}
#endif
