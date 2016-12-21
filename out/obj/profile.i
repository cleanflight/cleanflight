# 1 "src/main/config/profile.c"
# 1 "/home/aravind/git/cleanflight//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "src/main/config/profile.c"
# 18 "src/main/config/profile.c"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdbool.h" 1 3 4
# 19 "src/main/config/profile.c" 2
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
# 20 "src/main/config/profile.c" 2

# 1 "./src/main/platform.h" 1
# 18 "./src/main/platform.h"
       

# 1 "./src/main/target/edison/target.h" 1
# 17 "./src/main/target/edison/target.h"
       
# 200 "./src/main/target/edison/target.h"

# 200 "./src/main/target/edison/target.h"
uint32_t U_ID_0;
uint32_t U_ID_1;
uint32_t U_ID_2;
# 21 "./src/main/platform.h" 2
# 22 "src/main/config/profile.c" 2

# 1 "./src/main/build/build_config.h" 1
# 18 "./src/main/build/build_config.h"
       
# 24 "src/main/config/profile.c" 2

# 1 "./src/main/config/parameter_group.h" 1
# 18 "./src/main/config/parameter_group.h"
       


typedef uint16_t pgn_t;


typedef enum {
    PGRF_NONE = 0,
    PGRF_CLASSIFICATON_BIT = (1 << 0),
} pgRegistryFlags_e;

typedef enum {
    PGR_PGN_MASK = 0x0fff,
    PGR_PGN_VERSION_MASK = 0xf000,
    PGR_SIZE_MASK = 0x0fff,
    PGR_SIZE_SYSTEM_FLAG = 0x0000,
    PGR_SIZE_PROFILE_FLAG = 0x8000,
} pgRegistryInternal_e;


typedef void (pgResetFunc)(void * , int );

typedef struct pgRegistry_s {
    pgn_t pgn;
    uint16_t size;
    uint8_t *address;
    uint8_t **ptr;
    union {
        void *ptr;
        pgResetFunc *fn;
    } reset;
} pgRegistry_t;

static inline uint16_t pgN(const pgRegistry_t* reg) {return reg->pgn & PGR_PGN_MASK;}
static inline uint8_t pgVersion(const pgRegistry_t* reg) {return reg->pgn >> 12;}
static inline uint16_t pgSize(const pgRegistry_t* reg) {return reg->size & PGR_SIZE_MASK;}
static inline uint16_t pgIsSystem(const pgRegistry_t* reg) {return (reg->size & PGR_SIZE_PROFILE_FLAG) == 0;}
# 67 "./src/main/config/parameter_group.h"
    pgRegistry_t* __pg_registry_start;
    pgRegistry_t* __pg_registry_end;


    uint8_t* __pg_resetdata_start;
    uint8_t* __pg_resetdata_end;
# 227 "./src/main/config/parameter_group.h"
const pgRegistry_t* pgFind(pgn_t pgn);

void pgLoad(const pgRegistry_t* reg, int profileIndex, const void *from, int size, int version);
int pgStore(const pgRegistry_t* reg, void *to, int size, uint8_t profileIndex);
void pgResetAll(int profileCount);
void pgResetCurrent(const pgRegistry_t *reg);
void pgReset(const pgRegistry_t* reg, int profileIndex);
void pgActivateProfile(int profileIndex);
# 26 "src/main/config/profile.c" 2
# 1 "./src/main/config/parameter_group_ids.h" 1
# 27 "src/main/config/profile.c" 2

# 1 "./src/main/config/profile.h" 1
# 18 "./src/main/config/profile.h"
       



typedef struct profileSelection_s {
    uint8_t current_profile_index;
} profileSelection_t;

profileSelection_t profileSelection_System; static inline profileSelection_t* profileSelection(void) { return &profileSelection_System; } struct _dummy;

uint8_t getCurrentProfile(void);
void setProfile(uint8_t profileIndex);
# 29 "src/main/config/profile.c" 2

profileSelection_t profileSelection_System; extern const pgRegistry_t profileSelection_Registry; const pgRegistry_t profileSelection_Registry __attribute__ ((section(".pg_registry"), used, aligned(4))) = { .pgn = 23 | (0 << 12), .size = sizeof(profileSelection_t) | PGR_SIZE_SYSTEM_FLAG, .address = (uint8_t*)&profileSelection_System, .ptr = 0, .reset = {.ptr = 0}, };

uint8_t getCurrentProfile(void)
{
    return profileSelection()->current_profile_index;
}

void setProfile(uint8_t profileIndex)
{
    if (profileIndex >= 3)
        profileIndex = 0;

    profileSelection()->current_profile_index = profileIndex;
}
