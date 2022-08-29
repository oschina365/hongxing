package com.oscer.hongxing.common;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 分类
 *
 * @author kz
 * @since 2022-08-29 17:25:08
 */
public class CategoryContants {

    /**
     * 分类类型（1=产品分类 2=案例分类 3=公司管理）
     */
    @Getter
    @AllArgsConstructor
    public enum Type {
        /**
         * 产品分类
         */
        PRODUCT(1, "产品分类"),
        /**
         * 案例分类
         */
        EXAMPLE(2, "案例分类"),
        /**
         * 公司管理
         */
        COMPANY(3, "公司管理");

        private int code;
        private String desc;
    }
}
