package com.oscer.hongxing.controller.manager;

import com.oscer.hongxing.bean.Case;
import com.oscer.hongxing.bean.ProductImage;
import com.oscer.hongxing.common.ApiResult;
import com.oscer.hongxing.common.CategoryContants;
import com.oscer.hongxing.common.FormatUtil;
import com.oscer.hongxing.common.IpUtil;
import com.oscer.hongxing.dao.CategoryDAO;
import com.oscer.hongxing.service.QiNiuService;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 后台管理页面-资讯
 *
 * @author MRCHENIKE
 * @create 2022-08-21 14:46
 **/
@Controller
@Slf4j
public class ManageNewsController extends ManagerBaseController {

    /**
     * 基础页面路径
     */
    private static final String BASE_PAGE_URL = "/manager/page/news/";

    /**
     * 添加新闻
     *
     * @return
     */
    @GetMapping("/manage/news_edit")
    public String news_edit() {
        request.setAttribute("categorys", CategoryDAO.ME.listByType(CategoryContants.Type.EXAMPLE.getCode()));
        return BASE_PAGE_URL + "news_edit";
    }

    /**
     * 添加新闻
     *
     * @return
     */
    @PostMapping("/manage/news_edit_post")
    @ResponseBody
    public ApiResult news_edit_post(Case item) {
        item.setCreate_ip(IpUtil.getIpAddress(request));
        item.setSort(System.currentTimeMillis());
        item.setContent(QiNiuService.uploadFromThird(item.getContent(), "product"));
        Elements images = FormatUtil.getImages(item.getContent());
        if (images != null) {
            String imageUrl = images.get(0).attr("src");
            item.setBanner(imageUrl);
        }
        item.save(true);
        return ApiResult.success();
    }

    /**
     * 新闻列表
     *
     * @return
     */
    @GetMapping("/manage/news")
    public String news() {
        return BASE_PAGE_URL + "news";
    }

    /**
     * 添加分类
     *
     * @return
     */
    @GetMapping("/manage/news_column_edit")
    public String news_column_edit() {
        return BASE_PAGE_URL + "news_column_edit";
    }


    /**
     * 分类列表
     *
     * @return
     */
    @GetMapping("/manage/news_column")
    public String news_column() {
        return BASE_PAGE_URL + "news_column";
    }

    /**
     * 评论列表
     *
     * @return
     */
    @GetMapping("/manage/news_comment")
    public String news_comment() {
        return BASE_PAGE_URL + "news_comment";
    }

}
