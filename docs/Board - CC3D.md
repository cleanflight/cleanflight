# Board - CC3D

The OpenPilot Copter Control 3D aka CC3D is a board more tuned to Acrobatic flying or GPS based
auto-piloting.  It only has one sensor, the MPU6000 SPI based Accelerometer/Gyro.
It also features a 16Mbit SPI based EEPROM chip.  It has 6 ports labeled as inputs (one pin each)
and 6 ports labeled as motor/servo outputs (3 pins each).

If issues are found with this board please report via the [github issue tracker](https://github.com/cleanflight/cleanflight/issues).

The board has a USB port directly connected to the processor.  Other boards like the Naze and Flip32
have an on-board USB to uart adapter which connect to the processor's serial port instead.

The board cannot currently be used for hexacopters/octocopters.

Tricopter & Airplane support is untested, please report success or failure if you try it.

# Pinouts

The 8 pin RC_Input connector has the following pinouts when used in RX_PPM/RX_SERIAL mode

| Pin | Function  | Notes                            |
| --- | --------- | -------------------------------- |
| 1   | Ground    |                                  |
| 2   | +5V       |                                  |
| 3   | PPM Input | Enable `feature RX_PPM`          |
| 4   | SoftSerial1 TX / Sonar trigger | |
| 5   | SoftSerial1 RX / Sonar Echo    | |
| 6   | Current   | Enable `feature CURRENT_METER`.  Connect to the output of a current sensor, 0v-3.3v input |
| 7   | Battery Voltage sensor | Enable `feature VBAT`. Connect to main battery using a voltage divider, 0v-3.3v input |
| 8   | RSSI      | Enable `feature RSSI_ADC`.  Connect to the output of a PWM-RSSI conditioner, 0v-3.3v input |

The 6 pin RC_Output connector has the following pinouts when used in RX_PPM/RX_SERIAL mode

| Pin | Function  | Notes |
| --- | ----------| ------|
| 1   | MOTOR 1   |       |
| 2   | MOTOR 2   |       |
| 3   | MOTOR 3   |       |
| 4   | MOTOR 4   |       |
| 5   | LED Strip |       |
| 6   | Unused    |       |

The 8 pin RC_Input connector has the following pinouts when used in RX_PARALLEL_PWM mode

| Pin | Function | Notes |
| --- | ---------| ------|
| 1   | Ground   |       |
| 2   | +5V      |       |
| 3   | Unused   |       |
| 4   | CH1      |       |
| 5   | CH2      |       |
| 6   | CH3      |       |
| 7   | CH4/Battery Voltage sensor      | CH4 if battery voltage sensor is disabled |
| 8   | CH5/CH4  | CH4 if battery voltage monitor is enabled|

The 6 pin RC_Output connector has the following pinouts when used in RX_PARALLEL_PWM mode

| Pin | Function | Notes |
| --- | ---------| ------|
| 1   | MOTOR 1  |       |
| 2   | MOTOR 2  |       |
| 3   | MOTOR 3  |       |
| 4   | MOTOR 4  |       |
| 5   | Unused   |       |
| 6   | Unused   |       |

# Serial Ports

| Value | Identifier   | Board Markings | Notes                                     |
| ----- | ------------ | -------------- | ------------------------------------------|
| 1     | VCP          | USB PORT       |                                           |
| 2     | USART1       | MAIN PORT      | Connected to an MCU controllable inverter |
| 3     | USART3       | FLEX PORT      |                                           |
| 4     | SoftSerial   | RC connector   | Pins 4 and 5 (Tx and Rx respectively)     |

The SoftSerial port is not available when RX_PARALLEL_PWM is used. The transmission data rate is limited to 19200 baud.

To connect the GUI to the flight controller you just need a USB cable to use the Virtual Com Port (VCP) or you can use UART1 (Main Port).

CLI access is only available via the VCP by default.

# Main Port

The main port has MSP support enabled on it by default.

The main port is connected to an inverter which is automatically enabled as required.  For example, if the main port is used for SBus Serial RX then an external inverter is not required.

# Flex Port

The flex port will be enabled in I2C mode unless USART3 is used.  You can connect external I2C sensors and displays to this port.

You cannot use USART3 and I2C at the same time.

## Flex port pinout

| Pin | Signal             | Notes                   |
| --- | ------------------ | ----------------------- |
| 1   | GND                |                         |
| 2   | VCC unregulated    |                         |
| 3   | I2C SCL / UART3 TX | 3.3v level              |
| 4   | I2C SDA / UART3 RX | 3.3v level (5v tolerant |


# Flashing

Since 1.11.0 release there is only one way to get Cleanflight onto a CC3D board: flash it to board using an FTDI USB-TTL converter and special software:
* Windows only: (STM Flash Loader Demonstrator)[http://www.st.com/web/en/catalog/tools/PF257525]
* Windows/Linux/OS X: (stm32flash utility)[http://sourceforge.net/projects/stm32flash/]. Here is a (manual online)[http://manpages.ubuntu.com/manpages/wily/man1/stm32flash.1.html]

Please not that some user have issues with flashing CC3D via non-FTDI adapter. In that case "STM Flash Loader Demonstrator" just cannot connect to the target. Also, Arduino's embedded FTDIs may not work too.

The image can be flashed by an USB to UART adapter connected to the main port when the CC3D is put into the STM32 bootloader mode by powering on the CC3D with the SBL/3.3v pads bridged. You can than upgrade cleanflight with USB-Serial adapter via Cleanflight configurator without shorting boot pins.

## Flashing process

### Flashing with "STM Flash Loader Demonstrator"
Here is a [blogpost about it](http://dronehitech.com/flash-cleanflight-cc3d-arduino/)

1. Obtain an USB-TTL adapter. FTDI is recommended.
2. Set up drivers for it.
3. Download and install ("STM Flash Loader Demonstrator")[http://www.st.com/web/en/catalog/tools/PF257525#]
4. Download and store somewhere cleanflight_CC3D.hex from (release you want to flash)[https://github.com/cleanflight/cleanflight/releases].
5. Connect Tx with Rx, Rx with Tx, Gnd with Gnd, Vcc with Vcc from FTDI to Main CC3D port.
6. Short SBL and 3.3 pads on top of the CC3D board. Pads should be shorted while booting only, then you can release it.
7. Connect FTDI to USB port. Blue LED should not blink - it means the CC3D is in bootloader mode.
8. Run "STM Flash Loader Demonstrator". Select COM port with FTDI on it.
9. Press "Next", "Next", "Next" and get to flashing page. If software freezes after first "Next" you have to disconnect board from power and try again.
10. On flashing page select "Erase", "All" checkboxes (is selected by default). Press next and wait for finish.
11. Press "Back". Select downloaded cleanflight_CC3D.hex, check "Verify after download". Press "Next" and wait for finish.
12. Done. Software may fail on verification stage with error like "Failed to verify, check flash protection". It is okay, you still can use it.

### Flashing with stm32flash

Flashing in boot mode (shorted boot pads)
```bash
#!/bin/bash

SPEED=${1:-115200}
stty -F /dev/ttyUSB0 raw speed $SPEED -crtscts cs8 -parenb -cstopb -ixon
stm32flash -w cleanflight/obj/cleanflight_CC3D.hex -v -g 0x0 -b $SPEED /dev/ttyUSB0
```

Normal flashing after bootloader installed
Is equal to run `make TARGET=CC3D flash` on cleanflight repository.
```bash
#!/bin/bash

SPEED=${1:-115200}
stty -F /dev/ttyUSB0 raw speed $SPEED -crtscts cs8 -parenb -cstopb -ixon
echo -n 'R' >/dev/ttyUSB0
stm32flash -w cleanflight/obj/cleanflight_CC3D.hex -v -g 0x0 -b $SPEED /dev/ttyUSB0
```

# Upgrading

You can connect CC3D to cleanflight configurator by USB, but you cannot upgrade board by USB. You have to use FTDI connected to Main port and upgrade firmware via cleanflight configurator "Firmware" tab. You don't have to short 3.3 and SBL pads to do that.


# Restoring OpenPilot bootloader

If you have a JLink debugger, you can use JLinkExe to flash the open pilot bootloader.

1. Run JLinkExe `/Applications/SEGGER/JLink/JLinkExe`
2. `device STM32F103CB`
3. `r`
4. `h`
5. `loadbin opbl.bin, 0x08000000`
6. `q`
7. Re-plug CC3D.

Here's an example session:

```
$ /Applications/SEGGER/JLink/JLinkExe
SEGGER J-Link Commander V4.90c ('?' for help)
Compiled Aug 29 2014 09:52:38
DLL version V4.90c, compiled Aug 29 2014 09:52:33
Firmware: J-Link ARM-OB STM32 compiled Aug 22 2012 19:52:04
Hardware: V7.00
S/N: -1
Feature(s): RDI,FlashDL,FlashBP,JFlash,GDBFull
VTarget = 3.300V
Info: Could not measure total IR len. TDO is constant high.
Info: Could not measure total IR len. TDO is constant high.
No devices found on JTAG chain. Trying to find device on SWD.
Info: Found SWD-DP with ID 0x1BA01477
Info: Found Cortex-M3 r1p1, Little endian.
Info: FPUnit: 6 code (BP) slots and 2 literal slots
Info: TPIU fitted.
Cortex-M3 identified.
Target interface speed: 100 kHz
J-Link>device STM32F103CB
Info: Device "STM32F103CB" selected (128 KB flash, 20 KB RAM).
Reconnecting to target...
Info: Found SWD-DP with ID 0x1BA01477
Info: Found SWD-DP with ID 0x1BA01477
Info: Found Cortex-M3 r1p1, Little endian.
Info: FPUnit: 6 code (BP) slots and 2 literal slots
Info: TPIU fitted.
J-Link>r
Reset delay: 0 ms
Reset type NORMAL: Resets core & peripherals via SYSRESETREQ & VECTRESET bit.
J-Link>h
PC = 0800010C, CycleCnt = 00000000
R0 = 0000000C, R1 = 0000003F, R2 = 00000000, R3 = 00000008
R4 = 00003000, R5 = 023ACEFC, R6 = 200000F0, R7 = 20000304
R8 = 023B92BC, R9 = 00000000, R10= ED691105, R11= F626177C
R12= 000F0000
SP(R13)= 20000934, MSP= 20000934, PSP= 20000934, R14(LR) = FFFFFFFF
XPSR = 01000000: APSR = nzcvq, EPSR = 01000000, IPSR = 000 (NoException)
CFBP = 00000000, CONTROL = 00, FAULTMASK = 00, BASEPRI = 00, PRIMASK = 00
J-Link>loadbin opbl.bin, 0x08000000
Downloading file [opbl.bin]...
WARNING: CPU is running at low speed (8004 kHz).
Info: J-Link: Flash download: Flash download into internal flash skipped. Flash contents already match
Info: J-Link: Flash download: Total time needed: 0.898s (Prepare: 0.709s, Compare: 0.128s, Erase: 0.000s, Program: 0.000s, Verify: 0.000s, Restore: 0.059s)
O.K.
J-Link>q
$
```
