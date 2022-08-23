package com.oscer.hongxing;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 活动关联规则详情
 *
 * @author lss
 * @version 1.4.4
 * @date 2022/8/6 17:53
 */
@Data
public class ActivityRelationRuleVO implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * 签到连续签到天数
     */
    private Integer continuousSignDays;

    /**
     * 积分
     */
    private BigDecimal integral;

    /**
     * 成长值
     */
    private BigDecimal grow;

    /**
     * 签到任务领取上限
     */
    private Integer receiveLimit;

}
