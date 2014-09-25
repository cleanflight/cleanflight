#pragma once

bool mpu9150detect(sensor_t * mag);
void mpu9150Init(sensor_align_e align);
void mpu9150Read(int16_t *magData);
