package com.oscer.hongxing.bean;

import lombok.Data;

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

    private String name;
    private Long category_id;
    private String thumbnail;
    private String link;
    private String tags;
    private String size;
    private String desc;
    private String page_template;
    private String content;
    private String sort;
    private String top;
    private String create_ip;
    private String update_ip;

    private String category_name;
}
