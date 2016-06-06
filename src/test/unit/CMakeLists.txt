# Output directories for unittests
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY  ${CMAKE_BINARY_DIR}/lib/unittest)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY  ${CMAKE_BINARY_DIR}/bin/unittest)

# gtest libs - for tests without a main entry point
set(gtest_main_libs gtest_main gtest)

#######################################
# Macros
#######################################

# cleanflight_add_gtest(name libs)
#    Adds a test, [name].cc is implicitly included as a source
macro(cleanflight_add_gtest name libs)

    # Test target
    add_executable(${name}
        ${name}.cc)

    # Link with libraries
    target_link_libraries(${name} ${gtest_main_libs})
    foreach (lib "${libs}")
        target_link_libraries(${name} ${lib})
    endforeach()

    # Target to make the test runnable with
    #   $ make test
    add_test(
        NAME    ${name}
        COMMAND ${name})

    # Additional target for running and producing Junit XML result files with
    #   $ make {name}-junittest
    add_custom_target(${name}-junittest
        COMMAND ${name} "--gtest_output=xml:${name}_results.xml"
        DEPENDS${name})

    # Add it to our list of junittests
    LIST(APPEND junittests ${name}-junittest)
endmacro()

# Set up the parameter group linker flags accordingly for the [target]
macro(cleanflight_add_parameter_group_link_flags target)
    if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        set_property(
            TARGET ${target}
            APPEND PROPERTY LINK_FLAGS "-Wl,-map,${target}.map")
    else()
        set_property(
            TARGET ${target}
            APPEND PROPERTY LINK_FLAGS "-Wl,-T,${CMAKE_CURRENT_LIST_DIR}/parameter_group.ld -Wl,-Map,${target}.map")
    endif()
endmacro()

#######################################
# Tests
#######################################

###################
# /common/
###################
cleanflight_add_gtest(encoding_unittest
    "common-encoding")

cleanflight_add_gtest(maths_unittest
    "common-maths;")

cleanflight_add_gtest(scheduler_unittest
    "scheduler;scheduler_tasks;")

cleanflight_add_gtest(type_conversion_unittest
    "common-typeconversion;")

###################
# /config/
###################
cleanflight_add_gtest(config_eeprom_unittest
    "mock_flash;mock_system;config-config_eeprom;config-parameter_group;common-maths;config-config;config-config_streamer;config-feature;config-profile;")
cleanflight_add_parameter_group_link_flags(config_eeprom_unittest)

cleanflight_add_gtest(config_streamer_unittest
    "config-config_streamer;")

###################
# /drivers/
###################
cleanflight_add_gtest(baro_bmp085_unittest
    "drivers-barometer_bmp085;")

cleanflight_add_gtest(baro_bmp280_unittest
    "drivers-barometer_bmp280;")

cleanflight_add_gtest(baro_ms5611_unittest
    "drivers-barometer_ms5611;")

cleanflight_add_gtest(sonar_unittest
    "common-maths;drivers-sonar_hcsr04;sensors-sonar;")

cleanflight_add_gtest(ws2811_unittest
    "drivers-light_ws2811strip;")

###################
# /flight/
###################
cleanflight_add_gtest(flight_altitudehold_unittest
    "flight-altitudehold;")

cleanflight_add_gtest(gps_conversion_unittest
    "flight-gps_conversion;")

cleanflight_add_gtest(flight_failsafe_unittest
    "flight-failsafe;")

cleanflight_add_gtest(flight_mixer_unittest
    "common-maths;flight-mixer;flight-servos;")

cleanflight_add_gtest(flight_imu_unittest
    "flight-imu;flight-altitudehold;")

cleanflight_add_gtest(flight_pid_unittest
    "common-maths;flight-pid;flight-pid_luxfloat;flight-pid_mwrewrite;flight-pid_mw23;")

###################
# /io/
###################

cleanflight_add_gtest(ledstrip_unittest
    "io-ledstrip;")

cleanflight_add_gtest(msp_unittest
    "common-maths;common-streambuf;io-serial;io-msp;io-serial_msp;version;drivers-buf_writer;config-parameter_group;")
cleanflight_add_parameter_group_link_flags(msp_unittest)

cleanflight_add_gtest(rc_controls_unittest
    "common-maths;io-rc_adjustments;io-rc_controls;")

cleanflight_add_gtest(io_serial_unittest
    "io-serial;")

cleanflight_add_gtest(serial_msp_unittest
    "common-maths;common-streambuf;version;io-serial;io-serial_msp;")

###################
# /rx/
###################
cleanflight_add_gtest(rx_rx_unittest
    "rx-rx;")

cleanflight_add_gtest(rx_ranges_unittest
    "rx-rx;")

###################
# /sensors/
###################
cleanflight_add_gtest(alignsensor_unittest
    "sensors-boardalignment;")

cleanflight_add_gtest(battery_unittest
    "sensors-battery;")

cleanflight_add_gtest(common_filter_unittest
    "common-filter;")

###################
# /telemetry/
###################
cleanflight_add_gtest(telemetry_hott_unittest
    "flight-gps_conversion;telemetry-hott;")

#######################################
# QA tools and targets
#######################################

# Target for all ${name}-junittest, run with
#   $ make {name}-junittest
add_custom_target(junittest
    DEPENDS ${junittests})
