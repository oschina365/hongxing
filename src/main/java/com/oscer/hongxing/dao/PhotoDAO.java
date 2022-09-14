package com.oscer.hongxing.dao;


import cn.hutool.core.util.StrUtil;
import com.oscer.hongxing.bean.Entity;
import com.oscer.hongxing.bean.Photo;
import com.oscer.hongxing.bean.Product;
import com.oscer.hongxing.bean.ProductImage;
import com.oscer.hongxing.common.FormatUtil;
import com.oscer.hongxing.db.CacheMgr;
import org.jsoup.select.Elements;

import java.util.List;

/**
 * 照片
 *
 * @author kz
 * @create 2020-08-04 18:28
 **/
public class PhotoDAO extends CommonDao<Photo> {

    public final static PhotoDAO ME = new PhotoDAO();

    @Override
    protected String databaseName() {
        return "mysql";
    }

    public String table() {
        return Photo.ME.rawTableName();
    }

    public List<Photo> photos(String key, Long categoryId, int page, int size) {
        StringBuilder sb = new StringBuilder("select * from " + table() + " where 1=1 ");
        if (categoryId != null && categoryId > 0L) {
            sb.append(" and category_id = " + categoryId);
        }
        if (StrUtil.isNotBlank(key)) {
            sb.append(" and key like '%" + key + "%'");
        }
        sb.append("  order by create_time desc ");
        return getDbQuery().query_slice(Photo.class, sb.toString(), page, size);
    }

    public long count(String key, Long categoryId) {
        StringBuilder sb = new StringBuilder("select count(*) from " + table());
        if (categoryId != null && categoryId > 0L) {
            sb.append(" and category_id = " + categoryId);
        }
        if (StrUtil.isNotBlank(key)) {
            sb.append(" and key like '%" + key + "%'");
        }
        return getDbQuery().read(long.class, sb.toString());
    }

    public static void main(String[] args) {
        List<ProductImage> list = (List<ProductImage>) ProductImage.ME.list(false);
        for (ProductImage productImage : list) {
            Product product = Product.ME.get(productImage.getProduct_id());
            Photo p = new Photo();
            p.setUrl(productImage.getImage());
            p.setKey(product.getName());
            p.setCategory_id(1L);
            p.save();
        }
    }

}
