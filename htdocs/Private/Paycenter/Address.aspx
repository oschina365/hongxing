<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Paycenter.Address, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register Assembly="OranChinaRegion" Namespace="Oran.WebControl" TagPrefix="chinaRegion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>购物车产品详细</title>
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
<body><form runat="server" id="aspnetForm" defaultfocus="txtAddrName">
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Content:Start-->
<div class="cart_content">
	<div class="cart_main">
		<div class="cart_con">
			<CartLoc:CartLoc runat="server" ID="Loc_1" />
			<div class="lc2"></div>
			<div class="cart_tab5_top" runat="server" id="pAddrTools" visible="false">
			    <span><img src="<%= SkinPath  %>Img/ico.gif" class="vam mr5" /><a href="javascript:void(0)" onclick="showMyAddress()" class="c666 u">查看我的收货地址</a></span>
			    <span><img src="<%= SkinPath  %>Img/ico1.gif" class="vam mr5 ml20" /><a href="/user/myaddress.aspx" target="_blank" class="c666 u">管理我的收货地址</a></span>
			</div>
			<table id="tbAddr" width="100%" border="1" class="cart_tab_5">
				<tr>
					<th width="14%" align="right" bgcolor="#FFFFEB">收货人姓名：</th>
					<td width="86%" bgcolor="#F6F6F6">
					    <asp:TextBox ID="txtAddrName" runat="server" MaxLength="32" style="width:100px"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="error" 
                            ID="RequiredFieldValidator6" runat="server" ErrorMessage="**" ControlToValidate="txtAddrName" Display="Dynamic"></asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<th width="14%" align="right" bgcolor="#FFFFEB">E-Mail：</th>
					<td width="86%" bgcolor="#F6F6F6">
					    <asp:TextBox runat="server" ID="txtEmail" MaxLength="100" style="width:100px"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="error" 
                                    ID="RequiredFieldValidator99" runat="server" ErrorMessage="**" ControlToValidate="txtEmail" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  CssClass="error" 
                                ErrorMessage="格式错误" ControlToValidate="txtEmail" Display="Dynamic"  SetFocusOnError="true"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
					</td>
				</tr>
				<tr>
					<th align="right" bgcolor="#FFFFEB">所在地区：</th>
					<td bgcolor="#F6F6F6">
					    <span id="spRegionList"><chinaRegion:ChinaRegion runat="server" ID="regionAddr" /></span>
					</td>
				</tr>
				<tr>
					<th align="right" bgcolor="#FFFFEB">地址：</th>
					<td bgcolor="#F6F6F6">
					    <asp:TextBox ID="txtAddrAddr" runat="server" style="width:400px" MaxLength="100"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="error"  
                            ID="RequiredFieldValidator7" runat="server" ErrorMessage="**" ControlToValidate="txtAddrAddr" Display="Dynamic"></asp:RequiredFieldValidator>
					</td>
				</tr>
				<tr>
					<th align="right" bgcolor="#FFFFEB">邮政编码：</th>
					<td bgcolor="#F6F6F6">
					    <asp:TextBox ID="txtAddrZip" onkeyup="digiOnly(this)" MaxLength="6" runat="server" style="width:100px"></asp:TextBox>
                        格式如：512131
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" CssClass="error" 
                            runat="server" ErrorMessage="格式错误"  Display="Dynamic"
                                ValidationExpression="\d{6}" ControlToValidate="txtAddrZip"></asp:RegularExpressionValidator>
					</td>
				</tr>
				<tr>
					<th align="right" bgcolor="#FFFFEB">电话号码：</th>
					<td bgcolor="#F6F6F6">
					    <asp:TextBox ID="txtAddrTel" MaxLength="18" runat="server" style="width:100px"></asp:TextBox>
                            格式如：0755-12345678-54(分机号可选)
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7"
                            runat="server" ErrorMessage="格式错误"  CssClass="error" 
                                ValidationExpression="\d{3,4}-\d{6,8}(-\d{1,5})?" ControlToValidate="txtAddrTel" Display="Dynamic"></asp:RegularExpressionValidator>
					</td>
				</tr>
				<tr>
					<th align="right" bgcolor="#FFFFEB">手机号码：</th>
					<td bgcolor="#F6F6F6">
					    <asp:TextBox onkeyup="digiOnly(this)" ID="txtAddrMobile" MaxLength="13" runat="server" style="width:100px"></asp:TextBox>
                            格式如：13800138000
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8"
                            runat="server" ErrorMessage="格式错误"  Display="Dynamic" CssClass="error" 
                                ValidationExpression="\d{11,13}" ControlToValidate="txtAddrMobile"></asp:RegularExpressionValidator>
					</td>
				</tr>
				<tr style="display:none">
					<th align="right" bgcolor="#FFFFEB">是否需要发票：</th>
					<td bgcolor="#F6F6F6">
					    <span>
					        <asp:RadioButton runat="server" ID="rdoNeedInvoiceYes" Text="需要" GroupName="invoice" onclick="$j('txtInvoiceTitle').attr('disabled','');$j('txtInvoiceTitle').focus();" />
						    <asp:RadioButton runat="server" ID="rdoNeedInvoiceNo" Text="不需要" GroupName="invoice" Checked="true" onclick="$j('txtInvoiceTitle').attr('disabled','disabled')"  />
						</span>
						<span>
						    发票抬头
						    <asp:TextBox runat="server" ID="txtInvoiceTitle" style="width:100px;" MaxLength="32"></asp:TextBox>
						</span>
					</td>
				</tr>
				<tr>
					<th align="right" bgcolor="#FFFFEB">备注：</th>
					<td bgcolor="#F6F6F6">
						<asp:TextBox runat="server" ID="txtRef" TextMode="MultiLine" style="width:300px;height:50px;" max="120"></asp:TextBox>
						<p>请填写您的产品订购要求，我们会根据您的要求进行发货。</p>
					</td>
				</tr>
				<tr style="display:none">
					<td width="14%" align="right" bgcolor="#FFFFEB">优惠券：</td>
					<td width="86%" bgcolor="#F6F6F6">
					    <asp:TextBox runat="server" ID="txtCardPassword" style="font-size:18px;font-weight:bold;width:170px;" MaxLength="12"></asp:TextBox>
                            <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator2" ValidationExpression="\d{12}" runat="server" CssClass="error" Display="Dynamic" ControlToValidate="txtCardPassword" ErrorMessage="请输入12位的数字" style="font-size:12px;"></asp:RegularExpressionValidator>
					<p><span style="font-size:12px;">请输入优惠券密码</span></p>
					</td>
				</tr>
			</table>
			<div class="jiesuan"></div>
			<div class="bot_btn2">
			    <asp:CheckBox runat="server" ID="chkAddNewAddr" Text="将当前收货人地址作为新的地址保存到我的收货人地址" Visible="false" />
				<div class="mt10">
				    <asp:Button runat="server" ID="btnNext" OnClick="btnNext_Click" CssClass="b04" ToolTip="下一步，结算" />
				    <input type="button" class="b05 ml10" onclick="emptyText('tbAddr')" />
				    <asp:Button runat="server" ID="btnPre" OnClick="btnPre_Click" CssClass="b06 ml10" ToolTip="返回上一步" />
				</div>
			</div>
		</div>
	</div>
</div>
<!--Content:End-->
<div id="divCartMyAddr">
    <iframe frameborder="0" scrolling="no" src="###"></iframe>
</div>
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
</form></body>
</html>
<script type="text/javascript">
    function setRegion() {
        _initPrtRegions(false);
        _hdlDdlChdRegions();
        _saveRegion('_ddlChdRegions', '_hdnChdRegion');
    }
</script>