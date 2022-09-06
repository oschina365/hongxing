<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Mobile.User.Message, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>在线咨询/反馈/加盟申请</title>
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
    %>
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Header.html;M_Common/BackPreviousControl.html;M_Common/SearchControl.html")%>
    <!--搜索结束-->
    <h3 class="bread_tit"><a href="/mobile/">首页</a><span></span></h3>
    <!--弹出提示层-->
    <div class="max_bg">
        <div class="right">
            <p>感谢您的留言，我们会尽快给您回复！</p>
            <p><a href="/mobile/Template/Product/Model/Index/model1.html" class="blue">返回首页</a></p>
        </div>
        <div class="wrong">
            <span></span>
            <p>提交失败，请检查网络是否有问题！</p>
            <p><a href="#1" class="blue retry">返回上一页</a><a href="/mobile/Template/Product/Model/Index/model1.html" class="blue">返回首页</a></p>
        </div>
    </div>

    <!--底部开始-->
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Footer.html")%>
    <!--底部结束-->
</body>
<script type="text/javascript" src="/mobile/js/Jquery.js"></script>
<script type="text/javascript" src="/mobile/js/Nsw_mobile.js"></script>
<script src="/mobile/js/Tools.js"></script>
<script type="text/javascript">
    $(function () {
        $(".right").hide();
        $(".wrong").hide();
        var paras = "faqresult";
        var url = location.href;
        var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
        var paraObj = {}
        for (i = 0; j = paraString[i]; i++) {
            paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
        }
        var returnValue = paraObj[paras.toLowerCase()];
        if (typeof (returnValue) == "undefined") {
            $(".wrong").show();
        } else if (parseInt(returnValue) >= 0) {
            $(".right").show();
        } else {
            $(".wrong").show();
        }
    });
</script>
</html>

