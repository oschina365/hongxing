<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Paycenter.Paycenter_EndingConfirm, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>确认收货</title>
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
			    <strong>订单号：</strong>{$order_no$}
			    <img src="{$icon$}" alt="{$order_state$}" class="vam ml10" /><span class="b f14 corange pl5">({$order_state$})</span>
			</p>
			<h4 class="t01">确认收货</h4>
			<div class="c666 p5">
			    <h5 class="mb10">你对此次购买产品是否感到满意？</h5>
			    <div class="mb10">
			        <asp:Repeater runat="server" ID="rptEndingColumn"><ItemTemplate>
			        <span class="ml10"><input<%# Container.ItemIndex == 0 ? " checked='checked' " : string.Empty %> name="endingcolumn" type="radio" value="<%# Eval("ID") %>" id="rdoEnding_<%# Eval("ID") %>" /><label for="rdoEnding_<%# Eval("ID") %>"><%# Eval("Title") %></label></span>
			        </ItemTemplate></asp:Repeater>
			    </div>
			    <h5>你对此购物的评价：</h5>
			    <div><asp:TextBox runat="server" ID="txtEndingRemark" TextMode="MultiLine" style="width:300px;height:70px;"></asp:TextBox></div>
			</div>
			<p class="pt15 pb15">
				<asp:Button runat="server" ToolTip="确认收货" ID="btnEnd" OnClick="btnEnd_Click" CssClass="cWhite b36" Text="确认到货" OnClientClick="return confirm('确认到货操作不可撤消，您确定到货吗？')" />
			</p>
			<h4 class="t01">收货人信息</h4>
			<div runat="server" id="tbAddrInfo">
			<table class="t_a c666 l_25 mt12" width="100%">
				<tr>
					<td class="b" width="15%" align="right">收货人：</td>
					<td colspan="3">{$chn_name$}</td>
				</tr>
				<tr>
					<td class="b" align="right">收货地址：</td>
					<td colspan="3">{$province$} {$city$} {$addr$}{$zip_code$}</td>
				</tr>
				<tr>
					<td class="b" align="right">联系电话：</td>
					<td width="16%">{$tel$}</td>
					<td class="b" align="right" width="10%">手机号码：</td>
					<td width="64%">{$mobile$}</td>
				</tr>
				<tr>
					<td class="b" align="right">电子邮箱地址：</td>
					<td colspan="3">{$email$}</td>
				</tr>
			</table>
			</div>
			<h4 class="t01">送货方式</h4>
			<div class="c666 mt15 Song" runat="server" id="divDeliveryInfo">
			    <h5>{$title$}</h5>
			    <div>{$short_desc$}</div>
			    <div><img src="{$icon$}" alt="{$title$}" /></div>
			</div>
			<h4 class="t01">付款方式</h4>
			<div class="c666 mt15 Zhi" runat="server" id="divPaymentInfo">
			    <h5>{$title$}</h5>
			    <div>{$short_desc$}</div>
			    <div><img src="{$icon$}" alt="{$title$}" /></div>
			</div>
			<h4 class="t01">商品清单</h4>
			<table width="100%" border="1" bordercolor="#ECECEC" class="l_30 mt5" id="tbCartProducts">
				<tr class="b">
					<td align="center">序号</td>
					<td class="pl5">产品名称</td>
					<td align="center">购买价(￥)</td>
					<td align="center">数量(件)</td>
					<td align="center">小计(￥)</td>
				</tr>
				<asp:Repeater runat="server" ID="rpt"><ItemTemplate><tr>
					<td align="center"><%# Container.ItemIndex + 1 %></td>
					<td class="pl5"><a href="###" target="_blank"><%# Eval("ProductName")%></a></td>
					<td class="tr"><%# ((decimal)Eval("UserPrice")).ToString("f2") %></td>
					<td align="center"><%# Eval("Num")%></td>
					<td class="tr"><%# ((decimal)Eval("UserPrice") * (int)Eval("Num")).ToString("f2")%></td>
				</tr></ItemTemplate></asp:Repeater>
			</table>
			<p class="f14 b_dashed pl12 pb5 mt15">
			    <span>商品总金额：￥<span class="b f20 corange" runat="server" id="spOrderAmount"></span></span>
			</p>
			<p class="f14 b_dashed pl12 pb5 mt15" runat="server" id="pConsumePoint">
			    <span>订单消耗积分：<span class="b corange">{$point$}</span> 点</span>
			</p>
			<p class="f14 b_dashed pl12 pb5 mt15" runat="server" id="pReturnPoint">
			    <span>回馈积分：<span class="b corange">{$point$}</span> 点</span>
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