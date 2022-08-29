package com.oscer.hongxing.dao;


import cn.hutool.core.collection.CollectionUtil;
import com.oscer.hongxing.bean.Category;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        List<Category> all = getDbQuery().query(Category.class, sql, type);
        if (CollectionUtil.isEmpty(all)) {
            return null;
        }
        List<Category> first = new ArrayList<>();
        Map<Long, List<Category>> secondMap = new HashMap<>();
        for (Category category : all) {
            if (category.getParent_id() == 0) {
                first.add(category);
            } else {
                List<Category> secondList = secondMap.get(category.getParent_id());
                if (CollectionUtil.isEmpty(secondList)) {
                    secondList = new ArrayList<>();
                }
                secondList.add(category);
                secondMap.put(category.getParent_id(), secondList);
            }
        }
        //根据sort字段，对集合进行升序排列
        first.sort((x, y) -> Integer.compare(x.getSort(), y.getSort()));
        for (Category category : first) {
            List<Category> childs = secondMap.get(category.getId());
            if (CollectionUtil.isNotEmpty(childs)) {
                //根据sort字段，对集合进行升序排列
                childs.sort((x, y) -> Integer.compare(x.getSort(), y.getSort()));
                category.setChilds(childs);
            }
        }
        return first;
    }


}
