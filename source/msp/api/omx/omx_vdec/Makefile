#===============================================================================
#   export variables
#===============================================================================
ifeq ($(CFG_HI_EXPORT_FLAG),)
SDK_DIR ?= $(shell cd $(CURDIR)/../../../../.. && /bin/pwd)

include $(SDK_DIR)/base.mak
endif

#=======================================
# local varibale
#=======================================
ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798mv310),)
objects := omx_vdec_v2.1
else
ifneq ($(findstring $(CFG_HI_CHIP_TYPE), hi3798cv200 hi3798mv200 hi3798mv300 hi3796mv200 hi3716mv450),)
objects := omx_vdec_v2.0
else
objects := omx_vdec_v1.0
endif
endif

objects_clean:=${addsuffix _clean,${objects}}
objects_install:=${addsuffix _install,${objects}}
objects_uninstall:=${addsuffix _uninstall,${objects}}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#	  rules
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.PHONY: all clean install mod_install uninstall ${objects} ${objects_clean} ${objects_install} ${objects_uninstall}

all: ${objects}

clean: ${objects_clean}

install: ${objects_install}

mod_install: install

uninstall: ${objects_uninstall}

${objects}:
	make -C $@

${objects_clean}:
	make -C ${patsubst %_clean,%,$@} clean

${objects_install}:
	make -C ${patsubst %_install,%,$@} install

${objects_uninstall}:
	make -C ${patsubst %_uninstall,%,$@} uninstall
