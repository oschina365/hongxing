package com.oscer.hongxing.dao;


import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.oscer.hongxing.bean.*;
import com.oscer.hongxing.common.CategoryContants;
import com.oscer.hongxing.db.CacheMgr;
import com.oscer.hongxing.db.DbQuery;
import com.oscer.hongxing.db.TransactionService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.transaction.annotation.Transactional;

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

    public String table() {
        return Product.ME.rawTableName();
    }


    private String preSql() {
        return "select a.id from " + table() + " a LEFT JOIN items s on a.id=s.item_id and s.item_type=1 ";
    }

    private String preCountSql() {
        return "select count(a.id) from " + table() + " a LEFT JOIN items s on a.id=s.item_id and s.item_type=1 ";
    }

    private String preSqlA() {
        return "select a.*,s.category_id as category_id from " + table() + " a LEFT JOIN items s on a.id=s.item_id and s.item_type=2 ";
    }

    public Product get(long id) {
        setSql(preSqlA() + " where s.item_id=?");
        Product product = getDbQuery().read_cache(Product.class, false, getCache_region(), "signal_" + id, getSql(), id);
        if (product == null) {
            return null;
        }
        Category category = Category.ME.get(product.getCategory_id());
        if (category != null) {
            product.setCategory_name(category.getName());
        }
        return product;
    }

    public List<Product> page(Long categoryId, String name, int page, int size) {
        StringBuilder sb = new StringBuilder(preSql() + " where 1=1 ");
        if (categoryId != null && categoryId > 0L) {
            sb.append(" and s.category_id = " + categoryId);
        }
        if (StrUtil.isNotBlank(name)) {
            sb.append(" and a.name like '%" + name + "%'");
        }
        sb.append(" order by a.sort desc");
        List<Long> ids = getDbQuery().query_slice(Long.class, sb.toString(), page, size);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        List<Product> list = Product.ME.loadList(ids);
        if (CollectionUtil.isEmpty(list)) {
            return null;
        }
        for (Product product : list) {
            Category category = Category.ME.get(product.getCategoryId());
            if (category == null) {
                continue;
            }
            product.setCategory_name(category.getName());
        }
        return list;
    }

    public Long count(Long categoryId, String name) {
        StringBuilder sb = new StringBuilder(preCountSql() + " where 1=1 ");
        if (categoryId != null && categoryId > 0L) {
            sb.append(" and s.category_id = " + categoryId);
        }
        if (StrUtil.isNotBlank(name)) {
            sb.append(" and a.name like '%" + name + "%'");
        }
        return getDbQuery().read(Long.class, sb.toString());
    }


    public List<Product> randomList(int limit) {
        String sql = preSql() + "  where a.banner is not null order by a.recomm desc,RAND() limit ?";
        List<Long> ids = getDbQuery().query(Long.class, sql, limit);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        return Product.ME.loadList(ids);
    }

    public List<Product> listByCategory(Long categoryId) {
        String sql = preSql() + " where s.category_id=? and a.banner is not null ";
        List<Long> ids = getDbQuery().query(Long.class, sql, categoryId);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        return Product.ME.loadList(ids);
    }

    public List<Product> listLimitByCategory(Long categoryId, int limit) {
        String sql = preSql() + " where s.category_id=? limit ?";
        List<Long> ids = getDbQuery().query(Long.class, sql, categoryId, limit);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        return Product.ME.loadList(ids);
    }

    public List<Product> page(List<Long> categoryIds, int page, int size) {
        StringBuilder sb = new StringBuilder(preSql());
        sb.append(" where s.category_id in(" + StringUtils.join(categoryIds, ",") + ") " +
                "and a.banner is not null order by sort asc ");
        List<Long> ids = getDbQuery().query_slice(Long.class, sb.toString(), page, size);
        return Product.ME.loadList(ids);
    }

    public long count(List<Long> categoryIds) {
        StringBuilder sb = new StringBuilder(preCountSql());
        sb.append(" where s.category_id in(" + StringUtils.join(categoryIds, ",") + ") and a.banner is not null");
        return getDbQuery().read(Long.class, sb.toString());
    }

    public List<Product> page(int page, int size) {
        StringBuilder sb = new StringBuilder(preSql() + " where a.banner is not null");
        sb.append(" order by sort asc ");
        List<Long> ids = getDbQuery().query_slice(Long.class, sb.toString(), page, size);
        return Product.ME.loadList(ids);
    }

    public long count() {
        StringBuilder sb = new StringBuilder(preCountSql() + " where a.banner is not null");
        return getDbQuery().read(Long.class, sb.toString());
    }

    public Product getByName(String name) {
        String sql = "select * from " + table() + " where name =? limit 1";
        return getDbQuery().read(Product.class, sql, name);
    }

    public List<Long> listByName(String name) {
        String sql = "select category_id from " + table() + " where name =?";
        return getDbQuery().query(Long.class, sql, name);
    }

    public List<Product> listByCategoryId(Long categoryId) {
        StringBuilder sb = new StringBuilder("select * from " + table() + " where category_id=?");
        return getDbQuery().query(Product.class, sb.toString(), categoryId);
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean edit(Product product) {
        try {
            DbQuery.get("mysql").transaction(new TransactionService() {
                @Override
                public void execute() throws Exception {
                    if (product.getId() == null || product.getId() <= 0L) {
                        product.setSort(System.currentTimeMillis());
                        long save = product.save();
                        List<Long> selectCategoryIds = product.getSelectCategoryIds();
                        for (Long selectCategoryId : selectCategoryIds) {
                            Category category = Category.ME.get(selectCategoryId);
                            if (category == null) {
                                continue;
                            }
                            Item item = new Item();
                            item.setItem_type(CategoryContants.Type.PRODUCT.getCode());
                            item.setItem_id(save);
                            item.setCategory_id(category.getId());
                            item.save();
                        }
                    } else {
                        List<Long> selectCategoryIds = product.getSelectCategoryIds();
                        ItemDAO.ME.deleteByItem(product.getId(), CategoryContants.Type.PRODUCT.getCode());
                        for (Long selectCategoryId : selectCategoryIds) {
                            Category category = Category.ME.get(selectCategoryId);
                            if (category == null) {
                                continue;
                            }
                            Item item = new Item();
                            item.setItem_type(CategoryContants.Type.PRODUCT.getCode());
                            item.setItem_id(product.getId());
                            item.setCategory_id(category.getId());
                            item.save();
                        }
                        product.doUpdate(true);
                    }
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean delete(Long id) {
        try {
            DbQuery.get("mysql").transaction(new TransactionService() {
                @Override
                public void execute() throws Exception {
                    Product product = Product.ME.get(id);
                    if (product != null) {
                        product.delete();
                        ItemDAO.ME.delete(id, CategoryContants.Type.PRODUCT.getCode());
                    }
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
