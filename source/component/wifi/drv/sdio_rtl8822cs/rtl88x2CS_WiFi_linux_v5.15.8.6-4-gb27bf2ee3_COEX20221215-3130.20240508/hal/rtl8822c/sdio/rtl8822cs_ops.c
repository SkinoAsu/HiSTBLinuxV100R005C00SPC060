/******************************************************************************
 *
 * Copyright(c) 2015 - 2017 Realtek Corporation.
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of version 2 of the GNU General Public License as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 *****************************************************************************/
#define _RTL8822CS_OPS_C_

#include <drv_types.h>		/* PADAPTER, basic_types.h and etc. */
#include <hal_data.h>		/* HAL_DATA_TYPE, GET_HAL_DATA() and etc. */
#include <hal_intf.h>		/* struct hal_ops */
#include "../rtl8822c.h"	/* rtl8822c_sethwreg() and etc. */
#include "rtl8822cs.h"		/* rtl8822cs_hal_init() */

static void intf_chip_configure(PADAPTER adapter)
{
	PHAL_DATA_TYPE phal;

	phal = GET_HAL_DATA(adapter);

#ifdef RTW_RX_AGGREGATION
	phal->rxagg_mode = RX_AGG_DMA;
	phal->rxagg_dma_size = 0xff;
	phal->rxagg_dma_timeout= 0x20;
#endif
}

/*
 * Description:
 *	Collect all hardware information, fill "HAL_DATA_TYPE".
 *	Sometimes this would be used to read MAC address.
 *	This function will do
 *	1. Read Efuse/EEPROM to initialize
 *	2. Read registers to initialize
 *	3. Other vaiables initialization
 */
static u8 read_adapter_info(PADAPTER adapter)
{
	u8 ret = _FAIL;

	/*
	 * 1. Read Efuse/EEPROM to initialize
	 */
	if (rtl8822c_read_efuse(adapter) != _SUCCESS)
		goto exit;

	/*
	 * 2. Read registers to initialize
	 */

	/*
	 * 3. Other Initialization
	 */

	ret = _SUCCESS;

exit:
	return ret;
}

void rtl8822cs_get_interrupt(PADAPTER adapter, u32 *hisr, u32 *rx_len)
{
	u8 data[8] = {0};


	rtw_read_mem(adapter, REG_SDIO_HISR_8822C, 8, data);

	if (hisr)
		*hisr = le32_to_cpu(*(u32 *)data);
	if (rx_len)
		*rx_len = le32_to_cpu(*(u32 *)&data[4]);
}

void rtl8822cs_clear_interrupt(PADAPTER adapter, u32 hisr)
{
	/* Perform write one clear operation */
	if (hisr)
		rtw_write32(adapter, REG_SDIO_HISR_8822C, hisr);
}

static void update_himr(PADAPTER adapter, u32 himr)
{
	rtw_write32(adapter, REG_SDIO_HIMR_8822C, himr);
}

/*
 * Description:
 *	Initialize SDIO Host Interrupt Mask configuration variables for future use.
 *
 */
static void init_interrupt(PADAPTER adapter)
{
	struct hal_com_data *hal;


	hal = GET_HAL_DATA(adapter);
	hal->sdio_himr = (u32)(
				 BIT_RX_REQUEST_MSK_8822C	|
#ifdef CONFIG_SDIO_TX_ENABLE_AVAL_INT
				 BIT_SDIO_AVAL_MSK_8822C		|
#endif /* CONFIG_SDIO_TX_ENABLE_AVAL_INT */
#if 0
				 BIT_SDIO_TXERR_MSK_8822C	|
				 BIT_SDIO_RXERR_MSK_8822C	|
				 BIT_SDIO_TXFOVW_MSK_8822C	|
				 BIT_SDIO_RXFOVW_MSK_8822C	|
				 BIT_SDIO_TXBCNOK_MSK_8822C	|
				 BIT_SDIO_TXBCNERR_MSK_8822C	|
				 BIT_SDIO_BCNERLY_INT_MSK_8822C	|
				 BIT_SDIO_C2HCMD_INT_MSK_8822C	|
#endif
#if defined(CONFIG_LPS_LCLK) && !defined(CONFIG_DETECT_CPWM_BY_POLLING)
				 BIT_SDIO_CPWM1_MSK_8822C	|
#if 0
				 BIT_SDIO_CPWM2_MSK_8822C	|
#endif
#endif /* CONFIG_LPS_LCLK && !CONFIG_DETECT_CPWM_BY_POLLING */
#if 0
				 BIT_SDIO_HSISR_IND_MSK_8822C	|
				 BIT_SDIO_GTINT3_MSK_8822C	|
				 BIT_SDIO_GTINT4_MSK_8822C	|
				 BIT_SDIO_PSTIMEOUT_MSK_8822C	|
				 BIT_SDIO_OCPINT_MSK_8822C	|
				 BIT_SDIIO_ATIMend_MSK_8822C	|
				 BIT_SDIO_ATIMend_E_MSK_8822C	|
				 BIT_SDIO_CTWend_MSK_8822C	|
				 BIT_SDIO_CRCERR_MSK_8822C	|
#endif
				 0);

#ifdef CONFIG_SDIO_MULTI_FUNCTION_COEX
	if (sdio_get_num_of_func(adapter_to_dvobj(adapter)) > 1)
		hal->sdio_himr |= BIT_BT_INT_MASK_8822C;
#endif
}

/*
 * Description:
 *	Clear corresponding SDIO Host ISR interrupt service.
 *
 * Assumption:
 *	Using SDIO Local register ONLY for configuration.
 */
#if defined(CONFIG_WOWLAN) || defined(CONFIG_AP_WOWLAN)
static void clear_interrupt_all(PADAPTER adapter)
{
	PHAL_DATA_TYPE hal;


	if (rtw_is_surprise_removed(adapter))
		return;

	hal = GET_HAL_DATA(adapter);
	rtl8822cs_clear_interrupt(adapter, 0xFFFFFFFF);
}
#endif /*#if defined(CONFIG_WOWLAN) || defined(CONFIG_AP_WOWLAN)*/
/*
 * Description:
 *	Enalbe SDIO Host Interrupt Mask configuration on SDIO local domain.
 *
 * Assumption:
 *	1. Using SDIO Local register ONLY for configuration.
 *	2. PASSIVE LEVEL
 */
static void enable_interrupt(PADAPTER adapter)
{
	PHAL_DATA_TYPE hal;


	hal = GET_HAL_DATA(adapter);

	update_himr(adapter, hal->sdio_himr);
	RTW_INFO(FUNC_ADPT_FMT ": update SDIO HIMR=0x%08X\n",
		 FUNC_ADPT_ARG(adapter), hal->sdio_himr);
}

/*
 * Description:
 *	Disable SDIO Host IMR configuration to mask unnecessary interrupt service.
 *
 * Assumption:
 *	Using SDIO Local register ONLY for configuration.
 */
static void disable_interrupt(PADAPTER adapter)
{

	update_himr(adapter, 0);
	RTW_INFO("%s: update SDIO HIMR=0\n", __FUNCTION__);
}

static void _run_thread(PADAPTER adapter)
{
#ifndef CONFIG_SDIO_TX_TASKLET
	struct xmit_priv *xmitpriv = &adapter->xmitpriv;

	if (xmitpriv->SdioXmitThread == NULL) {
		RTW_INFO(FUNC_ADPT_FMT " start RTWHALXT\n", FUNC_ADPT_ARG(adapter));
		xmitpriv->SdioXmitThread = kthread_run(rtl8822cs_xmit_thread, adapter, "RTWHALXT");
		if (IS_ERR(xmitpriv->SdioXmitThread)) {
			RTW_ERR("%s: start rtl8822cs_xmit_thread FAIL!!\n", __FUNCTION__);
			xmitpriv->SdioXmitThread = NULL;
		}
	}
#endif /* !CONFIG_SDIO_TX_TASKLET */
}

static void run_thread(PADAPTER adapter)
{
	_run_thread(adapter);
	rtl8822c_run_thread(adapter);
}

static void _cancel_thread(PADAPTER adapter)
{
#ifndef CONFIG_SDIO_TX_TASKLET
	struct xmit_priv *xmitpriv = &adapter->xmitpriv;

	/* stop xmit_buf_thread */
	if (xmitpriv->SdioXmitThread) {
		_rtw_up_sema(&xmitpriv->SdioXmitSema);
	#ifdef SDIO_FREE_XMIT_BUF_SEMA
		rtw_sdio_free_xmitbuf_sema_up(xmitpriv);
		rtw_sdio_free_xmitbuf_sema_down(xmitpriv);
	#endif
		rtw_thread_stop(xmitpriv->SdioXmitThread);
		xmitpriv->SdioXmitThread = NULL;
	}
#endif /* !CONFIG_SDIO_TX_TASKLET */
}

static void cancel_thread(PADAPTER adapter)
{
	rtl8822c_cancel_thread(adapter);
	_cancel_thread(adapter);
}

/*
 * If variable not handled here,
 * some variables will be processed in rtl8822c_sethwreg()
 */
static u8 sethwreg(PADAPTER adapter, u8 variable, u8 *val)
{
	u8 ret = _SUCCESS;
	u8 val8;

	switch (variable) {
	case HW_VAR_SET_RPWM:
		/*
		 * RPWM use follwoing bits:
		 * BIT0 - 1: 32K, 0: Normal Clock
		 * BIT4 - Power Gated
		 * BIT6 - Ack Bit
		 * BIT7 - Toggling Bit
		 */
		val8 = PS_STATE(*val);
		/*
		 * PS_STATE == 0 is special case for initializing,
		 * and keep the value to be 0
		 */
		if (val8 && (val8 < PS_STATE_S2)) {
			#ifdef CONFIG_LPS_PG
			if (adapter_to_pwrctl(adapter)->lps_level == LPS_PG)
				val8 = BIT_REQ_PS_8822C | BIT4;
			else
			#endif
				val8 = BIT_REQ_PS_8822C;
		} else
			val8 = 0;

		if (*val & PS_ACK)
			val8 |= BIT_ACK_8822C;
		if (*val & PS_TOGGLE)
			val8 |= BIT_TOGGLE_8822C;

		rtw_write8(adapter, REG_SDIO_HRPWM1_8822C, val8);
		break;

	case HW_VAR_SET_REQ_FW_PS:
		/*
		 * 1. driver write 0x8f[4]=1
		 *    request fw ps state (only can write bit4)
		 */
	{
		u8 req_fw_ps = 0;

		req_fw_ps = rtw_read8(adapter, 0x8f);
		req_fw_ps |= 0x10;
		rtw_write8(adapter, 0x8f, req_fw_ps);
	}
	break;
	case HW_VAR_SET_DRV_ERLY_INT:
		switch (*val) {
		#ifdef CONFIG_TDLS
		#ifdef CONFIG_TDLS_CH_SW
			case TDLS_BCN_ERLY_ON:
				adapter->tdlsinfo.chsw_info.bcn_early_reg_bkp = rtw_read8(adapter, REG_DRVERLYINT);
				rtw_write8(adapter, REG_DRVERLYINT, 20);
				break;
			case TDLS_BCN_ERLY_OFF:
				rtw_write8(adapter, REG_DRVERLYINT, adapter->tdlsinfo.chsw_info.bcn_early_reg_bkp);
				break;
		#endif
		#endif
		}
		break;

	default:
		ret = rtl8822c_sethwreg(adapter, variable, val);
		break;
	}

	return ret;
}

/*
 * If variable not handled here,
 * some variables will be processed in GetHwReg8723B()
 */
static void gethwreg(PADAPTER adapter, u8 variable, u8 *val)
{
	u8 val8;

	switch (variable) {
	case HW_VAR_CPWM:
		val8 = rtw_read8(adapter, REG_SDIO_HCPWM1_V2_8822C);

		if (val8 & BIT_CUR_PS_8822C)
			*val = PS_STATE_S0;
		else
			*val = PS_STATE_S4;

		if (val8 & BIT_TOGGLE_8822C)
			*val |= PS_TOGGLE;
		break;

#if defined(CONFIG_WOWLAN) || defined(CONFIG_AP_WOWLAN) || defined(CONFIG_FWLPS_IN_IPS)
	case HW_VAR_RPWM_TOG:
		*val = rtw_read8(adapter, REG_SDIO_HRPWM1_8822C);
		*val &= BIT_TOGGLE_8822C;
		break;
#endif

	case HW_VAR_FW_PS_STATE:
		/* driver read dword 0x88 to get fw ps state */
		*((u16 *)val) = rtw_read16(adapter, 0x88);
		break;

	default:
		rtl8822c_gethwreg(adapter, variable, val);
		break;
	}
}

/*
 * Description:
 *	Query setting of specified variable.
 */
static u8 gethaldefvar(PADAPTER adapter, HAL_DEF_VARIABLE eVariable, void *pval)
{
	u8 bResult = _SUCCESS;

	switch (eVariable) {
	case HW_VAR_MAX_RX_AMPDU_FACTOR:
		/* Default use MAX size */
		*(HT_CAP_AMPDU_FACTOR *)pval = MAX_AMPDU_FACTOR_64K;
		break;

	default:
		bResult = rtl8822c_gethaldefvar(adapter, eVariable, pval);
		break;
	}

	return bResult;
}

/*
 * Description:
 *	Change default setting of specified variable.
 */
static u8 sethaldefvar(PADAPTER adapter, HAL_DEF_VARIABLE eVariable, void *pval)
{
	u8 bResult = _SUCCESS;

	switch (eVariable) {
	default:
		bResult = rtl8822c_sethaldefvar(adapter, eVariable, pval);
		break;
	}

	return bResult;
}

void rtl8822cs_set_hal_ops(PADAPTER adapter)
{
	struct hal_ops *ops;
	int err;


	err = rtl8822cs_halmac_init_adapter(adapter);
	if (err) {
		RTW_INFO("%s: [ERROR]HALMAC initialize FAIL!\n", __FUNCTION__);
		return;
	}

	rtl8822c_set_hal_ops(adapter);
	init_interrupt(adapter);

	ops = &adapter->hal_func;

	ops->init_default_value = rtl8822cs_init_default_value;
	ops->intf_chip_configure = intf_chip_configure;
	ops->read_adapter_info = read_adapter_info;

	ops->hal_init = rtl8822cs_init;
	ops->hal_deinit = rtl8822cs_deinit;

	ops->init_xmit_priv = rtl8822cs_init_xmit_priv;
	ops->free_xmit_priv = rtl8822cs_free_xmit_priv;
	ops->hal_xmit = rtl8822cs_hal_xmit;
	ops->mgnt_xmit = rtl8822cs_mgnt_xmit;
#ifdef CONFIG_RTW_MGMT_QUEUE
	ops->hal_mgmt_xmitframe_enqueue = rtl8822cs_hal_mgmt_xmit_enqueue;
#endif
	ops->hal_xmitframe_enqueue = rtl8822cs_hal_xmit_enqueue;
#ifdef CONFIG_XMIT_THREAD_MODE
	ops->xmit_thread_handler = rtl8822cs_xmit_buf_handler;
#endif
	ops->run_thread = run_thread;
	ops->cancel_thread = cancel_thread;

	ops->init_recv_priv = rtl8822cs_init_recv_priv;
	ops->free_recv_priv = rtl8822cs_free_recv_priv;
#ifdef CONFIG_RECV_THREAD_MODE
	ops->recv_hdl = rtl8822cs_recv_hdl;
#endif

	ops->enable_interrupt = enable_interrupt;
	ops->disable_interrupt = disable_interrupt;
#if defined(CONFIG_WOWLAN) || defined(CONFIG_AP_WOWLAN)
	ops->clear_interrupt = clear_interrupt_all;
#endif

#ifdef CONFIG_RTW_SW_LED
	ops->InitSwLeds = rtl8822cs_initswleds;
	ops->DeInitSwLeds = rtl8822cs_deinitswleds;
#endif
	ops->set_hw_reg_handler = sethwreg;
	ops->GetHwRegHandler = gethwreg;
	ops->get_hal_def_var_handler = gethaldefvar;
	ops->SetHalDefVarHandler = sethaldefvar;
}

#if defined(CONFIG_WOWLAN) || defined(CONFIG_AP_WOWLAN)
void rtl8822cs_disable_interrupt_but_cpwm2(PADAPTER adapter)
{
	u32 himr, tmp;

	tmp = rtw_read32(adapter, REG_SDIO_HIMR);
	RTW_INFO("%s: Read SDIO_REG_HIMR: 0x%08x\n", __FUNCTION__, tmp);

	himr = BIT_SDIO_CPWM2_MSK;
	update_himr(adapter, himr);

	tmp = rtw_read32(adapter, REG_SDIO_HIMR);
	RTW_INFO("%s: Read again SDIO_REG_HIMR: 0x%08x\n", __FUNCTION__, tmp);
}
#endif /* CONFIG_WOWLAN */
