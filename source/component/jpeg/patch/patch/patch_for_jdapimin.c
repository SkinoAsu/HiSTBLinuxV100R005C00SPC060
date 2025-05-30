/**************************************************************************************************
*
* Copyright (C) 2017 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
****************************************************************************************************
File Name        : patch_for_jdapimin.c
Version          : Initial Draft
Author           :
Created          : 2017/10/01
Description      :
Function List    :

History          :
Date                     Author           Modification
2017/10/01               sdk              Created file
***************************************************************************************************/


/****************************  add include here     ***********************************************/
#include "jpeg_sdec_inputinfo.c"


/***************************** Macro Definition     ***********************************************/

/***************************** Structure Definition ***********************************************/


/********************** Global Variable declaration ************************************************/


/********************** API forward declarations    ************************************************/

/**********************       API realization       ***********************************************/
#define adp_for_init_hdec_resource          cinfo->client_data = JPEG_DEC_CreateDecompress(); \
                                            if (NULL == cinfo->client_data)\
                                            {\
                                                ERREXIT(cinfo, JERR_NO_IMAGE);\
                                            }

#define adp_for_set_inputimg_info           JPEG_SDEC_SetInputImgeInfo(cinfo);
