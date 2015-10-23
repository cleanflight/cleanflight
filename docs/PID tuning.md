# Controller introduction

The model of a controller as used by Cleanflight can be descriped as a pice of software that is designed to minimize errors. In general the controller compares the desired vaule which is given by the RC inputs against the actual value which is sensed by the numerous sensors. Thereby it calculates the deviation - further called Error. This error is then fed into a algorithm that has some knowledge of the system it controls (the aircraft). The end-product or rather the output of the controller is the control value that is designated to correct the error. So the parameters given in the configurator screen (also often referenced as "PIDs") can be imagined as the "knowledge" of the system by the controller. That means that the optimal PID settings to use are different on every craft.

##PIDs

The acronym PID stands for the three main components of the controller: Proportional, Integral and Derivative. These components further called Terms are complete controllers by itself but work together to find the best possible output value to correct the sensed error. Each term uses the tuning factor as a gain for its algorithm. Therefore the terms can be disabled to isolate problems by setting the corresponding gain to 0.

**The P term** is a simple controller. It only does a multiplication of the error with its gain. Therefore it is not time variant and gives the fastest possible response to an error. On the other hand the P term is unprecise. There must be an error for the P term to become active. The maximum error in steady state can be reduced by increasing the P gain but at some point the system will get instable. P Oszillations will generally manifest as higher frequency (quicker) oscillation around the affected axis.

**The I term** also multiplies the error with its gain but in addition sums the product over time. This time variant behaviour causes the I term to be more susceptible to overshouting and oscillations. Hence the I term is tuned way lower than the P term in most cases. The gain is that even small errors can lead to great output values after some time making the I term good for slow, precise corrections. I oscillations a generally distinctively slower that P oscillations (low frequency).

**The D term** attempts to increase system stability by monitoring the rate of change in the error. It countersteers with a rate propotional to the speed of the change and its gain. The D term is by far the hardest to tune because it has a delayed effect on the output and potentially overwrites the other terms momentarily. Often to high D gains will make the craft sluggish to respond in combination to weird slow overshooting issues while the I term is fighting the D term at near zero error.

A video on how to recognise and correct different flight problems caused by PID settings is available here:

https://www.youtube.com/watch?v=YNzqTGEl2xQ

## Software filtering

Every controller has to deal with two problems.

**The first** is noise either caused by "real noise" of the system or by the sensor itself. Either way noise can cause serious issues ranging from reduced flight times regarding hot motors to uncontrolable random shaking of the craft.

**The second** is delay. Meant is the delay between action (controller output) and reaction (sensor input). The more delay the looser the controller is conected to its environment and therefore can not be tuned as aggressively. Imagine a radiator thermostat as a highly delayed controller.

These two evils are best eliminated at the causer. Balance your props and other fast rotating parts. Make shure the axles are strait and the bearings are still good. Dampening the sensors (flightcontrol) might also help. A detailed discussion about vibration cancellation technics [here](http://diydrones.com/forum/topics/vibration-isolation-and-dampening-of-apm-px4-for-version-2-9).

Nevertheless noise is everywhere. Even at a vibration optimised system. To cope with this Cleanflight (1.10.0.0) has a new feature generally referenced to as software filtering. Some sensor hardware comes with its own filtering features (MPU6050 etc.) but all of them have there own drawbacks. See this #1028 Issue for more information. My personal advice to everyone is to use software filtering instead of hardware filtering or even no filtering. Overall flight performance is significally improved.

### Filter setup

![Filter Topology](https://cloud.githubusercontent.com/assets/10757508/10247075/99aeafe2-6916-11e5-9b48-6d1edcb23542.jpg)

Cleanfligth implements three independent filters. The first one directly filters the gyroscopes outputs. The second and third ones filter the P term output and D term input seperatly. By default software filtering is disabled (except for PIDC 5 "Harakiri"). Software filtering is controled by three [CLI parameters](https://github.com/cleanflight/cleanflight/blob/master/docs/Cli.md) which control the three filters available:

**Attention!** The suggested values are subject to change.

**Attention!** Too low cutoffs will lead to instabillity if PID gains are to high. This is caused by delay induced by the filter.
* **gyro_cut_hz** controls the cut off frequency of the general gyro output. For a good balanced quad a reasonable setting is 100 or above. Settings can go as low as 20 for bad vibration problems but gains must be reduced significantly (explanation see above).
* **pterm_cut_hz** filters the output to the P term separately. Reasonable values range down to 20 starting at the gyro value.
* **dterm_cut_hz** does the same for the input of the D term. The D term is usually the most problematic controller regarding noise. Noise on gyro input is typically high pitched and since the D term generates its output proportional to input change noise gets heavyly amplified. Reasonable values range from 20 to 10.

To start tuning one must distinguish oszillation and random agitation. The first is caused by too high PIDs. The second by noise getting to the controllers. A general approach is this gradual guide:

1. Set your PID gains as low as you would fly it normaly.
2. Set filters to 50/20/10.
3. Do a test flight and watch your craft carefully. You shoulde immediatly be impressed by how silky smooth level modes are now.
4. You should now try higher PID gains.
5. Most likely your craft will get instable pretty soon. You now can try 100/50/20 cutoffs. Oszillations should disappear with these cutoffs.
6. Watch your craft carfully again and check for noise. If there is any: Lower dterm to 10. If this does not help lower pterm and gyro incrementally (pterm usually half of gyro).
7. If no noise is visible you could even higher cutoffs. Try what works best for you.

##TPA and TPA Breakpoint

TPA stands for Throttle PID Attenuation and according to [AlexYork.net](http://blog.alexyorke.net/what-is-tpa/):

> "TPA basically allows an aggressively tuned multi-rotor (one that feels very locked in) to reduce its PID gains when throttle is applied beyond the TPA threshold/breakpoint in order to eliminate fast oscillations.."

Note that TPA is set via CLI or on the PID TUNING tab of the GUI.  tpa_breakpoint is set via CLI

Also note that TPA and tpa_breakpoint may not be used in certain PID Controllers.  Check the description on the individual controller.

TPA applies a PID value reduction in relation to full Throttle. It is used to apply dampening of PID values as full throttle is reached.

**TPA** = % of dampening that will occur at full throttle.

**tpa_breakpoint** = the point in the throttle curve at which TPA will begin to be applied.

An Example: With TPA = 50 (or .5 in the GUI) and tpa_breakpoint = 1500 (assumed throttle range 1000 - 2000)

* At 1500 on the throttle channel, the PIDs will begin to be dampened.
* At 3/4 throttle (1750), PIDs are reduced by approximately 25% (half way between 1500 and 2000 the dampening will be 50% of the total TPA value of 50% in this example)
* At full throttle (2000) the full amount of dampening set in TPA is applied. (50% reduction in this example)
* TPA can lead into increase of rotation rate when more throttle applied. You can get faster flips and rolls when more throttle applied due to coupling of PID's and rates. Only PID controllers 1 and 2 are using linear TPA implementation, where no rotation rates are affected when TPA is being used.

![tpa example chart](https://cloud.githubusercontent.com/assets/1668170/6053290/655255dc-ac92-11e4-9491-1a58d868c131.png "TPA Example Chart")


**How and Why to use this?**

If you are getting oscillations starting at say 3/4 throttle, set tpa breakpoint = 1750 or lower (remember, this is assuming your throttle range is 1000-2000), and then slowly increase TPA until your oscillations are gone. Usually, you will want tpa breakpoint to start a little sooner then when your oscillations start so you'll want to experiment with the values to reduce/remove the oscillations.

## PID controllers

Cleanflight has 6 built-in PID controllers which each have different flight behavior. Each controller requires
different PID settings for best performance, so if you tune your craft using one PID controller, those settings will
likely not work well on any of the other controllers.

You can change between PID controllers by running `set pid_controller=n` on the CLI tab of the Cleanflight
Configurator, where `n` is the number of the controller you want to use. Please read these notes first before trying one
out.

### PID controller 0, "MultiWii" (default)

PID Controller 0 is the default controller in Cleanflight, and Cleanflight's default PID settings are tuned to be
middle-of-the-road settings for this controller. It originates from the old MultiWii PID controller from MultiWii 2.2
and earlier.

One of the quirks with this controller is that if you increase the P value for an axis, the maximum rotation rates for
that axis are lowered. Hence you need to crank up the pitch or roll rates if you have higher and higher P values.

In Horizon and Angle modes, this controller uses both the LEVEL "P" and "I" settings in order to tune the 
auto-leveling corrections in a similar way to the way that P and I settings are applied to roll and yaw axes in the acro
flight modes. The LEVEL "D" term is used as a limiter to constrain the maximum correction applied by the LEVEL "P" term.

### PID controller 1, "Rewrite"

PID Controller 1 is a newer PID controller that is derived from the one in MultiWii 2.3 and later. It works better from
all accounts, and fixes some inherent problems in the way the old one worked. From reports, tuning is apparently easier
on controller 1, and it tolerates a wider range of PID values well.

Unlike controller 0, controller 1 allows the user to manipulate PID values to tune reaction and stability without
affecting yaw, roll or pitch rotation rates (which are tuned by the dedicated roll & pitch and yaw rate
settings).

In Angle mode, this controller uses the LEVEL "P" PID setting to decide how strong the auto-level correction should
be. Note that the default value for P_Level is 90.  This is more than likely too high of a value for most, and will cause the model to be very unstable in Angle Mode, and could result in loss of control.  It is recommended to change this value to 20 before using PID Controller 1 in Angle Mode.

In Horizon mode, this controller uses the LEVEL "I" PID setting to decide how much auto-level correction should be applied. Level "I" term: Strength of horizon auto-level. value of 0.030 in the configurator equals to 3.0 for Level P. Level "D" term: Strength of horizon transition. 0 is more stick travel on level and 255 is more rate mode what means very narrow angle of leveling.


### PID controller 2, "LuxFloat"

PID Controller 2 is Lux's new floating point PID controller. Both controller 0 and 1 use integer arithmetic, which was
faster in the days of the slower 8-bit MultiWii controllers, but is less precise.

This controller has code that attempts to compensate for variations in the looptime, which should mean that the PIDs
don't have to be retuned when the looptime setting changes. 

There were initially some problems with horizon mode, and sluggishness in acro mode, that were recently fixed by
nebbian in v1.6.0.

It is the first PID Controller designed for 32-bit processors and not derived from MultiWii.

The strength of the auto-leveling correction applied during Angle mode is set by the parameter "level_angle" which
is labeled "LEVEL Proportional" in the GUI. This can be used to tune the auto-leveling strength in Angle mode compared to
Horizon mode. The default is 5.0.

The strength of the auto-leveling correction applied during Horizon mode is set by the parameter "level_horizon" which
is labeled "LEVEL Integral" in the GUI. The default is 3.0, which makes the Horizon mode apply weaker self-leveling than
the Angle mode. Note: There is currently a bug in the Configurator which shows this parameter divided by 100 (so it
shows as 0.03 rather than 3.0).

The transition between self-leveling and acro behavior in Horizon mode is controlled by the "sensitivity_horizon"
parameter which is labeled "LEVEL Derivative" in the Cleanflight Configurator GUI. This sets the percentage of your
stick travel that should have self-leveling applied to it, so smaller values cause more of the stick area to fly using
only the gyros. The default is 75% 

For example, at a setting of "100" for "sensitivity_horizon", 100% self-leveling strength will be applied at center
stick, 50% self-leveling will be applied at 50% stick, and no self-leveling will be applied at 100% stick. If
sensitivity is decreased to 75, 100% self-leveling will be applied at center stick, 50% will be applied at 63%
stick, and no self-leveling will be applied at 75% stick and onwards.

### PID controller 3, "MultiWii23" (default for the ALIENWIIF1 and ALIENWIIF3 targets)

PID Controller 3 is an direct port of the PID controller from MultiWii 2.3 and later.

The algorithm is handling roll and pitch differently to yaw. Users with problems on yaw authority should try this one.

For the ALIENWII32 targets the gyroscale is removed for even more yaw authority. This will provide best performance on very small multicopters with brushed motors.

### PID controller 4, "MultiWiiHybrid"

PID Controller 4 is an hybrid version of two MultiWii PID controllers. Roll and pitch is using the MultiWii 2.2 algorithm and yaw is using the 2.3 algorithm. 

This PID controller was initialy implemented for testing purposes but is also performing quite well.

For the ALIENWII32 targets the gyroscale is removed for more yaw authority. This will provide best performance on very small multicopters with brushed motors.

### PID controller 5, "Harakiri"

PID Controller 5 is an port of the PID controller from the Harakiri firmware.

The algorithm is leveraging more floating point math. This PID controller also compensates for different looptimes on roll and pitch. It likely don't need retuning of the PID values when looptime is changing. There are two additional settings which are configurable via the CLI in Harakiri:

        set dterm_cut_hz = 0        [1-50Hz] Cut Off Frequency for D term of main PID controller
                                    (default of 0 equals to 12Hz which was the hardcoded setting in previous Cleanflight versions)
        set pid5_oldyw = 0          [0/1] 0 = multiwii 2.3 yaw (default), 1 = older yaw

The PID controller is flight tested and running well with the default PID settings. If you want do acrobatics start slowly.

Yaw authority is also quite good.


## RC rate, Pitch and Roll Rates (P/R rate before they were separated), and Yaw rate

### RC Rate

An overall multiplier on the RC stick inputs for pitch and rol. 

On PID Controllers 0, and 3-5 can be used to set the "feel" around center stick for small control movements. (RC Expo also affects this).For PID Controllers 1 and 2, this basically sets the baseline stick sensitivity

### Pitch and Roll rates

In PID Controllers 0 and 3-5, the affect of the PID error terms for P and D are gradually lessened as the control sticks are moved away from center, ie 0.3 rate gives a 30% reduction of those terms at full throw, effectively making the stabilizing effect of the PID controller less at stick extremes. This results in faster rotation rates. So for these controllers, you can set center stick sensitivity to control movement with RC rate above, and yet have much faster rotation rates at stick extremes.

For PID Controllers 1 and 2, this is an multiplier on overall stick sensitivity, like RC rate, but for roll and pitch independently. Stablility (to outside factors like turbulence) is not reduced at stick extremes. A zero value is no increase in stick sensitivity over that set by RC rate above. Higher values increases stick sensitivity across the entire stick movement range.

### Yaw Rate

In PID Controllers 0 and 5, it acts as a PID reduction as explained above. In PID Controllers 1-4, it acts as a stick sensitivity multiplier, as explained above.
