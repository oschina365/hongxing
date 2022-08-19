<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.User_Login, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>会员登录</title>
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
<div class="content"><form runat="server" id="tbForm" defaultfocus="txtEmail" defaultbutton="btnSubmit"><asp:HiddenField runat="server" ID="hdnRefUri" />
	<div class="login_dl_left">
		<div class="lefttit"><span class="sp_1">提示：</span>请直接输入<span>用户名</span>和<span>密码</span>进行登录</div>
		<div class="leftinfo">
            <table class="login_tab">
				<tr>
                	<td width="72" height="24" class="tr">用户名：</td>
				  <td width="203">
				    <asp:TextBox ID="txtEmail" CssClass="txtboxcs" runat="server" MaxLength="16"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator4" SetFocusOnError="true" runat="server"
                            ErrorMessage="**" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    <br /><input type="checkbox" id="Checkbox1" onclick="keepUsername(this.checked,'<%= txtEmail.ClientID %>')" /><label for="chkKeep">记住用户名</label>
                    </td>
				</tr>
				<tr>
                	<td height="27" class="tr">密 码：</td>
				  <td>
				    <asp:TextBox ID="txtPin"  CssClass="txtboxcs"  runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="error" SetFocusOnError="true" ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="**" Display="Dynamic" ControlToValidate="txtPin"></asp:RequiredFieldValidator>
				  </td>
				</tr>
				<tr runat="server" id="trVerCode">
                    <td class="tr">验证码：</td>
                    <td><asp:TextBox ID="txtVerCode" runat="server" onfocus="showVerifyCode()" CssClass="txtboxcs"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="error" SetFocusOnError="true" ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="**" Display="Dynamic" ControlToValidate="txtVerCode"></asp:RequiredFieldValidator>
                    <div><span id="spVerCode"></span><span id="spVerCodeMsg" class="hd"></span><a id="spChgVerCode" class="p hd" href="###" onclick="changeVerCode()">看不清？！</a></div></td>
                </tr>
				<tr>
					<td></td>
                    <td>
                        <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" CommandName="signin" Text="登录" runat="server" CssClass="b f14 cWhite b17" />
                        <input type="button" class="b f14 cWhite b18" value="重填" onclick="emptyText('tbForm')" />
                    </td>
                </tr>
				<tr>
                	<td></td>
               		<td>
               		    [ <a href="GetPassword.aspx">忘记密码？</a> ]<br />
                        [ <a href="register.aspx">没有帐号？</a> ]
               		</td>
                </tr>
            </table>
		</div>
	</div>
	<div class="login_dl_right">
		<div class="">
			<h4 class="righttit">温馨提示</h4>
			<div class="rightinfo">
            	<ul>
					<li><%= NSW.OConfig.GlobalConfig.SiteName %>--现在<a href="register.aspx" class="a_1">注册会员</a></li><%--，立刻可以观看在线免费视频[详情]--%>
					<li><%= NSW.OConfig.GlobalConfig.SiteName %>--成功上线,您可以直接使用会员名进行<a href="login.aspx" class="a_1">登录</a></li>
					<li>您还没有申请成为<%= NSW.OConfig.GlobalConfig.SiteName %>的会员吗？请马上<a href="register.aspx" class="a_2">点击注册</a></li>
                </ul>
				<div class="tr">
					<input type="button" class="b33" onclick="location.href='register.aspx'" />
				</div>
				<div><%= NSW.BLL.Site.GetAdCodeByKeyName("user_login")%></div>
			</div>
		</div>
		<div></div>
	</div>
	<div class="clear"></div>
</form></div>
<!--Content:End-->
<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</body>
</html>