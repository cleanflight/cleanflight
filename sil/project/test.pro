TARGET   = test
CONFIG   += console
CONFIG   -= app_bundle
TEMPLATE  = app

INCLUDEPATH += \
    ../../lib/test/gtest/inc \
    ../../src/main

SOURCES += \
    ../../src/test/unit/bitstream_unittest.cc \
    ../../lib/test/gtest/src/gtest_main.cc \
    ../../lib/test/gtest/src/gtest-all.cc \
    ../../src/main/common/bitstream.c

HEADERS += \
    ../../src/main/common/bitstream.h
