#===============================================================================
# export variables
#===============================================================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
    ifneq ($(srctree),)
    KERNEL_DIR := $(srctree)

    SDK_DIR := $(shell cd $(KERNEL_DIR)/../../.. && /bin/pwd)
    else
    SDK_DIR := $(shell cd $(CURDIR)/../../../../.. && /bin/pwd)
    endif

    include $(SDK_DIR)/base.mak
endif

#===============================================================================
# local variables
#===============================================================================
VERSION := pq_v4_0
MOD_NAME := hi_pq

HAL_DIR := hal
MNG_DIR := mng

obj-$(HI_DRV_BUILDTYPE) += $(MOD_NAME).o

ifeq ($(CFG_HI_64BIT_SYSTEM),y)
ASM_DST_DIR := mng/64bit
else
ASM_DST_DIR := mng/32bit
endif

ifeq ($(CFG_HI_CHIP_TYPE), hi3798cv200)
CHIP := 3798cv200
#module :=  comm table zme csc dei
module :=  comm table tools zme csc dei fmd gfxcsc gfxzme hdr db dm tnr snr dci acm sharpen artds dering deshoot
endif

ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv200 hi3798mv300),)
CHIP := 3798mv200
module :=  comm table tools zme csc dei fmd gfxcsc gfxzme hdr gfxhdr db dm tnr mcnr snr acc lccolor sharpen artds
endif

ifeq ($(CFG_HI_CHIP_TYPE), hi3798mv310)
CHIP := 3798mv310
module :=  comm table tools zme csc dei fmd gfxcsc gfxzme hdr gfxhdr lchdr db dm tnr mcnr snr acc lccolor sharpen artds
endif

ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3796mv200 hi3716mv450),)
CHIP := 3796mv200
module :=  comm table tools zme csc dei fmd gfxcsc gfxzme hdr gfxhdr db dm tnr mcnr snr vdp4ksnr acc lccolor sharpen artds vpsscsc vpssgamma
endif

EXTRA_CFLAGS += $(CFG_HI_KMOD_CFLAGS)

EXTRA_CFLAGS += -I$(COMMON_UNF_INCLUDE)                 \
                -I$(COMMON_API_INCLUDE)                 \
                -I$(COMMON_DRV_INCLUDE)                 \
                -I$(MSP_UNF_INCLUDE)                    \
                -I$(MSP_API_INCLUDE)                    \
                -I$(MSP_DRV_INCLUDE)                    \
                -I$(MSP_DRV_REG_INCLUDE)                \
                -I$(MSP_DIR)/api/pq/include             \
                -I$(MSP_DIR)/api/higo/include           \
                -I$(MSP_DIR)/drv/pq/$(VERSION)/mng      \
                -I$(MSP_DIR)/drv/pq/$(VERSION)/mng/$(CHIP) \
                -I$(MSP_DIR)/drv/pq/$(VERSION)/hal/$(CHIP) \
                -I$(MSP_DIR)/drv/pq/$(VERSION)/hal/common  \
                -I$(MSP_DIR)/drv/pq/$(VERSION)

ifdef CFG_HI_SMMU_SUPPORT
EXTRA_CFLAGS += -DHI_PQ_SMMU_SUPPORT
endif

ifeq ($(CFG_HI_TEE_SUPPORT),y)
EXTRA_CFLAGS += -DHI_PQ_TEE_SUPPORT
endif

ifeq ($(CFG_HI_PROC_SUPPORT),y)
EXTRA_CFLAGS += -DHI_PQ_PROC_SUPPORT
endif

ifeq ($(PIP),false)
ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv200 hi3798mv300 hi3798mv310),)
EXTRA_CFLAGS += -DHI_PQ_VER_YDJC
endif
endif

#EXTRA_CFLAGS += -DHI_PQ_4K_TNR_SUPPORT

$(MOD_NAME)-y +=    drv_pq.o                        \
                    drv_pq_intf.o                   \
                    drv_pq_comm.o                   \
                    drv_pq_table.o                  \
                    drv_pq_proc.o                   \
                    $(HAL_DIR)/common/pq_hal_comm.o

ifneq ($(findstring table, $(module)),)
$(MOD_NAME)-y +=  $(HAL_DIR)/$(CHIP)/pq_hal_table_default.o
EXTRA_CFLAGS += -DPQ_ALG_TABLE
endif

ifneq ($(findstring  tools, $(module)),)
$(MOD_NAME)-y += drv_pq_tools.o
EXTRA_CFLAGS += -DPQ_ALG_TOOLS
endif

ifneq ($(findstring csc, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_csc.o
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_csc.o
EXTRA_CFLAGS += -DPQ_ALG_CSC
endif

ifneq ($(findstring zme, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_zme.o
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_zme.o
EXTRA_CFLAGS += -DPQ_ALG_ZME
endif

ifneq ($(findstring  dei, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_dei.o
$(MOD_NAME)-y +=    $(MNG_DIR)/$(CHIP)/pq_mng_dei.o
$(MOD_NAME)-y +=    $(ASM_DST_DIR)/$(CHIP)/pq_mng_dei_alg.o
EXTRA_CFLAGS += -DPQ_ALG_DEI
endif

ifneq ($(findstring  fmd, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_fmd.o
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_ifmd.o
$(MOD_NAME)-y +=    $(ASM_DST_DIR)/pq_mng_ifmd_alg.o
EXTRA_CFLAGS += -DPQ_ALG_FMD
endif

ifneq ($(findstring  dci, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_dci.o
$(MOD_NAME)-y +=    $(MNG_DIR)/$(CHIP)/pq_mng_dci.o
EXTRA_CFLAGS += -DPQ_ALG_DCI
endif

ifneq ($(findstring  acm, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_acm.o
$(MOD_NAME)-y +=    $(MNG_DIR)/$(CHIP)/pq_mng_acm.o
EXTRA_CFLAGS += -DPQ_ALG_ACM
endif

ifneq ($(findstring  lccolor, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_lcacm.o
$(MOD_NAME)-y +=    $(MNG_DIR)/$(CHIP)/pq_mng_lcacm.o
EXTRA_CFLAGS += -DPQ_ALG_LCACM
endif

ifneq ($(findstring  acc, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_acc.o
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_acc.o
EXTRA_CFLAGS += -DPQ_ALG_ACC
endif

ifneq ($(findstring  tnr, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_tnr.o
$(MOD_NAME)-y +=    $(MNG_DIR)/$(CHIP)/pq_mng_tnr.o
EXTRA_CFLAGS += -DPQ_ALG_TNR
endif

ifneq ($(findstring  mcnr, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_mcnr.o
$(MOD_NAME)-y +=    $(MNG_DIR)/$(CHIP)/pq_mng_mcnr.o
EXTRA_CFLAGS += -DPQ_ALG_MCNR
endif

ifneq ($(findstring  snr, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_snr.o
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_snr.o
EXTRA_CFLAGS += -DPQ_ALG_SNR
endif

ifneq ($(findstring  vdp4ksnr, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_vdp4ksnr.o
$(MOD_NAME)-y +=    $(MNG_DIR)/$(CHIP)/pq_mng_vdp4ksnr.o
EXTRA_CFLAGS += -DPQ_ALG_VDP4KSNR
endif

ifneq ($(findstring  sharpen, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_sharpen.o
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_sharpen.o
EXTRA_CFLAGS += -DPQ_ALG_SHARPEN
endif

ifneq ($(findstring  db, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_db.o
$(MOD_NAME)-y +=    $(MNG_DIR)/$(CHIP)/pq_mng_db.o
$(MOD_NAME)-y +=    $(ASM_DST_DIR)/$(CHIP)/pq_mng_db_alg.o
EXTRA_CFLAGS += -DPQ_ALG_DB
endif

ifneq ($(findstring  dm, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_dm.o
$(MOD_NAME)-y +=    $(MNG_DIR)/$(CHIP)/pq_mng_dm.o
$(MOD_NAME)-y +=    $(ASM_DST_DIR)/$(CHIP)/pq_mng_dm_alg.o
EXTRA_CFLAGS += -DPQ_ALG_DM
endif

ifneq ($(findstring  dering, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_dering.o
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_dering.o
EXTRA_CFLAGS += -DPQ_ALG_DERING
endif

ifneq ($(findstring  deshoot, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_deshoot.o
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_deshoot.o
EXTRA_CFLAGS += -DPQ_ALG_DESHOOT
endif

ifneq ($(findstring  artds, $(module)),)
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_artds.o
EXTRA_CFLAGS += -DPQ_ALG_ARTDS
endif

ifneq ($(findstring  gfxcsc, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_gfxcsc.o
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_gfxcsc.o
EXTRA_CFLAGS += -DPQ_ALG_GFXCSC
endif

ifneq ($(findstring  gfxzme, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_gfxzme.o
$(MOD_NAME)-y +=    $(MNG_DIR)/$(CHIP)/pq_mng_gfxzme.o
EXTRA_CFLAGS += -DPQ_ALG_GFXZME
endif

ifneq ($(findstring  gfxhdr, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_gfxhdr.o
$(MOD_NAME)-y +=    $(MNG_DIR)/pq_mng_gfxhdr.o
EXTRA_CFLAGS += -DPQ_ALG_GFXHDR
endif

ifeq ($(CFG_HI_CHIP_TYPE), hi3798cv200)
ifneq ($(findstring  hdr, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_hdr.o
$(MOD_NAME)-y +=    $(MNG_DIR)/$(CHIP)/pq_mng_hdr.o
$(MOD_NAME)-y +=    $(ASM_DST_DIR)/pq_mng_hdr_alg.o
EXTRA_CFLAGS += -DPQ_ALG_HDR
endif
endif

ifneq ($(findstring $(CFG_HI_CHIP_TYPE),hi3798mv200 hi3798mv300 hi3798mv310 hi3796mv200 hi3716mv450),)
ifneq ($(findstring  hdr, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_hdr.o
$(MOD_NAME)-y +=    $(MNG_DIR)/$(CHIP)/pq_mng_hdr.o
EXTRA_CFLAGS += -DPQ_ALG_HDR
endif
endif


ifneq ($(findstring  lchdr, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_lchdr.o
$(MOD_NAME)-y +=    $(MNG_DIR)/$(CHIP)/pq_mng_lchdr.o
EXTRA_CFLAGS += -DPQ_ALG_LCHDR
endif

ifneq ($(findstring  vpsscsc, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_vpsscsc.o
$(MOD_NAME)-y +=    $(MNG_DIR)/$(CHIP)/pq_mng_vpsscsc.o
EXTRA_CFLAGS += -DPQ_ALG_VPSSCSC
endif

ifneq ($(findstring  vpssgamma, $(module)),)
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_vpssgamma.o
$(MOD_NAME)-y +=    $(MNG_DIR)/$(CHIP)/pq_mng_vpssgamma.o
EXTRA_CFLAGS += -DPQ_ALG_VPSSGAMMA
endif

ifeq ($(CFG_HI_CHIP_TYPE), hi3798cv200)
ifneq ($(findstring db,$(module))$(findstring tnr,$(module))$(findstring snr,$(module)), )
$(MOD_NAME)-y +=    $(HAL_DIR)/$(CHIP)/pq_hal_algchange.o
endif
endif

asflags-y := -I$(COMMON_DRV_INCLUDE)

BUILD_DIR := $(HI_OUT_DIR)/$(OBJ_NAME)/$(subst $(SDK_DIR)/,,$(CURDIR))

BUILD_DIR_MAKEFILE := $(BUILD_DIR)/Makefile

#===============================================================================
#   rules
#===============================================================================
.PHONY: all clean

all: $(BUILD_DIR_MAKEFILE)
	$(AT)make -C $(LINUX_DIR) ARCH=$(CFG_HI_CPU_ARCH) CROSS_COMPILE=$(HI_KERNEL_TOOLCHAINS_NAME)- M=$(BUILD_DIR) src=$(CURDIR) modules
	$(AT)test -d $(HI_MODULE_DIR) || mkdir -p $(HI_MODULE_DIR)
	$(AT)cp -f $(BUILD_DIR)/$(MOD_NAME).ko $(HI_MODULE_DIR)/

clean:
	$(AT)make -C $(LINUX_DIR) ARCH=$(CFG_HI_CPU_ARCH) CROSS_COMPILE=$(HI_KERNEL_TOOLCHAINS_NAME)- M=$(BUILD_DIR) src=$(CURDIR) clean
	$(AT)rm -rf $(HI_MODULE_DIR)/$(MOD_NAME).ko

$(BUILD_DIR_MAKEFILE): $(BUILD_DIR)
	$(AT)touch $@

$(BUILD_DIR):
	$(AT)mkdir -p $@
