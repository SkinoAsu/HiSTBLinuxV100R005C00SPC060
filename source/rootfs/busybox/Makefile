#===============================================================================
# export variables
#===============================================================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR := $(shell cd $(CURDIR)/../../.. && /bin/pwd)
include $(SDK_DIR)/base.mak
endif

################################################################################
ifneq ($(HI_OUT_DIR),)
BUSYBOX_DIR := $(HI_OUT_DIR)/obj/source/rootfs/busybox
else
BUSYBOX_DIR := $(CURDIR)
endif

SANDBOX_DIR := $(BUSYBOX_DIR)/sandbox

PREFIX ?= $(HI_ROOTFS_DIR)

BUSYBOX := busybox-1_26_2

MKFLAGS += CONFIG_CROSS_COMPILER_PREFIX=$(CFG_HI_ARM_TOOLCHAINS_NAME)-

################################################################################

CONFIG_BUSYBOX_NAME := $(CFG_HI_BUSYBOX_CFG_NAME)

MKFLAGS += CONFIG_BUSYBOX_NAME=$(CONFIG_BUSYBOX_NAME)

CONFIG_SANDBOX_FILE := $(CFG_HI_BUSYBOX_CFG_SANDBOX_NAME)

#set default sandbox config file
ifeq ($(CFG_HI_LOADER_APPLOADER),y)
CONFIG_SANDBOX_FILE ?= glibc_ca_sandbox.config
else
CONFIG_SANDBOX_FILE ?= glibc_sandbox_lxc_default.config
endif

CONFIG_SANDBOX_ROOTFS_PATH = $(PREFIX)/home/stb

TARGETS := $(PREFIX)/bin/busybox

ifeq ($(CFG_HI_ADVCA_SANDBOX_SUPPORT),y)
TARGETS += $(CONFIG_SANDBOX_ROOTFS_PATH)/bin/busybox
endif

################################################################################
.PHONY: all clean
################################################################################
all: $(TARGETS)

clean:
	$(AT)rm -rf $(BUSYBOX_DIR)/$(BUSYBOX) $(SANDBOX_DIR)/$(BUSYBOX)

#+++++++++++compile root directory busybox (located in /bin)+++++++++++++
$(PREFIX)/bin/busybox: $(BUSYBOX_DIR)/$(BUSYBOX)/tar
	$(AT)cd $(BUSYBOX_DIR)/$(BUSYBOX) \
        && make -j16 $(MKFLAGS) CONFIG_PREFIX=$(PREFIX) \
        && make -j16 $(MKFLAGS) CONFIG_PREFIX=$(PREFIX) install

#+++++++++++compile sandbox user busybox (located in /home/stb/bin)+++++++++++++
$(PREFIX)/home/stb/bin/busybox: $(SANDBOX_DIR)/$(BUSYBOX)/tar
	$(AT)cd $(SANDBOX_DIR)/$(BUSYBOX) \
        && make -j16 $(MKFLAGS) CONFIG_PREFIX=$(CONFIG_SANDBOX_ROOTFS_PATH) \
        && make -j16 $(MKFLAGS) CONFIG_PREFIX=$(CONFIG_SANDBOX_ROOTFS_PATH) install

$(BUSYBOX_DIR)/$(BUSYBOX)/tar:
	$(AT)test -d $(BUSYBOX_DIR) || mkdir -p $(BUSYBOX_DIR)
	$(AT)test -d $(BUSYBOX_DIR)/$(BUSYBOX) || tar -xjf $(OPEN_SOURCE_DIR)/$(BUSYBOX).tar.bz2 -C $(BUSYBOX_DIR)
	$(AT)cp -f $(BUSYBOX).config/$(CONFIG_BUSYBOX_NAME) $(BUSYBOX_DIR)/$(BUSYBOX)/.config
	$(AT)touch $@

$(SANDBOX_DIR)/$(BUSYBOX)/tar:
	$(AT)test -d $(SANDBOX_DIR) || mkdir -p $(SANDBOX_DIR)
	$(AT)test -d $(SANDBOX_DIR)/$(BUSYBOX) || tar -xjf $(OPEN_SOURCE_DIR)/$(BUSYBOX).tar.bz2 -C $(SANDBOX_DIR)
	$(AT)cp -f $(BUSYBOX).config/$(CONFIG_SANDBOX_FILE) $(SANDBOX_DIR)/$(BUSYBOX)/.config
	$(AT)touch $@
