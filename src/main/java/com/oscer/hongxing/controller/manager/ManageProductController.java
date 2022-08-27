package com.oscer.hongxing.controller.manager;

import com.oscer.hongxing.controller.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 后台管理页面-产品
 *
 * @author MRCHENIKE
 * @create 2022-08-21 14:46
 **/
@Controller
@Slf4j
public class ManageProductController extends ManagerBaseController {

    /**
     * 基础页面路径
     */
    private static final String BASE_PAGE_URL = "/manager/page/product/";

    /**
     * 添加产品
     *
     * @return
     */
    @GetMapping("/manage/products_edit")
    public String products_edit() {
        return BASE_PAGE_URL + "products_edit";
    }

    /**
     * 产品列表
     *
     * @return
     */
    @GetMapping("/manage/products")
    public String products() {
        return BASE_PAGE_URL + "products";
    }

    /**
     * 添加分类
     *
     * @return
     */
    @GetMapping("/manage/product_column_edit")
    public String product_column_edit() {
        return BASE_PAGE_URL + "product_column_edit";
    }


    /**
     * 产品分类
     *
     * @return
     */
    @GetMapping("/manage/product_column")
    public String product_column() {
        return BASE_PAGE_URL + "product_column";
    }

    /**
     * 产品评论
     *
     * @return
     */
    @GetMapping("/manage/product_comment")
    public String product_comment() {
        return BASE_PAGE_URL + "product_comment";
    }

}
