#===============================================================================
# export variables
#===============================================================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR := $(CURDIR)/../../..
include $(SDK_DIR)/base.mak
endif

export MKFLAGS

CC  := $(CROSS_COMPILE)gcc
AR  := $(CROSS_COMPILE)ar

gccincdir := $(shell $(CC) -print-file-name=include)

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#   variable
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
objects := driver

ifneq ($(CFG_HI_BOOT_FBL),y)
objects += adp
endif

ifeq ($(CFG_HI_ADVCA_SUPPORT), y)

objects += ssa
objects += loader

else
ifeq ($(CFG_HI_LOADER_SUPPORT),y)
objects += loader
endif
endif

ifeq ($(CFG_PRODUCT_TYPE),android)
objects += android
endif

objects_clean       := $(addsuffix _clean,$(objects))
objects_install     := $(addsuffix _install,$(objects))
objects_uninstall   := $(addsuffix _uninstall,$(objects))

ifneq ($(O),)
PRODUCT_DIR := $(O)/product
else
PRODUCT_DIR := $(SDK_DIR)/source/boot/product
endif

ifeq ($(CFG_HI_MINIBOOT_SUPPORT),y)
CFLAGS  :=  -Os -fno-strict-aliasing -fno-common -ffixed-r8 \
            -nostdinc -isystem $(MKFLAGS) \
            -fno-builtin -ffreestanding  -pipe -marm  -mabi=aapcs-linux  \
            -mfloat-abi=soft	\
            -mno-thumb-interwork \
            -Wall -Wstrict-prototypes
ifeq ($(CFG_HI_ADVCA_SUPPORT),y)
     ifneq ($(CFG_HI_ADVCA_TYPE),VERIMATRIX)
           CFLAGS += -fstack-protector-all
     endif
     CFLAGS += -Werror -Wformat-security -D_FORTIFY_SOURCE=2
     CFLAGS += -fno-delete-null-pointer-checks -s
     CFLAGS += -Wformat -Wformat-y2k
else
     CFLAGS += -g -fno-stack-protector
endif

CFLAGS  +=  -DHI_MINIBOOT_SUPPORT=1

CFLAGS  +=  -I$(BOOT_DIR)/miniboot/include \
            -I$(BOOT_DIR)/miniboot/arm/$(BOOTCONFIG)/include \
            -I$(BOOT_DIR)/miniboot/arm/include
else
CFLAGS  :=  -g -Os -D__KERNEL__ -fno-strict-aliasing -fno-common -ffixed-r8 \
            -nostdinc -isystem $(gccincdir) $(MKFLAGS) \
            -fno-builtin -ffreestanding  -pipe -marm  -mabi=aapcs-linux  \
            -mfloat-abi=soft  \
            -mno-thumb-interwork \
            -Wall -Wstrict-prototypes -fno-stack-protector

CFLAGS  +=  -I$(BOOT_DIR)/fastboot/include
endif

CFLAGS  += $(filter-out -fstack-protector --param ssp-buffer-size=4 ,$(CFG_HI_CFLAGS))

CFLAGS  +=  -I$(PRODUCT_DIR)/driver/include              \
            -I$(PRODUCT_DIR)/driver/include_inc          \
            -I$(PRODUCT_DIR)/loader/schedule             \
            -I$(PRODUCT_DIR)/logo/include                \
            -I$(PRODUCT_DIR)/driver/graphic/include      \
            -I$(PRODUCT_DIR)/adp/include \
            -I$(PRODUCT_DIR)/pdm/include \
            -I$(COMMON_DIR)/include \
            -I$(COMMON_DIR)/drv/include \
            -I$(BOOT_DIR)/miniboot/app \
			-I$(PRODUCT_DIR)/ssa/include

CFLAGS  +=  -DCONFIG_ARM -D__ARM__

ifeq ($(CFG_HI_LOAD_CAS_IMAGE),y)
CFLAGS += -DHI_LOAD_CAS_IMAGE
endif

export CFLAGS

ifeq ($(CFG_HI_TWOSTAGEBOOT_SUPPORT),y)
ifeq ($(CFG_HI_BOOT_FBL),y)
CFLAGS += -DHI_BOOT_FBL
endif
ifeq ($(CFG_HI_BOOT_SBL),y)
CFLAGS += -DHI_BOOT_SBL
endif
endif

#--------------TWOSTAGEBOOT_SUPPORT_BEGIN-----------------------------
ifeq ($(findstring $(CFLAGS), -DHI_BOOT_FBL),)

ifeq ($(CFG_HI_LOADER_SUPPORT),y)
CFLAGS += -DHI_LOADER_SUPPORT

ifeq ($(CFG_HI_APPLOADER_SUPPORT),y)
CFLAGS += -DHI_APPLOADER_SUPPORT
else ifeq ($(CFG_HI_BOOTLOADER_SUPPORT),y)
CFLAGS += -DHI_BOOTLOADER_SUPPORT
endif

endif

ifeq ($(CFG_HI_MCE_SUPPORT),y)
CFLAGS += -DHI_MCE_SUPPORT
endif

ifeq ($(CFG_HI_BUILD_WITH_HDMI_EDID),y)
CFLAGS += -DHI_HDMI_EDID_SUPPORT
endif

ifeq ($(CFG_HI_BUILD_WITH_HDMI_CEC),y)
CFLAGS += -DHI_HDMI_CEC_SUPPORT
endif

ifeq ($(CFG_HI_ADVCA_NOCS3_RPC_SERVER),y)
CFLAGS += -DHI_ADVCA_NOCS3_RPC_SERVER
endif

ifeq ($(CFG_HI_BUILD_WITH_KEYLED),y)
CFLAGS += -DHI_BUILD_WITH_KEYLED
    ifeq ($(CFG_HI_KEYLED_PT6964_SELECT),y)
    CFLAGS += -DHI_BOOT_KEYLED_PT6964
    endif
    ifeq ($(CFG_HI_KEYLED_PT6961_SELECT),y)
    CFLAGS += -DHI_BOOT_KEYLED_PT6961
    endif
    ifeq ($(CFG_HI_KEYLED_CT1642_SELECT),y)
    CFLAGS += -DHI_BOOT_KEYLED_CT1642
    endif
    ifeq ($(CFG_HI_KEYLED_74HC164_SELECT),y)
    CFLAGS += -DHI_BOOT_KEYLED_74HC164
    endif
    ifeq ($(CFG_HI_KEYLED_FD650_SELECT),y)
    CFLAGS += -DHI_BOOT_KEYLED_FD650
    endif
    ifeq ($(CFG_HI_KEYLED_GPIOKEY_SELECT),y)
    CFLAGS += -DHI_BOOT_KEYLED_GPIOKEY
    endif
endif

#--------------Related Android Macro Define -------------------------
ifeq ($(CFG_PRODUCT_TYPE),android)
CFLAGS  += -DHI_ANDROID_BOOT_SUPPORT

ifeq ($(CFG_HI_BUILD_WITH_IR), y)
CFLAGS  += -DHI_BOOT_IR_SUPPORT
ifeq ($(CFG_HI_REMOTE_RECOVERY_SUPPORT), y)
CFLAGS  += -DHI_REMOTE_RECOVERY_SUPPORT
endif
endif

ifeq ($(CFG_HI_GPIO_RECOVERY_SUPPORT), y)
CFLAGS  += -DHI_GPIO_RECOVERY_SUPPORT
endif

ifeq ($(CFG_HI_IDWORD_LOCK_SUPPORT), y)
CFLAGS  += -DHI_IDWORD_LOCK_SUPPORT
endif

ifeq ($(CFG_HI_TEE_SUPPORT),y)
CFLAGS  += -DHI_BOOT_CHECK_TRUSTEDCORE
endif

ifeq ($(CFG_HI_ADVCA_SUPPORT), y)
ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv100 hi3796mv100 hi3716dv100 hi3798cv200 hi3798mv200 hi3798mv300 hi3798mv310),)
CFLAGS += -DHI_ADVCA_USB_BURN_KEY
endif
endif

endif
#-----------------------------------------------------------------

ifeq ($(CFG_HI_PM_POWERUP_MODE1_SUPPORT), y)
CFLAGS += -DHI_PM_POWERUP_MODE1_SUPPORT
endif

ifeq ($(CFG_HI_AVS_SUPPORT), y)
CFLAGS += -DHI_AVS_SUPPORT
endif

endif
#--------------TWOSTAGEBOOT_SUPPORT_END-----------------------------

LIBS := libproduct.a
SUBLIBS := $(foreach sub,$(objects),$(sub)/lib$(sub).a)
MAINLIB := libmain.a

#put nagra ca in main ca first.
ifeq ($(CFG_HI_ADVCA_TYPE), NAGRA)
MAINOBJ := main_ca.o
else
MAINOBJ := main.o
endif

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#   rules
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#==================================================================
#                          all
#==================================================================
.PHONY: all clean install uninstall $(LIBS)

all: $(LIBS)

clean: $(objects_clean)
	$(AT)rm -rf $(LIBS)
	$(AT)rm -rf $(MAINLIB)
	$(AT)rm -rf $(MAINOBJ)
	$(AT)rm -rf ar.mak

install: $(objects_install)

uninstall: $(objects_uninstall)

$(MAINLIB): $(MAINOBJ)
	$(AT)$(AR) -rc $@ $^

$(LIBS): $(objects) $(MAINLIB)
	$(AT)rm -rf $@
	$(AT)rm -rf ar.mak
	$(AT)echo "CREATE $@" >> ar.mak
	$(AT)$(foreach sublib,$(SUBLIBS),echo "ADDLIB $(sublib)" >> ar.mak;)
	$(AT)echo "ADDLIB $(MAINLIB)" >> ar.mak
	$(AT)echo "SAVE" >> ar.mak
	$(AT)echo "END" >> ar.mak
	$(AT)$(AR) -M < ar.mak

#==================================================================
#                          modules
#==================================================================
.PHONY: $(objects) $(objects_clean) $(objects_install) $(objects_uninstall)

$(objects):
	make -C $@ all

$(objects_clean):
	make -C $(patsubst %_clean,%,$@) clean

$(objects_install):
	make -C $(patsubst %_clean,%,$@) install

$(objects_uninstall):
	make -C $(patsubst %_clean,%,$@) uninstall

