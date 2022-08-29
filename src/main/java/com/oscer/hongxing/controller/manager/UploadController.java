package com.oscer.hongxing.controller.manager;

import com.oscer.hongxing.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author kz
 * @since 2022-08-29 19:06:36
 */
@Controller
public class UploadController extends BaseController {

    /**
     * 基础页面路径
     */
    private static final String BASE_PAGE_URL = "/manager/page/upload/";

    @GetMapping("/manage/Html5Gallery")
    public String Html5Gallery() {
        return BASE_PAGE_URL + "Html5Gallery";
    }

    @GetMapping("/manage/GalleryWindow")
    public String GalleryWindow() {
        return BASE_PAGE_URL + "GalleryWindow";
    }

    @GetMapping("/manage/SearchTemplates")
    public String SearchTemplates() {
        return BASE_PAGE_URL + "SearchTemplates";
    }

    @GetMapping("/manage/SearchImages")
    public String SearchImages() {
        return BASE_PAGE_URL + "SearchImages";
    }
}
