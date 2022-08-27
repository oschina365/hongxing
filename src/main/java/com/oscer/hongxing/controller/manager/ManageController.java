package com.oscer.hongxing.controller.manager;

import com.oscer.hongxing.controller.BaseController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 后台管理页面
 *
 * @author MRCHENIKE
 * @create 2022-08-21 14:46
 **/
@Controller
@Slf4j
public class ManageController extends ManagerBaseController {

    /**
     * 添加产品
     *
     * @return
     */
    @GetMapping("/manage/products_edit")
    public String login() {
        return "manager/products_edit";
    }

    /**
     * 产品列表
     *
     * @return
     */
    @GetMapping("/manage/products")
    public String products() {
        return "manager/products";
    }

    /**
     * 产品分类
     *
     * @return
     */
    @GetMapping("/manage/product_column_edit")
    public String product_column_edit() {
        return "manager/product_column_edit";
    }

}
