<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.ChangePws, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>密码保护</title>
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
<body><form runat="server" id="form1" onsubmit="return checkPinForm()" defaultfocus="txtOldPin" defaultbutton="btnSubmit">
<!--Header:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Header:End-->
<!--Content:Start-->
<div class="content">
	<UserActions:UserActions runat="server" ID="uc_UserActions_1" />
	<div class="right">
    	<div class="u_right_main">
        	<UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
        	<table class="pass_xg" id="tbForm">
				<tr>
					<td width="104" class="tr"><span>*</span> 现在密码：</td>
					<td width="180"><asp:TextBox ID="txtOldPin" runat="server" TextMode="Password"></asp:TextBox>
					<asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ControlToValidate="txtOldPin"></asp:RequiredFieldValidator>
					</td>
					<td width="181" rowspan="5"><img src="<%= SkinPath %>Img/getpassword1.gif" alt="密码修改" /></td>
				</tr>
				<tr>
					<td class="tr"><span>*</span> 新密码：</td>
					<td><asp:TextBox ID="txtNewPin" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator3" runat="server" ErrorMessage="**" ControlToValidate="txtNewPin"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator CssClass="error" ID="RegularExpressionValidator1" runat="server" ErrorMessage="密码长度有误"
                            ControlToValidate="txtNewPin" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^.{6,16}$"></asp:RegularExpressionValidator></td>
				</tr>
				<tr>
					<td class="tr"><span>*</span> 确认密码：</td>
					<td><asp:TextBox ID="txtConfirmPin" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtConfirmPin" ControlToCompare="txtNewPin" runat="server" ErrorMessage="两次密码输入不一致" CssClass="error" Display="Dynamic"></asp:CompareValidator>
					</td>
				</tr>
				<tr runat="server" id="trVerCode">
                    <td class="tr"><span>*</span> 验证码：</td>
                    <td><asp:TextBox ID="txtVerCode" onfocus="showVerifyCode()" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="**" ControlToValidate="txtVerCode"></asp:RequiredFieldValidator>
                    <cite><span id="spVerCode"></span><span id="spVerCodeMsg" class="hd"></span><a id="spChgVerCode" class="p hd" href="###" onclick="changeVerCode()">看不清？！</a></cite></td>
                </tr>
			</table>
            <div class="pass_xg_bot">
           		<h4>注意：</h4>
                密码由6-16个字符组成，请使用英文字母加数字或符号的组合密码，最好不要单独使用英文字母、数字或符号作为您的密码。
                <div class="xg_bot">
                	<asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="b17" Text="保 存" />
					<input type="button" class="b18" value="重 填" onclick="emptyText('tbForm')" />
               </div>
            </div>
        </div>
    </div>
	<div class="clear"></div>
</div>
<!--Content:End-->
<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</form></body>
</html>