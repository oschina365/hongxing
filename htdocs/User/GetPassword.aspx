<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.GetPassword, qwt" enableviewstate="True" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title>找回密码</title>
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
    <!--Header:End-->
    <!--Content:Start-->
    <div class="content">
        <div class="left">
            <div class="left_ad" style=" overflow: hidden;">
                <%=NSW.BLL.Site.GetAdCodeByKeyName("getpassword")%>
            </div>
        </div>
        <div class="right">
            <div class="u_right_main">
                <UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
                <div class="pass_tis">
                    <div>
                        <span>提示：</span></div>
                    <div>
                        如果您忘记了密码保护答案，请通过留言的方式将您的真实姓名、联系电话以及身份证的原件扫描件发送给<a href="/help/">客服中心</a>。我们会尽快与您取得联系。
                    </div>
                </div>
                <form runat="server" id="form2">
                <div class="getpassword1">
                    <div>
                        <asp:RadioButton runat="server" ID="rdoByMail" GroupName="approach" Checked="true" />
                        <label for="rdoByMail">
                            发送重置密码邮件到我的邮箱</label>
                    </div>
                    <div>
                        <asp:RadioButton runat="server" ID="rdoBySecInfo" GroupName="approach" />
                        <label for="rdoBySecInfo">
                            根据我设置的问题返回密码</label>
                    </div>
                    <div>
                        <asp:Button runat="server" OnClientClick="" ID="btnSubmit" OnClick="btnSubmit_Click"
                            CssClass="b b17 f14 cWhite" Text="下一步" /></div>
                </div>
                </form>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <!--Content:End-->
    <!--Footer:Start-->
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
    <!--Footer:End-->
</body>
</html>