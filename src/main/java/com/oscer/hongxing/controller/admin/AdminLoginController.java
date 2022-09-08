package com.oscer.hongxing.controller.admin;

import cn.dev33.satoken.SaManager;
import cn.dev33.satoken.config.SaTokenConfig;
import cn.dev33.satoken.context.model.SaStorage;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.StrUtil;
import com.oscer.hongxing.bean.Article;
import com.oscer.hongxing.bean.Entity;
import com.oscer.hongxing.bean.Product;
import com.oscer.hongxing.bean.User;
import com.oscer.hongxing.common.*;
import com.oscer.hongxing.dao.CategoryDAO;
import com.oscer.hongxing.dao.UserDAO;
import com.oscer.hongxing.db.CacheMgr;
import com.oscer.hongxing.vo.AdminDataVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

import static com.oscer.hongxing.common.DateUtil.YYYY_MM_DD_HH_MM_SS;

/**
 * 后台管理登录
 *
 * @author MRCHENIKE
 * @create 2022-08-21 14:46
 **/
@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminLoginController extends AdminBaseController {

    @GetMapping
    public String login() {
        return ADMIN_BASE_PAGE + "/login/index";
    }

    @GetMapping("/data")
    @ResponseBody
    public ApiResult data() {
        AdminDataVO vo = new AdminDataVO();
        vo.setCountProduct(Product.ME.totalCount());
        vo.setCountProductCategory(CategoryDAO.ME.countByType(CategoryContants.Type.PRODUCT.getCode()));
        vo.setCountArticle(Article.ME.totalCount());
        vo.setCountArticleCategory(CategoryDAO.ME.countByType(CategoryContants.Type.ARTICLE.getCode()));
        Object loginId = StpUtil.getLoginId();
        User user = User.ME.get(Long.parseLong(loginId.toString()));
        vo.setLastLoginTime(DateUtil.format(user.getLogin_time(), YYYY_MM_DD_HH_MM_SS));
        vo.setLastLoginIp(user.getLogin_ip());
        return ApiResult.successWithObject(vo);
    }

    @GetMapping("/index")
    public String index() {
        if (!StpUtil.isLogin()) {
            return login();
        }
        Object loginId = StpUtil.getLoginId();
        if (loginId != null) {
            request.setAttribute("user", User.ME.get(Long.parseLong(loginId.toString())));
        }
        return "/admin/index";
    }

    /**
     * 登录
     *
     * @param username
     * @param password
     * @return
     * @throws Exception
     */
    @PostMapping("/login")
    @ResponseBody
    public ApiResult doLogin(String username, String password) throws Exception {
        // 此处仅作模拟示例，真实项目需要从数据库中查询数据进行比对
        User user = UserDAO.ME.getUserByUserNameOrPhone(username);
        if (user == null) {
            return ApiResult.failWithMessage("用户不存在");
        }

        if (!StrUtil.equals(user.getSalt(), AESUtils.Encrypt(password, AESUtils.KEY))) {
            return ApiResult.failWithMessage("密码不对");
        }
        user.setLogin_ip(IpUtil.getIpAddress(request));
        user.setLogin_time(new Date());
        user.doUpdate(true);
        //登录
        StpUtil.login(user.getId());
        user.setPassword("");
        //将权限放入sa-session里面缓存
        StpUtil.getSession().set(String.valueOf(user.getId()), user);
        CacheMgr.set(CacheEnum.REGION_LOGIN.getRegion(), String.valueOf(user.getId()), user);
        SaStorage storage = SaManager.getSaTokenContext().getStorage();
        SaTokenConfig config = SaManager.getConfig();
        String tokenValue = StpUtil.getTokenValue();
        if (config.getIsReadCookie()) {
            SaManager.getSaTokenContext().getResponse().addCookie(
                    CommonConstants.AUTHORIZATION, tokenValue, "/",
                    config.getCookieDomain(), (int) config.getTimeout()
            );
        }
        storage.set(CommonConstants.AUTHORIZATION, tokenValue);
        log.info("登录成功，当前会话[user_id={}]是否登录:{}", user.getId(), StpUtil.isLogin());
        user.setToken(tokenValue);
        user.setExpires_in(config.getTimeout());
        CacheMgr.set(CacheEnum.REGION_TOKEN.getRegion(), String.valueOf(user.getId()), tokenValue);
        CacheMgr.set(CacheEnum.REGION_TOKEN.getRegion(), tokenValue, user);
        return ApiResult.successWithObject(user, "登录成功");
    }

    /**
     * 判断是否登录
     *
     * @return
     */
    @GetMapping("/isLogin")
    public ApiResult isLogin() {
        return StpUtil.isLogin() ? ApiResult.success() : ApiResult.fail();
    }

    /**
     * 退出登录
     *
     * @return
     */
    @DeleteMapping("/logout")
    public ApiResult logout() {
        String tokenValue = StpUtil.getTokenValue();
        if (StrUtil.isBlankIfStr(tokenValue)) {
            return ApiResult.success();
        }

        Object objectUser = CacheMgr.get(CacheEnum.REGION_TOKEN.getRegion(), tokenValue);
        if (objectUser == null) {
            return ApiResult.success();
        }
        User loginUser = (User) objectUser;
        CacheMgr.evict(CacheEnum.REGION_LOGIN.getRegion(), String.valueOf(loginUser.getId()));
        CacheMgr.evict(CacheEnum.REGION_TOKEN.getRegion(), tokenValue);
        CacheMgr.evict(CacheEnum.REGION_TOKEN.getRegion(), String.valueOf(loginUser.getId()));
        try {
            StpUtil.getSession().delete(String.valueOf(loginUser.getId()));
            // 当前会话注销登录
            StpUtil.logout();
            SaTokenConfig config = SaManager.getConfig();
            if (config.getIsReadCookie()) {
                SaManager.getSaTokenContext().getResponse().deleteCookie(CommonConstants.AUTHORIZATION);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ApiResult.success();
        }

        log.info("退出登录成功，当前会话[user_id={}]是否登录:{}", loginUser.getId(), StpUtil.isLogin());
        return ApiResult.success();
    }


}
