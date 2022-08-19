<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Paycenter.Paycenter_OrderDetailDirect, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>直接付款订单详细</title>
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
			<p class="c666 mt12" runat="server" id="pOrderInfo">
			    <span class="fr"><strong>下单时间：</strong>{$input_time$}</span>
			    <strong>订单号码：</strong>{$order_no$}
			    <img src="{$icon$}" alt="{$order_state$}" class="vam ml10" /><span class="b f14 corange pl5">({$order_state$})</span>
			</p>
			<h4 class="t01 mt15">支付人信息</h4>
			<div runat="server" id="divPayer">
			<table class="t_a c666 l_25 mt12" width="100%">
				<tr>
					<td class="b" width="11%" align="right">支付人姓名：</td>
					<td colspan="3">{$name$}</td>
				</tr>
				<tr>
					<td class="b" align="right">联系电话：</td>
					<td width="15%">{$tel$}</td>
					<td class="b" align="right" width="10%">手机号码：</td>
					<td width="64%">{$mobile$}</td>
				</tr>
				<tr>
					<td class="b" align="right">电子邮箱地址：</td>
					<td width="15%">{$email$}</td>
					<td class="b" align="right" width="10%">&nbsp;</td>
					<td width="64%">&nbsp;</td>
				</tr>
			</table>
			</div>
			<h4 class="t01 mt15">接收人信息</h4>
			<div runat="server" id="divPayee">
			<table class="t_a c666 l_25 mt12" width="100%">
				<tr>
					<td class="b" width="11%" align="right">接收人姓名：</td>
					<td colspan="3">{$name$}</td>
				</tr>
			</table>
			</div>
			<h4 class="t01 mt15">付款方式</h4>
			<div class="c666 mt15 Zhi" runat="server" id="divPaymentInfo">
			    <h5>{$title$}</h5>
			    <div>{$short_desc$}</div>
			    <div><img src="{$icon$}" alt="{$title$}" /></div>
			</div>
			<h4 class="t02 mt15">款项用途</h4>
			<div class="b4 mt5 l_20 p6 c666" runat="server" id="divUse">{$use$}</div>
			<p class="f14 t_dashed mt12 pt12 pb15" runat="server" id="pMoney">付款总金额：<strong class="corange">{$money$}</strong><span class="f12">(￥)</span></p>
			<p class="tc pt15 pb15">
				<input type="button" class="b10" onclick="location.href='PaymentNotifyDirect.aspx?pay=1&no=<%= OrderNo %>'" />
				<asp:Button runat="server" ToolTip="取消订单" ID="btnCancelOrder" OnClick="btnCancelOrder_Click" CssClass="b12 ml10" OnClientClick="return confirm('订单取消操作不可撤消，您确定取消订单吗？')" />
			</p>
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