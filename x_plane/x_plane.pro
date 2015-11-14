CONFIG += c++11
CONFIG += object_parallel_to_source
CONFIG += console
CONFIG += qt
QT     += core gui widgets serialport
QMAKE_CFLAGS += -std=c99

INCLUDEPATH += \
    ../src/main

DEFINES += \
    __TARGET__=\\\"X_PLANE\\\" \
    __REVISION__=\\\"1.0.0\\\" \
    _USE_MATH_DEFINES \
    NAZE \
    STM32F10X

HEADERS += \
    ../src/main/build_config.h \
    ../src/main/debug.h \
    ../src/main/mw.h \
    ../src/main/platform.h \
    ../src/main/version.h \
    ../src/main/telemetry/frsky.h \
    ../src/main/telemetry/hott.h \
    ../src/main/telemetry/msp.h \
    ../src/main/telemetry/smartport.h \
    ../src/main/telemetry/telemetry.h \
    ../src/main/sensors/acceleration.h \
    ../src/main/sensors/barometer.h \
    ../src/main/sensors/battery.h \
    ../src/main/sensors/boardalignment.h \
    ../src/main/sensors/compass.h \
    ../src/main/sensors/gyro.h \
    ../src/main/sensors/initialisation.h \
    ../src/main/sensors/sensors.h \
    ../src/main/sensors/sonar.h \
    ../src/main/rx/msp.h \
    ../src/main/rx/pwm.h \
    ../src/main/rx/rx.h \
    ../src/main/rx/sbus.h \
    ../src/main/rx/spektrum.h \
    ../src/main/rx/sumd.h \
    ../src/main/rx/sumh.h \
    ../src/main/rx/xbus.h \
    ../src/main/io/beeper.h \
    ../src/main/io/display.h \
    ../src/main/io/escservo.h \
    ../src/main/io/flashfs.h \
    ../src/main/io/gimbal.h \
    ../src/main/io/gps.h \
    ../src/main/io/ledstrip.h \
    ../src/main/io/rc_controls.h \
    ../src/main/io/rc_curves.h \
    ../src/main/io/serial.h \
    ../src/main/io/serial_1wire.h \
    ../src/main/io/serial_cli.h \
    ../src/main/io/serial_msp.h \
    ../src/main/io/statusindicator.h \
    ../src/main/flight/altitudehold.h \
    ../src/main/flight/failsafe.h \
    ../src/main/flight/filter.h \
    ../src/main/flight/gps_conversion.h \
    ../src/main/flight/gtune.h \
    ../src/main/flight/imu.h \
    ../src/main/flight/lowpass.h \
    ../src/main/flight/mixer.h \
    ../src/main/flight/navigation.h \
    ../src/main/flight/pid.h \
    ../src/main/config/config.h \
    ../src/main/config/config_master.h \
    ../src/main/config/config_profile.h \
    ../src/main/config/runtime_config.h \
    ../src/main/common/atomic.h \
    ../src/main/common/axis.h \
    ../src/main/common/color.h \
    ../src/main/common/colorconversion.h \
    ../src/main/common/encoding.h \
    ../src/main/common/maths.h \
    ../src/main/common/printf.h \
    ../src/main/common/typeconversion.h \
    ../src/main/common/utils.h \
    ../src/main/blackbox/blackbox.h \
    ../src/main/blackbox/blackbox_fielddefs.h \
    ../src/main/blackbox/blackbox_io.h \
    hardware_revision.h

SOURCES += \
    ../src/main/build_config.c \
    ../src/main/debug.c \
    ../src/main/main.c \
    ../src/main/mw.c \
    ../src/main/version.c \
    ../src/main/telemetry/frsky.c \
    ../src/main/telemetry/hott.c \
    ../src/main/telemetry/msp.c \
    ../src/main/telemetry/smartport.c \
    ../src/main/telemetry/telemetry.c \
    ../src/main/sensors/acceleration.c \
    ../src/main/sensors/barometer.c \
    ../src/main/sensors/battery.c \
    ../src/main/sensors/boardalignment.c \
    ../src/main/sensors/compass.c \
    ../src/main/sensors/gyro.c \
    ../src/main/sensors/initialisation.c \
    ../src/main/sensors/sonar.c \
    ../src/main/rx/pwm.c \
    ../src/main/rx/rx.c \
    ../src/main/rx/sbus.c \
    ../src/main/rx/spektrum.c \
    ../src/main/rx/sumd.c \
    ../src/main/rx/sumh.c \
    ../src/main/rx/xbus.c \
    ../src/main/io/beeper.c \
    ../src/main/io/display.c \
    ../src/main/io/flashfs.c \
    ../src/main/io/gps.c \
    ../src/main/io/ledstrip.c \
    ../src/main/io/rc_controls.c \
    ../src/main/io/rc_curves.c \
    ../src/main/io/serial.c \
    ../src/main/io/serial_cli.c \
    ../src/main/io/serial_msp.c \
    ../src/main/io/statusindicator.c \
    ../src/main/flight/altitudehold.c \
    ../src/main/flight/failsafe.c \
    ../src/main/flight/filter.c \
    ../src/main/flight/gps_conversion.c \
    ../src/main/flight/gtune.c \
    ../src/main/flight/imu.c \
    ../src/main/flight/lowpass.c \
    ../src/main/flight/mixer.c \
    ../src/main/flight/navigation.c \
    ../src/main/flight/pid.c \
    ../src/main/config/config.c \
    ../src/main/config/runtime_config.c \
    ../src/main/common/colorconversion.c \
    ../src/main/common/encoding.c \
    ../src/main/common/maths.c \
    ../src/main/common/printf.c \
    ../src/main/common/typeconversion.c \
    ../src/main/rx/msp.c \
    ../src/main/blackbox/blackbox.c \
    ../src/main/blackbox/blackbox_io.c \
    emulation.cpp \
    hardware_revision.c \
    flash.c \
    time.c
