package com.oscer.hongxing.controller.admin;

import cn.hutool.core.collection.CollectionUtil;
import com.oscer.hongxing.bean.Article;
import com.oscer.hongxing.bean.Category;
import com.oscer.hongxing.common.ApiResult;
import com.oscer.hongxing.common.CategoryContants;
import com.oscer.hongxing.common.R;
import com.oscer.hongxing.dao.ArticleDAO;
import com.oscer.hongxing.dao.CategoryDAO;
import com.oscer.hongxing.dao.ItemDAO;
import com.oscer.hongxing.dao.ProductDAO;
import com.oscer.hongxing.vo.CategoryVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台管理登录
 *
 * @author kz
 * @create 2022-08-21 14:46
 **/
@Controller
@RequestMapping("/admin/article")
@Slf4j
public class AdminArticleController extends AdminBaseController {

    /**
     * 案例列表分页查询
     *
     * @param categoryIds
     * @param name
     * @return
     */
    @GetMapping
    @ResponseBody
    public R page(@RequestParam(value = "categoryIds", required = false) List<Long> categoryIds,
                  @RequestParam(value = "name", required = false) String name,
                  @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                  @RequestParam(value = "limit", required = false, defaultValue = "1") int limit) {
        List<Article> articles = ArticleDAO.ME.page(categoryIds, name, page, limit);
        Long count = ArticleDAO.ME.count(categoryIds, name);
        return R.ok(articles, count);
    }

    /**
     * 产品详情
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public String edit(@PathVariable Long id) {
        request.setAttribute("article", Article.ME.get(id));
        request.setAttribute("categorys", CategoryDAO.ME.listByType(CategoryContants.Type.ARTICLE.getCode()));
        return ADMIN_BASE_PAGE + "article/edit";
    }

    /**
     * 查看产品详情
     *
     * @param id
     * @return
     */
    @PostMapping("/{id}")
    @ResponseBody
    public ApiResult category(@PathVariable Long id) {
        Article exist = Article.ME.get(id);
        if (exist == null) {
            return ApiResult.fail();
        }
        List<Long> categoryIds = ItemDAO.ME.listByItem(id, CategoryContants.Type.ARTICLE.getCode());
        List<Category> categoryList = CategoryDAO.ME.allByType(CategoryContants.Type.ARTICLE.getCode());
        List<CategoryVO> vos = new ArrayList<>();
        for (Category category : categoryList) {
            CategoryVO vo = new CategoryVO();
            vo.setTitle(category.getName());
            if (category.getParent_id() > 0) {
                vo.setDisabled(false);
            } else {
                vo.setDisabled(true);
            }
            vo.setValue(category.getId());
            vos.add(vo);
        }
        Map<String, Object> result = new HashMap<>();
        result.put("categoryIds", categoryIds);
        result.put("categoryList", vos);
        return ApiResult.successWithObject(result, null);
    }

    /**
     * 添加产品页面
     *
     * @return
     */
    @PostMapping("/category")
    @ResponseBody
    public ApiResult allCategory() {
        List<Category> categoryList = CategoryDAO.ME.allByType(CategoryContants.Type.ARTICLE.getCode());
        List<CategoryVO> vos = new ArrayList<>();
        for (Category category : categoryList) {
            CategoryVO vo = new CategoryVO();
            vo.setTitle(category.getName());
            if (category.getParent_id() > 0) {
                vo.setDisabled(false);
            } else {
                vo.setDisabled(true);
            }
            vo.setValue(category.getId());
            vos.add(vo);
        }
        Map<String, Object> result = new HashMap<>();
        result.put("categoryList", vos);
        return ApiResult.successWithObject(result, null);
    }

    /**
     * 产品列表分页查询
     *
     * @param article
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public ApiResult edit(Article article) {
        if (!logined()) {
            return ApiResult.failWithMessage("未登录");
        }
        if (article == null) {
            return ApiResult.fail();
        }
        if (CollectionUtil.isEmpty(article.getSelectCategoryIds())) {
            return ApiResult.failWithMessage("请选择产品分类");
        }
        if (article.getSelectCategoryIds().size() > 5) {
            return ApiResult.failWithMessage("最多关联5个产品分类");
        }
        ArticleDAO.ME.edit(article);
        return ApiResult.success();
    }

    /**
     * 产品列表分页查询
     *
     * @param id
     * @return
     */
    @PostMapping("/delete/{id}")
    @ResponseBody
    public ApiResult delete(@PathVariable Long id) {
        if (!logined()) {
            return ApiResult.failWithMessage("未登录");
        }
        ArticleDAO.ME.delete(id);
        return ApiResult.success();
    }


}