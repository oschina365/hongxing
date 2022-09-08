package com.oscer.hongxing.dao;


import com.oscer.hongxing.bean.Item;

import java.util.List;

public class ItemDAO extends CommonDao<Item> {

    public static final ItemDAO ME = new ItemDAO();

    @Override
    protected String databaseName() {
        return "mysql";
    }

    public String table() {
        return Item.ME.rawTableName();
    }

    public void deleteByItem(Long item_id, int item_type) {
        String sql = "delete from " + table() + " where item_id =? and item_type=? ";
        getDbQuery().update(sql, item_id, item_type);
    }

    public List<Long> listByItem(Long item_id, int item_type) {
        setSql("select category_id from " + table() + " where item_id =? and item_type=? ");
        return getDbQuery().query(long.class, getSql(), item_id, item_type);
    }

}
