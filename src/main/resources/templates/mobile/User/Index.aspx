<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Mobile.User.Index, qwt" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>会员区首页</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
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
            //dic.Add("修改个人资料", "");

            HybridDictionary keyvalues = new HybridDictionary();
            keyvalues.Add("dic", dic);
        %>
        <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Header.html;M_Common/BackPreviousControl.html;M_Common/SearchControl.html", keyvalues)%>

        <!--帮助列表-->
        <div class="g-bd">
            <%=NVEngine.NVTempHelp.LoadNVTemp(Context,"M_Common/locl.html") %>
            <h4 class="f-tc  welcome">欢迎您登录会员中心</h4>
            <div class="m-con">
                <ul class="helplist">
                    <li class="first"><a href="/Mobile/User/order.aspx" class="helplia">我的意向订单</a></li>
                    <li><a href="/Mobile/User/MyFaq.aspx" class="helplia">我的加盟申请</a></li>
                    <li><a href="/Mobile/User/UserInfo.aspx" class="helplia">更改个人资料</a></li>
                    <li><a href="/Mobile/User/ChangePws.aspx" class="helplia">更改密码</a></li>
                    <li><%--<a href="" class="helplia">退出</a>--%>
                        <asp:LinkButton CssClass="helplia" ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">退出</asp:LinkButton>
                    </li>
                </ul>
                <div class="clear"></div>
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
