package com.oscer.hongxing;// 返回视图（需搭配页面模板 /error）

import cn.dev33.satoken.exception.*;
import cn.dev33.satoken.stp.StpUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@ControllerAdvice
public class GlobalExceptionHandlerForCommon {

    // 全局异常拦截
    @ExceptionHandler
    public String handlerExceptions(Model model, RedirectAttributes attrs, Exception e, HttpServletRequest request) {

        log.info("全局异常---------------");
        e.printStackTrace();

        // 判断场景值，定制化异常信息
        String msg;
        if (e instanceof NotLoginException) {                   // 如果是未登录异常
            // NotLoginException ee = (NotLoginException) e;
            //  msg = "未登录：" + ee.getMessage();
            attrs.addFlashAttribute("msg", "Please login");
            attrs.addFlashAttribute("lastUrl", request.getRequestURL());
            return "redirect:/";
        } else if (e instanceof NotRoleException) {             // 如果是角色异常
            NotRoleException ee = (NotRoleException) e;
            msg = "无此角色：" + ee.getRole();
        } else if (e instanceof NotPermissionException) {       // 如果是权限异常
            NotPermissionException ee = (NotPermissionException) e;
            msg = "无此权限：" + ee.getCode();
        } else if (e instanceof DisableLoginException) {        // 如果是被封禁异常
            DisableLoginException ee = (DisableLoginException) e;
            msg = "账号被封禁：" + ee.getDisableTime() + "秒后解封";
        } else if (e instanceof NotSafeException) {             // 如果是二级认证
            NotSafeException ee = (NotSafeException) e;
            log.info("二级认证异常：" + ee.getMessage());
            StpUtil.openSafe(120);
            attrs.addFlashAttribute("msg", "Please login to Confirm");
            attrs.addFlashAttribute("lastUrl", request.getRequestURL());
            return "redirect:/admin";
        } else if (e instanceof Exception) {
            msg = e.getMessage();
        } else {    // 普通异常, 输出：500 + 异常信息
            // log.info(e.getMessage());
            msg = e.getMessage();
        }
        model.addAttribute("exeMsg", msg);
        model.addAttribute("reqUrl", request.getRequestURL());
        return "/";
    }
}
