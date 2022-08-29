package com.oscer.hongxing.dao;


import com.oscer.hongxing.bean.Category;

import java.util.List;

public class CategoryDAO extends CommonDao<Category> {

    public static final CategoryDAO ME = new CategoryDAO();

    @Override
    protected String databaseName() {
        return "mysql";
    }

    /**
     * 根据type查询分类列表
     *
     * @param type 分类类型（1=产品分类 2=案例分类 3=公司管理）
     * @return {@link List}
     */
    public List<Category> listByType(int type) {
        String sql = "select * from " + Category.ME.rawTableName() + " where type=?";
        return getDbQuery().query(Category.class, sql, type);
    }


}
