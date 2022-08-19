<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Agent.Apply, qwt" enableviewstate="true" enableviewstatemac="false" %>

<%@ Register Assembly="OranChinaRegion" Namespace="Oran.WebControl" TagPrefix="chinaRegion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title>招商加盟</title>
    <meta name="keywords" content="招商加盟" />
    <meta name="description" content="招商加盟" />
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
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html?MARK=agent")%>
    <!--Header:End-->
    <!--Content:Start-->
    <div class="topadcs">
        <%=NSW.Web.API.SysCommon.GetAdCodeByKeyNameM("agent_topad","agent_index")%>
    </div>
    <div class="content">
        <form runat="server" id="form1">
        <div class="left">
            <%=NVEngine.NVTempHelp.LoadNVTemp("Column/Help/index.html?sid=0001&columntype=help")%>
            <%=NSW.OConfig2.SMTP.leftLx %>
        </div>
        <div class="right">
            <ucLocL:ucLocL runat="server" ID="ucLocR_1" />
            <h4 class="rtit">在线申请加盟</h4>
            <div class="right_main">
                <div class="agent_con">
                    <div class="agenttop">
                        <div>
                            您可以下载我们完整版的招商回执Word文档，填写完整后传真到我们公司
                            <input type="button" class="b22" onclick="window.open('<%= NSW.OConfig.GlobalConfig.AgencyApplicationForm  %>')"
                                value="电子版下载" /></div>
                        <div class="call">
                            我们的传真号码是：<span><%= NSW.OConfig.GlobalConfig.AgencyFax %></span></div>
                          
                          <div class="bitian"><div><span class="red_x1">*</span>表示必填</div><h4 class="cont_tit">请留下您的问题,我们将尽快与您联系！</h4></div>
                    </div>
                </div>
             
                <table class="tab_1">
                    <tr>
                        <td width="120" class="tab_lt">
                            <span class="red_x">*</span> 公司名称：
                        </td>
                        <td width="536">
                            <asp:TextBox ID="txtCompName" Style="width: 160px;" MaxLength="128" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" runat="server"
                                CssClass="error" ErrorMessage="**" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                            请填写贵公司名称，如果是个人，则填写个人姓名
                        </td>
                    </tr>
                    <tr>
                        <td class="tab_lt">
                            <span class="red_x">*</span> 联系人姓名：
                        </td>
                        <td>
                            <asp:TextBox ID="txtRealName" MaxLength="50" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" SetFocusOnError="true" runat="server"
                                CssClass="error" ErrorMessage="**" Display="Dynamic" ControlToValidate="txtRealName"></asp:RequiredFieldValidator>
                            请填写您的真实姓名
                        </td>
                    </tr>
                    <tr>
                        <td class="tab_lt">
                            <span class="red_x">*</span> 手机号码：
                        </td>
                        <td>
                            <asp:TextBox ID="txtMobilePhone" MaxLength="13" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" SetFocusOnError="true" runat="server"
                                CssClass="error" ErrorMessage="**" Display="Dynamic" ControlToValidate="txtMobilePhone"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator CssClass="error" ID="RegularExpressionValidator1"
                                runat="server" ErrorMessage="格式错误，允许11到13们数字" ControlToValidate="txtMobilePhone"
                                Display="Dynamic" ValidationExpression="\d{11,13}"></asp:RegularExpressionValidator>
                            请填写您的手机号码
                        </td>
                    </tr>
                    <tr>
                        <td class="tab_lt">
                            <span class="red_x">*</span> 电子邮件：
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" MaxLength="128" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" SetFocusOnError="true" runat="server"
                                CssClass="error" ErrorMessage="**" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator CssClass="error" ID="RegularExpressionValidator6"
                                runat="server" ErrorMessage="格式错误" ControlToValidate="txtEmail" Display="Dynamic"
                                SetFocusOnError="true" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            请填写您的电子邮件
                        </td>
                    </tr>
                </table>
                <table class="tab_1">
                    <tr>
                        <td>
                            <h4>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input id="chkProfile" type="checkbox" onclick="if(this.checked)$j('tbProf').slideDown(80);else $j('tbProf').slideUp(80);" />
                                <label for="chkProfile">
                                    以下为非必填选项</label>
                            </h4>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>[我们建议贵公司把资料填写完全，方便我们派更加专业的专员与你沟通，快速办理加盟手续]</label>
                        </td>
                    </tr>
                </table>
                <table class="tab_1" id="tbProf" style="display: none;">
                    <tr>
                        <td class="tab_lt">
                            性 别：
                        </td>
                        <td>
                            <asp:RadioButton ID="rdoMale" runat="server" GroupName="sex" Text="男" />
                            <asp:RadioButton ID="rdoFemale" runat="server" GroupName="sex" Text="女" />
                            <asp:RadioButton ID="rdoSexNon" runat="server" GroupName="sex" Text="保密" Checked="true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tab_lt">
                            联系电话：
                        </td>
                        <td>
                            <asp:TextBox ID="txtTel1" MaxLength="4" runat="server" Style="width: 40px;"></asp:TextBox>
                            <asp:TextBox ID="txtTel2" MaxLength="10" runat="server" Style="width: 80px;"></asp:TextBox>
                            <asp:TextBox ID="txtTel3" MaxLength="5" runat="server" Style="width: 40px;"></asp:TextBox>
                            请填写您的联系电话
                        </td>
                    </tr>
                    <tr>
                        <td class="tab_lt">
                            传真号码：
                        </td>
                        <td>
                            <asp:TextBox ID="txtFax1" MaxLength="4" runat="server" Style="width: 40px;"></asp:TextBox>
                            <asp:TextBox ID="txtFax2" MaxLength="10" runat="server" Style="width: 80px;"></asp:TextBox>
                            <asp:TextBox ID="txtFax3" MaxLength="5" runat="server" Style="width: 40px;"></asp:TextBox>
                            请填写您的传真号码
                        </td>
                    </tr>
                    <tr>
                        <td class="tab_lt">
                            省份：
                        </td>
                        <td>
                            <chinaRegion:ChinaRegion runat="server" ID="region1" />
                            请选择您所在的省份与城市
                        </td>
                    </tr>
                    <tr>
                        <td class="tab_lt">
                            详细联系地址：
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddr" MaxLength="200" runat="server" Style="width: 300px;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="tab_lt">
                            所属行业：
                        </td>
                        <td>
                            <asp:DropDownList runat="server" Style="width: 280px;" ID="ddlIndustries" AppendDataBoundItems="true">
                                <asp:ListItem Value="">请选择...</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="tab_lt">
                            加盟原因：
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlAgentApplyColumn" AppendDataBoundItems="true">
                                <asp:ListItem Value="">请选择...</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="tab_lt tab_bz">
                            备注：
                        </td>
                        <td>
                            <asp:TextBox onkeyup="limitLength(this)" max="1000" runat="server" ID="txtShortDesc"
                                TextMode="MultiLine" Style="width: 400px; height: 60px;"></asp:TextBox>
                            <div>
                                最多500个汉字或1000个字母</div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            如填写您的公司介绍，公司主营方向，公司的优势和实力，你每年将配备多少人力物力进行产品的推广。
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            你是从那个渠道获知我们公司诚邀代理加盟？
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <input name="survey" type="checkbox" value="互联网" />
                            互联网
                            <input name="survey" type="checkbox" value="电视" />
                            电视
                            <input name="survey" type="checkbox" value="朋友介绍" />
                            朋友介绍
                            <input name="survey" type="checkbox" value="广播" />
                            广播
                            <input name="survey" type="checkbox" value="杂志传单" />
                            杂志传单
                            <input name="survey" type="checkbox" value="传单" />
                            传单
                        </td>
                    </tr>
                </table>
                <table class="tab_1">
                    <tr runat="server" id="cntrVerCode">
                        <td class="tab_lt tab_bz" width="120px;">
                            <span class="red_x">*</span> 验证码：
                        </td>
                        <td>
                            <input type="text" size="15" runat="server" id="txtVerCode" maxlength="8" onfocus="showVerifyCode()" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtVerCode"
                                Text="请填写验证码" Display="Dynamic" CssClass="error" runat="server"></asp:RequiredFieldValidator>
                            <cite><span id="spVerCode"></span><span id="spVerCodeMsg" class="hd"></span><a id="spChgVerCode"
                                class="p hd" href="###" onclick="changeVerCode()">看不清？！</a></cite>
                        </td>
                    </tr>
                    <tr>
                        <td width="120px;">
                        </td>
                        <td>
                            <asp:Button runat="server" ID="btnSubmit" Text="马上提交" CssClass="b17" OnClick="btnSubmit_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="rightbot"></div>
            <div class="clear"></div>
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
