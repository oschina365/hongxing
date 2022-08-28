package com.oscer.hongxing.controller.manager;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 后台管理页面-公司管理
 *
 * @author MRCHENIKE
 * @create 2022-08-21 14:46
 **/
@Controller
@Slf4j
public class ManageHelpsController extends ManagerBaseController {

    /**
     * 基础页面路径
     */
    private static final String BASE_PAGE_URL = "/manager/page/helps/";

    /**
     * 公司文档录入
     *
     * @return
     */
    @GetMapping("/manage/helps_edit")
    public String helps_edit() {
        return BASE_PAGE_URL + "helps_edit";
    }

    /**
     * 公司信息列表
     *
     * @return
     */
    @GetMapping("/manage/helps")
    public String helps() {
        return BASE_PAGE_URL + "helps";
    }

    /**
     * 分类录入
     *
     * @return
     */
    @GetMapping("/manage/help_column_edit")
    public String help_column_edit() {
        return BASE_PAGE_URL + "help_column_edit";
    }


    /**
     * 分类列表
     *
     * @return
     */
    @GetMapping("/manage/help_column")
    public String help_column() {
        return BASE_PAGE_URL + "help_column";
    }

    /**
     * 评论
     *
     * @return
     */
    @GetMapping("/manage/help_comment")
    public String help_comment() {
        return BASE_PAGE_URL + "help_comment";
    }

}
