<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.User_GetPassword_question_username, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>找回密码</title>
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
<div class="content"><form runat="server" id="form1" defaultfocus="txtUsername">
	<div class="left">
	     <div class="left_ad">
         <%=NSW.BLL.Site.GetAdCodeByKeyName("getpassword")%>
         </div>
	</div>
	<div class="right">
		<div class="u_right_main">
			<UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
			<table class="pass_tab">
				<tr>
					<td class="tr">您的用户名：</td>
					<td>
					    <asp:TextBox runat="server" ID="txtUsername" MaxLength="16"></asp:TextBox>
					    <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator99" runat="server" ErrorMessage="**" ControlToValidate="txtUsername" Display="Dynamic"></asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td class="tr"></td>
					<td height="25">
					    <input type="button" class="b18" value="上一步" onclick="location.href='GetPassword.aspx'" />
						<asp:Button runat="server" ID="btnNext" OnClick="btnNext_Click" CssClass="b17" Text="下一步" />
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