package com.oscer.hongxing.dao;


import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.RandomUtil;
import com.oscer.hongxing.bean.*;
import com.oscer.hongxing.common.CategoryContants;
import com.oscer.hongxing.db.DbQuery;
import com.oscer.hongxing.db.TransactionService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.transaction.annotation.Transactional;

import java.util.Comparator;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class ArticleDAO extends CommonDao<Article> {

    public static final ArticleDAO ME = new ArticleDAO();

    @Override
    protected String databaseName() {
        return "mysql";
    }

    public String table() {
        return Article.ME.rawTableName();
    }

    private String preSql() {
        return "select a.id from " + table() + " a LEFT JOIN " + Item.ME.rawTableName() + " s on a.id=s.item_id and s.item_type=2 ";
    }

    private String preSqlA() {
        return "select a.*,s.category_id as category_id from " + table() + " a LEFT JOIN " + Item.ME.rawTableName() + " s on a.id=s.item_id and s.item_type=2 ";
    }

    private String preCountSql() {
        return "select count(a.id) from " + table() + " a LEFT JOIN " + Item.ME.rawTableName() + " s on a.id=s.item_id and s.item_type=2 ";
    }

    public Article get(long id) {
        setSql(preSqlA() + " where s.item_id=?");
        Article article = getDbQuery().read_cache(Article.class, false, getCache_region(), "signal_" + id, getSql(), id);
        if (article == null) {
            return null;
        }
        Category category = Category.ME.get(article.getCategory_id());
        if (category != null) {
            article.setCategory_name(category.getName());
        }
        return article;
    }


    @Transactional(rollbackFor = Exception.class)
    public boolean edit(Article article) {
        try {
            DbQuery.get("mysql").transaction(new TransactionService() {
                @Override
                public void execute() throws Exception {
                    if (article.getId() == null || article.getId() <= 0L) {
                        article.setSort(System.currentTimeMillis());
                        long save = article.save();
                        List<Long> selectCategoryIds = article.getSelectCategoryIds();
                        for (Long selectCategoryId : selectCategoryIds) {
                            Category category = Category.ME.get(selectCategoryId);
                            if (category == null) {
                                continue;
                            }
                            Item item = new Item();
                            item.setItem_type(CategoryContants.Type.ARTICLE.getCode());
                            item.setItem_id(save);
                            item.setCategory_id(category.getId());
                            item.save();
                        }
                    } else {
                        List<Long> selectCategoryIds = article.getSelectCategoryIds();
                        ItemDAO.ME.deleteByItem(article.getId(), CategoryContants.Type.ARTICLE.getCode());
                        for (Long selectCategoryId : selectCategoryIds) {
                            Category category = Category.ME.get(selectCategoryId);
                            if (category == null) {
                                continue;
                            }
                            Item item = new Item();
                            item.setItem_type(CategoryContants.Type.ARTICLE.getCode());
                            item.setItem_id(article.getId());
                            item.setCategory_id(category.getId());
                            item.save();
                        }
                        article.doUpdate(true);
                    }
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public List<Article> listLimitByCategory(Long categoryId, int limit) {
        String sql = preSql() + "where s.category_id=? order by a.sort desc limit ?";
        List<Long> ids = getDbQuery().query(Long.class, sql, categoryId, limit);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        return Article.ME.loadList(ids);
    }

    public List<Article> randomList(int limit) {
        String sql = preSql() + " where a.banner is not null ORDER BY RAND() LIMIT ? ";
        List<Long> ids = getDbQuery().query(Long.class, sql, limit);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        return Article.ME.loadList(ids);
    }

    public Article randomOne() {
        String sql = preSql() + " ORDER BY RAND() LIMIT 1 ";
        Long id = getDbQuery().read(Long.class, sql);
        if (id == null) {
            return null;
        }
        return Article.ME.get(id);
    }

    public Article randomOne(Long idParam) {
        String sql = preSql() + " where a.id!=? ORDER BY RAND() LIMIT 1 ";
        Long id = getDbQuery().read(Long.class, sql, idParam);
        if (id == null) {
            return null;
        }
        return Article.ME.get(id);
    }

    public List<Article> page(List<Long> categoryIds, String name, int page, int size) {
        StringBuilder sb = new StringBuilder(preSql() + " where 1=1 ");
        if (CollectionUtil.isNotEmpty(categoryIds)) {
            sb.append(" and s.category_id in(" + StringUtils.join(categoryIds, ",") + ") ");
        }
        if (StringUtils.isNoneBlank(name)) {
            sb.append(" and a.name like '%" + name + "%'");
        }
        sb.append(" order by sort desc");
        List<Long> ids = getDbQuery().query_slice(Long.class, sb.toString(), page, size);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        List<Article> list = Article.ME.loadList(ids);
        if (CollectionUtil.isEmpty(list)) {
            return null;
        }
        for (Article article : list) {
            Category category = Category.ME.get(article.getCategoryId());
            if (category == null) {
                continue;
            }
            article.setCategory_name(category.getName());
        }
        return list;
    }

    public long count(List<Long> categoryIds, String name) {
        StringBuilder sb = new StringBuilder(preCountSql() + " where 1=1 ");
        if (CollectionUtil.isNotEmpty(categoryIds)) {
            sb.append(" and s.category_id in(" + StringUtils.join(categoryIds, ",") + ") ");
        }
        if (StringUtils.isNoneBlank(name)) {
            sb.append(" and a.name like '%" + name + "%'");
        }
        return getDbQuery().read(Long.class, sb.toString());
    }

    public Article getByName(String name) {
        String sql = "select * from " + table() + " where name =?";
        return getDbQuery().read(Article.class, sql, name);
    }

    @Transactional(rollbackFor = Exception.class)
    public boolean delete(Long id) {
        try {
            DbQuery.get("mysql").transaction(new TransactionService() {
                @Override
                public void execute() throws Exception {
                    Article article = Article.ME.get(id);
                    if (article != null) {
                        article.delete();
                        ItemDAO.ME.delete(id, CategoryContants.Type.ARTICLE.getCode());
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
