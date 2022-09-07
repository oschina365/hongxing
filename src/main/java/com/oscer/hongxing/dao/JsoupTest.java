package com.oscer.hongxing.dao;

import cn.hutool.core.util.StrUtil;
import com.oscer.hongxing.bean.*;
import com.oscer.hongxing.common.ConfigTool;
import com.oscer.hongxing.common.DateUtil;
import com.oscer.hongxing.common.FileUtil;
import com.oscer.hongxing.common.FormatUtil;
import com.oscer.hongxing.service.QiNiuApi;
import com.oscer.hongxing.service.QiNiuService;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;


public class JsoupTest {

    /**
     * 读HTML文件
     *
     * @param path
     * @return
     */
    public static String readHtml(String path) {
        StringBuffer buff = new StringBuffer();
        // 建立一个对象，它把文件内容转成计算机能读懂的语言
        try (FileReader reader = new FileReader(path); BufferedReader br = new BufferedReader(reader)) {
            String line;
            int count = 0;
            while ((line = br.readLine()) != null) {
                // 一次读入一行数据
                buff.append(line);
                count++;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return buff.toString();
    }

    /**
     * jsoup方法中 text() :用于获取获取标签的文本 html() ：获取标签里面的所有字符串包括html标签
     * attr(attributeKey)获取属性里面的值，参数是属性名称
     */
    public static void main(String[] args) throws Exception {
        jsoupArticle();
    }

    public static void articleCompare() {
        List<Article> old = ArticleDAO.ME.old();
        for (Article article : old) {
            Article article1 = ArticleDAO.ME.getByName(article.getName());
            if (article1 == null) {
                article.setId(null);
                System.out.println("保存文章：" + article.getName());
                article.save();
            }
        }
    }

    /**
     * 恢复案例
     *
     * @throws IOException
     */
    private static void jsoupArticle() throws Exception {
        String aaa = "http://hongxin.com.cn/uploadfiles/pictures/news/20161021175002_9529.jpg";
        System.out.println(FileUtil.getFilename(aaa));
        String filename1 = FileUtil.getFilename(aaa);
        Date date = DateUtil.parseDate(filename1.split("_")[0], DateUtil.YYYYMMDDHHMMSS);
        System.out.println(date.getTime());
        /*String aaaa="20170522110442_2060";
        System.out.println(aaaa.split("_")[0]);*/

        String basePath = "D:\\works\\mine\\hongxing\\htdocs\\Article";
        List<Path> pathList = Files.walk(Paths.get(basePath))
                .filter(Files::isRegularFile)
                .collect(Collectors.toList());
        new QiNiuApi(ConfigTool.getProp("qiniu.access"), ConfigTool.getProp("qiniu.secret"), ConfigTool.getProp("qiniu.bucket"));
        for (Path path : pathList) {
            File file = path.toFile();
            String filePath = file.getPath();
            try {
                // 本地html存放路径
                String file_path = filePath;
                // 读取html获取文档
                String html = readHtml(file_path);
                Document document = Jsoup.parse(html);
                // 通过select获取元素
                // 一个页面中的class可能会重复，为避免取多余的数据，
                // 先取部分区域的数据，然后再从这部分区域数据中取出真正需要的数据
                // 格式： class用"#"、id用"."、标签用h1  例如：   div.title_area>h1

                Elements aa = document.select("div.pro_curmbs> a");// 外层部分区域标签内的数据
                String categoryName = aa.get(aa.size() - 2).text();
                String articleName = aa.get(aa.size() - 1).text();

                Article exist = ArticleDAO.ME.getByName(articleName);
                if (exist != null && exist.getSort() > 0) {
                    continue;
                }
                System.out.println("保存文章：" + articleName);
                Category category = CategoryDAO.ME.getByName(categoryName);
                if (category == null) {
                    System.out.println("该分类不存在：" + categoryName);
                }
                long categoryId = category == null ? 0L : category.getId();

                Elements da = document.select("div.n_tit");// 外层部分区域标签内的数据
                System.out.println(da.text());
                String str = da.text();
                String regEx = "[^0-9]";
                Pattern p = Pattern.compile(regEx);
                Matcher m = p.matcher(str);
                System.out.println(m.replaceAll("").trim());
                Date date1 = DateUtil.parseDate(m.replaceAll("").trim().split("_")[0], DateUtil.YYYYMMDDHHMMSS);
                String desc = null;
                Elements contentElement = document.select("div#cntrBody");// 外层部分区域标签内的数据
                if (StrUtil.isBlankIfStr(desc)) {
                    desc = StringUtils.abbreviate(contentElement.text(), 100);
                }
                if (exist != null) {
                    exist.setCreate_time(date1);
                    exist.setUpdate_time(date1);
                    exist.setSort(date1.getTime());
                    exist.doUpdate();
                    continue;
                }
                Article article = new Article();
                //article.setContent(QiNiuService.uploadFromThird(contentElement.toString(), "article"));
                article.setDesc(desc);
                article.setCategory_id(categoryId);
                article.setName(articleName);
                Elements images = FormatUtil.getImages(article.getContent());
                if (images != null) {
                    String imageUrl = images.get(0).attr("src");
                    article.setBanner(imageUrl);
                    article.setCreate_time(date1);
                    article.setUpdate_time(date1);
                    article.setSort(date1.getTime());
                }
                //article.save();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        System.out.println("保存案例完毕");
    }

    /**
     * 恢复产品
     *
     * @throws IOException
     */
    private static void jsoupProduct() throws IOException {
        String basePath = "D:\\works\\mine\\hongxing\\htdocs\\Products";
        List<Path> pathList = Files.walk(Paths.get(basePath))
                .filter(Files::isRegularFile)
                .collect(Collectors.toList());
        new QiNiuApi(ConfigTool.getProp("qiniu.access"), ConfigTool.getProp("qiniu.secret"), ConfigTool.getProp("qiniu.bucket"));
        for (Path path : pathList) {
            File file = path.toFile();
            String filePath = file.getPath();
            try {
                // 本地html存放路径
                String file_path = filePath;
                // 读取html获取文档
                String html = readHtml(file_path);
                Document document = Jsoup.parse(html);
                // 通过select获取元素
                // 一个页面中的class可能会重复，为避免取多余的数据，
                // 先取部分区域的数据，然后再从这部分区域数据中取出真正需要的数据
                // 格式： class用"#"、id用"."、标签用h1  例如：   div.title_area>h1
                Elements productNameElement = document.select("h4.corange");// 外层部分区域标签内的数据
                String productName = productNameElement.text();
                Product exist = ProductDAO.ME.getByName(productName);
                if (exist != null) {
                    System.out.println(productName + " 已存在！");
                }
                System.out.println(productName);
                Elements aa = document.select("div.plc> a");// 外层部分区域标签内的数据
                String categoryName = aa.get(aa.size() - 2).text();
                Category category = CategoryDAO.ME.getByName(categoryName);
                if (category == null) {
                    System.out.println("该分类不存在：" + categoryName);
                }
                long categoryId = category == null ? 0L : category.getId();
                Elements descElement = document.select("div.pd_short");// 外层部分区域标签内的数据
                String desc = descElement.text();
                Elements contentElement = document.select("div.proinfo");// 外层部分区域标签内的数据
                if (StrUtil.isBlankIfStr(desc)) {
                    desc = StringUtils.abbreviate(contentElement.text(), 100);
                }
                Product product = new Product();
                product.setName(productName);
                product.setCategory_id(categoryId);
                product.setSort(System.currentTimeMillis());
                product.setDesc(desc);
                product.setContent(QiNiuService.uploadFromThird(contentElement.toString(), "product"));
                long productId = product.save();
                Elements images = FormatUtil.getImages(product.getContent());
                if (images != null) {
                    for (int i = 0; i < images.size(); i++) {
                        String imageUrl = images.get(i).attr("src");
                        if (i == 0) {
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
                System.out.println(productName + "，保存成功！");

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}