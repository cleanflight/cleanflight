# Modes

Cleanflight has various modes that can be toggled on or off.  Modes can be enabled/disabled by stick positions,
auxillary receiver channels and other events such as failsafe detection.

| ID  | Short Name | Function                                                             |
| --- | ---------- | -------------------------------------------------------------------- |
| 0   | ARM        | Enables motors and flight stabilisation                              |
| 1   | ANGLE      | Legacy auto-level flight mode                                        |
| 2   | HORIZON    | Auto-level flight mode                                               |
| 3   | BARO       | Altitude hold mode (Requires barometer sensor)                       |
| 4   | MAG        | Heading lock                                                         |
| 5   | HEADFREE   | Head Free - When enabled yaw has no effect on pitch/roll inputs      |
| 6   | HEADADJ    | Heading Adjust - Sets a new yaw origin for HEADFREE mode             |
| 7   | CAMSTAB    | Camera Stabilisation                                                 |
| 8   | CAMTRIG    |                                                                      |
| 9   | GPSHOME    | Autonomous flight to HOME position                                   |
| 10  | GPSHOLD    | Maintain the same longitude/lattitude                                |
| 11  | PASSTHRU   |                                                                      |
| 12  | BEEPERON   | Enable beeping - useful for locating a crashed aircraft              |
| 13  | LEDMAX     |                                                                      |
| 14  | LEDLOW     |                                                                      |
| 15  | LLIGHTS    |                                                                      |
| 16  | CALIB      |                                                                      |
| 17  | GOV        |                                                                      |
| 18  | OSD        | Enable/Disable On-Screen-Display (OSD)                               |
| 19  | TELEMETRY  | Enable telemetry via switch                                          |
| 20  | AUTOTUNE   | Autotune Pitch/Roll PIDs                                             |
| 21  | SONAR      | Altitude hold mode (sonar sensor only)                               |

## Mode details

### Headfree

In this mode, the "head" of the multicopter is always pointing to the same direction as when the feature was activated. This means that when the multicopter rotates around the Z axis (yaw), the controls will always respond according the same "head" direction.

With this mode is easier to control the multicopter, even fly it with the physical head towards you since the controls always respond the same. This is a friendly mode to new users of multicopters and can prevent losing the control when you don't know the head direction. 

## GPS Return To Home

WORK-IN-PROGRESS.  This mode is not reliable yet, please share your experiences with the developers.

In this mode the aircraft attempts to return to the GPS position recorded when the aircraft was armed.

This mode should be enabled in conjunction with Angle or Horizion modes and an Altitude hold mode.

Requires a 3D GPS fix and minimum of 5 satallites in view.

## GPS Position Hold

WORK-IN-PROGRESS.  This mode is not reliable yet, please share your experiences with the developers.

In this mode the aircraft attempts to stay at the same GPS position, as recorded when the mode is enabled.

Disabling and re-enabling the mode will reset the GPS hold position.

This mode should be enabled in conjunction with Angle or Horizion modes and an Altitude hold mode.

Requires a 3D GPS fix and minimum of 5 satallites in view.

## Auxillary Configuration

Spare auxillary receiver channels can be used to enable/disable modes.  Some modes can only be enabled this way.

Configure your transmitter so that switches or dial (pots) send channel data on channels 5 upwards.
e.g. You can configure a 3 position switch to send 1000 when the switch is low, 1500 when the switch is in the middle and 2000 when the switch is high.

Configure your tx/rx channel limits to use values between 1000 and 2000.

When a channel is within a specifed range the corresponding mode is enabled.

Use the GUI configuration tool to allow easy configuration when channel.

### CLI 

There is a CLI command, `aux` that allows auxillary configuration.  It takes 5 arguments as follows:

* AUD range slot number (0 - 39)
* mode id (see mode list above)
* AUX channel index (AUX1 = 0, AUX2 = 1,... etc)
* low position, from 900 to 2100. Should be a multiple of 25.
* high position, from 900 to 2100. Should be a multiple of 25.

If the low and high position are the same then the values are ignored.

e.g.

Configure AUX range slot 0 to enable ARM when AUX1 is withing 1700 and 2100.
 
```aux 0 0 0 1700 2100```

You can display the aux configuration by using the `aux` command with no arguments.

