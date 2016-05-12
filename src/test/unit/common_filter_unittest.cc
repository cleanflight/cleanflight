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
    #include "common/filter.h"
}

#include "unittest_macros.h"
#include "gtest/gtest.h"

TEST(FilterUnittest, TestFilterApplyAverageInt)
{
#define VALUE_COUNT 4
    firFilterInt32_t filterState;
    int32_t valueState[VALUE_COUNT];

    firFilterInt32Init(&filterState, valueState, VALUE_COUNT, NULL);

    firFilterInt32Update(&filterState, 8);
    int average = firFilterInt32CalcAverage(&filterState);
    EXPECT_EQ(2, average); // 8/4
    EXPECT_EQ(8, valueState[0]);
    EXPECT_EQ(0, valueState[1]);

    firFilterInt32Update(&filterState, 16);
    average = firFilterInt32CalcAverage(&filterState);
    EXPECT_EQ(6, average); // (8+16)/4
    EXPECT_EQ(16, valueState[0]);
    EXPECT_EQ(8, valueState[1]);


    firFilterInt32Update(&filterState, 4);
    average = firFilterInt32CalcAverage(&filterState);
    EXPECT_EQ(7, average); // (8+16+4)/4
    EXPECT_EQ(4, valueState[0]);
    EXPECT_EQ(16, valueState[1]);
    EXPECT_EQ(8, valueState[2]);

    firFilterInt32Update(&filterState, -12);
    average = firFilterInt32CalcAverage(&filterState);
    EXPECT_EQ(4, average); // (8+16+4-12)/4
    EXPECT_EQ(-12, valueState[0]);
    EXPECT_EQ(4, valueState[1]);
    EXPECT_EQ(16, valueState[2]);
    EXPECT_EQ(8, valueState[3]);

    firFilterInt32Update(&filterState, 48);
    average = firFilterInt32CalcAverage(&filterState);
    EXPECT_EQ(14, average); // (16+4-12+48)/4
    EXPECT_EQ(48, valueState[0]);
    EXPECT_EQ(-12, valueState[1]);
    EXPECT_EQ(4, valueState[2]);
    EXPECT_EQ(16, valueState[3]);

    firFilterInt32Update(&filterState, 4);
    average = firFilterInt32CalcAverage(&filterState);
    EXPECT_EQ(11, average); // (4-12+48+4)/4
    EXPECT_EQ(4, valueState[0]);
    EXPECT_EQ(48, valueState[1]);
    EXPECT_EQ(-12, valueState[2]);
    EXPECT_EQ(4, valueState[3]);
}

TEST(FilterUnittest, TestFilterApplyAverageInt2)
{
#define VALUE_COUNT 4
    firFilterInt32_t filterState;
    int32_t valueState[3][VALUE_COUNT];

    firFilterInt32Init(&filterState, valueState[0], VALUE_COUNT, NULL);

    firFilterInt32Update(&filterState, 8);
    int average = firFilterInt32CalcAverage(&filterState);
    EXPECT_EQ(2, average); // 8/4
    EXPECT_EQ(8, valueState[0][0]);
    EXPECT_EQ(0, valueState[0][1]);

    firFilterInt32Update(&filterState, 16);
    average = firFilterInt32CalcAverage(&filterState);
    EXPECT_EQ(6, average); // (8+16)/4
    EXPECT_EQ(16, valueState[0][0]);
    EXPECT_EQ(8, valueState[0][1]);

}

TEST(FilterUnittest, TestFilterApplyAverage)
{
#define VALUE_COUNT 4
    firFilter_t filterState;
    float valueState[VALUE_COUNT];

    firFilterInit(&filterState, valueState, VALUE_COUNT, NULL);

    firFilterUpdate(&filterState, 8);
    float average = firFilterCalcAverage(&filterState);
    EXPECT_EQ(2, average); // 8/4
    EXPECT_EQ(8, valueState[0]);
    EXPECT_EQ(0, valueState[1]);

    firFilterUpdate(&filterState, 16);
    average = firFilterCalcAverage(&filterState);
    EXPECT_EQ(6, average); // (8+16)/4
    EXPECT_EQ(16, valueState[0]);
    EXPECT_EQ(8, valueState[1]);


    firFilterUpdate(&filterState, 4);
    average = firFilterCalcAverage(&filterState);
    EXPECT_EQ(7, average); // (8+16+4)/4
    EXPECT_EQ(4, valueState[0]);
    EXPECT_EQ(16, valueState[1]);
    EXPECT_EQ(8, valueState[2]);

    firFilterUpdate(&filterState, -12);
    average = firFilterCalcAverage(&filterState);
    EXPECT_EQ(4, average); // (8+16+4-12)/4
    EXPECT_EQ(-12, valueState[0]);
    EXPECT_EQ(4, valueState[1]);
    EXPECT_EQ(16, valueState[2]);
    EXPECT_EQ(8, valueState[3]);

    firFilterUpdate(&filterState, 48);
    average = firFilterCalcAverage(&filterState);
    EXPECT_EQ(14, average); // (16+4-12+48)/4
    EXPECT_EQ(48, valueState[0]);
    EXPECT_EQ(-12, valueState[1]);
    EXPECT_EQ(4, valueState[2]);
    EXPECT_EQ(16, valueState[3]);

    firFilterUpdate(&filterState, 4);
    average = firFilterCalcAverage(&filterState);
    EXPECT_EQ(11, average); // (4-12+48+4)/4
    EXPECT_EQ(4, valueState[0]);
    EXPECT_EQ(48, valueState[1]);
    EXPECT_EQ(-12, valueState[2]);
    EXPECT_EQ(4, valueState[3]);
}

