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

extern "C" {
    #include "common/huffman.h"
    extern int huffManLenIndex[HUFFMAN_TREE_SIZE];
}

#include "unittest_macros.h"
#include "gtest/gtest.h"

#define OUTBUF_LEN 128
static uint8_t outBuf[OUTBUF_LEN];

TEST(HuffmanUnittest, TestHuffmanEncode)
{
    #define INBUF_LEN1 3
    const uint8_t inBuf1[INBUF_LEN1] = {0,1,1};
    int len = huffmanEncodeBuf(outBuf, OUTBUF_LEN, inBuf1, INBUF_LEN1);
    EXPECT_EQ(1, len);
    EXPECT_EQ(0xed, (int)outBuf[0]); // 11101101

    #define INBUF_LEN2 4
    const uint8_t inBuf2[INBUF_LEN2] = {0,1,2,3};
    // 11 101 1001 10001
    // 1110 1100 1100 01
    // e    c    c    8
    len = huffmanEncodeBuf(outBuf, OUTBUF_LEN, inBuf2, INBUF_LEN2);
    EXPECT_EQ(2, len);
    EXPECT_EQ(0xec, (int)outBuf[0]);
    EXPECT_EQ(0xc4, (int)outBuf[1]);

    #define INBUF_LEN3 8
    const uint8_t inBuf3[INBUF_LEN3] = {0,1,2,3,4,5,6,7};
    // 11 101 1001 10001 10000 011101 011100 011011
    // 1110 1100 1100 0110 0000 1110 1011 1000 1101 1
    // e    c    c    6    0    e    b    8    d    8
    len = huffmanEncodeBuf(outBuf, OUTBUF_LEN, inBuf3, INBUF_LEN3);
    EXPECT_EQ(5, len);
    EXPECT_EQ(0xec, (int)outBuf[0]);
    EXPECT_EQ(0xc6, (int)outBuf[1]);
    EXPECT_EQ(0x0e, (int)outBuf[2]);
    EXPECT_EQ(0xb8, (int)outBuf[3]);
    EXPECT_EQ(0xd8, (int)outBuf[4]);
}


TEST(HuffmanUnittest, TestHuffmanDecode)
{
    int len;

    #define HUFF_BUF_LEN1 1
    #define HUFF_BUF_COUNT1 1
    const uint8_t inBuf1[HUFF_BUF_LEN1] = {0xc0}; // 11
    len = huffmanDecodeBuf(outBuf, OUTBUF_LEN, inBuf1, HUFF_BUF_LEN1, HUFF_BUF_COUNT1);
    EXPECT_EQ(1, len);
    EXPECT_EQ(0x00, (int)outBuf[0]);
    EXPECT_EQ(-1, huffManLenIndex[0]);
    EXPECT_EQ(-1, huffManLenIndex[1]);
    EXPECT_EQ(0, huffManLenIndex[2]);
    EXPECT_EQ(1, huffManLenIndex[3]);
    EXPECT_EQ(2, huffManLenIndex[4]);
    EXPECT_EQ(3, huffManLenIndex[5]);
    EXPECT_EQ(6, huffManLenIndex[6]);
    EXPECT_EQ(11, huffManLenIndex[7]);

    #define HUFF_BUF_LEN2 1
    #define HUFF_BUF_COUNT2 3
    const uint8_t inBuf2[HUFF_BUF_LEN2] = {0xed}; // 11 101 101
    len = huffmanDecodeBuf(outBuf, OUTBUF_LEN, inBuf2, INBUF_LEN2, HUFF_BUF_COUNT2);
    EXPECT_EQ(3, len);
    EXPECT_EQ(0x00, (int)outBuf[0]);
    EXPECT_EQ(0x01, (int)outBuf[1]);
    EXPECT_EQ(0x01, (int)outBuf[2]);
}

// STUBS

extern "C" {
}
