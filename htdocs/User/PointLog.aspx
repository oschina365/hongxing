<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.PointLog, qwt" enableviewstate="false" enableviewstatemac="false" %>
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
			<div class="info_box">
			    <ul>
			        <li>可消费积分：<span class="ib_h"><%= UserEnt.UserWealth %></span> 点</li>
			        <li>共累积积分：<span class="ib_h"><%= UserEnt.CumulativePoint %></span> 点</li>
			    </ul>
			</div>
			<asp:Repeater runat="server" ID="rpt">
			<HeaderTemplate><table class="nor_tab">
				<tr>
					<th>序号</th>
					<th>原始积分</th>
					<th>变动后积分</th>
					<th>积分变动数目</th>
					<th>变动原因</th>
					<th>备注</th>
					<th>时间</th>
				</tr></HeaderTemplate>
				<ItemTemplate><tr>
					<td><%# ((PageIndex - 1) * PageSize) +  Container.ItemIndex + 1 %></td>
					<td style="text-align:right;"><%# Eval("UserWealthForm")%></td>
					<td style="text-align:right;"><%# Eval("UserWealthTo")%></td>
					<td style="text-align:right;"><%# Eval("Point")%></td>
					<td><%# NSW.BLL.Mem.GetPointChangingTitleByID( (int)Eval("ColumnID")) %></td>
					<td><%# Eval("Remark")%></td>
					<td><%# ((DateTime)Eval("InputTime")).ToString("yy-MM-dd HH:mm:ss") %></td>
				</tr></ItemTemplate>
			<FooterTemplate></table></FooterTemplate>
			</asp:Repeater>
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
