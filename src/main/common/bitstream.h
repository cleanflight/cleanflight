#include <stdint.h>

typedef struct bitstream_s{
    uint32_t* buf;
    uint32_t  acc;
    uint8_t   shift;
}bitstream_t;

void     bitstream_init( bitstream_t* s , void* ptr );
uint32_t bitstream_read( bitstream_t* s , uint8_t size );
