# Weekly Progress Report

## Authors:

**Bliss Brass - brass@pdx.edu**

**Eric Schulte - eschulte@pdx.edu**

**Nikolay Nikolov - nnikolov@pdx.edu**

**Ruben Maldonado - mruben@pdx.edu**


# Week 1 and 2

# Date:01/06- 01/19

# Summary:

The team established consistent meeting times for Monday and Friday at 6 pm at EB93 at PSU. We also created a project schedule and set a draft of milestones.
We decided to go ahead and make a proposal for ordering a drone kit, which we will use to port and test Cleanflight; initially using Arm and then RISC-V.

We have been working on mapping the makefile, establish a good understanding of how SPI works and document it, understand the process of operation for  RISC-V, JTAG, startup file, SDK, IDE and porting to the particular architecture. We also have drafted the Project Design Specifications and we decided to track our project using the "GitHub Project". Our sponsors will receive a weekly email with our progress that is updated at the end of each calendar week on Sunday at 10 pm.

## Bliss Summary :

- Figured out how to install and run Freedom Studio, reading its documentation.
- Tested example code on the HiFive board and hooked it up successfully.
- General learning of the HiFive boards’ characteristics (onboard J-Tag device for example).
- Investigating if/where a Startup.s file (or equivalent) may be for the HiFive board.

## Eric Summary :

- Created the "Makefile Manual" document (located in the root directory under Makefile itself) which gives a high-level overview of the Makefile's functionality. AKA what gets built and how for a particular target. 

To do:
-  come up with a comprehensive list of drivers that are included in the Flight Controller's final .hex executable. Specifically, Galois has tasked us with emulating the SPRacing F3 FC (F3 6DOF). I want to come up with a comprehensive list of drivers for that FC, so we have an idea of which files we need to port exactly.



## Nikolay Summary :

- Primarily worked on PDS, Project Schedule and Project Planning, meeting notes (documentation), formatting documentation and email Roy with updates, reviewed makefile
To Do: 
- Finish PDS


## Ruben Summary :

- Reviewed Cleanflight code to get code structure understanding
- Researched IMU sensors and focused on current sensors already implemented in Cleanflight
- Researched RISC-V ISA
- Researched HiFive1 RevB board and it’s specs and manual
- Researched tools and processes for developing on HiFive boards
- Setup Linux environment
- Built Cleanflight for target board F3
- Researched and found drone kit with an F3 board

### Done:

- Watched the videos that Eric has uploaded that describe the building and porting a drone 
- Establish meeting times
- Project Design Specifications draft and template
- Schedule
- Email to Roy and Michal
- Makefile high-level map
- Research RISC-V tools
- Weekly Progress Report
- Set Milestones
- Install Freedom Studio
- Build Cleanflight
- Emailed Roy who emailed Michal proposal of drone kit purchase
 
### TODO:

- Finish PDS
- Make a small presentation for Feb 7th
- mpu_9050.c -> How it works 
- Flowchart for Cleanflight
- Flowchart for porting 
- Flowchart for makefile
- Use a sensor with the HiFive board



### Challenges:

The repo is huge and it takes time to navigate

### Notes:

**Proposed Milestones**

- A sensor is working with HiFive board and breadboard
- Drone Kit is built, tested and reverse engineered
- Makefile modified for the correct SDK
- Makefile ported for RISC-V
- SPI working with HiFive
- All necessary drivers have been modified for HiFive
- The drone is responding to basic commands
- Project is presented to sponsor



**Proposed Schedule for the next 10 weeks**

| **Week**    	| **Goals and Tasks**                                                                                                                                                                                   |
|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|**Week 1** 	| Confirm availability, meet sponsor, schedule meeting times                                                                                                                                         |
|**Week 2** 	| Research RISC-V,Makefile,IMU                                                                                                                                                                      |
|**Week 3**  	| PDS(draft), Weekly Report, F3 Drivers, Freedom Studio, RISC-V Assembly, SPI, Weekly Report                                                                                                         |
|**Week 4**  	| PDS(final review), Weekly Report, get one sensor working with the board, ECE 412 class check-in                                                                                                         |
|**Week 5**  	| Use Cleanflight to a drone Kit, weekly report, ECE 412 team project review                                                                                                                        |
|**Week 6** 	| Begin porting the makefile, weekly report                                                                                                                                                         |
|**Week 7**		|Continue porting makefile and SDK, begin unit testing, weekly report                                                                                                                               |
|**Week 8**		| Port I/O, unit testing, weekly report                                                                                                                                                             |
|**Week 9**  	| Port Drivers, unit testing, weekly report                                                                                                                                                        |
|**Week 10** 	| Port Drivers, IMU, Cleanflight, integration testing                                                                                                                                               |
|**Week 11** 	| Acceptance testing, review with sponsor and advisor, deliver the project; the drone is using accelerometer and gyroscope and responds to basic commands such as up/down, left/right, forward and backward |


