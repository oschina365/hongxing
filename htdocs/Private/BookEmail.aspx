<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Private.Private_BookEmail, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>邮件订阅</title>
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
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Content:Start-->
<form runat="server" id="form1">
<div   class="cart_content">
	<div class="stf">
		<dl >
			 
			<span  >邮件订阅</span>
			<dd>马上填写您的电子邮件地址，免费又简单。</dd>
			<dd>马上获益：</dd>
			<dd class="bg">无限次收取我们网站发送给您的最新行业资讯</dd>
			<dd class="bg">订阅最新信息通讯。</dd>
			<dd class="mt20">
				<input type="text" size="50" value="请填写您的电子邮件" class="inp01 c666" runat="server" id="txtEmail" />
				<span class="cRed pl5">*</span>
				<asp:RequiredFieldValidator ControlToValidate="txtEmail" Text="请填写电子邮箱地址" Display="Dynamic" CssClass="error" runat="server"></asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ControlToValidate="txtEmail" Text="电子邮件格式错误" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  Display="Dynamic" CssClass="error" runat="server"></asp:RegularExpressionValidator>
			</dd>
		</dl>
		<div class="clear"></div>
		<p class="c666 mt15 pt15 pb5 t_dashed mr5 ml5"><strong class="f14">注意：</strong>1、我们不会公开您的电子邮件，您在此提供的电子邮件地址不会被用于其他的商业用途，请放心填写。</p>
		<p class="c666 mr5 ml5">2、为保证邮件能及时送达，请将本网站电子邮件：[<%= NSW.OConfig.SMTP.Sender %>]加入到您的电子邮件允许接收地址。</p>
		<div class="tc pt15 pb15">
			<asp:Button  CssClass="b f14 b13 cWhite" Text="提 交" runat="server" id="btnSubmit" OnClick="btnSubmit_Click" />
			<input type="button" class="b f14 cWhite b14 ml10" value="返 回" onclick="$a('我们不会公开您的电子邮件，您在此提供的电子邮件地址不会被用于其他的商业用途，请放心填写。')" />
		</div>
	</div>
</div>
</form>
<!--Content:End-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
</body>
</html>