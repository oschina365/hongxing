<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.MyDownloads, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>收藏夹分类管理</title>
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
<!--Header:End-->
<!--Content:Start-->
<div class="content">
	<UserActions:UserActions runat="server" ID="uc_UserActions_1" />
	<div class="right">
    	<div class="u_right_main">
        	<UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
            <div class="fav_search">
                <a href="javascript:void(0)" onclick="if(confirm('您确定要删除收藏记录吗？'))delMyDownloads(this,'tbItems')">删除下载纪录</a>
            </div>
            <table class="add_tab" id="tbItems">
            	<tr>  	  	  	  	  	  	
                	<th><input type="checkbox" onclick="checkAll(this,'tbItems')" /></th>
                	<th>序号</th>
                	<th>资源名称</th>
                	<th>消耗积分</th>
                	<th>回馈积分</th>
                	<th>下载时间</th>
                </tr>
				<asp:Repeater ID="rpt" runat="server"><ItemTemplate><tr>
					<td><input name="item" type="checkbox" value="<%# Eval("ID") %>" /></td>
					<td><%# ((PageIndex - 1) * PageSize) +  Container.ItemIndex + 1 %></td>
					<td><a class="u" target="_blank" href="<%# Eval("PageURL") %>"><%# Eval("Title") %></td>
					<td><%# Eval("Point")%></td>
					<td><%# Eval("ReturnPoint")%></td>
					<td><%# ((DateTime)Eval("InputTime")).ToString("yy-MM-dd HH:mm") %></td>
				</tr></ItemTemplate></asp:Repeater>
            </table>
            <div runat="server" id="nodata" visible="false">暂无数据</div>
            <OranPager:OranPager runat="server" ID="pagerMain" CssClass="apage" />
        </div>
    </div>
	<div class="clear"></div>
</div>
<!--Content:End-->
<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</body>
</html>