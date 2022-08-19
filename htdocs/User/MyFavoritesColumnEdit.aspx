<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.User_MyFavoritesColumnEdit, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>收藏夹分类编辑</title>
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
<div class="content"><form runat="server" id="form1">
	<UserActions:UserActions runat="server" ID="uc_UserActions_1" />	
	<div class="right">
    	<div class="u_right_main">
        	<UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
            <div class="fav_nav">
                <a href="MyFavoritesColumn.aspx">所有分类</a>
			    <% if (OID > 0)
          { %><a href="#"<% if(OID > 0) { %> class="b"<%} %>>编辑分类</a><%} %>
			    <a href="MyFavoritesColumnEdit.aspx"<% if(OID < 1) { %> class="b"<%} %>>新建分类</a>
			</div>
            <div class="clear"></div>
            <table class="add_tab_2" id="tbForm">
			    <tr>
			        <td width="137" rowspan="3" align="center"><img src="<%= SkinPath %>Img/fav_3.gif" alt="收藏夹分类" /></td>
                    <td class="tr" width="100"><span class="imt">*</span> 分类名称：</td>
                    <td class="tl">
                        <asp:TextBox ID="txtFolderName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ControlToValidate="txtFolderName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="tr">排序：</td>
                    <td class="tl">
                        <asp:DropDownList runat="server" ID="ddlRanking"></asp:DropDownList>
                    </td>
                </tr>
				<tr>
					<td></td>
					<td>
					    <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="b17" Text="保 存" />
						<input type="button" class="b18" value="重 填" onclick="emptyText('tbForm')" />
					</td>
				</tr>
			</table>
        </div>
    </div>
	<div class="clear"></div>
</form></div>
<!--Content:End-->
<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</body>
</html>