package com.oscer.hongxing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author kz
 * @since 2022-08-18 16:57:08
 */
@Controller
public class IndexController {

    @GetMapping
    public String index() {
        return "index.html";
    }
}
