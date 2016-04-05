/*
 * beeper.h
 *
 *  Created on: 5 avr. 2016
 *      Author: Administrateur
 */

#ifndef BEEPER_H_
#define BEEPER_H_

typedef struct beeperDisabledConfig_s {
    uint32_t disabledBeeperConditions;
} beeperDisabledConfig_t;

PG_DECLARE(beeperDisabledConfig_t, beeperDisabledConfig);

void beeperOffSet(uint32_t mask);
void beeperOffSetAll(uint8_t beeperCount);
void beeperOffClear(uint32_t mask);
void beeperOffClearAll(void);
uint32_t getBeeperOffMask(void);


#endif /* BEEPER_H_ */
