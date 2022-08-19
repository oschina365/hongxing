<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.UserOrder, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>会员中心首页</title>
    <script type="text/javascript" src="/Component/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/select_list.js"></script>
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
	<div class="left">
		<UserActions:UserActions runat="server" ID="uc_UserActions_1" />
	</div>
	<div class="right">
		<div class="u_right_main">
			<UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
			<table class="userorder" id="tbForm">
			    <tr>
					<td colspan="2" style=" background:#ddd;text-align:center;font-size:large;">加盟商意向定单</td>
				</tr>
				<tr>
					<td style="width:100px;">定单名称：</td>
					<td><input type="text" size="50" id="txttitle"  style="width:220px;" maxlength="100" /></td>
				</tr>
				<tr>
                    <td>
                        <b>定单产品</b><br>加盟商在线下单的产品
                    </td>
                    <td>
                        <table border="0">
                            <tr>
                              <td style="width:300px;">
                                <asp:DropDownList ID="ddlProductsColumns" runat="server" Width="160px">
                                </asp:DropDownList>
                                  <asp:TextBox ID="txtSearch" runat="server" CssClass="txt" Width="80px" Text="关键字"></asp:TextBox>
                                  <input id="btnSearch" class="btn_search" type="button" value="搜索" onclick="sendGetProductsNotify();" /></td>
                              <td>&nbsp;</td>
                              <td>目标产品[请选中下面产品,否则不会保存]</td>
                            </tr>
                            <tr>
                              <td><asp:ListBox ID="PackageSelectList" runat="server" 
                                      SelectionMode="Multiple" Rows="10" Width="280px" Height="100px"> </asp:ListBox>
                              </td>
                              <td>&nbsp;<input type="button" value="-&gt;" onclick="addIt('PackageSelectList','PackagePickList');selIt('','PackagePickList')" />&nbsp;
                                <br />
                                &nbsp;<input type="button" value="&lt;-" onclick="delIt('PackageSelectList','PackagePickList');selIt('','PackagePickList')" />&nbsp;
                                </td>
                              <td><asp:ListBox ID="PackagePickList" runat="server" SelectionMode="Multiple" 
                                      Rows="10" Width="220px" Height="100px"> </asp:ListBox></td>
                            </tr>
                            <tr>
                              <td colspan="3"> 提示：按住Ctrl+鼠标左键进行产品栏目的多选 </td>
                            </tr>
                          </table>
                    </td>
                </tr>
				<tr>
					<td>下单人姓名：</td>
					<td><input type="text" size="50" id="txtname"  style="width:220px;" maxlength="50" /></td>
				</tr>
				<tr>
					<td>联系电话：</td>
					<td><input type="text" size="50" id="txttel"  style="width:220px;" maxlength="50" /></td>
				</tr>
				<tr>
					<td>Email：</td>
					<td><input type="text" size="50" id="txtemail"  style="width:220px;" maxlength="200" /></td>
				</tr>
				<tr>
					<td>联系地址：</td>
					<td><input type="text" size="50" id="txtaddress"  style="width:220px;" maxlength="300"/></td>
				</tr>
				<tr>
					<td>到货时间：</td>
					<td><input id="txtenddate" type="text"  onclick="WdatePicker()" readonly="readonly"  size="15" maxlength="16" style="width:80px;"/></td>
				</tr>
				<tr>
					<td valign="top">定单详细描述：</td>
					<td><textarea cols="50" rows="8" id="txtcontent" max="1000" onkeyup="limitLength(this)"></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td>请详细填写您的定单描述，包括产品名称和数量等。(1000字节以内)</td>
				</tr>
				<tr>
					<td></td>
					<td><input type="button" class="b17" value="保 存" onclick="userorder(this)" />
						<input type="button" class="b18" value="重 填" onclick="emptyText('tbForm')" /></td>
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
</form></body>
</html>