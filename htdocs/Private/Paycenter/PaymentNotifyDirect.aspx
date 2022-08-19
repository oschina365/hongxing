<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Paycenter.PaymentNotifyDirect, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>付款处理</title>
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
		<div class="cart_con pb10">
			<CartLoc:CartLoc runat="server" ID="Loc_1" />
			<h2 class="tc" runat="server" id="hPayInfo">订单提交成功！</h2>
			<div class="f16" runat="server" id="divOrderSn">订单号：<strong class="corange">{$order_sn$}</strong></div>
			<div class="f16 b_dashed pb5 mb10" runat="server" id="divAmount">应付款：<strong class="corange">￥{$amount$}</strong></div>
			<div runat="server" id="divNotify" class="mb10 b_dashed pb10">
			    <h3 class="f14 mb5">{$title$}</h3>
			    <div class="mb5">{$short_desc$}</div>
			    <div><img src="{$icon_path$}" alt="{$title$}" /></div>
			</div>
			<div runat="server" id="divOrderStateNotify" class="tc mb10" visible="false">直接支付订单信息已清空，不可返回或刷新本页面，请单击下面按钮完成付款操作。</div>
			<div runat="server" id="divBtn" class="tc">
			    <input value="{$value$}" type="button" type="button" class="{$class$}" title="{$title$}" onclick="{$click$}" />
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>
<!--Content:End-->
<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</form>
<%= SbKQ99BillParaHtml.ToString() %>
</body>
</html>