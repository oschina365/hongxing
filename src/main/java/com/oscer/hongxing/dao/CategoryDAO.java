package com.oscer.hongxing.dao;


import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.oscer.hongxing.bean.Category;
import com.oscer.hongxing.db.CacheMgr;
import com.oscer.hongxing.vo.CategoryXmVO;
import org.apache.commons.lang3.StringUtils;

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

    public String table() {
        return Category.ME.rawTableName();
    }

    /**
     * 通过分类的ident查询一条数据
     *
     * @param ident 分类ident
     * @return {@link Category}
     */
    public Category getByIdent(String ident) {
        String sql = "select id from " + table() + " where ident=? limit 1";
        return Category.ME.get(getDbQuery().read(Long.class, sql, ident));
    }

    /**
     * 根据父类id 查询分类列表
     *
     * @return {@link List}
     */
    public List<Category> childsByParentId(Long parentId) {
        String sql = "select id from " + table() + " where parent_id=? ";
        List<Long> ids = getDbQuery().query(Long.class, sql, parentId);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        List<Category> categoryList = Category.ME.loadList(ids);
        return categoryList;
    }

    /**
     * 根据type查询分类列表
     *
     * @param type 分类类型（1=产品分类 2=案例分类 3=公司管理）
     * @return {@link List}
     */
    public List<Category> listByType(int type) {
        return buildCategoryList(allByType(type));
    }


    /**
     * 根据type查询分类列表
     *
     * @param type 分类类型（1=产品分类 2=案例分类 3=公司管理）
     * @return {@link List}
     */
    public List<Category> allByType(int type) {
        String sql = "select id from " + table() + " where type=? order by id asc";
        List<Long> ids = getDbQuery().query_cache(Long.class, false, getCache_region(), "listByType_" + type, sql, type);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        return Category.ME.loadList(ids);
    }

    /**
     * 根据父类ident 查询分类列表
     *
     * @param type 分类类型（1=产品分类 2=案例分类 3=公司管理）
     * @return {@link List}
     */
    public List<Category> childsByType(int type, String ident) {
        String sql = "select id from " + table() + " where type=? and ident=? ";
        Long id = getDbQuery().read(Long.class, sql, type, ident);
        if (id == null || id <= 0L) {
            return null;
        }
        sql = "select id from " + table() + " where parent_id=? ";
        List<Long> ids = getDbQuery().query(Long.class, sql, id);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        List<Category> categoryList = Category.ME.loadList(ids);
        return categoryList;
    }

    /**
     * 构建分类
     *
     * @return {@link List}
     */
    public List<Category> buildCategoryList(List<Category> all) {
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

    public Category getByName(String name) {
        String sql = "select * from " + table() + " where name =?";
        return getDbQuery().read(Category.class, sql, name);
    }

    public long countByType(int type) {
        setSql("select count(*) from " + table() + " where type=?");
        return getDbQuery().read(long.class, getSql(), type);
    }


    /**
     * 根据type查询分类列表
     *
     * @param type 分类类型（1=产品分类 2=案例分类 3=公司管理）
     * @return {@link List}
     */
    public List<Category> page(int type, String name, int page, int size) {
        StringBuilder sb = new StringBuilder("select id from " + table());
        sb.append(" where type=? ");
        if (StringUtils.isNoneBlank(name)) {
            sb.append(" and name like '%" + name + "%'");
        }
        sb.append(" order by id asc");
        List<Long> ids = getDbQuery().query_slice(Long.class, sb.toString(), page, size, type);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        return Category.ME.loadList(ids);
    }


    public long count(int type, String name) {
        StringBuilder sb = new StringBuilder("select count(*) from " + table());
        sb.append(" where type=? ");
        if (StringUtils.isNoneBlank(name)) {
            sb.append(" and name like '%" + name + "%'");
        }
        return getDbQuery().read(long.class, sb.toString(), type);
    }

    public List<CategoryXmVO> buildXmCategoryVO(int type){
        List<Category> categoryList = CategoryDAO.ME.listByType(type);
        List<CategoryXmVO> vos = new ArrayList<>();
        for (Category category : categoryList) {
            CategoryXmVO vo = new CategoryXmVO();
            vo.setName(category.getName());
            List<Category> childs = category.getChilds();
            if (CollectionUtil.isEmpty(childs)) {
                vo.setDisabled(true);
            } else {
                vo.setDisabled(false);
            }
            vo.setValue(category.getId());
            if (CollectionUtil.isNotEmpty(childs)) {
                List<CategoryXmVO.ChildrenBean> childrens = new ArrayList<>();
                for (Category child : childs) {
                    CategoryXmVO.ChildrenBean bean = new CategoryXmVO.ChildrenBean();
                    bean.setName(child.getName());
                    bean.setDisabled(false);
                    bean.setSelected(false);
                    bean.setValue(child.getId());
                    childrens.add(bean);
                }
                vo.setChildren(childrens);
            }
            vos.add(vo);
        }
        return vos;
    }

}
