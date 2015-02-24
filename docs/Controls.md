# Controls

## Arming

When armed the aircraft is ready to fly and any motors attached will spin when throttle is applied.

By default arming and disarming is done using stick positions.  Arming with stick positions is disabled when using a switch to arm.


## Stick positions

LOW - the channel value for the mapped channel input is around 1000
CENTER - the channel value for the mapped channel input is around 1500
HIGH - the channel value for the mapped channel input is around 2000

| Function                      | Throttle | Yaw     | Pitch  | Roll   |
| ----------------------------- | -------- | ------- | ------ | ------ |
| ARM                           | LOW      | HIGH    | CENTER | CENTER | 
| DISARM                        | LOW      | LOW     | CENTER | CENTER |
| Profile 1                     | LOW      | LOW     | CENTER | LOW    | 
| Profile 2                     | LOW      | LOW     | HIGH   | CENTER | 
| Profile 3                     | LOW      | LOW     | CENTER | HIGH   | 
| Calibrate Gyro                | LOW      | LOW     | LOW    | CENTER |
| Calibrate Acc                 | HIGH     | LOW     | LOW    | CENTER |
| Calibrate Mag/Compass         | HIGH     | HIGH    | LOW    | CENTER |
| Inflight calibration controls | LOW      | LOW     | HIGH   | HIGH   |
| Trim Acc Left                 | HIGH     | CENTER  | CENTER | LOW    |
| Trim Acc Right                | HIGH     | CENTER  | CENTER | HIGH   |
| Trim Acc Forwards             | HIGH     | CENTER  | HIGH   | CENTER |
| Trim Acc Backwards            | HIGH     | CENTER  | LOW    | CENTER |
| Disable LCD Page Cycling      | LOW      | CENTER  | HIGH   | LOW    |
| Enable LCD Page Cycling       | LOW      | CENTER  | HIGH   | HIGH   |
| Save setting                  | LOW      | LOW     | LOW    | HIGH   |


##### Download a graphic [pdf cheat-sheet](https://multiwii.googlecode.com/svn/branches/Hamburger/MultiWii-StickConfiguration-23_v0-5772156649.pdf) with TX stick commands.

The Latest version of this pdf can always be found [Here](https://code.google.com/p/multiwii/source/browse/#svn%2Fbranches%2FHamburger)
