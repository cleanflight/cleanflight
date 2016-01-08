/*
 * This file is part of Cleanflight.
 *
 * Cleanflight is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Cleanflight is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Cleanflight.  If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#include "serial.h"

serialPort_t *usbVcpOpen(void);

struct usbVcpPort_s;
extern struct usbVcpPort_s vcpPort;  // linking with CDC is 1:1 now, so export this
int vcpGetTxData(struct usbVcpPort_s *self, uint8_t* *dataPtr);
void vcpAckTxData(struct usbVcpPort_s *self, int txLen);
int vcpGetRxDataBuffer(struct usbVcpPort_s *self, uint8_t* *dataPtr);
void vcpAckRxData(struct usbVcpPort_s *self, int len);
