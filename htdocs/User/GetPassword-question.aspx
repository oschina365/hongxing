<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.User_GetPassword_question, qwt" enableviewstate="true" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
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
        <form runat="server" id="form1" defaultfocus="txtAnswer" defaultbutton="btnNext">
        <div class="left">
            <div class="left_ad" style="height: 250px">
            <%=NSW.BLL.Site.GetAdCodeByKeyName("getpassword")%>
            </div>
        </div>
        <div class="right">
            <div class="u_right_main">
                <UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
                <div class="getpwd_tips">
                    用户名 <q>
                        <%= OUsername %></q> 存在，在这一步系统将验证您的密码提示答案。</div>
                <table class="pass_tab">
                    <tr>
                        <td class="tr">
                            您设置的问题：<asp:HiddenField runat="server" ID="hdnQues" />
                        </td>
                        <td runat="server" id="tdQuestion">
                        </td>
                    </tr>
                    <tr>
                        <td class="tr">
                            您设置的答案：
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtAnswer" MaxLength="32"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator99" runat="server"
                                ErrorMessage="**" ControlToValidate="txtAnswer" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="tr">
                            新密码：
                        </td>
                        <td>
                            <asp:TextBox ID="txtNewPin" CssClass="oran__m_text" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RegularExpressionValidator CssClass="error" ID="RegularExpressionValidator2"
                                runat="server" ErrorMessage="密码长度有误" ControlToValidate="txtNewPin" Display="Dynamic"
                                SetFocusOnError="true" ValidationExpression="^.{6,16}$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="tr">
                            确认新密码：
                        </td>
                        <td>
                            <asp:TextBox ID="txtConfirmPin" CssClass="oran__m_text" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="密码不一致"
                                ControlToValidate="txtConfirmPin" ControlToCompare="txtNewPin" Display="Dynamic"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="tr">
                            验证码：
                        </td>
                        <td>
                            <asp:TextBox ID="txtVerCode" runat="server" onfocus="showVerifyCode()"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="error" SetFocusOnError="true" ID="RequiredFieldValidator3"
                                runat="server" ErrorMessage="**" Display="Dynamic" ControlToValidate="txtVerCode"></asp:RequiredFieldValidator>
                            <div>
                                <span id="spVerCode"></span><span id="spVerCodeMsg" class="hd"></span><a id="spChgVerCode"
                                    class="p hd" href="###" onclick="changeVerCode()">看不清？！</a></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="tr">
                        </td>
                        <td height="25">
                            <input type="button" class="b18" value="上一步" onclick="location.href='GetPassword-question-username.aspx'" />
                            <asp:Button runat="server" ID="btnNext" OnClick="btnNext_Click" CssClass="b17" Text="下一步" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="clear">
        </div>
        </form>
    </div>
    <!--Content:End-->
    <!--Footer:Start-->
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
    <!--Footer:End-->
</body>
</html>