package com.oscer.hongxing.controller.manager;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 后台管理页面-资讯
 *
 * @author MRCHENIKE
 * @create 2022-08-21 14:46
 **/
@Controller
@Slf4j
public class ManageNewsController extends ManagerBaseController {

    /**
     * 基础页面路径
     */
    private static final String BASE_PAGE_URL = "/manager/page/news/";

    /**
     * 添加新闻
     *
     * @return
     */
    @GetMapping("/manage/news_edit")
    public String news_edit() {
        return BASE_PAGE_URL + "news_edit";
    }

    /**
     * 新闻列表
     *
     * @return
     */
    @GetMapping("/manage/news")
    public String news() {
        return BASE_PAGE_URL + "news";
    }

    /**
     * 添加分类
     *
     * @return
     */
    @GetMapping("/manage/news_column_edit")
    public String news_column_edit() {
        return BASE_PAGE_URL + "news_column_edit";
    }


    /**
     * 分类列表
     *
     * @return
     */
    @GetMapping("/manage/news_column")
    public String news_column() {
        return BASE_PAGE_URL + "news_column";
    }

    /**
     * 评论列表
     *
     * @return
     */
    @GetMapping("/manage/news_comment")
    public String news_comment() {
        return BASE_PAGE_URL + "news_comment";
    }

}
