################################################################################
#    Copyright (C) 2014 Hisilicon STB Development Dept
#    All rights reserved.
#####
#    Create by Cai Zhiyong
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#    http://www.apache.org/licenses/LICENSE-2.0
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
################################################################################

CFLAGS += -I$(SRCDIR)../

SRCS-$(CONFIG_HIMCI_V200) := himciv200.c
SRCS-$(CONFIG_HIMCI_V300) := himciv300.c
SRCS-y += mmc_drv.c mmc_if.c mmc_unif.c mmc_rpmb.c

ifneq ($(CONFIG_SUPPORT_CA_RELEASE),y)
SRCS-$(CONFIG_CMDLINE) += cmd_mmc.c
endif

SRCS-$(CONFIG_ARCH_HI3798CV2X) += mmc_ids_hi3798cvx.c
SRCS-$(CONFIG_ARCH_HI3798MV2X) += mmc_ids_hi3798mv2x.c
SRCS-$(CONFIG_ARCH_HI3796MV2X) += mmc_ids_hi3796mv2x.c

#unsparse.c

