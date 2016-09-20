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

#include <stdint.h>

#define HUFFMAN_EOF (-1)

#define HUFFMAN_TABLE_SIZE 257 // 256 characters plus EOF
typedef struct huffmanTable_s {
    uint8_t     len;
    uint16_t    code;
} huffmanTable_t;

#define HUFFMAN_TREE_SIZE 257 // 256 characters plus EOF
typedef struct huffmanTree_s {
    int16_t     value;
    uint16_t    len;
    uint16_t    code;
} huffmanTree_t;


int huffmanEncodeBuf(uint8_t *outBuf, int outBufLen, const uint8_t *inBuf, int inLen);
int huffmanDecodeBuf(uint8_t *outBuf, int outBufLen, const uint8_t *inBuf, int inBufLen, int inBufCharacterCount);
