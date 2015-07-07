
#include "nRF24L01.h"

#include "platform.h"

#include "build_config.h"

#include "drivers/system.h"
#include "drivers/bus_spi_soft.h"

#include "rx.h"

/***************************** Configuration ********************************/

// nRF24L01 pin setup for Flip32 using soft SPI

// GND  --> any ground pin
// VCC  --> 3v supply
// CE   --> tied to VCC (seems to be ok floating though...)
// CSN  --> receiver pin 5
// SCK  --> receiver pin 6
// MISO --> receiver pin 7
// MOSI --> receiver pin 8

#define NRF24_CSN_PORT  GPIOA
#define NRF24_CSN_PIN   GPIO_Pin_6

#define NRF24_SCK_PORT  GPIOA
#define NRF24_SCK_PIN   GPIO_Pin_7

#define NRF24_MISO_PORT GPIOB
#define NRF24_MISO_PIN  GPIO_Pin_0

#define NRF24_MOSI_PORT GPIOB
#define NRF24_MOSI_PIN  GPIO_Pin_1

// About VCC supply: if only using the module for receiving, you could use
// the 3.3v VCC pin of the SWD header. For a bi-directional connection you
// would probably be better off with a separate power supply for the nRF24,
// especially when using a high-power PA type module.

// Note that receiver pins 5-8 are normally used for motors, so to build an
// octocopter you might have to alter the pins used here. Receiver pins 1-2
// should be free to use for soft SPI instead of 5-6.

typedef struct nrf24Payload {
    uint8_t throttle;
    uint8_t yaw;
    uint8_t pitch;
    uint8_t roll;
    uint8_t dial1;
    uint8_t dial2;
    uint8_t switches; // bitflag
} nrf24Payload;

nrf24Payload payload;

// Time in milliseconds after which to use failsafe values if
// no packets have been received.
#define NRF24_FAILSAFE_TIME_MS 1000

// These settings will be applied whenever there has been
// no packet received for more than NRF24_FAILSAFE_TIME_MS
void resetPayload()
{
    // analog values from 0-255, which become rcData values from 1000-2000
    payload.throttle = 0;
    payload.yaw = 128;
    payload.pitch = 128;
    payload.roll = 128;
    payload.dial1 = 0;
    payload.dial2 = 0;

    payload.switches = 0;
}

/****************************************************************************/

// Start the nRF24 as a receiver which listens for packets from the transmitter.
// In this mode, we can also return data to the transmitter in ack payloads (TODO).
// *** All settings here must match the transmitter! ***
void startAsPrimaryReceiver()
{
    nrf24_setChannel(76);
    nrf24_setDataRate(RF24_250KBPS);

    // for a one-way link, acks are not needed and only slow things down
    nrf24_setAutoAck(false);

    // for a bi-directional link (TODO)
    //nrf24_setAutoAck(true);
    //nrf24_enableAckPayload();

    const uint64_t pipeIn =  0xE8E8F0F0E1LL;
    nrf24_openReadingPipe(1,pipeIn);
    nrf24_startListening();
}

/****************************************************************************/

// How many channels to provide to the flight controller?
#define NRF24_CHANNEL_COUNT 14

// Convert data in the payload to values usable by the flight controller.
// The default implementation uses six bytes of the payload as analog controls,
// and the last byte as a bitflag which allows for eight 2-position switches.
void setRcDataFromPayload() {

    float scale = 1 / 255.0f;

    // 6 analog channels
    rcData[0] = 1000 + 1000 * payload.roll      * scale;
    rcData[1] = 1000 + 1000 * payload.pitch     * scale;
    rcData[2] = 1000 + 1000 * payload.yaw       * scale;
    rcData[3] = 1000 + 1000 * payload.throttle  * scale;
    rcData[4] = 1000 + 1000 * payload.dial1     * scale;
    rcData[5] = 1000 + 1000 * payload.dial2     * scale;

    // 8 'binary' (ie. switch) channels
    rcData[ 6] = (payload.switches & (1 << 0)) ? 2000 : 1000;
    rcData[ 7] = (payload.switches & (1 << 1)) ? 2000 : 1000;
    rcData[ 8] = (payload.switches & (1 << 2)) ? 2000 : 1000;
    rcData[ 9] = (payload.switches & (1 << 3)) ? 2000 : 1000;
    rcData[10] = (payload.switches & (1 << 4)) ? 2000 : 1000;
    rcData[11] = (payload.switches & (1 << 5)) ? 2000 : 1000;
    rcData[12] = (payload.switches & (1 << 6)) ? 2000 : 1000;
    rcData[13] = (payload.switches & (1 << 7)) ? 2000 : 1000;
}

/****************************************************************************/

struct SoftSPIDevice nrf24SoftSPIDevice;

// Alter this function if you want to use hardware SPI.
uint8_t nrf24_readwrite(uint8_t data) {

    return softSpiTransferByte(&nrf24SoftSPIDevice, data);

}

/****************************************************************************/







// End of configuration.  Implementation follows....







/****************************************************************************/

// Based on: https://github.com/gcopeland/RF24

bool wide_band;                 // 2Mbs data rate in use?
bool p_variant;                 // False for RF24L01 and true for RF24L01P
uint8_t payload_size;           // Fixed size of payloads
bool ack_payload_available;     // Whether there is an ack payload waiting
bool dynamic_payloads_enabled;  // Whether dynamic payloads are enabled.
uint8_t ack_payload_length;     // Dynamic size of pending ack payload.
uint64_t pipe0_reading_address; // Last address set on pipe 0 for reading.
uint32_t lastRecvTime;

#define CSN_L SOFTSPI_CSN_L(nrf24SoftSPIDevice)
#define CSN_H SOFTSPI_CSN_H(nrf24SoftSPIDevice)

#define SCK_L SOFTSPI_SCK_L(nrf24SoftSPIDevice)
#define SCK_H SOFTSPI_SCK_H(nrf24SoftSPIDevice)

#define MOSI_L SOFTSPI_MOSI_L(nrf24SoftSPIDevice)
#define MOSI_H SOFTSPI_MOSI_H(nrf24SoftSPIDevice)

#define MISO_R SOFTSPI_MISO_R(nrf24SoftSPIDevice)

#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define MAX(a, b) ((a) > (b) ? (a) : (b))

#define _BV(x) (1<<(x))

// nRF24L01 registers
#define NRF24_CONFIG      0x00
#define NRF24_EN_AA       0x01
#define NRF24_EN_RXADDR   0x02
#define NRF24_SETUP_AW    0x03
#define NRF24_SETUP_RETR  0x04
#define NRF24_RF_CH       0x05
#define NRF24_RF_SETUP    0x06
#define NRF24_STATUS      0x07
#define NRF24_OBSERVE_TX  0x08
#define NRF24_CD          0x09
#define NRF24_RX_ADDR_P0  0x0A
#define NRF24_RX_ADDR_P1  0x0B
#define NRF24_RX_ADDR_P2  0x0C
#define NRF24_RX_ADDR_P3  0x0D
#define NRF24_RX_ADDR_P4  0x0E
#define NRF24_RX_ADDR_P5  0x0F
#define NRF24_TX_ADDR     0x10
#define NRF24_RX_PW_P0    0x11
#define NRF24_RX_PW_P1    0x12
#define NRF24_RX_PW_P2    0x13
#define NRF24_RX_PW_P3    0x14
#define NRF24_RX_PW_P4    0x15
#define NRF24_RX_PW_P5    0x16
#define NRF24_FIFO_STATUS 0x17
#define NRF24_DYNPD	    0x1C
#define NRF24_FEATURE	    0x1D

// nRF24L01 bit mnemonics
#define NRF24_MASK_RX_DR  6
#define NRF24_MASK_TX_DS  5
#define NRF24_MASK_MAX_RT 4
#define NRF24_EN_CRC      3
#define NRF24_CRCO        2
#define NRF24_PWR_UP      1
#define NRF24_PRIM_RX     0
#define NRF24_ENAA_P5     5
#define NRF24_ENAA_P4     4
#define NRF24_ENAA_P3     3
#define NRF24_ENAA_P2     2
#define NRF24_ENAA_P1     1
#define NRF24_ENAA_P0     0
#define NRF24_ERX_P5      5
#define NRF24_ERX_P4      4
#define NRF24_ERX_P3      3
#define NRF24_ERX_P2      2
#define NRF24_ERX_P1      1
#define NRF24_ERX_P0      0
#define NRF24_AW          0
#define NRF24_ARD         4
#define NRF24_ARC         0
#define NRF24_PLL_LOCK    4
#define NRF24_RF_DR       3
#define NRF24_RF_PWR      6
#define NRF24_RX_DR       6
#define NRF24_TX_DS       5
#define NRF24_MAX_RT      4
#define NRF24_RX_P_NO     1
#define NRF24_TX_FULL     0
#define NRF24_PLOS_CNT    4
#define NRF24_ARC_CNT     0
#define NRF24_TX_REUSE    6
#define NRF24_FIFO_FULL   5
#define NRF24_TX_EMPTY    4
#define NRF24_RX_FULL     1
#define NRF24_RX_EMPTY    0
#define NRF24_DPL_P5	    5
#define NRF24_DPL_P4	    4
#define NRF24_DPL_P3	    3
#define NRF24_DPL_P2	    2
#define NRF24_DPL_P1	    1
#define NRF24_DPL_P0	    0
#define NRF24_EN_DPL	    2
#define NRF24_EN_ACK_PAY  1
#define NRF24_EN_DYN_ACK  0

// nRF24L01 instruction mnemonics
#define NRF24_R_REGISTER    0x00
#define NRF24_W_REGISTER    0x20
#define NRF24_REGISTER_MASK 0x1F
#define NRF24_ACTIVATE      0x50
#define NRF24_R_RX_PL_WID   0x60
#define NRF24_R_RX_PAYLOAD  0x61
#define NRF24_W_TX_PAYLOAD  0xA0
#define NRF24_W_ACK_PAYLOAD 0xA8
#define NRF24_FLUSH_TX      0xE1
#define NRF24_FLUSH_RX      0xE2
#define NRF24_REUSE_TX_PL   0xE3
#define NRF24_NOP           0xFF

// Non-P omissions
#define NRF24_LNA_HCURR   0

// P model memory Map
#define NRF24_RPD         0x09

// P model bit Mnemonics
#define NRF24_RF_DR_LOW   5
#define NRF24_RF_DR_HIGH  3
#define NRF24_RF_PWR_LOW  1
#define NRF24_RF_PWR_HIGH 2



/****************************************************************************/

uint8_t nrf24_read_buffer(uint8_t reg, uint8_t* buf, uint8_t len)
{
    uint8_t status,i;

    CSN_L;
    status = nrf24_readwrite(NRF24_R_REGISTER | ( NRF24_REGISTER_MASK & reg ));
    for (i = 0; i < len; i++) buf[i] = nrf24_readwrite(0);
    CSN_H;

    return status;
}

/****************************************************************************/

uint8_t nrf24_read_register(uint8_t reg)
{
    CSN_L;
    nrf24_readwrite(NRF24_R_REGISTER | ( NRF24_REGISTER_MASK & reg ));
    uint8_t result = nrf24_readwrite(0x00);
    CSN_H;

    return result;
}

/****************************************************************************/

uint8_t nrf24_write_buffer(uint8_t reg, const uint8_t* buf, uint8_t len)
{
    uint8_t status,i;

    CSN_L;
    status = nrf24_readwrite(NRF24_W_REGISTER | ( NRF24_REGISTER_MASK & reg ));
    for (i = 0; i < len; i++) nrf24_readwrite(*buf++);
    CSN_H;

    return status;
}

/****************************************************************************/

uint8_t nrf24_write_register(uint8_t reg, uint8_t value)
{
    uint8_t status;

    CSN_L;
    status = nrf24_readwrite(NRF24_W_REGISTER | ( NRF24_REGISTER_MASK & reg ));
    nrf24_readwrite(value);
    CSN_H;

    return status;
}

/****************************************************************************/

uint8_t nrf24_write_payload(const uint8_t* buf, uint8_t len)
{
    uint8_t status;

    const uint8_t* current = buf;

    uint8_t data_len = MIN(len,payload_size);
    uint8_t blank_len = dynamic_payloads_enabled ? 0 : payload_size - data_len;

    CSN_L;
    status = nrf24_readwrite( NRF24_W_TX_PAYLOAD );
    while ( data_len-- )
        nrf24_readwrite(*current++);
    while ( blank_len-- )
        nrf24_readwrite(0);
    CSN_H;

    return status;
}

/****************************************************************************/

uint8_t nrf24_read_payload(uint8_t* buf, uint8_t len)
{
    uint8_t status;
    uint8_t* current = buf;

    uint8_t data_len = MIN(len,payload_size);
    uint8_t blank_len = dynamic_payloads_enabled ? 0 : payload_size - data_len;

    CSN_L;
    status = nrf24_readwrite( NRF24_R_RX_PAYLOAD );
    while ( data_len-- )
        *current++ = nrf24_readwrite(0xff);
    while ( blank_len-- )
        nrf24_readwrite(0xff);
    CSN_H;

    return status;
}

/****************************************************************************/

uint8_t nrf24_flush_rx(void)
{
    uint8_t status;

    CSN_L;
    status = nrf24_readwrite( NRF24_FLUSH_RX );
    CSN_H;

    return status;
}

/****************************************************************************/

uint8_t nrf24_flush_tx(void)
{
    uint8_t status;

    CSN_L;
    status = nrf24_readwrite( NRF24_FLUSH_TX );
    CSN_H;

    return status;
}

/****************************************************************************/

uint8_t nrf24_get_status(void)
{
    uint8_t status = 0;

    CSN_L;
    status = nrf24_readwrite( NRF24_NOP );
    CSN_H;

    return status;
}

/****************************************************************************/

void rxNRF24Init(rxConfig_t *rxConfig, rxRuntimeConfig_t *rxRuntimeConfig, rcReadRawDataPtr *callback) {

    UNUSED(rxConfig);
    UNUSED(callback);
    rxRuntimeConfig->channelCount = NRF24_CHANNEL_COUNT;

    nrf24SoftSPIDevice.csn_port = GPIOA;
    nrf24SoftSPIDevice.csn_pin = GPIO_Pin_6;

    nrf24SoftSPIDevice.sck_port = GPIOA;
    nrf24SoftSPIDevice.sck_pin = GPIO_Pin_7;

    nrf24SoftSPIDevice.miso_port = GPIOB;
    nrf24SoftSPIDevice.miso_pin = GPIO_Pin_0;

    nrf24SoftSPIDevice.mosi_port = GPIOB;
    nrf24SoftSPIDevice.mosi_pin = GPIO_Pin_1;

    softSpiInit(&nrf24SoftSPIDevice);

    CSN_H;

    wide_band = true;
    p_variant = false;
    payload_size = 32;
    ack_payload_available = false;
    dynamic_payloads_enabled = false;
    pipe0_reading_address = 0;
    lastRecvTime = 0;

    // Must allow the radio time to settle else configuration bits will not necessarily stick.
    // This is actually only required following power up but some settling time also appears to
    // be required after resets too. For full coverage, we'll always assume the worst.
    // Enabling 16b CRC is by far the most obvious case if the wrong timing is used - or skipped.
    // Technically we require 4.5ms + 14us as a worst case. We'll just call it 5ms for good measure.
    // WARNING: Delay is based on P-variant whereby non-P *may* require different timing.
    delay( 5 ) ;

    // Set 1500uS (minimum for 32B payload in ESB@250KBPS) timeouts, to make testing a little easier
    // WARNING: If this is ever lowered, either 250KBS mode with AA is broken or maximum packet
    // sizes must never be used. See documentation for a more complete explanation.
    //write_register(SETUP_RETR,(0B0100 << ARD) | (0B1111 << ARC));
    nrf24_write_register(NRF24_SETUP_RETR,(4 << NRF24_ARD) | (15 << NRF24_ARC));

    // Restore our default PA level
    nrf24_setPALevel( RF24_PA_MAX ) ;

    // Determine if this is a p or non-p RF24 module and then
    // reset our data rate back to default value. This works
    // because a non-P variant won't allow the data rate to
    // be set to 250Kbps.
    if( nrf24_setDataRate( RF24_250KBPS ) )
    {
        p_variant = true ;
    }

    // Then set the data rate to the slowest (and most reliable) speed supported by all
    // hardware.
    nrf24_setDataRate( RF24_1MBPS ) ;

    // Initialize CRC and request 2-byte (16bit) CRC
    nrf24_setCRCLength( RF24_CRC_16 ) ;

    // Disable dynamic payloads, to match dynamic_payloads_enabled setting
    nrf24_write_register(NRF24_DYNPD,0);

    // Reset current status
    // Notice reset and flush is the last thing we do
    nrf24_write_register(NRF24_STATUS,_BV(NRF24_RX_DR) | _BV(NRF24_TX_DS) | _BV(NRF24_MAX_RT) );

    // Set up default configuration.  Callers can always change it later.
    // This channel should be universally safe and not bleed over into adjacent
    // spectrum.
    nrf24_setChannel(76);

    // Flush buffers
    nrf24_flush_rx();
    nrf24_flush_tx();

    resetPayload();
    startAsPrimaryReceiver();
}

/****************************************************************************/

bool rxNRF24ReceivePacket()
{
    bool receivedPacket = false;

    while ( nrf24_available() ) {
        nrf24_read(&payload, sizeof(payload));
        receivedPacket = true;
    }

    uint32_t now = millis();

    if ( receivedPacket ) {
        lastRecvTime = now;
    }
    else if ( now - lastRecvTime > NRF24_FAILSAFE_TIME_MS ) {
        // signal lost?
        resetPayload();
    }

    setRcDataFromPayload();

    return receivedPacket;
}

/****************************************************************************/

bool nrf24_setChannel(uint8_t channel)
{
    // TODO: This method could take advantage of the 'wide_band' calculation
    // done in setChannel() to require certain channel spacing.

    const uint8_t max_channel = 127;
    uint8_t val = MIN(channel,max_channel);
    nrf24_write_register(NRF24_RF_CH,val);
    return nrf24_read_register(NRF24_RF_CH) == val;
}

/****************************************************************************/

void nrf24_setPayloadSize(uint8_t size)
{
    const uint8_t max_payload_size = 32;
    payload_size = MIN(size,max_payload_size);
}

/****************************************************************************/

uint8_t nrf24_getPayloadSize(void)
{
    return payload_size;
}

/****************************************************************************/

void nrf24_startListening(void)
{
    nrf24_write_register(NRF24_CONFIG, nrf24_read_register(NRF24_CONFIG) | _BV(NRF24_PWR_UP) | _BV(NRF24_PRIM_RX));
    nrf24_write_register(NRF24_STATUS, _BV(NRF24_RX_DR) | _BV(NRF24_TX_DS) | _BV(NRF24_MAX_RT) );

    // Restore the pipe0 adddress, if exists
    if (pipe0_reading_address)
        nrf24_write_buffer(NRF24_RX_ADDR_P0, (const uint8_t*)(&pipe0_reading_address), 5);

    // Flush buffers
    nrf24_flush_rx();
    nrf24_flush_tx();

    // Go!
    //ce(HIGH);

    // wait for the radio to come up (130us actually only needed)
    delayMicroseconds(130);
}

/****************************************************************************/

void nrf24_stopListening(void)
{
    //ce(LOW);
    nrf24_flush_tx();
    nrf24_flush_rx();
}

/****************************************************************************/

void nrf24_powerDown(void)
{
    nrf24_write_register(NRF24_CONFIG,nrf24_read_register(NRF24_CONFIG) & ~_BV(NRF24_PWR_UP));
}

/****************************************************************************/

void nrf24_powerUp(void)
{
    nrf24_write_register(NRF24_CONFIG,nrf24_read_register(NRF24_CONFIG) | _BV(NRF24_PWR_UP));
}

/******************************************************************/

bool nrf24_write( const void* buf, uint8_t len )
{
    bool result = false;

    // Begin the write
    nrf24_startWrite(buf,len);

    // ------------
    // At this point we could return from a non-blocking write, and then call
    // the rest after an interrupt

    // Instead, we are going to block here until we get TX_DS (transmission completed and ack'd)
    // or MAX_RT (maximum retries, transmission failed).  Also, we'll timeout in case the radio
    // is flaky and we get neither.

    // IN the end, the send should be blocking.  It comes back in 60ms worst case, or much faster
    // if I tighted up the retry logic.  (Default settings will be 1500us.
    // Monitor the send
    uint8_t observe_tx;
    uint8_t status;
    uint32_t sent_at = millis();
    const uint32_t timeout = 500; //ms to wait for timeout
    do
    {
        status = nrf24_read_buffer(NRF24_OBSERVE_TX,&observe_tx,1);
        //IF_SERIAL_DEBUG(Serial.print(observe_tx,HEX));
    }
    while( ! ( status & ( _BV(NRF24_TX_DS) | _BV(NRF24_MAX_RT) ) ) && ( millis() - sent_at < timeout ) );

    // The part above is what you could recreate with your own interrupt handler,
    // and then call this when you got an interrupt
    // ------------

    // Call this when you get an interrupt
    // The status tells us three things
    // * The send was successful (TX_DS)
    // * The send failed, too many retries (MAX_RT)
    // * There is an ack packet waiting (RX_DR)
    bool tx_ok, tx_fail;
    nrf24_whatHappened(&tx_ok,&tx_fail,&ack_payload_available);

    //printf("%u%u%u\r\n",tx_ok,tx_fail,ack_payload_available);

    result = tx_ok;
    //IF_SERIAL_DEBUG(Serial.print(result?"...OK.":"...Failed"));

    // Handle the ack packet
    if ( ack_payload_available )
    {
        ack_payload_length = nrf24_getDynamicPayloadSize();
        //IF_SERIAL_DEBUG(Serial.print("[AckPacket]/"));
        //IF_SERIAL_DEBUG(Serial.println(ack_payload_length,DEC));
    }

    // Yay, we are done.

    // Power down
    nrf24_powerDown();

    // Flush buffers (Is this a relic of past experimentation, and not needed anymore??)
    nrf24_flush_tx();

    return result;
}
/****************************************************************************/

void nrf24_startWrite( const void* buf, uint8_t len )
{
    // Transmitter power-up
    nrf24_write_register(NRF24_CONFIG, ( nrf24_read_register(NRF24_CONFIG) | _BV(NRF24_PWR_UP) ) & ~_BV(NRF24_PRIM_RX) );
    delayMicroseconds(150);

    // Send the payload
    nrf24_write_payload( buf, len );

    // Allons!
    //ce(HIGH);
    delayMicroseconds(15);
    //ce(LOW);
}

/****************************************************************************/

uint8_t nrf24_getDynamicPayloadSize(void)
{
    uint8_t result = 0;

    CSN_L;
    nrf24_readwrite( NRF24_R_RX_PL_WID );
    result = nrf24_readwrite(0xff);
    CSN_H;

    return result;
}

/****************************************************************************/

// Read nRF24L01 register
// input:
//   reg - register number
// output: register value
uint8_t nRF24_ReadReg(uint8_t reg) {
    uint8_t value;

    CSN_L;
    nrf24_readwrite(reg);
    value = nrf24_readwrite(0x00);
    CSN_H;

    return value;
}

/****************************************************************************/

bool nrf24_available(void)
{
    return nrf24_available_perPipe(0);
}

/****************************************************************************/

/*uint8_t nRF24_DataReady(void) {
    uint8_t status;

    status = nRF24_ReadReg(NRF24_STATUS);
    if (status & NRF24_MASK_RX_DR) return 1;

    // Checking RX_DR isn't good enough, there's can be some data in FIFO
    status = nRF24_ReadReg(NRF24_FIFO_STATUS);

    return (status & NRF24_RX_EMPTY) ? 0 : 1;
}*/

/****************************************************************************/

bool nrf24_available_perPipe(uint8_t* pipe_num)
{
    uint8_t status = nrf24_get_status();

    // Too noisy, enable if you really want lots o data!!
    //IF_SERIAL_DEBUG(print_status(status));

    bool result = ( status & _BV(NRF24_RX_DR) );

    if (result)
    {
        // If the caller wants the pipe number, include that
        if ( pipe_num )
            //*pipe_num = ( status >> RX_P_NO ) & B111;
            *pipe_num = ( status >> NRF24_RX_P_NO ) & 7;

        // Clear the status bit

        // ??? Should this REALLY be cleared now?  Or wait until we
        // actually READ the payload?

        nrf24_write_register(NRF24_STATUS,_BV(NRF24_RX_DR) );

        // Handle ack payload receipt
        if ( status & _BV(NRF24_TX_DS) )
        {
            nrf24_write_register(NRF24_STATUS,_BV(NRF24_TX_DS));
        }
    }

    return result;
}

/****************************************************************************/

bool nrf24_read( void* buf, uint8_t len )
{
    // Fetch the payload
    nrf24_read_payload( buf, len );

    // was this the last of the data available?
    return nrf24_read_register(NRF24_FIFO_STATUS) & _BV(NRF24_RX_EMPTY);
}

/****************************************************************************/

void nrf24_whatHappened(bool* tx_ok,bool* tx_fail,bool* rx_ready)
{
    // Read the status & reset the status in one easy call
    // Or is that such a good idea?
    uint8_t status = nrf24_write_register(NRF24_STATUS,_BV(NRF24_RX_DR) | _BV(NRF24_TX_DS) | _BV(NRF24_MAX_RT) );

    // Report to the user what happened
    *tx_ok = status & _BV(NRF24_TX_DS);
    *tx_fail = status & _BV(NRF24_MAX_RT);
    *rx_ready = status & _BV(NRF24_RX_DR);
}

/****************************************************************************/

void nrf24_openWritingPipe(uint64_t value)
{
    // Note that AVR 8-bit uC's store this LSB first, and the NRF24L01(+)
    // expects it LSB first too, so we're good.

    nrf24_write_buffer(NRF24_RX_ADDR_P0, (uint8_t*)(&value), 5);
    nrf24_write_buffer(NRF24_TX_ADDR, (uint8_t*)(&value), 5);

    const uint8_t max_payload_size = 32;
    nrf24_write_register(NRF24_RX_PW_P0,MIN(payload_size,max_payload_size));
}

/****************************************************************************/

static const uint8_t child_pipe[] =
{
    NRF24_RX_ADDR_P0, NRF24_RX_ADDR_P1, NRF24_RX_ADDR_P2, NRF24_RX_ADDR_P3, NRF24_RX_ADDR_P4, NRF24_RX_ADDR_P5
};
static const uint8_t child_payload_size[] =
{
    NRF24_RX_PW_P0, NRF24_RX_PW_P1, NRF24_RX_PW_P2, NRF24_RX_PW_P3, NRF24_RX_PW_P4, NRF24_RX_PW_P5
};
static const uint8_t child_pipe_enable[] =
{
    NRF24_ERX_P0, NRF24_ERX_P1, NRF24_ERX_P2, NRF24_ERX_P3, NRF24_ERX_P4, NRF24_ERX_P5
};

void nrf24_openReadingPipe(uint8_t child, uint64_t address)
{
    // If this is pipe 0, cache the address.  This is needed because
    // openWritingPipe() will overwrite the pipe 0 address, so
    // startListening() will have to restore it.
    if (child == 0)
        pipe0_reading_address = address;

    if (child <= 6)
    {
        // For pipes 2-5, only write the LSB
        if ( child < 2 )
            nrf24_write_buffer(child_pipe[child], (const uint8_t*)(&address), 5);
        else
            nrf24_write_buffer(child_pipe[child], (const uint8_t*)(&address), 1);

        nrf24_write_register(child_payload_size[child],payload_size);

        // Note it would be more efficient to set all of the bits for all open
        // pipes at once.  However, I thought it would make the calling code
        // more simple to do it this way.
        nrf24_write_register(NRF24_EN_RXADDR,nrf24_read_register(NRF24_EN_RXADDR) | _BV(child_pipe_enable[child]));
    }
}

/****************************************************************************/

void nrf24_toggle_features(void)
{
    CSN_L;
    nrf24_readwrite( NRF24_ACTIVATE );
    nrf24_readwrite( 0x73 );
    CSN_H;
}

/****************************************************************************/

void nrf24_enableDynamicPayloads(void)
{
    // Enable dynamic payload throughout the system
    nrf24_write_register(NRF24_FEATURE,nrf24_read_register(NRF24_FEATURE) | _BV(NRF24_EN_DPL) );

    // If it didn't work, the features are not enabled
    if ( ! nrf24_read_register(NRF24_FEATURE) )
    {
        // So enable them and try again
        nrf24_toggle_features();
        nrf24_write_register(NRF24_FEATURE,nrf24_read_register(NRF24_FEATURE) | _BV(NRF24_EN_DPL) );
    }

    //IF_SERIAL_DEBUG(printf("FEATURE=%i\r\n",read_register(FEATURE)));

    // Enable dynamic payload on all pipes
    //
    // Not sure the use case of only having dynamic payload on certain
    // pipes, so the library does not support it.
    nrf24_write_register(NRF24_DYNPD,nrf24_read_register(NRF24_DYNPD) | _BV(NRF24_DPL_P5) | _BV(NRF24_DPL_P4) | _BV(NRF24_DPL_P3) | _BV(NRF24_DPL_P2) | _BV(NRF24_DPL_P1) | _BV(NRF24_DPL_P0));

    dynamic_payloads_enabled = true;
}

/****************************************************************************/

void nrf24_enableAckPayload(void)
{
    //
    // enable ack payload and dynamic payload features
    //

    nrf24_write_register(NRF24_FEATURE,nrf24_read_register(NRF24_FEATURE) | _BV(NRF24_EN_ACK_PAY) | _BV(NRF24_EN_DPL) );

    // If it didn't work, the features are not enabled
    if ( ! nrf24_read_register(NRF24_FEATURE) )
    {
        // So enable them and try again
        nrf24_toggle_features();
        nrf24_write_register(NRF24_FEATURE,nrf24_read_register(NRF24_FEATURE) | _BV(NRF24_EN_ACK_PAY) | _BV(NRF24_EN_DPL) );
    }

    //IF_SERIAL_DEBUG(printf("FEATURE=%i\r\n",read_register(FEATURE)));

    //
    // Enable dynamic payload on pipes 0 & 1
    //

    nrf24_write_register(NRF24_DYNPD,nrf24_read_register(NRF24_DYNPD) | _BV(NRF24_DPL_P1) | _BV(NRF24_DPL_P0));
}

/****************************************************************************/

void nrf24_writeAckPayload(uint8_t pipe, const void* buf, uint8_t len)
{
    const uint8_t* current = (const uint8_t*)(buf);

    CSN_L;
    //nrf24_readwrite( W_ACK_PAYLOAD | ( pipe & B111 ) );
    nrf24_readwrite( NRF24_W_ACK_PAYLOAD | ( pipe & 7 ) );
    const uint8_t max_payload_size = 32;
    uint8_t data_len = MIN(len,max_payload_size);
    while ( data_len-- )
        nrf24_readwrite(*current++);

    CSN_H;
}

/****************************************************************************/

bool nrf24_isAckPayloadAvailable(void)
{
    bool result = ack_payload_available;
    ack_payload_available = false;
    return result;
}

/****************************************************************************/

bool nrf24_isPVariant(void)
{
    return p_variant ;
}

/****************************************************************************/

bool nrf24_setAutoAck(bool enable)
{
    uint8_t val = 0;
    if ( enable )
        val = 63; // B111111

    nrf24_write_register(NRF24_EN_AA, val);

    return nrf24_read_register(NRF24_EN_AA) == val;
}

/****************************************************************************/

void nrf24_setAutoAck_perPipe( uint8_t pipe, bool enable )
{
    if ( pipe <= 6 )
    {
        uint8_t en_aa = nrf24_read_register( NRF24_EN_AA ) ;
        if( enable )
        {
            en_aa |= _BV(pipe) ;
        }
        else
        {
            en_aa &= ~_BV(pipe) ;
        }
        nrf24_write_register( NRF24_EN_AA, en_aa ) ;
    }
}

/****************************************************************************/

bool nrf24_testCarrier(void)
{
    return ( nrf24_read_register(NRF24_CD) & 1 );
}

/****************************************************************************/

bool nrf24_testRPD(void)
{
    return ( nrf24_read_register(NRF24_RPD) & 1 ) ;
}

/****************************************************************************/

void nrf24_setPALevel(nrf24_pa_dbm_e level)
{
    uint8_t setup = nrf24_read_register(NRF24_RF_SETUP) ;
    setup &= ~(_BV(NRF24_RF_PWR_LOW) | _BV(NRF24_RF_PWR_HIGH)) ;

    // switch uses RAM (evil!)
    if ( level == RF24_PA_MAX )
    {
        setup |= (_BV(NRF24_RF_PWR_LOW) | _BV(NRF24_RF_PWR_HIGH)) ;
    }
    else if ( level == RF24_PA_HIGH )
    {
        setup |= _BV(NRF24_RF_PWR_HIGH) ;
    }
    else if ( level == RF24_PA_LOW )
    {
        setup |= _BV(NRF24_RF_PWR_LOW);
    }
    else if ( level == RF24_PA_MIN )
    {
        // nothing
    }
    else if ( level == RF24_PA_ERROR )
    {
        // On error, go to maximum PA
        setup |= (_BV(NRF24_RF_PWR_LOW) | _BV(NRF24_RF_PWR_HIGH)) ;
    }

    nrf24_write_register( NRF24_RF_SETUP, setup ) ;
}

/****************************************************************************/

nrf24_pa_dbm_e nrf24_getPALevel(void)
{
    nrf24_pa_dbm_e result = RF24_PA_ERROR ;
    uint8_t power = nrf24_read_register(NRF24_RF_SETUP) & (_BV(NRF24_RF_PWR_LOW) | _BV(NRF24_RF_PWR_HIGH)) ;

    // switch uses RAM (evil!)
    if ( power == (_BV(NRF24_RF_PWR_LOW) | _BV(NRF24_RF_PWR_HIGH)) )
    {
        result = RF24_PA_MAX ;
    }
    else if ( power == _BV(NRF24_RF_PWR_HIGH) )
    {
        result = RF24_PA_HIGH ;
    }
    else if ( power == _BV(NRF24_RF_PWR_LOW) )
    {
        result = RF24_PA_LOW ;
    }
    else
    {
        result = RF24_PA_MIN ;
    }

    return result ;
}

/****************************************************************************/

bool nrf24_setDataRate(nrf24_datarate_e speed)
{
    bool result = false;
    uint8_t setup = nrf24_read_register(NRF24_RF_SETUP) ;

    // HIGH and LOW '00' is 1Mbs - our default
    wide_band = false ;
    setup &= ~(_BV(NRF24_RF_DR_LOW) | _BV(NRF24_RF_DR_HIGH)) ;
    if( speed == RF24_250KBPS )
    {
        // Must set the RF_DR_LOW to 1; RF_DR_HIGH (used to be RF_DR) is already 0
        // Making it '10'.
        wide_band = false ;
        setup |= _BV( NRF24_RF_DR_LOW ) ;
    }
    else
    {
        // Set 2Mbs, RF_DR (RF_DR_HIGH) is set 1
        // Making it '01'
        if ( speed == RF24_2MBPS )
        {
            wide_band = true ;
            setup |= _BV(NRF24_RF_DR_HIGH);
        }
        else
        {
            // 1Mbs
            wide_band = false ;
        }
    }
    nrf24_write_register(NRF24_RF_SETUP,setup);

    // Verify our result
    if ( nrf24_read_register(NRF24_RF_SETUP) == setup )
    {
        result = true;
    }
    else
    {
        wide_band = false;
    }

    return result;
}

/****************************************************************************/

nrf24_datarate_e nrf24_getDataRate( void )
{
    nrf24_datarate_e result ;
    uint8_t dr = nrf24_read_register(NRF24_RF_SETUP) & (_BV(NRF24_RF_DR_LOW) | _BV(NRF24_RF_DR_HIGH));

    // switch uses RAM (evil!)
    // Order matters in our case below
    if ( dr == _BV(NRF24_RF_DR_LOW) )
    {
        // '10' = 250KBPS
        result = RF24_250KBPS ;
    }
    else if ( dr == _BV(NRF24_RF_DR_HIGH) )
    {
        // '01' = 2MBPS
        result = RF24_2MBPS ;
    }
    else
    {
        // '00' = 1MBPS
        result = RF24_1MBPS ;
    }
    return result ;
}

/****************************************************************************/

void nrf24_setCRCLength(nrf24_crclength_e length)
{
    uint8_t config = nrf24_read_register(NRF24_CONFIG) & ~( _BV(NRF24_CRCO) | _BV(NRF24_EN_CRC)) ;

    // switch uses RAM (evil!)
    if ( length == RF24_CRC_DISABLED )
    {
        // Do nothing, we turned it off above.
    }
    else if ( length == RF24_CRC_8 )
    {
        config |= _BV(NRF24_EN_CRC);
    }
    else
    {
        config |= _BV(NRF24_EN_CRC);
        config |= _BV( NRF24_CRCO );
    }
    nrf24_write_register( NRF24_CONFIG, config ) ;
}

/****************************************************************************/

nrf24_crclength_e nrf24_getCRCLength(void)
{
    nrf24_crclength_e result = RF24_CRC_DISABLED;
    uint8_t config = nrf24_read_register(NRF24_CONFIG) & ( _BV(NRF24_CRCO) | _BV(NRF24_EN_CRC)) ;

    if ( config & _BV(NRF24_EN_CRC ) )
    {
        if ( config & _BV(NRF24_CRCO) )
            result = RF24_CRC_16;
        else
            result = RF24_CRC_8;
    }

    return result;
}

/****************************************************************************/

void nrf24_disableCRC( void )
{
    uint8_t disable = nrf24_read_register(NRF24_CONFIG) & ~_BV(NRF24_EN_CRC) ;
    nrf24_write_register( NRF24_CONFIG, disable ) ;
}

/****************************************************************************/
void nrf24_setRetries(uint8_t delay, uint8_t count)
{
    nrf24_write_register(NRF24_SETUP_RETR, (delay & 0xf) << NRF24_ARD | (count & 0xf) << NRF24_ARC);
}

// vim:ai:cin:sts=2 sw=2 ft=cpp

