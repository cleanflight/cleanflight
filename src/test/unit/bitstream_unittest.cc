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


extern "C" {
    #include "common/bitstream.h"
}

#include "unittest_macros.h"
#include "gtest/gtest.h"


TEST(BitstreamUnittest, TestRead)
{
    int     bit_length = 4096;

    uint8_t buf[64 + bit_length/8];

    for( int start=0 ; start < 32 ; start++ ){

        for( int bit=15 ; bit < bit_length ; bit++ ){

            memset( buf , 0 , sizeof(buf) );
            buf[ start + bit/8 ] = 1 << (bit&7);

            if( bit==30 ){
                int a;
                a=11;
            }


            bitstream_t b;
            bitstream_init( &b , buf + start );

            int pos  = 0;


            while( pos < bit_length ){
                int size  = rand() % 33;
                int value = bitstream_read( &b , size );

               // printf("start=%d bit=%d pos=%d value=%d size=%d\n" , start , bit , pos , value , size );

                if(  pos <= bit  &&  pos + size > bit  ){
                    int want = 1 << (bit-pos);

                    ASSERT_EQ( value , want );
                }else{
                    ASSERT_EQ( value , 0 );
                }

                pos += size;
            }
        }
    }
}

