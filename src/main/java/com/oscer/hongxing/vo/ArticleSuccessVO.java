package com.oscer.hongxing.vo;

import lombok.Data;

import java.util.List;

/**
 * 成功案例
 *
 * @author kz
 * @since 2022-09-02 10:29:32
 */
@Data
public class ArticleSuccessVO {

    private String categoryName;
    private Long categoryId;
    private List<Articles> articles;

    @Data
    public static class Articles {
        private Long articleId;
        private String image;
        private String name;
    }
}
