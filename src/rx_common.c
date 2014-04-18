#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include <string.h>

#include "platform.h"

#include "rx_common.h"
#include "config.h"

#include "drivers/pwm_common.h"

const char rcChannelLetters[] = DEFAULT_RCMAP;

int16_t lookupPitchRollRC[PITCH_LOOKUP_LENGTH];     // lookup table for expo & RC rate PITCH+ROLL
int16_t lookupThrottleRC[THROTTLE_LOOKUP_LENGTH];   // lookup table for expo & mid THROTTLE
int16_t rcData[RC_CHANS];       // interval [1000;2000]

rcReadRawDataPtr rcReadRawFunc = NULL;  // receive data from default (pwm/ppm) or additional (spek/sbus/?? receiver drivers)

uint16_t pwmReadRawRC(rxConfig_t *rxConfig, uint8_t chan)
{
    uint16_t data;

    data = pwmRead(rxConfig->rcmap[chan]);
    if (data < 750 || data > 2250)
        data = rxConfig->midrc;

    return data;
}

void computeRC(rxConfig_t *rxConfig)
{
    uint8_t chan;

    if (feature(FEATURE_SERIALRX)) {
        for (chan = 0; chan < 8; chan++)
            rcData[chan] = rcReadRawFunc(rxConfig, chan);
    } else {
        static int16_t rcData4Values[8][4], rcDataMean[8];
        static uint8_t rc4ValuesIndex = 0;
        uint8_t a;

        rc4ValuesIndex++;
        for (chan = 0; chan < 8; chan++) {
            rcData4Values[chan][rc4ValuesIndex % 4] = rcReadRawFunc(rxConfig, chan);
            rcDataMean[chan] = 0;
            for (a = 0; a < 4; a++)
                rcDataMean[chan] += rcData4Values[chan][a];

            rcDataMean[chan] = (rcDataMean[chan] + 2) / 4;
            if (rcDataMean[chan] < rcData[chan] - 3)
                rcData[chan] = rcDataMean[chan] + 2;
            if (rcDataMean[chan] > rcData[chan] + 3)
                rcData[chan] = rcDataMean[chan] - 2;
        }
    }
}

void generatePitchCurve(controlRateConfig_t *controlRateConfig)
{
    uint8_t i;

    for (i = 0; i < PITCH_LOOKUP_LENGTH; i++)
        lookupPitchRollRC[i] = (2500 + controlRateConfig->rcExpo8 * (i * i - 25)) * i * (int32_t) controlRateConfig->rcRate8 / 2500;
}

void generateThrottleCurve(controlRateConfig_t *controlRateConfig, uint16_t minThrottle, uint16_t maxThrottle)
{
    uint8_t i;

    for (i = 0; i < THROTTLE_LOOKUP_LENGTH; i++) {
        int16_t tmp = 10 * i - controlRateConfig->thrMid8;
        uint8_t y = 1;
        if (tmp > 0)
            y = 100 - controlRateConfig->thrMid8;
        if (tmp < 0)
            y = controlRateConfig->thrMid8;
        lookupThrottleRC[i] = 10 * controlRateConfig->thrMid8 + tmp * (100 - controlRateConfig->thrExpo8 + (int32_t) controlRateConfig->thrExpo8 * (tmp * tmp) / (y * y)) / 10;
        lookupThrottleRC[i] = minThrottle + (int32_t) (maxThrottle - minThrottle) * lookupThrottleRC[i] / 1000; // [MINTHROTTLE;MAXTHROTTLE]
    }
}

void parseRcChannels(const char *input, rxConfig_t *rxConfig)
{
    const char *c, *s;

    for (c = input; *c; c++) {
        s = strchr(DEFAULT_RCMAP, *c);
        if (s)
            rxConfig->rcmap[s - rcChannelLetters] = c - input;
    }
}

