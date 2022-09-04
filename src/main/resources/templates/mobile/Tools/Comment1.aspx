<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Mobile.MArticles.Comment1, qwt" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>评论详细页</title>
    <meta name="keywords" content="营销型网站,营销型网站建设,深圳网站建设,牛商网,网站托管,网站建设公司" />
    <meta name="description" content="牛商网是深圳营销型网站建设公司,中国营销型网站创始者,营销型网站标准制定者,服务范围营销型网站建设,网站运营托管,网站外包,深圳网站建设等,咨询热线:4000-333-087" />
    <link href="/Mobile/css/skins.css" rel="stylesheet" type="text/css" />
    <link href="/Mobile/Css/news.css" rel="stylesheet" type="text/css" />
    <link href="/Mobile/Css/common.css" rel="stylesheet" type="text/css" />
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
        %>
        <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Header.html;M_Common/BackPreviousControl.html")%>
        <p class="kong"></p>
        <!--新闻详细页-->
        <div class="g-bd">
            <!--新闻导航-->
            <%
                System.Collections.Generic.Dictionary<object, object> dic = NVTools.Tools.GetEmptyDictionary();
                dic.Add("评论","");

                HybridDictionary keyvalues = new HybridDictionary();
                keyvalues.Add("dic", dic);
            %>
            <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/locl.html", keyvalues)%>
            <%--<BottomHelp:LocR runat="server" ID="LocR" />--%>
            <div class="m-con">

                <!--网友热评-->
                <div class="m-com">
                    <h2 class="u-mt">关于"<i class="s-wc"><%= newsTitle %></i>"的评论</h2>
                    <div class="u-idet">
                        <textarea name="" id="txtComment" value="还可以输入140个字" class="clear_word">还可以输入140个字</textarea>
                        <div id="validate" class="red"></div>
                    </div>
                    <div class="u-btn">
                        <input class="u-co-bt z-spe z-zz" type="button" value="我要评论" name="" onclick="postComment(this, <%=OID %>, <%= Type %>)" />
                    </div>
                   
                </div>
                <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/SearchControl.html")%>
            </div>
        </div>

        <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Footer.html")%>
    </form>
</body>
<script type="text/javascript" src="/Mobile/js/Jquery.js"></script>
<script type="text/javascript" src="/Mobile/js/Nsw_mobile.js"></script>

<script type="text/javascript" src="/Mobile/js/Tools.js"></script>
</html>
