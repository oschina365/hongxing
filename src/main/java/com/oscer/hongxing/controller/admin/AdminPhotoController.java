package com.oscer.hongxing.controller.admin;

import cn.hutool.core.collection.CollectionUtil;
import com.oscer.hongxing.bean.Entity;
import com.oscer.hongxing.bean.Photo;
import com.oscer.hongxing.common.ApiResult;
import com.oscer.hongxing.dao.PhotoDAO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 后台管理登录
 *
 * @author kz
 * @create 2022-08-21 14:46
 **/
@Controller
@RequestMapping("/admin/photo")
@Slf4j
public class AdminPhotoController extends AdminBaseController {

    @RequestMapping
    @ResponseBody
    public ApiResult list(@RequestParam(value = "key", required = false) String key,
                          @RequestParam(value = "categoryId", required = false) Long categoryId,
                          @RequestParam(value = "page", defaultValue = "1") int page,
                          @RequestParam(value = "limit", defaultValue = "6") int limit) {

        List<Photo> photos = PhotoDAO.ME.photos(key, categoryId, page, limit);
        long count = PhotoDAO.ME.count(key, categoryId);
        return ApiResult.successWithMapData(photos, count, null);
    }

    @PostMapping("/delete/{id}")
    @ResponseBody
    public ApiResult delete(@PathVariable("id") long id) {
        Photo entity = Photo.ME.get(id);
        entity.delete();
        return ApiResult.success();
    }
}