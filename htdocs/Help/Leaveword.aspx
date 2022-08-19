<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Help.Help_Leaveword, qwt" enableviewstate="true" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>在线留言,武汉办公家具,武汉办公家具厂家,办公桌椅,办公屏风,红鑫办公家具</title>
    <meta name="keywords" content="红鑫家具联系方式,红鑫家具联系电话,武汉办公家具,办公家具公司,办公家具网,红鑫办公家具" />
    <meta name="description" content="红鑫家具24小时服务热线：400-678-5198，主营：大班台,办公屏风,办公桌,会议桌,办公椅,电脑椅,文件柜,前台,沙发,茶几等产品。展厅地址：武汉市光谷大道未来之光6栋1-3楼" />
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
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html?MARK=help&sid=0001")%>
    <!--Header:End-->
    <!--Content:Start-->
    <div class="topadcs">
        <%=NSW.Web.API.SysCommon.GetAdCodeByKeyNameM("help_liuyan","help_index")%>
    </div>
    <div class="content">
        <%=NVEngine.NVTempHelp.LoadNVTemp("Help/Category.html?columntype=help")%>
        <ucLocL:ucLocL runat="server" ID="ucLocR_1" />        
		<%=NVEngine.NVTempHelp.LoadNVTemp("Help/Leaveword02/Index.html")%>
        <form runat="server" id="form1" visible="false">
        <div class="left">
            <%=NVEngine.NVTempHelp.LoadNVTemp("Help/Column.html?columntype=help")%>
            <%=NSW.OConfig2.SMTP.leftLx %>
        </div>
        <div class="right">
            <div class="righttop"></div>
            <div class="rightbot"></div>
            <div class="righttop"></div>
            <div class="right_main">
                <div class="help_tab">
                    <div class="bitian">
                        <div><span class="red_x1">*</span>表示必填</div>
                        <h4 class="cont_tit">请留下您的问题,我们将尽快与您联系！</h4>
                    </div>
                    <h4 class="texts"><span>用户留言</span></h4>
                    <ul class="comments">
                        <asp:Repeater ID="rt" runat="server">
                            <ItemTemplate>
                                <li class="word"><font class="f2">用户：<%#Eval("Contact")%></font>
                                <font class="f3"><%#Convert.ToDateTime(Eval("inputtime")).ToString("yyyy-MM-dd") %></font>
                                <span class="fr">IP：<%#Eval("ip") %></span><br>
                                    <p class="f3"><%#Eval("content") %></p>
                                    <p><font class="f1">管理员回复：</font><%#Eval("Category")%></p>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                    <OranPager:OranPager runat="server" ID="pagerMain" CssClass="apage" />
                    <table class="tab_1" id="oran_table_1">
                        <tr style="display: none">
                            <td width="92" class="tab_lt">
                                <span class="red_x">*</span> 标 题：
                            </td>
                            <td width="494">
                                <input type="text" size="35" runat="server" id="txtTitle" maxlength="32" />
                                请填写您的标题名称
                            </td>
                        </tr>
                        <tr>
                            <td class="tab_lt">
                                <span class="red_x">*</span> 联系人：
                            </td>
                            <td>
                                <input type="text" size="35" runat="server" id="txtContact" maxlength="32" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtContact"
                                    Text="请填写联系人" Display="Dynamic" CssClass="error" runat="server"></asp:RequiredFieldValidator>
                                请填写您的姓名，方便我们联系您
                            </td>
                        </tr>
                        <tr>
                            <td class="tab_lt">
                                联系电话：
                            </td>
                            <td>
                                <asp:TextBox ID="txtTel1" MaxLength="4" runat="server" Style="width: 47px;"></asp:TextBox>
                                <asp:TextBox ID="txtTel2" MaxLength="10" runat="server" Style="width: 80px;"></asp:TextBox>
                                <asp:TextBox ID="txtTel3" MaxLength="5" runat="server" Style="width: 46px;"></asp:TextBox>
                                固定电话(区号-电话号码-分机)
                            </td>
                        </tr>
                        <tr>
                            <td class="tab_lt">
                                <span class="red_x">*</span> 手机号码：
                            </td>
                            <td>
                                <input type="text" size="35" runat="server" id="txtMobileNo" maxlength="16" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtMobileNo"
                                    Text="请填写手机号码" Display="Dynamic" CssClass="error" runat="server"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator CssClass="error" ID="RegularExpressionValidator5"
                                    runat="server" ErrorMessage="手机号码格式错误" ControlToValidate="txtMobileNo" Display="Dynamic"
                                    ValidationExpression="\d{11,13}"></asp:RegularExpressionValidator>
                                请填写您的手机号码
                            </td>
                        </tr>
                        <tr>
                            <td class="tab_lt">
                                电子邮件：
                            </td>
                            <td>
                                <input type="text" size="35" runat="server" id="txtEmail" maxlength="128" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtEmail"
                                    Text="电子邮件格式错误" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    Display="Dynamic" CssClass="error" runat="server"></asp:RegularExpressionValidator>
                                请填写您的电子邮件
                            </td>
                        </tr>
                        <tr>
                            <td class="tab_lt tab_bz">
                                <span class="red_x">*</span>备注：
                            </td>
                            <td>
                                <textarea cols="80" rows="5" runat="server" id="txtContent" class="ks5"></textarea>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtContent"
                                    Text="请填写问题描述" Display="Dynamic" CssClass="error" runat="server"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                请填写您的<span class="span_1">问题描述</span>，有您的支持，是我们不断前进的动力，<span class="span_1">感谢您的支持！</span>
                            </td>
                        </tr>
                        <tr runat="server" id="cntrVerCode">
                            <td class="tab_lt">
                                <span class="red_x">*</span> 验证码：
                            </td>
                            <td>
                                <input type="text" size="15" runat="server" id="txtVerCode" maxlength="8" onfocus="showVerifyCode()" />
                                <cite><span id="spVerCode"></span><span id="spVerCodeMsg" class="hd"></span><a id="spChgVerCode"
                                    class="p hd" href="###" onclick="changeVerCode()">看不清？！</a></cite>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtVerCode"
                                    Text="请填写验证码" Display="Dynamic" CssClass="error" runat="server"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button runat="server" ID="btnSubmit" CssClass="b17" Text="提 交" OnClick="btnSubmit_Click" />
                                <input type="button" class="b18" value="重 填" onclick="emptyText('oran_table_1')" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="rightbot"></div>
        </div>
        <div class="clear"></div>
        </form>
    </div>
    <!--Content:End-->
    <!--Footer:Start-->
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
    <!--Footer:End-->
</body>
</html>
