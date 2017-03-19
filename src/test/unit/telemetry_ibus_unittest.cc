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
#include <string.h>

extern "C" {
#include <platform.h>
#include "config/parameter_group.h"
#include "drivers/serial.h"
#include "io/serial.h"
#include "fc/rc_controls.h"
#include "telemetry/telemetry.h"
#include "telemetry/ibus.h"
#include "sensors/gyro.h"
#include "sensors/battery.h"
#include "scheduler/scheduler.h"
#include "fc/fc_tasks.h"
}

#include "unittest_macros.h"
#include "gtest/gtest.h"


extern "C" {
    uint8_t testBatteryCellCount =3;
    int16_t rcCommand[4] = {0, 0, 0, 0};
    telemetryConfig_t telemetryConfig_System;
}

static int16_t gyroTemperature;
int16_t gyroGetTemperature(void) {
    return gyroTemperature;
}

static uint16_t vbat = 100;
uint16_t getVbat(void)
{
    return vbat;
}

#define SERIAL_BUFFER_SIZE 256

typedef struct serialPortStub_s {
    uint8_t buffer[SERIAL_BUFFER_SIZE];
    int pos = 0;
    int end = 0;
} serialPortStub_t;


static uint16_t testBatteryVoltage = 100;
uint16_t getBatteryVoltage(void)
{
    return testBatteryVoltage;
}

uint8_t getBatteryCellCount(void) {
    return testBatteryCellCount;
}

static serialPortStub_t serialWriteStub;
static serialPortStub_t serialReadStub;

#define SERIAL_PORT_DUMMY_IDENTIFIER  (serialPortIdentifier_e)0x1234
serialPort_t serialTestInstance;
serialPortConfig_t serialTestInstanceConfig = {
    .identifier = SERIAL_PORT_DUMMY_IDENTIFIER,
    .functionMask = 0
};

static serialPortConfig_t *findSerialPortConfig_stub_retval;
static portSharing_e determinePortSharing_stub_retval;
static bool portIsShared = false;
static bool openSerial_called = false;
static bool telemetryDetermineEnabledState_stub_retval;

void rescheduleTask(cfTaskId_e taskId, uint32_t newPeriodMicros)
{
    EXPECT_EQ(taskId, TASK_TELEMETRY);
    EXPECT_EQ(newPeriodMicros, 1000);
}



serialPortConfig_t *findSerialPortConfig(serialPortFunction_e function)
{
    EXPECT_EQ(function, FUNCTION_TELEMETRY_IBUS);
    return findSerialPortConfig_stub_retval;
}


portSharing_e determinePortSharing(const serialPortConfig_t *portConfig, serialPortFunction_e function)
{
    EXPECT_EQ(portConfig, findSerialPortConfig_stub_retval);
    EXPECT_EQ(function, FUNCTION_TELEMETRY_IBUS);
    return PORTSHARING_UNUSED;
}


bool telemetryDetermineEnabledState(portSharing_e portSharing)
{
    (void) portSharing;
    return telemetryDetermineEnabledState_stub_retval;
}


bool isSerialPortShared(const serialPortConfig_t *portConfig,
                        uint16_t functionMask,
                        serialPortFunction_e sharedWithFunction)
{
    EXPECT_EQ(portConfig, findSerialPortConfig_stub_retval);
    EXPECT_EQ(functionMask, FUNCTION_RX_SERIAL);
    EXPECT_EQ(sharedWithFunction, FUNCTION_TELEMETRY_IBUS);
    return portIsShared;
}


serialPortConfig_t *findSerialPortConfig(uint16_t mask)
{
    EXPECT_EQ(mask, FUNCTION_TELEMETRY_IBUS);
    return findSerialPortConfig_stub_retval ;
}


serialPort_t *openSerialPort(
    serialPortIdentifier_e identifier,
    serialPortFunction_e function,
    serialReceiveCallbackPtr callback,
    uint32_t baudrate,
    portMode_t mode,
    portOptions_t options
)
{
    openSerial_called = true;
    (void) callback;
    EXPECT_EQ(identifier, SERIAL_PORT_DUMMY_IDENTIFIER);
    EXPECT_EQ(options, SERIAL_BIDIR);
    EXPECT_EQ(function, FUNCTION_TELEMETRY_IBUS);
    EXPECT_EQ(baudrate, 115200);
    EXPECT_EQ(mode, MODE_RXTX);
    return &serialTestInstance;
}


void closeSerialPort(serialPort_t *serialPort)
{
    EXPECT_EQ(serialPort, &serialTestInstance);
}


void serialWrite(serialPort_t *instance, uint8_t ch)
{
    EXPECT_EQ(instance, &serialTestInstance);
    EXPECT_LT(serialWriteStub.pos, sizeof(serialWriteStub.buffer));
    serialWriteStub.buffer[serialWriteStub.pos++] = ch;
    serialReadStub.buffer[serialReadStub.end++] = ch; //characters echoes back on the shared wire
    //printf("w: %02d 0x%02x\n", serialWriteStub.pos, ch);
}


uint32_t serialRxBytesWaiting(const serialPort_t *instance)
{
    EXPECT_EQ(instance, &serialTestInstance);
    EXPECT_GE(serialReadStub.end, serialReadStub.pos);
    int ret = serialReadStub.end - serialReadStub.pos;
    if (ret < 0) {
        ret = 0;
    }
    //printf("serialRxBytesWaiting: %d\n", ret);
    return ret;
}


uint8_t serialRead(serialPort_t *instance)
{
    EXPECT_EQ(instance, &serialTestInstance);
    EXPECT_LT(serialReadStub.pos, serialReadStub.end);
    const uint8_t ch = serialReadStub.buffer[serialReadStub.pos++];
    return ch;
}


void serialTestResetBuffers()
{
    memset(&serialReadStub, 0, sizeof(serialReadStub));
    memset(&serialWriteStub, 0, sizeof(serialWriteStub));
}


void serialTestResetPort()
{
    portIsShared = false;
    openSerial_called = false;
    determinePortSharing_stub_retval = PORTSHARING_UNUSED;
    telemetryDetermineEnabledState_stub_retval = true;

    serialTestResetBuffers();
}



class IbusTelemteryInitUnitTest : public ::testing::Test
{
protected:
    virtual void SetUp()
    {
        serialTestResetPort();
    }
};


TEST_F(IbusTelemteryInitUnitTest, Test_IbusInitNotEnabled)
{
    findSerialPortConfig_stub_retval = NULL;
    telemetryDetermineEnabledState_stub_retval = false;

    //given stuff in serial read
    serialReadStub.end++;

    //when initializing and polling ibus
    initIbusTelemetry();
    checkIbusTelemetryState();
    handleIbusTelemetry();

    //then nothing is read from serial port
    EXPECT_NE(serialReadStub.pos, serialReadStub.end);
    EXPECT_FALSE(openSerial_called);
}


TEST_F(IbusTelemteryInitUnitTest, Test_IbusInitEnabled)
{
    findSerialPortConfig_stub_retval = &serialTestInstanceConfig;

    //given stuff in serial read
    serialReadStub.end++;

    //when initializing and polling ibus
    initIbusTelemetry();
    checkIbusTelemetryState();
    handleIbusTelemetry();

    //then all is read from serial port
    EXPECT_EQ(serialReadStub.pos, serialReadStub.end);
    EXPECT_TRUE(openSerial_called);
}


TEST_F(IbusTelemteryInitUnitTest, Test_IbusInitSerialRxAndTelemetryEnabled)
{
    findSerialPortConfig_stub_retval = &serialTestInstanceConfig;

    //given stuff in serial read
    serialReadStub.end++;
    //and serial rx enabled too
    portIsShared = true;

    //when initializing and polling ibus
    initIbusTelemetry();
    checkIbusTelemetryState();
    handleIbusTelemetry();

    //then all is read from serial port
    EXPECT_NE(serialReadStub.pos, serialReadStub.end);
    EXPECT_FALSE(openSerial_called);
}

class IbusTelemetryProtocolUnitTestBase : public ::testing::Test
{
protected:
    virtual void SetUp()
    {
        serialTestResetPort();
        telemetryConfigMutable()->report_cell_voltage = false;
        serialTestResetBuffers();
        initIbusTelemetry();
        checkIbusTelemetryState();
    }

    void checkResponseToCommand(const char *rx, uint8_t rxCnt, const char *expectedTx, uint8_t expectedTxCnt)
    {
        serialTestResetBuffers();

        memcpy(serialReadStub.buffer, rx, rxCnt);
        serialReadStub.end += rxCnt;

        //when polling ibus
        for (int i = 0; i<10; i++) {
            handleIbusTelemetry();
        }

        EXPECT_EQ(expectedTxCnt, serialWriteStub.pos);
        EXPECT_EQ(0, memcmp(serialWriteStub.buffer, expectedTx, expectedTxCnt));
    }

    void setupBaseAddressOne(void)
    {
        checkResponseToCommand("\x04\x81\x7a\xff", 4, "\x04\x81\x7a\xff", 4);
        serialTestResetBuffers();
    }

    void setupBaseAddressThree(void)
    {
        checkResponseToCommand("\x04\x83\x78\xff", 4, "\x04\x83\x78\xff", 4);
        serialTestResetBuffers();
    }
};



class IbusTelemteryProtocolUnitTest : public ::IbusTelemetryProtocolUnitTestBase
{
protected:
    virtual void SetUp()
    {
        IbusTelemetryProtocolUnitTestBase::SetUp();
        setupBaseAddressOne();
    }
};


TEST_F(IbusTelemteryProtocolUnitTest, Test_IbusNoRespondToDiscoveryCrcErr)
{
    //Given ibus command: Hello sensor at address 1, are you there (with bad crc)?
    //then we do not respond
    checkResponseToCommand("\x04\x81\x00\x00", 4, NULL, 0);
}


TEST_F(IbusTelemteryProtocolUnitTest, Test_IbusRespondToDiscovery)
{
    //Given ibus command: Hello sensor at address 1, are you there?
    //then we respond with: Yes, i'm here, hello!
    checkResponseToCommand("\x04\x81\x7a\xff", 4, "\x04\x81\x7A\xFF", 4);
}


TEST_F(IbusTelemteryProtocolUnitTest, Test_IbusRespondToSensorTypeQueryVbatt)
{
    //Given ibus command: Sensor at address 1, what type are you?
    //then we respond with: I'm a voltage sensor
    checkResponseToCommand("\x04\x91\x6A\xFF", 4, "\x06\x91\x03\x02\x63\xFF", 6);
}


TEST_F(IbusTelemteryProtocolUnitTest, Test_IbusRespondToSensorTypeQueryTemperature)
{
    //Given ibus command: Sensor at address 1, what type are you?
    //then we respond with: I'm a thermometer
    checkResponseToCommand("\x04\x92\x69\xFF", 4, "\x06\x92\x01\x02\x64\xFF", 6);
}


TEST_F(IbusTelemteryProtocolUnitTest, Test_IbusRespondToSensorTypeQueryRpm)
{
    //Given ibus command: Sensor at address 3, what type are you?
    //then we respond with: I'm a rpm sensor
    checkResponseToCommand("\x04\x93\x68\xFF", 4, "\x06\x93\x02\x02\x62\xFF", 6);
}


TEST_F(IbusTelemteryProtocolUnitTest, Test_IbusRespondToGetMeasurementVbattZero)
{
    //Given ibus command: Sensor at address 1, please send your measurement
    //then we respond with: I'm reading 0 volts
    testBatteryVoltage = 0;
    checkResponseToCommand("\x04\xA1\x5a\xff", 4, "\x06\xA1\x00\x00\x58\xFF", 6);
}

TEST_F(IbusTelemteryProtocolUnitTest, Test_IbusRespondToGetMeasurementVbattCellVoltage)
{
    telemetryConfigMutable()->report_cell_voltage = true;

    //Given ibus command: Sensor at address 1, please send your measurement
    //then we respond with: I'm reading 0.1 volts
    testBatteryCellCount =3;
    testBatteryVoltage = 30;
    checkResponseToCommand("\x04\xA1\x5a\xff", 4, "\x06\xA1\x64\x00\xf4\xFe", 6);

    //Given ibus command: Sensor at address 1, please send your measurement
    //then we respond with: I'm reading 0.1 volts
    testBatteryCellCount =1;
    testBatteryVoltage = 10;
    checkResponseToCommand("\x04\xA1\x5a\xff", 4, "\x06\xA1\x64\x00\xf4\xFe", 6);
}

TEST_F(IbusTelemteryProtocolUnitTest, Test_IbusRespondToGetMeasurementVbattPackVoltage)
{
    telemetryConfigMutable()->report_cell_voltage = false;

    //Given ibus command: Sensor at address 1, please send your measurement
    //then we respond with: I'm reading 0.1 volts
    testBatteryCellCount =3;
    testBatteryVoltage = 10;
    checkResponseToCommand("\x04\xA1\x5a\xff", 4, "\x06\xA1\x64\x00\xf4\xFe", 6);

    //Given ibus command: Sensor at address 1, please send your measurement
    //then we respond with: I'm reading 0.1 volts
    testBatteryCellCount =1;
    testBatteryVoltage = 10;
    checkResponseToCommand("\x04\xA1\x5a\xff", 4, "\x06\xA1\x64\x00\xf4\xFe", 6);
}


TEST_F(IbusTelemteryProtocolUnitTest, Test_IbusRespondToGetMeasurementTemperature)
{
    //Given ibus command: Sensor at address 2, please send your measurement
    //then we respond
    gyroTemperature = 50;
    checkResponseToCommand("\x04\xA2\x59\xff", 4, "\x06\xA2\x84\x03\xd0\xfe", 6);

    //Given ibus command: Sensor at address 2, please send your measurement
    //then we respond
    gyroTemperature = 59;  //test integer rounding
    checkResponseToCommand("\x04\xA2\x59\xff", 4, "\x06\xA2\xde\x03\x76\xfe", 6);

    //Given ibus command: Sensor at address 2, please send your measurement
    //then we respond
    gyroTemperature = 150;
    checkResponseToCommand("\x04\xA2\x59\xff", 4, "\x06\xA2\x6c\x07\xe4\xfe", 6);
}


TEST_F(IbusTelemteryProtocolUnitTest, Test_IbusRespondToGetMeasurementRpm)
{
    //Given ibus command: Sensor at address 3, please send your measurement
    //then we respond with: I'm reading 0 rpm
    rcCommand[THROTTLE] = 0;
    checkResponseToCommand("\x04\xA3\x58\xff", 4, "\x06\xA3\x00\x00\x56\xFF", 6);

    //Given ibus command: Sensor at address 3, please send your measurement
    //then we respond with: I'm reading 100 rpm
    rcCommand[THROTTLE] = 100;
    checkResponseToCommand("\x04\xA3\x58\xff", 4, "\x06\xA3\x64\x00\xf2\xFe", 6);
}



class IbusTelemteryProtocolUnitTestDaisyChained : public ::IbusTelemetryProtocolUnitTestBase
{
protected:
    virtual void SetUp()
    {
        IbusTelemetryProtocolUnitTestBase::SetUp();
        setupBaseAddressThree();
    }
};


TEST_F(IbusTelemteryProtocolUnitTestDaisyChained, Test_IbusRespondToDiscoveryBaseAddressThree)
{
    //Given ibus commands: Hello sensor at address 3, 4, 5 are you there?
    //then we respond with: Yes, we're here, hello!
    checkResponseToCommand("\x04\x83\x78\xff", 4, "\x04\x83\x78\xff", 4);
    checkResponseToCommand("\x04\x84\x77\xff", 4, "\x04\x84\x77\xff", 4);
    checkResponseToCommand("\x04\x85\x76\xff", 4, "\x04\x85\x76\xff", 4);
}


TEST_F(IbusTelemteryProtocolUnitTestDaisyChained, Test_IbusRespondToSensorTypeQueryWrongAddress)
{
    //Given ibus commands: Sensor at address 1, 2, 6, what type are you?
    //then we do not respond
    checkResponseToCommand("\x04\x91\x6A\xFF", 4, "", 0);
    checkResponseToCommand("\x04\x92\x69\xFF", 4, "", 0);

    checkResponseToCommand("\x04\x96\x65\xFF", 4, "", 0);
}


TEST_F(IbusTelemteryProtocolUnitTestDaisyChained, Test_IbusRespondToSensorTypeQueryVbattBaseThree)
{
    //Given ibus commands: Sensor at address 3, 4, 5, what type are you?
    //then we respond with: I'm a voltage sensor
    checkResponseToCommand("\x04\x93\x68\xFF", 4, "\x06\x93\x03\x02\x61\xFF", 6);
    //then we respond with: I'm a thermometer
    checkResponseToCommand("\x04\x94\x67\xFF", 4, "\x06\x94\x01\x02\x62\xFF", 6);
    //then we respond with: I'm a rpm sensor
    checkResponseToCommand("\x04\x95\x66\xFF", 4, "\x06\x95\x02\x02\x60\xFF", 6);
}


TEST_F(IbusTelemteryProtocolUnitTestDaisyChained, Test_IbusRespondToGetMeasurementsBaseThree)
{
    //Given ibus command: Sensor at address 3, please send your measurement
    //then we respond with: I'm reading 0.1 volts
    testBatteryCellCount = 1;
    testBatteryVoltage = 10;
    checkResponseToCommand("\x04\xA3\x58\xff", 4, "\x06\xA3\x64\x00\xf2\xfe", 6);

    //Given ibus command: Sensor at address 4, please send your measurement
    //then we respond
    gyroTemperature = 150;
    checkResponseToCommand("\x04\xA4\x57\xff", 4, "\x06\xA4\x6c\x07\xe2\xfe", 6);

    //Given ibus command: Sensor at address 5, please send your measurement
    //then we respond with: I'm reading 100 rpm
    rcCommand[THROTTLE] = 100;
    checkResponseToCommand("\x04\xA5\x56\xff", 4, "\x06\xA5\x64\x00\xf0\xFe", 6);
}
