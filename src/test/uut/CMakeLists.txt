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
    ${USER_DIR}/build/version.c)
add_compile_definitions(version __TARGET__="TEST" __REVISION__="revision")

add_library(scheduler       ${USER_DIR}/scheduler/scheduler.c)

###################
# /common/
###################
cleanflight_add_module_libraries(common
    encoding
    filter
    maths
    printf
    streambuf
    typeconversion)
target_link_libraries(common-printf common-typeconversion)

###################
# /config/
###################
set(config_sources
    config_eeprom
    config_streamer
    feature
    profile
    parameter_group)
cleanflight_add_module_libraries(config ${config_sources})

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
# /fc/
###################
set(fc_sources
    config
    msp_server_fc
    rc_adjustments
    rc_controls)
cleanflight_add_module_libraries(fc ${fc_sources})
target_link_libraries(fc-config         config-config_eeprom)
target_link_libraries(fc-config         config-parameter_group)
foreach (fc_source ${fc_sources})
    add_compile_definitions(fc-${fc_source} FLASH_SIZE=128 STM32F10X_MD)
endforeach()

add_library(scheduler_tasks ${USER_DIR}/fc/fc_tasks.c)
target_link_libraries(scheduler_tasks common-maths)

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
    mixer
    servos)

# Enable feature toggles
add_compile_definitions(flight-pid              BLACKBOX)
add_compile_definitions(flight-pid_luxfloat     BLACKBOX)

target_link_libraries(flight-altitudehold   common-maths)
target_link_libraries(flight-altitudehold   common-filter)
target_link_libraries(flight-pid            common-filter)
target_link_libraries(flight-pid_luxfloat   common-filter)
target_link_libraries(flight-servos         common-maths)

###################
# /io/
###################
cleanflight_add_module_libraries(io
    ledstrip
    serial)

###################
# /msp/
###################
cleanflight_add_module_libraries(msp
    msp
    msp_serial)
target_link_libraries(msp-msp io-serial common-maths common-streambuf)
target_link_libraries(msp-msp_serial io-serial)

###################
# /osd/
###################
cleanflight_add_module_libraries(osd
    osd_screen
    osd_element
    osd_element_render)
    
target_link_libraries(osd-osd_element_render    common-printf)
target_link_libraries(osd-osd_element_render    common-maths)

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
    sonar
    voltage)

# Enable feature toggles
add_compile_definitions(sensors-sonar SONAR)

target_link_libraries(sensors-sonar             common-maths)
target_link_libraries(sensors-battery           common-maths)
target_link_libraries(sensors-boardalignment    common-maths)
target_link_libraries(sensors-voltage           common-maths)

###################
# /telemetry/
###################
cleanflight_add_module_libraries(telemetry
    ibus
    hott)
