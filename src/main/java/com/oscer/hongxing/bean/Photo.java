package com.oscer.hongxing.bean;

import lombok.Data;

/**
 * 照片
 *
 * @author kz
 * @create 2020-8-4 18:25:29
 **/
@Data
@Entity.Cache(region = "Photo")
public class Photo extends Entity {

    public static final Photo ME = new Photo();
    private String url;
    private String key;
    private Long category_id;
    private Integer type;

}
