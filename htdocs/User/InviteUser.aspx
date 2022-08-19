<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.InviteUser, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register Assembly="OranChinaRegion" Namespace="Oran.WebControl" TagPrefix="chinaRegion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>会员中心首页</title>
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
<body><form runat="server" id="form1">
<!--Header:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Header:End-->
<!--Content:Start-->
<div class="content">
	<UserActions:UserActions runat="server" ID="uc_UserActions_1" />
	<div class="right">
    	<div class="u_right_main">
        	<UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
        	<div class="u_dingyue">
			     <dl>
				   <dt><img  src="<%= SkinPath %>Img/u_invitation.gif" alt="邀请注册" /></dt>
				 
                   <dd class="tit_b">
                   	 <%--<img src="<%= SkinPath %>Img/u_invitation_2.gif" /> <a href="/Helps/jifenzhidu.html" class="a_1" target="_blank">查看积分制度 </a>--%>
				     <img src="<%= SkinPath %>Img/u_invitation_2.gif" /> <a href="InviteUserList.aspx" class="a_2">我推荐的用户列表</a></dd>
				 </dl>
			    <div class="clear"></div>
			</div>
           <div class="u_dy_main">
		        <div class="u_dy_main_title">要邀请其他人使用<%= NSW.OConfig.GlobalConfig.SiteName %>会员中心，请在此处键入他们的电子邮件地址</div>
				<textarea  runat="server" id="txtBatchTo" onfocus="focusToRemoveText(this)" hadfocused="0" style="width:500px;height:80px;">您可以在此处键入电子邮件地址，以半角分号分隔。如:nsw88@163.com;admin@sina.com</textarea>
				<asp:RequiredFieldValidator CssClass="error" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ControlToValidate="txtBatchTo"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator CssClass="error" Display="Dynamic" ControlToValidate="txtBatchTo" ValidationExpression="^(\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)(;\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)*;?$" ID="RegularExpressionValidator1" runat="server" ErrorMessage="格式错误"></asp:RegularExpressionValidator>
                <div class="u_dy_main_title">为邀请函添加备注(可选)</div>
				<textarea name="textarea" runat="server" id="txtBody" style="width:500px;height:80px;"></textarea>
		   </div>
           <div class="bot_btn"><asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" CssClass="b17" Text="发送邀请" /></div>
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