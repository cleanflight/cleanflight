/*
 * kalman_filter.h
 *
 *  Created on: 30.05.2015
 *      Author: robert b
 */

#ifndef KALMAN_FILTER_H_
#define KALMAN_FILTER_H_

// used in a 2nd test
void accelKalmanfilterStep(int16_t acc[3]);
void gyroKalmanfilterStep(int16_t gyros[3]);

void accFilter(int16_t acc[3]);
void gyroFilter(int16_t gyro[3]);

#endif /* KALMAN_FILTER_H_ */
