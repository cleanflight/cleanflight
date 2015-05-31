/*
 * kalman_filter.h
 *
 *  Created on: 30.05.2015
 *      Author: bouwe_000
 */

#ifndef KALMAN_FILTER_H_
#define KALMAN_FILTER_H_


void accelKalmanfilterStep(int16_t acc[3]);
void gyroKalmanfilterStep(int16_t gyros[3]);


#endif /* KALMAN_FILTER_H_ */
