package com.oscer.hongxing.controller;

import cn.hutool.core.collection.CollectionUtil;
import com.oscer.hongxing.bean.*;
import com.oscer.hongxing.common.ApiResult;
import com.oscer.hongxing.common.CategoryContants;
import com.oscer.hongxing.common.CheckMobile;
import com.oscer.hongxing.common.layui_result.LayuiPhotoResult;
import com.oscer.hongxing.controller.BaseController;
import com.oscer.hongxing.dao.ArticleDAO;
import com.oscer.hongxing.dao.CategoryDAO;
import com.oscer.hongxing.dao.ProductDAO;
import com.oscer.hongxing.dao.ProductImageDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 产品
 *
 * @author kz
 * @since 2022-08-18 16:57:08
 */
@RequestMapping("/product")
@Controller
public class ProductController extends BaseController {

    /**
     * 产品聚合列表
     *
     * @return
     */
    @GetMapping
    public String index() {
        request.setAttribute("categorys", CategoryDAO.ME.listByType(CategoryContants.Type.PRODUCT.getCode()));
        return "/product/list";
    }

    /**
     * 产品详情
     *
     * @return
     */
    @GetMapping("/{id}")
    public String index(@PathVariable Long id) {
        String ua = request.getHeader("User-Agent");
        boolean check = CheckMobile.check(ua);
        request.setAttribute("categorys", CategoryDAO.ME.listByType(CategoryContants.Type.PRODUCT.getCode()));
        Product product = Product.ME.get(id);
        Category category = Category.ME.get(product.getCategory_id());
        if (category != null) {
            Category parentCategory = Category.ME.get(category.getParent_id());
            if (parentCategory != null) {
                request.setAttribute("parentCategory", parentCategory);
            }
            product.setCategory_name(category.getName());
        }
        request.setAttribute("product", product);
        List<ProductImage> productImages = (List<ProductImage>) ProductImage.ME.filter(" product_id", product.getId());
        if (CollectionUtil.isNotEmpty(productImages)) {
            List<String> images = new ArrayList<>();
            for (ProductImage productImage : productImages) {
                images.add(productImage.getImage());
            }
            request.setAttribute("images", images);
            request.setAttribute("productImages", productImages);
        }
        request.setAttribute("articleRandoms", ArticleDAO.ME.randomList(10));
        if (check) {
            request.setAttribute("articleRandoms", ArticleDAO.ME.randomList(check ? 5 : 10));
            request.setAttribute("randomProducts", ProductDAO.ME.randomList(4));
            return "/product/index_mobile";
        }
        return "/product/index";
    }

    /**
     * 产品图片列表
     *
     * @return
     */
    @GetMapping("/images/{id}")
    @ResponseBody
    public LayuiPhotoResult productImages(@PathVariable Long id) {
        Product product = Product.ME.get(id);
        if (product == null) {
            return null;
        }
        List<ProductImage> images = ProductImageDAO.ME.listByProductId(id);
        if (CollectionUtil.isEmpty(images)) {
            return null;
        }
        LayuiPhotoResult result = new LayuiPhotoResult();
        List<LayuiPhotoResult.DataBean> dataBeans = new ArrayList<>();
        for (ProductImage image : images) {
            LayuiPhotoResult.DataBean dataBean = new LayuiPhotoResult.DataBean();
            dataBean.setPid(image.getId());
            dataBean.setSrc(image.getImage());
            dataBeans.add(dataBean);
        }
        result.setStatus(1);
        result.setData(dataBeans);
        result.setId(id);
        result.setStart(1);
        result.setTitle(product.getName());
        return result;
    }

    /**
     * 产品分类列表
     *
     * @return
     */
    @GetMapping("/category/{id}")
    public String productCategory(@PathVariable Long id) {
        Category category = Category.ME.get(id);
        if (category == null || category.getType() != CategoryContants.Type.PRODUCT.getCode()) {
            return "index";
        }
        Category parentCategory = Category.ME.get(category.getParent_id());
        if (parentCategory != null) {
            request.setAttribute("parentCategory", parentCategory);
        }
        request.setAttribute("currentCategory", category);
        request.setAttribute("categorys", CategoryDAO.ME.listByType(CategoryContants.Type.PRODUCT.getCode()));
        return "/product/product_category";
    }

    /**
     * 分页查询产品列表-某个产品分类
     *
     * @param categoryId
     * @param page
     * @param limit
     * @return
     */
    @GetMapping("/list/{id}")
    @ResponseBody
    public ApiResult page(@RequestParam(value = "categoryId") Long categoryId,
                          @RequestParam(value = "page", defaultValue = "1") int page,
                          @RequestParam(value = "limit", defaultValue = "6") int limit) {
        Category category = Category.ME.get(categoryId);
        if (category == null || category.getType() != CategoryContants.Type.PRODUCT.getCode()) {
            return ApiResult.fail();
        }
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
        List<Product> list = ProductDAO.ME.page(categoryIds, page, limit);
        long count = ProductDAO.ME.count(categoryIds);
        return ApiResult.successWithMapData(list, count, null);
    }

    /**
     * 分页查询产品列表-聚合
     *
     * @param page
     * @param limit
     * @return
     */
    @GetMapping("/list")
    @ResponseBody
    public ApiResult page(@RequestParam(value = "page", defaultValue = "1") int page,
                          @RequestParam(value = "limit", defaultValue = "6") int limit) {
        List<Product> list = ProductDAO.ME.page(page, limit);
        long count = ProductDAO.ME.count();
        return ApiResult.successWithMapData(list, count, null);
    }

}
