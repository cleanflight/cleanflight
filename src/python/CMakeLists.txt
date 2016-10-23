set_source_files_properties (mraapython.i PROPERTIES CPLUSPLUS ON)
set_source_files_properties (mraapython.i PROPERTIES SWIG_FLAGS "-I${CMAKE_BINARY_DIR}/src")

add_subdirectory (python2)
add_subdirectory (python3)
