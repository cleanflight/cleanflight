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
#include <math.h>

#define V202_RC_CHANNEL_COUNT         11

#define V202_PROTOCOL_PAYLOAD_SIZE    16

#define V202_RF_BIND_CHANNEL           8
#define V202_RF_BIND_CHANNEL_COUNT     8
#define V202_RF_CHANNEL_COUNT         16

#define V202_FLAG_FLIP              0x04
#define V202_FLAG_VIDEO             0x02
#define V202_FLAG_PICTURE           0x01
#define V202_FLAG_LED               0x10
#define V202_FLAG_BIND              0xC0
#define V202_FLAG_HEADLESS        0x0200
#define V202_FLAG_MAG_CAL_X       0x0800
#define V202_FLAG_MAG_CAL_Y       0x2000


extern "C" {
    #include "build_config.h"
    #include "debug.h"

    #include "common/axis.h"
    #include "common/maths.h"

    #include "drivers/sensor.h"
    #include "drivers/rx_nrf24l01.h"

    #include "config/parameter_group.h"

    #include "rx/rx.h"
    #include "rx/nrf24.h"
    #include "rx/nrf24_v202.h"

    #include "config/runtime_config.h"
    #include "config/config_unittest.h"
}

#include "unittest_macros.h"
#include "gtest/gtest.h"


enum {
    PHASE_NOT_BOUND = 0,
    PHASE_BOUND
};

extern "C" {
    void v202Nrf24Init(nrf24_protocol_t protocol);
    void setRfChannelsForBind();

    extern const uint8_t rxTxAddr[];
    extern const uint8_t rxP1Addr[];
    extern uint8_t txid[3];
    extern uint8_t bind_phase;
    // radio channels for frequency hopping
    extern uint8_t rf_ch_num;
    extern uint8_t rf_channels[];
    extern const uint8_t v2x2_freq_hopping[][V202_RF_CHANNEL_COUNT];
}

#define RX_TX_ADDR_LEN     5
uint8_t nrf24Payload[NRF24L01_MAX_PAYLOAD_SIZE];
uint16_t nrf24RcData[MAX_SUPPORTED_RC_CHANNEL_COUNT];

// NRF24L01 emulation functions
uint8_t nrf24Registers[NRF24L01_1D_FEATURE + 1];
uint8_t nrf24MultiRegisters[3][RX_TX_ADDR_LEN];
uint8_t simulatedTxAddr[RX_TX_ADDR_LEN] = {0x00, 0x00, 0x00};
uint8_t simulatedTxChannel = 0;

uint8_t NRF24L01_WriteReg(uint8_t reg, uint8_t data)
{
    if (reg == NRF24L01_07_STATUS) {
        // writing to the STATUS register clears the bits written
        nrf24Registers[reg] &= ~data;
    } else {
        nrf24Registers[reg] = data;
    }
    return true;
}

uint8_t NRF24L01_ReadReg(uint8_t reg)
{
    if (reg == NRF24L01_07_STATUS) {
        uint8_t ret = nrf24Registers[reg];
        const uint8_t rxChannel = NRF24L01_ReadReg(NRF24L01_05_RF_CH);
        if (rxChannel == simulatedTxChannel) { // check the receiver is on the correct channel
            static uint8_t rxAddr[RX_TX_ADDR_LEN];
            NRF24L01_ReadRegisterMulti(NRF24L01_0A_RX_ADDR_P0, rxAddr, RX_TX_ADDR_LEN);
            if (memcmp(simulatedTxAddr, rxAddr, RX_TX_ADDR_LEN) == 0) { // check the receiver has the right address set
                return ret;
            }
        }
        return ret & ~BV(NRF24L01_07_STATUS_RX_DR);
    }
    return nrf24Registers[reg];
}

uint8_t NRF24L01_WriteRegisterMulti(uint8_t reg, const uint8_t *data, uint8_t length)
{
    switch (reg) {
    case NRF24L01_0A_RX_ADDR_P0:
        memcpy(nrf24MultiRegisters[0], data, length);
        break;
    case NRF24L01_0B_RX_ADDR_P1:
        memcpy(nrf24MultiRegisters[1], data, length);
        break;
    case NRF24L01_10_TX_ADDR:
        memcpy(nrf24MultiRegisters[2], data, length);
        break;
    }
    return 0;
}

uint8_t NRF24L01_ReadRegisterMulti(uint8_t reg, uint8_t *data, uint8_t length)
{
    switch (reg) {
    case NRF24L01_0A_RX_ADDR_P0:
        memcpy(data, nrf24MultiRegisters[0], length);
        break;
    case NRF24L01_0B_RX_ADDR_P1:
        memcpy(data, nrf24MultiRegisters[1], length);
        break;
    case NRF24L01_10_TX_ADDR:
        memcpy(data, nrf24MultiRegisters[2], length);
        break;
    }
    return 0;
}

uint8_t NRF24L01_WritePayload(const uint8_t *data, uint8_t length)
{
    memcpy(nrf24Payload, data, MIN(length, sizeof(nrf24Payload)));
    return true;
}

uint8_t NRF24L01_ReadPayload(uint8_t *data, uint8_t length)
{
    memcpy(data, nrf24Payload, length);
    // simulate one item in RX FIFO
    nrf24Registers[NRF24L01_17_FIFO_STATUS] |= BV(NRF24L01_17_FIFO_STATUS_RX_EMPTY);
    return true;
}

bool NRF24L01_IsRxDataReady(void)
{
    return NRF24L01_ReadReg(NRF24L01_07_STATUS) & BV(NRF24L01_07_STATUS_RX_DR);
}

bool NRF24L01_IsRxFifoEmpty(void)
{
    return NRF24L01_ReadReg(NRF24L01_17_FIFO_STATUS) & BV(NRF24L01_17_FIFO_STATUS_RX_EMPTY);
}

static void simulateTransmitPacket(uint8_t txChannel, const uint8_t *txAddr, const uint8_t *packet, int length)
{
    simulatedTxChannel = txChannel;
    memcpy(simulatedTxAddr, txAddr, RX_TX_ADDR_LEN);
    NRF24L01_WritePayload(packet, length);
    nrf24Registers[NRF24L01_07_STATUS] |= BV(NRF24L01_07_STATUS_RX_DR);
    nrf24Registers[NRF24L01_17_FIFO_STATUS] &= ~BV(NRF24L01_17_FIFO_STATUS_RX_EMPTY);
}


TEST(ProtocolV202Unittest, TestV202Init)
{
    v202Nrf24Init(NRF24RX_V202_1M);

    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_PWR_UP));
    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_PRIM_RX));
    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_CRCO));
    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_EN_CRC));
    EXPECT_EQ(NRF24L01_03_SETUP_AW_5BYTES, nrf24Registers[NRF24L01_03_SETUP_AW]);
    EXPECT_EQ(rf_channels[0], nrf24Registers[NRF24L01_05_RF_CH]);

    // 1Mbps
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_DR_HIGH));
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_DR_LOW));
    // NRF24L01_06_RF_SETUP_RF_PWR_n12dbm
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_HIGH));
    EXPECT_NE(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_LOW));

    EXPECT_EQ(0, nrf24Registers[NRF24L01_1C_DYNPD]);
}


static uint8_t convertFromPwmUnsigned(uint16_t pwm)
{
    const uint16_t ret = ((pwm - PWM_RANGE_MIDDLE) * 0xff / 500 + 0x100) >> 1;
    return (uint8_t)ret;
}

static uint8_t convertFromPwmSigned(uint16_t pwm)
{
    const uint8_t ret = convertFromPwmUnsigned(pwm);
    return ret < 0x80 ? 0x7f - ret : ret;
}

static void buildPacketV202(uint8_t bind, uint16_t roll, uint16_t pitch, uint16_t yaw, uint16_t throttle, uint16_t flags)
{
    memset(nrf24Payload, 0, NRF24L01_MAX_PAYLOAD_SIZE);
    nrf24Payload[7] = txid[0];
    nrf24Payload[8] = txid[1];
    nrf24Payload[9] = txid[2];
    if (bind) {
        nrf24Payload[14] = V202_FLAG_BIND;
    } else {
        nrf24Payload[0] = convertFromPwmUnsigned(throttle);
        nrf24Payload[1] = convertFromPwmSigned(yaw); // rudder
        nrf24Payload[2] = convertFromPwmSigned(pitch); // elevator
        nrf24Payload[3] = convertFromPwmSigned(roll); //aileron
        // set trims to midpoints
        nrf24Payload[4] = 0x40; // rudder trim
        nrf24Payload[5] = 0x40; // elevator trim
        nrf24Payload[6] = 0x40; // aileron trim
        nrf24Payload[10] = flags >> 8;
        nrf24Payload[14] = flags & 0xff;
    }
}


TEST(ProtocolV202Unittest, TestV202SetRcDataFromPayload)
{
    const int16_t tRoll = 1400;
    const int16_t tPitch = 1550;
    const int16_t tYaw = 1100;
    const int16_t tThrottle = 1900;
    const int16_t tFlags = V202_FLAG_PICTURE | V202_FLAG_VIDEO | V202_FLAG_FLIP;

    buildPacketV202(false, tRoll, tPitch, tYaw, tThrottle, tFlags);
    EXPECT_EQ(230, nrf24Payload[0]); // throttle
    EXPECT_EQ(101, nrf24Payload[1]); // rudder
    EXPECT_EQ(140, nrf24Payload[2]); // elevator
    EXPECT_EQ(25, nrf24Payload[3]); // aileron

    v202Nrf24Init(NRF24RX_V202_1M);
    simulateTransmitPacket(NRF24L01_ReadReg(NRF24L01_05_RF_CH), rxTxAddr, nrf24Payload, V202_PROTOCOL_PAYLOAD_SIZE);
    EXPECT_NE(0, NRF24L01_ReadReg(NRF24L01_07_STATUS) & BV(NRF24L01_07_STATUS_RX_DR));
    bind_phase = PHASE_BOUND;
    nrf24_received_t dataReceived = v202DataReceived(nrf24Payload);
    EXPECT_EQ(NRF24_RECEIVED_DATA, dataReceived);
    v202SetRcDataFromPayload(nrf24RcData, nrf24Payload);

    EXPECT_NEAR(tThrottle, nrf24RcData[NRF24_THROTTLE], 1);
    EXPECT_NEAR(tPitch, nrf24RcData[NRF24_PITCH], 1);
    EXPECT_NEAR(tYaw, nrf24RcData[NRF24_YAW], 2);
    EXPECT_NEAR(tRoll, nrf24RcData[NRF24_ROLL], 1);
    EXPECT_EQ(PWM_RANGE_MIN, nrf24RcData[NRF24_AUX1]); // LED
    EXPECT_EQ(PWM_RANGE_MAX, nrf24RcData[NRF24_AUX2]); // flip
    EXPECT_EQ(PWM_RANGE_MAX, nrf24RcData[NRF24_AUX3]); // picture
    EXPECT_EQ(PWM_RANGE_MAX, nrf24RcData[NRF24_AUX4]); // video
}

const uint8_t rxTxAddr[] = {0x66, 0x88, 0x68, 0x68, 0x68};

TEST(ProtocolV202Unittest, TestStateMachine_V202)
{
    v202Nrf24Init(NRF24RX_V202_1M);

    static const uint8_t bindPacket[V202_PROTOCOL_PAYLOAD_SIZE] =
        {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e | V202_FLAG_BIND, 0x0f};

    const uint8_t rxChannel = NRF24L01_ReadReg(NRF24L01_05_RF_CH);
    simulateTransmitPacket(rxChannel, rxTxAddr, bindPacket, V202_PROTOCOL_PAYLOAD_SIZE);
    EXPECT_NE(0, NRF24L01_ReadReg(NRF24L01_07_STATUS) & BV(NRF24L01_07_STATUS_RX_DR));

    EXPECT_EQ(true, NRF24L01_IsRxDataReady());
    EXPECT_EQ(false, NRF24L01_IsRxFifoEmpty());
    nrf24_received_t dataReceived = v202DataReceived(nrf24Payload);
    EXPECT_EQ(NRF24_RECEIVED_BIND, dataReceived);
    EXPECT_EQ(PHASE_BOUND, bind_phase);
    EXPECT_EQ(2, rf_ch_num);
    // check the txid has been set
    EXPECT_EQ(bindPacket[7], txid[0]);
    EXPECT_EQ(bindPacket[8], txid[1]);
    EXPECT_EQ(bindPacket[9], txid[2]);
}

TEST(ProtocolV202Unittest, TestStateMachine_DataState)
{
    v202Nrf24Init(NRF24RX_V202_1M);

    static const uint8_t bindPacket[V202_PROTOCOL_PAYLOAD_SIZE] =
        {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e | V202_FLAG_BIND, 0x0f};

    NRF24L01_SetChannel(rf_channels[rf_ch_num]);
    simulateTransmitPacket(rf_channels[rf_ch_num], rxTxAddr, bindPacket, V202_PROTOCOL_PAYLOAD_SIZE);
    nrf24_received_t dataReceived = v202DataReceived(nrf24Payload);
    EXPECT_EQ(NRF24_RECEIVED_BIND, dataReceived);
    EXPECT_EQ(PHASE_BOUND, bind_phase);
    EXPECT_EQ(2, rf_ch_num);
    // check the txid has been set
    EXPECT_EQ(bindPacket[7], txid[0]);
    EXPECT_EQ(bindPacket[8], txid[1]);
    EXPECT_EQ(bindPacket[9], txid[2]);

    // send another bind packet
    NRF24L01_SetChannel(rf_channels[rf_ch_num]);
    simulateTransmitPacket(rf_channels[rf_ch_num], rxTxAddr, bindPacket, V202_PROTOCOL_PAYLOAD_SIZE);
    dataReceived = v202DataReceived(nrf24Payload);
    EXPECT_EQ(NRF24_RECEIVED_BIND, dataReceived);
    EXPECT_EQ(PHASE_BOUND, bind_phase);
    EXPECT_EQ(3, rf_ch_num);
    // check the txid has been set
    EXPECT_EQ(bindPacket[7], txid[0]);
    EXPECT_EQ(bindPacket[8], txid[1]);
    EXPECT_EQ(bindPacket[9], txid[2]);

    static const uint8_t dataPacket[V202_PROTOCOL_PAYLOAD_SIZE] =
        {0x10, 0x21, 0x32, 0x43, 0x54, 0x65, 0x76, 0x07, 0x08, 0x09, 0xba, 0xcb, 0xdc, 0xed, 0xfe & ~V202_FLAG_BIND, 0xaf};
    // send a data packet
    NRF24L01_SetChannel(rf_channels[rf_ch_num]);
    simulateTransmitPacket(rf_channels[rf_ch_num], rxTxAddr, dataPacket, V202_PROTOCOL_PAYLOAD_SIZE);
    dataReceived = v202DataReceived(nrf24Payload);
    EXPECT_EQ(NRF24_RECEIVED_DATA, dataReceived);
    EXPECT_EQ(PHASE_BOUND, bind_phase);
    EXPECT_EQ(4, rf_ch_num); // channel index should have been reset
    // check the txid has been set
    EXPECT_EQ(dataPacket[7], txid[0]);
    EXPECT_EQ(dataPacket[8], txid[1]);
    EXPECT_EQ(dataPacket[9], txid[2]);

    // send a second data packet
    NRF24L01_SetChannel(rf_channels[rf_ch_num]);
    simulateTransmitPacket(rf_channels[rf_ch_num], rxTxAddr, dataPacket, V202_PROTOCOL_PAYLOAD_SIZE);
    dataReceived = v202DataReceived(nrf24Payload);
    EXPECT_EQ(NRF24_RECEIVED_DATA, dataReceived);
    EXPECT_EQ(PHASE_BOUND, bind_phase);
    EXPECT_EQ(5, rf_ch_num);
    // check the txid has been set
    EXPECT_EQ(dataPacket[7], txid[0]);
    EXPECT_EQ(dataPacket[8], txid[1]);
    EXPECT_EQ(dataPacket[9], txid[2]);
}

void setRfChannelsForBind(void)
{
    for(uint8_t ii = 0; ii < 8; ++ii) {
        uint8_t freq = 0x18 + (ii << 3);
        rf_channels[ii] = (freq & 0x0F) ? freq : freq - 3;
    }
}

TEST(ProtocolV202Unittest, Test_setRfBindChannels)
{
    const uint8_t rfBindChannels[8] = {0x18, 0x1d, 0x28, 0x2d, 0x38, 0x3d, 0x48, 0x4d};
    memset(rf_channels, 0, 8);
    setRfChannelsForBind();
    for (int ii = 0; ii < 8; ++ii) {
        EXPECT_EQ(rfBindChannels[ii], rf_channels[ii]);
    }
}


// STUBS

extern "C" {
void NRF24L01_FlushTx(void) {}
void NRF24L01_FlushRx(void) {}
void delayMicroseconds(uint32_t us) {UNUSED(us);}
void delay(uint32_t ms) {UNUSED(ms);}
uint32_t micros(void) {return 0;}
}
