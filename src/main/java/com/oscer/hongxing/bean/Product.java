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

    @Override
    public String tableName() {
        return "product";
    }

    private String name;
    private Long category_id;
    private String banner;
    private String link;
    private String tags;
    private String size;
    private String desc;
    private String page_template;
    private String content;
    private long sort;
    private long top;
    private long cream;
    private long recomm;
    private String create_ip;
    private String update_ip;

    @TableField(exist = false)
    private String category_name;
    @TableField(exist = false)
    private List<String> imgUrls;
    @TableField(exist = false)
    private transient List<Long> selectCategoryIds;
}
