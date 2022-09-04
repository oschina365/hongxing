<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Mobile.User.Faq, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>在线咨询/反馈/加盟申请</title>
    <link href="/Mobile/css/skins.css" rel="stylesheet" type="text/css" />
    <link href="/Mobile/Css/user.css" rel="stylesheet" type="text/css" />
    <link href="/Mobile/Css/common.css" rel="stylesheet" type="text/css">
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
   <%
        NVelocity.VelocityContext Context = NVEngine.NVTempHelp.GetVelocityContext();
        System.Collections.Generic.Dictionary<object, object> dic = NVTools.Tools.GetEmptyDictionary();
        dic.Add("在线咨询/反馈/加盟申请", "");

        HybridDictionary keyvalues = new HybridDictionary();
        keyvalues.Add("dic", dic);
    %>
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Header.html;M_Common/BackPreviousControl.html",keyvalues)%>
    <!--帮助列表-->
    <div class="g-bd">
        <%=NVEngine.NVTempHelp.LoadNVTemp(Context,"M_Common/locl.html") %>
        <div class="m-con-4 z-use" runat="server" id="join">

            <div class="m-wt">
                <p class="welcome">请填写您的问题，我们会尽快给你回复！</p>
                如有任何疑问，可以随时拨打我们的服务热线：<em class="s-wc fosize"><br />
                    <a href="tel:<%=NSW.OConfig.GlobalConfig.FindPinServiceTel %>"><%=NSW.OConfig.GlobalConfig.FindPinServiceTel %></a></em>
            </div>
            <h4>简要描述（500字以内）：</h4>
            <p>
                <textarea id="txtConent" class="ly u-inna clear_word" rows="" cols="" name="">还可以输入500个字</textarea>
            </p>
            <h4 class="u-tel">填写手机号，方便我们与您联系（选填）：	</h4>
            <p>
                <input id="txtPhone" class="name u-inna clear_word" type="text" name="" value="请输入手机号">
            </p>
            <div runat="server" id="Msg"><%=MsgInfo %></div>
            <p class="show_more">
                <input type="button" name="" value="提 交" class="u-co-bt" onclick="SaveFaq('<%= PostType %>    ')" />
            </p>
        </div>
        <!--弹出提示层-->
        <div class="max_bg" id="max_bg">
            <div class="contapic_bg"></div>
            <div class="right" id="right">
                <p>提交成功，我们会认真阅读您的信息！</p>
                <p><a href="javascript:void(0);" onclick="javascript:$('.right,.contapic_bg').hide();" class="blue retry">返回</a><a href="/Mobile/" class="blue">回到首页</a></p>
            </div>
            <div class="wrong" id="wrong">
                <span></span>
                <p>提交失败，请检查网络是否有问题！</p>
                <p><a href="javascript:void(0);" onclick="javascript:$('.wrong,.contapic_bg').hide();" class="blue retry">返回</a><a href="/Mobile/" class="blue">回到首页</a></p>
            </div>
        </div>
    </div>
    <!--底部开始-->
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Footer.html")%>
    <!--底部结束-->
</body>
<script type="text/javascript" src="/Mobile/js/Jquery.js"></script>
<script type="text/javascript" src="/Mobile/js/Nsw_mobile.js"></script>
<script src="/Mobile/js/Tools.js"></script>
</html>
