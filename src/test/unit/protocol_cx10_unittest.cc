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

extern "C" {
    #include <platform.h>

    #include "build_config.h"
    #include "debug.h"

    #include "common/axis.h"
    #include "common/maths.h"

    #include "drivers/sensor.h"
    #include "drivers/rx_nrf24l01.h"

    #include "config/parameter_group.h"
    #include "config/parameter_group_ids.h"

    #include "rx/rx.h"
    #include "rx/nrf24.h"
    #include "rx/nrf24_cx10.h"

    #include "config/runtime_config.h"
    #include "config/config_unittest.h"
}

#include "unittest_macros.h"
#include "gtest/gtest.h"


typedef enum {
    STATE_BIND = 0,
    STATE_DATA
} protocol_state_t;

extern "C" {
    void cx10Nrf24Init(nrf24_protocol_t protocol);
    bool cx10CheckBindPacket(const uint8_t *packet);
    void setHoppingChannels(uint8_t* txId);
    // XN297 emulation layer
    uint8_t XN297_WritePayload(uint8_t* data, int len);
    uint8_t NRF24_WritePayload(uint8_t* data, int len);
    void XN297_UnscramblePayload(uint8_t* data, int len);

    extern protocol_state_t protocolState;
    extern const uint8_t rxTxAddr[];
    extern uint8_t txId[4];
    // radio channels for frequency hopping
    extern uint8_t cx10RfChannelIndex;
    extern uint8_t cx10RfChannels[];
}

#define CX10_PROTOCOL_PAYLOAD_SIZE       15
#define CX10A_PROTOCOL_PAYLOAD_SIZE      19

#define CX10_RF_BIND_CHANNEL           0x02

#define FLAG_FLIP       0x10 // goes to rudder channel
// flags1
#define FLAG_MODE_MASK  0x03
#define FLAG_HEADLESS   0x04
// flags2
#define FLAG_VIDEO      0x02
#define FLAG_PICTURE    0x04

#define RX_TX_ADDR_LEN     5
uint8_t nrf24Payload[NRF24L01_MAX_PAYLOAD_SIZE];

// NRF24L01 emulation functions
uint8_t nrf24Registers[NRF24L01_1D_FEATURE + 1];
uint8_t nrf24MultiRegisters[3][RX_TX_ADDR_LEN];
uint8_t simulatedTxAddr[RX_TX_ADDR_LEN] = {0x00, 0x00, 0x00, 0x00, 0x00};
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
        const uint8_t ret = nrf24Registers[reg];
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

enum {multiRegTx = 0, multiRegP0, multiRegP1};
uint8_t NRF24L01_WriteRegisterMulti(uint8_t reg, const uint8_t *data, uint8_t length)
{
    switch (reg) {
    case NRF24L01_0A_RX_ADDR_P0:
        memcpy(nrf24MultiRegisters[multiRegP0], data, length);
        break;
    case NRF24L01_0B_RX_ADDR_P1:
        memcpy(nrf24MultiRegisters[multiRegP1], data, length);
        break;
    case NRF24L01_10_TX_ADDR:
        memcpy(nrf24MultiRegisters[multiRegTx], data, length);
        break;
    }
    return 0;
}

uint8_t NRF24L01_ReadRegisterMulti(uint8_t reg, uint8_t *data, uint8_t length)
{
    switch (reg) {
    case NRF24L01_0A_RX_ADDR_P0:
        memcpy(data, nrf24MultiRegisters[multiRegP0], length);
        break;
    case NRF24L01_0B_RX_ADDR_P1:
        memcpy(data, nrf24MultiRegisters[multiRegP1], length);
        break;
    case NRF24L01_10_TX_ADDR:
        memcpy(data, nrf24MultiRegisters[multiRegTx], length);
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


TEST(ProtocolCX10Unittest, TestCX10Init)
{
    cx10Nrf24Init(NRF24RX_CX10A);

    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_PWR_UP));
    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_PRIM_RX));
    EXPECT_EQ(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_CRCO));
    EXPECT_EQ(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_EN_CRC));
    EXPECT_EQ(NRF24L01_03_SETUP_AW_5BYTES, nrf24Registers[NRF24L01_03_SETUP_AW]);
    EXPECT_EQ(CX10_RF_BIND_CHANNEL, nrf24Registers[NRF24L01_05_RF_CH]);

    // 1Mbps
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_DR_HIGH));
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_DR_LOW));
    // RF_PWR_n12dbm
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_HIGH));
    EXPECT_NE(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_LOW));

    EXPECT_EQ(0, nrf24Registers[NRF24L01_1C_DYNPD]);
}

static void buildPacketCX10(nrf24_protocol_t protocol, uint8_t bind, uint16_t roll, uint16_t pitch, uint16_t yaw, uint16_t throttle, uint16_t flags)
{
    memset(nrf24Payload, 0, NRF24L01_MAX_PAYLOAD_SIZE);
    const uint8_t offset = (protocol == NRF24RX_CX10) ? 0 : 4;
    nrf24Payload[0] = bind ? 0xaa : 0x55;
    nrf24Payload[1] = txId[0];
    nrf24Payload[2] = txId[1];
    nrf24Payload[3] = txId[2];
    nrf24Payload[4] = txId[3];
    // roll and pitch are reversed
    roll = 3000 - roll;
    pitch = 3000 - pitch;
    nrf24Payload[5+offset] = roll & 0xff;
    nrf24Payload[6+offset] = (roll >> 8) & 0xff;
    nrf24Payload[7+offset] = pitch & 0xff;
    nrf24Payload[8+offset] = (pitch >> 8) & 0xff;
    nrf24Payload[9+offset] = throttle & 0xff;
    nrf24Payload[10+offset] = (throttle >> 8) & 0xff;
    nrf24Payload[11+offset] = yaw & 0xff;
    nrf24Payload[12+offset] = ((yaw >> 8) & 0xff) | ((flags & FLAG_FLIP) >> 8);
}

TEST(ProtocolCX10Unittest, TestCX10SetRcDataFromPayload)
{
    uint16_t rcData[MAX_SUPPORTED_RC_CHANNEL_COUNT];
    const int16_t tRoll = 1400;
    const int16_t tPitch = 1500;
    const int16_t tYaw = 1600;
    const int16_t tThrottle = 1700;
    const int16_t tFlags = FLAG_HEADLESS | FLAG_PICTURE | FLAG_VIDEO;

    buildPacketCX10(NRF24RX_CX10A, false, tRoll, tPitch, tYaw, tThrottle, tFlags);

    cx10Nrf24Init(NRF24RX_CX10A);
    cx10SetRcDataFromPayload(rcData, nrf24Payload);

    EXPECT_NEAR(tThrottle, rcData[NRF24_THROTTLE], 1);
    EXPECT_NEAR(tPitch, rcData[NRF24_PITCH], 1);
    EXPECT_NEAR(tYaw, rcData[NRF24_YAW], 2);
    EXPECT_NEAR(tRoll, rcData[NRF24_ROLL], 1);
}

TEST(ProtocolCX10Unittest, TestCX10SetHoppingChannels)
{
    static const uint8_t bindPacket[] = {0xaa, 0xe5, 0x99, 0x56, 0x03};
    bool bind = cx10CheckBindPacket(bindPacket);
    EXPECT_EQ(true, bind);
    // check the txId has been set
    EXPECT_EQ(bindPacket[1], txId[0]);
    EXPECT_EQ(bindPacket[2], txId[1]);
    EXPECT_EQ(bindPacket[3], txId[2]);
    EXPECT_EQ(bindPacket[4], txId[3]);
    setHoppingChannels(txId);
    EXPECT_EQ(0, cx10RfChannelIndex);
    EXPECT_EQ(0x08, cx10RfChannels[0]);
    EXPECT_EQ(0x24, cx10RfChannels[1]);
    EXPECT_EQ(0x36, cx10RfChannels[2]);
    EXPECT_EQ(0x49, cx10RfChannels[3]);

    static const uint8_t bindPacket2[] = {0xaa, 0x1c, 0x01, 0x62, 0xbc};
    bind = cx10CheckBindPacket(bindPacket2);
    EXPECT_EQ(true, bind);
    setHoppingChannels(txId);
    EXPECT_EQ(0, cx10RfChannelIndex);
    EXPECT_EQ(0x0f, cx10RfChannels[0]);
    EXPECT_EQ(0x17, cx10RfChannels[1]);
    EXPECT_EQ(0x2e, cx10RfChannels[2]);
    EXPECT_EQ(0x40, cx10RfChannels[3]);
}

static uint8_t bitReverse(uint8_t bIn)
{
    uint8_t bOut = 0;
    for (int ii = 0; ii < 8; ++ii) {
        bOut = (bOut << 1) | (bIn & 1);
        bIn >>= 1;
    }
    return bOut;
}

static const uint16_t crcInitial    = 0xb5d2;

static uint16_t crc16_update(uint16_t crc, unsigned char a)
{
    static const uint16_t crcPolynomial = 0x1021;
    crc ^= a << 8;
    for (int i = 0; i < 8; ++i) {
        if (crc & 0x8000) {
            crc = (crc << 1) ^ crcPolynomial;
        } else {
            crc = crc << 1;
        }
    }
    return crc;
}

static const uint16_t xn297_crcXorout[] = {
    0x0000, 0x3448, 0x9BA7, 0x8BBB, 0x85E1, 0x3E8C, // 1st entry is missing, probably never needed
    0x451E, 0x18E6, 0x6B24, 0xE7AB, 0x3828, 0x8148, // it's used for 3-byte address w/ 0 byte payload only
    0xD461, 0xF494, 0x2503, 0x691D, 0xFE8B, 0x9BA7,
    0x8B17, 0x2920, 0x8B5F, 0x61B1, 0xD391, 0x7401,
    0x2138, 0x129F, 0xB3A0, 0x2988};

static const uint8_t xn297_scramble[35] = {
    0xe3, 0xb1, 0x4b, 0xea, 0x85, 0xbc, 0xe5, 0x66,
    0x0d, 0xae, 0x8c, 0x88, 0x12, 0x69, 0xee, 0x1f,
    0xc7, 0x62, 0x97, 0xd5, 0x0b, 0x79, 0xca, 0xcc,
    0x1b, 0x5d, 0x19, 0x10, 0x24, 0xd3, 0xdc, 0x3f,
    0x8e, 0xc5, 0x2f
};

void XN297_ScrambleRXAddr(uint8_t *buf, const uint8_t *addr, int len)
{
    uint8_t xn297_rx_addr[5];
    memcpy(buf, addr, len);
    memcpy(xn297_rx_addr, addr, len);
    for (int ii = 0; ii < RX_TX_ADDR_LEN; ++ii) {
        buf[ii] = xn297_rx_addr[ii] ^ xn297_scramble[RX_TX_ADDR_LEN - ii - 1];
    }
}

TEST(ProtocoCX102Unittest, Test_XN297_scrambleAddr)
{
    uint8_t buf[RX_TX_ADDR_LEN];
    const uint8_t rxTxAddr[RX_TX_ADDR_LEN] = {0xcc, 0xcc, 0xcc, 0xcc, 0xcc};
    const uint8_t rxTxAddrXN297[RX_TX_ADDR_LEN] = {0x49, 0x26, 0x87, 0x7d, 0x2f};

    XN297_ScrambleRXAddr(buf, rxTxAddr, RX_TX_ADDR_LEN);
    EXPECT_EQ(0, memcmp(rxTxAddrXN297, buf, RX_TX_ADDR_LEN));
}

void XN297_UnscramblePayloadTest(uint8_t* payload, int len)
{
    for(int ii = 0; ii < len; ++ii) {
        payload[ii] = bitReverse(payload[ii]) ^ bitReverse(xn297_scramble[ii + RX_TX_ADDR_LEN]);
    }
}

TEST(ProtocolCX10Unittest, Test_XN297_unScramblePayload)
{
    const int payloadLen = 10;
    const uint8_t payload[payloadLen] = {0xf1, 0xe2, 0xd3, 0xc4, 0xb5, 0xa6, 0x97, 0x88, 0x79};
    uint8_t buf[payloadLen];

    memcpy(buf, payload, payloadLen);
    XN297_UnscramblePayload(buf, payloadLen);
    EXPECT_EQ(0xb2, buf[0]);
    XN297_UnscramblePayload(buf, payloadLen);
    EXPECT_EQ(0x70, buf[0]);
}

TEST(ProtocolCX10Unittest, Test_XN297_CX10A_BindAck)
{
    const int payloadSize = CX10A_PROTOCOL_PAYLOAD_SIZE; // 19
    uint8_t payload[NRF24L01_MAX_PAYLOAD_SIZE];

    memset(payload, 0, NRF24L01_MAX_PAYLOAD_SIZE);

    const uint8_t ack = 0x01;
    const uint8_t ackIndex = 9 + RX_TX_ADDR_LEN;
    payload[ackIndex] =   bitReverse(ack) ^ xn297_scramble[RX_TX_ADDR_LEN + ackIndex];
    EXPECT_EQ(0x55, payload[ackIndex]);

    uint16_t crc = crcInitial;
    for (int i = 0; i < payloadSize; ++i) {
        crc = crc16_update(crc, payload[i]);
    }
    crc ^= xn297_crcXorout[RX_TX_ADDR_LEN - 3 + payloadSize];
    payload[payloadSize] = crc >> 8;
    payload[payloadSize + 1] = crc & 0xff;
    EXPECT_EQ(0x1d, payload[payloadSize]);
    EXPECT_EQ(0xc6, payload[payloadSize + 1]);
}


// STUBS

extern "C" {
void NRF24L01_FlushTx(void) {}
void NRF24L01_FlushRx(void) {}
void delayMicroseconds(uint32_t) {}
void delay(uint32_t) {}
uint32_t micros(void) {return 0;}
}
