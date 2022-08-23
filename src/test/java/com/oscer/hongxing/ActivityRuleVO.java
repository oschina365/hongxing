package com.oscer.hongxing;

import lombok.Data;

import java.io.Serializable;

/**
 * 会员活动规则
 *
 * @author lss
 * @version 1.4.4
 * @date 2022/8/6 17:45
 */
@Data
public class ActivityRuleVO implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 签到活动连续签到开关
     */
    private Integer continuousSignStatus;

    /**
     * 浏览任务跳转链接
     */
    private String jumpLink;

    /**
     * 浏览任务停留时长
     */
    private Integer stayPageTime;
}
