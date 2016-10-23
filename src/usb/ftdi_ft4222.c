/*
 * Author: Henry Bruce <henry.bruce@intel.com>
 * Copyright (c) 2015 Intel Corporation.
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <sys/time.h>
#include <errno.h>
#include "linux/i2c-dev.h"
#include "common.h"
#include "ftd2xx.h"
#include "libft4222.h"
#include "usb/ftdi_ft4222.h"

#define PLATFORM_NAME "FTDI FT4222"
#define I2CM_ERROR(status) (((status) &0x02) != 0)
#define PCA9672_ADDR 0x20
#define PCA9555_ADDR 0x27
#define PCA9555_INPUT_REG 0
#define PCA9555_OUTPUT_REG 2
#define PCA9555_POLARITY_REG 4
#define PCA9555_DIRECTION_REG 6
#define PCA9545_ADDR 0x70
#define PCA9672_PINS 8
#define PCA9555_PINS 16
#define PCA9545_BUSSES 4
#define GPIO_PORT_IO_RESET GPIO_PORT2
#define GPIO_PORT_IO_INT GPIO_PORT3
#define MAX_IO_EXPANDER_PINS PCA9555_PINS

typedef enum {IO_EXP_NONE, IO_EXP_PCA9672, IO_EXP_PCA9555} ft4222_io_exp_type;
typedef enum {GPIO_TYPE_BUILTIN, GPIO_TYPE_PCA9672, GPIO_TYPE_PCA9555, GPIO_TYPE_UNKNOWN=99} ft4222_gpio_type;

static pthread_mutex_t ft4222_lock;
static FT_HANDLE ftHandleGpio = (FT_HANDLE) NULL; //GPIO Handle
static FT_HANDLE ftHandleI2c = (FT_HANDLE) NULL; //I2C/SPI Handle
static FT_HANDLE ftHandleSpi = (FT_HANDLE) NULL; //I2C/SPI Handle
static GPIO_Dir pinDirection[] = {GPIO_OUTPUT, GPIO_OUTPUT, GPIO_OUTPUT, GPIO_OUTPUT};
static uint8_t pca9672DirectionMask = 0;
static uint16_t pca9555OutputValue = 0;
static uint16_t pca9555DirectionValue = 0;
static int bus_speed = 400;
static int numFt4222GpioPins = 4;
static int numI2cGpioExpanderPins = 8;
static int numI2cSwitchBusses = 4;
static int currentI2cBus = 0;
static ft4222_io_exp_type gpio_expander_chip;
static mraa_boolean_t libft4222_load_success = TRUE;

FT_STATUS (*dl_FT_GetDeviceInfoList)(FT_DEVICE_LIST_INFO_NODE*, LPDWORD);
FT_STATUS (*dl_FT_CreateDeviceInfoList)(LPDWORD);
FT_STATUS (*dl_FT_OpenEx)(PVOID, DWORD, FT_HANDLE*);
FT4222_STATUS (*dl_FT4222_GetVersion)(FT_HANDLE, FT4222_Version*);
FT4222_STATUS (*dl_FT4222_I2CMaster_Write)(FT_HANDLE, uint16, uint8*, uint16, uint16*);
FT4222_STATUS (*dl_FT4222_I2CMaster_Reset)(FT_HANDLE);
FT4222_STATUS (*dl_FT4222_I2CMaster_Read)(FT_HANDLE, uint16, uint8*, uint16, uint16*);
FT4222_STATUS (*dl_FT4222_I2CMaster_Init)(FT_HANDLE, uint32);
FT4222_STATUS (*dl_FT4222_I2CMaster_GetStatus)(FT_HANDLE, uint8*);
FT4222_STATUS (*dl_FT4222_GPIO_Init)(FT_HANDLE, GPIO_Dir[4]);
FT4222_STATUS (*dl_FT4222_GPIO_GetTriggerStatus)(FT_HANDLE, GPIO_Port, uint16*);
FT4222_STATUS (*dl_FT4222_GPIO_ReadTriggerQueue)(FT_HANDLE, GPIO_Port, GPIO_Trigger*, uint16, uint16*);
FT4222_STATUS (*dl_FT4222_GPIO_Read)(FT_HANDLE, GPIO_Port, BOOL*);
FT4222_STATUS (*dl_FT4222_GPIO_SetInputTrigger)(FT_HANDLE, GPIO_Port, GPIO_Trigger);
FT4222_STATUS (*dl_FT4222_GPIO_Write)(FT_HANDLE, GPIO_Port, BOOL);
FT4222_STATUS (*dl_FT4222_SetWakeUpInterrupt)(FT_HANDLE, BOOL);
FT4222_STATUS (*dl_FT4222_SetSuspendOut)(FT_HANDLE, BOOL);
FT4222_STATUS (*dl_FT4222_SPIMaster_Init)(FT_HANDLE, FT4222_SPIMode, FT4222_SPIClock, FT4222_SPICPOL, FT4222_SPICPHA, uint8);

static void
mraa_ftdi_ft4222_sleep_ms(unsigned long mseconds)
{
    struct timespec sleepTime;

    sleepTime.tv_sec = mseconds / 1000;              // Number of seconds
    sleepTime.tv_nsec = (mseconds % 1000) * 1000000; // Convert fractional seconds to nanoseconds

    // Iterate nanosleep in a loop until the total sleep time is the original
    // value of the seconds parameter
    while ((nanosleep(&sleepTime, &sleepTime) != 0) && (errno == EINTR))
        ;
}

static unsigned int
mraa_ftdi_ft4222_get_tick_count_ms()
{
    static unsigned int startTick = 0;
    unsigned int ticks;
    struct timeval now;
    gettimeofday(&now, NULL);
    ticks = now.tv_sec * 1000;
    ticks += now.tv_usec / 1000;
    if (startTick == 0)
        startTick = ticks;
    return ticks - startTick;
}

void *
mraa_ftdi_ft4222_dlsym(const char *symbol)
{
    void *func = dlsym(libft4222_lib, symbol);
    if (func == NULL) {
        syslog(LOG_ERR, "%s", dlerror());
        libft4222_load_success = FALSE;
    }
    return func;
}


mraa_result_t
mraa_ftdi_ft4222_init()
{
    mraa_result_t mraaStatus = MRAA_ERROR_NO_RESOURCES;
    FT_DEVICE_LIST_INFO_NODE* devInfo = NULL;
    FT_STATUS ftStatus;
    DWORD numDevs = 0;
    int i;
    int retCode = 0;

    dl_FT_GetDeviceInfoList = mraa_ftdi_ft4222_dlsym("FT_GetDeviceInfoList");
    dl_FT_CreateDeviceInfoList = mraa_ftdi_ft4222_dlsym("FT_CreateDeviceInfoList");
    dl_FT4222_GetVersion = mraa_ftdi_ft4222_dlsym("FT4222_GetVersion");
    dl_FT4222_I2CMaster_Write = mraa_ftdi_ft4222_dlsym("FT4222_I2CMaster_Write");
    dl_FT4222_I2CMaster_Reset = mraa_ftdi_ft4222_dlsym("FT4222_I2CMaster_Reset");
    dl_FT4222_I2CMaster_Read = mraa_ftdi_ft4222_dlsym("FT4222_I2CMaster_Read");
    dl_FT4222_I2CMaster_Init = mraa_ftdi_ft4222_dlsym("FT4222_I2CMaster_Init");
    dl_FT4222_I2CMaster_GetStatus = mraa_ftdi_ft4222_dlsym("FT4222_I2CMaster_GetStatus");
    dl_FT4222_GPIO_Init = mraa_ftdi_ft4222_dlsym("FT4222_GPIO_Init");
    dl_FT4222_GPIO_GetTriggerStatus = mraa_ftdi_ft4222_dlsym("FT4222_GPIO_GetTriggerStatus");
    dl_FT4222_GPIO_ReadTriggerQueue = mraa_ftdi_ft4222_dlsym("FT4222_GPIO_ReadTriggerQueue");
    dl_FT4222_GPIO_Read = mraa_ftdi_ft4222_dlsym("FT4222_GPIO_Read");
    dl_FT4222_GPIO_SetInputTrigger = mraa_ftdi_ft4222_dlsym("FT4222_GPIO_SetInputTrigger");
    dl_FT4222_GPIO_Write = mraa_ftdi_ft4222_dlsym("FT4222_GPIO_Write");
    dl_FT4222_SetWakeUpInterrupt = mraa_ftdi_ft4222_dlsym("FT4222_SetWakeUpInterrupt");
    dl_FT4222_SetSuspendOut = mraa_ftdi_ft4222_dlsym("FT4222_SetSuspendOut");
    dl_FT4222_SPIMaster_Init = mraa_ftdi_ft4222_dlsym("FT4222_SPIMaster_Init");
    dl_FT_OpenEx = mraa_ftdi_ft4222_dlsym("FT_OpenEx");

    if (!libft4222_load_success) {
        syslog(LOG_ERR, "Failed to find all symbols for FTDI4222 support");
        goto init_exit;
    }

    ftStatus = dl_FT_CreateDeviceInfoList(&numDevs);
    if (ftStatus != FT_OK) {
        syslog(LOG_ERR, "FT_CreateDeviceInfoList failed: error code %d\n", ftStatus);
        goto init_exit;
    }

    devInfo = calloc((size_t) numDevs, sizeof(FT_DEVICE_LIST_INFO_NODE));
    if (devInfo == NULL) {
        syslog(LOG_ERR, "FT4222 allocation failure.\n");
        goto init_exit;
    }

    ftStatus = dl_FT_GetDeviceInfoList(devInfo, &numDevs);
    syslog(LOG_NOTICE, "FT_GetDeviceInfoList returned %d devices\n", numDevs);
    if (ftStatus != FT_OK) {
        syslog(LOG_ERR, "FT_GetDeviceInfoList failed (error code %d)\n", (int) ftStatus);
        goto init_exit;
    }
    if (numDevs < 2) {
        syslog(LOG_ERR, "No FT4222 devices connected.\n");
        goto init_exit;
    }
    if(numDevs > 2) {
        syslog(LOG_ERR, "CNFMODE not supported. Valid modes are 0 or 3.\n");
        goto init_exit;
    }

    // FIXME: Assumes just one physical FTDI device present
    DWORD locationIdI2c = 0;
    DWORD locationIdGpio = 0;
    if (devInfo[0].Type == FT_DEVICE_4222H_0)
            locationIdI2c = devInfo[0].LocId;
    if (devInfo[1].Type == FT_DEVICE_4222H_0)
            locationIdGpio = devInfo[1].LocId;

    if (locationIdI2c == 0) {
        syslog(LOG_ERR, "FT_GetDeviceInfoList contains no I2C controllers\n");
        goto init_exit;
    }

    if (locationIdGpio == 0) {
        syslog(LOG_ERR, "FT_GetDeviceInfoList contains no GPIO controllers\n");
        goto init_exit;
    }

    ftStatus = dl_FT_OpenEx((PVOID)(uintptr_t) locationIdI2c, FT_OPEN_BY_LOCATION, &ftHandleI2c);
    if (ftStatus != FT_OK) {
        syslog(LOG_ERR, "FT_OpenEx failed (error %d)\n", (int) ftStatus);
        goto init_exit;
    }

    ftStatus = dl_FT_OpenEx((PVOID)(uintptr_t) locationIdGpio, FT_OPEN_BY_LOCATION, &ftHandleGpio);
    if (ftStatus != FT_OK) {
        syslog(LOG_ERR, "FT_OpenEx failed (error %d)\n", (int) ftStatus);
        goto init_exit;
    }

    dl_FT4222_SetSuspendOut(ftHandleGpio, 0);
    dl_FT4222_SetWakeUpInterrupt(ftHandleGpio, 0);
    ftStatus =  dl_FT4222_GPIO_Init(ftHandleGpio, pinDirection);
    if (ftStatus != FT_OK) {
        syslog(LOG_ERR, "FT4222_GPIO_Init failed (error %d)\n", (int) ftStatus);
        mraaStatus = MRAA_ERROR_NO_RESOURCES;
        goto init_exit;
    }

    // Tell the FT4222 to be an I2C Master by default on init.
    FT4222_STATUS ft4222Status = dl_FT4222_I2CMaster_Init(ftHandleI2c, bus_speed);
    if (FT4222_OK != ft4222Status) {
        syslog(LOG_ERR, "FT4222_I2CMaster_Init failed (error %d)!\n", ft4222Status);
        goto init_exit;
    }

    ft4222Status = dl_FT4222_I2CMaster_Reset(ftHandleI2c);
    if (FT4222_OK != ft4222Status) {
        syslog(LOG_ERR, "FT4222_I2CMaster_Reset failed (error %d)!\n", ft4222Status);
        goto init_exit;
    }

    mraaStatus = MRAA_SUCCESS;

init_exit:
    if (devInfo != NULL)
        free(devInfo);
    if (mraaStatus == MRAA_SUCCESS)
        syslog(LOG_NOTICE, "mraa_ftdi_ft4222_init completed successfully\n");
    return mraaStatus;
}


mraa_result_t
mraa_ftdi_ft4222_get_version(unsigned int* versionChip, unsigned int* versionLib)
{
    if (ftHandleI2c != NULL) {
        FT4222_Version ft4222Version;
        FT4222_STATUS ft4222Status = dl_FT4222_GetVersion(ftHandleI2c, &ft4222Version);
        if (FT4222_OK == ft4222Status) {
            *versionChip = (unsigned int) ft4222Version.chipVersion;
            *versionLib = (unsigned int) ft4222Version.dllVersion;
            syslog(LOG_NOTICE, "FT4222_GetVersion %08X %08X\n", *versionChip, *versionLib);
            return MRAA_SUCCESS;
        } else {
            syslog(LOG_ERR, "FT4222_GetVersion failed (error %d)\n", (int) ft4222Status);
            return MRAA_ERROR_NO_RESOURCES;
        }
    } else {
        syslog(LOG_ERR, "Bad FT4222 handle\n");
        return MRAA_ERROR_INVALID_HANDLE;
    }
}


/******************* Private I2C functions *******************/

static void
mraa_ftdi_ft4222_i2c_log(char* msg, uint8_t addr, const uint8_t* data, int length)
{
    char buf[256];
    int pos = sprintf(buf, "%s: %#02x ", msg, addr);
    int i = 0;
    pos += sprintf(&buf[pos], "{");
    for (i = 0; i < length; ++i)
       pos += sprintf(&buf[pos], "%#02x ", data[i]);
    pos += sprintf(&buf[pos], "}");
    syslog(LOG_NOTICE, "%s", buf);
}


static int
mraa_ftdi_ft4222_i2c_read_internal(FT_HANDLE handle, uint8_t addr, uint8_t* data, int length)
{
    uint16 bytesRead = 0;
    uint8 controllerStatus;
    FT4222_STATUS ft4222Status = dl_FT4222_I2CMaster_Read(handle, addr, data, length, &bytesRead);
    // mraa_ftdi_ft4222_i2c_log("FT4222_I2CMaster_Read", addr, data, length);
    ft4222Status = dl_FT4222_I2CMaster_GetStatus(ftHandleI2c, &controllerStatus);
    if (FT4222_OK != ft4222Status || I2CM_ERROR(controllerStatus)) {
        syslog(LOG_ERR, "FT4222_I2CMaster_Read failed for address %#02x. Code %d", addr, controllerStatus);
        dl_FT4222_I2CMaster_Reset(handle);
        return 0;
    }
    // syslog(LOG_NOTICE, "FT4222_I2CMaster_Read completed");
    return bytesRead;
}

static int
mraa_ftdi_ft4222_i2c_write_internal(FT_HANDLE handle, uint8_t addr, const uint8_t* data, int bytesToWrite)
{
    uint16 bytesWritten = 0;
    uint8 controllerStatus;
    // mraa_ftdi_ft4222_i2c_log("FT4222_I2CMaster_Write", addr, data, bytesToWrite);
    FT4222_STATUS ft4222Status = dl_FT4222_I2CMaster_Write(handle, addr, (uint8_t*) data, bytesToWrite, &bytesWritten);
    ft4222Status = dl_FT4222_I2CMaster_GetStatus(ftHandleI2c, &controllerStatus);
    if (FT4222_OK != ft4222Status || I2CM_ERROR(controllerStatus)) {
        syslog(LOG_ERR, "FT4222_I2CMaster_Write failed address %#02x\n", addr);
        dl_FT4222_I2CMaster_Reset(handle);
        return 0;
    }
    if (bytesWritten != bytesToWrite)
        syslog(LOG_ERR, "FT4222_I2CMaster_Write wrote %u of %u bytes.\n", bytesWritten, bytesToWrite);

    // syslog(LOG_NOTICE, "FT4222_I2CMaster_Write completed");
    return bytesWritten;
}


// Function detects known I2C I/O expanders and returns the number of GPIO pins on expander
static int
mraa_ftdi_ft4222_detect_io_expander()
{
    uint8_t data;
    if (mraa_ftdi_ft4222_i2c_read_internal(ftHandleI2c, PCA9672_ADDR, &data, 1) == 1) {
        gpio_expander_chip = IO_EXP_PCA9672;
        return PCA9672_PINS;
    } else {
        uint8_t reg = PCA9555_INPUT_REG;
        mraa_ftdi_ft4222_i2c_write_internal(ftHandleI2c, PCA9555_ADDR, &reg, 1);
        if (mraa_ftdi_ft4222_i2c_read_internal(ftHandleI2c, PCA9555_ADDR, &data, 1) == 1) {
            gpio_expander_chip = IO_EXP_PCA9555;
            reg = PCA9555_OUTPUT_REG;
            mraa_ftdi_ft4222_i2c_write_internal(ftHandleI2c, PCA9555_ADDR, &reg, 1);
            mraa_ftdi_ft4222_i2c_read_internal(ftHandleI2c, PCA9555_ADDR, (uint8_t*)&pca9555OutputValue, 2);
            reg = PCA9555_DIRECTION_REG;
            mraa_ftdi_ft4222_i2c_write_internal(ftHandleI2c, PCA9555_ADDR, &reg, 1);
            mraa_ftdi_ft4222_i2c_read_internal(ftHandleI2c, PCA9555_ADDR, (uint8_t*)&pca9555DirectionValue, 2);
            return PCA9555_PINS;
        }
    }
    gpio_expander_chip = IO_EXP_NONE;
    return 0;
}


static ft4222_gpio_type
mraa_ftdi_ft4222_get_gpio_type(int pin)
{
    if (pin < numFt4222GpioPins) {
        return GPIO_TYPE_BUILTIN;
    } else switch (gpio_expander_chip) {
        case IO_EXP_PCA9672:
            return GPIO_TYPE_PCA9672;
        case GPIO_TYPE_PCA9555:
            return GPIO_TYPE_PCA9555;
        default:
            return GPIO_TYPE_UNKNOWN;
    }
}


static mraa_result_t
ftdi_ft4222_set_internal_gpio_dir(int pin, GPIO_Dir direction)
{
    pinDirection[pin] = direction;
    if (dl_FT4222_GPIO_Init(ftHandleGpio, pinDirection) != FT4222_OK)
        return MRAA_ERROR_UNSPECIFIED;
    else
        return MRAA_SUCCESS;
}


static mraa_result_t
mraa_ftdi_ft4222_gpio_set_pca9672_dir(int pin, mraa_gpio_dir_t dir)
{
    uint8_t mask = 1 << pin;
    switch (dir) {
        case MRAA_GPIO_IN:
                pca9672DirectionMask |= mask;
                int bytes_written = mraa_ftdi_ft4222_i2c_write_internal(ftHandleI2c, PCA9672_ADDR, &pca9672DirectionMask, 1);
                return bytes_written == 1 ? MRAA_SUCCESS : MRAA_ERROR_UNSPECIFIED;
        case MRAA_GPIO_OUT:
                pca9672DirectionMask &= (~mask);
                return MRAA_SUCCESS;
        default:
                return MRAA_ERROR_UNSPECIFIED;
    }
}


static mraa_result_t
mraa_ftdi_ft4222_gpio_set_pca9555_dir(int pin, mraa_gpio_dir_t dir)
{
    uint16_t mask = 1 << pin;
    switch (dir) {
        case MRAA_GPIO_IN:
                pca9555DirectionValue |= mask;
                break;
        case MRAA_GPIO_OUT:
                pca9555DirectionValue &= (~mask);
                break;
        default:
                return MRAA_ERROR_UNSPECIFIED;
    }
    uint8_t buf[3];
    buf[0] = PCA9555_DIRECTION_REG;
    buf[1] = (uint8_t)(pca9555DirectionValue & 0xFF);
    buf[2] = (uint8_t)(pca9555DirectionValue >> 8);
    pthread_mutex_lock(&ft4222_lock);
    int bytes_written = mraa_ftdi_ft4222_i2c_write_internal(ftHandleI2c, PCA9555_ADDR, buf, sizeof(buf));
    pthread_mutex_unlock(&ft4222_lock);
    return bytes_written == sizeof(buf) ? MRAA_SUCCESS : MRAA_ERROR_UNSPECIFIED;
}



static mraa_result_t
ftdi_ft4222_set_internal_gpio_trigger(int pin, GPIO_Trigger trigger)
{
    FT4222_STATUS ft4222Status = dl_FT4222_GPIO_SetInputTrigger(ftHandleGpio, pin, trigger);
    if (ft4222Status == FT4222_OK)
        return MRAA_SUCCESS;
    else
        return MRAA_ERROR_UNSPECIFIED;
}




// Function detects known I2C switches and returns the number of busses.
// On startup switch is disabled so default bus will be integrated i2c bus.
static int
mraa_ftdi_ft4222_detect_i2c_switch()
{
    uint8_t data;
    if(mraa_ftdi_ft4222_i2c_read_internal(ftHandleI2c, PCA9545_ADDR, &data, 1) == 1) {
        data = 0;
        return mraa_ftdi_ft4222_i2c_write_internal(ftHandleI2c, PCA9545_ADDR, &data, 1) == 1 ? PCA9545_BUSSES : 0;
    }
    return 0;
}


static mraa_result_t
mraa_ftdi_ft4222_i2c_select_bus(int bus)
{
    if (bus > 0 && bus != currentI2cBus) {
        syslog(LOG_NOTICE, "mraa_ftdi_ft4222_i2c_select_bus switching to bus %d", bus);
        uint8_t data;
        if (bus == 0)
            data = 0;
        else
            data = 1 << (bus-1);
        if (mraa_ftdi_ft4222_i2c_write_internal(ftHandleI2c, PCA9545_ADDR, &data, 1) == 1)
            currentI2cBus = bus;
        else
            return MRAA_ERROR_UNSPECIFIED;
    }
    return MRAA_SUCCESS;
}

static int
mraa_ftdi_ft4222_i2c_context_read(mraa_i2c_context dev, uint8_t* data, int length)
{
    int bytes_read = 0;
    if (mraa_ftdi_ft4222_i2c_select_bus(dev->busnum) == MRAA_SUCCESS)
        bytes_read = mraa_ftdi_ft4222_i2c_read_internal(dev->handle, dev->addr, data, length);
    return bytes_read;
}

static int
mraa_ftdi_ft4222_i2c_context_write(mraa_i2c_context dev, uint8_t* data, int length)
{
    int bytes_written = 0;
    if (mraa_ftdi_ft4222_i2c_select_bus(dev->busnum) == MRAA_SUCCESS)
        bytes_written = mraa_ftdi_ft4222_i2c_write_internal(dev->handle, dev->addr, data, length);
    return bytes_written;
}



/******************* I2C functions *******************/

static mraa_result_t
mraa_ftdi_ft4222_i2c_init_bus_replace(mraa_i2c_context dev)
{
    // Tell the FT4222 to be an I2C Master.
    FT4222_STATUS ft4222Status = dl_FT4222_I2CMaster_Init(ftHandleI2c, bus_speed);
    if (FT4222_OK != ft4222Status) {
        syslog(LOG_ERR, "FT4222_I2CMaster_Init failed (error %d)!\n", ft4222Status);
        return MRAA_ERROR_NO_RESOURCES;
    }

    // Reset the I2CM registers to a known state.
    ft4222Status = dl_FT4222_I2CMaster_Reset(ftHandleI2c);
    if (FT4222_OK != ft4222Status) {
        syslog(LOG_ERR, "FT4222_I2CMaster_Reset failed (error %d)!\n", ft4222Status);
        return MRAA_ERROR_NO_RESOURCES;
    }

    syslog(LOG_NOTICE, "I2C interface enabled GPIO0 and GPIO1 will be unavailable.\n");
    dev->handle = ftHandleI2c;
    dev->fh = -1;              // We don't use file descriptors
    dev->funcs = I2C_FUNC_I2C; // Advertise minimal i2c support as per
                               // https://www.kernel.org/doc/Documentation/i2c/functionality
    return MRAA_SUCCESS;
}


static mraa_result_t
mraa_ftdi_ft4222_i2c_frequency(mraa_i2c_context dev, mraa_i2c_mode_t mode)
{
    switch (mode) {
        case MRAA_I2C_STD: /**< up to 100Khz */
            bus_speed = 100;
            break;
        MRAA_I2C_FAST: /**< up to 400Khz */
            bus_speed = 400;
            break;
        MRAA_I2C_HIGH: /**< up to 3.4Mhz */
            bus_speed = 3400;
            break;
    }
    return dl_FT4222_I2CMaster_Init(ftHandleI2c, bus_speed) == FT4222_OK ? MRAA_SUCCESS : MRAA_ERROR_NO_RESOURCES;
}


static mraa_result_t
mraa_ftdi_ft4222_i2c_address(mraa_i2c_context dev, uint8_t addr)
{
    dev->addr = (int) addr;
    return MRAA_SUCCESS;
}


static int
mraa_ftdi_ft4222_i2c_read(mraa_i2c_context dev, uint8_t* data, int length)
{
    pthread_mutex_lock(&ft4222_lock);
    int bytes_read = mraa_ftdi_ft4222_i2c_read_internal(dev->handle, dev->addr, data, length);
    pthread_mutex_unlock(&ft4222_lock);
    return bytes_read;
}

static int
mraa_ftdi_ft4222_i2c_read_byte(mraa_i2c_context dev)
{
    uint8_t data;
    pthread_mutex_lock(&ft4222_lock);
    int bytes_read = mraa_ftdi_ft4222_i2c_context_read(dev, &data, 1);
    pthread_mutex_unlock(&ft4222_lock);
    return bytes_read == 1 ? data : -1;
}

static int
mraa_ftdi_ft4222_i2c_read_byte_data(mraa_i2c_context dev, uint8_t command)
{
    uint8_t data;
    int bytes_read = 0;
    pthread_mutex_lock(&ft4222_lock);
    uint16 bytesWritten = mraa_ftdi_ft4222_i2c_context_write(dev, &command, 1);
    if  (bytesWritten == 1)
       bytes_read = mraa_ftdi_ft4222_i2c_context_read(dev, &data, 1);
    pthread_mutex_unlock(&ft4222_lock);
    if (bytes_read == 1) {
        return (int) data;
    }
    return -1;
}

static int
mraa_ftdi_ft4222_i2c_read_word_data(mraa_i2c_context dev, uint8_t command)
{
    uint8_t buf[2];
    uint16_t data;
    int bytes_read = 0;
    pthread_mutex_lock(&ft4222_lock);
    int bytes_written = mraa_ftdi_ft4222_i2c_context_write(dev, &command, 1);
    if (bytes_written == 1)
       bytes_read = mraa_ftdi_ft4222_i2c_context_read(dev, buf, 2);
    pthread_mutex_unlock(&ft4222_lock);
    if (bytes_read == 2) {
        return (int) data;
    }
    return -1;
}

static int
mraa_ftdi_ft4222_i2c_read_bytes_data(mraa_i2c_context dev, uint8_t command, uint8_t* data, int length)
{
    int bytes_read = 0;
    pthread_mutex_lock(&ft4222_lock);
    int bytes_written = mraa_ftdi_ft4222_i2c_context_write(dev, &command, 1);
    if (bytes_written == 1)
       bytes_read = mraa_ftdi_ft4222_i2c_context_read(dev, data, length);
    pthread_mutex_unlock(&ft4222_lock);
    return bytes_read;
}

static mraa_result_t
mraa_ftdi_ft4222_i2c_write(mraa_i2c_context dev, const uint8_t* data, int bytesToWrite)
{
    pthread_mutex_lock(&ft4222_lock);
    uint16 bytesWritten = mraa_ftdi_ft4222_i2c_context_write(dev, (uint8_t*)data, bytesToWrite);
    pthread_mutex_unlock(&ft4222_lock);
    return bytesToWrite == bytesWritten ? MRAA_SUCCESS : MRAA_ERROR_INVALID_HANDLE;
}


static mraa_result_t
mraa_ftdi_ft4222_i2c_write_byte(mraa_i2c_context dev, uint8_t data)
{
    mraa_result_t status = mraa_ftdi_ft4222_i2c_write(dev, &data, 1);
    return status;
}

static mraa_result_t
mraa_ftdi_ft4222_i2c_write_byte_data(mraa_i2c_context dev, const uint8_t data, const uint8_t command)
{
    uint8_t buf[2];
    buf[0] = command;
    buf[1] = data;
    mraa_result_t status = mraa_ftdi_ft4222_i2c_write(dev, buf, 2);
    return status;
}

static mraa_result_t
mraa_ftdi_ft4222_i2c_write_word_data(mraa_i2c_context dev, const uint16_t data, const uint8_t command)
{
    uint8_t buf[3];
    buf[0] = command;
    buf[1] = (uint8_t) data;
    buf[2] = (uint8_t)(data >> 8);
    mraa_result_t status = mraa_ftdi_ft4222_i2c_write(dev, buf, 3);
    return status;
}

static mraa_result_t
mraa_ftdi_ft4222_i2c_stop(mraa_i2c_context dev)
{
    return MRAA_SUCCESS;
}

/******************* GPIO functions *******************/

static mraa_result_t
mraa_ftdi_ft4222_gpio_init_internal_replace(mraa_gpio_context dev, int pin)
{
    dev->phy_pin = (pin < numFt4222GpioPins) ? pin : pin - numFt4222GpioPins;
    if (pin < 2) {
        syslog(LOG_NOTICE, "Closing I2C interface to enable GPIO%d\n", pin);

        /* Replace with call to SPI init when SPI is fully implemented */
        FT4222_STATUS ft4222Status = dl_FT4222_SPIMaster_Init(ftHandleSpi, SPI_IO_SINGLE, CLK_DIV_4, CLK_IDLE_HIGH, CLK_LEADING, 0x01);
        if (FT4222_OK != ft4222Status){
            syslog(LOG_ERR, "Failed to close I2C interface and start SPI (error %d)!\n", ft4222Status);
            return MRAA_ERROR_NO_RESOURCES;
        }
    }
    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_ftdi_ft4222_gpio_mode_replace(mraa_gpio_context dev, mraa_gpio_mode_t mode)
{
    return MRAA_ERROR_FEATURE_NOT_IMPLEMENTED;
}

static mraa_result_t
mraa_ftdi_ft4222_gpio_edge_mode_replace(mraa_gpio_context dev, mraa_gpio_edge_t mode)
{
    switch (mraa_ftdi_ft4222_get_gpio_type(dev->pin)) {
        case GPIO_TYPE_BUILTIN:
            switch (mode) {
                case MRAA_GPIO_EDGE_NONE:
                    return ftdi_ft4222_set_internal_gpio_trigger(dev->pin, 0);
                case MRAA_GPIO_EDGE_BOTH:
                    return ftdi_ft4222_set_internal_gpio_trigger(dev->pin, GPIO_TRIGGER_RISING | GPIO_TRIGGER_FALLING);
                case MRAA_GPIO_EDGE_RISING:
                    return ftdi_ft4222_set_internal_gpio_trigger(dev->pin, GPIO_TRIGGER_RISING);
                case MRAA_GPIO_EDGE_FALLING:
                    return ftdi_ft4222_set_internal_gpio_trigger(dev->pin, GPIO_TRIGGER_FALLING);
                default:
                    return MRAA_ERROR_FEATURE_NOT_IMPLEMENTED;
            }
            break;
        case GPIO_TYPE_PCA9672:
        case GPIO_TYPE_PCA9555:
            return MRAA_SUCCESS;
        default:
            return MRAA_ERROR_INVALID_RESOURCE;
    }

}

static mraa_result_t
mraa_ftdi_ft4222_i2c_read_io_expander(uint16_t* value)
{
    int bytes_read = 0;
    uint8_t reg = PCA9555_INPUT_REG;
    pthread_mutex_lock(&ft4222_lock);
    switch (gpio_expander_chip) {
        case IO_EXP_PCA9672:
            bytes_read = mraa_ftdi_ft4222_i2c_read_internal(ftHandleI2c, PCA9672_ADDR, (uint8_t*)value, 1);
            break;
        case GPIO_TYPE_PCA9555:
            if (mraa_ftdi_ft4222_i2c_write_internal(ftHandleI2c, PCA9555_ADDR, &reg, 1) == 1)
                bytes_read = mraa_ftdi_ft4222_i2c_read_internal(ftHandleI2c, PCA9555_ADDR, (uint8_t*)value, 2);
            break;
        default:;
    }
    pthread_mutex_unlock(&ft4222_lock);
    return bytes_read > 0 ? MRAA_SUCCESS : MRAA_ERROR_UNSPECIFIED;
}

static int
mraa_ftdi_ft4222_gpio_read_replace(mraa_gpio_context dev)
{
    switch (mraa_ftdi_ft4222_get_gpio_type(dev->pin)) {
        case GPIO_TYPE_BUILTIN:
        {
            BOOL value;
            FT4222_STATUS ft4222Status = dl_FT4222_GPIO_Read(ftHandleGpio, dev->phy_pin, &value);
            if (FT4222_OK != ft4222Status) {
                syslog(LOG_ERR, "FT4222_GPIO_Read failed (error %d)!\n", ft4222Status);
                return -1;
            }
            return value;
        }
        case GPIO_TYPE_PCA9672:
        case GPIO_TYPE_PCA9555:
        {
            uint16_t mask = 1 << dev->phy_pin;
            uint16_t value;
            mraa_result_t res = mraa_ftdi_ft4222_i2c_read_io_expander(&value);
            return res == MRAA_SUCCESS ? (value & mask) == mask : -1;
        }
        default:
            return -1;
    }
}


static mraa_result_t
mraa_ftdi_ft4222_gpio_write_replace(mraa_gpio_context dev, int write_value)
{
    switch (mraa_ftdi_ft4222_get_gpio_type(dev->pin)) {
        case GPIO_TYPE_BUILTIN:
        {
            FT4222_STATUS ft4222Status = dl_FT4222_GPIO_Write(ftHandleGpio, dev->phy_pin, write_value);
            if (FT4222_OK != ft4222Status) {
                syslog(LOG_ERR, "FT4222_GPIO_Write failed (error %d)!\n", ft4222Status);
                return MRAA_ERROR_UNSPECIFIED;
            }
            return MRAA_SUCCESS;
        }
        case GPIO_TYPE_PCA9672:
        {
            uint8_t mask = 1 << dev->phy_pin;
            uint8_t value;
            int bytes_written = 0;
            pthread_mutex_lock(&ft4222_lock);
            int bytes_read = mraa_ftdi_ft4222_i2c_read_internal(ftHandleI2c, PCA9672_ADDR, &value, 1);
            if (bytes_read == 1) {
                if (write_value == 1)
                    value = value | mask | pca9672DirectionMask;
                else
                    value &= (~mask);
                bytes_written = mraa_ftdi_ft4222_i2c_write_internal(ftHandleI2c, PCA9672_ADDR, &value, 1);
            }
            pthread_mutex_unlock(&ft4222_lock);
            return bytes_written == 1 ? MRAA_SUCCESS : MRAA_ERROR_UNSPECIFIED;
        }
        case GPIO_TYPE_PCA9555:
        {
            uint16_t mask = 1 << dev->phy_pin;
            if (write_value)
                pca9555OutputValue |= mask;
            else
                pca9555OutputValue &= (~mask);
            uint8_t buf[3];
            buf[0] = PCA9555_OUTPUT_REG;
            buf[1] = (uint8_t)(pca9555OutputValue & 0xFF);
            buf[2] = (uint8_t)(pca9555OutputValue >> 8);
            pthread_mutex_lock(&ft4222_lock);
            int bytes_written = mraa_ftdi_ft4222_i2c_write_internal(ftHandleI2c, PCA9555_ADDR, buf, sizeof(buf));
            pthread_mutex_unlock(&ft4222_lock);
            return bytes_written == sizeof(buf) ? MRAA_SUCCESS : MRAA_ERROR_UNSPECIFIED;
        }
        default:
            return MRAA_ERROR_INVALID_RESOURCE;
    }
}


static mraa_result_t
mraa_ftdi_ft4222_gpio_dir_replace(mraa_gpio_context dev, mraa_gpio_dir_t dir)
{
    switch (mraa_ftdi_ft4222_get_gpio_type(dev->pin)) {
        case GPIO_TYPE_BUILTIN:
            switch (dir) {
                case MRAA_GPIO_IN:
                        return ftdi_ft4222_set_internal_gpio_dir(dev->phy_pin, GPIO_INPUT);
                case MRAA_GPIO_OUT:
                        return ftdi_ft4222_set_internal_gpio_dir(dev->phy_pin, GPIO_OUTPUT);
                case MRAA_GPIO_OUT_HIGH:
                        if (ftdi_ft4222_set_internal_gpio_dir(dev->phy_pin, GPIO_OUTPUT) != MRAA_SUCCESS)
                            return MRAA_ERROR_UNSPECIFIED;
                        return mraa_ftdi_ft4222_gpio_write_replace(dev, 1);
                case MRAA_GPIO_OUT_LOW:
                        if (ftdi_ft4222_set_internal_gpio_dir(dev->phy_pin, GPIO_OUTPUT) != MRAA_SUCCESS)
                            return MRAA_ERROR_UNSPECIFIED;
                        return mraa_ftdi_ft4222_gpio_write_replace(dev, 0);
                default:
                    return MRAA_ERROR_INVALID_PARAMETER;
            }
        case GPIO_TYPE_PCA9672:
            switch (dir) {
                case MRAA_GPIO_IN:
                case MRAA_GPIO_OUT:
                    return mraa_ftdi_ft4222_gpio_set_pca9672_dir(dev->phy_pin, dir);
                case MRAA_GPIO_OUT_HIGH:
                    if (mraa_ftdi_ft4222_gpio_set_pca9672_dir(dev->phy_pin, dir) != MRAA_SUCCESS)
                        return MRAA_ERROR_UNSPECIFIED;
                    return mraa_ftdi_ft4222_gpio_write_replace(dev, 1);
                case MRAA_GPIO_OUT_LOW:
                    if (mraa_ftdi_ft4222_gpio_set_pca9672_dir(dev->phy_pin, dir) != MRAA_SUCCESS)
                        return MRAA_ERROR_UNSPECIFIED;
                    return mraa_ftdi_ft4222_gpio_write_replace(dev, 0);
                default:
                    return MRAA_ERROR_INVALID_PARAMETER;
            }
        case GPIO_TYPE_PCA9555:
            switch (dir) {
                case MRAA_GPIO_IN:
                case MRAA_GPIO_OUT:
                    return mraa_ftdi_ft4222_gpio_set_pca9555_dir(dev->phy_pin, dir);
                case MRAA_GPIO_OUT_HIGH:
                    if (mraa_ftdi_ft4222_gpio_set_pca9555_dir(dev->phy_pin, dir) != MRAA_SUCCESS)
                        return MRAA_ERROR_UNSPECIFIED;
                    return mraa_ftdi_ft4222_gpio_write_replace(dev, 1);
                case MRAA_GPIO_OUT_LOW:
                    if (mraa_ftdi_ft4222_gpio_set_pca9555_dir(dev->phy_pin, dir) != MRAA_SUCCESS)
                        return MRAA_ERROR_UNSPECIFIED;
                    return mraa_ftdi_ft4222_gpio_write_replace(dev, 0);
                default:
                    return MRAA_ERROR_INVALID_PARAMETER;
            }
        default:
            return MRAA_ERROR_INVALID_RESOURCE;
    }
}

static mraa_boolean_t
mraa_ftdi_ft4222_has_internal_gpio_triggered(int pin)
{
    uint16 num_events = 0;
    FT4222_STATUS ft4222Status = dl_FT4222_GPIO_GetTriggerStatus(ftHandleGpio, pin, &num_events);
    if (num_events > 0) {
        int i;
        uint16 num_events_read;
        GPIO_Trigger event;
        for (i = 0; i < num_events; ++i)
            dl_FT4222_GPIO_ReadTriggerQueue(ftHandleGpio, pin, &event, 1, &num_events_read);
        return TRUE;
    } else
        return FALSE;
}

static struct {
    pthread_t thread;
    pthread_mutex_t mutex;
    mraa_boolean_t should_stop;
    mraa_boolean_t is_interrupt_detected[MAX_IO_EXPANDER_PINS];
    int num_active_pins;
} gpio_monitor = {0};

// INT pin of i2c PCA9672 GPIO expander is connected to FT4222 GPIO #3
// We use INT to detect any expander GPIO level change
static void*
mraa_ftdi_ft4222_gpio_monitor(void *arg)
{
    uint16_t prev_value = 0;
    mraa_ftdi_ft4222_i2c_read_io_expander(&prev_value);
    while (!gpio_monitor.should_stop) {
        mraa_boolean_t gpio_activity_detected = mraa_ftdi_ft4222_has_internal_gpio_triggered(GPIO_PORT_IO_INT);
        if (gpio_activity_detected) {
            uint16_t value;
            if (mraa_ftdi_ft4222_i2c_read_io_expander(&value) == MRAA_SUCCESS) {
                uint16_t change_value = prev_value ^ value;
                int i;
                pthread_mutex_lock(&gpio_monitor.mutex);
                for (i = 0; i < MAX_IO_EXPANDER_PINS; ++i) {
                    uint16_t mask = 1 << i;
                    gpio_monitor.is_interrupt_detected[i] = change_value & mask ? 1 : 0;
                }
                pthread_mutex_unlock(&gpio_monitor.mutex);
                prev_value = value;
            }
        }
        mraa_ftdi_ft4222_sleep_ms(20);
    }
}


static void
mraa_ftdi_ft4222_gpio_monitor_add_pin(int pin)
{
    if (gpio_monitor.num_active_pins == 0) {
        pthread_mutex_init(&gpio_monitor.mutex, NULL);
        pthread_create(&gpio_monitor.thread, NULL, mraa_ftdi_ft4222_gpio_monitor, NULL);
    }
    pthread_mutex_lock(&gpio_monitor.mutex);
    gpio_monitor.num_active_pins++;
    pthread_mutex_unlock(&gpio_monitor.mutex);
}


static void
mraa_ftdi_ft4222_gpio_monitor_remove_pin(int pin)
{
    pthread_mutex_lock(&gpio_monitor.mutex);
    gpio_monitor.num_active_pins--;
    if (gpio_monitor.num_active_pins == 0) {
        pthread_mutex_unlock(&gpio_monitor.mutex);
        gpio_monitor.should_stop = TRUE;
        pthread_join(gpio_monitor.thread, NULL);
        pthread_mutex_destroy(&gpio_monitor.mutex);
    } else
       pthread_mutex_unlock(&gpio_monitor.mutex);
}


static mraa_boolean_t
mraa_ftdi_ft4222_gpio_monitor_is_interrupt_detected(int pin)
{
    mraa_boolean_t is_interrupt_detected = FALSE;
    pthread_mutex_lock(&gpio_monitor.mutex);
    if (gpio_monitor.is_interrupt_detected[pin]) {
        gpio_monitor.is_interrupt_detected[pin] = FALSE;
        is_interrupt_detected = TRUE;
    }
    pthread_mutex_unlock(&gpio_monitor.mutex);
    return is_interrupt_detected;
}

static mraa_result_t
mraa_ftdi_ft4222_gpio_interrupt_handler_init_replace(mraa_gpio_context dev)
{
    switch (mraa_ftdi_ft4222_get_gpio_type(dev->pin)) {
        case GPIO_TYPE_BUILTIN:
            mraa_ftdi_ft4222_has_internal_gpio_triggered(dev->phy_pin);
            break;
        case GPIO_TYPE_PCA9672:
        case GPIO_TYPE_PCA9555:
            ftdi_ft4222_set_internal_gpio_dir(GPIO_PORT_IO_INT, GPIO_INPUT);
            ftdi_ft4222_set_internal_gpio_trigger(GPIO_PORT_IO_INT, GPIO_TRIGGER_FALLING);
            mraa_ftdi_ft4222_has_internal_gpio_triggered(GPIO_PORT_IO_INT);
            mraa_ftdi_ft4222_gpio_monitor_add_pin(dev->phy_pin);
            break;
    }
    return MRAA_SUCCESS;
}

static mraa_result_t
mraa_ftdi_ft4222_gpio_wait_interrupt_replace(mraa_gpio_context dev)
{
    int prev_level = mraa_ftdi_ft4222_gpio_read_replace(dev);
    ft4222_gpio_type gpio_type = mraa_ftdi_ft4222_get_gpio_type(dev->pin);
    mraa_boolean_t interrupt_detected = FALSE;

    while (!dev->isr_thread_terminating && !interrupt_detected) {
        switch (gpio_type) {
            case GPIO_TYPE_BUILTIN:
                interrupt_detected = mraa_ftdi_ft4222_has_internal_gpio_triggered(dev->phy_pin);
                break;
            case GPIO_TYPE_PCA9672:
            case GPIO_TYPE_PCA9555:
                interrupt_detected = mraa_ftdi_ft4222_gpio_monitor_is_interrupt_detected(dev->phy_pin);
                break;
            default:;
        }
        if (!interrupt_detected)
            mraa_ftdi_ft4222_sleep_ms(20);
    }
    if (dev->isr_thread_terminating)
        mraa_ftdi_ft4222_gpio_monitor_remove_pin(dev->phy_pin);
    return MRAA_SUCCESS;
}

static void
mraa_ftdi_ft4222_populate_i2c_func_table(mraa_adv_func_t* func_table)
{
    func_table->i2c_init_bus_replace = &mraa_ftdi_ft4222_i2c_init_bus_replace;
    func_table->i2c_set_frequency_replace = &mraa_ftdi_ft4222_i2c_frequency;
    func_table->i2c_address_replace = &mraa_ftdi_ft4222_i2c_address;
    func_table->i2c_read_replace = &mraa_ftdi_ft4222_i2c_read;
    func_table->i2c_read_byte_replace = &mraa_ftdi_ft4222_i2c_read_byte;
    func_table->i2c_read_byte_data_replace = &mraa_ftdi_ft4222_i2c_read_byte_data;
    func_table->i2c_read_word_data_replace = &mraa_ftdi_ft4222_i2c_read_word_data;
    func_table->i2c_read_bytes_data_replace = &mraa_ftdi_ft4222_i2c_read_bytes_data;
    func_table->i2c_write_replace = &mraa_ftdi_ft4222_i2c_write;
    func_table->i2c_write_byte_replace = &mraa_ftdi_ft4222_i2c_write_byte;
    func_table->i2c_write_byte_data_replace = &mraa_ftdi_ft4222_i2c_write_byte_data;
    func_table->i2c_write_word_data_replace = &mraa_ftdi_ft4222_i2c_write_word_data;
    func_table->i2c_stop_replace = &mraa_ftdi_ft4222_i2c_stop;
}

static void
mraa_ftdi_ft4222_populate_gpio_func_table(mraa_adv_func_t* func_table)
{
    func_table->gpio_init_internal_replace = &mraa_ftdi_ft4222_gpio_init_internal_replace;
    func_table->gpio_mode_replace = &mraa_ftdi_ft4222_gpio_mode_replace;
    func_table->gpio_edge_mode_replace = &mraa_ftdi_ft4222_gpio_edge_mode_replace;
    func_table->gpio_dir_replace = &mraa_ftdi_ft4222_gpio_dir_replace;
    func_table->gpio_read_replace = &mraa_ftdi_ft4222_gpio_read_replace;
    func_table->gpio_write_replace = &mraa_ftdi_ft4222_gpio_write_replace;
    func_table->gpio_interrupt_handler_init_replace = &mraa_ftdi_ft4222_gpio_interrupt_handler_init_replace;
    func_table->gpio_wait_interrupt_replace = &mraa_ftdi_ft4222_gpio_wait_interrupt_replace;
}


mraa_board_t*
mraa_ftdi_ft4222()
{
    mraa_board_t* sub_plat = (mraa_board_t*) calloc(1, sizeof(mraa_board_t));
    if (sub_plat == NULL)
        return NULL;
    numI2cGpioExpanderPins = mraa_ftdi_ft4222_detect_io_expander();
    int pinIndex = 0;
    int numUsbGpio = numFt4222GpioPins + numI2cGpioExpanderPins;
    int numI2cBusses = 1 + mraa_ftdi_ft4222_detect_i2c_switch();
    int numUsbPins = numUsbGpio + 2 * (numI2cBusses-1); // Add SDA and SCL for each i2c switch bus
    mraa_pincapabilities_t pinCapsI2c = (mraa_pincapabilities_t){ 1, 0, 0, 0, 0, 1, 0, 0 };
    mraa_pincapabilities_t pinCapsI2cGpio = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 1, 0, 0 };
    mraa_pincapabilities_t pinCapsGpio = (mraa_pincapabilities_t){ 1, 1, 0, 0, 0, 0, 0, 0 };

    sub_plat->platform_name = PLATFORM_NAME;
    sub_plat->phy_pin_count = numUsbPins;
    sub_plat->gpio_count = numUsbGpio;
    mraa_pininfo_t* pins = (mraa_pininfo_t*) calloc(numUsbPins,sizeof(mraa_pininfo_t));
    if (pins == NULL) {
        return NULL;
    }
    sub_plat->pins = pins;

    int bus = 0;
    sub_plat->i2c_bus_count = numI2cBusses;
    sub_plat->def_i2c_bus = bus;
    sub_plat->i2c_bus[bus].bus_id = bus;

    // I2c pins (these are virtual, entries are required to configure i2c layer)
    // We currently assume that GPIO 0/1 are reserved for i2c operation
    strncpy(sub_plat->pins[pinIndex].name, "IGPIO0/SCL0", MRAA_PIN_NAME_SIZE);
    sub_plat->pins[pinIndex].capabilities = pinCapsI2cGpio;
    sub_plat->pins[pinIndex].gpio.pinmap = pinIndex;
    sub_plat->pins[pinIndex].gpio.mux_total = 0;
    sub_plat->pins[pinIndex].i2c.mux_total = 0;
    sub_plat->i2c_bus[bus].scl = pinIndex;
    pinIndex++;
    strncpy(sub_plat->pins[pinIndex].name, "IGPIO1/SDA0", MRAA_PIN_NAME_SIZE);
    sub_plat->pins[pinIndex].capabilities = pinCapsI2cGpio;
    sub_plat->pins[pinIndex].gpio.pinmap = pinIndex;
    sub_plat->pins[pinIndex].gpio.mux_total = 0;
    sub_plat->pins[pinIndex].i2c.mux_total = 0;
    sub_plat->i2c_bus[bus].sda = pinIndex;
    pinIndex++;

    // FTDI4222 gpio
    strncpy(sub_plat->pins[pinIndex].name, "INT-GPIO2", MRAA_PIN_NAME_SIZE);
    sub_plat->pins[pinIndex].capabilities = pinCapsGpio;
    sub_plat->pins[pinIndex].gpio.pinmap = pinIndex;
    sub_plat->pins[pinIndex].gpio.mux_total = 0;
    pinIndex++;
    strncpy(sub_plat->pins[pinIndex].name, "INT-GPIO3", MRAA_PIN_NAME_SIZE);
    sub_plat->pins[pinIndex].capabilities = pinCapsGpio;
    sub_plat->pins[pinIndex].gpio.pinmap = pinIndex;
    sub_plat->pins[pinIndex].gpio.mux_total = 0;
    pinIndex++;

    // Virtual gpio pins on i2c I/O expander.
    int i;
    for (i = 0; i < numI2cGpioExpanderPins; ++i) {
        snprintf(sub_plat->pins[pinIndex].name, MRAA_PIN_NAME_SIZE, "EXP-GPIO%d", i);
        sub_plat->pins[pinIndex].capabilities = pinCapsGpio;
        sub_plat->pins[pinIndex].gpio.pinmap = pinIndex;
        sub_plat->pins[pinIndex].gpio.mux_total = 0;
        pinIndex++;
    }

    // Now add any extra i2c busses behind i2c switch
    for (bus = 1; bus < numI2cBusses; ++bus) {
        sub_plat->i2c_bus[bus].bus_id = bus;
        sub_plat->pins[pinIndex].i2c.mux_total = 0;
        snprintf(sub_plat->pins[pinIndex].name, MRAA_PIN_NAME_SIZE, "SDA%d", bus);
        sub_plat->pins[pinIndex].capabilities = pinCapsI2c;
        sub_plat->i2c_bus[bus].sda = pinIndex;
        pinIndex++;
        snprintf(sub_plat->pins[pinIndex].name, MRAA_PIN_NAME_SIZE, "SCL%d", bus);
        sub_plat->pins[pinIndex].capabilities = pinCapsI2c;
        sub_plat->pins[pinIndex].i2c.mux_total = 0;
        sub_plat->i2c_bus[bus].scl = pinIndex;
        pinIndex++;
    }

    // Set override functions
    mraa_adv_func_t* func_table = (mraa_adv_func_t*) calloc(1, sizeof(mraa_adv_func_t));
    if (func_table == NULL) {
        return NULL;
    }
    mraa_ftdi_ft4222_populate_i2c_func_table(func_table);
    mraa_ftdi_ft4222_populate_gpio_func_table(func_table);

    sub_plat->adv_func = func_table;

    if (pthread_mutex_init(&ft4222_lock, NULL) != 0) {
        syslog(LOG_ERR, "Could not create mutex for FT4222 access");
        return NULL;
    }

    return sub_plat;
}

