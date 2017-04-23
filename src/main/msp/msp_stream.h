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

//
// MSP Stream
//

#define MSP_STREAM_FLAG_STATUS                  (1 << 0) // get a list of the items that are being streamed
#define MSP_STREAM_FLAG_BEGIN                   (1 << 1) // request to start streaming more items
#define MSP_STREAM_FLAG_END                     (1 << 2) // request to stop streaming some items

// items that can be stream include commands or values.
#define MSP_STREAM_ENTRY_NONE                   (0 << 0)
#define MSP_STREAM_ENTRY_COMMAND                (1 << 0)
#define MSP_STREAM_ENTRY_VALUE                  (1 << 1)

// values that can be streamed
#define MSP_STREAM_VALUE_ID_AMPERAGE_BATTERY    1
#define MSP_STREAM_VALUE_ID_MAHDRAWN_BATTERY    2

#define MSP_STREAM_VALUE_ID_VOLTAGE_BATTERY     10
#define MSP_STREAM_VALUE_ID_VOLTAGE_5V          11
#define MSP_STREAM_VALUE_ID_VOLTAGE_9V          12
#define MSP_STREAM_VALUE_ID_VOLTAGE_12V         13

typedef struct mspStreamEntry_s {
    uint8_t flags;
    uint16_t id;
    uint8_t hz;
}  __attribute__ ((__packed__)) mspStreamEntry_t; // wire format

bool mspStreamScheduleEntry(mspPort_t *mspPort, uint8_t flags, uint8_t hz, uint16_t id);
