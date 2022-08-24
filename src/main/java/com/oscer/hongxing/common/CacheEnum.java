package com.oscer.hongxing.common;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 缓存域管理
 *
 * @author kz
 * @since 2022-01-11 13:54:18
 */
@Getter
@AllArgsConstructor
public enum CacheEnum {

    REGION_LOGIN("region_login", "已登录"),
    REGION_USER("region_user_", "用户相关"),
    REGION_TOKEN("region_token", "token相关"),
    REGION_ONE_HOUR("one_hour", "缓存一小时"),
    REGION_ONE_MIN("one_min", "缓存一分钟"),
    REGION_FIVE_MIN("five_min", "缓存五分钟"),
    REGION_NUMBER_NO("number_no", "单号生成缓存"),
    REGION_REFUND_ORDER_SEQ("refund_order_seq", "缓存退单序号"),
    REGION_USER_GOOD_CARD("user_good_card", "用户结算单缓存"),
    REGION_LOCK("Lock", "缓存锁"),
    GOODS_STOCK_KEY("goods_stock", "缓存库存"),
    COMMON_GOODS_STOCK_KEY("common_goods_stock", "缓存共用库存"),
    APP("App", "app缓存");


    private String region;
    private String desc;

}
