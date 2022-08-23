package com.oscer.hongxing;

import lombok.Data;

/**
 * 会员活动规则表
 *
 * @author lss
 * @version 1.4.4
 * @date 2022-08-04 16:09:51
 */
@Data
public class MemberActivityRuleInfo  {

    /**
     * 主键id
     */
    private Long id;
    /**
     * 商户号
     */
    private String tenantCode;
    /**
     * 活动id
     */
    private Long activityId;
    /**
     * 规则json
     */
    private String ruleJson;
    /**
     * 赠送内容json
     */
    private String giftJson;

    /**
     * 规则json详情
     */
    private ActivityRelationRuleVO activityRelationRule;
}

