Weekly Progress Report
======================

Week 4
===========================

# Date:01/26- 02/02

Authors:
--------

**Bliss Brass - brass@pdx.edu**

**Eric Schulte - eschulte@pdx.edu**

**Nikolay Nikolov - nnikolov@pdx.edu**

**Ruben Maldonado - mruben@pdx.edu**

# Summary:

During week 4 the team met with Roy Kravitz and made fundamental changes in how the project is implemented. First, the team will begin with the minimum port. Second, we decided that our main point of communication with our sponsors (Roy and Michal) is Ruben. Further, we are going to be working on understanding the "Minimum Port" aspect that was talked about in today's meeting. Ruben will cover more. We are going to do four modular ports (minimum bringup, Acc/Gyro, Receiver, and ESCs/motors) and unit and integration testing as we slowly bring up aspects of CleanFlight. 

## The process to port for each module:
1. Review and understand which files are dependent on each other and which are required to change
2. Update code
3. Update Makefile and have successful flash
Test Unit and Integration


Moreover, we will continue refining our project schedule and track the project closely as we navigate through it. 

## Bliss Summary :

### To Do:


### Done:


## Eric Summary :

- Created list of source files needed to create SPRacingF3 executable
- Reorganized project schedule into a Gantt chart, based on Roy’s recommendation

### To Do :

- Finalize PDS document and schedule
- Begin working on “Minimum Port” (Building a simple RISC-V executable using a version of Cleanflight’s Makefile). This will be our team’s first attempt at building and flashing a custom program using Cleanflight’s Makefile.


### Done :

## Nikolay Summary :

### To Do :

- Weekly progress report
- Minimum Port
- Modify

###  In progress :

- Review GNU MCU Eclipse
- Minimum Port

###  Done :

- Reviewed the PDS and made changes
- Weekly progress report

## Ruben Summary :

### To Do :
- Update PDS
- Work on minimum porting

### Done :
- Compile and ran sample code on Freedom E Metal SDK
- SDK readme file
- Email Roy and Michal and informed I am team contact
- Emailed Roy amazon cart link for purchase of mpu9250 hardware sensor, drone kit, battery and transmitter
- Emailed Roy to get input of schedule meetings with him and with sponsor Michal


### TODO:

- Need to research how the receiver will communicate with board ie UART?


### Challenges:



### Notes:

We can approach port with bare metal code but since Freedom has implemented metal API then we will attempt to port using their metal API. We need to understand which files and what needs to be changed and used for porting. 

Idea - if we approach minimum porting with just updating the makefile and have all files required inside Cleanflight directory, will the makefile compile and will the main file run to sample code on RISCV? What directory (in the bsd in freedom e metal sdk) is considered the minimum and required to make any port succeed?






