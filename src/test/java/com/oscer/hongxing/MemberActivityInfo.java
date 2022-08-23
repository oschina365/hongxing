package com.oscer.hongxing;

import lombok.Data;

import java.util.List;

/**
 * 会员活动信息表
 *
 * @author lss
 * @version 1.4.4
 * @date 2022-08-04 16:09:51
 */
@Data
public class MemberActivityInfo  {

    /**
     * 主键id
     */
    private Long id;
    /**
     * 商户号
     */
    private String tenantCode;
    /**
     * 活动编码
     */
    private String activityCode;
    /**
     * 活动名称
     */
    private String activityName;
    /**
     * 活动描述
     */
    private String describeInfo;
    /**
     * 活动类型 1.注册有礼 2.生日有礼 3.消费有礼 4.弹窗提醒 5: 预约活动  6: 入会有礼 7:签到活动  8:浏览活动
     */
    private Integer activityType;
    /**
     * 活动子类型
     */
    private Integer subType;
    /**
     * 活动参与限制(0表示不限制)
     */
    private Integer limitValue;
    /**
     * 活动开始时间
     */
    private String startTime;
    /**
     * 活动结束时间
     */
    private String endTime;
    /**
     * 可用门店 1.全门店 2.部分门店
     */
    private Integer useShop;
    /**
     * 是否通知 0.不通知 1.通知
     */
    private Integer isNotice;
    /**
     * 活动状态 0.已关闭  1.未开始 2.进行中 3.已结束
     */
    private Integer activityStatus;
    /**
     * 参加条件（1:全部用户 2:全部会员 3:其它）
     */
    private Integer userScope;
    /**
     * 活动级别-规则json
     */
    private String activityRuleJson;
    /**
     * 活动级别-赠送内容json
     */
    private String activityGiftJson;
    /**
     * 删除标记  0.正常(默认)  1.删除(进入回收站)
     */
    private Integer isDelete;

    /**
     * 活动关联规则信息
     */
    private List<MemberActivityRuleInfo> memberActivityRuleInfoList;

    /**
     * 创建开始时间
     */
    private String createStartTime;

    /**
     * 创建结束时间
     */
    private String createEndTime;

    /**
     * 浏览任务停留时长
     */
    private Integer stayPageTime;

    /**
     * 规则json详情
     */
    private ActivityRuleVO activityRule;

    /**
     * 赠礼json详情
     */
    private ActivityGiftVO activityGift;
}
