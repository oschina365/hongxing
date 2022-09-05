package com.oscer.hongxing.common.layui_result;

import lombok.Data;

import java.util.List;

/**
 * layer弹窗相册数据格式
 *
 * @author kz
 * @create 2022-09-05 8:04
 **/
@Data
public class LayuiPhotoResult {

    /**
     * status : 1
     * msg :
     * title : Photos Demo
     * id : 8
     * start : 0
     * data : [{"alt":"layer","pid":1,"src":"https://unpkg.com/outeres/demo/layer.png","thumb":""},{"alt":"壁纸","pid":3,"src":"https://unpkg.com/outeres/demo/000.jpg","thumb":""},{"alt":"浩瀚宇宙","pid":5,"src":"https://unpkg.com/outeres/demo/outer-space.jpg","thumb":""}]
     */

    private int status;
    private String msg;
    private String title;
    private Long id;
    private int start;
    private List<DataBean> data;

    @Data
    public static class DataBean {
        /**
         * alt : layer
         * pid : 1
         * src : https://unpkg.com/outeres/demo/layer.png
         * thumb :
         */
        private String alt;
        private long pid;
        private String src;
        private String thumb;

    }
}
