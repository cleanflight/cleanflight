/*
 * Author: Brendan Le Foll <brendan.le.foll@intel.com>
 * Copyright (c) 2014 Intel Corporation.
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

#include "gpio.h"
#include "types.hpp"
#include <stdexcept>

#if defined(SWIGJAVASCRIPT)
#if NODE_MODULE_VERSION >= 0x000D
#include <uv.h>
#endif
#endif

namespace mraa
{

// These enums must match the enums in gpio.h

/**
 * Gpio Output modes
 */
typedef enum {
    MODE_STRONG = 0,   /**< Default. Strong High and Low */
    MODE_PULLUP = 1,   /**< Resistive High */
    MODE_PULLDOWN = 2, /**< Resistive Low */
    MODE_HIZ = 3       /**< High Z State */
} Mode;

/**
 * Gpio Direction options
 */
typedef enum {
    DIR_OUT = 0,      /**< Output. A Mode can also be set */
    DIR_IN = 1,       /**< Input */
    DIR_OUT_HIGH = 2, /**< Output. Init High */
    DIR_OUT_LOW = 3   /**< Output. Init Low */
} Dir;

/**
 * Gpio Edge types for interrupts
 */
typedef enum {
    EDGE_NONE = 0,   /**< No interrupt on Gpio */
    EDGE_BOTH = 1,   /**< Interrupt on rising & falling */
    EDGE_RISING = 2, /**< Interrupt on rising only */
    EDGE_FALLING = 3 /**< Interrupt on falling only */
} Edge;

/**
 * @brief API to General Purpose IO
 *
 * This file defines the gpio interface for libmraa
 *
 * @snippet Blink-IO.cpp Interesting
 */
class Gpio
{
  public:
    /**
     * Instantiates a Gpio object
     *
     * @param pin pin number to use
     * @param owner (optional) Set pin owner, default behaviour is to 'own'
     * the pin if we exported it. This means we will close it on destruct.
     * Otherwise it will get left open. This is only valid in sysfs use
     * cases
     * @param raw (optional) Raw pins will use gpiolibs pin numbering from
     * the kernel module. Note that you will not get any muxers set up for
     * you so this may not always work as expected.
     */
    Gpio(int pin, bool owner = true, bool raw = false)
    {
        if (raw) {
            m_gpio = mraa_gpio_init_raw(pin);
        } else {
            m_gpio = mraa_gpio_init(pin);
        }

        if (m_gpio == NULL) {
            throw std::invalid_argument("Invalid GPIO pin specified");
        }

        if (!owner) {
            mraa_gpio_owner(m_gpio, 0);
        }
    }
    /**
     * Gpio Constructor, takes a pointer to the GPIO context and initialises
     * the GPIO class
     *
     * @param void * to GPIO context
     */
    Gpio(void* gpio_context)
    {
        m_gpio = (mraa_gpio_context) gpio_context;
        if (m_gpio == NULL) {
            throw std::invalid_argument("Invalid GPIO context");
        }
    }
    /**
     * Gpio object destructor, this will only unexport the gpio if we where
     * the owner
     */
    ~Gpio()
    {
        mraa_gpio_close(m_gpio);
    }
    /**
     * Set the edge mode for ISR
     *
     * @param mode The edge mode to set
     * @return Result of operation
     */
    Result
    edge(Edge mode)
    {
        return (Result) mraa_gpio_edge_mode(m_gpio, (mraa_gpio_edge_t) mode);
    }
#if defined(SWIGPYTHON)
    Result
    isr(Edge mode, PyObject* pyfunc, PyObject* args)
    {
        return (Result) mraa_gpio_isr(m_gpio, (mraa_gpio_edge_t) mode, (void (*) (void*)) pyfunc, (void*) args);
    }
#elif defined(SWIGJAVASCRIPT)
    static void
    v8isr(uv_work_t* req, int status)
    {
#if NODE_MODULE_VERSION >= 0x000D
        v8::HandleScope scope(v8::Isolate::GetCurrent());
#endif
        mraa::Gpio* This = (mraa::Gpio*) req->data;
        int argc = 1;
        v8::Local<v8::Value> argv[] = { SWIGV8_INTEGER_NEW(-1) };
#if NODE_MODULE_VERSION >= 0x000D
        v8::Local<v8::Function> f = v8::Local<v8::Function>::New(v8::Isolate::GetCurrent(), This->m_v8isr);
        f->Call(SWIGV8_CURRENT_CONTEXT()->Global(), argc, argv);
#else
        This->m_v8isr->Call(SWIGV8_CURRENT_CONTEXT()->Global(), argc, argv);
#endif
        delete req;
    }

    static void
    nop(uv_work_t* req)
    {
        // Do nothing.
    }

    static void
    uvwork(void* ctx)
    {
        uv_work_t* req = new uv_work_t;
        req->data = ctx;
        uv_queue_work(uv_default_loop(), req, nop, v8isr);
    }

    Result
    isr(Edge mode, v8::Handle<v8::Function> func)
    {
#if NODE_MODULE_VERSION >= 0x000D
        m_v8isr.Reset(v8::Isolate::GetCurrent(), func);
#else
        m_v8isr = v8::Persistent<v8::Function>::New(func);
#endif
        return (Result) mraa_gpio_isr(m_gpio, (mraa_gpio_edge_t) mode, &uvwork, this);
    }
#elif defined(SWIGJAVA) || defined(JAVACALLBACK)
    Result
    isr(Edge mode, jobject runnable)
    {
        return (Result) mraa_gpio_isr(m_gpio, (mraa_gpio_edge_t) mode, mraa_java_isr_callback, runnable);
    }
#endif
    /**
     * Sets a callback to be called when pin value changes
     *
     * @param mode The edge mode to set
     * @param fptr Function pointer to function to be called when interrupt is
     * triggered
     * @param args Arguments passed to the interrupt handler (fptr)
     * @return Result of operation
     */
    Result
    isr(Edge mode, void (*fptr)(void*), void* args)
    {
        return (Result) mraa_gpio_isr(m_gpio, (mraa_gpio_edge_t) mode, fptr, args);
    }

    /**
     * Exits callback - this call will not kill the isr thread immediately
     * but only when it is out of it's critical section
     *
     * @return Result of operation
     */
    Result
    isrExit()
    {
#if defined(SWIGJAVASCRIPT)
#if NODE_MODULE_VERSION >= 0x000D
        m_v8isr.Reset();
#else
        m_v8isr.Dispose();
        m_v8isr.Clear();
#endif
#endif
        return (Result) mraa_gpio_isr_exit(m_gpio);
    }
    /**
     * Change Gpio mode
     *
     * @param mode The mode to change the gpio into
     * @return Result of operation
     */
    Result
    mode(Mode mode)
    {
        return (Result )mraa_gpio_mode(m_gpio, (mraa_gpio_mode_t) mode);
    }
    /**
     * Change Gpio direction
     *
     * @param dir The direction to change the gpio into
     * @return Result of operation
     */
    Result
    dir(Dir dir)
    {
        return (Result )mraa_gpio_dir(m_gpio, (mraa_gpio_dir_t) dir);
    }

    /**
     * Read Gpio direction
     *
     * @throw std::runtime_error in case of failure
     * @return Result of operation
     */
    Dir
    readDir()
    {
        mraa_gpio_dir_t dir;
        if (mraa_gpio_read_dir(m_gpio, &dir) != MRAA_SUCCESS) {
            throw std::runtime_error("Failed to read direction");
        }
        return (Dir) dir;
    }

    /**
     * Read value from Gpio
     *
     * @return Gpio value
     */
    int
    read()
    {
        return mraa_gpio_read(m_gpio);
    }
    /**
     * Write value to Gpio
     *
     * @param value Value to write to Gpio
     * @return Result of operation
     */
    Result
    write(int value)
    {
        return (Result) mraa_gpio_write(m_gpio, value);
    }
    /**
     * Enable use of mmap i/o if available.
     *
     * @param enable true to use mmap
     * @return Result of operation
     */
    Result
    useMmap(bool enable)
    {
        return (Result) mraa_gpio_use_mmaped(m_gpio, (mraa_boolean_t) enable);
    }
    /**
     * Get pin number of Gpio. If raw param is True will return the
     * number as used within sysfs. Invalid will return -1.
     *
     * @param raw (optional) get the raw gpio number.
     * @return Pin number
     */
    int
    getPin(bool raw = false)
    {
        if (raw) {
            return mraa_gpio_get_pin_raw(m_gpio);
        }
        return mraa_gpio_get_pin(m_gpio);
    }

  private:
    mraa_gpio_context m_gpio;
#if defined(SWIGJAVASCRIPT)
    v8::Persistent<v8::Function> m_v8isr;
#endif
};
}
