<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.Chit, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>我的订单</title>
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
<!--Header:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Header:End-->
<!--Content:Start-->
<div class="content">
	<UserActions:UserActions runat="server" ID="uc_UserActions_1" />
	<div class="right">
    	<div class="u_right_main">
    	    <UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
    	    <div class="info_box">知道优惠券密码的任何人都可以使用该优惠券，请妥善保管好您的卡密码。</div>
    	    <table class="nor_tab">
				<tr>
					<th>序号</th>
					<th>卡号</th>
					<th>密码</th>
					<th>面额(￥)</th>
					<th>使用状态</th>
					<th>卡片状态</th>
					<th>有效日期</th>
				</tr>
    	    <asp:Repeater runat="server" ID="rpt">
				<ItemTemplate><tr>
				<td><%# ((PageIndex - 1) * PageSize) +  Container.ItemIndex + 1 %></td>
				<td style="font-family:Courier"><%# Eval("Sn") %></td>
				<td style="font-family:Courier"><%# Eval("Password") %></td>
				<td class="tr"><%#  Eval(DENOMINATION_COLUMN_NAME)  %></td>
				<td class="tc"><%# Eval(STATE_COLUMN_NAME)%></td>
				<td class="tc"><img src='<%# (bool)Eval("Lock") ? SkinPath + "img/disable.gif' alt='已锁定，不可用'": SkinPath + "img/enable.gif' alt='未锁定，可用'" %> /></td>
				<td class="f10"><%# ((DateTime)Eval("FromDate")).ToString("yyyy-MM-dd") %> - <%# ((DateTime)Eval("ToDate")).ToString("yyyy-MM-dd") %></td>
				</tr></ItemTemplate>
			</asp:Repeater>
			</table>
			<div runat="server" id="nodata" visible="false">暂无优惠券</div>
            <OranPager:OranPager runat="server" ID="pagerMain" CssClass="apage" />
        </div>
    </div>
	<div class="clear"></div>
</div>
<!--Content:End-->
<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</body>
</html>
