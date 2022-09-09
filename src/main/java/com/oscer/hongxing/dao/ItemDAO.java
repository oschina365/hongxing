package com.oscer.hongxing.dao;


import com.oscer.hongxing.bean.Article;
import com.oscer.hongxing.bean.Entity;
import com.oscer.hongxing.bean.Item;
import com.oscer.hongxing.bean.Product;
import com.oscer.hongxing.common.CategoryContants;

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

    public boolean delete(long itemId, int type) {
        setSql("delete from " + table() + " where item_id =? and item_type=? ");
        return getDbQuery().update(getSql(), itemId, type) > 0;
    }

   /* public static void main(String[] args) {
        List<Product> list = (List<Product>) Product.ME.list(false);
        for (Product product : list) {
            Item item = new Item();
            item.setItem_id(product.getId());
            item.setCategory_id(product.getCategory_id());
            item.setItem_type(CategoryContants.Type.PRODUCT.getCode());
            item.save(false);
        }
        List<Article> list1 = (List<Article>) Article.ME.list(false);
        for (Article article : list1) {
            Item item = new Item();
            item.setItem_id(article.getId());
            item.setCategory_id(article.getCategory_id());
            item.setItem_type(CategoryContants.Type.ARTICLE.getCode());
            item.save(false);
        }
    }*/

}
