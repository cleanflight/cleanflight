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

// 0 - 65535 / 16 bits.
enum osdElementIds_e {
    // durations/timers
    OSD_ELEMENT_ON_DURATION = 1,
    OSD_ELEMENT_ARMED_DURATION = 2,

    // amperage
    OSD_ELEMENT_MAH_DRAWN = 3,
    OSD_ELEMENT_AMPERAGE = 4,

    // voltages
    OSD_ELEMENT_VOLTAGE_5V = 6,
    OSD_ELEMENT_VOLTAGE_12V = 7,
    OSD_ELEMENT_VOLTAGE_BATTERY = 8,
    OSD_ELEMENT_VOLTAGE_BATTERY_FC = 9,

    // flight modes
    OSD_ELEMENT_FLIGHT_MODE = 10,
    OSD_ELEMENT_INDICATOR_MAG = 11,
    OSD_ELEMENT_INDICATOR_BARO = 12,

    // rx
    OSD_ELEMENT_RSSI_FC = 13,

    // pilot
    OSD_ELEMENT_CALLSIGN = 14,

    // motors
    OSD_ELEMENT_MOTORS = 15,

};

// 16 bits.
enum osdElementFlags_e {
    EF_ENABLED = (1 << 0),
    EF_POSITIONABLE = (1 << 1),
    EF_FLASH_ON_DISCONNECT = (1 << 2),
};

typedef struct element_s {
    int8_t x;
    int8_t y;
    uint8_t flags;
    uint8_t id;
} element_t;

typedef intptr_t (*elementDataProviderFn)(void);
typedef void (*elementRenderFn)(const element_t *element, elementDataProviderFn dataFn);

typedef struct elementHandlerConfig_s {
    uint8_t id;
    elementRenderFn renderFn;
    elementDataProviderFn dataFn;
} elementHandlerConfig_t;

// state - update state before drawing elements.
void osdSetElementFlashOnDisconnectState(bool flashWhenDisconnected);

// draw
void osdDrawTextElement(const element_t *element);
