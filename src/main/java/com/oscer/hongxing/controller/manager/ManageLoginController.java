package com.oscer.hongxing.controller.manager;

import cn.dev33.satoken.SaManager;
import cn.dev33.satoken.config.SaTokenConfig;
import cn.dev33.satoken.context.model.SaStorage;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.StrUtil;
import com.oscer.hongxing.bean.User;
import com.oscer.hongxing.common.AESUtils;
import com.oscer.hongxing.common.ApiResult;
import com.oscer.hongxing.common.CacheEnum;
import com.oscer.hongxing.common.CommonConstants;
import com.oscer.hongxing.controller.BaseController;
import com.oscer.hongxing.dao.UserDAO;
import com.oscer.hongxing.db.CacheMgr;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 后台管理登录
 *
 * @author MRCHENIKE
 * @create 2022-08-21 14:46
 **/
@Controller
@Slf4j
public class ManageLoginController extends ManagerBaseController {

    @GetMapping("/manager")
    public String login() {
        return "/manager/login";
    }

    @GetMapping("/manager/index")
    public String index() {
        if (!StpUtil.isLogin()) {
            return login();
        }
        Object loginId = StpUtil.getLoginId();
        if (loginId != null) {
            request.setAttribute("user", User.ME.get(Long.parseLong(loginId.toString())));
        }
        return "/manager/index";
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
