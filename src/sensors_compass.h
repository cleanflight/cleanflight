#pragma once

void Mag_init(void);
int Mag_getADC(void);

extern int16_t magADC[XYZ_AXIS_COUNT];
