<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Mobile.User.MyFaq, qwt" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>加盟申请</title>
    <meta name="keywords" content="营销型网站,营销型网站建设,深圳网站建设,牛商网,网站托管,网站建设公司" />
    <meta name="description" content="牛商网是深圳营销型网站建设公司,中国营销型网站创始者,营销型网站标准制定者,服务范围营销型网站建设,网站运营托管,网站外包,深圳网站建设等,咨询热线:4000-333-087" />
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
    <%
        NVelocity.VelocityContext Context = NVEngine.NVTempHelp.GetVelocityContext();
        System.Collections.Generic.Dictionary<object, object> dic = NVTools.Tools.GetEmptyDictionary();
        dic.Add("会员中心", "/Mobile/User/Index.aspx");
        dic.Add("加盟申请", "");

        HybridDictionary keyvalues = new HybridDictionary();
        keyvalues.Add("dic", dic);
    %>
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Header.html;M_Common/BackPreviousControl.html;M_Common/SearchControl.html", keyvalues)%>

    <!--我的意向订单-->
    <div class="g-bd">
        <%=NVEngine.NVTempHelp.LoadNVTemp(Context,"M_Common/locl.html") %>
        <div class="m-con-2">
            <div class="m-ccon">
                <asp:Panel ID="Panel1" runat="server">
                    <p class="s-orbg">您于<%=InputTime %>提交的加盟申请如下：</p>
                    <p><%=ShortDesc %></p>
                    <p class="reply"><i class="s-wc">亲，工作人员已于<%=InputTime %>，查看了您的加盟申请，我们会尽快与您联系。</i></p>
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Visible="false">
                    <p>您还没有任何加盟申请信息，如需加盟，请点击 <a style="color: #3372A2;" href='/Mobile/User/Faq.aspx'>留言</a></p>
                </asp:Panel>
            </div>
        </div>

        <p class="show_more z-pad">
            <input type="button" name="" value="返 回" class="u-co-bt z-spe" onclick="javascript: window.location = '/Mobile/User/Index.aspx'">
        </p>
        <div class="clear"></div>
    </div>

    <!--底部开始-->
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Footer.html")%>
    <!--底部结束-->
</body>
<script type="text/javascript" src="/Mobile/js/Jquery.js"></script>
<script type="text/javascript" src="/Mobile/js/Nsw_mobile.js"></script>
</html>
