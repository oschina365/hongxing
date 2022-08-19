<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Private.Private_SendProductToYourFriends, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>分享</title>
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
<!--Content:Start-->
<div class="send_news"><form runat="server" id="form1" style="background:#fff;">
		<h4>
		    <span class="fr"><a href="javascript:void(0)" onclick="hideMailAtricle()"><img src="<%= SkinPath %>Img/ico9_close.gif" alt="关闭" /></a></span>
		    推荐给朋友
		</h4>
		<dl>
			<dt><asp:Literal runat="server" ID="ltlImg"></asp:Literal></dt>
			<dd class="first"><asp:Literal runat="server" ID="ltlA"></asp:Literal><asp:Literal runat="server" ID="ltlTitleInfo"></asp:Literal></dd>
			<dd class="last"><asp:Literal runat="server" ID="ltlContent"></asp:Literal></dd>
		</dl>
		<div class="sn_cont">
			<p class="b">您朋友的电子邮件地址 <span>*</span></p>
			<p>
				<asp:TextBox runat="server" ID="txtEmail" size="50" class="inp02" MaxLength="120" />
				<asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="**" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator CssClass="error" ID="RegularExpressionValidator6" runat="server" ErrorMessage="格式错误"
                                                ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
			</p>
			<p class="b">标题 <span>*</span></p>
			<p>
				<asp:TextBox runat="server" ID="txtSubject" size="50" class="inp02" MaxLength="100" />
				<asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="**" ControlToValidate="txtSubject"></asp:RequiredFieldValidator>
			</p>
			<div runat="server" id="cntrVerCode">
			    <p class="b">验证码 <span>*</span></p>
			    <p>
				    <asp:TextBox ID="txtVerCode" onfocus="showVerifyCode()" runat="server" MaxLength="12"></asp:TextBox>
                    <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="**" ControlToValidate="txtVerCode"></asp:RequiredFieldValidator>
                    <cite style="display:block;font-style:normal;"><span id="spVerCode"></span><span id="spVerCodeMsg" class="hd"></span><a id="spChgVerCode" class="p hd" href="###" onclick="changeVerCode()">看不清？！</a></cite>
			    </p>
			</div>
			<p class="b f12">发件人批注(不超过500字)</p>
			<p>
				<asp:TextBox runat="server" ID="txtBody" TextMode="MultiLine" style="width:400px;height:100px;" max="500" onkeyup="limitLength(this)" />
			</p>
			<p>
				<asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" class="b13" Text="发 送" />
			</p>
			<div class="last">
				<p class="b"><span>*</span>必填</p>
				<p>您在此提供的电子邮件地址不会被用于其他的目的。</p>
			</div>
		</div>
	
</form></div>
<!--Content:End-->
</body>
</html>
