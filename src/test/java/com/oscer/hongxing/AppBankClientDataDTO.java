package com.oscer.hongxing;

import lombok.Data;

/**
 * 一码付签约表单入参
 *
 * @author kz
 * @version 1.4.5
 * @date 2022/08/23 15:27
 */
@Data
public class AppBankClientDataDTO {

    /**
     * 渠道方ID
     */
    private String channelId;

   

    /**
     * 用户姓名（签约人）
     */
    private String userName;

    /**
     * 身份证号（签约人）
     */
    private String cardId;

    /**
     * 手机号（签约人）
     */
    private String mobile;

    /**
     * 回调地址
     */
    private String returnUrl;

}
