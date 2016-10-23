if (ONEWIRE)
  message (STATUS "INFO - Adding onewire backend support")
  set (mraa_LIB_SRCS_NOAUTO ${mraa_LIB_SRCS_NOAUTO}
    ${PROJECT_SOURCE_DIR}/src/uart_ow/uart_ow.c
    PARENT_SCOPE
  )
endif ()
