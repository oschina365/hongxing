<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Mobile.User.GetPassword, qwt" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>忘记密码</title>
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
        dic.Add("忘记密码", "");

        HybridDictionary keyvalues = new HybridDictionary();
        keyvalues.Add("dic", dic);
    %>
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Header.html;M_Common/BackPreviousControl.html;M_Common/SearchControl.html", keyvalues)%>
    <!--忘记密码开始-->
    <div class="g-bd">
        <%=NVEngine.NVTempHelp.LoadNVTemp(Context,"M_Common/locl.html") %>
        <form runat="server">
            <div class="m-con-1">
                <h5 class="xgmm">请输入邮箱：</h5>
                <p>
                    <asp:TextBox ID="txtEmail" class="name clear_word u-inna" value="请输入邮箱" runat="server"></asp:TextBox>
                </p>
                <h5 class="xgmm">验证码：</h5>
                <p>
                    <asp:TextBox ID="txtCode" class="name z-spe" value="请输入验证码" runat="server" onblur="if(this.value==''){this.value='请输入验证码';this.style.color='#D0D0D0'}" onfocus="if(this.value=='请输入验证码'){this.value='',this.style.color='#666666';} showVerifyCode()"></asp:TextBox>
                    <a href="javascript:changeVerCode()" class="f-fl"><span id="spVerCode"></span></a><span id="spVerCodeMsg" class="hd"></span>
                    <a href="javascript:void(0)" id="changeCode" onclick="changeVerCode()" class="s-wc f-ma-15">换一张</a>
                </p>
                <p class="clear"></p>
                <p style="color: red;"><%= ErrorInfo %></p>
                <p class="show_more">
                    <asp:Button ID="btnPost" runat="server" Text="提交" class="u-co-bt z-spe" OnClick="btnPost_Click" />
                </p>
                <p class="clear"></p>
                <p class="Halog"><a href="/mobile/User/Register.aspx" class="havlog">立刻注册</a><a href="/mobile/User/Login.aspx" class="havlog">会员登录</a></p>
            </div>
        </form>
    </div>
    <!--忘记密码结束-->
    <!--底部开始-->
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Footer.html")%>
    <!--底部结束-->
</body>
<script type="text/javascript" src="/mobile/js/Jquery.js"></script>
<script type="text/javascript" src="/mobile/js/Nsw_mobile.js"></script>
<script src="/mobile/js/Tools.js"></script>
</html>
