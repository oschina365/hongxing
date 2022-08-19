<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.User_BaseInfor, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>修改个人资料</title>
    <script type="text/javascript" src="/Component/My97DatePicker/WdatePicker.js"></script>
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
        	<table class="prof_rate">
			    <tr>
			        <td>资料完整率：</td>
			        <td class="rate"><div class="r_cntr"><div style="width:<%= ProfileFullnessRate * 480%>px;"><%= (ProfileFullnessRate * 100).ToString("f0") %>%</div></div></td>
			    </tr>
			    <tr runat="server" id="trPointInfo" visible="false" style="display:none">
			        <td colspan="2">如果您的资料完整率达到100%，将可奖励 <span runat="server" id="spPoint"></span> 点积分（不重复奖励）。
			            <div runat="server" id="divAwardingTimeInfo" visible="false">您的资料完整率曾经于 {$time$} 达到100%，积分已奖励。</div>
			        </td>
			    </tr>
			</table>
            <table class="base_tab" id="tbForm">
                <tr>
					<td width="19%"><asp:HiddenField runat="server" ID="hdnAvatar" /></td>
					<td width="81%"><img src="<%= Avatar %>" alt="头像" style="width:100px;height:100px;" /></td>
				</tr>
				<tr>
					<td align="right">更换头像：</td>
					<td><asp:FileUpload runat="server" ID="fuAvatar" /></td>
				</tr>
				<tr>
					<td align="right">姓  名：</td>
					<td><asp:TextBox ID="txtRealName" MaxLength="50" runat="server"></asp:TextBox>
						请填写您的(<span class="cRed">真实姓名</span>)</td>
				</tr>
				<tr style="display:none">
					<td align="right">性  别：</td>
					<td>
					    <asp:RadioButton ID="rdoMale" runat="server" GroupName="sex" Text="男" />
                        <asp:RadioButton ID="rdoFemale" runat="server" GroupName="sex" Text="女" />
                        <asp:RadioButton ID="rdoSexNon" runat="server" GroupName="sex" Text="保密" />
					</td>
				</tr>
				<tr style="display:none">
					<td align="right">生  日：</td>
					<td><asp:TextBox ID="txtBirth" MaxLength="16" runat="server" onclick="WdatePicker()"></asp:TextBox></td>
				</tr>
				<tr style="display:none">
					<td align="right">学  历：</td>
					<td>
					    <asp:DropDownList runat="server" ID="ddlEdu" AppendDataBoundItems="true">
					        <asp:ListItem Value="">请选择...</asp:ListItem>
					    </asp:DropDownList>
					</td>
				</tr>
				<tr style="display:none">
					<td align="right">公司名称：</td>
					<td><asp:TextBox ID="txtCompName" style="width:280px;" MaxLength="128" runat="server"></asp:TextBox></td>
				</tr>
				<tr style="display:none">
					<td align="right">所属行业：</td>
					<td>
					    <asp:DropDownList runat="server" style="width:280px;" ID="ddlIndustries" AppendDataBoundItems="true">
					        <asp:ListItem Value="">请选择...</asp:ListItem>
					    </asp:DropDownList>
					</td>
				</tr>
				<tr style="display:none">
					<td align="right">职  业：</td>
					<td>
					    <asp:DropDownList runat="server" ID="ddlPositions" AppendDataBoundItems="true">
					        <asp:ListItem Value="">请选择...</asp:ListItem>
					    </asp:DropDownList>
					</td>
				</tr>
				<tr>
					<td align="right">手机号码：</td>
					<td>
					    <asp:TextBox ID="txtMobilePhone" MaxLength="13" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="error" ID="RegularExpressionValidator1" runat="server" ErrorMessage="格式错误，允许11到13们数字"
                                    ControlToValidate="txtMobilePhone" Display="Dynamic" ValidationExpression="\d{11,13}"></asp:RegularExpressionValidator>
					例如：13800138000
					</td>
				</tr>
				<tr style="display:none">
					<td align="right">固定电话：</td>
					<td>
					    <asp:TextBox ID="txtTel1" MaxLength="4" runat="server" style="width:40px;"></asp:TextBox>
					    <asp:TextBox ID="txtTel2" MaxLength="10" runat="server" style="width:80px;"></asp:TextBox>
					    <asp:TextBox ID="txtTel3" MaxLength="5" runat="server" style="width:40px;"></asp:TextBox>
					固定电话(区号-电话号码-分机)
					</td>
				</tr>
				<tr style="display:none">
					<td align="right">传真号码：</td>
					<td>
					    <asp:TextBox ID="txtFax1" MaxLength="4" runat="server" style="width:40px;"></asp:TextBox>
					    <asp:TextBox ID="txtFax2" MaxLength="10" runat="server" style="width:80px;"></asp:TextBox>
					    <asp:TextBox ID="txtFax3" MaxLength="5" runat="server" style="width:40px;"></asp:TextBox>
					传真电话(区号-电话号码-分机)
					</td>
				</tr>
				<tr>
					<td align="right">行政地区：</td>
					<td><chinaRegion:ChinaRegion runat="server" ID="region1" />
					请选择您所在的省份与城市</td>
				</tr>
				<tr>
					<td align="right">详细联系地址：</td>
					<td><asp:TextBox ID="txtAddr" MaxLength="200" runat="server" style="width:280px"></asp:TextBox></td>
				</tr>
				<tr>
					<td align="right">邮政编码：</td>
					<td>
					    <asp:TextBox ID="txtZipCode" MaxLength="13" style="width:70px;" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="error" ID="RegularExpressionValidator3" runat="server" ErrorMessage="格式错误，允许6位数字"
                                    ControlToValidate="txtZipCode" Display="Dynamic" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
					</td>
				</tr>
				<tr style="display:none">
					<td align="right">兴趣/爱好：</td>
					<td>
					    <asp:TextBox onkeyup="limitLength(this)" max="200" runat="server" ID="txtHobby" TextMode="MultiLine" style="width:300px;height:60px;"></asp:TextBox>
					    <div>最多100个汉字或200个字母</div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td height="30">
					    <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="b17" Text="保 存" />
						<input type="button" class="b18" value="重 填" onclick="emptyText('tbForm')" />
					</td>
				</tr>
			</table>
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
