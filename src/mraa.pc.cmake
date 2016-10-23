prefix=@CMAKE_INSTALL_PREFIX@
exec_prefix=${prefix}
libdir=${exec_prefix}/@LIB_INSTALL_DIR@
includedir=${prefix}/include

Name: mraa
Description: Low Level Skeleton Library for Communication
Version: @mraa_VERSION_STRING@

Libs: -L${libdir} -lmraa
Cflags: -I${includedir}
