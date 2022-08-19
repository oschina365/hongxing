<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Mobile.User.GetPassword_email_changepws, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html>

<html>
<head runat="server">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>找回密码</title>
    <link href="/Mobile/css/skins.css" rel="stylesheet" type="text/css" />
    <link href="/Mobile/Css/user.css" rel="stylesheet" type="text/css" />
    <link href="/Mobile/Css/common.css" rel="stylesheet" type="text/css" />
    <link rel="apple-touch-icon-precomposed" href="/Mobile/images/common/touch-icon.png" />
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
 <form id="form1" runat="server">
    <%
        NVelocity.VelocityContext Context = NVEngine.NVTempHelp.GetVelocityContext();
        System.Collections.Generic.Dictionary<object, object> dic = NVTools.Tools.GetEmptyDictionary();
        dic.Add("会员中心", "/Mobile/User/Index.aspx");
        dic.Add("找回密码", "/Mobile/User/GetPassword.aspx");
        dic.Add("重置密码", "");

        HybridDictionary keyvalues = new HybridDictionary();
        keyvalues.Add("dic", dic);
    %>
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Header.html;M_Common/BackPreviousControl.html;M_Common/SearchControl.html", keyvalues)%>
    <!--修改密码-->
    <div class="g-bd">
        <%=NVEngine.NVTempHelp.LoadNVTemp(Context,"M_Common/locl.html") %>
        <div class="m-con-1">
            <h5 class="xgmm">您的用户名：</h5>
            <p>
                <asp:TextBox ID="txtUserName"  class="name clear_word u-inna" runat="server"></asp:TextBox>
            </p>
            <h5 class="xgmm">新密码：</h5>
            <p>
                <asp:TextBox ID="txtNewPin"  class="name clear_word u-inna" TextMode="Password" runat="server"></asp:TextBox>
            </p>
            <h5 class="xgmm">确认新密码：</h5>
            <p>
                <asp:TextBox ID="txtConfirmPin" class="name clear_word u-inna" runat="server" TextMode="Password"></asp:TextBox>
                <asp:Label ID="validate" CssClass="red" runat="server"></asp:Label>
            </p> 
            <p class="show_more">
                <input type="button" id="btnSave" value="提 交" class="u-co-bt z-spe" onclick="UpdatePwd('<%=Code %>')" />
            </p>
            <p class="clear"></p>
        </div>
    </div>
     <!--弹出提示层-->
        <div class="max_bg" id="max_bg">
            <div runat="server" id="contapic_bg" class="contapic_bg"></div>
            <div runat="server" class="right" id="right">
                <p>密码修改成功,3秒后回到登陆页</p>
                <p><a href="/Mobile/" class="blue">回到首页</a></p>
            </div>
        </div>
    <!--底部开始-->
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Footer.html")%>
    </form>

</body>
<script type="text/javascript" src="/Mobile/js/Jquery.js"></script>
<script type="text/javascript" src="/Mobile/js/Nsw_mobile.js"></script>
<script type="text/javascript" src="/Mobile/js/Tools.js"></script>
</html>
