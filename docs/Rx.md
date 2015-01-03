
# Receivers (RX)

## Parallel PWM

8 channel support, 1 channel per input pin.  On some platforms using parallel input will disable the use of serial ports
and softserial making it hard to use telemetry or gps features.

## PPM (PPM SUM)

12 channels via a single input pin, not as accurate or jitter free as methods that use serial communications.

## MultiWii serial protocol (MSP)

Allows you to use MSP commands as the RC input.  Only 8 channel support to maintain compatibility with MSP.

## Spektrum

12 channels via serial currently supported.

## SBUS

16 channels via serial currently supported.  See the Serial chapter in the documentation for a configuration example.

* In most cases you will need an inverter between the receiver output and the flight controller hardware.  
* Softserial ports cannot be used with SBUS because it runs at too high of a bitrate (1Mbps).  Refer to the chapter specific to your board to determine which port(s) may be used.
* You will need to configure the channel mapping in the GUI (Receiver tab) or CLI (`map` command).

## XBus

The firmware currently supports the MODE B version of the XBus protocol.
Make sure to set your TX to use "MODE B" for XBUS in the TX menus!
See here for info on JR's XBus protocol: http://www.jrpropo.com/english/propo/XBus/

Tested hardware: JR XG14 + RG731BX with NAZE32 (rev4)
With the current CLI configuration:
 `set serialrx_provider=5`
 `set serial_port_2_scenario=3`
 `feature RX_SERIAL`
  
This will set the FW to use serial RX, with XBUS_MODE_B as provider and finally the scenario to be used for serial port 2. 
Please note that your config may vary depending on hw used.

### OpenTX configuration

If using OpenTX set the transmitter module to D16 mode and select CH1-16 on the transmitter before binding to allow reception
of 16 channels. 

OpenTX 2.09, which is shipped on some Taranis X9D Plus transmitters, has a bug - [issue:1701](https://github.com/opentx/opentx/issues/1701).
The bug prevents use of all 16 channels.  Upgrade to the latest OpenTX version to allow correct reception of all 16 channels,
without the fix you are limited to 8 channels regardless of the CH1-16/D16 settings.

## SUMD

16 channels via serial currently supported.

## SUMH

8 channels via serial currently supported.

 
### Configuration

See the Configuration document some some RX configuration examples.

For Serial RX enable `RX_SERIAL` and set the `serialrx_provider` cli setting as follows.

| Serial RX Provider | Value |
| ------------------ | ----- |
| SPEKTRUM1024       | 0     |
| SPEKTRUM2048       | 1     |
| SBUS               | 2     |
| SUMD               | 3     |
| SUMH               | 4     |
| XBUS_MODE_B        | 5     |


#### PPM/PWM input filtering.

Hardware input filtering can be enabled if you are experiencing interference on the signal sent via your PWM/PPM RX.

Use the `input_filtering_mode` cli setting to select a mode.

| Value | Meaning   |
| ----- | --------- |
| 0     | Disabled  |
| 1     | Enabled   |

