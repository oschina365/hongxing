package com.oscer.hongxing.bean;

import lombok.Data;

import java.util.List;

/**
 * 后台菜单
 *
 * @author kz
 * @create 2020-8-4 18:25:29
 **/
@Data
@Entity.Cache(region = "Menu")
public class Menu extends Entity {

    public static final Menu ME = new Menu();

    private String ident;
    private String name;
    private String icon;
    private String url;
    private long sort;
    private long parent_id;

    @TableField(exist = false)
    private String parent_name;

    /***
     * 子菜单列表
     */
    @TableField(exist = false)
    private List<Menu> childs;
}