package com.oscer.hongxing.controller;

import com.oscer.hongxing.common.CheckMobile;
import com.oscer.hongxing.common.IpUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
        log.info("{},来自PC端访问,ua={}", ipAddress, ua);
        return "index";
    }

    /**
     * 工程案例
     *
     * @return
     */
    @GetMapping("/gcal")
    public String gcal() {
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
