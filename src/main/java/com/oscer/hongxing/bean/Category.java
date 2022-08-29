package com.oscer.hongxing.bean;


import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.io.Serializable;

/**
 * 分类列表
 */
@Entity.Cache(region = "Category")
@Data
@Slf4j
public class Category extends Entity implements Serializable {

    public final static Category ME = new Category();

    @Override
    public String tableName() {
        return "category";
    }

    /**
     * 分类名称
     */
    private String name;
    /**
     * 分类排序（值越大越靠前）
     */
    private int sort;
    /**
     * 分类标识
     */
    private String ident;
    /**
     * 父级分类ID
     */
    private long parent_id;
    /**
     * 分类描述
     */
    private String desc;
    /**
     * 分类小图标
     */
    private String small_icon;
    /**
     * 分类缩略图
     */
    private String thumb;
    /**
     * 分类背景图
     */
    private String banner;
    /**
     * 背景图链接
     */
    private String banner_href;
    /**
     * 是否置顶（0=否 1=是）
     */
    private int top;
    /**
     * 创建ip
     */
    private String create_ip;
    /**
     * 更新ip
     */
    private String update_ip;
    /**
     * 分类类型（1=产品分类 2=案例分类 3=公司管理）
     */
    private int type;

}
