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

#include <stdint.h>
#include <stdbool.h>

#include <limits.h>

#include <math.h>

extern "C" {
#include "common/maths.h"
}

#include "unittest_macros.h"
#include "gtest/gtest.h"

TEST(EvilMacroUnittest, TestMinSideeffect)
{
    int i = 0, j = 0;
    // Left argument side-effects
    EXPECT_EQ(MIN(++i, 2), 2);
    // Right argument side-effects
    EXPECT_EQ(MIN(2, ++j), 2);
}

TEST(EvilMacroUnittest, TestMaxSideeffect)
{
    int i = 4, j = 4;
    // Left argument side-effects
    EXPECT_EQ(MAX(--i, 2), 2);
    // Right argument side-effects
    EXPECT_EQ(MIN(2, --j), 2);
}

TEST(EvilMacroUnittest, TestAbsSideeffect)
{
    int i = 2, j = -2;
    // Positive argument side-effects
    EXPECT_EQ(ABS(--i), 0);
    // Negative argument side-effects
    EXPECT_EQ(ABS(++j), 0);
}
