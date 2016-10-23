if (FIRMATA)
  message (STATUS "INFO - Adding firmata backend support")
  set (mraa_LIB_SRCS_NOAUTO ${mraa_LIB_SRCS_NOAUTO}
    ${PROJECT_SOURCE_DIR}/src/firmata/firmata.c
    ${PROJECT_SOURCE_DIR}/src/firmata/firmata_mraa.c
    PARENT_SCOPE
  )
endif ()
