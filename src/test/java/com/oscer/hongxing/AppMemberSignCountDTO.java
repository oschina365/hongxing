package com.oscer.hongxing;

import lombok.Data;

/**
 * 会员周期签到统计详情入参
 *
 * @author kz
 * @version 1.4.4
 * @date 2022-08-05 14:56:35
 */
@Data
public class AppMemberSignCountDTO {

    /**
     * 日历开始时间，如：2022-06-27
     */
    private String startDate;

    /**
     * 日历结束时间，如：2022-08-06
     */
    private String endDate;
}
