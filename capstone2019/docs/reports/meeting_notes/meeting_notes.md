
## Meeting Notes


## 01/05/2020

### Overview:

The main objective of the meeting was to establish the goals for the upcoming week and get in touch.
 
### To Do:

- Watch the videos that Eric has uploaded
- Make a high-level list with components that we need to order
- Start writing the PDS
- Meeting times
- Download the microcontroller's datasheet

### Done:

### Goals:
- By next Saturday we need to:
1. Have a list of components
2. Watch the videos
3. Establish meeting times



## 01/10/2020

### Overview:

The main objective of the meeting was to establish workloads for everybody for the week of 01/10/2020.
 
### To Do:

- **Ruben**: Writing proposal for drone kit for us to get familiar with the start-to-finish process of already working drone/code. Contacting Galois to confirm what parts of the IMU (or if all 3) are essential for us in case we don't need all three sensors.
- **Bliss**: Getting started on the .stl files in src/main/startup and speaking with the company or Roy about getting the HiFive boards .stl file.
- **Eric** : Finding a drone kit that will accommodate the size of the HiFive Board | Makefile research.
- **Niko** : Makefile research.

Everyone:

- Build the firmware at least once for one of the boards. (Basically, figure out how to get the code fully compiled for one of the pre-existing targets).
- Use the files under **docs** for help. **docs/Customized Version.md**  and **docs/development** one of the files in that folder.

Note: Also please remember to try and build an easily visualized map for the rest of us as you figure something out (like what is important to focus on in the MakeFile)

### Done:

- Watch the videos that Eric has uploaded
- Establish meeting times

### Goals:

- This week we need to:

1. Send a proposal for a drone kit to Galois (to get familiar with the start-to-finish process of already working drone/code).
2. Confirm requirements for the IMU device with Galois.
3. Look into startup file for FE310-G002 (where to get .S file?).
4. Begin researching drone kit that will accommodate the size of the HiFive Board (width = 51 mm).
5. Begin looking into Makefile (what it does/ how it works).

### Next meeting: Monday, 01/13/2020 6:00pm - PSU: Circuits Lounge


## 01/17/2020

### Overview:

The main objective of the meeting was to discuss the proposal for the Kit, 
talk about our findings
from the makefile and documentation in the cleanflight repo and RISC-V.
 
### To Do:

- Niko: PDS
- Bliss: Send Email Michal and Roy, explore HiFive board
- Eric: Trello vs. Git- which to use for the project management, Makefile research
- Ruben: IMU and porting drivers research

### Done:

- Makefile research mapping
- Kit research and communication with Galois
- RISC-V tools

### Deliverables:

- PDS draft until Friday 01/24/

### Goals:

- Each team member needs to build cleanflight on their machine
- Continue exploring the repo

### Sustains:

- Keep meeting Monday and Friday at 6 pm
- Pair and meet to tackle more challenging parts when scheduling permits, 
outside regular meeting times



## 01/20/2020

### Overview:

The main objective of the meeting was to discuss the project's timeline, purchasing the kit, the makefile
the Project Definition Statement(PDS), the Weekly Progress Report, and Milestones.

### To Do:
- Niko: Complete the PDS draft by Friday 01/24/2020, update Weekly report
- Bliss: Work on RISC-V assembly with Freedom Studio
- Eric: F3 Drivers
- Ruben: IMU and SPI


### Done:

- Reviewed PDS
- Defined Schedule
- Defined Milestones
- Began using Freedom Studio
- Load Balanced the tasks

### Deliverables:

- PDS draft until Friday 01/24/ and Weekly Progress Report
- Have a working example with the HiFive board (blink LED)
- Improve the makefile mapping and agree upon what files need to be modified and how
- Have Roy review our project timeline

### Goals:

- Each team member needs to build cleanflight on their machine
- Continue exploring the repo
- Have a good understanding of how to interact with the board by the end of this week 
- How SPI works

### Sustains:

- Keep meeting Monday and Friday at 6 pm
- Pair and meet to tackle more challenging parts when scheduling permits,
outside regular meeting times

### Notes:

- Ask Prof.Faust about SDK's and porting one architecture to another
- Connect with Michal
- Verify what is the expected deliverable at the end of the semester

Next Meeting: 01/24/2020



## 01/24/2020

### Overview:

The main objective of the meeting was to discuss the email we received from Michal and Roy.More, we discussed the HiFive board availability,how to make purchases in the future,and how to track our project. Further, we decided to use the GitHub Project for the Project Management part.

Besides, we agreed to use "[Cleanflight_RISC-V_Capstone_Project] as an email header and to append to one email all the updates to our sponsor company Galois. The end of each Sunday will complete the weekly status report at 10 pm. Between 10 pm and midnight, each team member will have the opportunity to revise, Nikolay will send email before midnight.

### To Do:

- Niko: Complete the PDS by Friday 01/31/2020, update Weekly report, Git Project, trace mpu_9050.c
- Bliss: Startup file, SPI
- Eric: Flow Diagrams for PDS
- Ruben: IMU and SPI


### Done:

- Reviewed PDS
- Defined Schedule
- Defined Milestones
- Began using Freedom Studio
- Load Balanced the tasks

### Deliverables:

- PDS draft 50%
- Sent email to Roy
- Text file how SPI works
- Flowcharts for the porting process, how Cleanflight works and Makifile


### Goals:

- Complete PDS
- Complete the Weekly Progress Report and email
- Meet with Roy
- Understand how mpu_9050 works
- Continue exploring the repo
- Have a good understanding of how to interact with the board by the end of this week 
- How SPI works
- Get all the flowcharts done


### Sustains:

- Keep meeting Monday and Friday at 6 pm
- Pair and meet to tackle more challenging parts when scheduling permits,
outside regular meeting times

### Challenges:

- The repo is huge, and it takes time to go through everything


Next Meeting: 01/27/2020


## 01/27/2020

### Overview:

Today's meeting focused on checking in where the team is with goals and deliverables and discuss the upcoming meeting with Roy. In addtion, we discussed changing the gyroscope we are going to use for the project and find one that supports SPI.Last, we touched basis on when the two more boards are coming from our sponsor.

### To Do:

- Team: Meet with Roy
- Niko: Finish PDS,make a quick presentation for Feb.7,Git Project
- Bliss: Configure the sensor from Ruben to talk to the board
- Eric: Flowchart,Makefile
- Ruben: Begin working on motor sensors


### Done:

- Weekly Update
- Flowcharts for PDS
- More work on the Makefile
- Scheduled Meeting with Roy


### Goals:

- Complete PDS
- Complete the Weekly Progress Report and email
- Meet with Roy
- Continue exploring the repo
- How SPI works with HiFive
- Get all the flowcharts done


### Sustains:

- Keep meeting Monday and Friday at 6 pm
- Pair and meet to tackle more challenging parts when scheduling permits,
outside regular meeting times

### Challenges:

- Niko: My linux machine has a problem with the kernel and it set me behind this week

### Notes:
#### Questions for Roy:

- Code practices, industry standard for porting
- What source files are in the executable 
- Order for Kit+sensors
- What is expected to be done by the end of the semester
- Nik is leaving April 21
- How the SDK and linkers work
- Review schedule


#### Why mpu 9250

- Cleanflight supported
- SPI
- I2C

Next Meeting: 01/31/2020



 02/10/20
====================
## Eric:

- Delivered block diagram for the drone kit operation
- Presented options for hardware shield (Interfacing between HiFive and Drone Kit Part
- Team discussed options about using the shield
- Midterm coming up

### to do:

- Update project schedule to incorporate shield
- Update the PDS with the shield stuff

## Niko:

- License
- Weekly Progress report
- Start adding the docs in the shared drive

### to do:

1. **look up for more boards hifive boards**
2. Add licensing in the PDS
3. Min port

## Bliss:

**Had midterm**

### to do:

- Same as last week

## Ruben:

- Emailed Roy with contact info
- Emailed Michal about update on HiFive boards and Amazon status, proposed regular meetings with Galois
- Metal API presentation

### to do:

- Receipts and shopping with Michal
- Metal API

## General:

- Wednesday the PDS
- Practice presentation
- Update PDS with shield
- Friday present to Roy (tentatively)
- Research other option










