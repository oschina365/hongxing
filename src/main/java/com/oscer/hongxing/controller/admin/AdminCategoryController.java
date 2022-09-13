package com.oscer.hongxing.controller.admin;

import cn.hutool.core.collection.CollectionUtil;
import com.oscer.hongxing.bean.Category;
import com.oscer.hongxing.bean.Entity;
import com.oscer.hongxing.bean.Product;
import com.oscer.hongxing.common.ApiResult;
import com.oscer.hongxing.common.CategoryContants;
import com.oscer.hongxing.common.R;
import com.oscer.hongxing.dao.CategoryDAO;
import com.oscer.hongxing.dao.ItemDAO;
import com.oscer.hongxing.dao.ProductDAO;
import com.oscer.hongxing.vo.CategoryVO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
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
@RequestMapping("/admin/category")
@Slf4j
public class AdminCategoryController extends AdminBaseController {

    /**
     * 产品列表分页查询
     *
     * @param type
     * @param name
     * @return
     */
    @GetMapping
    @ResponseBody
    public R page(@RequestParam(value = "type", required = false) Integer type,
                  @RequestParam(value = "name", required = false) String name,
                  @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                  @RequestParam(value = "limit", required = false, defaultValue = "1") int limit) {
        List<Category> list = CategoryDAO.ME.page(type, name, page, limit);
        long count = CategoryDAO.ME.count(type, name);
        if (CollectionUtil.isNotEmpty(list)) {
            for (Category category : list) {
                Category parent = Category.ME.get(category.getParent_id());
                if (parent != null) {
                    category.setParent_category_name(parent.getName());
                } else {
                    category.setParent_category_name("顶级分类");
                }
            }
        }
        return R.ok(list, count);
    }

    /**
     * 产品详情
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public String edit(@PathVariable Long id) {
        Category category = Category.ME.get(id);
        request.setAttribute("category", Category.ME.get(id));
        request.setAttribute("categorys", CategoryDAO.ME.parentList(category.getType()));
        return ADMIN_BASE_PAGE + "product_category/edit";
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
        Product exist = Product.ME.get(id);
        if (exist == null) {
            return ApiResult.fail();
        }
        List<Long> categoryIds = ItemDAO.ME.listByItem(id, CategoryContants.Type.PRODUCT.getCode());
        List<Category> categoryList = CategoryDAO.ME.allByType(CategoryContants.Type.PRODUCT.getCode());
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
        List<Category> categoryList = CategoryDAO.ME.allByType(CategoryContants.Type.PRODUCT.getCode());
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
     * @param category
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public ApiResult edit(Category category) {
        if (category == null) {
            return ApiResult.fail();
        }
        if (StringUtils.isBlank(category.getName())) {
            return ApiResult.failWithMessage("请填写产品分类名称");
        }
        Category exist = CategoryDAO.ME.getByName(category.getName());
        if (exist != null && !exist.getId().equals(category.getId())) {
            return ApiResult.failWithMessage("改分类名称已经存在");
        }
        category.doUpdate(true);
        return ApiResult.success();
    }


}