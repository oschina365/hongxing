package com.oscer.hongxing.dao;


import cn.hutool.core.collection.CollectionUtil;
import com.oscer.hongxing.bean.*;
import com.oscer.hongxing.common.CategoryContants;
import com.oscer.hongxing.common.FormatUtil;
import org.jsoup.select.Elements;

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

    public static void main(String[] args) {
        List<Product> list = (List<Product>) Product.ME.list(false);
        for (Product product : list) {
            Elements images = FormatUtil.getImages(product.getContent());
            if (images != null) {
                for (int i = 0; i < images.size(); i++) {
                    String imageUrl = images.get(i).attr("src");
                    ProductImage productImage = new ProductImage();
                    productImage.setProduct_id(product.getId());
                    productImage.setImage(imageUrl);
                    productImage.setSort(System.currentTimeMillis());
                    productImage.setCreate_ip(product.getCreate_ip());
                    productImage.save();
                }
            }
        }
        /*List<Product> list = ProductDAO.ME.productList();
        for (Product product : list) {
            Product product1 = ProductDAO.ME.getByName(product.getName());
            if(product1==null){
                product.save();
            }
        }*/
        /*List<Product> list = (List<Product>) Product.ME.list(false);
        for (Product product : list) {
            List<Long> categoryIds = ProductDAO.ME.categoryIds(product.getName());
            if (CollectionUtil.isEmpty(categoryIds)) {
                System.out.println("分类ID为空！！！！，" + product.getName());
                continue;
            }
            for (Long categoryId : categoryIds) {
                try {
                    Item item = new Item();
                    item.setItem_id(product.getId());
                    item.setCategory_id(categoryId);
                    item.setItem_type(CategoryContants.Type.PRODUCT.getCode());
                    item.save(false);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }*/
        /*for (Product product : list) {
            Item item = new Item();
            item.setItem_id(product.getId());
            item.setCategory_id(product.getCategory_id());
            item.setItem_type(CategoryContants.Type.PRODUCT.getCode());
            item.save(false);
        }
        */
        List<Article> list1 = (List<Article>) Article.ME.list(false);
        for (Article article : list1) {
            Item item = new Item();
            item.setItem_id(article.getId());
            item.setCategory_id(article.getCategory_id());
            item.setItem_type(CategoryContants.Type.ARTICLE.getCode());
            item.save(false);
        }
    }

}
