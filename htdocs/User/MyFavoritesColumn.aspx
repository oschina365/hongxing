<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.User_MyFavoritesColumn, qwt" enableviewstate="false" enableviewstatemac="false" %>
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
            <div class="fav_nav">
                <a href="javascript:void(0)" class="b">所有分类</a>
			    <a href="MyFavoritesColumnEdit.aspx">新建分类</a>
			</div>
            <div class="clear"></div>
            <table class="add_tab">
            	<tr>  	  	  	  	  	  	
                	<th>序号</th>
                	<th>分类名称</th>
                	<th>创建时间</th>
                	<th>操作</th>
                </tr>
                <asp:Repeater runat="server" ID="rpt"><ItemTemplate><tr>
					<td><%# Container.ItemIndex + 1 %></td>
					<td><%# ((bool)Eval("isSystem")) ? Eval("FolderName").ToString() : "<a href='MyFavoritesColumnEdit.aspx?oid=" + Eval("ID") + "' class='u'>" + Eval("FolderName") + "</a>"%></td>
					<td><%# ((DateTime)Eval("InputTime")).ToString("yy-MM-dd HH:mm") %></td>
					<td><%# ((bool)Eval("isSystem")) ? "系统分类" : "<a href='javascript:void(0)' class='u' onclick=\"if(confirm('确定删除收藏分类？'))delFavColumn(this,"+ Eval("ID") +")\">删除</a>" %></td>
				</tr></ItemTemplate></asp:Repeater>
            </table>
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