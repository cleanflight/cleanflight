prefix=@CMAKE_INSTALL_PREFIX@
exec_prefix=${prefix}
libdir=${exec_prefix}/lib@LIB_SUFFIX@
includedir=${prefix}/include

Name: mraa
Description: Low Level Skeleton Library for Communication
Version: @mraa_VERSION_STRING@

Libs: -L${libdir} -lmraajava
Cflags: -I${includedir}
