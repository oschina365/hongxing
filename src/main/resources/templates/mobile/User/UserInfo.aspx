<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Mobile.User.UserInfo, qwt" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改个人资料</title>
    <link href="/mobile/css/skins.css" rel="stylesheet" type="text/css" />
    <link href="/mobile/css/user.css" rel="stylesheet" type="text/css" />
    <link href="/mobile/css/common.css" rel="stylesheet" type="text/css" />
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
        dic.Add("修改个人资料", "");

        HybridDictionary keyvalues = new HybridDictionary();
        keyvalues.Add("dic", dic);
    %>
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Header.html;M_Common/BackPreviousControl.html;M_Common/SearchControl.html", keyvalues)%>
    <!--头部-->

    <!--修改个人资料-->
    <div class="g-bd">
        <%=NVEngine.NVTempHelp.LoadNVTemp(Context,"M_Common/locl.html") %>
        <div class="m-con-1 z-reg">
            <h5 class="xgmm">我的姓名：</h5>
            <p>
                <input id="txtUserName" class="u-inna name clear_word" type="text" name="" value='<%=user.ChnName %>' />
                <input id="txtUserName1" type="hidden" value='<%=user.ChnName %>' />
            </p>
            <h5 class="xgmm">我的手机：</h5>
            <p>
                <input id="txtPhone" class="u-inna name clear_word" type="text" name="" value='<%=user.MPhone %>' /><span id="validate1" class="red"></span>
                <input id="txtPhone1" type="hidden" value='<%=user.MPhone %>' />
            </p>
            <h5 class="xgmm">我的邮箱：</h5>
            <p>
                <input id="txtEmail" class="u-inna name clear_word" type="text" name="" value='<%=user.UserEmail %>' /><span id="validate2" class="red"></span>
                <input id="txtEmail1" type="hidden" value='<%=user.UserEmail %>' />
            </p>
            <h5 class="xgmm">详细地址：</h5>
            <p>
                <input id="txtAddress" class="u-inna name clear_word" type="text" name="" value='<%=user.Address %>' />
                <input id="txtAddress1" type="hidden" value='<%=user.Address %>' />
                <span id="validate3" class="red"></span>
            </p>
            <p class="show_more">
                <input type="button" name="" value="提 交" class="u-co-bt fr" onclick="UpdateUserData()" />
            </p>
            <p class="clear"></p>
        </div>
    </div>
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Footer.html")%>
</body>
<script type="text/javascript" src="/mobile/js/Jquery.js"></script>
<script type="text/javascript" src="/mobile/js/Nsw_mobile.js"></script>
<script type="text/javascript" src="/mobile/js/Tools.js"></script>
</html>
