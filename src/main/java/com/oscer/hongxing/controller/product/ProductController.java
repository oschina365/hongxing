package com.oscer.hongxing.controller.product;

import com.oscer.hongxing.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author kz
 * @since 2022-08-18 16:57:08
 */
@Controller
public class ProductController extends BaseController {

    /**
     * 首页
     *
     * @return
     */
    @GetMapping("/product")
    public String index() {
        return "/product/index";
    }

}
