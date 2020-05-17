# Cleanflight
![Cleanflight](docs/assets/cleanflight/cleanflight-logo-light-wide-1-240px.jpg)

[![Build Status](https://travis-ci.com/cleanflight/cleanflight.svg?branch=master)](https://travis-ci.com/cleanflight/cleanflight)
[![Build Status](https://dev.azure.com/cleanflight-flight-control/cleanflight-firmware/_apis/build/status/cleanflight.cleanflight?branchName=master)](https://dev.azure.com/cleanflight-flight-control/cleanflight-firmware/_build/latest?definitionId=1&branchName=master)

Cleanflight is flight controller software for multi-rotor and fixed wings.  The Cleanflight project, and related projects are
used on the majority of flight controllers used around the world.  There is no other software used on as many flight-controllers!

## Features

Cleanflight has the following features:

* Multi-color RGB LED strip support (each LED can be a different color using variable length WS2811 Addressable RGB strips - use for Orientation Indicators, Low Battery Warning, Flight Mode Status, Initialization Troubleshooting, etc)
* DShot (150, 300, 600 and 1200), Multishot, and Oneshot (125 and 42) motor protocol support
* Blackbox flight recorder logging (to onboard flash or external microSD card where equipped)
* Support for targets that use the STM32 F7, F4 and F3 processors
* PWM, PPM, and Serial (SBus, SumH, SumD, Spektrum 1024/2048, XBus, etc) RX connection with failsafe detection
* Multiple telemetry protocols (CSRF, FrSky, HoTT smart-port, MSP, etc)
* RSSI via ADC - Uses ADC to read PWM RSSI signals, tested with FrSky D4R-II, X8R, X4R-SB, & XSR
* OSD support & configuration without needing third-party OSD software/firmware/comm devices
* OLED Displays - Display information on: Battery voltage/current/mAh, profile, rate profile, mode, version, sensors, etc
* In-flight manual PID tuning and rate adjustment
* Rate profiles and in-flight selection of them
* Configurable serial ports for Serial RX, Telemetry, ESC telemetry, MSP, GPS, OSD, Sonar, etc - Use most devices on any port, softserial included
* VTX support for Unify Pro and IRC Tramp
* and MUCH, MUCH more.

## Installation & Documentation

* Cleanflight documentation - https://github.com/cleanflight/cleanflight/tree/master/docs

## Support

Your first place for support are the [Cleanflight forums on RCGroups](https://www.rcgroups.com/forums/showthread.php?2249574-Cleanflight-firmware-for-STM32F3-based-FCBs-Check-First-Post-Please!!)

The Github issue tracker is NOT for end-user support.

## Support and Developers Channel

There's a dedicated Slack chat channel for cleanflight here:

http://cleanflight.com/slack/

Etiquette: Don't ask to ask and please wait around long enough for a reply - sometimes people are out flying, asleep or at work and can't answer immediately.

## Videos

There is a dedicated Cleanflight YouTube channel which has progress update videos, flight demonstrations, instructions and other related videos.

https://www.youtube.com/playlist?list=PL6H1fAj_XUNVBEcp8vbMH2DrllZAGWkt8

Please subscribe and like the videos if you find them useful.

## Configuration Tool

To configure Cleanflight you should use the Cleanflight-configurator GUI tool (Windows/OSX/Linux) which can be found here:

https://github.com/cleanflight/cleanflight-configurator/releases/latest

## Contributing

Contributions are welcome and encouraged. You can contribute in many ways:

* implement a new feature in the firmware or in configurator (see [below](#Developers));
* documentation updates and corrections;
* How-To guides - received help? Help others!
* bug reporting & fixes;
* new feature ideas & suggestions;
* provide a new translation for configurator, or help us maintain the existing ones (see [below](#Translators)).

The best place to start is the Cleanflight Slack (registration [here](http://cleanflight.com/slack/)). Next place is the github issue tracker:

https://github.com/cleanflight/cleanflight/issues
https://github.com/cleanflight/cleanflight-configurator/issues

Before creating new issues please check to see if there is an existing one, search first otherwise you waste people's time when they could be coding instead!

If you want to contribute to our efforts financially, please consider making a donation to us through [PayPal](https://paypal.me/cleanflight).

If you want to contribute financially on an ongoing basis, you should consider becoming a patron for us on [Patreon](https://www.patreon.com/cleanflight).

Contribution of bugfixes and new features is encouraged. Please be aware that we have a thorough review process for pull requests, and be prepared to explain what you want to achieve with your pull request.
Before starting to write code, please read our [development guidelines](docs/development/Development.md ) and [coding style definition](docs/development/CodingStyle.md).

TravisCI is used to run automatic builds

https://travis-ci.org/cleanflight/cleanflight

[![Build Status](https://travis-ci.com/cleanflight/cleanflight.svg?branch=master)](https://travis-ci.com/cleanflight/cleanflight)

## Translators

We want to make Cleanflight accessible for pilots who are not fluent in English, and for this reason we are currently maintaining translations into 18 languages for Cleanflight Configurator: Català, Deutsch, Español, Euskera, Français, Galego, Hrvatski, Bahasa Indonesia, Italiano, 日本語, 한국어, Latviešu, Português, Português Brasileiro, polski, Русский язык, Svenska, 简体中文.
We have got a team of volunteer translators who do this work, but additional translators are always welcome to share the workload, and we are keen to add additional languages. If you would like to help us with translations, you have got the following options:
- if you help by suggesting some updates or improvements to translations in a language you are familiar with, head to [crowdin](https://crowdin.com/project/cleanflight-configurator) and add your suggested translations there;
- if you would like to start working on the translation for a new language, or take on responsibility for proof-reading the translation for a language you are very familiar with, please head to the Cleanflight Slack (registration [here](http://cleanflight.com/slack/)), and join the '#team\_translation' channel - the people in there can help you to get a new language added, or set you up as a proof reader.

## Releases

https://github.com/cleanflight/cleanflight/releases

## Open Source / Contributors

Cleanflight is software that is **open source** and is available free of charge without warranty to all users.

Cleanflight is forked from Baseflight, Cleanflight was forked by Betaflight, Cleanflight is again forked from Betaflight.

Cleanflight 4.x -> betaflight 4.x -> Cleanflight v2.x -> Betaflight 3.x -> Cleanflight v1.x -> Baseflight -> MultiWii

Origins:
* **Alexinparis** (for MultiWii),
* **timecop** (for Baseflight),

Project Founders:
* Dominic Clifton (hydra)

Significant contributors:
* Boris B (borisbstyle)
* digitalentity
* Martin Budden (martinbudden)
* Jason Blackman (blckmn)
* Alexinparis (for MultiWii),
* timecop (for Baseflight),
* Sambas
* Bardwell, Joshua (joshuabardwell)
* ctzsnooze
* Höglund, Anders (andershoglund)
* Ledvina, Petr (ledvinap)
* kc10kevin
* Keeble, Gary (MadmanK)
* Keller, Michael (mikeller)
* Kravcov, Albert (skaman82)
* MJ666
* Nathan (nathantsoi)
* ravnav
* sambas
* savaga
* Stålheim, Anton (KiteAnton)
* prodrone
* ctn

And many many others who haven't been mentioned....

