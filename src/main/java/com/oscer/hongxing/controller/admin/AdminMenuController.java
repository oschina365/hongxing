package com.oscer.hongxing.controller.admin;

import cn.hutool.core.collection.CollectionUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.oscer.hongxing.bean.Entity;
import com.oscer.hongxing.bean.Menu;
import com.oscer.hongxing.common.ApiResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 后台管理登录
 *
 * @author MRCHENIKE
 * @create 2022-08-21 14:46
 **/
@Controller
@RequestMapping("/admin/menu")
@Slf4j
public class AdminMenuController extends AdminBaseController {

    /**
     * 菜单列表
     *
     * @return
     */
    @GetMapping
    public String index() {
        List<Menu> menus = (List<Menu>) Menu.ME.filter(" parent_id", 0);
        request.setAttribute("firstMenus", menus);
        return ADMIN_BASE_PAGE + "/menu/index";
    }

    /**
     * 菜单列表json
     *
     * @return
     */
    @GetMapping("navs")
    public String navs() {
        return "/static/admin/json/navs.json";
    }

    /**
     * 获取菜单列表
     *
     * @return
     */
    @GetMapping("/list")
    @ResponseBody
    public JSONObject list() {
        List<Menu> menus = (List<Menu>) Menu.ME.filter(" parent_id", 0);
        if (CollectionUtil.isEmpty(menus)) {
            return null;
        }
        for (Menu menu : menus) {
            List<Menu> childs = (List<Menu>) Menu.ME.filter(" parent_id", menu.getId());
            menu.setChilds(childs);
        }
        JSONObject resultJson = new JSONObject();
        JSONArray menuArray = new JSONArray();
        for (Menu menu : menus) {
            JSONObject menuJson = new JSONObject();
            menuJson.put("title", menu.getName());
            menuJson.put("icon", menu.getIcon());
            menuJson.put("href", menu.getUrl());
            menuJson.put("spread", false);
            if (CollectionUtil.isNotEmpty(menu.getChilds())) {
                JSONArray array = new JSONArray();
                for (Menu child : menu.getChilds()) {
                    JSONObject childJson = new JSONObject();
                    childJson.put("title", child.getName());
                    childJson.put("icon", child.getIcon());
                    childJson.put("href", child.getUrl());
                    childJson.put("spread", false);
                    array.add(childJson);
                }
                menuJson.put("children", array);
            }
            menuArray.add(menuJson);
        }
        resultJson.put("contentManagement", menuArray);
        return resultJson;
    }

    /**
     * 跳转添加菜单页面
     *
     * @return
     */
    @GetMapping("/add")
    public String add() {
        return ADMIN_BASE_PAGE + "/menu/add";
    }

    /**
     * 添加菜单
     *
     * @param menu
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public ApiResult add(Menu menu) {
        menu.save();
        return ApiResult.success();
    }


}
