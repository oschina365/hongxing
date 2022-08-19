<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.PwsProtected, qwt" enableviewstate="true" enableviewstatemac="false" %>
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
                	<td width="107" rowspan="5"><img src="<%= SkinPath %>Img/PwsProtected.gif" alt="" title="" /></td>
					<td width="112" class="tr"><span>*</span> 现在密码：</td>
					<td width="341"><asp:TextBox ID="txtOldPin" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator5" runat="server" ErrorMessage="**" ControlToValidate="txtOldPin"></asp:RequiredFieldValidator></td>
				</tr>
                <tr>
					<td class="tr"><span>*</span> 密码保护问题：</td>
					<td>
					    <select id="ddlSecQus" onchange="ddlSecQus_Changed(this,'<%= txtSecQus.ClientID %>')">
                            <option value="我的宠物叫什么名字？">我的宠物叫什么名字？</option>
                            <option value="我向往的地方是哪里？">我向往的地方是哪里？</option>
                            <option value="我的初恋情人生日？">我的初恋情人生日？</option>
                            <option value="我喜欢吃什么菜？">我喜欢吃什么菜？</option>
                            <option value="我常爱做什么梦？">我常爱做什么梦？</option>
                            <option value="">自写问题...</option>
                        </select>
                        <asp:TextBox ID="txtSecQus" runat="server" MaxLength="128" Style="display: none"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator6" runat="server" ErrorMessage="**" ControlToValidate="txtSecQus"></asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<td class="tr"><span>*</span> 答案：</td>
					<td><asp:TextBox ID="txtSecAsr" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator3" runat="server" ErrorMessage="**" ControlToValidate="txtSecAsr"></asp:RequiredFieldValidator></td>
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
               如果您忘记了密码保护答案，请通过留言的方式将您的真实姓名、联系电话以及身份证的原件扫描件发送给<%= NSW.OConfig.GlobalConfig.SiteName %>客服中心。我们会尽快与您取得联系。
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
<script type="text/javascript">
ddlSecQus_Changed($g("ddlSecQus"),"<%= txtSecQus.ClientID %>");
</script>