#######################################
# Macros
#######################################

# add_compile_definitions target [definitions]
#  Adds each [definition] to the [target]
macro(add_compile_definitions target)
    foreach (definition ${ARGN})
        set_property(
            TARGET ${target}
            APPEND PROPERTY COMPILE_DEFINITIONS
            ${definition})
    endforeach()
endmacro()

# cleanflight_add_module_libraries module_name [source file names]
#  Creates "[module_name]-" prefixes single source file libraries
#  for each [source file name].
macro(cleanflight_add_module_libraries module_name)
    foreach (src ${ARGN})
        add_library(${module_name}-${src}
            ${USER_DIR}/${module_name}/${src})
    endforeach()
endmacro()

#######################################
# Libraries for the unit-under-test code in main
#######################################

add_library(version
    ${USER_DIR}/version.c)
add_compile_definitions(version __TARGET__="TEST" __REVISION__="revision")

add_library(scheduler       ${USER_DIR}/scheduler.c)
add_library(scheduler_tasks ${USER_DIR}/scheduler_tasks.c)
target_link_libraries(scheduler_tasks common-maths)

###################
# /common/
###################
cleanflight_add_module_libraries(common
    encoding
    filter
    maths
    streambuf
    typeconversion)

###################
# /config/
###################
set(config_sources
    config
    config_eeprom
    config_streamer
    feature
    profile
    parameter_group)
cleanflight_add_module_libraries(config ${config_sources})

target_link_libraries(config-config         config-config_eeprom)
target_link_libraries(config-config         config-parameter_group)
target_link_libraries(config-config_eeprom  config-config_streamer mock_flash mock_system)

foreach (config_source ${config_sources})
    add_compile_definitions(config-${config_source} FLASH_SIZE=128 STM32F10X_MD)
endforeach()

###################
# /drivers/
###################
cleanflight_add_module_libraries(drivers
    barometer_bmp085
    barometer_bmp280
    barometer_ms5611
    buf_writer
    light_ws2811strip
    sonar_hcsr04)

# Enable feature toggles
add_compile_definitions(drivers-sonar_hcsr04 SONAR)

###################
# /flight/
###################
cleanflight_add_module_libraries(flight
    altitudehold
    failsafe
    gps_conversion
    imu
    pid
    pid_luxfloat
    pid_mwrewrite
    pid_mw23
    mixer
    servos)

# Enable feature toggles
add_compile_definitions(flight-pid              BLACKBOX)
add_compile_definitions(flight-pid_luxfloat     BLACKBOX)
add_compile_definitions(flight-pid_mwrewrite    BLACKBOX)
add_compile_definitions(flight-pid_mw23         BLACKBOX)

target_link_libraries(flight-altitudehold   common-maths)
target_link_libraries(flight-altitudehold   common-filter)
target_link_libraries(flight-pid            common-filter)
target_link_libraries(flight-pid_luxfloat   common-filter)
target_link_libraries(flight-pid_mwrewrite  common-filter)
target_link_libraries(flight-pid_mw23       common-filter)
target_link_libraries(flight-servos         common-maths)

###################
# /io/
###################
cleanflight_add_module_libraries(io
    ledstrip
    msp
    rc_adjustments
    rc_controls
    serial
    serial_msp)

target_link_libraries(io-msp io-serial common-maths common-streambuf)
target_link_libraries(io-serial_msp io-serial)

###################
# /rx/
###################
cleanflight_add_module_libraries(rx
    rx)
target_link_libraries(rx-rx common-maths)

###################
# /sensors/
###################
cleanflight_add_module_libraries(sensors
    battery
    boardalignment
    sonar)

# Enable feature toggles
add_compile_definitions(sensors-sonar SONAR)

target_link_libraries(sensors-sonar             common-maths)
target_link_libraries(sensors-battery           common-maths)
target_link_libraries(sensors-boardalignment    common-maths)

###################
# /telemetry/
###################
cleanflight_add_module_libraries(telemetry
    hott)
