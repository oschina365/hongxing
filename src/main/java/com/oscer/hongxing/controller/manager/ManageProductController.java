package com.oscer.hongxing.controller.manager;

import cn.hutool.core.collection.CollectionUtil;
import com.oscer.hongxing.bean.Category;
import com.oscer.hongxing.bean.Entity;
import com.oscer.hongxing.bean.Product;
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
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 后台管理页面-产品
 *
 * @author MRCHENIKE
 * @create 2022-08-21 14:46
 **/
@Controller
@Slf4j
public class ManageProductController extends ManagerBaseController {

    /**
     * 基础页面路径
     */
    private static final String BASE_PAGE_URL = "/manager/page/product/";

    /**
     * 添加产品
     *
     * @return
     */
    @GetMapping("/manage/products_edit")
    public String products_edit() {
        request.setAttribute("categorys", CategoryDAO.ME.listByType(CategoryContants.Type.PRODUCT.getCode()));
        return BASE_PAGE_URL + "products_edit";
    }

    /**
     * 添加产品
     *
     * @return
     */
    @PostMapping("/manage/products_edit_post")
    @ResponseBody
    public ApiResult products_edit_post(Product product) {
        product.setCreate_ip(IpUtil.getIpAddress(request));
        product.setSort(System.currentTimeMillis());
        product.setContent(QiNiuService.uploadFromThird(product.getContent(), "product"));

        long productId = product.save();
        Elements images = FormatUtil.getImages(product.getContent());
        if (images != null) {
            for (int i = 0; i < images.size(); i++) {
                String imageUrl = images.get(i).attr("src");
                if(i==0){
                    product.setBanner(imageUrl);
                    product.doUpdate(true);
                }
                ProductImage productImage = new ProductImage();
                productImage.setProduct_id(productId);
                productImage.setImage(imageUrl);
                productImage.setSort(System.currentTimeMillis());
                productImage.setCreate_ip(product.getCreate_ip());
                productImage.save();
            }
        }
        return ApiResult.success();
    }

    /**
     * 产品列表
     *
     * @return
     */
    @GetMapping("/manage/products")
    public String products() {
        request.setAttribute("categorys", CategoryDAO.ME.listByType(CategoryContants.Type.PRODUCT.getCode()));
        List<Product> list = (List<Product>) Product.ME.list(true);
        if (CollectionUtil.isNotEmpty(list)) {
            for (Product product : list) {
                Category category = Category.ME.get(product.getCategory_id());
                if (category != null) {
                    product.setCategory_name(category.getName());
                }
            }
        }
        request.setAttribute("products", list);
        return BASE_PAGE_URL + "products";
    }

    /**
     * 添加分类
     *
     * @return
     */
    @GetMapping("/manage/product_column_edit")
    public String product_column_edit() {
        request.setAttribute("categorys", CategoryDAO.ME.listByType(CategoryContants.Type.PRODUCT.getCode()));
        return BASE_PAGE_URL + "product_column_edit";
    }

    /**
     * 添加分类
     *
     * @return
     */
    @PostMapping("/manage/product_column_edit_post")
    @ResponseBody
    public ApiResult product_column_edit_post(Category category) {
        if (category == null) {
            return ApiResult.failWithMessage("分类名称为空");
        }
        category.setType(CategoryContants.Type.PRODUCT.getCode());
        category.setCreate_ip(IpUtil.getIpAddress(request));
        category.setSort(CategoryDAO.ME.getSort(category.getType(), category.getParent_id()));
        category.save();
        CategoryDAO.ME.setSort(category.getType(), category.getParent_id(), category.getSort());
        return ApiResult.success();
    }

    /**
     * 产品分类
     *
     * @return
     */
    @GetMapping("/manage/product_column")
    public String product_column() {
        request.setAttribute("categorys", CategoryDAO.ME.listByType(CategoryContants.Type.PRODUCT.getCode()));
        return BASE_PAGE_URL + "product_column";
    }

    /**
     * 产品评论
     *
     * @return
     */
    @GetMapping("/manage/product_comment")
    public String product_comment() {
        return BASE_PAGE_URL + "product_comment";
    }

}
