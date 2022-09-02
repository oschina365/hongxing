package com.oscer.hongxing.bean;

import lombok.Data;

import java.util.List;

/**
 * 产品
 *
 * @author kz
 * @create 2020-8-4 18:25:29
 **/
@Data
@Entity.Cache(region = "Product")
public class Product extends Entity {

    public static final Product ME = new Product();

    /**
     * 产品名称
     */
    private String name;
    /**
     * 产品名称
     */
    private Long category_id;
    /**
     * 产品名称
     */
    private String thumbnail;
    /**
     * 产品名称
     */
    private String link;
    /**
     * 产品名称
     */
    private String tags;
    private String size;
    private String desc;
    private String page_template;
    private String content;
    private long sort;
    private int top;
    private int cream;
    private int recomm;
    private String create_ip;
    private String update_ip;

    @TableField(exist = false)
    private String category_name;
    @TableField(exist = false)
    private List<String> imgUrls;
}
