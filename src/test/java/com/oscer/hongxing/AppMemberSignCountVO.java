package com.oscer.hongxing;

import lombok.Data;

/**
 * 会员周期签到统计详情
 *
 * @author kz
 * @version 1.4.4
 * @date 2022/8/4 16:31
 */
@Data
public class AppMemberSignCountVO {

    /**
     * 当前日期
     */
    private String currentDay;
    /**
     * 是否签到 0-否 1-是
     */
    private Integer isSign;
    /**
     * 是否有连续签到奖励
     */
    private Integer isContinueSign;
}
