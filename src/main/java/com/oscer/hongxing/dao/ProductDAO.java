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

    public List<Product> page(Long categoryId, String name, int page, int size) {
        StringBuilder sb = new StringBuilder("select id from " + Product.ME.rawTableName() + " where 1=1 ");
        if (categoryId != null && categoryId > 0L) {
            sb.append(" and category_id = " + categoryId);
        }
        if (StrUtil.isNotBlank(name)) {
            sb.append(" and name like '%" + name + "%'");
        }
        List<Long> ids = getDbQuery().query_slice(Long.class, sb.toString(), page, size);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        return Product.ME.loadList(ids);
    }

    public Long count(Long categoryId, String name) {
        StringBuilder sb = new StringBuilder("select count(*) from " + Product.ME.rawTableName() + " where 1=1 ");
        if (categoryId != null && categoryId > 0L) {
            sb.append(" and category_id = " + categoryId);
        }
        if (StrUtil.isNotBlank(name)) {
            sb.append(" and name like '%" + name + "%'");
        }
        return getDbQuery().read(Long.class, sb.toString());
    }

    public List<Product> listByCategory(Long categoryId) {
        String sql = "select id from " + Product.ME.rawTableName() + " where category_id=?";
        List<Long> ids = getDbQuery().query(Long.class, sql, categoryId);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        return Product.ME.loadList(ids);
    }

    public List<Product> listLimitByCategory(Long categoryId, int limit) {
        String sql = "select id from " + Product.ME.rawTableName() + " where category_id=? limit ?";
        List<Long> ids = getDbQuery().query(Long.class, sql, categoryId, limit);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        return Product.ME.loadList(ids);
    }

}
