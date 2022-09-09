package com.oscer.hongxing.vo;

import lombok.Data;

/**
 * 后台管理系统首页数据
 *
 * @author kz
 * @since 2022-09-02 10:29:32
 */
@Data
public class AdminDataVO {

    private int countProduct;
    private long countProductCategory;
    private int countArticle;
    private long countArticleCategory;
    private String lastLoginTime;
    private String lastLoginIp;
}
