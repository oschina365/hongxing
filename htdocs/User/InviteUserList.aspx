<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.InviteUserList, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>邀请函发送日志列表</title>
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
    	    <div class="favorites">
        	    <a href="javascript:void(0)" onclick="if(confirm('您确定要删除选中的邀请函吗？'))delInitationlog(this,'tbItems')">删除邀请函</a>
				| <a href="InviteUser.aspx">发送邀请</a>
        	</div>
    	    <table class="nor_tab" id="tbItems">
				<tr>
				    <th><input type="checkbox" onclick="checkAll(this,'tbItems')" /></th>
					<th>序号</th>
					<th>电子邮箱地址</th>
					<th>用户名</th>
					<th>注册时间</th>
					<th>发送时间</th>
				</tr>
    	    <asp:Repeater runat="server" ID="rpt">
				<ItemTemplate><tr>
				<td><input name="item" type="checkbox" value="<%# Eval("ID") %>" /></td>
					<td><%# ((PageIndex - 1) * PageSize) +  Container.ItemIndex + 1 %></td>
					<td><%# Eval("InvitedUserEmail")%></td>
					<td><%# Eval("InvitedUsername")%></td>
					<td><%# Eval(REGISTER_COLUMN_TITLE)%></td>
					<td><%# ((DateTime)Eval("InputTime")).ToString("yy-MM-dd HH:mm") %></td>
				</tr></ItemTemplate>
			</asp:Repeater>
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