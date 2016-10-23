#######
Example
#######
Here are some examples of how to use mraa, common convention is to import mraa
as mraa to keep it short but feel free to import it globally! As a general rule
the API is very similar to the C++ API so there are only basic examples to show
quick usage. The mraa module can be built with python3 or python2. All examples
may not run on python3 as this is not tested.

Hello GPIO
==========

Here is the simplest Gpio program in mraa.

.. literalinclude:: ../../../examples/python/hello_gpio.py
  :prepend: import mraa
  :start-after: import mraa

GPIO Interrupt (isr)
===================

The GPIO module allows you to set an interrupt on a GPIO. This interrupt is
controlled by the mode that the 'edge' is in. Before setting another isr please
remove the first one, multiple isrs on one pin are not supported. Some
platforms will not support interrupts on all pins so please check your return
values.

**Note:** Galileo Gen1 only supports EDGE_BOTH

.. literalinclude:: ../../../examples/python/hello_isr.py
  :prepend: import mraa
  :start-after: import mraa

**Note:** If the python script is ended the destructors will run meaning that
the ISR will not run. The sleep call is there for that function.

**Note:** The python isr module treats only objects. This means that int
counters will not work inside your isr. Please use the different edge modes.

I2c
===

The I2c module module has a number of different ways of interacting with the
i2c bus, including a number of overloaded read() calls and the writeReg()
helper function.

.. literalinclude:: ../../../examples/python/bmp85.py
  :prepend: x = m.I2c(0)
  :start-after: x = m.I2c(0)

.. literalinclude:: ../../../docs/i2c.txt

Pwm
===

The PWM module is rather simple, note that different hardware support PWM
generation is various different ways so results may vary.

.. literalinclude:: ../../../examples/python/cycle-pwm3.py
  :prepend: import mraa
  :start-after: import mraa

Aio
===

The ADC is typically provided on a dedicated or shared SPI bus, this is
abstracted by the Linux kernel as spidev and abstracted again by mraa. It is
fairly simple in use.

.. literalinclude:: ../../../examples/python/aio.py
  :prepend: import mraa
  :start-after: import mraa

Uart
====

Uart is the Universal asynchronous receiver/transmitter interface in mraa.
It allows the exposure of UART pins on supported boards, with basic
configuration operations supported.

Here's a simple pair of programs comprising a sender and receiver pair.

Sender:

.. literalinclude:: ../../../examples/python/uart_sender.py
  :prepend: import mraa
  :start-after: import mraa

Receiver:

.. literalinclude:: ../../../examples/python/uart_receiver.py
  :prepend: import mraa
  :start-after: import mraa
