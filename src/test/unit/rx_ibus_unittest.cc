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
#include <platform.h>
#include "config/parameter_group.h"
#include "drivers/system.h"
#include "drivers/serial.h"
#include "io/serial.h"
#include "rx/rx.h"
#include "rx/ibus.h"
#include "telemetry/ibus.h"
#include "telemetry/ibus_shared.h"
}

#include "unittest_macros.h"
#include "gtest/gtest.h"


uint32_t microseconds_stub_value = 0;
uint32_t micros(void)
{
    return microseconds_stub_value;
}


#define SERIAL_PORT_DUMMY_IDENTIFIER  (serialPortIdentifier_e)0x1234
static serialPort_t serialTestInstance;
static serialPortConfig_t serialTestInstanceConfig = {
    .identifier = SERIAL_PORT_DUMMY_IDENTIFIER,
    .functionMask = 0,
    .baudRates = { 0 }
};

static serialReceiveCallbackPtr stub_serialRxCallback;
static serialPortConfig_t *findSerialPortConfig_stub_retval;
static bool openSerial_called = false;
static bool portIsShared = false;

bool isSerialPortShared(
    serialPortConfig_t *portConfig,
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
    EXPECT_EQ(mask, FUNCTION_RX_SERIAL);
    return findSerialPortConfig_stub_retval ;
}

static portMode_t serialExpectedMode = MODE_RX;
static portOptions_t serialExpectedOptions = SERIAL_UNIDIR;

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
    EXPECT_FALSE(NULL == callback);
    EXPECT_EQ(identifier, SERIAL_PORT_DUMMY_IDENTIFIER);
    EXPECT_EQ(options, serialExpectedOptions);
    EXPECT_EQ(function, FUNCTION_RX_SERIAL);
    EXPECT_EQ(baudrate, 115200);
    EXPECT_EQ(mode, serialExpectedMode);
    stub_serialRxCallback = callback;
    return &serialTestInstance;
}


void serialTestResetPort()
{
    openSerial_called = false;
    stub_serialRxCallback = NULL;
    portIsShared = false;
    serialExpectedMode = MODE_RX;
    serialExpectedOptions = SERIAL_UNIDIR;
}

static bool isChecksumOkReturnValue = true;
bool isChecksumOk(const uint8_t *ibusPacket, const uint8_t length)
{
    (void) ibusPacket;
    (void) length;
    return isChecksumOkReturnValue;
}

static bool initSharedIbusTelemetryCalled = false;
void initSharedIbusTelemetry(serialPort_t * port)
{
    EXPECT_EQ(port, &serialTestInstance);
    initSharedIbusTelemetryCalled = true;
}

static bool    stubTelemetryCalled = false;
static uint8_t stubTelemetryPacket[100];
static uint8_t stubTelemetryIgnoreRxChars = 0;

uint8_t respondToIbusRequest(uint8_t const * const ibusPacket) {
    uint8_t len = ibusPacket[0];
    EXPECT_LT(len, sizeof(stubTelemetryPacket));
    memcpy(stubTelemetryPacket, ibusPacket, len);
    stubTelemetryCalled = true;
    return stubTelemetryIgnoreRxChars;
}

void resetStubTelemetry(void)
{
    memset(stubTelemetryPacket, 0, sizeof(stubTelemetryPacket));
    stubTelemetryCalled = false;
    stubTelemetryIgnoreRxChars = 0;
    initSharedIbusTelemetryCalled = false;
    isChecksumOkReturnValue = true;
}



class IbusRxInitUnitTest : public ::testing::Test
{
protected:
    virtual void SetUp()
    {
        serialTestResetPort();
    }
};


TEST_F(IbusRxInitUnitTest, Test_IbusRxNotEnabled)
{
    const rxConfig_t initialRxConfig = {};
    rxRuntimeConfig_t rxRuntimeConfig = {};
    findSerialPortConfig_stub_retval = NULL;

    EXPECT_FALSE(ibusInit(&initialRxConfig, &rxRuntimeConfig));

    EXPECT_FALSE(initSharedIbusTelemetryCalled);

    //TODO: Question: I'd expect that runtime conf was not initialized unless there was a serial port to run but the implementation states otherwise
    // EXPECT_EQ(0, rxRuntimeConfig.channelCount);
    // EXPECT_EQ(0, rxRuntimeConfig.rxRefreshRate);
    // EXPECT_EQ(NULL, rxRuntimeConfig.rcReadRawFn);
    // EXPECT_EQ(NULL, rxRuntimeConfig.rcFrameStatusFn);

    EXPECT_EQ(10, rxRuntimeConfig.channelCount);
    EXPECT_EQ(11000, rxRuntimeConfig.rxRefreshRate);
    EXPECT_FALSE(NULL == rxRuntimeConfig.rcReadRawFn);
    EXPECT_FALSE(NULL == rxRuntimeConfig.rcFrameStatusFn);
}


TEST_F(IbusRxInitUnitTest, Test_IbusRxEnabled)
{
    const rxConfig_t initialRxConfig = {};
    rxRuntimeConfig_t rxRuntimeConfig = {};
    findSerialPortConfig_stub_retval = &serialTestInstanceConfig;

    EXPECT_TRUE(ibusInit(&initialRxConfig, &rxRuntimeConfig));

    EXPECT_FALSE(initSharedIbusTelemetryCalled);

    EXPECT_EQ(10, rxRuntimeConfig.channelCount);
    EXPECT_EQ(11000, rxRuntimeConfig.rxRefreshRate);
    EXPECT_FALSE(NULL == rxRuntimeConfig.rcReadRawFn);
    EXPECT_FALSE(NULL == rxRuntimeConfig.rcFrameStatusFn);

    EXPECT_TRUE(openSerial_called);
}



class IbusTelemetryProtocolUnitTest : public ::testing::Test
{
protected:
    rxRuntimeConfig_t rxRuntimeConfig = {};
    virtual void SetUp()
    {
        serialTestResetPort();
        resetStubTelemetry();
        portIsShared = true;
        serialExpectedOptions = SERIAL_BIDIR;
        serialExpectedMode = MODE_RXTX;
        const rxConfig_t initialRxConfig = {};
        findSerialPortConfig_stub_retval = &serialTestInstanceConfig;

        EXPECT_TRUE(ibusInit(&initialRxConfig, &rxRuntimeConfig));
    
        EXPECT_TRUE(initSharedIbusTelemetryCalled);

        //handle that internal ibus position is not set to zero at init
        microseconds_stub_value += 5000;
        EXPECT_EQ(RX_FRAME_PENDING, ibusFrameStatus());
    }

    virtual void receivePacket(uint8_t const * const packet, const size_t length)
    {
        EXPECT_EQ(RX_FRAME_PENDING, ibusFrameStatus());
        for (size_t i=0; i < length; i++) {
            EXPECT_EQ(RX_FRAME_PENDING, ibusFrameStatus());
            stub_serialRxCallback(packet[i]);
        }
    }
};


TEST_F(IbusTelemetryProtocolUnitTest, Test_InitialFrameState)
{

    //TODO: ibusFrameStatus should return rxFrameState_t not uint8_t
    EXPECT_EQ(RX_FRAME_PENDING, ibusFrameStatus());

    //TODO: is it ok to have undefined channel values after init?
}


TEST_F(IbusTelemetryProtocolUnitTest, Test_OnePacketReceived)
{
    uint8_t packet[] = {0x20, 0x00, //length and reserved (unknown) bits
                        0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x04, 0x00, //channel 1..5
                        0x05, 0x00, 0x06, 0x00, 0x07, 0x00, 0x08, 0x00, 0x09, 0x00, //channel 6..10
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  //spare channels?
                        0xb2, 0xff}; //checksum

    receivePacket(packet, sizeof(packet));

    //report frame complete once
    EXPECT_EQ(RX_FRAME_COMPLETE, ibusFrameStatus());
    EXPECT_EQ(RX_FRAME_PENDING, ibusFrameStatus());

    //check that channel values have been updated
    for (int i=0; i<10; i++) {
        ASSERT_EQ(i, rxRuntimeConfig.rcReadRawFn(&rxRuntimeConfig, i));
    }
}


TEST_F(IbusTelemetryProtocolUnitTest, Test_OnePacketReceivedWithBadCrc)
{
    uint8_t packet[] = {0x20, 0x00, //length and reserved (unknown) bits
                        0x00, 0x33, 0x01, 0x33, 0x02, 0x33, 0x03, 0x33, 0x04, 0x33, //channel 1..5
                        0x05, 0x33, 0x06, 0x33, 0x07, 0x33, 0x08, 0x33, 0x09, 0x33, //channel 6..10
                        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  //spare channels?
                        0x00, 0x00}; //checksum

    isChecksumOkReturnValue = false;
    receivePacket(packet, sizeof(packet));

    //no frame complete
    EXPECT_EQ(RX_FRAME_PENDING, ibusFrameStatus());

    //check that channel values have not been updated
    for (int i=0; i<10; i++) {
        ASSERT_NE(i + (0x33 << 8), rxRuntimeConfig.rcReadRawFn(&rxRuntimeConfig, i));
    }
}


TEST_F(IbusTelemetryProtocolUnitTest, Test_HalfPacketReceived_then_interPacketGapReset)
{
    const uint8_t packet_half[] = {0x20, 0x00, //length and reserved (unknown) bits
                                    0x00, 0xab, 0x01, 0xab, 0x02, 0xab, 0x03, 0xab, 0x04, 0xab, //channel 1..5
                                    0x05, 0xab};
    const uint8_t packet_full[] = {0x20, 0x00, //length and reserved (unknown) bits 
                                    0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x04, 0x00, //channel 1..5
                                    0x05, 0x00, 0x06, 0x00, 0x07, 0x00, 0x08, 0x00, 0x09, 0x00, //channel 6..10
                                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  //spare channels?
                                    0xb2, 0xff}; //checksum

    receivePacket(packet_half, sizeof(packet_half));

    microseconds_stub_value += 5000;
    EXPECT_EQ(RX_FRAME_PENDING, ibusFrameStatus());
    
    receivePacket(packet_full, sizeof(packet_full));

    //report frame complete once
    EXPECT_EQ(RX_FRAME_COMPLETE, ibusFrameStatus());
    EXPECT_EQ(RX_FRAME_PENDING, ibusFrameStatus());

    //check that channel values have been updated with packet_full data
    for (int i=0; i<10; i++) {
        ASSERT_EQ(i, rxRuntimeConfig.rcReadRawFn(&rxRuntimeConfig, i));
    }
}


TEST_F(IbusTelemetryProtocolUnitTest, Test_OneTelemetryPacketReceived)
{
    uint8_t packet[] = {0x04, 0x81, 0x7a, 0xff}; //ibus sensor discovery 
    resetStubTelemetry();
    
    receivePacket(packet, sizeof(packet));

    //no frame complete signal to rx system, but telemetry system is called
    EXPECT_EQ(RX_FRAME_PENDING, ibusFrameStatus());
    EXPECT_TRUE(stubTelemetryCalled);
    EXPECT_TRUE( 0 == memcmp( stubTelemetryPacket, packet, sizeof(packet)));
}


TEST_F(IbusTelemetryProtocolUnitTest, Test_OneTelemetryIgnoreTxEchoToRx)
{
    uint8_t packet[] = {0x04, 0x81, 0x7a, 0xff}; //ibus sensor discovery 
    resetStubTelemetry();
    stubTelemetryIgnoreRxChars = 4;

    //given one packet received, that will respond with four characters to be ignored
    receivePacket(packet, sizeof(packet));
    ibusFrameStatus();
    EXPECT_TRUE(stubTelemetryCalled);

    //when those four bytes are sent and looped back 
    resetStubTelemetry();
    ibusFrameStatus();
    receivePacket(packet, sizeof(packet));

    //then they are ignored
    EXPECT_FALSE(stubTelemetryCalled);

    //and then next packet can be received    
    receivePacket(packet, sizeof(packet));
    ibusFrameStatus();
    EXPECT_TRUE(stubTelemetryCalled);
}

TEST_F(IbusTelemetryProtocolUnitTest, Test_OneTelemetryShouldNotIgnoreTxEchoAfterInterFrameGap)
{
    uint8_t packet[] = {0x04, 0x81, 0x7a, 0xff}; //ibus sensor discovery 
    resetStubTelemetry();
    stubTelemetryIgnoreRxChars = 4;

    //given one packet received, that will respond with four characters to be ignored
    receivePacket(packet, sizeof(packet));
    ibusFrameStatus();
    EXPECT_TRUE(stubTelemetryCalled);

    //when there is an interPacketGap
    microseconds_stub_value += 5000;
    resetStubTelemetry();
    ibusFrameStatus();

    //then next packet can be received    
    receivePacket(packet, sizeof(packet));
    ibusFrameStatus();
    EXPECT_TRUE(stubTelemetryCalled);
}
