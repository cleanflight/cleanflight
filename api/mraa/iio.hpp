/*
 * Author: Henry Bruce <henry.bruce@intel.com>
 * Copyright (c) 2015 Intel Corporation.
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#pragma once

#include <stdexcept>
 #include <sstream>
#include "iio.h"
#include "types.hpp"

namespace mraa
{

struct IioEventData
{
    int channelType;
    int modifier;
    int type;
    int direction;
    int channel;
    int channel2;
    int diff;
};

class IioHandler
{
public:
  virtual void onIioEvent(const IioEventData& eventData) = 0;
};


/**
 * @brief API to Industrial IO
 *
 * This file defines the C++ iio interface for libmraa
 *
 * @snippet iio_dummy_test.cpp Interesting
 */
class Iio
{
  public:
    /**
     * Iio Constructor, takes a device number which will map directly to sysfs
     * e.g. device 0 maps to /sys/bus/iio/devices/iio:device0
     *
     * @param device IIO device number
     *
     * @throws std::invalid_argument if initialization fails
     */
    Iio(int device)
    {
        m_iio = mraa_iio_init(device);
        if (m_iio == NULL) {
            std::ostringstream oss;
            oss << "IIO device " << device << " is not valid";
            throw std::invalid_argument(oss.str());
        }
    }

    /**
     * Iio Constructor
     *
     * @param deviceName IIO device name
     *
     * @throws std::invalid_argument if initialization fails
     */
    Iio(const std::string& deviceName)
    {
        std::ostringstream oss;
        int id = mraa_iio_get_device_num_by_name(deviceName.c_str());
        if (id == -1) {
            oss << "IIO device name " << deviceName << " not found";
            throw std::invalid_argument(oss.str());
        }
        m_iio = mraa_iio_init(id);
        if (m_iio == NULL) {
            oss << "IIO device " << deviceName << " is not valid";
            throw std::invalid_argument(oss.str());
        }
    }

    /**
     * Iio destructor
     */
    ~Iio()
    {
        mraa_iio_close(m_iio);
    }


    /**
     * Get device name
     *
     * @returns The device name
     */
    std::string
    getDeviceName() const
    {
        return mraa_iio_get_device_name(m_iio);
    }

    /**
     * Read an int value from specified attribute.
     *
     * @param attributeName attribute mame
     *
     * @returns The int value
     *
     * @throws std::invalid_argument if read fails
     */
    int
    readInt(const std::string& attributeName) const
    {
        int value;
        mraa_result_t res = mraa_iio_read_int(m_iio, attributeName.c_str(), &value);
        if (res != MRAA_SUCCESS) {
            std::ostringstream oss;
            oss << "IIO readInt for attibute " << attributeName << " failed";
            throw std::runtime_error(oss.str());
        }
        return value;
    }

    /**
     * Read a float value from specified attribute.
     *
     * @param attributeName attribute mame
     *
     * @returns The float value
     *
     * @throws std::invalid_argument if read fails
     */
    float
    readFloat(const std::string& attributeName) const
    {
        float value;
        mraa_result_t res = mraa_iio_read_float(m_iio, attributeName.c_str(), &value);
        if (res != MRAA_SUCCESS) {
            std::ostringstream oss;
            oss << "IIO readFloat for attibute " << attributeName << " failed";
            throw std::runtime_error(oss.str());
        }
        return value;
    }

    /**
     * Write an int value to specified attribute.
     *
     * @param attributeName attribute mame
     * @param value int value
     *
     * @throws std::invalid_argument if write fails
     */
    void
    writeInt(const std::string& attributeName, int value) const
    {
        mraa_result_t res = mraa_iio_write_int(m_iio, attributeName.c_str(), value);
        if (res != MRAA_SUCCESS) {
            std::ostringstream oss;
            oss << "IIO writeInt for attibute " << attributeName << " failed";
            throw std::runtime_error(oss.str());
        }

    }

    /**
     * Write a float value to specified attribute.
     *
     * @param attributeName attribute mame
     * @param value float value
     *
     * @throws std::invalid_argument if write fails
     */
    void
    writeFloat(const std::string& attributeName, float value) const
    {
        mraa_result_t res = mraa_iio_write_float(m_iio, attributeName.c_str(), value);
        if (res != MRAA_SUCCESS) {
            std::ostringstream oss;
            oss << "IIO writeFloat for attibute " << attributeName << " failed";
            throw std::runtime_error(oss.str());
        }

    }

    /**
     * Register event handler.
     *
     * @param handler handler class that implements IioHandler
     *
     * @throws std::invalid_argument on failure
     */
    void
    registerEventHandler(IioHandler* handler) const
    {
        mraa_result_t res = mraa_iio_event_setup_callback(m_iio, private_event_handler, handler);
        if (res != MRAA_SUCCESS) {
            throw std::runtime_error("registerEventHandler failed");
        }
    }

  private:
    static void private_event_handler(iio_event_data* data, void *args)
    {
        if (args != NULL) {
            IioHandler* handler = (IioHandler*)args;
            IioEventData eventData;
            int chan_type, modifier, type, direction, channel, channel2, different;
            mraa_iio_event_extract_event(data, &chan_type, &modifier, &type, &direction, &channel, &channel2, &different);
            eventData.channelType = chan_type;
            eventData.modifier = modifier;
            eventData.type = type;
            eventData.direction = direction;
            eventData.channel = channel;
            eventData.channel2 = channel2;
            eventData.diff = different;
            handler->onIioEvent(eventData);
        }
    }

    mraa_iio_context m_iio;
};

}
