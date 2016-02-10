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

#include "stdbool.h"
#include "stdint.h"

#include <platform.h>

#include "drivers/gpio.h"
#include "drivers/timer.h"
#include "drivers/pwm_mapping.h"
#include "flight/mixer.h"

#include "build_config.h"

#if MAX_PWM_MOTORS != MAX_SUPPORTED_MOTORS
#error Motor configuration mismatch
#endif

#if MAX_PWM_SERVOS != MAX_SUPPORTED_SERVOS
#error Servo configuration mismatch
#endif
