OFFICIAL_TARGETS  = ALIENFLIGHTF3 ALIENFLIGHTF4 ANYFCF7 BETAFLIGHTF3 BLUEJAYF4 CC3D FURYF4 NAZE REVO SIRINFPV SPARKY SPRACINGF3 SPRACINGF3EVO SPRACINGF3NEO SPRACINGF3MINI SPRACINGF4EVO STM32F3DISCOVERY
SKIP_TARGETS     := ALIENWHOOP
ALT_TARGETS       = $(sort $(filter-out target, $(basename $(notdir $(wildcard $(ROOT)/src/main/target/*/*.mk)))))
OPBL_TARGETS      = $(filter %_OPBL, $(ALT_TARGETS))
OSD_SLAVE_TARGETS = SPRACINGF3OSD

VALID_TARGETS   = $(dir $(wildcard $(ROOT)/src/main/target/*/target.mk))
VALID_TARGETS  := $(subst /,, $(subst ./src/main/target/,, $(VALID_TARGETS)))
VALID_TARGETS  := $(VALID_TARGETS) $(ALT_TARGETS)
VALID_TARGETS  := $(sort $(VALID_TARGETS))
VALID_TARGETS  := $(filter-out $(SKIP_TARGETS), $(VALID_TARGETS))

ifeq ($(filter $(TARGET),$(SKIP_TARGETS)), $(TARGET))
ALTERNATES    := $(sort $(filter-out target, $(basename $(notdir $(wildcard $(ROOT)/src/main/target/$(TARGET)/*.mk)))))
$(error The target specified, $(TARGET), cannot be built. Use one of the ALT targets: $(ALTERNATES))
endif

GROUP_1_TARGETS := \
	AFROMINI \
	AIORACERF3 \
	AIR32 \
	AIRBOTF4 \
	AIRBOTF4SD \
	AIRHEROF3 \
	ALIENFLIGHTF1 \
	ALIENFLIGHTF3 \
	ALIENFLIGHTF4 \
	ALIENFLIGHTNGF7 \
	ALIENWHOOPF4 \
	ALIENWHOOPF7 \
	ANYFCF7 \
	BEEBRAIN \
	BEEROTORF4 \
	BETAFLIGHTF3 \
	BLUEJAYF4 \
	CC3D \
	CC3D_OPBL

GROUP_2_TARGETS := \
	CHEBUZZF3 \
	CJMCU \
	CLRACINGF4 \
	COLIBRI \
	COLIBRI_OPBL \
	COLIBRI_RACE \
	DOGE \
	ELLE0 \
	F4BY \
	FISHDRONEF4 \
	FLIP32F3OSD \
	FF_ACROWHOOPSP \
	FF_FORTINIF4 \
	FF_KOMBINI \
	FF_PIKOBLX \
	FF_PIKOF4 \
	FF_RADIANCE \
	FRSKYF3 \
	FRSKYF4 \
	FURYF3 \
	FURYF4 \
	FURYF7 \
	IMPULSERCF3 \
	IRCFUSIONF3 \
	ISHAPEDF3

GROUP_3_TARGETS := \
	KAKUTEF4 \
	KISSCC \
	KIWIF4 \
	LUX_RACE \
	LUXV2_RACE \
	MICROSCISKY \
	MLTEMPF4 \
	MLTYPHF4 \
	MOTOLAB \
	MULTIFLITEPICO \
	NAZE \
	NERO \
	NUCLEOF7 \
	OMNIBUS \
	OMNIBUSF4 \
	OMNIBUSF4SD \
	PLUMF4 \
	PODIUMF4 \
	DYSF4PRO

GROUP_4_TARGETS := \
	RCEXPLORERF3 \
	REVO \
	REVO_OPBL \
	REVOLT \
	REVONANO \
	RMDO \
	SINGULARITY \
	SIRINFPV \
	SOULF4 \
	SPARKY \
	SPARKY2 \
	SPRACINGF3 \
	SPRACINGF3EVO \
	SPRACINGF3MINI \
	SPRACINGF3NEO \
	SPRACINGF3OSD \
	SPRACINGF4EVO \
	SPRACINGF4NEO \
	STM32F3DISCOVERY \
	TINYBEEF3

GROUP_OTHER_TARGETS := $(filter-out $(GROUP_1_TARGETS) $(GROUP_2_TARGETS) $(GROUP_3_TARGETS) $(GROUP_4_TARGETS), $(VALID_TARGETS))

ifeq ($(filter $(TARGET),$(ALT_TARGETS)), $(TARGET))
BASE_TARGET    := $(firstword $(subst /,, $(subst ./src/main/target/,, $(dir $(wildcard $(ROOT)/src/main/target/*/$(TARGET).mk)))))
include $(ROOT)/src/main/target/$(BASE_TARGET)/$(TARGET).mk
else
BASE_TARGET    := $(TARGET)
endif

ifeq ($(filter $(TARGET),$(OPBL_TARGETS)), $(TARGET))
OPBL            = yes
endif

ifeq ($(filter $(TARGET),$(OSD_SLAVE_TARGETS)), $(TARGET))
# build an OSD SLAVE
OSD_SLAVE       = yes
else
# build an FC
FC              = yes
endif

# silently ignore if the file is not present. Allows for target specific.
-include $(ROOT)/src/main/target/$(BASE_TARGET)/target.mk

F4_TARGETS      := $(F405_TARGETS) $(F411_TARGETS) $(F446_TARGETS)
F7_TARGETS      := $(F7X2RE_TARGETS) $(F7X5XE_TARGETS) $(F7X5XG_TARGETS) $(F7X5XI_TARGETS) $(F7X6XG_TARGETS)

ifeq ($(filter $(TARGET),$(VALID_TARGETS)),)
$(error Target '$(TARGET)' is not valid, must be one of $(VALID_TARGETS). Have you prepared a valid target.mk?)
endif

ifeq ($(filter $(TARGET),$(F1_TARGETS) $(F3_TARGETS) $(F4_TARGETS) $(F7_TARGETS) $(SITL_TARGETS)),)
$(error Target '$(TARGET)' has not specified a valid STM group, must be one of F1, F3, F405, F411 or F7x5. Have you prepared a valid target.mk?)
endif

ifeq ($(TARGET),$(filter $(TARGET),$(F3_TARGETS)))
TARGET_MCU := STM32F3

else ifeq ($(TARGET),$(filter $(TARGET), $(F4_TARGETS)))
TARGET_MCU := STM32F4

else ifeq ($(TARGET),$(filter $(TARGET), $(F7_TARGETS)))
TARGET_MCU := STM32F7

else ifeq ($(TARGET),$(filter $(TARGET), $(SITL_TARGETS)))
TARGET_MCU := SITL

else ifeq ($(TARGET),$(filter $(TARGET), $(F1_TARGETS)))
TARGET_MCU := STM32F1
else
$(error Unknown target MCU specified.)
endif

ifneq ($(BASE_TARGET), $(TARGET))
TARGET_FLAGS  	:= $(TARGET_FLAGS) -D$(BASE_TARGET)
endif

TARGET_FLAGS  	:= $(TARGET_FLAGS) -D$(TARGET_MCU)
