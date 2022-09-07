package com.oscer.hongxing.dao;


import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.oscer.hongxing.bean.Article;
import com.oscer.hongxing.bean.Opt;
import com.oscer.hongxing.bean.Product;

import java.util.List;

public class OptDAO extends CommonDao<Opt> {

    public static final OptDAO ME = new OptDAO();

    @Override
    protected String databaseName() {
        return "mysql";
    }

    public static void main(String[] args) {
        List<Product> products = (List<Product>) Product.ME.list(false);
        for (Product product : products) {
            try {
                Opt opt = new Opt();
                opt.setName(product.getName());
                opt.setBanner(product.getBanner());
                opt.setDesc(product.getDesc());
                opt.setItem_id(product.getId());
                opt.setType(1);
                opt.setCreate_time(product.getCreate_time());
                opt.setUpdate_time(product.getUpdate_time());
                opt.save();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        List<Article> articles = (List<Article>) Article.ME.list(false);
        for (Article article : articles) {
            try {
                Opt opt = new Opt();
                opt.setName(article.getName());
                opt.setBanner(article.getBanner());
                opt.setDesc(article.getDesc());
                opt.setItem_id(article.getId());
                opt.setCreate_time(article.getCreate_time());
                opt.setUpdate_time(article.getUpdate_time());
                opt.setType(2);
                opt.save();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    public String table() {
        return Opt.ME.rawTableName();
    }

    public List<Opt> search(String key, int page, int size) {
        StringBuilder sb = new StringBuilder("select id from " + table());
        if (StrUtil.isNotBlank(key)) {
            sb.append(" where name like '%").append(key).append("%' ");
        }
        List<Opt> list = Opt.ME.loadList(getDbQuery().query_slice(Long.class, sb.toString(), page, size));
        if (CollectionUtil.isEmpty(list)) {
            return null;
        }
        for (Opt opt : list) {
            if (opt.getType() == 1) {
                opt.setUrl("/product/" + opt.getItem_id());
            }
            if (opt.getType() == 2) {
                opt.setUrl("/article/" + opt.getItem_id());
            }
        }
        return list;
    }

    public long searchCount(String key) {
        StringBuilder sb = new StringBuilder("select count(*) from " + table());
        if (StrUtil.isNotBlank(key)) {
            sb.append(" where name like '%").append(key).append("%' ");
        }
        return getDbQuery().read(Long.class, sb.toString());
    }

}
