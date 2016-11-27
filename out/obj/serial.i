# 1 "src/main/drivers/serial.c"
# 1 "/home/aravind/git/cleanflight//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "src/main/drivers/serial.c"
# 18 "src/main/drivers/serial.c"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdbool.h" 1 3 4
# 19 "src/main/drivers/serial.c" 2
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
# 20 "src/main/drivers/serial.c" 2

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
# 22 "src/main/drivers/serial.c" 2

# 1 "src/main/drivers/serial.h" 1
# 18 "src/main/drivers/serial.h"
       

typedef enum portMode_t {
    MODE_RX = 1 << 0,
    MODE_TX = 1 << 1,
    MODE_RXTX = MODE_RX | MODE_TX
} portMode_t;

typedef enum portOptions_t {
    SERIAL_NOT_INVERTED = 0 << 0,
    SERIAL_INVERTED = 1 << 0,
    SERIAL_STOPBITS_1 = 0 << 1,
    SERIAL_STOPBITS_2 = 1 << 1,
    SERIAL_PARITY_NO = 0 << 2,
    SERIAL_PARITY_EVEN = 1 << 2,
    SERIAL_UNIDIR = 0 << 3,
    SERIAL_BIDIR = 1 << 3
} portOptions_t;

typedef void (*serialReceiveCallbackPtr)(uint16_t data);

typedef struct serialPort_s {

    const struct serialPortVTable *vTable;

    uint8_t identifier;
    portMode_t mode;
    portOptions_t options;

    uint32_t baudRate;

    uint32_t rxBufferSize;
    uint32_t txBufferSize;
    volatile uint8_t *rxBuffer;
    volatile uint8_t *txBuffer;
    uint32_t rxBufferHead;
    uint32_t rxBufferTail;
    uint32_t txBufferHead;
    uint32_t txBufferTail;


    serialReceiveCallbackPtr callback;
} serialPort_t;

struct serialPortVTable {
    void (*serialWrite)(serialPort_t *instance, uint8_t ch);

    uint8_t (*serialTotalRxWaiting)(serialPort_t *instance);
    uint8_t (*serialTotalTxFree)(serialPort_t *instance);

    uint8_t (*serialRead)(serialPort_t *instance);


    void (*serialSetBaudRate)(serialPort_t *instance, uint32_t baudRate);

    
# 73 "src/main/drivers/serial.h" 3 4
   _Bool 
# 73 "src/main/drivers/serial.h"
        (*isSerialTransmitBufferEmpty)(serialPort_t *instance);

    void (*setMode)(serialPort_t *instance, portMode_t mode);

    void (*writeBuf)(serialPort_t *instance, void *data, int count);

    void (*beginWrite)(serialPort_t *instance);
    void (*endWrite)(serialPort_t *instance);
};

void serialWrite(serialPort_t *instance, uint8_t ch);
void serialWriteBuf(serialPort_t *instance, uint8_t *data, int count);
uint8_t serialRead(serialPort_t *instance);

void serialSetBaudRate(serialPort_t *instance, uint32_t baudRate);
void serialSetMode(serialPort_t *instance, portMode_t mode);


# 90 "src/main/drivers/serial.h" 3 4
_Bool 
# 90 "src/main/drivers/serial.h"
    isSerialTransmitBufferEmpty(serialPort_t *instance);
void serialPrint(serialPort_t *instance, const char *str);
uint32_t serialGetBaudRate(serialPort_t *instance);
uint8_t serialRxBytesWaiting(serialPort_t *instance);
uint8_t serialTxBytesFree(serialPort_t *instance);


void serialWriteBufShim(void *instance, uint8_t *data, int count);
void serialBeginWrite(serialPort_t *instance);
void serialEndWrite(serialPort_t *instance);
# 24 "src/main/drivers/serial.c" 2

void serialPrint(serialPort_t *instance, const char *str)
{
    uint8_t ch;
    while ((ch = *(str++)) != 0) {
        serialWrite(instance, ch);
    }
}

uint32_t serialGetBaudRate(serialPort_t *instance)
{
    return instance->baudRate;
}

void serialWrite(serialPort_t *instance, uint8_t ch)
{
    instance->vTable->serialWrite(instance, ch);
}


void serialWriteBuf(serialPort_t *instance, uint8_t *data, int count)
{
    if (instance->vTable->writeBuf) {
        instance->vTable->writeBuf(instance, data, count);
    } else {
        for (uint8_t *p = data; count > 0; count--, p++) {

            while (!serialTxBytesFree(instance)) {
            };

            serialWrite(instance, *p);
        }
    }
}

uint8_t serialRxBytesWaiting(serialPort_t *instance)
{
    return instance->vTable->serialTotalRxWaiting(instance);
}

uint8_t serialTxBytesFree(serialPort_t *instance)
{
    return instance->vTable->serialTotalTxFree(instance);
}

uint8_t serialRead(serialPort_t *instance)
{
    return instance->vTable->serialRead(instance);
}

void serialSetBaudRate(serialPort_t *instance, uint32_t baudRate)
{
    instance->vTable->serialSetBaudRate(instance, baudRate);
}


# 79 "src/main/drivers/serial.c" 3 4
_Bool 
# 79 "src/main/drivers/serial.c"
    isSerialTransmitBufferEmpty(serialPort_t *instance)
{
    return instance->vTable->isSerialTransmitBufferEmpty(instance);
}

void serialSetMode(serialPort_t *instance, portMode_t mode)
{
    instance->vTable->setMode(instance, mode);
}

void serialWriteBufShim(void *instance, uint8_t *data, int count)
{
    serialWriteBuf((serialPort_t *)instance, data, count);
}

void serialBeginWrite(serialPort_t *instance)
{
    if (instance->vTable->beginWrite)
        instance->vTable->beginWrite(instance);
}

void serialEndWrite(serialPort_t *instance)
{
    if (instance->vTable->endWrite)
        instance->vTable->endWrite(instance);
}
