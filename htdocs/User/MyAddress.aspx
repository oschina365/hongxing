<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.User_MyAddress, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register Assembly="OranChinaRegion" Namespace="Oran.WebControl" TagPrefix="chinaRegion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>会员中心首页</title>
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
<body><form runat="server" id="form1">
<!--Header:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Header:End-->
<!--Content:Start-->
<div class="content">
	<UserActions:UserActions runat="server" ID="uc_UserActions_1" />
	<div class="right">
    	<div class="u_right_main">
        	<UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
            <div class="add_top">
                <img src="<%= SkinPath %>Img/ico30.gif" alt="收货地址" class="vam" />
                您可以预设<span class="cRed"><%= NSW.OConfig.GlobalConfig.MyAddressCapacity %></span>个收货地址，方便您购物的时候发送到您的手中以及给您的朋友。
            </div>
            <table class="add_tab">
            	<tr>  	  	  	  	  	  	
                	<th>序号</th>
                	<th>收货人</th>
                	<th>详细地址</th>
                	<th>邮编</th>
                	<th>电话/手机</th>
                	<th>操作</th>
                </tr>
                <asp:Repeater runat="server" ID="rpt"><ItemTemplate><tr>
					<td><%# Container.ItemIndex + 1 %></td>
					<td><%# Eval("ChnName") %></td>
					<td><%# string.Format("{0} {1} {2}", Eval("Province") , Eval("City"), Eval("Address")) %></td>
					<td><%# Eval("ZipCode") %></td>
					<td><%# Eval(TEL_COLUMN_TITLE) %></td>
					<td>
					    <asp:LinkButton CausesValidation="false" runat="server" ID="lnkUpldate" OnClick="lnkUpldate_Click" CommandArgument='<%# Eval("ID") %>'>修改</asp:LinkButton>
					    | <asp:LinkButton CausesValidation="false" runat="server" OnClientClick="return confirm('确定删除？');" ID="lnkDel" OnClick="lnkDel_Click" CommandArgument='<%# Eval("ID") %>'>删除</asp:LinkButton>
					</td>
				</tr></ItemTemplate></asp:Repeater>
            </table>
            <fieldset class="fieldset"><asp:HiddenField runat="server" ID="hdnOID" />
				<legend class="legend" runat="server" id="formTitle">新增收货地址</legend>
				<table class="add_tab2" id="tbAddr">
					<tr>
						<td class="tr"><span>*</span> 收货人姓名：</td>
						<td>
						    <asp:TextBox ID="txtAddrName" runat="server" MaxLength="20" CssClass="txtboxcs"></asp:TextBox>
                            请填写收货人姓名
                            <asp:RequiredFieldValidator CssClass="error" 
                            ID="RequiredFieldValidator1" runat="server" ErrorMessage="**" ControlToValidate="txtAddrName" Display="Dynamic"></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
                        <td class="tr"><span>*</span> E-Mail：</td>
                        <td>
                            <asp:TextBox ID="txtAddrEmail" runat="server" MaxLength="20" CssClass="txtboxcs"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="error" 
                                    ID="RequiredFieldValidator99" runat="server" ErrorMessage="**" ControlToValidate="txtAddrEmail" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  CssClass="error" 
                                ErrorMessage="格式错误" ControlToValidate="txtAddrEmail" Display="Dynamic"  SetFocusOnError="true"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
					<tr>
						<td class="tr"><span>*</span> 所在地区：</td>
						<td><chinaRegion:ChinaRegion runat="server" ID="regionAddr" /></td>
					</tr>
					<tr>
						<td class="tr">街道地址：</td>
						<td>
						    <asp:TextBox ID="txtAddrAddr" runat="server" style="width:400px" MaxLength="100" CssClass="txtboxcs"></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="error" ID="RequiredFieldValidator7" runat="server" ErrorMessage="**" ControlToValidate="txtAddrAddr" Display="Dynamic"></asp:RequiredFieldValidator>
                            <br />请填写详细收货地址
						</td>
					</tr>
					<tr>
						<td class="tr">邮政编码：</td>
						<td>
						    <asp:TextBox ID="txtAddrZip" onkeyup="digiOnly(this)" MaxLength="6" runat="server" CssClass="txtboxcs" style="width:70px"></asp:TextBox>
                            请填写6位邮政编码（如：518000）
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" CssClass="error" runat="server" ErrorMessage="格式错误"  Display="Dynamic" ValidationExpression="\d{6}" ControlToValidate="txtAddrZip"></asp:RegularExpressionValidator>
						</td>
					</tr>
					<tr>
						<td class="tr">电话号码：</td>
						<td>
						    <asp:TextBox ID="txtTel1" MaxLength="4" runat="server" CssClass="txtboxcs" style="width:40px;" onkeyup="digiOnly(this)"></asp:TextBox>
					        <asp:TextBox ID="txtTel2" MaxLength="10" runat="server" CssClass="txtboxcs" style="width:80px;" onkeyup="digiOnly(this)"></asp:TextBox>
					        <asp:TextBox ID="txtTel3" MaxLength="5" runat="server" CssClass="txtboxcs" style="width:40px;" onkeyup="digiOnly(this)"></asp:TextBox>
                            固定电话(区号-电话号码-分机)
						</td>
					</tr>
					<tr>
						<td class="tr">手机号码：</td>
						<td>
						    <asp:TextBox onkeyup="digiOnly(this)" ID="txtAddrMobile" MaxLength="13" CssClass="txtboxcs" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="格式错误"  Display="Dynamic" CssClass="error" ValidationExpression="\d{11,13}" ControlToValidate="txtAddrMobile"></asp:RegularExpressionValidator>
                            <br />请填写准确的手机号码，方便快递员能准确联系到您！避免货物不能准时到达您的手中。
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
					        <asp:Button CssClass="b17" Text="保 存" ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" />
						    <input type="button" class="b18" value="重 填" onclick="emptyText('tbAddr')" />
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<a href="MyAddress.aspx" class="u">新增</a>
						</td>
					</tr>
				</table>
			</fieldset>
        </div>
    </div>
	<div class="clear"></div>
</div>
<!--Content:End-->
<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</form></body>
</html>