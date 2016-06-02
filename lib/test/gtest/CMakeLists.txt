project(gtest CXX C)

# This is a simplified version of a gtest cmake file, which uses
# the same flags as the cleanflight makefile
# If updating gtest, we should probably use the original one
# https://github.com/google/googletest/blob/master/googletest/CMakeLists.txt

# Where Google Test's .h files can be found.
include_directories(
  ${gtest_SOURCE_DIR}/inc)

# Where Google Test's libraries can be found.
link_directories(${gtest_BINARY_DIR}/src)

########################################################################
#
# Defines the gtest & gtest_main libraries.  User tests should link
# with one of them.

# Google Test libraries. 
add_library(gtest       src/gtest-all.cc)
set_target_properties(gtest PROPERTIES COMPILE_FLAGS "-Wno-missing-field-initializers -Wno-unused-const-variable")

add_library(gtest_main  src/gtest_main.cc)
target_link_libraries(gtest_main gtest)
