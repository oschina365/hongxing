package com.oscer.hongxing.bean;

import lombok.Data;

/**
 * 案例
 *
 * @author kz
 * @create 2020-8-4 18:25:29
 **/
@Data
@Entity.Cache(region = "Article")
public class Article extends Entity {

    public static final Article ME = new Article();

    @Override
    public String tableName() {
        return "articlees";
    }

    private String name;
    private Long category_id;
    private String banner;
    private String tags;
    private String page_template;
    private String content;
    private long sort;
    private String top;
    private String create_ip;
    private String update_ip;
    private String desc;

    @TableField(exist = false)
    private String category_name;
}
