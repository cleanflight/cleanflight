#Board - STM32F103-DIP40

The little,  extremely affordable and cheap(7$ only) development board which you can found in some  young democracy countries of the wild East of Europe. Certainly it is of Chinese origin, and because it can be useful around the World for low-cost auto-piloting for foamboard planes and little multicopters. The board not reccomended to be used for big and expensive multicopters.

It made in format size of old-fashioned DIP40 chips, and all controller ports pins are connected to "normal" external pins on both sides of board. Not very convenient, but very simple for using and extending. Mini-USB connector are standard, and you can give power supply to board via it. The board has a USB port directly connected to the processor, but hasn't any sensors, alas (you need to use external sensor boards like GY-80,GY-85,GY-521 etc connected via I2C)
Additionally, it has onboard voltage stabilizer 3.3 V(which "in" and "out" are connected to external pins, range of external supply can be 5-18V) this output will be useful for sensors powering.  Moreover, it has one led, but it connected poorly (ATTENTION- to the I2C port pin!!!) and for good results you must be  carefully cut  its wire by knife(it easy).

If issues are found with this board please report via the [github issue tracker](https://github.com/cleanflight/cleanflight/issues).

Multicopters support is untested, please report success or failure if you try it. 

# Pinouts

The 8 pin RC_Input connector has the following pinouts when used in RX_PPM/RX_SERIAL mode

| Pin | Function         | Notes                            |
| --- | ---------------- | -------------------------------- |
| 1   | +5V              |                                  |
| 2   | Ground           |                                  |

         RC Input
| 15  | in PPM/PWM-Ch1   | A0
| 14  | in PWM-Ch2       | A1
| 13* | in PWM-Ch        | A2
| 12* | in PWM-Ch4       | A3
| 9   | in PWM-Ch5       | A6
| 8   | in PWM-Ch6       | A7
| 7   | in PWM-Ch7       | B0
| 6   | in PWM-Ch8       | B1

          RC output
| 36  | out PWM-Ch1      | A8     Left Wing  elevon		
| 33  | out PWM-Ch2      | A11    Right Wing elevon
| 24  | out PWM-Ch3      | B6     Motor
| 23  | out PWM-Ch4      | B7
| 22  | out PWM-Ch5      | B8
| 21  | out PWM-Ch6      | B9

         Serial Ports
| 35  | Comm 1 TX        | A9 Used for device flashing
| 34  | Comm 1 RX        | A10
| 13  | TX2*             | A2
| 12  | RX2*             | A3
| USB | Virtual Com Port | Enabled by default as main com port (MSP access and CLI)           |

       Sensors  
| 3   | SDA (i2c)        | B11
| 4   | SCL (i2c)        | B10 (ATTENTION!!! cut the wire under onboard led before i2c using !!!)
| 11  | Battery Voltage sensor | A4 Enable `feature VBAT`. Connect to main battery using a voltage divider, 0v-3.3v input 
|     | Current   | Enable `feature CURRENT_METER`.  Connect to the output of a current sensor, 0v-3.3v input |
|    | RSSI      | Enable `feature RSSI_ADC`.  Connect to the output of a PWM-RSSI conditioner, 0v-3.3v input |
|     | Sonar trigger | |
|     | Sonar Echo    | |

      Other
| 32  | BUZZER           | A12
| 26  | LED_0            | B3
| 27  | LED_1            | B4

VCP usig as Main Port by default
Seial port 1 using for device flashing 
Seial port 2 using for serial GPS receivers connecting

The SoftSerial ports a disabled by defult

To connect the GUI to the flight controller you just need a USB cable to use the Virtual Com Port (VCP) or you can use UART1 

CLI access is only available via the VCP by default.



The Seial port 1 is connected to an inverter which is automatically enabled as required.  For example, if the main port is used for SBus Serial RX then an external inverter is not required (not tested)



# Flashing

The entire flash ram on the target processor is flashed with a single image.

Officially board has chip with flash size of 64Ê only, but in fact it has even all 128K (and it work good!) Because of this you can flashing this chip to all it full "prohibited big size" (and save some a little money again )

The image can be flashed by using a USB to UART adapter connected to the main port when the board is put into the STM32 bootloader mode, achieved by powering board from externul power supply.

