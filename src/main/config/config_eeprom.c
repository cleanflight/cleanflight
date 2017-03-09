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
#include <string.h>
#include <stddef.h>

#include "platform.h"

#include "build/build_config.h"

#include "common/maths.h"

#include "drivers/light_led.h"

#include "config/config_eeprom.h"
#include "config/config_streamer.h"
#include "config/parameter_group.h"

#include "drivers/system.h"

#include "fc/config.h"
#include "fc/rc_adjustments.h"

#include "flight/pid.h"

extern uint8_t __config_start;   // configured via linker script when building binaries.
extern uint8_t __config_end;

static uint16_t eepromConfigSize;

typedef enum {
    CR_CLASSICATION_SYSTEM   = 0,
    CR_CLASSICATION_PROFILE1 = 1,
    CR_CLASSICATION_PROFILE2 = 2,
    CR_CLASSICATION_PROFILE3 = 3,
    CR_CLASSICATION_PROFILE_LAST = CR_CLASSICATION_PROFILE3,
} configRecordFlags_e;

#define CR_CLASSIFICATION_MASK  (0x3)
#define CRC_START_VALUE         0xFFFF
#define CRC_CHECK_VALUE         0x1D0F  // pre-calculated value of CRC that includes the CRC itself

// Header for the saved copy.
typedef struct {
    uint8_t eepromConfigVersion;
    uint8_t magic_be;           // magic number, should be 0xBE
    char boardIdentifier[sizeof(TARGET_BOARD_IDENTIFIER)];
} PG_PACKED configHeader_t;

// Header for each stored PG.
typedef struct {
    // split up.
    uint16_t size;
    pgn_t pgn;
    uint8_t version;

    // lower 2 bits used to indicate system or profile number, see CR_CLASSIFICATION_MASK
    uint8_t flags;

    uint8_t pg[];
} PG_PACKED configRecord_t;

// Footer for the saved copy.
typedef struct {
    uint16_t terminator;
} PG_PACKED configFooter_t;
// checksum is appended just after footer. It is not included in footer to make checksum calculation consistent

// Used to check the compiler packing at build time.
typedef struct {
    uint8_t byte;
    uint32_t word;
} PG_PACKED packingTest_t;

void initEEPROM(void)
{
    // Verify that this architecture packs as expected.
    BUILD_BUG_ON(offsetof(packingTest_t, byte) != 0);
    BUILD_BUG_ON(offsetof(packingTest_t, word) != 1);
    BUILD_BUG_ON(sizeof(packingTest_t) != 5);

    BUILD_BUG_ON(sizeof(configHeader_t) != 2 + sizeof(TARGET_BOARD_IDENTIFIER));
    BUILD_BUG_ON(sizeof(configFooter_t) != 2);
    BUILD_BUG_ON(sizeof(configRecord_t) != 6);
}

// Scan the EEPROM config. Returns true if the config is valid.
bool isEEPROMContentValid(void)
{
    const uint8_t *p = &__config_start;
    const configHeader_t *header = (const configHeader_t *)p;

    if (header->eepromConfigVersion != EEPROM_CONF_VERSION) {
        return false;
    }
    if (header->magic_be != 0xBE) {
        return false;
    }
    if (strncasecmp(header->boardIdentifier, TARGET_BOARD_IDENTIFIER, sizeof(TARGET_BOARD_IDENTIFIER))) {
        return false;
    }

    uint16_t crc = CRC_START_VALUE;
    crc = crc16_ccitt_update(crc, header, sizeof(*header));
    p += sizeof(*header);

    for (;;) {
        const configRecord_t *record = (const configRecord_t *)p;

        if (record->size == 0) {
            // Found the end.  Stop scanning.
            break;
        }
        if (p + record->size >= &__config_end
            || record->size < sizeof(*record)) {
            // Too big or too small.
            return false;
        }

        crc = crc16_ccitt_update(crc, p, record->size);

        p += record->size;
    }

    const configFooter_t *footer = (const configFooter_t *)p;
    crc = crc16_ccitt_update(crc, footer, sizeof(*footer));
    p += sizeof(*footer);

    // include stored CRC in the CRC calculation
    const uint16_t *storedCrc = (const uint16_t *)p;
    crc = crc16_ccitt_update(crc, storedCrc, sizeof(*storedCrc));
    p += sizeof(storedCrc);

    eepromConfigSize = p - &__config_start;

    // CRC has the property that if the CRC itself is included in the calculation the resulting CRC will have constant value
    return crc == CRC_CHECK_VALUE;
}

uint16_t getEEPROMConfigSize(void)
{
    return eepromConfigSize;
}

// find config record for reg + classification (profile info) in EEPROM
// return NULL when record is not found
// this function assumes that EEPROM content is valid
static const configRecord_t *findEEPROM(const pgRegistry_t *reg, configRecordFlags_e classification)
{
    const uint8_t *p = &__config_start;
    p += sizeof(configHeader_t);             // skip header
    while (true) {
        const configRecord_t *record = (const configRecord_t *)p;
        if (record->size == 0
            || p + record->size >= &__config_end
            || record->size < sizeof(*record))
            break;
        if (pgN(reg) == record->pgn
            && (record->flags & CR_CLASSIFICATION_MASK) == classification)
            return record;
        p += record->size;
    }
    // record not found
    return NULL;
}

// Initialize all PG records from EEPROM.
// This functions processes all PGs sequentially, scanning EEPROM for each one. This is suboptimal,
//   but each PG is loaded/initialized exactly once and in defined order.
bool loadEEPROM(void)
{
    PG_FOREACH(reg) {
        configRecordFlags_e cls_start, cls_end;
        if (pgIsSystem(reg)) {
            cls_start = CR_CLASSICATION_SYSTEM;
            cls_end = CR_CLASSICATION_SYSTEM;
        } else {
            cls_start = CR_CLASSICATION_PROFILE1;
            cls_end = CR_CLASSICATION_PROFILE_LAST;
        }
        for (configRecordFlags_e cls = cls_start; cls <= cls_end; cls++) {
            int profileIndex = cls - cls_start;
            const configRecord_t *rec = findEEPROM(reg, cls);
            if (rec) {
                // config from EEPROM is available, use it to initialize PG. pgLoad will handle version mismatch
                pgLoad(reg, profileIndex, rec->pg, rec->size - offsetof(configRecord_t, pg), rec->version);
            } else {
                pgReset(reg, profileIndex);
            }
        }
    }
    return true;
}

static bool writeSettingsToEEPROM(void)
{
    config_streamer_t streamer;
    config_streamer_init(&streamer);

    config_streamer_start(&streamer, (uintptr_t)&__config_start, &__config_end - &__config_start);

    configHeader_t header = {
        .eepromConfigVersion =  EEPROM_CONF_VERSION,
        .magic_be =             0xBE,
        .boardIdentifier =      TARGET_BOARD_IDENTIFIER,
    };

    config_streamer_write(&streamer, (uint8_t *)&header, sizeof(header));
    uint16_t crc = CRC_START_VALUE;
    crc = crc16_ccitt_update(crc, (uint8_t *)&header, sizeof(header));
#ifndef USE_PARAMETER_GROUPS
    // write the transitional masterConfig record
    config_streamer_write(&streamer, (uint8_t *)&masterConfig, sizeof(masterConfig));
    crc = crc16_ccitt_update(crc, (uint8_t *)&masterConfig, sizeof(masterConfig));
#endif
    PG_FOREACH(reg) {
        const uint16_t regSize = pgSize(reg);
        configRecord_t record = {
            .size = sizeof(configRecord_t) + regSize,
            .pgn = pgN(reg),
            .version = pgVersion(reg),
            .flags = 0
        };

        if (pgIsSystem(reg)) {
            // write the only instance
            record.flags |= CR_CLASSICATION_SYSTEM;
            config_streamer_write(&streamer, (uint8_t *)&record, sizeof(record));
            crc = crc16_ccitt_update(crc, (uint8_t *)&record, sizeof(record));
            config_streamer_write(&streamer, reg->address, regSize);
            crc = crc16_ccitt_update(crc, reg->address, regSize);
        } else {
            // write one instance for each profile
            for (uint8_t profileIndex = 0; profileIndex < MAX_PROFILE_COUNT; profileIndex++) {
                record.flags = 0;

                record.flags |= ((profileIndex + 1) & CR_CLASSIFICATION_MASK);
                config_streamer_write(&streamer, (uint8_t *)&record, sizeof(record));
                crc = crc16_ccitt_update(crc, (uint8_t *)&record, sizeof(record));
                const uint8_t *address = reg->address + (regSize * profileIndex);
                config_streamer_write(&streamer, address, regSize);
                crc = crc16_ccitt_update(crc, address, regSize);
            }
        }
    }

    configFooter_t footer = {
        .terminator = 0,
    };

    config_streamer_write(&streamer, (uint8_t *)&footer, sizeof(footer));
    crc = crc16_ccitt_update(crc, (uint8_t *)&footer, sizeof(footer));

    // include inverted CRC in big endian format in the CRC
    const uint16_t invertedBigEndianCrc = ~(((crc & 0xFF) << 8) | (crc >> 8));
    config_streamer_write(&streamer, (uint8_t *)&invertedBigEndianCrc, sizeof(crc));

    config_streamer_flush(&streamer);

    const bool success = config_streamer_finish(&streamer) == 0;

    return success;
}

void writeConfigToEEPROM(void)
{
    bool success = false;
    // write it
    for (int attempt = 0; attempt < 3 && !success; attempt++) {
        if (writeSettingsToEEPROM()) {
            success = true;
        }
    }

    if (success && isEEPROMContentValid()) {
        return;
    }

    // Flash write failed - just die now
    failureMode(FAILURE_FLASH_WRITE_FAILED);
}
