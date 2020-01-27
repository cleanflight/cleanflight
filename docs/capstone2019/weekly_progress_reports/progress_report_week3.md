Weekly Progress Report
======================

Authors:
--------

**Bliss Brass - brass@pdx.edu**

**Eric Schulte - eschulte@pdx.edu**

**Nikolay Nikolov - nnikolov@pdx.edu**

**Ruben Maldonado - mruben@pdx.edu**


Week 3
===========================

### Date:01/20- 01/26

### Summary:

In week 3 the team was able to create a high-level reference for SPI in RISC-V available in directory ``` cleanflight/docs/capstone2019/SPI_HiFive```. The document describes where to look in the manual for the SPI instances and how do you attach sensors. In addition, the team internalized the feedback from Roy and Michal. Last, we focus on finalizing our PDS and getting ready to discuss our progress with our sponsor.

#### Bliss Summary :

- Looked into the SPI interface and driver support.
- Still investigating if/where a Startup.s file (or equivalent) may be for the HiFive board.

#### Eric Summary :

- Still trying to come up with a list of drivers included in SPRacing F3 .hex executable (the FC Galois wants us to emulate).
To Do: 
- Flowchart for Cleanflight, Flowchart for porting, Flowchart for makefile

#### Nikolay Summary :

- Primarily worked on PDS, Project Schedule and Project Planning, meeting notes (documentation)
To Do: 
- Compile LaTeX for PDS, implement the project planning using Kanban and Git Project, support the team with research and meetings


#### Ruben Summary :

- Review of Cleanflight code to get code structure understanding
- Found 2 possible sensors already implemented in Cleanflight (MPU6500 for acc and gyro, MPU9250 for acc, gyro, and compass)
- Research SPI connection on the HiFive1 RevB board
- Compiled doc for SPI overview on HiFive1 RevB board
- Continue researching RISC-V ISA
- Continue researching HiFive1 RevB board and it’s specs and manual
- Continue researching tools and processes for developing on HiFive boards


### Done:

- High-level SPI overview Weekly Report
- PDS draft and email to Roy


### TODO:

- Finish PDS
- Make a small presentation for Feb 7th
- mpu_9050.c -> How it works 
- Flowchart for Cleanflight
- Flowchart for porting 
- Flowchart for makefile
- Use a sensor with the HiFive board
- Research PWM connection and implementation
- Bring up a drone with a compatible board - F3 but waiting for the purchase of kit


### Challenges:

- How to divide and assign Cleanflight code for the development of RISC-V porting
1st purchased kit - will the HiFive board fit the chassis 

### Notes:

- Meeting with Roy this week
- Niko is leaving April 21 with National Guard
- Goals are similar/same from last week




