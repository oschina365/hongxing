package com.oscer.hongxing.bean;

import lombok.Data;

import java.util.List;

/**
 * 产品大图
 *
 * @author kz
 * @create 2020-8-4 18:25:29
 **/
@Data
@Entity.Cache(region = "ProductImage")
public class ProductImage extends Entity {

    public static final ProductImage ME = new ProductImage();
    private Long product_id;
    private String image;
    private long sort;
    private String create_ip;
    private String update_ip;

}
