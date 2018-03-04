## Important information when upgrading from Cleanflight 2.2 to Cleanflight 2.3

- To get optimal support for configuration and tuning of the firmware, please use the latest version of the Cleanflight configurator.
- If you are using OpenTX and the lua scripts, please also make sure to use the latest version of these.
- This release is introducing Runaway Takeoff Prevention (BF#4935). This feature will prevent uncontrollable acceleration ('tasmanian devil') when the craft is armed with misconfigured motor outputs or props on the wrong way, by disarming the craft if such a configuration is detected. It will also cause disarms when throttling up quickly on the bench with props off. If you get unwanted disarms right after arming, use the parameters (`runaway_takeoff_deactivate_delay`, `runaway_takeoff_deactivate_throttle_percent`) to tune the function to work for you, and please report back your working configuration. See the [wiki article](https://github.com/betaflight/betaflight/wiki/Runaway-Takeoff-Prevention) for details.
- The orientation of the AK8963 magnetometer has been changed, to make it match the orientation it has when it comes integrated in the MPU9250 gyro / accelerometer / magnetometer chip. If you are using an external AK8963 magnetometer, check your orientation to make sure it is still correct. If not, use the `align_mag` to configure the correct orientation;
- More possible reasons for arming to be disabled have been added. Because of this, and because counting the 'arming disabled' beep indications was becoming difficult, the method of how the arming disabled reason is indicated has been changed. See the [wiki article](https://github.com/betaflight/betaflight/wiki/Arming-Sequence-&-Safety#arming-prevention) for details.
- Arming is now disabled when the flight controller is connected to the configurator. This was added in order to keep users from accidentally arming their craft when testing their RX / mode switches with a battery connected. In order to enable arming for bench testing, go to the 'Motors' tab and enable the 'Motor test mode' switch (**REMOVE ALL PROPELLERS FIRST**);
- The parameter `sbus_inversion` has been changed into `serialrx_inverted`, and the way it is applied has been changed as follows: It now applies to all RX protocols, not just SBus, and instead of switching the UART to normal when off and inverted when on, 'off' now means that the port is set to whatever the default is for the selected protocol (i.e. inverted for SBus, not inverted for SUMD), and 'on' means that the port is inverted from default (i.e. not inverted for SBus, inverted for SUMD);
- The way that rates are configured has been changed (BF#4973). Independent rates settings for roll / pitch / yaw are now supported. When updating from an older version of the firmware, make sure to convert your settings to the new parameters as follows: `rc_rate` becomes `roll_rc_rate` and `pitch_rc_rate`, `rc_rate_yaw` becomes `yaw_rc_rate`, `rc_expo` becomes `roll_expo` and `pitch_expo`, and `rc_expo_yaw` becomes `yaw_expo`. The same change also makes 'RaceFlight' type rate settings available. Set `rates_type = raceflight`. After this, 'rc_rate_<axis>' is RaceFlight 'rate' (scaled down by a factor of 10), `<axis>_expo` is RaceFlight 'expo', and `<axis>_srate` is RaceFlight 'acro+';
- The `DISABLE 3D` mode is now called `DISABLE / SWITCH 3D` (BF#5179). In default configuration it works in the same way it used to work before. With `3d_switched_mode = on`, 'switched 3d mode' is enabled: With the 3D switch on, the throttle goes from forward thrust idle (min) to forward thrust full (max), which is the same as with `3d_switched_mode = off`. With the 3D switch off, the throttle goes from reversed thrust idle (min) to reversed thrust full (max). This allows the pilot to fly 3d by using the full throttle range in normal / reversed position, by switching motor directions with the switch when flipping over;
- The `disarm_kill_switch` function that allowed (switch) disarming to be set up to be only possible on low throttle has been removed. There is no use case that requires it, and having it enabled introduces the safety risk of not being able to reliably disarm in an emergency.


## Major features:

- Added support for the FrSky FPort protocol (BF#4158);
- Added Spektrum VTX control (BF#4434);
- Added CMS configuration over Spektrum telemetry (BF#4545);
- Added FrSky X SPI RX protocol (BF#4683);
- Added fast Biquad RC+FIR2 filter (optimised version of  Kalman gyro filter in #4890) (BF#4965);
- Added Runaway Takeoff Prevention (anti-taz) (BF#4935).


## Minor features:

- Added CMS power menu (BF#3724);
- Added support for FlySky SPI receiver (BF#4060);
- Added use TIM_UP and DMAR for all timer channels with Dshot (BF#4073, BF#4843, BF#4852);
- Added '3D on a switch' mode (BF#4227);
- Added Dshot beacon activation to BEEPER_RX_LOST_LANDING (BF#4231);
- Added generic RunCam device protocol support (BF#4251);
- Added a reasonable default OSD layout (BF#4260);
- Added handling and display of date and time (BF#4289);
- Added MSP command to disable arming (BF#4320);
- Added support for Spektrum real RSSI from SRXL Rx and fake RSSI from both int and ext bound satellites (BF#4347);
- Changed after flight OSD statistics screen to only show when enabled (BF#4428);
- Added remaining time estimate based on flight used mAh rate to OSD (BF#4487, BF#4543, BF#4618);
- Added setting of RSSI value with MSP (BF#4507);
- Improved SmartAudio update frequency (make it QuietAudio) (BF#4532);
- Updated PID calculations to use actual deltaT (BF#4556);
- Added AND logic to modes (BF#4722);
- Add TCM support to F7 (BF#4757);
- Added Benewake TFmini/TF02 rangefinder support  (BF#4793);
- Added selectable RaceFlight rates (BF#4973);
- Added KN (NRF24) SPI RX protocol (BF#4994);
- Added Spektrum VTX status via telemtry (BF#5081);
- Added PINIOBOX BOX to PINIO general purpose pin output mapper (BF#5110).
