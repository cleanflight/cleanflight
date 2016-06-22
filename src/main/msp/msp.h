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

#pragma once

typedef enum {
    INCOMING,
    OUTGOING
} mspMessageDirection_e;

typedef struct mspPacket_s {
    sbuf_t buf;
    int16_t cmd;
    mspMessageDirection_e direction;
    int16_t result;
} mspPacket_t;

void mspInit(void);

//
// server
//
int mspServerProcessCommand(mspPacket_t *command, mspPacket_t *reply);

// return positive for ACK, negative on error, zero for no reply
int mspServerProcessInCommand(mspPacket_t *cmd);
int mspServerProcessOutCommand(mspPacket_t *cmd, mspPacket_t *reply);

//
// client
//
int mspClientProcessCommand(mspPacket_t *command, mspPacket_t *reply);

// return positive for ACK, negative on error, zero for no reply
int mspClientProcessInCommand(mspPacket_t *cmd);

// FIXME implies that MSP requires PG, probably belongs elsewhere.
typedef struct pgToMSPMapEntry_s {
    pgn_t pgn;
    uint8_t mspId;
    uint8_t mspIdForSet;
} pgToMSPMapEntry_t;

extern const pgToMSPMapEntry_t pgToMSPMap[];
extern const uint8_t pgToMSPMapSize;

