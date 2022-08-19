<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.User_PayDirect, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>支接付款</title>
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
<!--Header:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Header:End-->
<!--Content:Start-->
<div class="content">
	<UserActions:UserActions runat="server" ID="uc_UserActions_1" />
	<div class="right">
    	<div class="u_right_main">
        	<UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
            <dl class="pay_top">
				<dt><img src="<%= SkinPath %>Img/Pay_ico.gif" alt="直接付款" /></dt>
				<dd>如果您要直接给<%= NSW.OConfig.GlobalConfig.SiteName %>业务部门直接打款，请直接使用下面的在线网上银行进行支付，支付的同时，请在描述位置处说明好款项的用途和款项接收人。款项将直接打入<%= NSW.OConfig.GlobalConfig.SiteName %>的对公银行帐号，不是直接给业务员转账，请放心。</dd>
			</dl>
            <div class="clear"></div>
            <div class="pay_box">
            	<table class="pay_tab">
            		<tr>
						<td width="42%" class="tr"><span>支付方式：</span></td>
						<td width="58%">
						    <div><input type="radio" checked="checked" value="alipay" name="paymentmethod" id="rdoAlipay" /> <label for="rdoAlipay"><img src="<%= SkinPath %>img/alipay.gif" /> 支付宝</label></div>
    					    <%--<div><input type="radio" name="paymentmethod" value="99bill" id="rdo99Bill" /> <label for="rdo99Bill"><img src="<%= SkinPath %>img/99bill.gif" />快钱</label></div>--%>
						</td>
					</tr>
           		</table>
            </div>
            <fieldset class="fieldset">
				<legend class="legend">款项用途</legend>
				<table class="add_tab2" id="tbForm">
					<tr>
						<td class="tr">您的姓名：</td>
						<td>
						    <asp:TextBox ID="txtChnName" style="width:130px;" CssClass="txtboxcs" runat="server" MaxLength="64"></asp:TextBox>
						    <asp:RequiredFieldValidator ErrorMessage="**" ControlToValidate="txtChnName" CssClass="error" Display="Dynamic" ID="RequiredFieldValidator1" runat="server"></asp:RequiredFieldValidator>
							<span class="red_x">*</span> <span>请填写收货人姓名</span>
						</td>
					</tr>
					<tr>
						<td class="tr">E-Mail：</td>
						<td>
                            <asp:TextBox runat="server" ID="txtEmail" MaxLength="100" CssClass="txtboxcs"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="error" 
                                        ID="RequiredFieldValidator99" runat="server" ErrorMessage="**" ControlToValidate="txtEmail" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  CssClass="error" 
                                ErrorMessage="格式错误" ControlToValidate="txtEmail" Display="Dynamic"  SetFocusOnError="true"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            <span class="red_x">*</span>
                        </td>
					</tr>
					<tr>
						<td class="tr">您的联系电话：</td>
						<td>
						    <asp:TextBox ID="txtTel" MaxLength="16" runat="server" CssClass="txtboxcs"></asp:TextBox>
							<asp:RegularExpressionValidator CssClass="error" ID="RegularExpressionValidator4" runat="server" ErrorMessage="格式错误，允许格式如0755-12345678-545(分机号可选)" ControlToValidate="txtTel" Display="Dynamic" ValidationExpression="\d{3,4}-\d{7,8}(-\d{1,5})?"></asp:RegularExpressionValidator>
							<span>固定电话(区号-电话号码-分机)</span></td>
					</tr>
                    <tr>
						<td class="tr">手机号码：</td>
						<td>
						    <asp:TextBox ID="txtMobilePhone" MaxLength="13" runat="server" CssClass="txtboxcs"></asp:TextBox>
						    <asp:RegularExpressionValidator CssClass="error" ID="RegularExpressionValidator2" runat="server" ErrorMessage="格式错误，允许11到13位数字" ControlToValidate="txtMobilePhone" Display="Dynamic" ValidationExpression="\d{11,13}"></asp:RegularExpressionValidator>
							<span >例如：1383752****</span></td>
					</tr>
					<tr>
						<td class="tr">公司业务员姓名：</td>
						<td>
						    <asp:TextBox ID="txtSalesManName" style="width:130px;" runat="server" MaxLength="64" CssClass="txtboxcs"></asp:TextBox>
							<span>请填写款项接收业务员姓名</span>
                        </td>
					</tr>
					<tr>
						<td class="tr">转账金额：</td>
						<td>
						    <asp:TextBox ID="txtMoney" style="width:130px;" runat="server" MaxLength="10" CssClass="txtboxcs"></asp:TextBox>
						    <asp:RegularExpressionValidator ErrorMessage="必须为阿拉伯数字金额，如 99.89" ControlToValidate="txtMoney" ValidationExpression="\d+(\.\d+)?" CssClass="error" Display="Dynamic" ID="RegularExpressionValidator1" runat="server"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ErrorMessage="**" ControlToValidate="txtMoney" CssClass="error" Display="Dynamic" ID="RequiredFieldValidator2" runat="server"></asp:RequiredFieldValidator>
							<span class="red_x">*</span> <span >￥ 请填写转帐金额</span>
                        </td>
					</tr>
                    <tr>
                    	<td class="vat">款项用途：</td>
                        <td>
                            <asp:TextBox ID="txtUse" style="width:300px;" runat="server"  MaxLength="128" CssClass="txtboxcs"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="**" ControlToValidate="txtUse" CssClass="error" Display="Dynamic" ID="RequiredFieldValidator3" runat="server"></asp:RequiredFieldValidator>
                            <span class="red_x">*</span>
                        </td>
                    </tr>
					<tr>
						<td></td>
						<td>
						    <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="b17" Text="提 交" />
						    <input type="button" class="b18" value="重 填" onclick="emptyText('tbForm')" />
						</td>
					</tr>
				</table>
			</fieldset>
            <h4 class="t07">网上银行</h4>
            <div class="pay_bank">
				<div class="bank_tit">目前支持以下银行,全国25家大中银行均已开通</div>
				<ul class="p_bank_ul">
					<li><a href="http://www.icbc.com.cn/"><img src="<%= SkinPath %>Img/bank01.gif" alt="工商银行" /></a></li>
					<li><a href="http://www.95599.cn/"><img src="<%= SkinPath %>Img/bank02.gif" alt="农业银行" /></a></li>
					<li><a href="http://www.cmbc.com.cn/"><img src="<%= SkinPath %>Img/bank03.gif" alt="民生银行" /></a></li>
					<li><a href="http://bank.ecitic.com/"><img src="<%= SkinPath %>Img/bank04.gif" alt="中信银行" /></a></li>
					<li><a href="http://www.cmbchina.com/"><img src="<%= SkinPath %>Img/bank06.gif" alt="招商银行" /></a></li>
					
					<li><a href="http://www.spdb.com.cn/"><img src="<%= SkinPath %>Img/bank07.gif" alt="浦东发展银行" /></a></li>
					<li><a href="http://www.cib.com.cn"><img src="<%= SkinPath %>Img/bank08.gif" alt="兴业银行" /></a></li>
					<li><a href="http://www.cebbank.com"><img src="<%= SkinPath %>Img/bank09.gif" alt="光大银行" /></a></li>
					<li><a href="http://www.ccb.com/"><img src="<%= SkinPath %>Img/bank11.gif" alt="建设银行" /></a></li>
					<li><a href="http://www.sdb.com.cn/"><img src="<%= SkinPath %>Img/bank12.gif" alt="深圳发展银行" /></a></li>
					
					<li><a href="http://www.bankcomm.com/"><img src="<%= SkinPath %>Img/bank13.gif" alt="交通银行" /></a></li>
					<li><a href="http://www.hxb.com.cn/"><img src="<%= SkinPath %>Img/bank14.gif" alt="华夏银行" /></a></li>
				</ul>
				<div class="clear"></div>
			</div>
        </div>
    </div>
	<div class="clear"></div>
</div>
<!--Content:End-->
<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</form>
</body>
</html>
