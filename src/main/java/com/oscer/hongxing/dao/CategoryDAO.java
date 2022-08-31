package com.oscer.hongxing.dao;


import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.oscer.hongxing.bean.Category;
import com.oscer.hongxing.db.CacheMgr;

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
        String sql = "select id from " + Category.ME.rawTableName() + " where type=?";
        List<Long> ids = getDbQuery().query(Long.class, sql, type);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        List<Category> all = Category.ME.loadList(ids);
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
                CacheMgr.set(Category.ME.CacheRegion(), Category.MAX_SORT_SECOND + StrUtil.UNDERLINE + category.getId(), childs.get(childs.size() - 1).getSort());
                category.setChilds(childs);
            }
        }
        Category maxFirst = first.get(first.size() - 1);
        CacheMgr.set(Category.ME.CacheRegion(), Category.MAX_SORT_FIRST + StrUtil.UNDERLINE + maxFirst.getType(), first.get(first.size() - 1).getSort());
        return first;
    }

    public int getSort(int type, long parentId) {
        Object sort = null;
        if (parentId == 0) {
            sort = CacheMgr.get(Category.ME.CacheRegion(), Category.MAX_SORT_FIRST + StrUtil.UNDERLINE + type);
        } else {
            sort = CacheMgr.get(Category.ME.CacheRegion(), Category.MAX_SORT_SECOND + StrUtil.UNDERLINE + parentId);
        }
        return sort == null ? 1 : Integer.parseInt(sort.toString()) + 1;
    }

    public void setSort(int type, long parentId, int sort) {
        if (parentId == 0) {
            CacheMgr.set(Category.ME.CacheRegion(), Category.MAX_SORT_FIRST + StrUtil.UNDERLINE + type, sort);
        } else {
            CacheMgr.set(Category.ME.CacheRegion(), Category.MAX_SORT_SECOND + StrUtil.UNDERLINE + parentId, sort);
        }
    }


}
