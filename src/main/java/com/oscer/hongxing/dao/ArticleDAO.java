package com.oscer.hongxing.dao;


import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.RandomUtil;
import com.oscer.hongxing.bean.Article;
import com.oscer.hongxing.bean.Product;
import org.apache.commons.lang3.StringUtils;

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

    public List<Article> listLimitByCategory(Long categoryId, int limit) {
        String sql = "select id from " + Article.ME.rawTableName() + " where category_id=? order by sort desc limit ?";
        List<Long> ids = getDbQuery().query(Long.class, sql, categoryId, limit);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        return Article.ME.loadList(ids);
    }

    public List<Article> randomList(int limit) {
        String sql = "select id from " + Article.ME.rawTableName() + " ORDER BY RAND() LIMIT ? ";
        List<Long> ids = getDbQuery().query(Long.class, sql, limit);
        if (CollectionUtil.isEmpty(ids)) {
            return null;
        }
        return Article.ME.loadList(ids);
    }

    public Article randomOne() {
        String sql = "select id from " + Article.ME.rawTableName() + " ORDER BY RAND() LIMIT 1 ";
        Long id = getDbQuery().read(Long.class, sql);
        if (id == null) {
            return null;
        }
        return Article.ME.get(id);
    }

    public Article randomOne(Long idParam) {
        String sql = "select id from " + Article.ME.rawTableName() + " where id!=? ORDER BY RAND() LIMIT 1 ";
        Long id = getDbQuery().read(Long.class, sql, idParam);
        if (id == null) {
            return null;
        }
        return Article.ME.get(id);
    }

    public List<Article> page(List<Long> categoryIds, int page, int size) {
        StringBuilder sb = new StringBuilder("select id from " + Article.ME.rawTableName());
        sb.append(" where category_id in(" + StringUtils.join(categoryIds, ",") + ") order by sort desc ");
        List<Long> ids = getDbQuery().query_slice(Long.class, sb.toString(), page, size);
        return Article.ME.loadList(ids);
    }

    public long count(List<Long> categoryIds) {
        StringBuilder sb = new StringBuilder("select count(*) from " + Article.ME.rawTableName());
        sb.append(" where category_id in(" + StringUtils.join(categoryIds, ",") + ") ");
        return getDbQuery().read(Long.class, sb.toString());
    }

    public Article getByName(String name) {
        String sql = "select * from " + table() + " where name =?";
        return getDbQuery().read(Article.class, sql, name);
    }

    public List<Article> news() {
        String sql = "select * from article";
        return getDbQuery().query(Article.class, sql);
    }

}
