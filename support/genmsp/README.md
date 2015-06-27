genmsp
======
Converts ROS messages into the Cleanflight native encoders and
decoders.

See:

* msg/ for the messages.
* http://wiki.ros.org/msg for the message format.

genmsp depends on the [genmsg](https://github.com/ros/genmsg).
See http://www.ros.org/install/ for pre-built Ubuntu packages
including `ros-jade-genmsg` which installs under
`/opt/ros/jade/lib/python2.7/dist-packages`.

Implementation
--------------
The conversion is designed to be backwards compatible and to minimise
the size of the flight software.  To do this, it has certain features
and limitations:

* Fixed length arrays show as `const Foo *field`.
* Variable length arrays show as `const Foo *field` and `int nfield`
  pair.
* Values are passed as arguments.  As such, messages can't be nested
  past one level deep.
* To reduce copying or duplication, inner messages can be aliased to
  the existing native form using `string clearflight_type=fooBar_t'.

-- Michael Hope <mlhx@google.com> <michaelh@juju.net.nz>
