<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.User_Register, qwt" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title>会员注册</title>
    <script type="text/javascript" src="/Component/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/Register.js"></script>
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
    <%--表单:start--%>
    <div class="content" id="divForm">
        <div class="left">
            <div class="left_ad">
                <%=NSW.BLL.Site.GetAdCodeByKeyName("user_register")%>
            </div>
        </div>
        <div class="right">
            <div class="u_right_main">
                <UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
                <div class="zc_lc1">
                </div>
                <div class="zc_one">
                    注册：第一步帐户基本信息（均为必填项）</div>
                <div class="zc_form" id="tbForm">
                    <table class="zc_tab2">
                        <tr>
                            <td width="38">
                                <img src="<%= SkinPath %>Img/ico28.gif" alt="正确" id="imgUnOks" />
                                <img src="<%= SkinPath %>Img/ico29.gif" alt="错误" id="imgUnErr" />
                            </td>
                            <td width="84" class="tr">
                                <font color="#f00">*</font>用 户 名：
                            </td>
                            <td width="544">
                                <input type="text" class="txtboxcs" id="txtUsername" maxlength="20" size="30" onblur="checkUsername(this)" />英文名称为4到16位字母或数字，中文名称为2到8个汉字
                                <div id="spUsernameMsg2" style="display: none;">
                                </div>
                            </td>
                        </tr>
                        <tr style="display:none;">
                            <td>
                            </td>
                            <td width="84" class="tr">
                                注册级别：
                            </td>
                            <td>
                                <%= GetUserHtml() %>
                            </td>
                        </tr>
                        <tr>
                            <td width="38">
                                <img src="<%= SkinPath %>Img/ico28.gif" alt="正确" id="imgEmOks" />
                                <img src="<%= SkinPath %>Img/ico29.gif" alt="错误" id="imgEmErr" />
                            </td>
                            <td width="74" class="tr" class="txtboxcs">
                                <font color="#f00">*</font>电子邮件：
                            </td>
                            <td width="544">
                                <input type="text" size="30" class="txtboxcs" id="txtEmail" onblur="checkEmail(this)" />
                                <div id="spEmailMsg" style="display: none;">
                                </div>
                                <div id="spEmailMsg2" style="display: none;">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="tr">
                                中文名称：
                            </td>
                            <td>
                                <input type="text" size="15" class="txtboxcs" id="txtRealName" maxlength="50" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="<%= SkinPath %>Img/ico28.gif" alt="正确" id="img2" />
                                <img src="<%= SkinPath %>Img/ico29.gif" alt="错误" id="img1" />
                            </td>
                            <td class="tr">
                                <font color="#f00">*</font>手机号码：
                            </td>
                            <td>
                                <input id="txtMobile" maxlength="13" class="txtboxcs" onkeyup="digiOnly(this)" onblur="checkMobile(this)"
                                    type="text" size="15" />
                                例如：13825258217
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="tr">
                                行政地区：
                            </td>
                            <td>
                                <chinaRegion:ChinaRegion ID="region1" runat="server" />
                                请选择您所在的省份与城市
                            </td>
                        </tr>
                        <tr>
                            <tr>
                                <td>
                                </td>
                                <td class="tr">
                                    详细地址：
                                </td>
                                <td>
                                    <input type="text" size="50" class="txtboxcs" id="txtAddr" maxlength="100" />
                                </td>
                            </tr>
                            <td>
                            </td>
                            <td class="tr">
                                邮政编码：
                            </td>
                            <td>
                                <input type="text" size="10" class="txtboxcs" id="txtZipCode" onkeyup="digiOnly(this)"
                                    maxlength="6" onblur="checkZipCode(this)" />
                            </td>
                        </tr>
                        <tr>
                            <td width="38">
                                <img src="<%= SkinPath %>Img/ico28.gif" alt="正确" id="imgPwdOks" />
                                <img src="<%= SkinPath %>Img/ico29.gif" alt="错误" id="imgPwdErr" />
                            </td>
                            <td width="74" class="tr">
                                <font color="#f00">*</font>输入密码：
                            </td>
                            <td width="544">
                                <input type="password" id="txtPin" class="txtboxcs" maxlength="16" size="30" onblur="checkPin(this)" />6到16位任意字符，区分大小写
                            </td>
                        </tr>
                        <tr>
                            <td width="38">
                                <img src="<%= SkinPath %>Img/ico28.gif" alt="正确" id="imgCPwdOks" />
                                <img src="<%= SkinPath %>Img/ico29.gif" alt="错误" id="imgCPwdErr" />
                            </td>
                            <td class="tr" width="74">
                                <font color="#f00">*</font>确认密码：
                            </td>
                            <td>
                                <input type="password" maxlength="16" class="txtboxcs" size="30" id="txtConfirmPin"
                                    onblur="checkConfirmPin(this)" />再输入一遍您的密码
                            </td>
                        </tr>
                        <tr>
                            <td width="38">
                                <img src="<%= SkinPath %>Img/ico28.gif" alt="正确" id="imgVcOks" />
                                <img src="<%= SkinPath %>Img/ico29.gif" alt="错误" id="imgVcErr" />
                            </td>
                            <td class="tr" width="74">
                                <font color="#f00">*</font>验证码：
                            </td>
                            <td>
                                <input type="text" size="30" id="txtVerCode" class="txtboxcs" onfocus="showVerifyCode()"
                                    onblur="checkVerCode(this)" />
                                <span class="blk"><span id="spVerCode"></span><span id="spVerCodeMsg" class="hd"></span>
                                    <a id="spChgVerCode" class="p hd" href="###" onclick="changeVerCode()">看不清？！</a></span>
                            </td>
                        </tr>
                    </table>
                    <h4 style="display: none">
                        <input id="chkProfile" type="checkbox" onclick="if(this.checked)$j('tbProf').slideDown(80);else $j('tbProf').slideUp(80);" /><label
                            for="chkProfile">完全注册</label></h4>
                    <table class="zc_tab" id="tbProf" style="display: none;">
                        <tr>
                            <td class="tr">
                                密码提示问题：
                            </td>
                            <td>
                                <select id="ddlSecQus" onchange="ddlSecQus_Changed(this)" onblur="checkSecQus($g('txtSecQus'))">
                                    <option value="我的宠物叫什么名字？">我的宠物叫什么名字？</option>
                                    <option value="我向住地方是哪里？">我向往的地方是哪里？</option>
                                    <option value="我的初恋情人生日？">我的初恋情人生日？</option>
                                    <option value="我喜欢吃什么菜？">我喜欢吃什么菜？</option>
                                    <option value="我常爱做什么梦？">我常爱做什么梦？</option>
                                    <option value="">自写问题...</option>
                                </select>
                                <input type="text" id="txtSecQus" onblur="checkSecQus(this)" maxlength="128" style="display: none" />
                            </td>
                        </tr>
                        <tr>
                            <td class="tr">
                                答案：
                            </td>
                            <td>
                                <input type="text" size="25" id="txtSecAsr" maxlength="50" />
                                <span>密码提示问题和答案必须一并填写，否则视为无效。</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="tr">
                                性别：
                            </td>
                            <td>
                                <input type="radio" id="rdoMale" name="sex" value="1" /><label for="rdoMale">男</label>
                                <input type="radio" id="rdoFemale" name="sex" value="2" /><label for="rdoFemale">女</label>
                                <input type="radio" id="rdoSexNon" name="sex" value="-1" checked="checked" /><label
                                    for="rdoSexNon">保密</label>
                            </td>
                        </tr>
                        <tr>
                            <td class="tr">
                                生日：
                            </td>
                            <td>
                                <input id="txtBirth" type="text" onclick="WdatePicker()" readonly="readonly" size="15"
                                    maxlength="16" />
                            </td>
                        </tr>
                        <tr>
                            <td class="tr">
                                学历：
                            </td>
                            <td>
                                <%= GetEduHtml() %>
                            </td>
                        </tr>
                        <tr>
                            <td class="tr">
                                所属行业：
                            </td>
                            <td>
                                <%= GetIndustryHtml() %>
                            </td>
                        </tr>
                        <tr>
                            <td class="tr">
                                职业：
                            </td>
                            <td>
                                <%= GetPositionHtml() %>
                            </td>
                        </tr>
                        <tr>
                            <td class="tr">
                                固定电话：
                            </td>
                            <td>
                                <input id="txtTel" maxlength="16" onblur="checkTel(this)" size="15" />
                                固定电话(区号-电话号码-分机)
                            </td>
                        </tr>
                        <tr>
                            <td class="tr">
                                传真号码：
                            </td>
                            <td>
                                <input type="text" size="15" id="txtFax" onblur="checkFax(this)" maxlength="16" />
                                传真电话(区号-电话号码-分机)
                            </td>
                        </tr>
                    </table>
                    <h4 style="display: none">
                        <input id="chkContract" type="checkbox" onclick="if(this.checked)$j('divContract').slideDown(80);else $j('divContract').slideUp(80);" /><label
                            for="chkContract">阅读服务条款</label>
                    </h4>
                    <div id="divContract" style="display: none;">
                        <textarea id="txtContract" style="width: 99%;" rows="20"><%= NSW.OConfig.GlobalConfig.MembershipContract %></textarea>
                    </div>
                    <div style="height: 50px;">
                        <div class="ty" style="display: none">
                            <input id="chkAgreed" type="checkbox" checked="checked" />
                            <label for="chkAgreed">
                                我已看过并同意<span class="corange">《<%= NSW.OConfig.GlobalConfig.SiteName %>服务条款》</span></label>
                        </div>
                        <div class="ty">
                            <input type="button" class="b13" value="注 册" onclick="signUp(this)" />
                            <input type="button" class="b13" value="重 填" onclick="emptyText('tbForm')" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <%--表单:end--%>
    <%--注册成功提示:start--%>
    <div class="content" id="divNotify" style="display: none;">
        <div class="right" style="width: 960px">
            <div class="u_right_main">
                <UserLoc:UserLoc runat="server" ID="uc_UserLoc_2" />
                <div class="zc_cg">
                    <div>
                        <img src="<%= SkinPath %>Img/lc_ico_img.gif" alt="注册成功" /></div>
                    <div id="registerNotify">
                    </div>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <%--注册成功提示:end--%>
    <!--Content:End-->
    <!--Footer:Start-->
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
    <!--Footer:End-->
</body>
</html>
<script type="text/javascript">
    ddlSecQus_Changed($g("ddlSecQus"));
    clearAllElms("divRegister");
    $j("divForm").find(".user_left").height($j("divForm").find(".right").height() - 12);
</script>
