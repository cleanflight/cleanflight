/*
 * tilt_arm_control.h
 *
 *  Created on: 13/mag/2015
 *      Author: mauro
 */

#pragma once

#define TILT_ARM_ENABLE_PITCH         (1<<1)
#define TILT_ARM_ENABLE_THRUST        (1<<2)
#define TILT_ARM_ENABLE_YAW_ROLL      (1<<3)
#define TILT_ARM_ENABLE_THRUST_BODY   (1<<4)

typedef struct tiltArmConfig_s {
    uint8_t flagEnabled; // b1 == pitch compensation, b10 == thrust compensation, b11 == yawRoll correction
    uint8_t pitchDivisior;
    uint8_t thrustLiftoff; // percent position of the stick
    uint8_t gearRatioPercent; //it has to be /100 before use. For example 0.75 is storead as 75
} tiltArmConfig_t;
