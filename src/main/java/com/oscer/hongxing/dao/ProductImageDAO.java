package com.oscer.hongxing.dao;


import com.oscer.hongxing.bean.ProductImage;

import java.util.List;

/**
 * 产品大图列表
 *
 * @author kz
 * @create 2020-08-04 18:28
 **/
public class ProductImageDAO extends CommonDao<ProductImage> {

    public final static ProductImageDAO ME = new ProductImageDAO();

    @Override
    protected String databaseName() {
        return "mysql";
    }

    public String table() {
        return ProductImage.ME.rawTableName();
    }

    public List<ProductImage> listByProductId(Long productId) {
        setSql("select id from " + table() + " where product_id=?");
        return ProductImage.ME.loadList(getDbQuery().query(Long.class, getSql(), productId));
    }

    public void deleteByProductId(Long productId){
        setSql("delete from " + table() + " where product_id=?");
        getDbQuery().update(getSql(),productId);
    }

}
