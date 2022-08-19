<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.User_GetPassword_email, qwt" enableviewstate="true" enableviewstatemac="false" %>

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
    <div class="content">
        <form runat="server" id="form1" defaultfocus="txtEmail">
        <div class="left">
            <div class="left_ad" style="height: 240px; overflow: hidden;">
                <%=NSW.BLL.Site.GetAdCodeByKeyName("getpassword")%></div>
        </div>
        <div class="right">
            <div class="u_right_main">
                <UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
                <div class="getpassword2">
                    <div class="getpassword2_1">
                        请输入您注册使用的电子邮件地址</div>
                    <div class="getpassword2_3">
                        <span style="width: 90px; display: inline-block; height: 24px; line-height: 24px;
                            vertical-align: middle; overflow: hidden;">电子邮件：</span>
                        <asp:TextBox runat="server" ID="txtEmail"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator99" runat="server"
                            ErrorMessage="**" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="error"
                            ErrorMessage="格式错误" ControlToValidate="txtEmail" Display="Dynamic" SetFocusOnError="true"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <div>
                        <span style="width: 90px; display: inline-block; height: 24px; line-height: 24px;
                            vertical-align: middle; overflow: hidden;">验证码：</span>
                        <asp:TextBox ID="txtVerCode" runat="server" onfocus="showVerifyCode()"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="error" SetFocusOnError="true" ID="RequiredFieldValidator3"
                            runat="server" ErrorMessage="**" Display="Dynamic" ControlToValidate="txtVerCode"></asp:RequiredFieldValidator>
                        <div>
                            <span id="spVerCode"></span><span id="spVerCodeMsg" class="hd"></span><a id="spChgVerCode"
                                class="p hd" href="###" onclick="changeVerCode()">看不清？！</a></div>
                    </div>
                    <div class="getpassword2_2">
                        <input type="button" class="b18" value="上一步" onclick="location.href='GetPassword.aspx'" />
                        <asp:Button runat="server" ID="btnNext" OnClick="btnNext_Click" CssClass="b17" Text="下一步" />
                    </div>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
        </form>
    </div>
    <!--Content:End-->
    <!--Footer:Start-->
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
    <!--Footer:End-->
</body>
</html>