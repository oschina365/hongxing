/******************************************************************************
* filename: Menu.js
* Menu Modul for Administrator's Panel
* (C) MasterLi(masterljf#hotmail.com)
* (C) NSW(http://www.nsw.com)
*******************************************************************************/
var ItemTemp = "";
function CreateMainMenu() {
    var Item = "", ItemStart, ItemEnd;
    ItemStart = "<ul id=\"mainmenu\" style=\"z-index:2;\">";
    ItemEnd = "<\/ul>";
    ItemTemp += ItemStart;
    for (var iRow = 0; iRow < menu_MCount; iRow++) {
        if (menu_M[iRow] != null) {
            if (menu_M[iRow][5] == "True") {
                if (menu_M[iRow][1] == "退出") { continue; }
                ItemTemp += "<li onclick='loading()'  style=\"z-index:2;\">";
                if (menu_M[iRow][2] != "") { ItemTemp += "<a href=\"" + (menu_M[iRow][2] == "#" ? "javascript:;" : menu_M[iRow][2]) + "\"" + (iRow == 0 ? " target='_blank' onclick='event.cancelBubble=true;'" : "") + ">"; }
                ItemTemp += "<span>" + menu_M[iRow][1] + "</span>";
                if (menu_M[iRow][2] != "") { ItemTemp += "<\/a>"; }
                CreateSubMenu(iRow);
                ItemTemp += "<\/li>";
            }
        } else {
            break;
        }
    }
    ItemTemp += ItemEnd;
    document.writeln(ItemTemp);
    //    showtime();
    $("#mainmenu").children("li").hover(function () {
        var ie6 = $.browser.msie && $.browser.version == "6.0";
        var css = {};
        if ($(this).parent().children("li:last").is(this)) {
            css = ie6 ? { left: "-115px"} : { left: "-97px" };
        } else if ($(this).parent().children("li:last").prev("li").is(this)) {
            css = ie6 ? { left: "-45px"} : { left: "-27px" };
        }
        $(this).addClass("sfhover").children("div").css(css).show().parent().siblings("li").children("div").hide();
        if (ie6) {
            var $fContent = $("#frmEditor").contents();
            //            if ($fContent.find("#lbColumnList").length < 1) return;
            var $f = $fContent.find("#iframe");
            if (!$f[0]) {
                $fContent.find("#body").append("<iframe id=\"iframe\" style=\"z-index:1;display:none;filter:alpha(opacity=0);border:0;position:absolute; \" ></iframe>");
            }
            $f = $fContent.find("#iframe");
            var top = frames["frmEditor"].document.documentElement.scrollTop;
            if (!$(this).children("div").length) { return; }
            var left = $(this).children("div").offset().left;
            var height = $(this).children("div").height();
            var width = $(this).children("div").width();
            $f.css({ "top": top, "left": left, "height": height, "display": "block", "width": width + 2 });
        }
    }, function () {
        if ($.browser.msie && $.browser.version == "6.0") {
            var $f = $("#frmEditor").contents().find("#iframe");
            if ($f[0]) {
                $f.hide();
            }
        }
        $(this).removeClass("sfhover").children("div").hide();
    });
}
function CreateSubMenu(_Index) {
    var Item = "", ItemStart, ItemEnd;
    ItemStart = "<div class='erj'><ul>";
    ItemEnd = "<\/ul><div class='bos'></div></div>";
    var menu = menu_S[_Index];
    if (menu != null) {
        ItemTemp += ItemStart;
        for (var j = 0; j < menu.length; j++) {
            if (menu[j][4] == "True") {
                if (menu[j][3] != "_blank" || menu[j][3].length == 0) {
                    Item = "<li><a href='" + menu[j][1] + "' target='frmEditor'>" + menu[j][0] + "<\/a><\/li>";
                }
                else {
                    Item = "<li><a href='" + menu[j][1] + "' target='" + menu[j][3] + "'>" + menu[j][0] + "<\/a><\/li>";
                }

                ItemTemp += Item;
            }
        }
        ItemTemp += ItemEnd;
    }
}
function menuFix() {
}
//创建子菜单的二级导航菜单
function CreateSubChildMenu(MenuID, frmId) {
    if (typeof (menu_SChild) == "undefined") { return; }
    if (frmId == null) {
        //        frmId = "frmEditor";
        frmId = "frmEditor";
    }
    //0\定义变量
    var groupmenu = "groupmenu", objgroupmenu;
    var WriteString = "";
    if (frames[frmId] == null) {
        return;
    }
    //1\打印开始数据
    objgroupmenu = frames[frmId].document.getElementById(groupmenu);
    if (MenuID != null) {
        //2\循环检测所有二级子菜单的首个父亲ID,如果相等,则循环吧子菜单显示出来
        for (var iRow = 0; iRow < menu_SChild.length; iRow++) {
            var menu = menu_SChild[iRow];
            if (menu) {
                //1\检查父亲ID
                if (MenuID == menu[0][0]) {
                    //2\循环打印出来
                    for (var j = 0; j < menu.length; j++) {
                        //alert(menu[j][4]);
                        if (menu[j][5] == "True") {
                            WriteString += "<li><a href=\"" + menu[j][2] + "\" target=\"" + menu[j][4] + "\">" + menu[j][1] + "<\/a><\/li>";
                        } 
                    }
                    //3\退出整个循环体
                    break;
                }
            }
        }
        if (!objgroupmenu) {
            return;
        }
        //6\打印结束数据
        objgroupmenu.innerHTML = "<ul>" + WriteString + "</ul>";
    }
}
function showtime() {
    var today, hour, second, minute, year, month, date;
    var strDate;
    today = new Date();
    var n_day = today.getDay();
    switch (n_day) {
        case 0: strDate = "星期日"; break;
        case 1: strDate = "星期一"; break;
        case 2: strDate = "星期二"; break;
        case 3: strDate = "星期三"; break;
        case 4: strDate = "星期四"; break;
        case 5: strDate = "星期五"; break;
        case 6: strDate = "星期六"; break;
        case 7: strDate = "星期日"; break;
    }
    year = today.getFullYear();
    month = today.getMonth() + 1;
    date = today.getDate();
    hour = today.getHours();
    minute = today.getMinutes();
    if (minute < 10) minute = "0" + minute;
    second = today.getSeconds();
    if (second < 10) second = "0" + second;
    document.getElementById('currenttime').innerHTML = managerbg + year + "年" + month + "月" + date + "日 " + strDate + " " + hour + ":" + minute + ":" + second;
    setTimeout("showtime();", 1000);
}
/*END MENU**/

/*!
* jQuery Cookie Plugin v1.4.0
* https://github.com/carhartl/jquery-cookie
*
* Copyright 2013 Klaus Hartl
* Released under the MIT license
*/
(function (a) { if (typeof define === "function" && define.amd) { define(["jquery"], a) } else { a(jQuery) } } (function (f) { var a = /\+/g; function d(i) { return b.raw ? i : encodeURIComponent(i) } function g(i) { return b.raw ? i : decodeURIComponent(i) } function h(i) { return d(b.json ? JSON.stringify(i) : String(i)) } function c(i) { if (i.indexOf('"') === 0) { i = i.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, "\\") } try { i = decodeURIComponent(i.replace(a, " ")) } catch (j) { return } try { return b.json ? JSON.parse(i) : i } catch (j) { } } function e(j, i) { var k = b.raw ? j : c(j); return f.isFunction(i) ? i(k) : k } var b = f.cookie = function (q, p, v) { if (p !== undefined && !f.isFunction(p)) { v = f.extend({}, b.defaults, v); if (typeof v.expires === "number") { var r = v.expires, u = v.expires = new Date(); u.setDate(u.getDate() + r) } return (document.cookie = [d(q), "=", h(p), v.expires ? "; expires=" + v.expires.toUTCString() : "", v.path ? "; path=" + v.path : "", v.domain ? "; domain=" + v.domain : "", v.secure ? "; secure" : ""].join("")) } var w = q ? undefined : {}; var s = document.cookie ? document.cookie.split("; ") : []; for (var o = 0, m = s.length; o < m; o++) { var n = s[o].split("="); var j = g(n.shift()); var k = n.join("="); if (q && q === j) { w = e(k, p); break } if (!q && (k = e(k)) !== undefined) { w[j] = k } } return w }; b.defaults = {}; f.removeCookie = function (j, i) { if (f.cookie(j) !== undefined) { f.cookie(j, "", f.extend({}, i, { expires: -1 })); return true } return false } }));
//获取URL参数
// var args = getUrlParms(); args['sid'];
function getUrlParms() {
    var args = new Object();
    var query = location.search.substring(1); //获取查询串
    var pairs = query.split("&"); //在逗号处断开
    for (var i = 0; i < pairs.length; i++) {
        var pos = pairs[i].indexOf('='); //查找name=value
        if (pos == -1) continue; //如果没有找到就跳过
        var argname = pairs[i].substring(0, pos); //提取name
        var value = pairs[i].substring(pos + 1); //提取value
        args[argname] = unescape(value); //存为属性
    }
    return args;
}
