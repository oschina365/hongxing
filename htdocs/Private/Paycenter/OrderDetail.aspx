<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Paycenter.OrderDetail, qwt" enableviewstate="true" enableviewstatemac="false" %>

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
<body>
<form id="aspnetForm" runat="server">
<!--Header:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Header:end-->
<!--Content:Start-->
<div class="cart_content">
	<div class="cart_main">
		<div class="cart_con">
			<CartLoc:CartLoc runat="server" ID="Loc_1" />
			<p class="c666 mt12" runat="server" id="pOrderInfo">
			    <span class="fr"><strong>下单时间：</strong>{$input_time$}</span>
			    <strong>订单号码：</strong>{$order_no$}
			    <img src="{$icon$}" alt="{$order_state$}" class="vam ml10" /><span class="b f14 corange pl5">({$order_state$})</span>
			</p>
			<h4 class="t01">收货人信息</h4>
			<div runat="server" id="tbAddrInfo">
			<table class="cart_tab_1" width="100%">
				<tr>
					<th class="tr"width="15%" align="right">收货人：</th>
					<td colspan="3">{$chn_name$}</td>
				</tr>
				<tr>
					<th class="tr" align="right">收货地址：</th>
					<td colspan="3">{$province$} {$city$} {$addr$}{$zip_code$}</td>
				</tr>
				<tr>
					<th class="tr" align="right">联系电话：</th>
					<td width="16%">{$tel$}</td>
					<td class="b" align="right" width="10%">手机号码：</td>
					<td width="64%">{$mobile$}</td>
				</tr>
				<tr>
					<th class="tr" align="right">电子邮箱地址：</th>
					<td colspan="3">{$email$}</td>
				</tr>
			</table>
			</div>
			<h4 class="t01" style="display:none">送货方式</h4>
			<div  style="display:none" class="songhuo" runat="server" id="divDeliveryInfo">
			    <h5>{$title$}</h5>
			    <div>{$short_desc$}</div>
			    <div><img src="{$icon$}" alt="{$title$}" /></div>
			</div>
			<h4  style="display:none" class="t01">付款方式</h4>
			<div  style="display:none" class="zhifb" runat="server" id="divPaymentInfo">
			    <h5>{$title$}</h5>
			    <div>{$short_desc$}</div>
			    <div><img src="{$icon$}" alt="{$title$}" /></div>
			</div>
			<h4 class="t02">商品清单</h4>
			<table width="100%" border="1" bordercolor="#ECECEC" class="cart_tab_2" id="tbCartProducts">
				<tr class="b">
					<td align="center">序号</td>
					<td class="pl5">产品名称</td>
					<td align="center">购买价(￥)</td>
					<td align="center">数量(件)</td>
					<td align="center">小计(￥)</td>
				</tr>
				<asp:Repeater runat="server" ID="rpt"><ItemTemplate><tr>
					<td align="center"><%# Container.ItemIndex + 1 %></td>
					<td class="tit"><a  target="_blank"  href="<%#GetProductTitle(Eval("ProductID").ToString())%>" target="_blank"><%# Eval("ProductName")%></a>
					<br /><%#GetPIdListProducts(Eval("PackageIDs").ToString())%>
					</td>
					<td class="tc"><%# ((decimal)Eval("UserPrice")).ToString("f2") %></td>
					<td align="center"><%# Eval("Num")%></td>
					<td class="tc"><%# Eval("PriceSum")%></td>
				</tr></ItemTemplate></asp:Repeater>
			</table>
			<p class="jiesuan"  style="display:none">
			    <span>商品总金额：￥<span class="b f20 corange" runat="server" id="spOrderAmount"></span></span>
			</p>
			<p  style="display:none" class="jiesuan" runat="server" id="pConsumePoint">
			    <span>订单消耗积分：<span class="b corange">{$point$}</span>点</span>
			</p>
			<p  style="display:none" class="jiesuan" runat="server" id="pReturnPoint">
			    <span>回馈积分：<span class="b corange">{$point$}</span>点</span>
			</p>
			<p  style="display:none" class="tc b f14 c666 pt25">如果您在购物过程中遇到障碍导致支付失败，请点击<a style="color:Red">继续支付</a>按钮进行继续支付</p>
			<p  class="bot_btn">
			<asp:Button runat="server" ID="btnPre" OnClick="btnPre_Click" CssClass="b06 ml10" ToolTip="返回上一步" />
				<%--<input type="button" class="b10"   onclick="location.href='PaymentNotify.aspx?no=<%= OrderNo %>&pay=1'" />
				<asp:Button runat="server" ID="btnAddToCart" CssClass="b11 ml10" OnClick="btnAddToCart_Click" />
				<asp:Button runat="server" ToolTip="取消订单" ID="btnCancelOrder" OnClick="btnCancelOrder_Click" CssClass="b12 ml10" OnClientClick="return confirm('订单取消操作不可撤消，您确定取消订单吗？')" />
				--%>
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
<script type="text/javascript">
    altRow(0, "tbCartProducts", "", "bgF7F7F7");
</script>