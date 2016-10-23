find_package (Nodejs REQUIRED)

include_directories (
  ${NODEJS_INCLUDE_DIRS}
  ${CMAKE_CURRENT_SOURCE_DIR}/..
)

# SWIG treats SWIG_FLAGS as a list and not a string so semicolon seperation is
# required. This hardcodes V8_VERSION to be <10 but I assume that's not going
# to be a problem for a little while! SWIG uses a padded SWIG_V8 version which
# we hack together from our findnode module.
set (V8_VERSION_HEX 0x0${V8_VERSION_MAJOR}${V8_VERSION_MINOR}${V8_VERSION_PATCH})
string (LENGTH "${V8_VERSION_HEX}" V8_VERSION_HEX_length)
while (V8_VERSION_HEX_length LESS 8)
  set (V8_VERSION_HEX "${V8_VERSION_HEX}0")
  message (STATUS "INFO - Padded V8 version to match SWIG format")
  string (LENGTH "${V8_VERSION_HEX}" V8_VERSION_HEX_length)
endwhile ()

set_property (SOURCE mraajs.i PROPERTY SWIG_FLAGS "-node"
              "-I${CMAKE_BINARY_DIR}/src" "-DV8_VERSION=${V8_VERSION_HEX}")
set_source_files_properties (mraajs.i PROPERTIES CPLUSPLUS ON)

swig_add_module (mraajs javascript mraajs.i)
swig_link_libraries (mraajs mraa)

set_target_properties (mraajs PROPERTIES
  COMPILE_FLAGS " -DBUILDING_NODE_EXTENSION -DSWIGJAVASCRIPT=${SWIG_FOUND}"
  PREFIX ""
  OUTPUT_NAME mraa
  SUFFIX ".node"
)

message (STATUS "INFO - swig Version ${SWIG_VERSION}")
message (STATUS "INFO - CXX compiler Version ${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION}")

if (${V8_VERSION_MAJOR} GREATER 3)
  message (STATUS "INFO - Using V8 version > 3 so requiring C++11 compiler")
  # Node 0.12.x V8 engine major version is '3'.
  # Node 2.1.0  V8 engine major version is '4'.
  set_property (TARGET mraajs PROPERTY CXX_STANDARD 11)
  set_property (TARGET mraajs PROPERTY CXX_STANDARD_REQUIRED ON)
  if (CMAKE_VERSION VERSION_LESS "3.1")
    message (WARNING "Need to use CMAKE version 3.1+, but it is ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION}, using a workaround.")
    if (CMAKE_COMPILER_IS_GNUCXX)
      if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "4.7")
        message (FATAL_ERROR "GNU gcc compiler is also too old (need 4.7+, but ${CMAKE_CXX_COMPILER_VERSION}) and does not support C++11 standard.")
      endif ()
      set (MRAA_CXX11_WORKAROUND_OPTION "-std=gnu++11")
    else ()
      set (MRAA_CXX11_WORKAROUND_OPTION "-std=c++11")
    endif ()
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${MRAA_CXX11_WORKAROUND_OPTION} ")
  endif ()
endif ()

# If a CMAKE_INSTALL_PREFIX has NOT been provided, set NODE_MODULE_INSTALL_PATH
# base on the NODE_ROOT_DIR.
if (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  set (NODE_MODULE_INSTALL_PATH ${NODE_ROOT_DIR}/lib/node_modules/mraa/)
# If a CMAKE_INSTALL_PREFIX has been provided, set NODE_MODULE_INSTALL_PATH
# relative to the provide install directory.
else (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  set (NODE_MODULE_INSTALL_PATH ${CMAKE_INSTALL_PREFIX}/lib/node_modules/mraa/)
endif (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
message (STATUS "INFO - install NODE modules to ${NODE_MODULE_INSTALL_PATH}")

macro (mraa_CREATE_INSTALL_PACKAGE_JSON generated_file install_location)
  configure_file (${generated_file}.cmake ${CMAKE_CURRENT_BINARY_DIR}/${generated_file} @ONLY)
  install (FILES ${CMAKE_CURRENT_BINARY_DIR}/${generated_file} DESTINATION ${install_location})
endmacro (mraa_CREATE_INSTALL_PACKAGE_JSON)
mraa_create_install_package_json (package.json ${NODE_MODULE_INSTALL_PATH})

macro (mraa_CREATE_BINDING_GYP generated_file)
  set (mraa_LIB_SRCS_GYP "")
  set (mraa_NPM_SRCS ${mraa_LIB_SRCS_NOAUTO}
                     ${mraa_LIB_ARM_SRCS_NOAUTO}
                     ${mraa_LIB_X86_SRCS_NOAUTO}
  )
  foreach (srcfile ${mraa_NPM_SRCS})
    file (RELATIVE_PATH rel ${CMAKE_SOURCE_DIR} ${srcfile})
    set (mraa_LIB_SRCS_GYP "'${rel}',\n${mraa_LIB_SRCS_GYP}")
  endforeach (srcfile)
  foreach (includedir ${mraa_LIB_INCLUDE_DIRS})
    file (RELATIVE_PATH rel ${CMAKE_SOURCE_DIR} ${includedir})
    set (mraa_LIB_INCLUDE_DIRS_GYP "'${rel}',\n${mraa_LIB_INCLUDE_DIRS_GYP}")
  endforeach (includedir)
  configure_file (${generated_file}.cmake ${CMAKE_CURRENT_BINARY_DIR}/${generated_file} @ONLY)
endmacro (mraa_CREATE_BINDING_GYP)
mraa_create_binding_gyp (binding.gyp)

add_custom_target (npmpkg)
add_custom_command (TARGET npmpkg POST_BUILD COMMAND ${CMAKE_COMMAND} -E copy
        ${CMAKE_CURRENT_BINARY_DIR}/mraajsJAVASCRIPT_wrap.cxx ${CMAKE_SOURCE_DIR}/src
        COMMAND ${CMAKE_COMMAND} -E copy
        ${CMAKE_BINARY_DIR}/src/version.c ${CMAKE_SOURCE_DIR}/src
        COMMAND ${CMAKE_COMMAND} -E copy
        ${CMAKE_CURRENT_BINARY_DIR}/package.json ${CMAKE_SOURCE_DIR}
        COMMAND sed -i "'s/mraa.node/build\\/Release\\/mraa.node/'"
        ${CMAKE_SOURCE_DIR}/package.json
        COMMAND ${CMAKE_COMMAND} -E copy
        ${CMAKE_CURRENT_BINARY_DIR}/binding.gyp ${CMAKE_SOURCE_DIR}
        COMMAND ${CMAKE_COMMAND} -E copy
        ${CMAKE_SOURCE_DIR}/docs/npm.md ${CMAKE_SOURCE_DIR}/READMEFIRST)
add_dependencies (npmpkg mraajs)

if (BUILDDOC)
  find_package(Yuidoc)
  if (YUIDOC_FOUND)
    add_custom_target(jsdoc ALL
      COMMAND ${CMAKE_SOURCE_DIR}/doxygen2jsdoc/docgen.js -m mraa i xml/ -o jsdoc -c ${CMAKE_CURRENT_SOURCE_DIR}/doxygen2jsdoc_custom.json --strict -h
      COMMAND ${YUIDOC_EXECUTABLE} -C --no-sort --helpers ${CMAKE_SOURCE_DIR}/doxygen2jsdoc/generators/yuidoc/tmpl/mraa/helper.js --themedir ${CMAKE_SOURCE_DIR}/doxygen2jsdoc/generators/yuidoc/tmpl/mraa -o html/node jsdoc/yuidoc/mraa
      COMMAND ${CMAKE_SOURCE_DIR}/doxygen2jsdoc/tolower.js -i html/node
      WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
      DEPENDS doc
      COMMENT "Generating API documentation with Yuidoc" VERBATIM
  )
  else ()
    message (STATUS "INFO - Failed to find Yuidoc. node.js API doc will not be generated")
  endif ()
endif ()

install (FILES ${CMAKE_CURRENT_BINARY_DIR}/mraa.node
         DESTINATION ${NODE_MODULE_INSTALL_PATH})
