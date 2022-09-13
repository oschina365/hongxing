package com.oscer.hongxing.bean;

import lombok.Data;

/**
 * 产品
 *
 * @author kz
 * @create 2020-8-4 18:25:29
 **/
@Data
@Entity.Cache(region = "Item")
public class Item extends Entity {

    public static final Item ME = new Item();

    @Override
    public String tableName() {
        return "item";
    }

    private Long category_id;
    private long item_id;
    private int item_type;

    private String create_ip;
    private String update_ip;

}
