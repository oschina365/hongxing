package com.oscer.hongxing.controller;

import com.oscer.hongxing.bean.Opt;
import com.oscer.hongxing.bean.Product;
import com.oscer.hongxing.common.ApiResult;
import com.oscer.hongxing.dao.OptDAO;
import com.oscer.hongxing.dao.ProductDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author kz
 * @since 2022-09-06 11:44:36
 */
@Controller
@RequestMapping("/search")
public class SearchController extends BaseController {

    @GetMapping
    public String index(@RequestParam("key") String key) {
        request.setAttribute("searchKey", key);
        if (isMobile()) {
            return "/mobile/search";
        }
        return "search";
    }


    @GetMapping("/data")
    @ResponseBody
    public ApiResult data(
            @RequestParam("key") String key,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "limit", defaultValue = "8") int limit) {
        List<Opt> opts = OptDAO.ME.search(key, page, limit);
        long count = OptDAO.ME.searchCount(key);
        return ApiResult.successWithMapData(opts, count, null);
    }

}
