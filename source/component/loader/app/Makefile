#===============================================================================
# export variable
#===============================================================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR ?= $(shell cd $(CURDIR)/../../../.. && /bin/pwd)

include $(SDK_DIR)/base.mak
endif

#===============================================================================
# local variables
#===============================================================================
LOADER_INC := -I$(MSP_DIR)/api/higo/include
LOADER_INC += -I$(CURDIR)/include
LOADER_INC += -I$(CURDIR)/common
LOADER_INC += -I$(CURDIR)/ui
LOADER_INC += -I$(COMPONENT_DIR)/loader/api/include
LOADER_INC += -I$(COMPONENT_DIR)/loader/api/src

LOADER_DEF += $(CFG_HI_KMOD_CFLAGS) $(CFG_HI_BOARD_CONFIGS)

LOADER_SRC += main.c download.c protocol.c burn.c burn_raw.c burn_ext4sp.c 
LOADER_SRC += common/com_parse.c common/com_debug.c common/com_osal.c common/com_buffer.c
LOADER_SRC += ui/ui_config.c ui/ui_keyled.c ui/ui_gfx.c ui/ui_display.c ui/ui_window.c ui/ui_win_msgbox.c  ui/ui_win_main.c

ifeq ($(CFG_HI_ADVCA_SUPPORT),y)
ifeq ($(CFG_HI_ADVCA_TYPE), VERIMATRIX)
LOADER_INC += -I$(CURDIR)/ca/vmx_advance/include
LOADER_LIB += -l:libhi_vmx_loader_verify.a
ifeq ($(CFG_HI_ADVCA_VMX_3RD_SIGN),y)
LOADER_LIB += -L$(COMPONENT_DIR)/loader/api/src/harden/vmx_advance/3rd_loader_verify_lib
else
LOADER_LIB += -L$(COMPONENT_DIR)/loader/api/src/harden/vmx_advance/vmx_loader_verify_lib
endif
endif

ifeq ($(CFG_HI_ADVCA_TYPE), VERIMATRIX_ULTRA)
LOADER_INC += -I$(CURDIR)/ca/vmx_ultra/include
endif

ifeq ($(CFG_HI_ADVCA_TYPE), DCAS)
LOADER_INC += -I$(CURDIR)/ca/dcas/include
endif

ifeq ($(CFG_HI_ADVCA_TYPE), CONAX)
LOADER_INC += -I$(CURDIR)/ca/conax/include
endif

ifeq ($(CFG_HI_ADVCA_TYPE), NAGRA)
LOADER_INC += -I$(CURDIR)/ca/nagra/include
endif

LOADER_INC += -I$(CURDIR)/ca/include
LOADER_SRC += ssd_parse.c
LOADER_LIB += -l:libhi_ca_ssd.a
endif

ifeq ($(CFG_HI_LOADER_APPLOADER),y)
LOADER_DEF += -DHI_BUILD_WITH_IR
LOADER_SRC += ui/ui_hdmi.c 
else
ifeq ($(CFG_HI_BUILD_WITH_IR), y)
LOADER_DEF += -DHI_BUILD_WITH_IR
endif
LOADER_SRC += ui/ui_text.c
endif

ifeq ($(CFG_HI_APPLOADER_OSD_LANG_CN),y)
LOADER_DEF += -DHI_APPLOADER_OSD_LANG_CN
endif

ifeq ($(CFG_HI_APPLOADER_ANTI_ROLLBACK),y)
LOADER_DEF += -DHI_LOADER_ANTI_ROLLBACK
endif

ifneq ($(CFG_HI_APPLOADER_TUNER_INDEX), )
LOADER_DEF += -DHI_LOADER_TUNER_INDEX=$(CFG_HI_APPLOADER_TUNER_INDEX)
endif

ifneq ($(CFG_HI_BOOTLOADER_TUNER_INDEX), )
LOADER_DEF += -DHI_LOADER_TUNER_INDEX=$(CFG_HI_BOOTLOADER_TUNER_INDEX)
endif

ifeq ($(CFG_HI_KEYLED_SUPPORT),y)
	LOADER_DEF += -DHI_BUILD_WITH_KEYLED
	ifeq ($(CFG_HI_KEYLED_PT6964_SELECT),y)
	LOADER_DEF += -DHI_KEYLED_PT6964
	endif
	ifeq ($(CFG_HI_KEYLED_PT6961_SELECT),y)
	LOADER_DEF += -DHI_KEYLED_PT6961
	endif
	ifeq ($(CFG_HI_KEYLED_CT1642_SELECT),y)
	LOADER_DEF += -DHI_KEYLED_CT1642
	endif
	ifeq ($(CFG_HI_KEYLED_74HC164_SELECT),y)
	LOADER_DEF += -DHI_KEYLED_74HC164
	endif
	ifeq ($(CFG_HI_KEYLED_FD650_SELECT),y)
	LOADER_DEF += -DHI_KEYLED_FD650
	endif
	ifeq ($(CFG_HI_KEYLED_GPIOKEY_SELECT),y)
	LOADER_DEF += -DHI_KEYLED_GPIOKEY
	endif
endif

#===============================================================================
# Download mode Config
#===============================================================================
ifneq ($(CFG_HI_APPLOADER_MODE_IP)_$(CFG_HI_BOOTLOADER_MODE_IP),_)
LOADER_DEF += -DHI_LOADER_MODE_IP
LOADER_INC += -I$(HI_INCLUDE_DIR)/curl
LOADER_LIB += -l:libcurl.a
LOADER_SRC += download_ip.c
endif

ifneq ($(CFG_HI_APPLOADER_MODE_OTA)_$(CFG_HI_BOOTLOADER_MODE_OTA),_)
LOADER_DEF += -DHI_LOADER_MODE_OTA
LOADER_SRC += download_ota.c

ifneq ($(CFG_HI_APPLOADER_TUNER_CAB)_$(CFG_HI_BOOTLOADER_TUNER_CAB),_)
LOADER_DEF += -DHI_LOADER_TUNER_CAB
LOADER_SRC += ui/ui_win_setting.c 
endif

ifneq ($(CFG_HI_APPLOADER_TUNER_DVB_T)_$(CFG_HI_BOOTLOADER_TUNER_DVB_T),_)
LOADER_DEF += -DHI_LOADER_TUNER_DVB_T
endif

ifneq ($(CFG_HI_APPLOADER_TUNER_DVB_T2)_$(CFG_HI_BOOTLOADER_TUNER_DVB_T2),_)
LOADER_DEF += -DHI_LOADER_TUNER_DVB_T2
endif

ifneq ($(CFG_HI_APPLOADER_TUNER_SAT)_$(CFG_HI_BOOTLOADER_TUNER_SAT),_)
LOADER_DEF += -DHI_LOADER_TUNER_SAT
ifeq ($(CFG_HI_DISEQC_SUPPORT),y)
LOADER_DEF += -DDISEQC_SUPPORT
endif
endif

ifneq ($(CFG_HI_APPLOADER_TUNER_TER)_$(CFG_HI_BOOTLOADER_TUNER_TER),_)
LOADER_DEF += -DHI_LOADER_TUNER_TER
endif
endif

ifneq ($(CFG_HI_APPLOADER_MODE_USB)_$(CFG_HI_BOOTLOADER_MODE_USB),_)
LOADER_DEF += -DHI_LOADER_MODE_USB
LOADER_SRC += download_fs.c
endif

ifneq ($(CFG_HI_APPLOADER_MODE_FS)_$(CFG_HI_BOOTLOADER_MODE_FS),_)
LOADER_DEF += -DHI_LOADER_MODE_FS
LOADER_SRC += download_fs.c
endif

#===============================================================================
# Protocol Type Config
#===============================================================================

ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3716mv310 hi3716mv320 hi3716mv330 hi3110ev500),)
LOADER_DEF += -DHI_LOADER_PROTOCOL_VER1
else ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3716mv410 hi3716mv420 hi3798mv100 hi3796mv100),)
LOADER_DEF += -DHI_LOADER_PROTOCOL_VER2
else
LOADER_DEF += -DHI_LOADER_PROTOCOL_VER3
endif

ifeq ($(CFG_HI_LOADER_PROTOCOL_SSU_OTA),y)
LOADER_DEF += -DHI_LOADER_PROTOCOL_SSU_OTA
LOADER_SRC += ssu_acquisition.c ssu_parse.c
ifeq ($(CFG_HI_ADVCA_SUPPORT),y)
LOADER_SRC += protocol_ssd_ssu.c 
else
LOADER_SRC += protocol_ssu.c
endif
endif

ifeq ($(CFG_HI_LOADER_PROTOCOL_HISI_OTA),y)
LOADER_DEF += -DHI_LOADER_PROTOCOL_HISI_OTA
LOADER_SRC += hiota_acquisition.c hiota_parse.c
ifeq ($(CFG_HI_ADVCA_SUPPORT),y)
LOADER_SRC += protocol_ssd_hiota.c
else
LOADER_SRC += protocol_hiota.c 
endif
endif

ifeq ($(CFG_HI_LOADER_PROTOCOL_HISI_FILE),y)
LOADER_DEF += -DHI_LOADER_PROTOCOL_HISI_FILE
LOADER_SRC += hifile_acquisition.c hifile_parse.c
ifeq ($(CFG_HI_ADVCA_SUPPORT),y)
LOADER_SRC += protocol_ssd_hifile.c
else
LOADER_SRC += protocol_hifile.c 
endif 
endif

LOADER_OBJS := $(patsubst %.c,%.o,$(LOADER_SRC))

####################################################################################

ifeq ($(CFG_HI_LOADER_APPLOADER),y)
include AppLoader.mak
else
include BootLoader.mak
endif
