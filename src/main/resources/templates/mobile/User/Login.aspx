<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Mobile.User.Login, qwt" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>会员登录</title>
    <link href="/mobile/css/skins.css" rel="stylesheet" type="text/css" />
    <link href="/mobile/css/user.css" rel="stylesheet" type="text/css" />
    <link href="/mobile/css/common.css" rel="stylesheet" type="text/css">
    <link rel="apple-touch-icon-precomposed" href="/mobile/images/common/touch-icon.png" />

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
    <%
        NVelocity.VelocityContext Context = NVEngine.NVTempHelp.GetVelocityContext();
        System.Collections.Generic.Dictionary<object, object> dic = NVTools.Tools.GetEmptyDictionary();
        dic.Add("会员中心", "/mobile/User/Index.aspx");
        dic.Add("会员登录", "");

        HybridDictionary keyvalues = new HybridDictionary();
        keyvalues.Add("dic", dic);
    %>
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Header.html;M_Common/BackPreviousControl.html;M_Common/SearchControl.html", keyvalues)%>
    <!--登录开始-->
    <div class="g-bd">
        <%=NVEngine.NVTempHelp.LoadNVTemp(Context,"M_Common/locl.html") %>
        <div class="m-con-1">
            <form runat="server" id="form1">
                <h5 class="xgmm">手机号/邮箱：</h5>
                <p>
                    <asp:TextBox ID="txtUserName" class="name u-inna clear_word" value="请输入手机号/邮箱" runat="server"></asp:TextBox>
                </p>
                <h5 class="xgmm">密码：</h5>
                <p>
                    <asp:TextBox ID="txtPassword" class="name u-inna clear_word" TextMode="Password" runat="server"></asp:TextBox>
                </p>
                <p class="clear"></p>
                <p id="ErrorInfo" style="color: red;"><%=ErrorInfo %></p>
                <p class="show_more">
                    <asp:Button ID="btnLogin" runat="server" class="u-co-bt z-spe" Text="登  录" OnClick="btnLogin_Click" />
                </p>
                <p class="clear"></p>
                <p class="Halog"><a href="/mobile/User/Register.aspx" class="havlog">立刻注册</a><a href="/mobile/User/GetPassword.aspx" class="forget">忘记密码？</a></p>
            </form>
        </div>
    </div>
    <!--登录结束-->
    <!--底部开始-->
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Footer.html")%>
    <!--底部结束-->
</body>
<script type="text/javascript" src="/mobile/js/Jquery.js"></script>
<script type="text/javascript" src="/mobile/js/Nsw_mobile.js"></script>
<script src="/mobile/js/Tools.js"></script>
</html>
