package com.oscer.hongxing.bean;

import lombok.Data;

import java.util.List;

/**
 * 产品,案例聚合表
 *
 * @author kz
 * @create 2020-8-4 18:25:29
 **/
@Data
@Entity.Cache(region = "Opt")
public class Opt extends Entity {

    public static final Opt ME = new Opt();

    @Override
    public String tableName() {
        return "opt";
    }

    private String name;
    private String banner;
    private String desc;
    private long item_id;
    /**
     * 1=产品 2=案例，文章
     */
    private int type;
    /**
     * 页面链接url
     */
    @TableField(exist = false)
    private transient String url;
}
