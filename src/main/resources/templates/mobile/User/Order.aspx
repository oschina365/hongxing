<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Mobile.User.Order, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的意向订单</title>
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
            dic.Add("我的意向订单", "");

            HybridDictionary keyvalues = new HybridDictionary();
            keyvalues.Add("dic", dic);
        %>
        <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Header.html;M_Common/BackPreviousControl.html;M_Common/SearchControl.html", keyvalues)%>

        <!--我的意向订单-->
        <div class="g-bd z-order">
            <%=NVEngine.NVTempHelp.LoadNVTemp(Context,"M_Common/locl.html") %>
            <div class="m-con-2">
                <asp:Repeater ID="rptList" runat="server">
                    <ItemTemplate>
                        <div class="m-ccon">
                            <p><i class="s-wc">订单内容</i>：<%# Eval("UserRemark") %></p>
                            <p class="reply"><i class="s-wc">回复：</i><%# Eval("AdminRemark").ToString()==""?"暂无回复！":Eval("AdminRemark") %></p>
                        </div>
                    </ItemTemplate>
                     <FooterTemplate>
                            <asp:Label ID="lbEmpty" CssClass="emptyData" Text="暂无数据！" ForeColor="Red" runat="server" Visible='<%#bool.Parse((rptList.Items.Count==0).ToString())%>'></asp:Label>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <!--分页-->
<%--            <uc1:OranPager runat="server" ID="OranPager1" />--%>

            <p class="show_more z-pad">
                <input type="button" name="" value="返 回" class="u-co-bt" onclick="javascript: window.location = '/Mobile/User/Index.aspx'" />
            </p>
            <div class="clear"></div>
        </div>

        <!--底部开始-->
        <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Footer.html")%>
    </form>
</body>
<script type="text/javascript" src="/Mobile/js/Jquery.js"></script>
<script type="text/javascript" src="/Mobile/js/Nsw_mobile.js"></script>
<script type="text/javascript" src="/Mobile/js/Tools.js"></script>
</html>
