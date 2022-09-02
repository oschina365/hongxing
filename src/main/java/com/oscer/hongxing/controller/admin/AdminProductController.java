package com.oscer.hongxing.controller.admin;

import com.oscer.hongxing.bean.Product;
import com.oscer.hongxing.common.ApiResult;
import com.oscer.hongxing.common.R;
import com.oscer.hongxing.dao.ProductDAO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 后台管理登录
 *
 * @author kz
 * @create 2022-08-21 14:46
 **/
@Controller
@RequestMapping("/admin/product")
@Slf4j
public class AdminProductController extends AdminBaseController {

    /**
     * 产品列表分页查询
     *
     * @param categoryId
     * @param name
     * @return
     */
    @GetMapping
    @ResponseBody
    public R page(@RequestParam(value = "categoryId", required = false) Long categoryId,
                  @RequestParam(value = "name", required = false) String name,
                  @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                  @RequestParam(value = "limit", required = false, defaultValue = "1") int limit) {
        List<Product> products = ProductDAO.ME.page(categoryId, name, page, limit);
        Long count = ProductDAO.ME.count(categoryId, name);
        return R.ok(products, count);
    }

}