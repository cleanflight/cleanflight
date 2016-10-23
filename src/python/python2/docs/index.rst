.. . documentation master file, created by
   sphinx-quickstart on Thu May  1 18:34:23 2014.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to mraa's documentation!
================================

.. include:: ../../../docs/index.md
  :start-after: ==============
  :end-before: ## API

.. toctree::
   :maxdepth: 2

   mraa
   example

Supported Platforms
===================

   * `Galileo Gen 1 - Rev D <../galileorevd.html>`_
   * `Galileo Gen 2 - Rev H <../galileorevh.html>`_
   * `Intel Edison <../edison.html>`_
   * `Intel(R) NUC DE3815tykhe <../de3815.html>`_
   * `Intel(R) Minnowboard Max <../minnowmax.html>`_
   * `Raspberry Pi <../rasppi.html>`_
   * `Banana Pi/Pro <../bananapi.html>`_
   * `Beaglebone Black <../beaglebone.html>`_
   * `Intel NUC NUC5i5MYBE <../nuc5.html>`_
   * `UP <../up.html>`_
   * `FTDI FT4222H <../ft4222.html>`_

Compiling & Debugging libmraa
=============================

Libmraa is a C library and SWIG is used to generate bindings therefore to
debug, you very quickly need to use the same methods as you would for debugging
a C library. Generally attaching gdb to python works well, build mraa with
debug symbols and set breakpoints either in the SWIG _wrap functions, the C++
method/functions or the underlying C function. More info can be found on the
C/C++ documentation:
   * `Debugging <../debugging.html>`_
   * `Building from source <../building.html>`_

API Changelog
=============
.. include:: ../../../docs/index.md
  :start-after: API Changelog

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

