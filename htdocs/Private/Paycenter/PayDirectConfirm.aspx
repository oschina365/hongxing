<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Payment.Paycenter_PayDirectConfirm, qwt" enableviewstate="true" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>直接付款订单确认</title>
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
<form id="aspnetForm" runat="server">
<!--Header:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Header:end-->
<!--Content:Start-->
<div class="cart_content">
	<div class="b4 mt5">
		<div class="cart_con">
			<CartLoc:CartLoc runat="server" ID="Loc_1" />
			<h4 class="t01">支付人信息</h4>
			<table class="t_a c666 l_25 mt12" width="100%">
				<tr>
					<td class="b" width="100" align="right">支付人姓名：</td>
					<td><%= NSW.OCookie.Cart.DirectPayInfo.Payer %></td>
				</tr>
				<tr runat="server" id="trPhone">
					<td width="100" class="b" align="right">联系电话：</td>
					<td>
					    <%= NSW.OCookie.Cart.DirectPayInfo.Tel.Length > 0 ? "<span class='mr10'>固定电话：" + NSW.OCookie.Cart.DirectPayInfo.Tel + "</span>" : string.Empty%>
					    <%= NSW.OCookie.Cart.DirectPayInfo.Mobile.Length > 0 ? "<span>手机号码：" + NSW.OCookie.Cart.DirectPayInfo.Mobile + "</span>" : string.Empty%>
					&nbsp;</td>
				</tr>
			</table>
			<h4 class="t01">接收人信息</h4>
			<table class="t_a c666 l_25 mt12" width="100%">
				<tr>
					<td class="b" width="100" align="right">接收人：</td>
					<td colspan="3"><%= NSW.OCookie.Cart.DirectPayInfo.Payee %></td>
				</tr>
			</table>
			<h4 class="t01">付款方式</h4>
			<p class="c666 mt15" style="font-size:24px;"><%= NSW.OCookie.Cart.DirectPayInfo.PaymentMethodTitle %></p>
			<p class="c666 mt15"><img src="<%= NSW.OCookie.Cart.DirectPayInfo.PaymentMethodIcon %>" /></p>
			<h4 class="t01">款项用途</h4>
			<div class="b4 mt5 l_20 p6 c666">
				<%= NSW.OCookie.Cart.DirectPayInfo.SUse %>
			</div>
			<p class="f14 t_dashed mt12 pt12">付款总金额：<strong class="corange f20">￥<%= NSW.OCookie.Cart.DirectPayInfo.DMoney %></strong><span class="f12"></span></p>
			<p class="tc pt15 pb15">
				<asp:Button runat="server" ID="btnPre" OnClick="btnPre_Click" CssClass="b06 ml10 fr" ToolTip="返回上一步" />
				<asp:Button runat="server" ID="btnNext" OnClick="btnNext_Click" CssClass="b04" ToolTip="确认提交订单" />
			</p>
			<p class="tc b f14">目前<%=NSW.OConfig.GlobalConfig.SiteName %>已经获得支付宝特约商家荣誉,请放心支付</p>
			<dl class="oder">
				<dt><img src="../skins/Orange/Img/alipay01.gif" alt="" title="" /></dt>
				<dd><a href="">支付宝使用说明</a></dd>
				<dd><a href="" title="">开通支付宝</a></dd>
			</dl>
			<div class="clear"></div>
		</div>
	</div>
</div>
<!--Content:End-->
<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</form>
</body>
</html>
