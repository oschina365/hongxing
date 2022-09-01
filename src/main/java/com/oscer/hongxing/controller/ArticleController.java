package com.oscer.hongxing.controller;

import cn.hutool.core.collection.CollectionUtil;
import com.oscer.hongxing.bean.Article;
import com.oscer.hongxing.bean.Category;
import com.oscer.hongxing.bean.Product;
import com.oscer.hongxing.bean.ProductImage;
import com.oscer.hongxing.common.CategoryContants;
import com.oscer.hongxing.controller.BaseController;
import com.oscer.hongxing.dao.ArticleDAO;
import com.oscer.hongxing.dao.CategoryDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.ArrayList;
import java.util.List;

/**
 * @author kz
 * @since 2022-08-18 16:57:08
 */
@Controller
public class ArticleController extends BaseController {

    /**
     * 案例
     *
     * @return
     */
    @GetMapping("/p/{id}")
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
