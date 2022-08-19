﻿<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.home_cs, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content=""  />
    <meta name="keywords" content="" />
    <title><%=NSW.OConfig.GlobalConfig.SiteName%>网站后台</title>
    <link href="skins/base/editInterface.css" rel="stylesheet" type="text/css" />
    <link href="skins/base/products.css" rel="stylesheet" type="text/css"/>
    <link href="skins/base/dialog.css" rel="stylesheet" type="text/css"/>
<!-- hongxin.com.cn/Mobile Baidu tongji analytics -->
<script>
var _hmt = _hmt || [];
(function() {
var hm = document.createElement("script");
hm.src = "https://hm.baidu.com/hm.js?25e431cff63a206eb286efd246de5f2d";
var s = document.getElementsByTagName("script")[0];
s.parentNode.insertBefore(hm, s);
})();
</script>
</head>
<body>
	<!-- Header -->
	<div class="top_line">
		<div class="header">
			<h1 class="nsw_logo"><a href="iIndex.aspx" target="frmEditor"></a></h1>
			<div class="hd_r f_fr f_tar">
				<div class="help_centre">
                    <a href="/" target="_blank" title="网站首页">网站首页</a>|
                    <a href="http://www.nsw88.com/peixun.shtml" target="_blank" title="帮助中心">帮助中心</a>|
                    <a href="http://i.youku.com/nswvideo" target="_blank" title="后台教程">后台教程</a>|
                    <a href="entrance.aspx" target="_blank" title="牛商学堂">牛商学堂</a>
                </div>
				<div class="manager_info">
                    <a href="#" class="adm"><%= AdminName %> 欢迎您来到<b><%=NSW.OConfig.GlobalConfig.SiteName%></b>网站后台</a>|
                    <a href="iIndex.aspx" target="frmEditor">帐户管理</a>|
                    <a href="del_html.aspx" target="frmEditor">清除缓存</a>|
                    <a href="javascript:;" id="widthscreen">宽屏</a>|
                    <a href="admin_logout.aspx">退出</a>
                </div>
			</div>
		</div>
	</div>
	<!-- wrap -->
	<div class="wrap">
		<div class="content f_cb">	
			<!-- leftbar -->
			<div class="col_side">
				<div class="menu_name">我的工具</div>
				<div class="menu_line">
					<div id="menuBar" class="menu_box">
                        <asp:Repeater runat="server" ID="rpt" OnItemDataBound="rptContent_ItemDataBound"><ItemTemplate>
						<div class="menu color_tex">
							<h3 class="menu_title">
                                <em class="yel_line"></em><%--<%#string.IsNullOrEmpty(Eval("PhotoPath").ToString()) ? string.Empty : " style=\"background: url(" + Eval("PhotoPath").ToString() + ") no-repeat;\""%>--%>
                                <span class="mu_ico <%#Eval("CssClass")%>"></span>
                                <a href="<%#Eval("URL") %>" target="frmEditor"><%#Eval("Title") %></a>
                            </h3>
                            <asp:Repeater runat="server" ID="rptContentSon">
                            <HeaderTemplate><ul style="display:none;"></HeaderTemplate>
                            <FooterTemplate></ul></FooterTemplate>
                            <ItemTemplate>
                                <li class="menu_item"><a href="<%#Eval("URL").ToString().ToLower() %>" target="frmEditor" class="zon_line"><%#Eval("Title") %><em class="yel_line"></em></a></li>
                            </ItemTemplate></asp:Repeater>
						</div>
                        </ItemTemplate></asp:Repeater>
					</div>
					<div class="drag_receive"><a href="admin_systemmenu_edit.aspx" target="frmEditor"><span></span></a></div>
					<%--<div class="mu_more"><em class="yel_line"></em><span class="mu_more_btn"><em class="yel_ico"></em>显示更多</span></div>--%>
				</div>	
			</div>
		    <!-- right box -->
			<div class="float_box">
                <script type="text/javascript">

                    window.top.SetHeight = function () {
                        var frmEditor = $("#frmEditor");
                        var h = frmEditor.contents().find("body").height();
                        h = parseInt(h);
                        if (!isNaN(h) && h > 20) {
                            var _h = $("div.col_side").height();
                            if (h < _h) {
                                h = _h;
                            }
                            h = frmEditor.data("setheight") ? h : h + 20;
                            frmEditor.height(h);
                            frmEditor.data("setheight", true);
                        } else {
                            frmEditor.height(1500);
                        }
                    }

                    function SaveURL(url) {
                        var _href = url || (window.location + '');
                        _href = _href.substring(_href.lastIndexOf('/') + 1, _href.length);
                        _href = _href.replace(/#{2,}/, '');
                        $.cookie("nswXpath", "{editmenu:'" + _href + "'}");
                    }
                </script>
                <iframe src="iindex.aspx" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" id="frmEditor" name="frmEditor" width="100%"></iframe>
			</div>
		</div>
	</div>
	<div class="foot">
        <div class="footer">网址 http://www.nsw88.com Services@nsw88.com 服务热线： 400-033-3087  Power By 深圳市牛商网络股份有限公司 V<%=Version %> <a href="system_update.aspx" target="_blank" style="color:#f18d14;">检查更新</a></div>
    </div>
</body>
<script src="js/common/common.js" type="text/javascript"></script>
<script type="text/javascript">
    function getPageFilename(path) {
        path = path || window.location.pathname;
        var filename = path;
        var pos = -1;
        if ((pos = path.lastIndexOf('/') + 1) > 0) {
            filename = path.substr(pos, path.length);
        }
        if ((pos = filename.indexOf('?')) > 0) {
            filename = filename.substr(0, pos);
        }
        return filename;
    }
    $(function () {
        $("a[href='#']").attr("href", "javascript:;");
        $("a[href='admin_logout.aspx']").attr("target", "_self");
        var frmeditor = $("#frmEditor");
        $(".menu_item a[href*='_edit']").click(function (event) {
            SaveURL($(this).attr("href").toLowerCase().replace("_edit", ''));
        })
        var content = $("div.content");
        $("#widthscreen").bind("click", function () {
            if (content.hasClass("w_98")) {
                $(this).text("宽屏");
                content.removeClass("w_98");
                $.cookie("w_98", "false", { expires: 7, path: window.location.pathname });
                window.top.SetHeight();
            } else {
                $(this).text("窄屏");
                content.addClass("w_98");
                $.cookie("w_98", "true", { expires: 7, path: window.location.pathname });
                window.top.SetHeight();
            }
        })
        if ($.cookie("w_98") === "true") {
            $("#widthscreen").click();
        }

        $(".menu h3").click(function () {
            $(this).next().slideDown().parents("div.menu").siblings("div.menu").find("ul").slideUp("slow");
        })

        //选中
        var as = $("div.menu li a");
        var lis = as.parent("li");
        var _select = function (a, li) {
            if (a.length) {
                $("#menuBar ul:visible").hide();
                a.parent("li").addClass("selected").parent("ul").show().siblings("ul").hide();
            }
        }
        as.bind("click", function () {
            var a = $(this);
            a.attr("_load_", "true");
            _select(a, lis.filter(".selected").removeClass("selected"));
        })
        $("#frmEditor").bind("load", function () {
            var url = getPageFilename(window.top.frames["frmEditor"].location + "").toLowerCase();
            var a = as.filter("[href$='" + url + "']");
            if (a.attr("_load_") == "true") {
                a.attr("_load_", "false");
                return;
            }
            var li = lis.filter(".selected").removeClass("selected");
            if (a.length) {
                _select(a, li);
            } else if (url.indexOf('_edit.aspx') > 0) {
                url = url.replace('_edit', '');
                if (_OBJ_[url]) {
                    url = _OBJ_[url];
                }
                a = as.filter("[href$='" + url + "']");
                _select(a, li);
            } else {
                a = as.filter("[href*='" + url + "']");
                _select(a, li);
            }
        })
    })
</script>
</html>
