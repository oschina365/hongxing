<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Private.UnBookEmail, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>邮件退订</title>
 <link href="/css/temp.css" rel="stylesheet" type="text/css" />
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
<div class="cart_content">
<form runat="server" id="form1">
	<div class="stf">
		<dl> 
			<span>邮件退订</span>
			<dd>您选择的是退订我们的邮件，请选择您要退订的原因，方便我们以后做的更好。</dd>
			<asp:Repeater runat="server" ID="rpt"><ItemTemplate><dd>
				<input type="radio" onclick="$v('txtReason',this.value);$g('txtEmail').focus();" name="reason" value="<%# Eval(REASON_COLUMN_NAME) %>" id="rdo_reason_<%# Container.ItemIndex %>" onclick="" />
				<label for="rdo_reason_<%# Container.ItemIndex %>"><%# Eval(REASON_COLUMN_NAME)  %></label>
			</dd></ItemTemplate></asp:Repeater>
			<dd>
				<input name="reason" onclick="$v('txtReason','');$g('txtReason').focus();" type="radio" value="" id="rdo_reason_other" />
				<label for="rdo_reason_other">其它</label>
			</dd>
			<dd><strong class="pl18">如果都不是以上原因，请填写您需要我们改进的意见</strong></dd>
			<dd><span class="pl18">
				<textarea cols="55" rows="5" runat="server" id="txtReason"></textarea>
				</span></dd>
			<dd><strong class="pl18">您的电子邮件:</strong></dd>
			<dd>
			    <span class="pl18">
				<input type="text" class="inp01" size="50" runat="server" id="txtEmail" />
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtEmail" Text="请填写电子邮箱地址" Display="Dynamic" CssClass="error" runat="server"></asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtEmail" Text="电子邮件格式错误" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  Display="Dynamic" CssClass="error" runat="server"></asp:RegularExpressionValidator>
				</span>
			</dd>
		</dl>
		<div class="clear"></div>
		<p class="c666 mt15 pt15 pb5 t_dashed mr5 ml5"><strong class="f14">注意：</strong></p>
		<p>1、退订后我们网站将不会继续给你提供最新的资讯。</p>
		<p class="c666 mr5 ml5">2、您的电子邮件将会从我们的邮件库里面删除。</p>
		<div class="tc pt15 pb15">
			<asp:Button  CssClass="b f14 b13 cWhite" Text="提 交" runat="server" id="btnSubmit" OnClick="btnSubmit_Click" />
			<input type="button" class="b f14 cWhite b14 ml10" value="返 回" />
		</div>
	</div>
</form></div>
<!--Content:End-->
<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</body>
</html>