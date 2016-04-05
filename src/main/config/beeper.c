/*
 * beeper.c
 *
 *  Created on: 5 avr. 2016
 *      Author: Administrateur
 */

#include <stdbool.h>
#include <stdint.h>

#include <platform.h>

#include "config/parameter_group.h"
#include "config/parameter_group_ids.h"

#include "config/beeper.h"

PG_REGISTER(beeperDisabledConfig_t, beeperDisabledConfig, PG_BEEPER_CONFIG, 0);

void beeperOffSet(uint32_t mask)
{
	beeperDisabledConfig()->disabledBeeperConditions |= mask;
}

void beeperOffSetAll(uint8_t beeperCount)
{
	beeperDisabledConfig()->disabledBeeperConditions = (1 << beeperCount) -1;
}

void beeperOffClear(uint32_t mask)
{
	beeperDisabledConfig()->disabledBeeperConditions &= ~(mask);
}

void beeperOffClearAll(void)
{
	beeperDisabledConfig()->disabledBeeperConditions = 0;
}

uint32_t getBeeperOffMask(void)
{
    return beeperDisabledConfig()->disabledBeeperConditions;
}
