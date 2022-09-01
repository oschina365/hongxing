package com.oscer.hongxing.dao;


import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.oscer.hongxing.bean.Category;
import com.oscer.hongxing.bean.Product;
import com.oscer.hongxing.db.CacheMgr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDAO extends CommonDao<Product> {

    public static final ProductDAO ME = new ProductDAO();

    @Override
    protected String databaseName() {
        return "mysql";
    }

    public List<Product> listByCategory(Long categoryId) {
        String sql = "select id from " + Product.ME.rawTableName() + " where category_id=?";
        List<Long> ids = getDbQuery().query(Long.class, sql, categoryId);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        return Product.ME.loadList(ids);
    }

}
