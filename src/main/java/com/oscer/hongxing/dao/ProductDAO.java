package com.oscer.hongxing.dao;


import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.oscer.hongxing.bean.Article;
import com.oscer.hongxing.bean.Category;
import com.oscer.hongxing.bean.Product;
import com.oscer.hongxing.db.CacheMgr;
import org.apache.commons.lang3.StringUtils;

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

    public List<Product> randomList(int limit) {
        String sql = "select id from " + Product.ME.rawTableName() + " order by recomm desc,RAND() limit ?";
        List<Long> ids = getDbQuery().query(Long.class, sql, limit);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        return Product.ME.loadList(ids);
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

    public List<Product> page(List<Long> categoryIds, int page, int size) {
        StringBuilder sb = new StringBuilder("select id from " + Product.ME.rawTableName());
        sb.append(" where category_id in(" + StringUtils.join(categoryIds, ",") + ") order by sort asc ");
        List<Long> ids = getDbQuery().query_slice(Long.class, sb.toString(), page, size);
        return Product.ME.loadList(ids);
    }

    public long count(List<Long> categoryIds) {
        StringBuilder sb = new StringBuilder("select count(*) from " + Product.ME.rawTableName());
        sb.append(" where category_id in(" + StringUtils.join(categoryIds, ",") + ") ");
        return getDbQuery().read(Long.class, sb.toString());
    }

    public List<Product> page(int page, int size) {
        StringBuilder sb = new StringBuilder("select id from " + Product.ME.rawTableName());
        sb.append(" order by sort asc ");
        List<Long> ids = getDbQuery().query_slice(Long.class, sb.toString(), page, size);
        return Product.ME.loadList(ids);
    }

    public long count() {
        StringBuilder sb = new StringBuilder("select count(*) from " + Product.ME.rawTableName());
        return getDbQuery().read(Long.class, sb.toString());
    }

}
