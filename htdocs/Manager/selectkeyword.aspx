﻿<%@ page language="C#" autoeventwireup="True" enableeventvalidation="false" inherits="NSW.Web.Manager.selectkeyword, qwt" enableviewstate="true" maintainscrollpositiononpostback="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%= ItemName %></title>
    <link href="skins/base/products.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
    .mk_ul span{ width:24.5%;}
    .mark_list1 li{ width:12.4%;}
    </style>
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
<body style="width:700px;">
<div class="f_cb pro_fast_edit">
	<div class="add_tile_tab add_nobd f_cb">
		<ul class="f_cb addtab_ul addmark_ul j_recordCon f_fl">
			<li class="active li1"><em class="zline1"></em><em class="zline2"></em>列表</li>
		</ul>
	</div>
	<div class="j_recordCon_c f_cb">
	    <!-- 标签列表 -->
		<div class="mark_box cont_2">
			<div class="mark_cont1">
				<div class="mark_hide">
					<ul class="mark_list1 f_cb">
                        <%=GetHtml() %>
					</ul>
				</div>
			</div>
			<div class="view_btn f_tac f_mt20">
                <span class="e_btn1 f_csp queding"><i class="sure_icon"></i>保 存</span>
                <span class="e_btn2 f_ml35 f_csp quxiao"><i class="cancel_icon"></i>取 消</span>
            </div>
		</div>
	    <!-- 标签列表 end-->
	</div>
</div>
</body>
<script type="text/javascript">
    $(function () {

        var obj = parse_url(window.location.href);
        var popid = obj["popid"] || "__";
        var pop = window.top.$("#" + popid);
        var input = pop.data("input");

        $(window).bind("load", function () {
            if (pop.length) {
                pop.trigger("reset");
            }
        })
        $(".mark_list1 li").click(function () {
            var me = $(this);
            var oid = me.attr("oid");
            me.addClass("zon").siblings("li").removeClass("zon");
            $("div.mark_content[oid='" + oid + "']").show().siblings("div.mark_content").hide();
        }).eq(0).click();

        if (input) {
            $(".mk_ul em").bind("click", function () {
                var me = $(this);
                var text = me.text().trim();
                var value = input.val().trim();
                me.toggleClass("zon");
                var arr = value ? value.split(",") || [] : [];
                var index = jQuery.inArray(text, arr);
                var update = false;
                if (me.hasClass("zon")) {
                    if (index == -1) {
                        arr.push(text);
                        update = true;
                    }
                } else {
                    if (index > -1) {
                        arr.removeAtIndex(index);
                        update = true;
                    }
                }
                if (update) {
                    input.val(arr.join(",")).trigger("hasValue").trigger("keyup");
                }
            });
        }

    })
</script>
</html>