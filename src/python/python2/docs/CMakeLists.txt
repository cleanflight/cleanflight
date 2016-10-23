if (DOXYGEN_FOUND)
  find_package (Sphinx)
  if (SPHINX_FOUND)
    if (NOT DEFINED SPHINX_THEME)
      set (SPHINX_THEME default)
    endif ()

    if (NOT DEFINED SPHINX_THEME_DIR)
      set (SPHINX_THEME_DIR)
    endif ()

    # configured documentation tools and intermediate build results
    set (BINARY_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}")

    # Sphinx cache with pickled ReST documents
    set (SPHINX_CACHE_DIR "${CMAKE_CURRENT_BINARY_DIR}/doctrees")

    # HTML output directory
    set (SPHINX_HTML_DIR "${CMAKE_CURRENT_BINARY_DIR}/html")

    # doc .rst locations
    set (SPHINX_DOC_LOATION "${CMAKE_CURRENT_SOURCE_DIR}")

    configure_file(
      "${CMAKE_CURRENT_SOURCE_DIR}/conf.py.in"
      "${BINARY_BUILD_DIR}/conf.py"
      @ONLY
    )

    add_custom_target(sphinx ALL
      ${SPHINX_EXECUTABLE} -b html
      -c "${BINARY_BUILD_DIR}"
      -d "${SPHINX_CACHE_DIR}"
      "${SPHINX_DOC_LOATION}"
      "${SPHINX_HTML_DIR}"
      COMMENT "Building HTML documentation with Sphinx"
    )

    add_dependencies (sphinx ${SWIG_MODULE_python2-mraa_REAL_NAME})
  endif ()
endif ()
