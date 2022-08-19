<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.User_GetPassword_validresult_ok, qwt" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>成功重置密码</title>
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
            <div class="b4">
                <%=NSW.BLL.Site.GetAdCodeByKeyName("getpassword")%></div>
        </div>
        <div class="right">
            <div class="u_right_main">
                <UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
                <div class="zc_cg">
                    <div>
                        <img src="<%= SkinPath %>Img/lc_ico_img.gif" alt="成功" /></div>
                    <div>
                        系统已经发送一封密码修改确认函到您的电子邮箱[<%= Email %>]，请到您的电子邮箱进入下一步操作。</div>
                    <div>
                        <input type="button" class="b17" value="登录" onclick="location.href='login.aspx'" />
                        <input type="button" class="b18" value="网站首页" onclick="location.href='/'" />
                    </div>
                </div>
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