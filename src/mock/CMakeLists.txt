message (INFO " - Adding mock platform")
set (mraa_LIB_PLAT_SRCS_NOAUTO ${mraa_LIB_SRCS_NOAUTO}
     ${mraa_LIB_MOCK_SRCS_NOAUTO} PARENT_SCOPE)
