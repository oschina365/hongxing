package com.oscer.hongxing.controller.product;

import cn.hutool.core.collection.CollectionUtil;
import com.oscer.hongxing.bean.Category;
import com.oscer.hongxing.bean.Entity;
import com.oscer.hongxing.bean.Product;
import com.oscer.hongxing.bean.ProductImage;
import com.oscer.hongxing.common.CategoryContants;
import com.oscer.hongxing.common.CheckMobile;
import com.oscer.hongxing.controller.BaseController;
import com.oscer.hongxing.dao.ArticleDAO;
import com.oscer.hongxing.dao.CategoryDAO;
import com.oscer.hongxing.dao.ProductDAO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.ArrayList;
import java.util.List;

/**
 * 产品
 *
 * @author kz
 * @since 2022-08-18 16:57:08
 */
@Controller
public class ProductController extends BaseController {

    /**
     * 产品详情
     *
     * @return
     */
    @GetMapping("/product/{id}")
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

}
