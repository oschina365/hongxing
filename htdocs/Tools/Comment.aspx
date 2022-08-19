<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Tools.Comment, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>评论</title>
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
<!--Header:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Header:end-->
<!--Content:Start-->
<div class="cart_content">
    <div class="b4 mt10 comments">
	    <asp:Repeater runat="server" ID="rpt"><ItemTemplate><dl>
		    <dd><%# Eval("UserName")%>：<span class="ip">IP：<%# NSW.ComUtls.CutIp(Eval("LastIP").ToString(), 2) %></span>时间：<%# ((DateTime)Eval("InputTime")).ToString("yyyy-MM-dd HH:mm") %></dd>
		    <dd class="con"><%# Eval("Content") %></dd>
		    <dd class="huifus"><h5>管理员回复：</h5><div><%# Eval("FeedBack")%></div></dd>
	    </dl></ItemTemplate></asp:Repeater>
	    <div runat="server" id="nodata" visible="false">暂无评论</div>
    </div>
    <OranPager:OranPager runat="server" ID="pagerMain" CssClass="apage mt10" />
    <div class="clear"></div>
</div>
<!--Content:End-->
<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</body>
</html>
