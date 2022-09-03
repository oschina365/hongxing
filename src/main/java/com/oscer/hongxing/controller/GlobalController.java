package com.oscer.hongxing.controller;

import cn.hutool.core.collection.CollectionUtil;
import com.oscer.hongxing.bean.Article;
import com.oscer.hongxing.bean.Category;
import com.oscer.hongxing.bean.Product;
import com.oscer.hongxing.common.CategoryContants;
import com.oscer.hongxing.common.CheckMobile;
import com.oscer.hongxing.common.IpUtil;
import com.oscer.hongxing.dao.ArticleDAO;
import com.oscer.hongxing.dao.CategoryDAO;
import com.oscer.hongxing.dao.ProductDAO;
import com.oscer.hongxing.vo.ArticleSuccessVO;
import lombok.extern.slf4j.Slf4j;
import org.checkerframework.checker.units.qual.A;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @author kz
 * @since 2022-08-18 16:57:08
 */
@Controller
@Slf4j
public class GlobalController extends BaseController {

    /**
     * 首页
     *
     * @return
     */
    @GetMapping
    public String index() {
        String ipAddress = IpUtil.getIpAddress(request);
        String ua = request.getHeader("User-Agent");
        boolean check = CheckMobile.check(ua);
        if (check) {
            log.info("{},来自移动端访问,ua={}", ipAddress, ua);
            return "index_mobile";
        }
        request.setAttribute("categorys", CategoryDAO.ME.listByType(CategoryContants.Type.PRODUCT.getCode()));
        List<Category> otherChilds = CategoryDAO.ME.childsByType(CategoryContants.Type.PRODUCT.getCode(), "other");
        if (CollectionUtil.isNotEmpty(otherChilds)) {
            List<Category> otherChildList = new ArrayList<>();
            for (Category child : otherChilds) {
                List<Product> products = ProductDAO.ME.listByCategory(child.getId());
                if (CollectionUtil.isEmpty(products)) {
                    continue;
                }
                child.setProducts(products);
                otherChildList.add(child);
            }
            request.setAttribute("otherChilds", otherChildList);
        }
        List<Category> successArticles = CategoryDAO.ME.childsByType(CategoryContants.Type.ARTICLE.getCode(), Category.SUCCESS_ARTICLE);
        if (CollectionUtil.isNotEmpty(successArticles)) {
            List<ArticleSuccessVO> articleSuccessVOS = new ArrayList<>();
            for (Category successArticle : successArticles) {
                Long categoryId = successArticle.getId();
                String categoryName = successArticle.getName();
                ArticleSuccessVO vo = new ArticleSuccessVO();
                vo.setCategoryId(categoryId);
                vo.setCategoryName(categoryName);
                List<Article> articles = ArticleDAO.ME.listLimitByCategory(categoryId, 6);
                if (CollectionUtil.isNotEmpty(articles)) {
                    List<ArticleSuccessVO.Articles> articlesList = new ArrayList<>();
                    for (Article article : articles) {
                        ArticleSuccessVO.Articles item = new ArticleSuccessVO.Articles();
                        item.setImage(article.getBanner());
                        item.setArticleId(article.getId());
                        item.setName(article.getName());
                        articlesList.add(item);
                    }
                    vo.setArticles(articlesList);
                }
                articleSuccessVOS.add(vo);
            }
            request.setAttribute("successArticles", articleSuccessVOS);
        }
        request.setAttribute("randomArticles", ArticleDAO.ME.randomList(4));
        log.info("{},来自PC端访问,ua={}", ipAddress, ua);
        return "index";
    }

    /**
     * 工程案例
     *
     * @return
     */
    @GetMapping("/gcal")
    public String gcal(@RequestParam(value = "id", required = false) Long id) {
        List<Category> successArticleCategorys = CategoryDAO.ME.childsByType(CategoryContants.Type.ARTICLE.getCode(), Category.SUCCESS_ARTICLE);
        List<Category> newsArticleCategorys = CategoryDAO.ME.childsByType(CategoryContants.Type.ARTICLE.getCode(), Category.NEWS_ARTICLE);
        request.setAttribute("successArticleCategorys", successArticleCategorys);
        request.setAttribute("newsArticleCategorys", newsArticleCategorys);
        request.setAttribute("currentCategoryId", id);
        return "cgal";
    }

    /**
     * 办公家具定制
     *
     * @return
     */
    @GetMapping("/dzfw")
    public String dzfw() {
        return "dzfw";
    }

    /**
     * 直营展厅
     *
     * @return
     */
    @GetMapping("/zyzt")
    public String zyzt() {
        return "zyzt";
    }

    /**
     * 荣誉资质
     *
     * @return
     */
    @GetMapping("ryzz")
    public String ryzz() {
        return "ryzz";
    }

    /**
     * 关于我们
     *
     * @return
     */
    @GetMapping("/about")
    public String about() {
        return "about";
    }

    /**
     * 联系我们
     *
     * @return
     */
    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    /**
     * 代理品牌
     *
     * @return
     */
    @GetMapping("/dlpp")
    public String dlpp() {
        return "dlpp";
    }

    /**
     * 工厂实力
     *
     * @return
     */
    @GetMapping("/gcsl")
    public String gcsl() {
        return "gcsl";
    }

    /**
     * 网站地图
     *
     * @return
     */
    @GetMapping("/sitemap")
    public String sitemap() {
        return "sitemap";
    }


    /**
     * 在线留言
     *
     * @return
     */
    @GetMapping("/leaveword")
    public String leaveword() {
        return "leaveword";
    }

}
