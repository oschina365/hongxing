package com.oscer.hongxing.controller;

import cn.hutool.core.collection.CollectionUtil;
import com.oscer.hongxing.bean.*;
import com.oscer.hongxing.common.ApiResult;
import com.oscer.hongxing.common.CategoryContants;
import com.oscer.hongxing.common.CheckMobile;
import com.oscer.hongxing.common.IpUtil;
import com.oscer.hongxing.controller.BaseController;
import com.oscer.hongxing.dao.ArticleDAO;
import com.oscer.hongxing.dao.CategoryDAO;
import com.oscer.hongxing.dao.ProductDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 文章
 * @author kz
 * @since 2022-08-18 16:57:08
 */
@RequestMapping("/article")
@Controller
public class ArticleController extends BaseController {

    /**
     * 分页查询案例列表
     *
     * @param categoryId
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public ApiResult page(@RequestParam(value = "categoryId", required = false) Long categoryId,
                          @RequestParam(value = "page", defaultValue = "1") int page,
                          @RequestParam(value = "limit", defaultValue = "6") int limit) {
        Category category = null;
        if (categoryId == null || categoryId <= 0L) {
            category = (Category) CategoryDAO.ME.getByIdent(Category.SUCCESS_ARTICLE);
        } else {
            category = Category.ME.get(categoryId);
        }
        if (category == null) {
            return ApiResult.fail();
        }
        categoryId = category.getId();
        List<Long> categoryIds = new ArrayList<>();
        if (category.getParent_id() == 0) {
            List<Category> childs = CategoryDAO.ME.childsByParentId(categoryId);
            if (CollectionUtil.isEmpty(childs)) {
                return ApiResult.fail();
            }
            categoryIds = childs.stream().filter(Objects::nonNull).map(Entity::getId).collect(Collectors.toList());
        } else {
            categoryIds.add(category.getId());
        }
        List<Article> list = ArticleDAO.ME.page(categoryIds, page, limit);
        long count = ArticleDAO.ME.count(categoryIds);
        return ApiResult.successWithMapData(list, count, null);
    }

    /**
     * 文章详情（即案例或者新闻资讯详情）
     *
     * @return
     */
    @GetMapping("/{id}")
    public String index(@PathVariable Long id) {
        String ua = request.getHeader("User-Agent");
        boolean check = CheckMobile.check(ua);
        Article article = Article.ME.get(id);
        Category category = Category.ME.get(article.getCategory_id());
        if (category != null) {
            article.setCategory_name(category.getName());
        }
        request.setAttribute("article", article);
        Article articlePrev = ArticleDAO.ME.randomOne();
        request.setAttribute("articlePrev", articlePrev);
        request.setAttribute("articleLast", ArticleDAO.ME.randomOne(articlePrev.getId()));
        request.setAttribute("articleRandoms", ArticleDAO.ME.randomList(check ? 5 : 10));
        request.setAttribute("articleLists", ArticleDAO.ME.listLimitByCategory(category.getId(), 10));

        Category currentCategory = Category.ME.get(article.getCategory_id());
        if (currentCategory != null) {
            request.setAttribute("currentCategoryName", currentCategory.getName());
            request.setAttribute("currentCategoryId", currentCategory.getId());
            if (currentCategory.getParent_id() > 0L) {
                Category parentCategory = Category.ME.get(currentCategory.getParent_id());
                if (parentCategory != null) {
                    request.setAttribute("parentCategoryName", parentCategory.getName());
                    request.setAttribute("parentCategoryId", parentCategory.getId());
                }
            }
        }
        if (check) {
            request.setAttribute("randomProducts", ProductDAO.ME.randomList(4));
            return "/p/index_mobile";
        }
        return "/article/index";
    }

}
