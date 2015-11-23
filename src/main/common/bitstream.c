#include "bitstream.h"


void bitstream_init( bitstream_t* s , void* ptr ){
    intptr_t p1 = (intptr_t)ptr;
    intptr_t p2 = p1 & ~3;

    s->buf   = (uint32_t*)p2;
    s->acc   = *s->buf;
    s->shift = (p1 - p2) << 3;
}


uint32_t bitstream_read( bitstream_t* s , uint8_t size ){

    uint32_t value     = 0;
    uint8_t  extracted = 0;

    do{
        if( s->shift == 32 ){
            s->acc   = *(++s->buf);
            s->shift = 0;
        }

        value |= (s->acc >> s->shift) << extracted;

        uint8_t step = 32 - s->shift;

        s->shift  += step;
        extracted += step;

    }while( extracted < size );

    s->shift -= extracted - size;

    if( size == 32 ){
        return value;
    }

    return value & ((1<<size) - 1);
}
