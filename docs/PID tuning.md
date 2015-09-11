# PID tuning

Every aspect of flight dynamics is controlled by the selected "PID controller". This is an algorithm which is
responsible for reacting to your stick inputs and keeping the craft stable in the air by using the gyroscopes and/or
accelerometers (depending on your flight mode).

The "PID gains" are a set of tuning parameters which affect the operation of the PID controller. The optimal PID settings
to use are different on every craft, so if you can't find someone with your exact setup who will share their settings
with you, some trial and error is required to find the best performing PID settings. PID settings are also somewhat dependent on a pilot's preferences, so even if someone else has your exact same craft, you may prefer slightly different PID settings than them.

A video on how to recognise and correct different flight problems caused by PID settings is available [here](https://www.youtube.com/watch?v=YNzqTGEl2xQ). A detailed thread on tuning a mini-quad for acro-style FPV flight is [here](http://www.rcgroups.com/forums/showthread.php?t=2439428).

The goal of the PID controller is to bring the craft's rotation rate on all three axes to the rate that
you're commanding with your sticks. An error value is computed, which is the difference between your target rotation rate and
the actual one measured by the gyroscopes. Then the controller tries to bring this error to zero. 

For example:
* You push the pitch stick forward 10%.
* Cleanflight determines that, based on your rates and expo, this corresponds to an angular rate of 50 degrees per second.
* The PID controller measures the current angular rate being reported by the gyros. Say that it is 0 degrees per second.
* The error is now 50 - 0 = 50 degrees per second.
* The PID controller adjusts motor output to increase the angular rate so as to reduce the error.

These calculations are simultaneously happening on all three axes of control: pitch, roll, and yaw. Motor output is constantly adjusted to make the rate of rotation try to match what is being commanded by the sticks.

##PIDs

**The P term** controls the strength of the correction that is applied to bring the craft toward the target angle or
rotation rate. The larger the error, the larger the P term will be. When a driver is driving the car, and the car just barely starts to drift out of the lane (small error) the driver makes a small correction to get the car back in the lane. If the driver were to look up and the car was way out of the lane and going into the ditch (large error) the driver might make a much larger correction. The strength of the correction is proportional to the magnitude of the error. This is how the P term works.

If the P term is too low, the craft will be difficult to control as it won't respond strongly enough to
keep itself stable. The craft may be easy to fly slowly, or in an open field, but when precise control is required, the pilot will have difficulty. A craft with low P gain might feel as if it was "drunk". The pilot might feel as if they were constantly one step behind the quad--the pilot is responding to the quad, instead of the other way around.

If P is set too high, the craft will rapidly oscillate/shake as it continually overshoots its target. Excess P gain is the single easiest thing to troubleshoot in multirotor tuning because the oscillations that result are so distinct. Excess P gain is demonstrated in [this video](https://www.youtube.com/watch?v=RMQXSB5-6bE). 

A good guideline for setting P gain is to increase P until oscillations start to occur during normal control input (e.g. moderate turns and forward flight). Then decrease P to between 50% and 80% of that value. Another way of determining the oscillation threshold is to raise the throttle quickly from a hover and look/listen for oscillations during the punchout. Often times, espeically if flying line-of-sight, oscillations will be easier to hear than to see.

If the multirotor is not perfectly symmetrical, the pitch and roll axes will need to have different gains. This can be mitigated to some degree by setting a [custom mix](Mixer.md). A proper custom mix will cause the P gains to be closer to the same on the pitch and roll axes. One approach is to set pitch and roll P gain to a value that is just barely high enough to be stable, then increase them one at a time until oscillations occur, to find the separate oscillation point of the two axes.

Higher P gain tends to give a craft a sharper response to control inputs, but one of the most common problems made by novice tuners is having excess P. Even if oscillations aren't visible, there can be micro-oscillations that make their way to the motors, that can result in decreased flight time and hotter motors. In general, it's probably a good idea for a novice tuner to err slightly on the side of P being a bit low, rather than a bit high. Acrobatic flyers especially should use a P gain towards the lower end of the 50%-80% scale. More stable flyers, such as aerial camera operators, may use a higher P gain. This might seem counterintuitive, since acrobatic flyers would prefer to have a much sharper and more "locked in" feel than aerial camera operators, who benefit from a softer response. The reason for this is that high P gain is more likely to result in oscillations during extreme maneuvers and at high throttle. Therefore, pilots who will be making extreme maneuvers at high throttle must use a lower P gain than pilots who fly in a more docile style.

**The I term**. Ideally, the P term would be all that is needed to have a perfect controller. In a multirotor, the P term must be set low enough to avoid oscillations, which makes it too weak to fully and quickly correct an error. The I term tracks the cumulative error accrued by the P term and attempts to compensate for it.

The I term is very important because multirotors are inherently unstable in flight. The CG of the copter may not be perfectly centered, so gravity may be pulling the copter's rear end down. The head-wind pushing against the copter as it flies may be making it want to pitch forward. A prop or motor may be making slightly less torque than the others, creating a silght yaw force. The CG of the copter may be elevated, causing it to want to "fall into" roll movements. The I term is responsible for compensating for all of these sustained, long-term sources of error.

To go back to the "car" analogy, imagine that the car's wheels are mis-aligned, or imagine that the car is driving across a slope, so that it continually wants to drift to the left. If we were to imagine the P term alone, the car would start to drift to the left and the driver would nudge it back to straight. And the car would drift some more, and the driver would nudge it back to straight. This would continue to occur, and the car would slowly drift left, despite the fact that the driver keeps nudging the wheel back to straight. In reality, the driver would detect the continual left-turning tendency, and hold the wheel slightly right of center to counteract it. This is analogous to the effect of the I term.

(The car analogy is useful because most readers will have experience with cars, but it's important to remember that when we talk about a flight controller's PID loop, the most basic thing we are talking about is rotational rate, as reported by the gyroscopes. At the most basic level, we are not talking about compass headings, GPS waypoints, or even auto-leveling. The most basic thing that the PID controller must do is make the copter stop rotating, or rotate in a desired direction at a desired rate. Everything else is derived from that.)

If I is set too low, the craft's attitude will slowly drift. The pilot will constantly find themselves having to nudge the craft back to the desired attitude. Another sign of low I gain is if the copter pitches forward or back on sudden, strong throttle moves. An example of low I gain is demonstrated in [this video](https://www.youtube.com/watch?v=EzUJP2Mk_xY). Notice how the copter pitches forward and backward during the punchout, even though the pitch stick is not moved at all.

If I is set too high, the craft may oscillate, but with much slower oscillations than with P being set too high. For example, P-term oscillations may be at a frequency of 20 Hz or faster; I-term oscillations may be at a frequency of 2 Hz or slower. Not all copters and not all PID controllers will oscillate when I gain is excessive. Another sign of excess I gain is a copter that feels "stiff" in responding to the sticks. This can be especially noticeable when exiting a turn. The copter may  feel reluctant to leave the turn, and coordinating roll and yaw may be difficult because the I term of one axis continues to push the copter into or out of the turn after the pilot has intended to end the turn. (Of course, this presumes that pilot skill is not the limiting factor in coordinating the turn.)

In extreme cases, excess I gain will result in a phenomenon called _I term windup_. When I term windup occurs, the I term accumulates a large amount of error during an extended maneuver such as a triple flip or a long, sweeping turn. After the maneuver completes, the I term is still trying to cancel out the accrued error. The copter either rebounds slowly in the opposite direction or over-shoots slowly in the same direction as the maneuver (which one occurs depends on whether the I term was postiive or negative during the maneuver). 

I-term windup is unlikely to occur on most of today's multirotors for several reasons. First, many PID controllers have internal limits that prevent the I term from getting too big. Second, most of today's multirotors have enough power that the P term alone keeps error relatively small. Therefore, the I term tends not to get large enough to result in windup. I term windup is most likely to occur on small, under-powered craft.

If I-term windup is occurring, one solution is to increase P gain, if oscillations will permit. This will reduce the error and therefore reduce the size of the I term that accumulates over time. Another solution is to reduce I gain, but this may result in attitude drift.

**The D term** attempts to increase system stability by monitoring the rate of change in the error. When the P term is changing rapidly, the D term causes the strength of the correction to be backed off. When the P term is stable, the D term is low, allowing the output of the PID controller to move more freely. An intuitive (non-mathematical) understanding of the D term is difficult to achieve. [This video](https://www.youtube.com/watch?v=xMygUvegC80) gives a relatively simple demonstration of the effect of the D term. 

A common misconception about the D term is that it is related to the magnitude of the P term; it isn't. The D term is related to the rate-of-change in the P term. So if the P term is growing quickly or shrinking quickly, the D term will be large. If the P term is very large, and is not changing, the D term will be small. When properly tuned, the D term acts to stabilize the output of the PID controller from rapid changes in the P term.

To a small extent, the D term has the effect of reducing oscillation in the P term. If the P term is set just barely high enough that oscillations are starting to occur, adding a small amount of D may tame the oscillations. The more significant effect of the D term is that it tames overshoot and bounce on strong stick inputs.

The D term is much more sensitive to noise (vibration) in the system than the P term. If the D term is too high, it will excessively amplify noise in the system, making the copter act as though it had too much vibration. Symptoms of excessive D term include "twitching" in flight, unrelated to stick movements, and "hopping" in altitude when the throttle hasn't changed. These are the same symptoms as a copter with too much vibration, so it can be difficult to discern between those two cases.

D term interacts with the P term only, not the I term. Therefore, tuning the D term and tuning the P term are interrelated. A good approach to tuning D is to first tune P with a relatively low D value of around 10. The optimal value for P will eliminate oscillations during most flight conditions, but there still may be small bounce or oscillation at the end of sharp stick inputs. A good guideline is that there should be no more than two bounces at the end of a move. More than that, and P needs to be reduced. Once P is at this level, D should then be increased until the bounce or oscillation goes away.

Because of the D term's propensity to amplify noise, it's common to apply a low-pass filter to it. Prior to Cleanflight version 1.10, Harakiri (PID controller 5) was the only PID controller to do this. As a result, it wasn't possible to fully tune the D term on the other PID controllers, because by the time D got large enough to really do its job, it was amplifying noise so much that it needed to be turned back down again. In Cleanflight 1.10, software filtering of the D term (and the P term and gyro) was added. This filtering is turned off by default for backwards compatibility, but nearly all users report better flight performance with it turned on.

##TPA and TPA Breakpoint

TPA stands for Throttle PID Attenuation and according to [AlexYork.net](http://blog.alexyorke.net/what-is-tpa/):

> "TPA basically allows an aggressively tuned multi-rotor (one that feels very locked in) to reduce its PID gains when throttle is applied beyond the TPA threshold/breakpoint in order to eliminate fast oscillations.."

As of Cleanflight 1.10, TPA is supported in all PID controllers. Prior to 1.10, PID controllers 1 and 2 did not support TPA. The TPA parameters can be set in the Cleanflight GUI or CLI, but they will have no effect on PID controllers 1 and 2.

TPA applies a PID value reduction in relation to full throttle. It is used to apply dampening of PID values as full throttle is reached. Prior to Cleanflight 1.10, TPA reduced all three of the P/I/D parameters equally on all PID controllers except Harakiri (PID Controller #5). In fact, it's not desirable to reduce the I term as throttle increases, since this means the copter will have reduce attitude-hold right when you most need to to be locked in. In Cleanflight 1.10, the I term was removed from the TPA calculation for all PID controllers. The effect is that TPA reduces the propensity for oscillation as throttle increases, but attitude hold is not compromised.

**TPA** = % of dampening that will occur at full throttle.

**tpa_breakpoint** = the point in the throttle curve at which TPA will begin to be applied.

An Example: With TPA = 50 (or .5 in the GUI) and tpa_breakpoint = 1500 (assumed throttle range 1000 - 2000)

* At 1500 on the throttle channel, the PIDs will begin to be dampened.
* At 3/4 throttle (1750), PIDs are reduced by approximately 25% (half way between 1500 and 2000 the dampening will be 50% of the total TPA value of 50% in this example)
* At full throttle (2000) the full amount of dampening set in TPA is applied. (50% reduction in this example)
* On PID controllers 0 and 3-5, TPA can lead into increase of rotation rate when more throttle is applied. This is because the rotation rate is tied to the P value in these controllers, so when TPA reduces the P value, the rotation rate increases. In PID controllers 1 and 2, the rotation rate is independent of the P value, so TPA does not affect the rotation rate.

![tpa example chart](https://cloud.githubusercontent.com/assets/1668170/6053290/655255dc-ac92-11e4-9491-1a58d868c131.png "TPA Example Chart")


**How and Why to use this?**

If you are getting oscillations starting at say 3/4 throttle, set tpa breakpoint = 1750 or lower (remember, this is assuming your throttle range is 1000-2000), and then slowly increase TPA until your oscillations are gone. Usually, you will want tpa breakpoint to start a little sooner then when your oscillations start so you'll want to experiment with the values to reduce/remove the oscillations.


## PID controllers

Cleanflight has 6 built-in PID controllers which each have different flight behavior. Each controller requires
different PID settings for best performance, so if you tune your craft using one PID controller, those settings will
likely not work well on any of the other controllers. You can change between PID controllers via the pull-down menu at the top of the PID settings tab in the configurator GUI.

### PID controller 0, "MultiWii" (default)

PID Controller 0 is the default controller in Cleanflight, and Cleanflight's default PID settings are tuned to be
middle-of-the-road settings for this controller. It originates from the old MultiWii PID controller from MultiWii 2.2
and earlier. 

**The main purpose of this PID controller is to provide backwards compatibility for users who are transitioning from Baseflight.** This PID controller is the same as the one used in Baseflight, so a Baseflight user who has tuned their copter and who then wants to switch to Cleanflight can port their PID values one-for-one to this PID controller. It is generally agreed by Cleanflight pilots that this PID controller provides definitively worse performance than others that are available, especially in terms of yaw authority.

One of the quirks with this controller is that if you increase the P value for an axis, the maximum rotation rates for
that axis are lowered. Hence you need to crank up the pitch or roll rates if you have higher and higher P values. This makes tuning of PID values more difficult, since as you increase the P value, you also have to tweak the rate on that axis in order to keep the actual rate of rotation the same. With other PID controllers, you can tune the P gains separately from the axis rates.

In Horizon and Angle modes, this controller uses both the LEVEL "P" and "I" settings in order to tune the 
auto-leveling corrections in a similar way to the way that P and I settings are applied to roll and yaw axes in the acro
flight modes. The LEVEL "D" term is used as a limiter to constrain the maximum correction applied by the LEVEL "P" term.

### PID controller 1, "Rewrite"

PID Controller 1 is a newer PID controller that is derived from the one in MultiWii 2.3 and later. It works better from
all accounts, and fixes some inherent problems in the way PID controller #0 worked. This PID controller is very popular with proximity and acro FPV flyers for its sharp and "locked-in" feel. However, it is also appropriate for beginning tuners, since it tolerates a very wide range of PID values while still having acceptable flight performance. Also, its popularity means that new proximity and acro FPV pilots will find lots of other people who have experience with this controller to help them tune.

This controller has code that attempts to compensate for variations in the looptime, which should mean that the PIDs
don't have to be retuned when the looptime setting changes.

Unlike controller 0, controller 1 allows the user to manipulate PID values to tune reaction and stability without
affecting yaw, roll or pitch rotation rates (which are tuned by the dedicated roll & pitch and yaw rate
settings).

In Angle mode, this controller uses the LEVEL "P" PID setting to decide how strong the auto-level correction should
be. Note that the default value for P_Level is 90.  This is more than likely too high of a value for most, and will cause the model to be very unstable in Angle Mode, and could result in loss of control.  It is recommended to change this value to 20 before using PID Controller 1 in Angle Mode.

In Horizon mode, this controller uses the LEVEL "I" PID setting to decide how much auto-level correction should be applied. Level "I" term: Strength of horizon auto-level. value of 0.030 in the configurator equals to 3.0 for Level P. Level "D" term: Strength of horizon transition. 0 is more stick travel on level and 255 is more rate mode what means very narrow angle of leveling.


### PID controller 2, "LuxFloat"

PID Controller 2 is Lux's new floating point PID controller. Both controller 0 and 1 use integer arithmetic, which was
faster in the days of the slower 8-bit MultiWii controllers, but is less precise. However, it has been suggested that Luxfloat is more sensitive to vibration than integer-based PID controllers, since the rounding of the integer math acts as a sort of low-pass filter.

This controller has code that attempts to compensate for variations in the looptime, which should mean that the PIDs
don't have to be retuned when the looptime setting changes. It is the first PID Controller designed for 32-bit processors and not derived from MultiWii.

Like PID controller #1, Luxfloat is very popular with proximity and acro FPV pilots. Luxfloat tolerates a much narrower range of PID values than PID controller #1, however. This, combined with its sensitivity to vibration, mean that it's probably not advisable for inexperienced tuners to start with Luxfloat.

Because of the way that it scales the terms internally, Luxfloat's P values are significantly smaller than those found in other PID controllers. For example, a typical P value in PID controller #3 might be somewhere between 3.0 and 6.0. In Luxfloat, it is uncommon to see P values higher than 3.5, and many pilots find values between 1.0 and 2.5 to be most appropriate. Because Luxfloat has a very narrow range of acceptable P values for a given setup, a tuner who is used to another PID controller may start with what he or she thinks is a reasonable value, and in fact find that it is far, far too high to be flyable. The copter may try to fly away due to excess oscillation, or motors may be damaged. It's strongly recommended when working with Luxfloat to start with very low P gains--perhaps about 1.5--and then work up very slowly--perhaps 0.2 to 0.5 increase per step at most.

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

PID Controller 3 is an direct port of the PID controller from MultiWii 2.3 and later. Pilots who are transitioning to Cleanflight from a MultiWii 2.3 board can transfer their PID settings one-for-one.

The algorithm handles roll and pitch differently to yaw. Users of PID controller 0 or Baseflight who want more yaw authority should consider this PID controller. However, some re-tuning of PID values will be required.

This PID controller is an acceptable choice for a new tuner, but PID controller 1 may be a better choice for someone who isn't coming from Baseflight, PID controller 0, or Multiwii 2.3. PID controller 1 has a wider range of acceptable PID values and can deliver better flight performance when highly tuned.

For the ALIENWII32 targets the gyroscale is removed for even more yaw authority. This will provide best performance on very small multicopters with brushed motors.

### PID controller 4, "MultiWiiHybrid"

PID Controller 4 is an hybrid version of two MultiWii PID controllers. Roll and pitch is using the MultiWii 2.2 algorithm and yaw is using the 2.3 algorithm.

This PID controller was originally implemented for testing purposes. It offers few, if any, compelling advantages compared to the other controllers available. It has largely been abandoned by the Cleanflight community. It is not recommended that new pilots use this PID controller.

### PID controller 5, "Harakiri"

PID Controller 5 is an port of the PID controller from the Harakiri firmware.

The algorithm leverages floating point math. This PID controller also compensates for different looptimes on roll and pitch. It likely doesn't need retuning of the PID values when looptime changes. 

Two settings are configurable via the CLI in Harakiri:

        OLD_YAW 0 // [0/1] 0 = multiwii 2.3 yaw, 1 = older yaw.
        MAIN_CUT_HZ 12.0f // (default 12Hz, Range 1-50Hz)

The PID controller is flight tested and running well with the default PID settings. If you want do acrobatics start slowly. Yaw authority is also quite good.

Prior to Cleanflight 1.10, Harakiri was the only PID controller that had D term low-pass filtering (via the MAIN_CUT_HZ function). From 1.10 forward, Harakiri's MAIN_CUT_HZ function was replaced with a set of global filter functions used by all PID controllers.

## RC rate, Pitch and Roll Rates (P/R rate before they were separated), and Yaw rate

### RC Rate

In acro mode, the flight controller maps the degree of stick deflection to a target angular rate-of-change. For example, full forward deflection might map to 360 degrees per second of rotation (that number completely made up!), in which case the copter would flip at a rate of one flip per second. The RC rate acts as a linear multiplier on the angular rate-of-change commanded by a given stick deflection. Therefore, if an RC rate of 1.0 commands a certain degrees per second of rotation, then an RC rate of 1.5 would command 50% faster rate.

RC rate works the same in all PID controllers. However, its interaction with the pitch/roll rate is different in PID controllers 1 and 2 vs. 0 and 3-5. See the pitch/roll rate section for more detail.

### Pitch and Roll rates

In PID Controllers 0 and 3-5, the P and D terms are gradually lessened as the control sticks are moved away from center--i.e. 0.3 rate gives a 30% reduction of those terms at full throw. Because rotation rate is tied to P gain in these PID controllers, this has the effect of increasing the rotation rate as the stick approaches full deflection. So for these controllers, you can set center stick sensitivity to control movement with RC rate above, and yet have much faster rotation rates at stick extremes.

For PID controllers 0 and 3-5, a good way of summing up the difference between RC rate and P/R rate is, if you want a copter that is twitchy all the time, use a high RC rate and low P/R rate. If you want a copter that is sensitive at center-stick but then does fast flips and rolls at full stick deflection, use a lower RC rate and a higher P/R rate. Novice tuners should be very careful with high P/R rates, especially when combined with high expo settings, as they can result in a seemingly docile copter suddenly becoming a whirlwind when stick deflection passes a certain point. For these PID controllers, It's recommended to start with a relatively low P/R rate of perhaps 0.15 to 0.25 and then gradually increase P/R while optionally decreasing RC rate until overall performance is as desired.

For PID Controllers 1 and 2, P/R rate is an multiplier on overall stick sensitivity, like RC rate, but for roll and pitch independently. Another way of putting this is that the RC rate and the P/R rates are simply additive in PID controllers 1 and 2. There should be no difference between RC rate 1.0 + P/R rate 0.5 and RC rate 0.5 + P/R rate 1.0. However, the P/R rate is the only way of adjusting pitch and roll rate seprarately. A suggested way of tuning these controllers is to start with a  low, but non-zero, P/R rate--perhaps 0.2 to 0.3--and low RC rate--perhaps 0.3. This is likely to produce a copter with slower rotation than most pilots prefer. Next, increase RC rate until the copter becomes approximately as responsive as the pilot prefers. Then raise or lower pitch and roll rate to adjust the relative speed of those axes. 

### Yaw Rate

In PID Controllers 0 and 5, it acts as a PID reduction as explained above. In PID Controllers 1-4, it acts as a stick sensitivity multiplier, as explained above, however unlike pitch/roll rate, yaw rate is _not_ additive with RC rate, so increasing/decreasing RC rate doesn't affect yaw rate.
