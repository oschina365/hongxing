package com.oscer.hongxing.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 流式加载
 * @author kz
 * @since 2022-09-14 13:21:14
 */
@NoArgsConstructor
@Data
public class PhotoFlowVO {

    private String title;
    private String id;
    private Integer start;
    private List<DataDTO> data;

    @NoArgsConstructor
    @Data
    public static class DataDTO {
        private String src;
        private String thumb;
        private String alt;
        private String pid;
    }
}
