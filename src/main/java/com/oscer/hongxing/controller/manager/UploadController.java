package com.oscer.hongxing.controller.manager;

import com.oscer.hongxing.bean.Category;
import com.oscer.hongxing.common.ApiResult;
import com.oscer.hongxing.common.CategoryContants;
import com.oscer.hongxing.controller.BaseController;
import com.oscer.hongxing.dao.CategoryDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
        request.setAttribute("categorys", CategoryDAO.ME.listByType(CategoryContants.Type.PHOTO.getCode()));
        return BASE_PAGE_URL + "GalleryWindow";
    }

    @GetMapping("/manage/SearchTemplates")
    public String SearchTemplates() {
        return BASE_PAGE_URL + "SearchTemplates";
    }

    @GetMapping("/manage/SearchImages")
    public String SearchImages() {
        request.setAttribute("categorys", CategoryDAO.ME.listByType(CategoryContants.Type.PHOTO.getCode()));
        return BASE_PAGE_URL + "SearchImages";
    }

    /**
     * 添加分类-相册
     *
     * @return
     */
    @PostMapping("/manage/saveImageCategory")
    @ResponseBody
    public ApiResult saveImageCategory(Category category) {
        if (category == null) {
            return ApiResult.failWithMessage("分类名称为空");
        }
        category.setType(CategoryContants.Type.PHOTO.getCode());
        category.save();
        return ApiResult.success();
    }
}
