package com.oscer.hongxing.bean;

import lombok.Data;

import java.util.Date;

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

    private long user;
    private String url;
    private String remark;
    private int year;
    private int month;
    private int day;
    private String type;

}
