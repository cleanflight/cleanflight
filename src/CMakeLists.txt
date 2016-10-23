set (mraa_LIB_INCLUDE_DIRS
  ${PROJECT_SOURCE_DIR}/api
  ${PROJECT_SOURCE_DIR}/api/mraa
  ${PROJECT_SOURCE_DIR}/include
)

if (FIRMATA)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DFIRMATA=1")
  add_subdirectory (firmata)
endif ()

if (ONEWIRE)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DONEWIRE=1")
  add_subdirectory (uart_ow)
endif ()

include_directories(
  ${mraa_LIB_INCLUDE_DIRS}
)

set (mraa_LIB_SRCS_NOAUTO
  ${PROJECT_SOURCE_DIR}/src/mraa.c
  ${PROJECT_SOURCE_DIR}/src/gpio/gpio.c
  ${PROJECT_SOURCE_DIR}/src/i2c/i2c.c
  ${PROJECT_SOURCE_DIR}/src/pwm/pwm.c
  ${PROJECT_SOURCE_DIR}/src/spi/spi.c
  ${PROJECT_SOURCE_DIR}/src/aio/aio.c
  ${PROJECT_SOURCE_DIR}/src/uart/uart.c
  ${PROJECT_SOURCE_DIR}/src/iio/iio.c
  ${mraa_LIB_SRCS_NOAUTO}
)

set (mraa_LIB_X86_SRCS_NOAUTO
  ${PROJECT_SOURCE_DIR}/src/x86/x86.c
  ${PROJECT_SOURCE_DIR}/src/x86/intel_galileo_rev_d.c
  ${PROJECT_SOURCE_DIR}/src/x86/intel_galileo_rev_g.c
  ${PROJECT_SOURCE_DIR}/src/x86/intel_edison_fab_c.c
  ${PROJECT_SOURCE_DIR}/src/x86/intel_de3815.c
  ${PROJECT_SOURCE_DIR}/src/x86/intel_nuc5.c
  ${PROJECT_SOURCE_DIR}/src/x86/intel_minnow_byt_compatible.c
  ${PROJECT_SOURCE_DIR}/src/x86/intel_sofia_3gr.c
  ${PROJECT_SOURCE_DIR}/src/x86/intel_cherryhills.c
  ${PROJECT_SOURCE_DIR}/src/x86/up.c
  ${PROJECT_SOURCE_DIR}/src/x86/intel_gt_tuchuck.c
)

message (STATUS "INFO - Adding support for platform ${MRAAPLATFORMFORCE}")

#keywords in if statements are case sensitive
if (NOT ${MRAAPLATFORMFORCE} STREQUAL "ALL")
  set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Dx${MRAAPLATFORMFORCE} -DMRAA_PLATFORM_FORCE=${MRAAPLATFORMFORCE}")
  if (${MRAAPLATFORMFORCE} STREQUAL "MRAA_INTEL_GALILEO_GEN2")
    set (mraa_LIB_X86_SRCS_NOAUTO ${PROJECT_SOURCE_DIR}/src/x86/x86.c ${PROJECT_SOURCE_DIR}/src/x86/intel_galileo_rev_g.c)
  elseif (${MRAAPLATFORMFORCE} STREQUAL "MRAA_INTEL_GALILEO_GEN1")
    set (mraa_LIB_X86_SRCS_NOAUTO ${PROJECT_SOURCE_DIR}/src/x86/x86.c ${PROJECT_SOURCE_DIR}/src/x86/intel_galileo_rev_d.c)
  elseif (${MRAAPLATFORMFORCE} STREQUAL "MRAA_INTEL_DE3815")
    set (mraa_LIB_X86_SRCS_NOAUTO ${PROJECT_SOURCE_DIR}/src/x86/x86.c ${PROJECT_SOURCE_DIR}/src/x86/intel_de3815.c)
  elseif (${MRAAPLATFORMFORCE} STREQUAL "MRAA_INTEL_EDISON_FAB_C")
    set (mraa_LIB_X86_SRCS_NOAUTO ${PROJECT_SOURCE_DIR}/src/x86/x86.c ${PROJECT_SOURCE_DIR}/src/x86/intel_edison_fab_c.c)
  elseif (${MRAAPLATFORMFORCE} STREQUAL "MRAA_INTEL_MINNOWBOARD_MAX")
    set (mraa_LIB_X86_SRCS_NOAUTO ${PROJECT_SOURCE_DIR}/src/x86/x86.c ${PROJECT_SOURCE_DIR}/src/x86/intel_minnow_byt_compatible.c)
  elseif (${MRAAPLATFORMFORCE} STREQUAL "MRAA_INTEL_NUC5")
    set (mraa_LIB_X86_SRCS_NOAUTO ${PROJECT_SOURCE_DIR}/src/x86/x86.c ${PROJECT_SOURCE_DIR}/src/x86/intel_nuc5.c)
  elseif (${MRAAPLATFORMFORCE} STREQUAL "MRAA_INTEL_SOFIA_3GR")
    set (mraa_LIB_X86_SRCS_NOAUTO ${PROJECT_SOURCE_DIR}/src/x86/x86.c ${PROJECT_SOURCE_DIR}/src/x86/intel_sofia_3gr.c)
  elseif (${MRAAPLATFORMFORCE} STREQUAL "MRAA_INTEL_CHERRYHILLS")
    set (mraa_LIB_X86_SRCS_NOAUTO ${PROJECT_SOURCE_DIR}/src/x86/x86.c ${PROJECT_SOURCE_DIR}/src/x86/intel_cherryhills.c)
  elseif (${MRAAPLATFORMFORCE} STREQUAL "MRAA_UP")
    set (mraa_LIB_X86_SRCS_NOAUTO ${PROJECT_SOURCE_DIR}/src/x86/x86.c ${PROJECT_SOURCE_DIR}/src/x86/up.c)
  elseif( ${MRAAPLATFORMFORCE} STREQUAL "MRAA_INTEL_GT_TUCHUCK")
    set (mraa_LIB_X86_SRCS_NOAUTO ${PROJECT_SOURCE_DIR}/src/x86/x86.c ${PROJECT_SOURCE_DIR}/src/x86/intel_gt_tuchuck.c)
  else ()
    message (FATAL_ERROR "Unknown x86 platform enabled!")
  endif ()
else ()
    message (STATUS "INFO - Adding support for all platforms")
endif ()

set (mraa_LIB_ARM_SRCS_NOAUTO
  ${PROJECT_SOURCE_DIR}/src/arm/arm.c
  ${PROJECT_SOURCE_DIR}/src/arm/96boards.c
  ${PROJECT_SOURCE_DIR}/src/arm/raspberry_pi.c
  ${PROJECT_SOURCE_DIR}/src/arm/beaglebone.c
  ${PROJECT_SOURCE_DIR}/src/arm/banana.c
)

set (mraa_LIB_MOCK_SRCS_NOAUTO
  ${PROJECT_SOURCE_DIR}/src/mock/mock.c
  ${PROJECT_SOURCE_DIR}/src/mock/mock_board.c
  ${PROJECT_SOURCE_DIR}/src/mock/mock_board_gpio.c
  ${PROJECT_SOURCE_DIR}/src/mock/mock_board_aio.c
  ${PROJECT_SOURCE_DIR}/src/mock/mock_board_i2c.c
  ${PROJECT_SOURCE_DIR}/src/mock/mock_board_spi.c
)

if (JSONPLAT)
  find_package (JSON-C QUIET)
  if (${JSON-C_FOUND})
    set (mraa_LIB_SRCS_NOAUTO
      ${mraa_LIB_SRCS_NOAUTO}
      ${PROJECT_SOURCE_DIR}/src/json/jsonplatform.c
    )
  endif ()
endif ()

set (mraa_LIBS ${CMAKE_THREAD_LIBS_INIT})


if (X86PLAT)
  add_subdirectory(x86)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DX86PLAT=1")
endif()

if (ARMPLAT)
  add_subdirectory(arm)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DARMPLAT=1")
endif()

if (MOCKPLAT)
  add_subdirectory(mock)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DMOCKPLAT=1")
  if (MSYS)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DMSYS=1")
  endif ()
endif()

if (USBPLAT)
  message (STATUS "INFO - Adding USB platforms")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DUSBPLAT=1")
  if (FTDID2xx)
    find_package (Ftd2xx)
    if (${LIBFTD2XX_FOUND})
      set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DFTDID2XX=1")
      set (mraa_LIBS ${mraa_LIBS} ${LIBFTD2XX_LIBRARIES})
    else ()
      message (SEND_ERROR "Enabled FTDID2xx support but library not found")
    endif ()
  endif ()
  if (FTDI4222)
    find_package (Ftd4222)
    if (${LIBFT4222_FOUND})
      set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DFTDI4222=1")
      set (mraa_LIBS ${mraa_LIBS} dl)
    else ()
      message (SEND_ERROR "Enabled FTDI4222 support but library not found")
    endif ()
  endif ()
  add_subdirectory(usb)
endif ()

if (JSONPLAT OR IMRAA)
  find_package (JSON-C QUIET)
  if (NOT ${JSON-C_FOUND})
    if (IMRAA)
      message (FATAL_ERROR "Enabled IMRAA but JSON-C library not found")
    elseif (JSONPLAT)
      message (WARNING "Enabled JSONPLAT but JSON-C library not found: Ignoring JSONPLAT")
    endif ()
  else ()
    if (JSONPLAT)
      set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DJSONPLAT=1")
    endif ()
    if (IMRAA)
      set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DIMRAA=1")
    endif ()
    include_directories (${JSON-C_INCLUDE_DIR})
    set (mraa_LIBS ${mraa_LIBS} ${JSON-C_LIBRARIES})
  endif ()
endif ()

set (mraa_LIB_SRCS
  ${mraa_LIB_PLAT_SRCS_NOAUTO}
# autogenerated version file
  ${CMAKE_CURRENT_BINARY_DIR}/version.c
)

set (mraa_LIB_GLOB_HEADERS
  ${PROJECT_SOURCE_DIR}/api/mraa.h
  ${PROJECT_SOURCE_DIR}/api/mraa.hpp
)

install (FILES ${mraa_LIB_GLOB_HEADERS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
install (DIRECTORY ${PROJECT_SOURCE_DIR}/api/mraa/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/mraa)

macro (mraa_CREATE_INSTALL_PKGCONFIG generated_file install_location)
  configure_file (${generated_file}.cmake ${CMAKE_CURRENT_BINARY_DIR}/${generated_file} @ONLY)
  install (FILES ${CMAKE_CURRENT_BINARY_DIR}/${generated_file} DESTINATION ${install_location})
endmacro (mraa_CREATE_INSTALL_PKGCONFIG)
mraa_create_install_pkgconfig (mraa.pc ${LIB_INSTALL_DIR}/pkgconfig)


if (DOXYGEN_FOUND)
  set (CMAKE_SWIG_FLAGS -DDOXYGEN=${DOXYGEN_FOUND})
  set (DOCCLASSES aio gpio i2c pwm spi uart)
  # CPP class headers
  foreach (_file ${DOCCLASSES})
    add_custom_command (OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${_file}_class_doc.i
      COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/doxy2swig.py -n
        ${CMAKE_BINARY_DIR}/xml/classmraa_1_1_${_file}.xml
        ${CMAKE_CURRENT_BINARY_DIR}/${_file}_class_doc.i
      DEPENDS ${CMAKE_BINARY_DIR}/xml/classmraa_1_1_${_file}.xml
    )
    add_custom_target (${_file}class_doc_i DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${_file}_class_doc.i)
    add_dependencies (${_file}class_doc_i doc)
  endforeach ()
  # C header files
  set (DOCFILES common ${DOCCLASSES})
  foreach (_file ${DOCFILES})
    add_custom_command (OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${_file}_doc.i
      COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/doxy2swig.py -n
        ${CMAKE_BINARY_DIR}/xml/${_file}_8h.xml
        ${CMAKE_CURRENT_BINARY_DIR}/${_file}_doc.i
      DEPENDS ${CMAKE_BINARY_DIR}/xml/${_file}_8h.xml
    )
    add_custom_target (${_file}doc_i DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${_file}_doc.i)
    add_dependencies (${_file}doc_i doc)
  endforeach ()
  # CPP common header
  add_custom_command (OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/common_hpp_doc.i
    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/doxy2swig.py -n
      ${CMAKE_BINARY_DIR}/xml/common_8hpp.xml
      ${CMAKE_CURRENT_BINARY_DIR}//common_hpp_doc.i
    DEPENDS ${CMAKE_BINARY_DIR}/xml/common_8hpp.xml
  )
  add_custom_target (common_hpp_doc_i DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/common_hpp_doc.i)
  add_dependencies (common_hpp_doc_i doc)
endif ()

if (BUILDSWIG)
  enable_language(CXX)
  find_package (SWIG)
  if (SWIG_FOUND)
    include (${SWIG_USE_FILE})
    set_source_files_properties (mraa.i PROPERTIES SWIG_FLAGS "-I${CMAKE_BINARY_DIR}/src")

    if (BUILDSWIGPYTHON)
      add_subdirectory (python)
    endif ()
    if (BUILDSWIGJAVA)
      configure_file (${CMAKE_CURRENT_SOURCE_DIR}/java/manifest.txt.in
          ${CMAKE_CURRENT_BINARY_DIR}/java/manifest.txt)
      configure_file (${CMAKE_CURRENT_SOURCE_DIR}/java/pom.xml.in
          ${CMAKE_CURRENT_BINARY_DIR}/java/mraa-${VERSION_SHORT}.pom)
      add_subdirectory (java)
    endif ()
    if (BUILDSWIGNODE)
      if (SWIG_VERSION VERSION_GREATER 3.0.4)
        add_subdirectory (javascript)
      else ()
        message (SEND_ERROR "SWIG is ${SWIG_VERSION}. Please upgrade to 3.0.5+ to build nodejs addon")
      endif ()
    endif ()
  endif ()
endif ()

add_library (mraa ${mraa_LIB_SRCS})
target_link_libraries (mraa ${mraa_LIBS})
set_target_properties(
   mraa
   PROPERTIES
   SOVERSION ${mraa_VERSION_MAJOR}
   VERSION ${mraa_VERSION_STRING}
)
if (MSYS)
  # Under MSYS we have to put our generated DLL into bin, otherwise it's not picked up
  install(TARGETS mraa DESTINATION ${CMAKE_INSTALL_BINDIR})
else ()
  install(TARGETS mraa DESTINATION ${LIB_INSTALL_DIR})
endif ()
