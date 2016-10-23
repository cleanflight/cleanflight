/*
 * Author: Henry Bruce <henry.bruce@intel.com>
 * Copyright (c) 2016 Intel Corporation.
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

#include <syslog.h>
#include <Python.h>
#include "python/mraapy.h"


// In order to call a python object (all python functions are objects) we
// need to aquire the GIL (Global Interpreter Lock). This may not always be
// necessary but especially if doing IO (like print()) python will segfault
// if we do not hold a lock on the GIL
void
mraa_python_isr(void (*isr)(void*), void* isr_args)
{

    PyGILState_STATE gilstate = PyGILState_Ensure();
    PyObject* arglist;
    PyObject* ret;
    arglist = Py_BuildValue("(O)", isr_args);
    if (arglist == NULL) {
        syslog(LOG_ERR, "gpio: Py_BuildValue NULL");
    } else {
        ret = PyEval_CallObject((PyObject*) isr, arglist);
        if (ret == NULL) {
            syslog(LOG_ERR, "gpio: PyEval_CallObject failed");
            PyObject *pvalue, *ptype, *ptraceback;
            PyObject *pvalue_pystr, *ptype_pystr, *ptraceback_pystr;
            char *pvalue_cstr, *ptype_cstr, *ptraceback_cstr;
            PyErr_Fetch(&pvalue, &ptype, &ptraceback);
            pvalue_pystr = PyObject_Str(pvalue);
            ptype_pystr = PyObject_Str(ptype);
            ptraceback_pystr = PyObject_Str(ptraceback);
// Python2
#if PY_VERSION_HEX < 0x03000000
            pvalue_cstr = PyString_AsString(pvalue_pystr);
            ptype_cstr = PyString_AsString(ptype_pystr);
            ptraceback_cstr = PyString_AsString(ptraceback_pystr);
// Python 3 and up
#elif PY_VERSION_HEX >= 0x03000000
            // In Python 3 we need one extra conversion
            PyObject *pvalue_ustr, *ptype_ustr, *ptraceback_ustr;
            pvalue_ustr = PyUnicode_AsUTF8String(pvalue_pystr);
            pvalue_cstr = PyBytes_AsString(pvalue_ustr);
            ptype_ustr = PyUnicode_AsUTF8String(ptype_pystr);
            ptype_cstr = PyBytes_AsString(ptype_ustr);
            ptraceback_ustr = PyUnicode_AsUTF8String(ptraceback_pystr);
            ptraceback_cstr = PyBytes_AsString(ptraceback_ustr);
#endif // PY_VERSION_HEX
            syslog(LOG_ERR, "gpio: the error was %s:%s:%s", pvalue_cstr, ptype_cstr, ptraceback_cstr);
            Py_XDECREF(pvalue);
            Py_XDECREF(ptype);
            Py_XDECREF(ptraceback);
            Py_XDECREF(pvalue_pystr);
            Py_XDECREF(ptype_pystr);
            Py_XDECREF(ptraceback_pystr);
// Python 3 and up
#if PY_VERSION_HEX >= 0x03000000
            Py_XDECREF(pvalue_ustr);
            Py_XDECREF(ptype_ustr);
            Py_XDECREF(ptraceback_ustr);
#endif // PY_VERSION_HEX
        } else {
            Py_DECREF(ret);
        }
        Py_DECREF(arglist);
    }

    PyGILState_Release(gilstate);
}
