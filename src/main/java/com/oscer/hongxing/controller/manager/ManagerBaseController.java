package com.oscer.hongxing.controller.manager;


import cn.dev33.satoken.stp.StpUtil;
import com.oscer.hongxing.dao.CategoryDAO;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Map;


/**
 * @author kz
 * @date 2017年12月1日14:32:07
 */
public class ManagerBaseController {
    public final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired(required = false)
    protected HttpServletRequest request;

    @Autowired(required = false)
    protected HttpServletResponse response;

    public static final long TIME_OUT = 1000L * 60 * 60 * 24 * 365;

    public Integer pageSize = 10;

    public Integer pageNumber = 1;

    public Map<String, Cookie> cookies;

    public final static String UTF_8 = "UTF-8";

    public final static String COOKIE_LOGIN = "uid";

    public final static int MAX_AGE = 86400 * 365;

    public final static byte[] E_KEY = new byte[]{'.', 'O', 'S', 'C', 'E', 'R', 'S', 'S'};

    /**
     * 一开始cookie中存的字段信息长度
     */
    public final static int COOKIE_LENGTH_START = 5;
    /**
     * 现在扩展的cookie中存的字段信息长度
     */
    public final static int COOKIE_LENGTH_END = 8;

    /**
     * 换算单位为毫秒的除数
     */
    public final static BigDecimal divisor = new BigDecimal(1000000);


    @ModelAttribute
    protected void setRequest() throws IOException {
        //第几页
        String number = request.getParameter("number");
        String size = request.getParameter("size");
        this.request = request;
        request.setAttribute("currentUrl", request.getRequestURI());
    }

    public boolean logined() {
        return StpUtil.isLogin() ? true : false;
    }


}
