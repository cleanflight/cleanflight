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
    #include "build_config.h"
    #include "debug.h"

    #include "common/axis.h"
    #include "common/maths.h"

    #include "drivers/sensor.h"
    #include "drivers/rx_nrf24l01.h"

    #include "config/parameter_group.h"

    #include "rx/rx.h"
    #include "rx/nrf24.h"
    #include "rx/nrf24_syma.h"

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
    void rxNrf24SetProtocol(nrf24_protocol_t protocol);
    uint16_t rxNrf24ReadRawRC(rxRuntimeConfig_t *rxRuntimeConfig, uint8_t channel);
    void symaNrf24Init(nrf24_protocol_t protocol);
    bool checkBindPacket(const uint8_t *packet);
    uint16_t convertToPwmUnsigned(uint8_t val);
    uint16_t convertToPwmSigned(uint8_t val);
    //void setSymaXHoppingChannels(uint8_t rxTxAddress);

    extern uint8_t nrf24NewPacketAvailable;

    extern protocol_state_t protocolState;
    extern const uint8_t rxTxAddr[];
    extern const uint8_t rxTxAddrX5C[];

    // radio channels for frequency hopping
    extern uint8_t rfChannelCount;
    extern uint8_t rfChannelIndex;
    extern uint8_t rfChannels[];
    extern uint8_t rfChannelsX5C[];
    //extern uint8_t rfBindChannels[];
    //extern uint8_t rfBindChannelsX5C[];
}
#define SYMA_RC_CHANNEL_COUNT              9

#define SYMA_X_PROTOCOL_PAYLOAD_SIZE      10
#define SYMA_X5C_PROTOCOL_PAYLOAD_SIZE    16

#define SYMA_X_RF_BIND_CHANNEL             8
#define SYMA_X_RF_CHANNEL_COUNT            4

#define SYMA_X5C_RF_BIND_CHANNEL_COUNT    16
#define SYMA_X5C_RF_CHANNEL_COUNT         15

#define FLAG_FLIP 0x40
#define FLAG_PICTURE 0x40
#define FLAG_VIDEO 0x80
#define FLAG_HEADLESS 0x80

#define FLAG_FLIP_X5C 0x01
#define FLAG_PICTURE_X5C 0x08
#define FLAG_VIDEO_X5C 0x10
#define FLAG_RATE_X5C 0x04

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

void NRF24L01_ClearRxDataReadyInterrupt(void)
{
    // Writing to the STATUS register clears the specified interrupt bits
    NRF24L01_WriteReg(NRF24L01_07_STATUS, BV(NRF24L01_07_STATUS_RX_DR));
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


TEST(SymaProtocolUnittest, TestNrf24RegisterSimulation)
{
    NRF24L01_Initialize(BV(NRF24L01_00_CONFIG_EN_CRC) | BV( NRF24L01_00_CONFIG_CRCO));

    EXPECT_EQ(0x70, BV(NRF24L01_07_STATUS_RX_DR) | BV(NRF24L01_07_STATUS_TX_DS) | BV(NRF24L01_07_STATUS_MAX_RT));
    //NRF24L01_SetTxRxMode(enum TXRX_State);
    nrf24Registers[NRF24L01_00_CONFIG] = 0xFF;
    NRF24L01_SetStandbyMode();
    EXPECT_EQ(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_PRIM_RX));
    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_PWR_UP));

    nrf24Registers[NRF24L01_00_CONFIG] = 0xFF;
    NRF24L01_SetRxMode();
    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_PRIM_RX));
    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_PWR_UP));

    nrf24Registers[NRF24L01_00_CONFIG] = 0xFF;
    NRF24L01_SetTxMode();
    EXPECT_EQ(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_PRIM_RX));
    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_PWR_UP));

    NRF24L01_SetChannel(SYMA_X_RF_BIND_CHANNEL);
    EXPECT_EQ(SYMA_X_RF_BIND_CHANNEL, nrf24Registers[NRF24L01_05_RF_CH]);

    NRF24L01_WriteReg(NRF24L01_06_RF_SETUP, NRF24L01_06_RF_SETUP_RF_DR_2Mbps);
    EXPECT_NE(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_DR_HIGH));
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_DR_LOW));

    NRF24L01_WriteReg(NRF24L01_06_RF_SETUP, NRF24L01_06_RF_SETUP_RF_DR_1Mbps);
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_DR_HIGH));
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_DR_LOW));

    NRF24L01_WriteReg(NRF24L01_06_RF_SETUP, NRF24L01_06_RF_SETUP_RF_DR_250Kbps);
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_DR_HIGH));
    EXPECT_NE(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_DR_LOW));

    NRF24L01_WriteReg(NRF24L01_06_RF_SETUP, NRF24L01_06_RF_SETUP_RF_PWR_n18dbm);
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_HIGH));
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_LOW));

    NRF24L01_WriteReg(NRF24L01_06_RF_SETUP, NRF24L01_06_RF_SETUP_RF_PWR_n12dbm);
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_HIGH));
    EXPECT_NE(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_LOW));

    NRF24L01_WriteReg(NRF24L01_06_RF_SETUP, NRF24L01_06_RF_SETUP_RF_PWR_n6dbm);
    EXPECT_NE(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_HIGH));
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_LOW));

    NRF24L01_WriteReg(NRF24L01_06_RF_SETUP, NRF24L01_06_RF_SETUP_RF_PWR_0dbm);
    EXPECT_NE(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_HIGH));
    EXPECT_NE(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_LOW));

    nrf24Registers[NRF24L01_07_STATUS] = BV(NRF24L01_07_STATUS_RX_DR);
    EXPECT_EQ(false, NRF24L01_IsRxDataReady()); // false since simulated channel and address have not been set

    nrf24Registers[NRF24L01_07_STATUS] = 0xFF;
    NRF24L01_ClearRxDataReadyInterrupt();
    EXPECT_EQ(0, nrf24Registers[NRF24L01_07_STATUS] & BV(NRF24L01_07_STATUS_RX_DR));

    nrf24Registers[NRF24L01_07_STATUS] = 0xFF;
    NRF24L01_ClearAllInterrupts();
    EXPECT_EQ(0, nrf24Registers[NRF24L01_07_STATUS] & BV(NRF24L01_07_STATUS_RX_DR));
    EXPECT_EQ(0, nrf24Registers[NRF24L01_07_STATUS] & BV(NRF24L01_07_STATUS_TX_DS));
    EXPECT_EQ(0, nrf24Registers[NRF24L01_07_STATUS] & BV(NRF24L01_07_STATUS_MAX_RT));

    nrf24Registers[NRF24L01_17_FIFO_STATUS] |= BV(NRF24L01_17_FIFO_STATUS_RX_EMPTY);
    EXPECT_EQ(true, NRF24L01_IsRxFifoEmpty());
    nrf24Registers[NRF24L01_17_FIFO_STATUS] &= ~BV(NRF24L01_17_FIFO_STATUS_RX_EMPTY);
    EXPECT_EQ(false, NRF24L01_IsRxFifoEmpty());
}

TEST(SymaProtocolUnittest, TestNrf24MultiRegisterSimulation)
{
    const uint8_t rxTxAddrLen = 5;
    uint8_t addr[rxTxAddrLen];

    const uint8_t tAddr1[rxTxAddrLen] = {0xab,0xac,0xad,0xae,0xaf};
    NRF24L01_WriteRegisterMulti(NRF24L01_0A_RX_ADDR_P0, tAddr1, rxTxAddrLen);
    EXPECT_EQ(0, memcmp(nrf24MultiRegisters[multiRegP0], tAddr1, rxTxAddrLen));
    NRF24L01_ReadRegisterMulti(NRF24L01_0A_RX_ADDR_P0, addr, rxTxAddrLen);
    EXPECT_EQ(0, memcmp(addr, tAddr1, rxTxAddrLen));

    const uint8_t tAddr2[rxTxAddrLen] = {0xbb,0xbc,0xbd,0xbe,0xbf};
    NRF24L01_WriteRegisterMulti(NRF24L01_10_TX_ADDR, tAddr2, rxTxAddrLen);
    EXPECT_EQ(0, memcmp(nrf24MultiRegisters[multiRegTx], tAddr2, rxTxAddrLen));
    NRF24L01_ReadRegisterMulti(NRF24L01_10_TX_ADDR, addr, rxTxAddrLen);
    EXPECT_EQ(0, memcmp(addr, tAddr2, rxTxAddrLen));

    const uint8_t tAddr3[rxTxAddrLen] = {0xcb,0xcc,0xcd,0xce,0xcf};
    NRF24L01_WriteRegisterMulti(NRF24L01_0A_RX_ADDR_P0, tAddr3, rxTxAddrLen);
    NRF24L01_ReadRegisterMulti(NRF24L01_0A_RX_ADDR_P0, addr, rxTxAddrLen);
    EXPECT_EQ(0, memcmp(addr, tAddr3, rxTxAddrLen));

    const uint8_t tAddr4[rxTxAddrLen] = {0xdb,0xdc,0xdd,0xde,0xdf};
    NRF24L01_WriteRegisterMulti(NRF24L01_10_TX_ADDR, tAddr4, rxTxAddrLen);
    NRF24L01_ReadRegisterMulti(NRF24L01_10_TX_ADDR, addr, rxTxAddrLen);
    EXPECT_EQ(0, memcmp(addr, tAddr4, rxTxAddrLen));
}

TEST(SymaProtocolUnittest, TestNrf24Init)
{
    NRF24L01_Initialize(BV(NRF24L01_00_CONFIG_EN_CRC) | BV( NRF24L01_00_CONFIG_CRCO));
    // test that it is in standby mode with 2 byte CRC
    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_PWR_UP));
    EXPECT_EQ(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_PRIM_RX));
    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_CRCO));
    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_EN_CRC));
}

TEST(SymaProtocolUnittest, TestSymaInit_SYMA_X)
{
    symaNrf24Init(NRF24RX_SYMA_X);
    EXPECT_EQ(SYMA_X_RF_CHANNEL_COUNT, rfChannelCount);

    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_PWR_UP));
    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_PRIM_RX));
    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_CRCO));
    EXPECT_NE(0, nrf24Registers[NRF24L01_00_CONFIG] & BV(NRF24L01_00_CONFIG_EN_CRC));
    EXPECT_EQ(NRF24L01_03_SETUP_AW_5BYTES, nrf24Registers[NRF24L01_03_SETUP_AW]);
    //EXPECT_EQ(SYMA_X_RF_BIND_CHANNEL, nrf24Registers[NRF24L01_05_RF_CH]);

    // 250Kbps
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_DR_HIGH));
    EXPECT_NE(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_DR_LOW));
    // RF_PWR_n12dbm
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_HIGH));
    EXPECT_NE(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_LOW));

    EXPECT_EQ(0, nrf24Registers[NRF24L01_1C_DYNPD]);
}

TEST(SymaProtocolUnittest, TestSymaInit_SYMA_X5C)
{
    symaNrf24Init(NRF24RX_SYMA_X5C);
    EXPECT_EQ(SYMA_X5C_RF_CHANNEL_COUNT, rfChannelCount);

//!!    EXPECT_EQ(SYMA_X_RF_BIND_CHANNEL, nrf24Registers[NRF24L01_05_RF_CH]);
    // 1Mbps
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_DR_HIGH));
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_DR_LOW));
    // RF_PWR_n12dbm
    EXPECT_EQ(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_HIGH));
    EXPECT_NE(0, nrf24Registers[NRF24L01_06_RF_SETUP] & BV(NRF24L01_06_RF_SETUP_RF_PWR_LOW));
}

static uint8_t checksum(uint8_t *data, nrf24_protocol_t protocol)
{
    uint8_t sum = data[0];
    if (protocol == NRF24RX_SYMA_X) {
        for (int ii = 1; ii < SYMA_X_PROTOCOL_PAYLOAD_SIZE - 1; ++ii) {
            sum ^= data[ii];
        }
        return sum;
    } else {
        for (int ii = 1; ii < SYMA_X5C_PROTOCOL_PAYLOAD_SIZE - 1; ++ii) {
            sum += data[ii];
        }
        return sum + 0x55;
    }
}

static uint8_t convertFromPwmUnsigned(uint16_t pwm)
{
    return (uint8_t)(((pwm - PWM_RANGE_MIN) * 255) / (PWM_RANGE_MAX - PWM_RANGE_MIN));
}

// Channel values are sign + magnitude 8bit values
static uint8_t convertFromPwmSigned(uint16_t pwm)
{
    uint16_t ret = pwm;
    if (pwm < PWM_RANGE_MIDDLE) {
        ret = ((PWM_RANGE_MIDDLE - ret) * 2 * 127) / (PWM_RANGE_MAX - PWM_RANGE_MIN);
        return (uint8_t)(0x80 | ret);
    } else {
        ret = ((ret - PWM_RANGE_MIDDLE) * 2 * 127) / (PWM_RANGE_MAX - PWM_RANGE_MIN);
        return (uint8_t)ret;
    }
}

#define X5C_CHAN2TRIM(X) ((((X) & 0x80 ? 0xff - (X) : 0x80 + (X)) >> 2) + 0x20)

static void buildPacketSymaX5C(uint8_t bind, uint16_t roll, uint16_t pitch, uint16_t yaw, uint16_t throttle, uint16_t flags)
{
    memset(nrf24Payload, 0, NRF24L01_MAX_PAYLOAD_SIZE);
    nrf24Payload[7] = 0xae;
    nrf24Payload[8] = 0xa9;
    if (bind) {
        nrf24Payload[14] = 0xc0;
        nrf24Payload[15] = 0x17;
    } else {
        nrf24Payload[0] = convertFromPwmUnsigned(throttle);
        nrf24Payload[1] = convertFromPwmSigned(yaw);
        nrf24Payload[2] = convertFromPwmSigned(pitch);  // reversed from default
        nrf24Payload[3] = convertFromPwmSigned(roll);
        nrf24Payload[4] = X5C_CHAN2TRIM(nrf24Payload[1] ^ 0x80);     // drive trims for extra control range
        nrf24Payload[5] = X5C_CHAN2TRIM(nrf24Payload[2]);
        nrf24Payload[6] = X5C_CHAN2TRIM(nrf24Payload[3] ^ 0x80);
        nrf24Payload[14] = flags | 0x04;  // always high rates (bit 3 is rate control)
        nrf24Payload[15] = checksum(nrf24Payload, NRF24RX_SYMA_X5C);
    }
}

static void buildPacketSymaX(uint8_t bind, uint16_t roll, uint16_t pitch, uint16_t yaw, uint16_t throttle, uint8_t flags1, uint8_t flags2)
{
    if (bind) {
        nrf24Payload[0] = rxTxAddr[4];
        nrf24Payload[1] = rxTxAddr[3];
        nrf24Payload[2] = rxTxAddr[2];
        nrf24Payload[3] = rxTxAddr[1];
        nrf24Payload[4] = rxTxAddr[0];
        nrf24Payload[5] = 0xaa;
        nrf24Payload[6] = 0xaa;
        nrf24Payload[7] = 0xaa;
        nrf24Payload[8] = 0x00;
    } else {
        nrf24Payload[0] = convertFromPwmUnsigned(throttle);
        nrf24Payload[1] = convertFromPwmSigned(pitch); // elevator
        nrf24Payload[2] = convertFromPwmSigned(yaw); // rudder
        nrf24Payload[3] = convertFromPwmSigned(roll); // aileron
        nrf24Payload[4] = flags1;
        nrf24Payload[5] = (nrf24Payload[1] >> 2) | 0xc0;  // always high rates (bit 7 is rate control)
        nrf24Payload[6] = (nrf24Payload[2] >> 2) | (flags2 & FLAG_FLIP);
        nrf24Payload[7] = (nrf24Payload[3] >> 2) | (flags2 & FLAG_HEADLESS);
        nrf24Payload[8] = 0x00;
    }
    nrf24Payload[9] = checksum(nrf24Payload, NRF24RX_SYMA_X);
}

TEST(SymaProtocolUnittest, TestSymaConvertToPwmUnsigned)
{
    EXPECT_EQ(PWM_RANGE_MIN, convertToPwmUnsigned(0));
    EXPECT_EQ(PWM_RANGE_MIN + 250 , convertToPwmUnsigned(64));
    EXPECT_NEAR(PWM_RANGE_MIDDLE, convertToPwmUnsigned(128), 1);
    EXPECT_NEAR(PWM_RANGE_MAX - 250 , convertToPwmUnsigned(192), 2);
    EXPECT_EQ(PWM_RANGE_MAX, convertToPwmUnsigned(255));
}

TEST(SymaProtocolUnittest, TestSymaConvertToPwmSigned)
{
    EXPECT_EQ(PWM_RANGE_MIN, convertToPwmSigned(0xff));
    EXPECT_NEAR(PWM_RANGE_MIN + 250, convertToPwmSigned(0xc0), 1);
    EXPECT_EQ(PWM_RANGE_MIDDLE, convertToPwmSigned(0x80));
    EXPECT_EQ(PWM_RANGE_MIDDLE, convertToPwmSigned(0));
    EXPECT_NEAR(PWM_RANGE_MAX -  250, convertToPwmSigned(64), 1);
    EXPECT_EQ(PWM_RANGE_MAX, convertToPwmSigned(0x7f));
}

TEST(SymaProtocolUnittest, TestSymaSetRcDataFromPayload_SYMA_X)
{
    uint16_t rcData[MAX_SUPPORTED_RC_CHANNEL_COUNT];
    const int16_t tRoll = 1200;
    const int16_t tPitch = 1300;
    const int16_t tYaw = 1800;
    const int16_t tThrottle = 1600;
    const uint8_t tFlags1 = FLAG_PICTURE | FLAG_VIDEO;
    const uint8_t tFlags2 = FLAG_HEADLESS | FLAG_FLIP;

    buildPacketSymaX(false, tRoll, tPitch, tYaw, tThrottle, tFlags1, tFlags2);

    symaNrf24Init(NRF24RX_SYMA_X);
    symaSetRcDataFromPayload(rcData, nrf24Payload);

    EXPECT_NEAR(tThrottle, rcData[NRF24_THROTTLE], 1);
    EXPECT_NEAR(tPitch, rcData[NRF24_PITCH], 4);
    EXPECT_NEAR(tYaw, rcData[NRF24_YAW], 1);
    EXPECT_NEAR(tRoll, rcData[NRF24_ROLL], 1);
    EXPECT_EQ(PWM_RANGE_MAX, rcData[NRF24_AUX2]); // flip
    EXPECT_EQ(PWM_RANGE_MAX, rcData[NRF24_AUX3]); // picture
    EXPECT_EQ(PWM_RANGE_MAX, rcData[NRF24_AUX4]); // video
    //EXPECT_EQ(PWM_RANGE_MAX, rcData[NRF24_AUX5]); // headless
}

TEST(SymaProtocolUnittest, TestSymaSetRcDataFromPayload_SYMA_X5C)
{
    uint16_t rcData[MAX_SUPPORTED_RC_CHANNEL_COUNT];
    const int16_t tRoll = 1200;
    const int16_t tPitch = 1300;
    const int16_t tYaw = 1400;
    const int16_t tThrottle = 1500;
    const uint16_t tFlags = FLAG_PICTURE_X5C | FLAG_VIDEO_X5C | FLAG_FLIP_X5C;

    buildPacketSymaX5C(false, tRoll, tPitch, tYaw, tThrottle, tFlags);

    symaNrf24Init(NRF24RX_SYMA_X5C);
    symaSetRcDataFromPayload(rcData, nrf24Payload);

    EXPECT_NEAR(tThrottle, rcData[NRF24_THROTTLE], 2);
    EXPECT_NEAR(tPitch, rcData[NRF24_PITCH], 4);
    EXPECT_NEAR(tYaw, rcData[NRF24_YAW], 2);
    EXPECT_NEAR(tRoll, rcData[NRF24_ROLL], 1);
    EXPECT_EQ(PWM_RANGE_MAX, rcData[NRF24_AUX2]); // flip
    EXPECT_EQ(PWM_RANGE_MAX, rcData[NRF24_AUX3]); // picture
    EXPECT_EQ(PWM_RANGE_MAX, rcData[NRF24_AUX4]); // video
    // it seems X5C does not support headless mode
    //EXPECT_EQ(PWM_RANGE_MIN, rcData[NRF24_AUX5]); // headless
}

TEST(SymaProtocolUnittest, TestReadRawData_SYMA_X)
{
    const int16_t tRoll = 1200;
    const int16_t tPitch = 1300;
    const int16_t tYaw = 1800;
    const int16_t tThrottle = 1600;
    const uint8_t tFlags1 = FLAG_PICTURE | FLAG_VIDEO;
    const uint8_t tFlags2 = FLAG_HEADLESS | FLAG_FLIP;

    buildPacketSymaX(false, tRoll, tPitch, tYaw, tThrottle, tFlags1, tFlags2);

    rxConfig_t rxConfig;
    rxConfig.nrf24rx_protocol = NRF24RX_SYMA_X;
    rxRuntimeConfig_t rxRuntimeConfig;
    rcReadRawDataPtr rcReadRawData;
    rxNrf24Init(&rxConfig, &rxRuntimeConfig, &rcReadRawData);
    EXPECT_EQ(SYMA_RC_CHANNEL_COUNT, rxRuntimeConfig.channelCount);

    nrf24NewPacketAvailable = true;
    rxNrf24ReadRawRC(&rxRuntimeConfig, NRF24_THROTTLE);
    EXPECT_EQ(false, nrf24NewPacketAvailable);

    nrf24NewPacketAvailable = true;
    rcReadRawData(&rxRuntimeConfig, NRF24_THROTTLE);
    EXPECT_EQ(false, nrf24NewPacketAvailable);

    EXPECT_NEAR(tThrottle, rcReadRawData(&rxRuntimeConfig, NRF24_THROTTLE), 2);
    EXPECT_EQ(false, nrf24NewPacketAvailable);

    nrf24NewPacketAvailable = true;
    EXPECT_NEAR(tPitch, rcReadRawData(&rxRuntimeConfig, NRF24_PITCH), 4);
    EXPECT_NEAR(tYaw, rcReadRawData(&rxRuntimeConfig, NRF24_YAW), 1);
    EXPECT_NEAR(tRoll, rcReadRawData(&rxRuntimeConfig, NRF24_ROLL), 1);
    //EXPECT_EQ(PWM_RANGE_MIN, rcReadRawData(&rxRuntimeConfig, NRF24_AUX1)); // rate
    EXPECT_EQ(PWM_RANGE_MAX, rcReadRawData(&rxRuntimeConfig, NRF24_AUX2)); // flip
    EXPECT_EQ(PWM_RANGE_MAX, rcReadRawData(&rxRuntimeConfig, NRF24_AUX3)); // picture
    EXPECT_EQ(PWM_RANGE_MAX, rcReadRawData(&rxRuntimeConfig, NRF24_AUX4)); // video
    //EXPECT_EQ(PWM_RANGE_MAX, rcReadRawData(&rxRuntimeConfig, NRF24_AUX5)); // headless
}

TEST(SymaProtocolUnittest, TestBindPackets_SYMA_X)
{
    symaNrf24Init(NRF24RX_SYMA_X);
    static const uint8_t bindPacket[SYMA_X_PROTOCOL_PAYLOAD_SIZE] = {0x00, 0x00, 0x00, 0x00, 0x00, 0xaa, 0xaa, 0xaa, 0x00, 0x00};
    const bool bind = checkBindPacket(bindPacket);
    EXPECT_EQ(true, bind);
}

TEST(SymaProtocolUnittest, TestBindPackets_SYMA_X5C)
{
    symaNrf24Init(NRF24RX_SYMA_X5C);
    static uint8_t bindPacket[SYMA_X5C_PROTOCOL_PAYLOAD_SIZE] = {0x00, 0x00, 0x02, 0x03, 0x04, 0x05, 0x06, 0xae, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0x17};
    const bool bind = checkBindPacket(bindPacket);
    EXPECT_EQ(true, bind);
}

extern const uint8_t rxTxAddrX5C[];

TEST(SymaProtocolUnittest, TestStateMachine_SYMA_X)
{
    symaNrf24Init(NRF24RX_SYMA_X);

    // first packet
    protocolState = STATE_BIND;
    nrf24Payload[5] = 0xaa;
    nrf24Payload[6] = 0xaa;
    nrf24Payload[7] = 0xaa;
    nrf24Payload[8] = 0x00;
    static const uint8_t firstPacket[] = {0xf9, 0x96, 0x82, 0x1b, 0x20, 0x08, 0x08, 0xf2, 0x7d, 0xef, 0xff, 0x00, 0x00, 0x00, 0x00};
    simulateTransmitPacket(SYMA_X_RF_BIND_CHANNEL, rxTxAddr, firstPacket, SYMA_X_PROTOCOL_PAYLOAD_SIZE);
    nrf24_received_t dataReceived = symaDataReceived(nrf24Payload);
    //!!EXPECT_EQ(NRF24_RECEIVED_DATA, dataReceived);
    EXPECT_EQ(STATE_BIND, protocolState);
    EXPECT_EQ(0, rfChannelIndex);

    // second packet, a bind packet
    static const uint8_t bindPacket[SYMA_X_PROTOCOL_PAYLOAD_SIZE] = {0x00, 0x01, 0x02, 0x03, 0x04, 0xaa, 0xaa, 0xaa, 0x00, 0x00};
    //EXPECT_EQ(rfBindChannels[0], rfChannels[0]);
    simulateTransmitPacket(rfChannels[0], rxTxAddr, bindPacket, SYMA_X_PROTOCOL_PAYLOAD_SIZE);
    EXPECT_EQ(false, NRF24L01_IsRxFifoEmpty());
    dataReceived = symaDataReceived(nrf24Payload);
    EXPECT_EQ(NRF24_RECEIVED_BIND, dataReceived);
    EXPECT_EQ(STATE_DATA, protocolState);
    EXPECT_EQ(0, rfChannelIndex);
    // check the rxTxAddr has been set
    EXPECT_EQ(bindPacket[4], rxTxAddr[0]);
    EXPECT_EQ(bindPacket[3], rxTxAddr[1]);
    EXPECT_EQ(bindPacket[2], rxTxAddr[2]);
    EXPECT_EQ(bindPacket[1], rxTxAddr[3]);
    EXPECT_EQ(bindPacket[0], rxTxAddr[4]);

    // second bind packet on same channel
    simulateTransmitPacket(rfChannels[0], rxTxAddr, bindPacket, SYMA_X_PROTOCOL_PAYLOAD_SIZE);
    EXPECT_EQ(false, NRF24L01_IsRxFifoEmpty());
    dataReceived = symaDataReceived(nrf24Payload);
    //!!EXPECT_EQ(NRF24_RECEIVED_BIND, dataReceived);
    EXPECT_EQ(STATE_DATA, protocolState);
    //!!EXPECT_EQ(1, rfChannelIndex);

    // send a bunch of bind packets, changing channel every second packet
    int channelIndex = 1;
    int count = 0;
    for (int ii = 0; ii < 20; ++ ii) {
        simulateTransmitPacket(rfChannels[channelIndex], rxTxAddr, bindPacket, SYMA_X_PROTOCOL_PAYLOAD_SIZE);
        EXPECT_EQ(false, NRF24L01_IsRxFifoEmpty());
        dataReceived = symaDataReceived(nrf24Payload);
        //!!EXPECT_EQ(NRF24_RECEIVED_BIND, dataReceived);
        EXPECT_EQ(STATE_DATA, protocolState);
        ++count;
        if ((count & 0x01) == 0) {
            ++channelIndex;
            if (channelIndex >= rfChannelCount) {
                channelIndex = 0;
            }
        }
    }

    // now send a data packet
    static const uint8_t dataPacket[SYMA_X_PROTOCOL_PAYLOAD_SIZE] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09};
    simulateTransmitPacket(rfChannels[channelIndex], rxTxAddr, dataPacket, SYMA_X_PROTOCOL_PAYLOAD_SIZE);
    dataReceived = symaDataReceived(nrf24Payload);
    EXPECT_EQ(NRF24_RECEIVED_DATA, dataReceived);
    EXPECT_EQ(STATE_DATA, protocolState);
    //!!EXPECT_EQ(0, rfChannelIndex);

    // now send a data packet on rxTxAddr
    simulateTransmitPacket(rfChannels[0], rxTxAddr, dataPacket, SYMA_X_PROTOCOL_PAYLOAD_SIZE);
    dataReceived = symaDataReceived(nrf24Payload);
    EXPECT_EQ(NRF24_RECEIVED_DATA, dataReceived);
    EXPECT_EQ(STATE_DATA, protocolState);
    //!!EXPECT_EQ(0, rfChannelIndex);
}

TEST(SymaProtocolUnittest, TestStateMachine_SYMA_X5C)
{
    symaNrf24Init(NRF24RX_SYMA_X5C);

    protocolState = STATE_BIND;
    static const uint8_t firstPacket[] = {0xf9, 0x96, 0x82, 0x1b, 0x20, 0x08, 0x08, 0xf2, 0x7d, 0xef, 0xff, 0x00, 0x00, 0x00, 0x00};
    simulateTransmitPacket(SYMA_X_RF_BIND_CHANNEL, rxTxAddrX5C, firstPacket, SYMA_X5C_PROTOCOL_PAYLOAD_SIZE);
    nrf24_received_t dataReceived = symaDataReceived(nrf24Payload);
    //!!EXPECT_EQ(NRF24_RECEIVED_BIND, dataReceived);
    EXPECT_EQ(STATE_BIND, protocolState);
    //!!EXPECT_EQ(0, rfChannelIndex);

    // second packet, a bind packet
    static uint8_t bindPacket[SYMA_X5C_PROTOCOL_PAYLOAD_SIZE] = {0x00, 0x00, 0x02, 0x03, 0x04, 0x05, 0x06, 0xae, 0xa9, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0x17};
//!!    EXPECT_EQ(rfBindChannelsX5C[0], rfChannels[0]);
    simulateTransmitPacket(rfChannels[0], rxTxAddrX5C, bindPacket, SYMA_X5C_PROTOCOL_PAYLOAD_SIZE);
    dataReceived = symaDataReceived(nrf24Payload);
    EXPECT_EQ(NRF24_RECEIVED_BIND, dataReceived);
    EXPECT_EQ(STATE_DATA, protocolState);
//!!    EXPECT_EQ(1, rfChannelIndex);

    // second bind packet on same channel
    simulateTransmitPacket(rfChannels[0], rxTxAddrX5C, bindPacket, SYMA_X5C_PROTOCOL_PAYLOAD_SIZE);
    dataReceived = symaDataReceived(nrf24Payload);
    //!!EXPECT_EQ(NRF24_RECEIVED_BIND, dataReceived);
    EXPECT_EQ(STATE_DATA, protocolState);
    //!!EXPECT_EQ(1, rfChannelIndex);

    // send a bunch of bind packets, changing channel every second packet
    int channelIndex = 1;
    int count = 0;
    for (int ii = 0; ii < 20; ++ ii) {
        simulateTransmitPacket(rfChannels[channelIndex], rxTxAddrX5C, bindPacket, SYMA_X5C_PROTOCOL_PAYLOAD_SIZE);
        dataReceived = symaDataReceived(nrf24Payload);
        //!!EXPECT_EQ(NRF24_RECEIVED_BIND, dataReceived);
        EXPECT_EQ(STATE_DATA, protocolState);
        ++count;
        if ((count & 0x01) == 0) {
            ++channelIndex;
            if (channelIndex >= rfChannelCount) {
                channelIndex = 0;
            }
        }
    }

    // now send a data packet
    static const uint8_t dataPacket[SYMA_X5C_PROTOCOL_PAYLOAD_SIZE] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0d, 0x0e};
    simulateTransmitPacket(rfChannels[channelIndex], rxTxAddrX5C, dataPacket, SYMA_X5C_PROTOCOL_PAYLOAD_SIZE);
    dataReceived = symaDataReceived(nrf24Payload);
    EXPECT_EQ(NRF24_RECEIVED_DATA, dataReceived);
    EXPECT_EQ(STATE_DATA, protocolState);
    //!!EXPECT_EQ(0, rfChannelIndex);

    // send a second data packet
    simulateTransmitPacket(rfChannels[0], rxTxAddrX5C, dataPacket, SYMA_X5C_PROTOCOL_PAYLOAD_SIZE);
    dataReceived = symaDataReceived(nrf24Payload);
    EXPECT_EQ(NRF24_RECEIVED_DATA, dataReceived);
    EXPECT_EQ(STATE_DATA, protocolState);
    //!!EXPECT_EQ(0, rfChannelIndex);
}

void setSymaXHoppingChannels(uint8_t addr)
{
    addr = addr & 0x1f;
    if (addr == 0x06) {
        addr = 0x07;
    }
    const uint32_t inc = (addr << 24) | (addr << 16) | (addr << 8) | addr;
    uint32_t *prfChannels = (uint32_t *)rfChannels;
    if (addr == 0x16) {
        *prfChannels = 0x28481131;
    } else if (addr == 0x1e) {
        *prfChannels = 0x38184121;
    } else if (addr < 0x10) {
        *prfChannels = 0x3A2A1A0A + inc;
    } else if (addr < 0x18) {
        *prfChannels = 0x1231FA1A + inc;
    } else {
        *prfChannels = 0x19FA2202 + inc;
    }
}


TEST(SymaProtocolUnittest, Test_SetSymaXHoppingChannels)
{
    uint32_t *prfChannels = (uint32_t *)rfChannels;
    setSymaXHoppingChannels(0x00);
    EXPECT_EQ(0x3A2A1A0A, *prfChannels);
    setSymaXHoppingChannels(0x01);
    EXPECT_EQ(0x3B2B1B0B, *prfChannels);
    setSymaXHoppingChannels(0x02);
    EXPECT_EQ(0x3C2C1C0C, *prfChannels);
    setSymaXHoppingChannels(0x03);
    EXPECT_EQ(0x3D2D1D0D, *prfChannels);
    setSymaXHoppingChannels(0x04);
    EXPECT_EQ(0x3E2E1E0E, *prfChannels);
    setSymaXHoppingChannels(0x05);
    EXPECT_EQ(0x3F2F1F0F, *prfChannels);
    setSymaXHoppingChannels(0x06);
    EXPECT_EQ(0x41312111, *prfChannels);
    setSymaXHoppingChannels(0x07);
    EXPECT_EQ(0x41312111, *prfChannels);
    setSymaXHoppingChannels(0x08);
    EXPECT_EQ(0x42322212, *prfChannels);
    setSymaXHoppingChannels(0x09);
    EXPECT_EQ(0x43332313, *prfChannels);
    setSymaXHoppingChannels(0x0a);
    EXPECT_EQ(0x44342414, *prfChannels);
    setSymaXHoppingChannels(0x0b);
    EXPECT_EQ(0x45352515, *prfChannels);
    setSymaXHoppingChannels(0x0c);
    EXPECT_EQ(0x46362616, *prfChannels);
    setSymaXHoppingChannels(0x0d);
    EXPECT_EQ(0x47372717, *prfChannels);
    setSymaXHoppingChannels(0x0e);
    EXPECT_EQ(0x48382818, *prfChannels);
    setSymaXHoppingChannels(0x0f);
    EXPECT_EQ(0x49392919, *prfChannels);

    setSymaXHoppingChannels(0x10);
    EXPECT_EQ(0x22420A2A, *prfChannels);
    setSymaXHoppingChannels(0x11);
    EXPECT_EQ(0x23430B2B, *prfChannels);
    setSymaXHoppingChannels(0x12);
    EXPECT_EQ(0x24440C2C, *prfChannels);
    setSymaXHoppingChannels(0x13);
    EXPECT_EQ(0x25450D2D, *prfChannels);
    setSymaXHoppingChannels(0x14);
    EXPECT_EQ(0x26460E2E, *prfChannels);
    setSymaXHoppingChannels(0x15);
    EXPECT_EQ(0x27470F2F, *prfChannels);
    setSymaXHoppingChannels(0x16);
    EXPECT_EQ(0x28481131, *prfChannels);
    setSymaXHoppingChannels(0x17);
    EXPECT_EQ(0x29491131, *prfChannels);

    setSymaXHoppingChannels(0x18);
    EXPECT_EQ(0x32123A1A, *prfChannels);
    setSymaXHoppingChannels(0x19);
    EXPECT_EQ(0x33133B1B, *prfChannels);
    setSymaXHoppingChannels(0x1a);
    EXPECT_EQ(0x34143C1C, *prfChannels);
    setSymaXHoppingChannels(0x1b);
    EXPECT_EQ(0x35153D1D, *prfChannels);
    setSymaXHoppingChannels(0x1c);
    EXPECT_EQ(0x36163E1E, *prfChannels);
    setSymaXHoppingChannels(0x1d);
    EXPECT_EQ(0x37173F1F, *prfChannels);



    setSymaXHoppingChannels(0x1e);
    EXPECT_EQ(0x38184121, *prfChannels);
    setSymaXHoppingChannels(0x1f);
    EXPECT_EQ(0x39194121, *prfChannels);

    EXPECT_EQ(0x21, rfChannels[0]);
    EXPECT_EQ(0x41, rfChannels[1]);
    EXPECT_EQ(0x19, rfChannels[2]);
    EXPECT_EQ(0x39, rfChannels[3]);

    setSymaXHoppingChannels(0xbc);
    EXPECT_EQ(0x1e, rfChannels[0]);
    EXPECT_EQ(0x3e, rfChannels[1]);
    EXPECT_EQ(0x16, rfChannels[2]);
    EXPECT_EQ(0x36, rfChannels[3]);
}

// STUBS

extern "C" {
void NRF24L01_FlushTx(void) {}
void NRF24L01_FlushRx(void) {}
void delayMicroseconds(uint32_t us) {UNUSED(us);}
void delay(uint32_t ms) {UNUSED(ms);}
uint32_t micros(void) {return 0;}
}
