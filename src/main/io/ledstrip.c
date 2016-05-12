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
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdarg.h>

#include <platform.h>

#include <build_config.h>

#ifdef LED_STRIP

#include <common/color.h>
#include <common/maths.h>
#include <common/typeconversion.h>
#include <common/printf.h>
#include <common/axis.h>
#include <common/utils.h>

#include "config/parameter_group.h"
#include "config/parameter_group_ids.h"

#include "drivers/light_ws2811strip.h"
#include "drivers/system.h"
#include "drivers/serial.h"

#include "flight/pid.h"
#include "flight/failsafe.h"

#include "io/rc_controls.h"
#include "io/gps.h"
#include "rx/rx.h"

#include "sensors/battery.h"
#include "sensors/sensors.h"

#include "io/ledstrip.h"

#include "config/runtime_config.h"
#include "config/config.h"
#include "config/feature.h"

PG_REGISTER_ARR_WITH_RESET_FN(ledConfig_t, MAX_LED_STRIP_LENGTH, ledConfigs, PG_LED_STRIP_CONFIG, 0);
PG_REGISTER_ARR_WITH_RESET_FN(hsvColor_t, CONFIGURABLE_COLOR_COUNT, colors, PG_COLOR_CONFIG, 0);
PG_REGISTER_ARR_WITH_RESET_FN(modeColorIndexes_t, MODE_COUNT, modeColors, PG_MODE_COLOR_CONFIG, 0);
PG_REGISTER_ARR_WITH_RESET_FN(specialColorIndexes_t, 1, specialColors, PG_SPECIAL_COLOR_CONFIG, 0);

static bool ledStripInitialised = false;
static bool ledStripEnabled = true;

static void ledStripDisable(void);

//#define USE_LED_ANIMATION
//#define USE_LED_RING_DEFAULT_CONFIG

// timers
#ifdef USE_LED_ANIMATION
static uint32_t nextAnimationUpdateAt = 0;
#endif

static uint32_t nextIndicatorFlashAt = 0;
static uint32_t nextBlinkFlashAt = 0;
static uint32_t nextWarningFlashAt = 0;
static uint32_t nextGpsFlashAt = 0;
static uint32_t nextRotationUpdateAt = 0;

#define LED_STRIP_20HZ ((1000 * 1000) / 20)
#define LED_STRIP_10HZ ((1000 * 1000) / 10)
#define LED_STRIP_5HZ ((1000 * 1000) / 5)

#if MAX_LED_STRIP_LENGTH > WS2811_LED_STRIP_LENGTH
#error "Led strip length must match driver"
#endif

//                          H    S    V
#define LED_BLACK        {  0,   0,   0}
#define LED_WHITE        {  0, 255, 255}
#define LED_RED          {  0,   0, 255}
#define LED_ORANGE       { 30,   0, 255}
#define LED_YELLOW       { 60,   0, 255}
#define LED_LIME_GREEN   { 90,   0, 255}
#define LED_GREEN        {120,   0, 255}
#define LED_MINT_GREEN   {150,   0, 255}
#define LED_CYAN         {180,   0, 255}
#define LED_LIGHT_BLUE   {210,   0, 255}
#define LED_BLUE         {240,   0, 255}
#define LED_DARK_VIOLET  {270,   0, 255}
#define LED_MAGENTA      {300,   0, 255}
#define LED_DEEP_PINK    {330,   0, 255}

const hsvColor_t hsv_black       = LED_BLACK;
const hsvColor_t hsv_white       = LED_WHITE;
const hsvColor_t hsv_red         = LED_RED;
const hsvColor_t hsv_orange      = LED_ORANGE;
const hsvColor_t hsv_yellow      = LED_YELLOW;
const hsvColor_t hsv_limeGreen   = LED_LIME_GREEN;
const hsvColor_t hsv_green       = LED_GREEN;
const hsvColor_t hsv_mintGreen   = LED_MINT_GREEN;
const hsvColor_t hsv_cyan        = LED_CYAN;
const hsvColor_t hsv_lightBlue   = LED_LIGHT_BLUE;
const hsvColor_t hsv_blue        = LED_BLUE;
const hsvColor_t hsv_darkViolet  = LED_DARK_VIOLET;
const hsvColor_t hsv_magenta     = LED_MAGENTA;
const hsvColor_t hsv_deepPink    = LED_DEEP_PINK;

#define LED_DIRECTION_COUNT 6

const hsvColor_t * const defaultColors[] = {
        &hsv_black,
        &hsv_white,
        &hsv_red,
        &hsv_orange,
        &hsv_yellow,
        &hsv_limeGreen,
        &hsv_green,
        &hsv_mintGreen,
        &hsv_cyan,
        &hsv_lightBlue,
        &hsv_blue,
        &hsv_darkViolet,
        &hsv_magenta,
        &hsv_deepPink
};

typedef enum {
    COLOR_BLACK = 0,
    COLOR_WHITE,
    COLOR_RED,
    COLOR_ORANGE,
    COLOR_YELLOW,
    COLOR_LIME_GREEN,
    COLOR_GREEN,
    COLOR_MINT_GREEN,
    COLOR_CYAN,
    COLOR_LIGHT_BLUE,
    COLOR_BLUE,
    COLOR_DARK_VIOLET,
    COLOR_MAGENTA,
    COLOR_DEEP_PINK,
} colorIds;

typedef enum {
    DIRECTION_NORTH = 0,
    DIRECTION_EAST,
    DIRECTION_SOUTH,
    DIRECTION_WEST,
    DIRECTION_UP,
    DIRECTION_DOWN
} directionId_e;

uint8_t ledGridWidth;
uint8_t ledGridHeight;
uint8_t ledCount;
uint8_t ledsInRingCount;

#ifdef USE_LED_RING_DEFAULT_CONFIG
const ledConfig_t defaultLedStripConfig[] = {
    { CALCULATE_LED_XY( 2,  2), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 2,  1), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 2,  0), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 1,  0), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 0,  0), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 0,  1), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 0,  2), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 1,  2), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 1,  1), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 1,  1), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 1,  1), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 1,  1), 3, LED_FUNCTION_THRUST_RING},
};
#else
const ledConfig_t defaultLedStripConfig[] = {
    { CALCULATE_LED_XY(15, 15), 0, LED_DIRECTION_SOUTH | LED_DIRECTION_EAST | LED_FUNCTION_INDICATOR | LED_FUNCTION_ARM_STATE },

    { CALCULATE_LED_XY(15,  8), 0, LED_DIRECTION_EAST | LED_FUNCTION_FLIGHT_MODE | LED_FUNCTION_WARNING },
    { CALCULATE_LED_XY(15,  7), 0, LED_DIRECTION_EAST | LED_FUNCTION_FLIGHT_MODE | LED_FUNCTION_WARNING },

    { CALCULATE_LED_XY(15,  0), 0, LED_DIRECTION_NORTH | LED_DIRECTION_EAST | LED_FUNCTION_INDICATOR | LED_FUNCTION_ARM_STATE },

    { CALCULATE_LED_XY( 8,  0), 0, LED_DIRECTION_NORTH | LED_FUNCTION_FLIGHT_MODE },
    { CALCULATE_LED_XY( 7,  0), 0, LED_DIRECTION_NORTH | LED_FUNCTION_FLIGHT_MODE },

    { CALCULATE_LED_XY( 0,  0), 0, LED_DIRECTION_NORTH | LED_DIRECTION_WEST | LED_FUNCTION_INDICATOR | LED_FUNCTION_ARM_STATE },

    { CALCULATE_LED_XY( 0,  7), 0, LED_DIRECTION_WEST | LED_FUNCTION_FLIGHT_MODE | LED_FUNCTION_WARNING },
    { CALCULATE_LED_XY( 0,  8), 0, LED_DIRECTION_WEST | LED_FUNCTION_FLIGHT_MODE | LED_FUNCTION_WARNING },

    { CALCULATE_LED_XY( 0, 15), 0, LED_DIRECTION_SOUTH | LED_DIRECTION_WEST | LED_FUNCTION_INDICATOR | LED_FUNCTION_ARM_STATE },

    { CALCULATE_LED_XY( 7, 15), 0, LED_DIRECTION_SOUTH | LED_FUNCTION_FLIGHT_MODE | LED_FUNCTION_WARNING },
    { CALCULATE_LED_XY( 8, 15), 0, LED_DIRECTION_SOUTH | LED_FUNCTION_FLIGHT_MODE | LED_FUNCTION_WARNING },

    { CALCULATE_LED_XY( 7,  7), 0, LED_DIRECTION_UP | LED_FUNCTION_FLIGHT_MODE | LED_FUNCTION_WARNING },
    { CALCULATE_LED_XY( 8,  7), 0, LED_DIRECTION_UP | LED_FUNCTION_FLIGHT_MODE | LED_FUNCTION_WARNING },
    { CALCULATE_LED_XY( 7,  8), 0, LED_DIRECTION_DOWN | LED_FUNCTION_FLIGHT_MODE | LED_FUNCTION_WARNING },
    { CALCULATE_LED_XY( 8,  8), 0, LED_DIRECTION_DOWN | LED_FUNCTION_FLIGHT_MODE | LED_FUNCTION_WARNING },

    { CALCULATE_LED_XY( 8,  9), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 9, 10), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY(10, 11), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY(10, 12), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 9, 13), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 8, 14), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 7, 14), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 6, 13), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 5, 12), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 5, 11), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 6, 10), 3, LED_FUNCTION_THRUST_RING},
    { CALCULATE_LED_XY( 7,  9), 3, LED_FUNCTION_THRUST_RING},

};
#endif

const modeColorIndexes_t defaultModeColors[] = {
    { COLOR_WHITE,      COLOR_DARK_VIOLET, COLOR_RED,       COLOR_DEEP_PINK, COLOR_BLUE, COLOR_ORANGE },
    { COLOR_LIME_GREEN, COLOR_DARK_VIOLET, COLOR_ORANGE,    COLOR_DEEP_PINK, COLOR_BLUE, COLOR_ORANGE },
    { COLOR_BLUE,       COLOR_DARK_VIOLET, COLOR_YELLOW,    COLOR_DEEP_PINK, COLOR_BLUE, COLOR_ORANGE },
    { COLOR_CYAN,       COLOR_DARK_VIOLET, COLOR_YELLOW,    COLOR_DEEP_PINK, COLOR_BLUE, COLOR_ORANGE },
    { COLOR_MINT_GREEN, COLOR_DARK_VIOLET, COLOR_ORANGE,    COLOR_DEEP_PINK, COLOR_BLUE, COLOR_ORANGE },
    { COLOR_LIGHT_BLUE, COLOR_DARK_VIOLET, COLOR_RED,       COLOR_DEEP_PINK, COLOR_BLUE, COLOR_ORANGE },
};

const specialColorIndexes_t defaultSpecialColors[] = {
    { COLOR_GREEN, COLOR_BLUE, COLOR_WHITE, COLOR_BLACK, COLOR_BLACK, COLOR_RED, COLOR_ORANGE, COLOR_GREEN }
};


void pgResetFn_ledConfigs(ledConfig_t *instance)
{
    memcpy(instance, &defaultLedStripConfig, sizeof(defaultLedStripConfig));
}

/*
 * 6 coords @nn,nn
 * 4 direction @##
 * 6 modes @####
 * = 16 bytes per led
 * 16 * 32 leds = 512 bytes storage needed worst case.
 * = not efficient to store led configs as strings in flash.
 * = becomes a problem to send all the data via cli due to serial/cli buffers
 */

typedef enum {
    X_COORDINATE,
    Y_COORDINATE,
    DIRECTIONS,
    FUNCTIONS,
    RING_COLORS
} parseState_e;

#define PARSE_STATE_COUNT 5

static const char chunkSeparators[PARSE_STATE_COUNT] = {',', ':', ':',':', '\0' };

static const char directionCodes[] = { 'N', 'E', 'S', 'W', 'U', 'D' };
#define DIRECTION_COUNT (sizeof(directionCodes) / sizeof(directionCodes[0]))
static const uint8_t directionMappings[DIRECTION_COUNT] = {
    LED_DIRECTION_NORTH,
    LED_DIRECTION_EAST,
    LED_DIRECTION_SOUTH,
    LED_DIRECTION_WEST,
    LED_DIRECTION_UP,
    LED_DIRECTION_DOWN
};

static const char functionCodes[] = { 'I', 'W', 'F', 'A', 'T', 'R', 'C', 'G', 'S', 'B' };
#define FUNCTION_COUNT (sizeof(functionCodes) / sizeof(functionCodes[0]))
static const uint16_t functionMappings[FUNCTION_COUNT] = {
    LED_FUNCTION_INDICATOR,
    LED_FUNCTION_WARNING,
    LED_FUNCTION_FLIGHT_MODE,
    LED_FUNCTION_ARM_STATE,
    LED_FUNCTION_THROTTLE,
	LED_FUNCTION_THRUST_RING,
	LED_FUNCTION_COLOR,
	LED_FUNCTION_GPS,
	LED_FUNCTION_RSSI,
	LED_FUNCTION_BLINK
};

// grid offsets
uint8_t highestYValueForNorth;
uint8_t lowestYValueForSouth;
uint8_t highestXValueForWest;
uint8_t lowestXValueForEast;

void determineLedStripDimensions(void)
{
    ledGridWidth = 0;
    ledGridHeight = 0;

    const ledConfig_t *ledConfig;

    for (int ledIndex = 0; ledIndex < ledCount; ledIndex++) {
        ledConfig = ledConfigs(ledIndex);

        if (GET_LED_X(ledConfig) >= ledGridWidth) {
            ledGridWidth = GET_LED_X(ledConfig) + 1;
        }
        if (GET_LED_Y(ledConfig) >= ledGridHeight) {
            ledGridHeight = GET_LED_Y(ledConfig) + 1;
        }
    }
}

void determineOrientationLimits(void)
{
    bool isOddHeight = (ledGridHeight & 1);
    bool isOddWidth = (ledGridWidth & 1);
    int heightModifier = isOddHeight ? 1 : 0;
    int widthModifier = isOddWidth ? 1 : 0;

    highestYValueForNorth = (ledGridHeight / 2) - 1;
    lowestYValueForSouth = (ledGridHeight / 2) + heightModifier;
    highestXValueForWest = (ledGridWidth / 2) - 1;
    lowestXValueForEast = (ledGridWidth / 2) + widthModifier;
}

void updateLedCount(void)
{
    int count = 0, countRing = 0;

    for (int ledIndex = 0; ledIndex < MAX_LED_STRIP_LENGTH; ledIndex++) {
        const ledConfig_t *ledConfig = ledConfigs(ledIndex);
        if (ledConfig->flags == 0 && ledConfig->xy == 0)
            break;
        count++;
        if ((ledConfig->flags & LED_FUNCTION_THRUST_RING))
            countRing++;
    }
    ledCount = count;
    ledsInRingCount = countRing;
}

void reevalulateLedConfig(void)
{
    updateLedCount();
    determineLedStripDimensions();
    determineOrientationLimits();
}

#define CHUNK_BUFFER_SIZE 10

#define NEXT_PARSE_STATE(parseState) ((parseState + 1) % PARSE_STATE_COUNT)


bool parseLedStripConfig(uint8_t ledIndex, const char *config)
{
    char chunk[CHUNK_BUFFER_SIZE];
    int val;

    int parseState = X_COORDINATE;
    bool result = true;

    if (ledIndex >= MAX_LED_STRIP_LENGTH) {
        return !result;
    }

    ledConfig_t *ledConfig = ledConfigs(ledIndex);
    memset(ledConfig, 0, sizeof(ledConfig_t));

    while (result) {

        char chunkSeparator = chunkSeparators[parseState];

        memset(&chunk, 0, sizeof(chunk));
        int chunkIndex = 0;

        while (*config && chunkIndex < CHUNK_BUFFER_SIZE && *config != chunkSeparator) {
            chunk[chunkIndex++] = *config++;
        }

        if (*config++ != chunkSeparator) {
            result = false;
            break;
        }

        switch((parseState_e)parseState) {
            case X_COORDINATE:
                val = atoi(chunk);
                ledConfig->xy |= CALCULATE_LED_X(val);
                break;

            case Y_COORDINATE:
                val = atoi(chunk);
                ledConfig->xy |= CALCULATE_LED_Y(val);
                break;

            case DIRECTIONS:
                for (int chunkIndex = 0; chunk[chunkIndex] && chunkIndex < CHUNK_BUFFER_SIZE; chunkIndex++) {
                    for (unsigned mappingIndex = 0; mappingIndex < DIRECTION_COUNT; mappingIndex++) {
                        if (directionCodes[mappingIndex] == chunk[chunkIndex]) {
                            ledConfig->flags |= directionMappings[mappingIndex];
                            break;
                        }
                    }
                }
                break;

            case FUNCTIONS:
                for (int chunkIndex = 0; chunk[chunkIndex] && chunkIndex < CHUNK_BUFFER_SIZE; chunkIndex++) {
                    for (unsigned mappingIndex = 0; mappingIndex < FUNCTION_COUNT; mappingIndex++) {
                        if (functionCodes[mappingIndex] == chunk[chunkIndex]) {
                            ledConfig->flags |= functionMappings[mappingIndex];
                            break;
                        }
                    }
                }
                break;

            case RING_COLORS:
                if (atoi(chunk) < CONFIGURABLE_COLOR_COUNT) {
                    ledConfig->color = atoi(chunk);
                } else {
                    ledConfig->color = 0;
                }
                break;
            default :
                break;
        }

        parseState++;
        if (parseState >= PARSE_STATE_COUNT) {
            break;
        }
    }

    if (!result) {
        memset(ledConfig, 0, sizeof(ledConfig_t));
    }

    reevalulateLedConfig();

    return result;
}

void generateLedConfig(uint8_t ledIndex, char *ledConfigBuffer, size_t bufferSize)
{
    char functions[FUNCTION_COUNT];
    char directions[DIRECTION_COUNT];


    ledConfig_t *ledConfig = ledConfigs(ledIndex);

    memset(ledConfigBuffer, 0, bufferSize);
    memset(&functions, 0, sizeof(functions));
    memset(&directions, 0, sizeof(directions));

    for (unsigned mappingIndex = 0, index = 0; mappingIndex < FUNCTION_COUNT; mappingIndex++) {
        if (ledConfig->flags & functionMappings[mappingIndex]) {
            functions[index++] = functionCodes[mappingIndex];
        }
    }

    for (unsigned mappingIndex = 0, index = 0; mappingIndex < DIRECTION_COUNT; mappingIndex++) {
        if (ledConfig->flags & directionMappings[mappingIndex]) {
            directions[index++] = directionCodes[mappingIndex];
        }
    }

    sprintf(ledConfigBuffer, "%u,%u:%s:%s:%u", GET_LED_X(ledConfig), GET_LED_Y(ledConfig), directions, functions, ledConfig->color);
}

void applyDirectionalModeColor(const uint8_t ledIndex, const ledConfig_t *ledConfig, const modeColorIndexes_t *modeColors)
{
    // apply up/down colors regardless of quadrant.
    if ((ledConfig->flags & LED_DIRECTION_UP)) {
        setLedHsv(ledIndex, colors(modeColors->up));
    }

    if ((ledConfig->flags & LED_DIRECTION_DOWN)) {
        setLedHsv(ledIndex, colors(modeColors->down));
    }

    // override with n/e/s/w colors to each n/s e/w half - bail at first match.
    if ((ledConfig->flags & LED_DIRECTION_WEST) && GET_LED_X(ledConfig) <= highestXValueForWest) {
        setLedHsv(ledIndex, colors(modeColors->west));
    }

    if ((ledConfig->flags & LED_DIRECTION_EAST) && GET_LED_X(ledConfig) >= lowestXValueForEast) {
        setLedHsv(ledIndex, colors(modeColors->east));
    }

    if ((ledConfig->flags & LED_DIRECTION_NORTH) && GET_LED_Y(ledConfig) <= highestYValueForNorth) {
        setLedHsv(ledIndex, colors(modeColors->north));
    }

    if ((ledConfig->flags & LED_DIRECTION_SOUTH) && GET_LED_Y(ledConfig) >= lowestYValueForSouth) {
        setLedHsv(ledIndex, colors(modeColors->south));
    }

}

typedef enum {
    QUADRANT_NORTH_EAST = 1,
    QUADRANT_SOUTH_EAST,
    QUADRANT_SOUTH_WEST,
    QUADRANT_NORTH_WEST
} quadrant_e;

void applyQuadrantColor(const uint8_t ledIndex, const ledConfig_t *ledConfig, const quadrant_e quadrant, const hsvColor_t *color)
{
    switch (quadrant) {
        case QUADRANT_NORTH_EAST:
            if (GET_LED_Y(ledConfig) <= highestYValueForNorth && GET_LED_X(ledConfig) >= lowestXValueForEast) {
                setLedHsv(ledIndex, color);
            }
            return;

        case QUADRANT_SOUTH_EAST:
            if (GET_LED_Y(ledConfig) >= lowestYValueForSouth && GET_LED_X(ledConfig) >= lowestXValueForEast) {
                setLedHsv(ledIndex, color);
            }
            return;

        case QUADRANT_SOUTH_WEST:
            if (GET_LED_Y(ledConfig) >= lowestYValueForSouth && GET_LED_X(ledConfig) <= highestXValueForWest) {
                setLedHsv(ledIndex, color);
            }
            return;

        case QUADRANT_NORTH_WEST:
            if (GET_LED_Y(ledConfig) <= highestYValueForNorth && GET_LED_X(ledConfig) <= highestXValueForWest) {
                setLedHsv(ledIndex, color);
            }
            return;
    }
}

void applyLedModeLayer(void)
{
    for (int ledIndex = 0; ledIndex < ledCount; ledIndex++) {
        const ledConfig_t *ledConfig = ledConfigs(ledIndex);

        if (!(ledConfig->flags & LED_FUNCTION_THRUST_RING)) {
            if (ledConfig->flags & LED_FUNCTION_COLOR) {
                setLedHsv(ledIndex, colors(ledConfig->color));
            } else {
                setLedHsv(ledIndex, colors(specialColors(0)->background));
            }
        }

        if (!(ledConfig->flags & LED_FUNCTION_FLIGHT_MODE)) {
            if (ledConfig->flags & LED_FUNCTION_ARM_STATE) {
                if (!ARMING_FLAG(ARMED)) {
                    setLedHsv(ledIndex, colors(specialColors(0)->disarmed));
                } else {
                    setLedHsv(ledIndex, colors(specialColors(0)->armed));
                }
            }
            continue;
        }

        applyDirectionalModeColor(ledIndex, ledConfig, modeColors(MODE_ORIENTATION));

        if (FLIGHT_MODE(HEADFREE_MODE)) {
            applyDirectionalModeColor(ledIndex, ledConfig, modeColors(MODE_HEADFREE));
#ifdef MAG
        } else if (FLIGHT_MODE(MAG_MODE)) {
            applyDirectionalModeColor(ledIndex, ledConfig, modeColors(MODE_MAG));
#endif
#ifdef BARO
        } else if (FLIGHT_MODE(BARO_MODE)) {
            applyDirectionalModeColor(ledIndex, ledConfig, modeColors(MODE_BARO));
#endif
        } else if (FLIGHT_MODE(HORIZON_MODE)) {
            applyDirectionalModeColor(ledIndex, ledConfig, modeColors(MODE_HORIZON));
        } else if (FLIGHT_MODE(ANGLE_MODE)) {
            applyDirectionalModeColor(ledIndex, ledConfig, modeColors(MODE_ANGLE));
        }
    }
}

typedef enum {
    WARNING_FLAG_NONE = 0,
    WARNING_FLAG_LOW_BATTERY = (1 << 0),
    WARNING_FLAG_FAILSAFE = (1 << 1),
    WARNING_FLAG_ARMING_DISABLED = (1 << 2)
} warningFlags_e;

static uint8_t warningFlags = WARNING_FLAG_NONE;

void applyLedWarningLayer(bool updateNow)
{
    static uint8_t warningFlashCounter = 0;

    if (updateNow && warningFlashCounter == 0) {
        warningFlags = WARNING_FLAG_NONE;
        if (feature(FEATURE_VBAT) && getBatteryState() != BATTERY_OK) {
            warningFlags |= WARNING_FLAG_LOW_BATTERY;
        }
        if (feature(FEATURE_FAILSAFE) && failsafeIsActive()) {
            warningFlags |= WARNING_FLAG_FAILSAFE;
        }
        if (!ARMING_FLAG(ARMED) && !ARMING_FLAG(OK_TO_ARM)) {
            warningFlags |= WARNING_FLAG_ARMING_DISABLED;
        }
    }

    if (warningFlags || warningFlashCounter > 0) {
        const hsvColor_t *warningColor = &hsv_black;

        if ((warningFlashCounter & 1) == 0) {
            if (warningFlashCounter < 4 && (warningFlags & WARNING_FLAG_ARMING_DISABLED)) {
                warningColor = &hsv_green;
            }
            if (warningFlashCounter >= 4 && warningFlashCounter < 12 && (warningFlags & WARNING_FLAG_LOW_BATTERY)) {
                warningColor = &hsv_red;
            }
            if (warningFlashCounter >= 12 && warningFlashCounter < 16 && (warningFlags & WARNING_FLAG_FAILSAFE)) {
                warningColor = &hsv_yellow;
            }
        }  else {
            if (warningFlashCounter >= 12 && warningFlashCounter < 16 && (warningFlags & WARNING_FLAG_FAILSAFE)) {
                warningColor = &hsv_blue;
            }
        }

        for (int ledIndex = 0; ledIndex < ledCount; ledIndex++) {
            const ledConfig_t *ledConfig = ledConfigs(ledIndex);
            if (!(ledConfig->flags & LED_FUNCTION_WARNING))
                continue;

            setLedHsv(ledIndex, warningColor);
        }
    }

    if (updateNow && (warningFlags || warningFlashCounter)) {
        warningFlashCounter++;
        if (warningFlashCounter == 20) {
            warningFlashCounter = 0;
        }
    }
}

void applyLedGpsLayer(bool updateNow)
{
#ifdef CC3D
    return;
#endif
    static uint8_t gpsFlashCounter = 0;
    static uint8_t gpsPauseCounter = 0;
    const uint8_t blinkPauseLength = 4;

    const hsvColor_t *gpsColor = colors(specialColors(0)->background);

    if (GPS_numSat == 0 || !sensors(SENSOR_GPS)) {
        gpsColor = colors(specialColors(0)->gps_nosats);
        gpsFlashCounter = gpsPauseCounter = 0; // reset counters
    } else {
        if (gpsPauseCounter == 0 && (gpsFlashCounter & 1) == 0) {
            gpsColor = STATE(GPS_FIX) ? colors(specialColors(0)->gps_locked) : colors(specialColors(0)->gps_nolock);
        } else {
            gpsColor = STATE(GPS_FIX) ? colors(specialColors(0)->background) : colors(specialColors(0)->gps_nosats);
        }
    }

    for (int i = 0; i < ledCount; ++i) {
        const ledConfig_t *ledConfig = ledConfigs(i);

        if (ledConfig->flags & LED_FUNCTION_GPS) {
            setLedHsv(i, gpsColor);
        }
    }

    if (updateNow) {
        if (gpsPauseCounter > 0) {
            gpsPauseCounter--;
        } else if ((gpsFlashCounter + 1) >= (GPS_numSat * 2)) {
            gpsFlashCounter = 0;
            gpsPauseCounter = blinkPauseLength;
        } else
            gpsFlashCounter++;
    }
}

#define INDICATOR_DEADBAND 25

void applyLedIndicatorLayer(uint8_t indicatorFlashState)
{
    if (!rxIsReceivingSignal()) {
        return;
    }

    const hsvColor_t *flashColor;
    if (indicatorFlashState == 0) {
        flashColor = &hsv_orange;
    } else {
        flashColor = &hsv_black;
    }


    for (int ledIndex = 0; ledIndex < ledCount; ledIndex++) {
        const ledConfig_t *ledConfig = ledConfigs(ledIndex);
        if (!(ledConfig->flags & LED_FUNCTION_INDICATOR))
            continue;

        if (rcCommand[ROLL] > INDICATOR_DEADBAND) {
            applyQuadrantColor(ledIndex, ledConfig, QUADRANT_NORTH_EAST, flashColor);
            applyQuadrantColor(ledIndex, ledConfig, QUADRANT_SOUTH_EAST, flashColor);
        }

        if (rcCommand[ROLL] < -INDICATOR_DEADBAND) {
            applyQuadrantColor(ledIndex, ledConfig, QUADRANT_NORTH_WEST, flashColor);
            applyQuadrantColor(ledIndex, ledConfig, QUADRANT_SOUTH_WEST, flashColor);
        }

        if (rcCommand[PITCH] > INDICATOR_DEADBAND) {
            applyQuadrantColor(ledIndex, ledConfig, QUADRANT_NORTH_EAST, flashColor);
            applyQuadrantColor(ledIndex, ledConfig, QUADRANT_NORTH_WEST, flashColor);
        }

        if (rcCommand[PITCH] < -INDICATOR_DEADBAND) {
            applyQuadrantColor(ledIndex, ledConfig, QUADRANT_SOUTH_EAST, flashColor);
            applyQuadrantColor(ledIndex, ledConfig, QUADRANT_SOUTH_WEST, flashColor);
        }
    }
}

void applyLedHue(uint16_t flag, int16_t value, int16_t minRange, int16_t maxRange)
{
    int scaled = scaleRange(value, minRange, maxRange, -60, +60);
    scaled += HSV_HUE_MAX;   // wrap negative values correctly

    for (int i = 0; i < ledCount; ++i) {
        const ledConfig_t *ledConfig = ledConfigs(i);
        if (!(ledConfig->flags & flag))
            continue;

        hsvColor_t color;
        getLedHsv(i, &color);
        color.h = (color.h + scaled) % (HSV_HUE_MAX + 1);
        setLedHsv(i, &color);
    }
}

#define ROTATION_SEQUENCE_LED_COUNT 6 // 2 on, 4 off
#define ROTATION_SEQUENCE_LED_WIDTH 2

#define RING_PATTERN_NOT_CALCULATED 255

void applyLedThrustRingLayer(void)
{
    int ledRingIndex = 0;
    // initialised to special value instead of using more memory for a flag.
    static uint8_t rotationSeqLedCount = RING_PATTERN_NOT_CALCULATED;
    static uint8_t rotationPhase = ROTATION_SEQUENCE_LED_COUNT;
    bool nextLedOn = false;

    for (int ledIndex = 0; ledIndex < ledCount; ledIndex++) {
        const ledConfig_t *ledConfig = ledConfigs(ledIndex);
        if ((ledConfig->flags & LED_FUNCTION_THRUST_RING) == 0)
            continue;

        bool applyColor = false;
        if (ARMING_FLAG(ARMED)) {
            if ((ledRingIndex + rotationPhase) % rotationSeqLedCount < ROTATION_SEQUENCE_LED_WIDTH) {
                applyColor = true;
            }
        } else {
            if (!nextLedOn) {
                applyColor = true;
            }
            nextLedOn = !nextLedOn;
        }

        const hsvColor_t *ringColor = applyColor ? colors(ledConfig->color) : &hsv_black;
        setLedHsv(ledIndex, ringColor);

        ledRingIndex++;
    }

    if (rotationSeqLedCount == RING_PATTERN_NOT_CALCULATED) {
        // update ring pattern according to total number of ring leds found
        int ledRingLedCount = ledRingIndex;

        rotationSeqLedCount = ledRingLedCount;

        // try to split in segments/rings of exactly ROTATION_SEQUENCE_LED_COUNT leds
        if ((ledRingLedCount % ROTATION_SEQUENCE_LED_COUNT) == 0) {
            rotationSeqLedCount = ROTATION_SEQUENCE_LED_COUNT;
        } else {
            // else split up in equal segments/rings of at most ROTATION_SEQUENCE_LED_COUNT leds
            while ((rotationSeqLedCount > ROTATION_SEQUENCE_LED_COUNT) && ((rotationSeqLedCount % 2) == 0)) {
                rotationSeqLedCount >>= 1;
            }
        }

        // trigger start over
        rotationPhase = 1;
    }

    rotationPhase--;
    if (rotationPhase == 0) {
        rotationPhase = rotationSeqLedCount;
    }
}

void applyLedBlinkLayer(bool updateNow)
{
    static uint8_t blinkCounter = 0;
    const uint8_t blinkCycleLength = 20;

    if (blinkCounter > 0) {
        for (int i = 0; i < ledCount; ++i) {
            const ledConfig_t *ledConfig = ledConfigs(i);
            if (!(ledConfig->flags & LED_FUNCTION_BLINK))
                continue;

            const hsvColor_t *blinkColor;
            if ((blinkCounter & 1) == 1 && blinkCounter < 4)
                blinkColor = colors(ledConfig->color);
            else
                blinkColor = colors(specialColors(0)->blink_background);
            setLedHsv(i, blinkColor);
        }
    }

    if (updateNow) {
        blinkCounter++;
        if (blinkCounter == blinkCycleLength) {
            blinkCounter = 0;
        }
    }
}


#ifdef USE_LED_ANIMATION

static void applyLedAnimationLayer(bool updateNow)
{
    static uint8_t frameCounter = 0;
    const int animationFrames = ledGridHeight;
    if(updateNow)
        frameCounter = (frameCounter + 1 < animationFrames) ? frameCounter + 1 : 0;

    if (ARMING_FLAG(ARMED))
        return;

    int previousRow = (frameCounter + 1 < animationFrames) ? frameCounter + 1 : 0;
    int currentRow = frameCounter;
    int nextRow = frameCounter > 0 ? frameCounter - 1 : animationFrames - 1;

    for (int ledIndex = 0; ledIndex < ledCount; ledIndex++) {
        const ledConfig_t *ledConfig = ledConfigs(ledIndex);

        if (GET_LED_Y(ledConfig) == previousRow) {
            setLedHsv(ledIndex, colors(specialColors(0)->animation));
            scaleLedValue(ledIndex, 50);
        } else if (GET_LED_Y(ledConfig) == currentRow) {
            setLedHsv(ledIndex, colors(specialColors(0)->animation));
        } else if (GET_LED_Y(ledConfig) == nextRow) {
            scaleLedValue(ledIndex, 50);
        }
    }
}
#endif

void updateLedStrip(void)
{

    if (!(ledStripInitialised && isWS2811LedStripReady())) {
        return;
    }

    if (rcModeIsActive(BOXLEDLOW)) {
        if (ledStripEnabled) {
            ledStripDisable();
            ledStripEnabled = false;
        }
    } else {
        ledStripEnabled = true;
    }

    if (!ledStripEnabled){
        return;
    }

    uint32_t now = micros();

    bool indicatorFlashNow = cmp32(now, nextIndicatorFlashAt) >= 0;
    bool blinkFlashNow = cmp32(now, nextBlinkFlashAt) >= 0;
    bool warningFlashNow = cmp32(now, nextWarningFlashAt) >= 0;
#ifdef GPS
    bool gpsFlashNow = cmp32(now, nextGpsFlashAt) >= 0;
#endif
    bool rotationUpdateNow = cmp32(now, nextRotationUpdateAt) >= 0;
#ifdef USE_LED_ANIMATION
    bool animationUpdateNow = cmp32(now, nextAnimationUpdateAt) >= 0;
#endif
    if (!(  false
            || indicatorFlashNow
            || rotationUpdateNow
#ifdef GPS
            || gpsFlashNow
#endif
            || blinkFlashNow
            || warningFlashNow
#ifdef USE_LED_ANIMATION
            || animationUpdateNow
#endif
       )) {
        return;
    }

    static uint8_t indicatorFlashState = 0;

    // LAYER 1
    applyLedModeLayer();
    applyLedHue(LED_FUNCTION_THROTTLE, rcData[THROTTLE], PWM_RANGE_MIN, PWM_RANGE_MAX);
    applyLedHue(LED_FUNCTION_RSSI, rssi, 0, 1023);

    // LAYER 2
    if (warningFlashNow) {
        nextWarningFlashAt = now + LED_STRIP_10HZ;
    }
    applyLedWarningLayer(warningFlashNow);

#ifdef GPS
    if (gpsFlashNow) {
        nextGpsFlashAt = now + LED_STRIP_5HZ * 2;
    }
    applyLedGpsLayer(gpsFlashNow);
#endif

    // LAYER 3

    if (indicatorFlashNow) {

        int rollScale = ABS(rcCommand[ROLL]);
        int pitchScale = ABS(rcCommand[PITCH]);
        int scale = MAX(rollScale, pitchScale) / 50;
        nextIndicatorFlashAt = now + (LED_STRIP_5HZ / MAX(1, scale));

        indicatorFlashState = !indicatorFlashState;
    }

    applyLedIndicatorLayer(indicatorFlashState);

    // LAYER 4

    if (blinkFlashNow) {
        nextBlinkFlashAt = now + LED_STRIP_10HZ;
    }
    applyLedBlinkLayer(blinkFlashNow);


#ifdef USE_LED_ANIMATION
    if (animationUpdateNow) {
        nextAnimationUpdateAt = now + LED_STRIP_20HZ;
    }
    applyLedAnimationLayer(animationUpdateNow);
#endif

    if (rotationUpdateNow) {

        applyLedThrustRingLayer();

        int animationSpeedScale = 1;
        if (ARMING_FLAG(ARMED)) {
            animationSpeedScale = scaleRange(rcData[THROTTLE], PWM_RANGE_MIN, PWM_RANGE_MAX, 1, 10);
        }

        nextRotationUpdateAt = now + LED_STRIP_5HZ / animationSpeedScale;
    }

    ws2811UpdateStrip();
}

bool parseColor(uint8_t index, const char *colorConfig)
{
    const char *remainingCharacters = colorConfig;

    hsvColor_t *color = colors(index);

    bool result = true;

    for (int componentIndex = 0; result && componentIndex < HSV_COLOR_COMPONENT_COUNT; componentIndex++) {
        uint16_t val = atoi(remainingCharacters);
        switch (componentIndex) {
            case HSV_HUE:
                if (val > HSV_HUE_MAX) {
                    result = false;
                    continue;
                }
                color->h = val;
                break;

            case HSV_SATURATION:
                if (val > HSV_SATURATION_MAX) {
                    result = false;
                    continue;
                }
                color->s = val;
                break;

            case HSV_VALUE:
                if (val > HSV_VALUE_MAX) {
                    result = false;
                    continue;
                }
                color->v = val;
                break;
        }
        remainingCharacters = strstr(remainingCharacters, ",");
        if (remainingCharacters) {
            remainingCharacters++;
        } else {
            if (componentIndex < 2) {
                result = false;
            }
        }
    }

    if (!result) {
        memset(color, 0, sizeof(*color));
    }

    return result;
}

/*
 * Redefine a color in a mode.
 * */
bool setModeColor(uint8_t modeIndex, uint8_t modeColorIndex, uint8_t colorIndex)
{
    modeColorIndexes_t *modeColor;

    switch (modeIndex) {
        case MODE_ORIENTATION:
            modeColor = modeColors(MODE_ORIENTATION);
            break;

        case MODE_HEADFREE:
            modeColor = modeColors(MODE_HEADFREE);
            break;

        case MODE_HORIZON:
            modeColor = modeColors(MODE_HORIZON);
            break;

        case MODE_ANGLE:
            modeColor = modeColors(MODE_ANGLE);
            break;

#ifdef MAG
        case MODE_MAG:
            modeColor = modeColors(MODE_MAG);
            break;
#endif
        case MODE_BARO:
            modeColor = modeColors(MODE_BARO);
            break;

        case SPECIAL:
            switch (modeColorIndex) {
                case SC_FUNCTION_DISMARED:
                    specialColors(0)->disarmed = colorIndex;
                    break;

                case SC_FUNCTION_ARMED:
                    specialColors(0)->armed = colorIndex;
                    break;

                case SC_FUNCTION_ANIMATION:
                    specialColors(0)->animation = colorIndex;
                    break;

                case SC_FUNCTION_BACKGROUND:
                    specialColors(0)->background = colorIndex;
                    break;

                default:
                    return false;
            }
            return true;
            break;
        default:
            return false;
    }

    switch (modeColorIndex) {
        case DIRECTION_NORTH:
            modeColor->north = colorIndex;
            break;

        case DIRECTION_EAST:
            modeColor->east = colorIndex;
            break;

        case DIRECTION_SOUTH:
            modeColor->south = colorIndex;
            break;

        case DIRECTION_WEST:
            modeColor->west = colorIndex;
            break;

        case DIRECTION_UP:
            modeColor->up = colorIndex;
            break;

        case DIRECTION_DOWN:
            modeColor->down = colorIndex;
            break;

        default:
            return false;
    }

    return true;
}

void pgResetFn_colors(hsvColor_t *instance)
{
    BUILD_BUG_ON(ARRAYLEN(*colors_arr()) <= ARRAYLEN(defaultColors));

    for (uint8_t colorIndex = 0; colorIndex < ARRAYLEN(defaultColors); colorIndex++) {
        *instance++ = *defaultColors[colorIndex];
    }
}

void pgResetFn_modeColors(modeColorIndexes_t *instance)
{
    memcpy(instance, &defaultModeColors, sizeof(defaultModeColors));
}

void pgResetFn_specialColors(specialColorIndexes_t *instance)
{
    memcpy(instance, &defaultSpecialColors, sizeof(defaultSpecialColors));
}


void ledStripInit(void)
{
    ledStripInitialised = false;
}

void ledStripEnable(void)
{
    reevalulateLedConfig();
    ledStripInitialised = true;

    ws2811LedStripInit();
}

static void ledStripDisable(void)
{
	setStripColor(&hsv_black);

	ws2811UpdateStrip();
}
#endif
