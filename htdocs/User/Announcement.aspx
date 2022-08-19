<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.Announcement, qwt" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>会员公告</title>
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
    <!--Header:Start-->
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
    <!--Header:end-->
    <!--Content:Start-->
     <div class="content">
        <UserActions:UserActions runat="server" ID="uc_UserActions_1" />
        <div class="right">
            <div class="cart_content">
                <div class="cart_main">
                    <asp:Repeater runat="server" ID="rpt">
                        <ItemTemplate>
                            <div class="n_info_con" id="printableview">
                                <h3>
                                    <%# Eval("Title") %></h3>
                                <div class="info_con_tit">
                                    <div class="n_tit">
                                        <span>发表时间：<%# ((DateTime)Eval("ShowTime")).ToString("yyyy-MM-dd HH:mm") %></span></div>
                                </div>
                                <div id="cntrBody">
                                    <%# Eval("Content") %>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div runat="server" id="nodata" visible="false">
                        暂无公告</div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
    <!--Content:End-->
    <!--Footer:Start-->
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
    <!--Footer:End-->
</body>
</html>
