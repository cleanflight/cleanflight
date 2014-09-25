#pragma once

bool ak8975detect(sensor_t *mag);
void ak8975Init(sensor_align_e align);
void ak8975Read(int16_t *magData);
