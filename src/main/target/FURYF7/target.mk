F7X5XG_TARGETS += $(TARGET)
FEATURES       += SDCARD VCP ONBOARDFLASH

TARGET_SRC = \
            drivers/accgyro/accgyro_spi_icm20689.c \
            drivers/light_ws2811strip.c \
            drivers/light_ws2811strip_hal.c