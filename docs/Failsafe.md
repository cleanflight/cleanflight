# Failsafe

There are two types of failsafe:

1. Receiver based failsafe
2. Flight controller based failsafe

Receiver based failsafe is where you, from your transmitter and receiver, configure channels to output desired signals if your receiver detects signal loss.
The idea is that you set throttle and other controls so the aircraft descends in a controlled manner.  See your receiver's documentation for this method.

Flight controller based failsafe is where the flight controller attempts to detect signal loss from your receiver.

It is possible to use both types at the same time, which may be desirable.  Flight controller failsafe can even help if your receiver signal wires come loose, get damaged or your receiver malfunctions in a way the receiver itself cannot detect.

Alternatively you may configure a transmitter switch to activate failsafe mode. This is useful for fieldtesting the failsafe system and as a **_`PANIC`_** switch when you lose orientation.

## Flight controller failsafe system 

The failsafe system is not activated until 5 seconds after the flight controller boots up.  This is to prevent failsafe from activating, as in the case of TX/RX gear with long bind procedures, before the RX sends out valid data. Note that you need to enable the 'FAILSAFE' feature in order to activate failsafe on the flight controller.

The failsafe system attempts to detect when your receiver loses signal *only when your craft is __armed__*.  It then attempts to prevent your aircraft from flying away uncontrollably by enabling an auto-level mode and setting the throttle that should allow the craft to come to a safer landing.

**The failsafe is activated when the craft is armed and either:**

* No valid channel data from the RX is received via Serial RX.
* Not using PPM and one of the first 4 channels do not have valid signals.
* Using PPM and one of the channels in the PPM stream do not have valid signals.
* A transmitter switch that is configured to control the failsafe mode is switched ON.

Failsafe intervention will be aborted when it was due to:

* a lost RC signal and the RC signal has recovered.
* a transmitter failsafe switch was set to ON position and the switch is set to OFF position.

Note that:
* At the end of a failsafe intervention, the flight controller will be disarmed and re-arming will be locked. From that moment on it is no longer possible to abort or re-arm and the flight controller has to be reset. 

Some notes about **SAFETY**:
* The failsafe system will be activated regardless of current throttle position. So when the failsafe intervention is aborted (RC signal restored/failsafe switch set to OFF) the current stick position will direct the craft !
* The craft may already be on the ground with motors stopped and that motors and props could spin again - the software does not currently detect if the craft is on the ground.  Take care when using `MOTOR_STOP` feature. **Props will spin up without warning**, when armed with `MOTOR_STOP` feature ON (props are not spinning) **_and_** failsafe is activated !

## Configuration

When configuring the flight controller failsafe, use the following steps:

1.  Configure your receiver to do one of the following:

* Upon signal loss, send no signal/pulses over the channels
* Send an invalid signal over the channels (for example, send values lower than 'failsafe_min_usec')

See your receiver's documentation for direction on how to accomplish one of these.

* Configure one of the transmitter switches to activate the failsafe mode.

2.  Set 'failsafe_off_delay' to an appropriate value based on how high you fly

3.  Set 'failsafe_throttle' to a value that allows the aircraft to descend at approximately one meter per second (default is 1000 which should be throttle off).

4.  Enable 'FAILSAFE' feature in Cleanflight GUI or via CLI using `feature FAILSAFE`


These are the basic steps for flight controller failsafe configuration; see Failsafe Settings below for additional settings that may be changed.

##Failsafe Settings

Failsafe delays are configured in 0.1 second steps.

1 step = 0.1sec

1 second = 10 steps

### `failsafe_delay`

Guard time for failsafe activation after signal lost.  This is the amount of time the flight controller waits to see if it begins receiving a valid signal again before activating failsafe.

### `failsafe_off_delay`

Delay after failsafe activates before motors finally turn off.  This is the amount of time 'failsafe_throttle' is active.  If you fly at higher altitudes you may need more time to descend safely.

### `failsafe_throttle`

Throttle level used for landing.  Specify a value that causes the aircraft to descend at about 1M/sec. Default is set to 1000 which should correspond to throttle off.

Use standard RX usec values.  See Rx documentation.

### `failsafe_min_usec`

The shortest PWM/PPM pulse considered valid.

Only valid when using Parallel PWM or PPM receivers.

### `failsafe_max_usec`

The longest PWM/PPM pulse considered valid.

Only valid when using Parallel PWM or PPM receivers.

This setting helps detect when your RX stops sending any data when the RX looses signal.

With a Graupner GR-24 configured for PWM output with failsafe on channels 1-4 set to OFF in the receiver settings then this setting, at its default value, will allow failsafe to be activated.

## Testing

**Bench test the failsafe system before flying - _remove props while doing so_.**

1. Arm the craft.
1. Turn off transmitter or unplug RX.
1. Observe motors spin at configured throttle setting for configured duration.
1. Observe motors turn off after configured duration.
1. Ensure that when you turn on your TX again or reconnect the RX that you cannot re-arm once the motors have stopped.
1. Power cycle the FC.
1. Arm the craft.
1. Turn off transmitter or unplug RX.
1. Observe motors spin at configured throttle setting for configured duration.
1. Turn on TX or reconnect RX.
1. Ensure that your switch positions don't now cause the craft to disarm (otherwise it would fall out of the sky on regained signal).
1. Observe that normal flight behavior is resumed.
1. Disarm.
 
**Field test the failsafe system.**

1. Perform bench testing first!
1. On a calm day go to an unpopulated area away from buildings or test indoors in a safe controlled environment - e.g. inside a big net.
1. Arm the craft.
1. Hover over something soft (long grass, ferns, heather, foam, etc.).
1. Descend the craft and observe throttle position and record throttle value from your TX channel monitor.  Ideally 1500 should be hover. So your value should be less than 1500.
1. Stop, disarm.
1. Set failsafe throttle to the recorded value.
1. Arm, hover over something soft again.
1. Turn off TX (!)
1. Observe craft descends and motors continue to spin for the configured duration.
1. Observe FC disarms after the configured duration.
1. Remove flight battery.

If craft descends too quickly then increase failsafe throttle setting.

Ensure that the duration is long enough for your craft to land at the altitudes you normally fly at.

Using a configured transmitter switch to activate failsafe mode, instead of switching off your TX, is good primary testing method in addition to the above procedure.
