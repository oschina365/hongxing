package com.oscer.hongxing.controller;

import cn.hutool.core.collection.CollectionUtil;
import com.oscer.hongxing.bean.*;
import com.oscer.hongxing.common.ApiResult;
import com.oscer.hongxing.common.CategoryContants;
import com.oscer.hongxing.controller.BaseController;
import com.oscer.hongxing.dao.ArticleDAO;
import com.oscer.hongxing.dao.CategoryDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author kz
 * @since 2022-08-18 16:57:08
 */
@RequestMapping("/p")
@Controller
public class ArticleController extends BaseController {

    /**
     * 分页查询案例列表
     *
     * @param categoryId
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public ApiResult page(@RequestParam(value = "categoryId", required = false) Long categoryId,
                          @RequestParam(value = "page", defaultValue = "1") int page,
                          @RequestParam(value = "limit", defaultValue = "6") int size) {
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
        List<Article> list = ArticleDAO.ME.page(categoryIds, page, size);
        long count = ArticleDAO.ME.count(categoryIds);
        return ApiResult.successWithMapData(list, count, null);
    }

    /**
     * 案例
     *
     * @return
     */
    @GetMapping("/{id}")
    public String index(@PathVariable Long id) {
        Article article = Article.ME.get(id);
        Category category = Category.ME.get(article.getCategory_id());
        if (category != null) {
            article.setCategory_name(category.getName());
        }
        request.setAttribute("article", article);
        Article articlePrev = ArticleDAO.ME.randomOne();
        request.setAttribute("articlePrev", articlePrev);
        request.setAttribute("articleLast", ArticleDAO.ME.randomOne(articlePrev.getId()));
        request.setAttribute("articleRandoms", ArticleDAO.ME.randomList(10));
        return "/p/index";
    }

}
