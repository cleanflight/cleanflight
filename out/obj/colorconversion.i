# 1 "src/main/common/colorconversion.c"
# 1 "/home/aravind/git/cleanflight//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "src/main/common/colorconversion.c"
# 18 "src/main/common/colorconversion.c"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h" 1 3 4
# 9 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h" 3 4
# 1 "/usr/include/stdint.h" 1 3 4
# 25 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 367 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 410 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 411 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 368 "/usr/include/features.h" 2 3 4
# 391 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 392 "/usr/include/features.h" 2 3 4
# 26 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wchar.h" 1 3 4
# 27 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/stdint.h" 2 3 4
# 36 "/usr/include/stdint.h" 3 4

# 36 "/usr/include/stdint.h" 3 4
typedef signed char int8_t;
typedef short int int16_t;
typedef int int32_t;

typedef long int int64_t;







typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;

typedef unsigned int uint32_t;



typedef unsigned long int uint64_t;
# 65 "/usr/include/stdint.h" 3 4
typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef int int_least32_t;

typedef long int int_least64_t;






typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;

typedef unsigned long int uint_least64_t;
# 90 "/usr/include/stdint.h" 3 4
typedef signed char int_fast8_t;

typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
# 103 "/usr/include/stdint.h" 3 4
typedef unsigned char uint_fast8_t;

typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
# 119 "/usr/include/stdint.h" 3 4
typedef long int intptr_t;


typedef unsigned long int uintptr_t;
# 134 "/usr/include/stdint.h" 3 4
typedef long int intmax_t;
typedef unsigned long int uintmax_t;
# 10 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h" 2 3 4
# 19 "src/main/common/colorconversion.c" 2

# 1 "src/main/common/color.h" 1
# 18 "src/main/common/color.h"
       



# 21 "src/main/common/color.h"
typedef enum {
    RGB_RED = 0,
    RGB_GREEN,
    RGB_BLUE
} colorComponent_e;



typedef union {
    struct {
        uint8_t r;
        uint8_t g;
        uint8_t b;
    } rgb;
    uint8_t raw[(RGB_BLUE + 1)];
} rgbColor24bpp_t;





typedef enum {
    HSV_HUE = 0,
    HSV_SATURATION,
    HSV_VALUE
} hsvColorComponent_e;



typedef struct hsvColor_s {
    uint16_t h;
    uint8_t s;
    uint8_t v;
} hsvColor_t;
# 21 "src/main/common/colorconversion.c" 2
# 1 "src/main/common/colorconversion.h" 1
# 17 "src/main/common/colorconversion.h"
       

rgbColor24bpp_t hsvToRgb24(const hsvColor_t *c);
# 22 "src/main/common/colorconversion.c" 2





rgbColor24bpp_t hsvToRgb24(const hsvColor_t* c)
{
    rgbColor24bpp_t r;

    int val = c->v;
    int isat = c->s;
    int hue = c->h;

    if (isat == 255) {
        r.rgb.r = val;
        r.rgb.g = val;
        r.rgb.b = val;
    } else {

        int base = (isat * val) / 256;


        int sector = hue / 60;
        hue = hue % 60;
        if(sector % 2)
            hue = 60 - hue;
        int itp = (((val - base) * hue) / 60) + base;

        switch (sector) {
            case 0:
                r.rgb.r = val;
                r.rgb.g = itp;
                r.rgb.b = base;
                break;

            case 1:
                r.rgb.r = itp;
                r.rgb.g = val;
                r.rgb.b = base;
                break;

            case 2:
                r.rgb.r = base;
                r.rgb.g = val;
                r.rgb.b = itp;
                break;

            case 3:
                r.rgb.r = base;
                r.rgb.g = itp;
                r.rgb.b = val;
                break;

            case 4:
                r.rgb.r = itp;
                r.rgb.g = base;
                r.rgb.b = val;
                break;

            case 5:
                r.rgb.r = val;
                r.rgb.g = base;
                r.rgb.b = itp;
                break;
        }
    }
    return r;
}
