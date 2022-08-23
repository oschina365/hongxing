package com.oscer.hongxing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 后台管理
 *
 * @author MRCHENIKE
 * @create 2022-08-21 14:46
 **/
@Controller
public class ManageController extends BaseController {

    @GetMapping("/manager")
    public String index() {
        return "/manager/index";
    }


}
