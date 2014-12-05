## Oneshot
Oneshot allows faster communication between the Flight Controller and the ESCs that are present on your multirotor.
It does this in two ways:

1. Use a signal that varies between 125 탎 and 250 탎 (instead of the normal PWM timing of 1000탎 to 2000탎)
2. Only send a 'shot' once per flight controller loop, and do this as soon as the flight controller has calculated the required speed of the motors.


## Supported ESCs
At present, only the FlyDuino KISS ESCs are able to use the Oneshot125 protocol.


## Supported Boards
The Naze boards are supported, and have been flight tested in a number of configurations.
CC3D boards have been tested with a PPM receiver; however parallel PWM receivers might not work properly with this board.


## Enabling Oneshot
To configure Oneshot, you must turn off any power to your ESCs.  
It is a good idea at this stage to configure your ESC for oneshot mode (by soldering JP1 in the case of the KISS ESC).
Connect a USB cable to your board, and connect using the Chrome GUI app.

Go to the CLI tab, and type the following:

	feature ONESHOT125
	save

Then you can safely power up your ESCs again.


## Configuration
The process for calibrating oneshot ESCs is the same as any other ESC.

1. Ensure that your ESCs are not powered up.
2. Connect to the board using a USB cable, and change to the motor test page.
3. Set the motor speed to maximum using the main slider.
4. Connect power to your ESCs.  They will beep.
5. Click on the slider to bring the motor speed down to zero.  The ESCs will beep again, usually a couple of times.
6. Disconnect the power from your ESCs.
7. Re-connect power to your ESCs, and verify that moving the motor slider makes your motors spin up normally.


## Reference
* FlyDuino (<a href="http://flyduino.net/">http://flyduino.net/</a>)