<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Paycenter.Paycenter_Paymethod, qwt" enableviewstate="true" enableviewstatemac="false" %>
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
<body><form runat="server" id="aspnetForm">
<!--Header:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Header:end-->
<!--Content:Start-->
<div class="cart_content">
	<div class="cart_main">
		<div class="cart_con">
			<CartLoc:CartLoc runat="server" ID="Loc_1" />
			<div class="lc3"></div>
			<div class="add_info" runat="server" id="divAddrInfo">
			    <p>订单商品金额：<span class="b">￥{$prod_amount$}</span></p>
			    <p>使用优惠券：<span class="b">{$card_denomination$}</span></p>
			    <p>本次订单金额：<span class="b f16">￥{$order_amount$}</span></p>
			    <p>收件人：<span>{$chnName$}</span></p>
			    <p>地址：<span>{$addr$}</span></p>
			</div>
			<h4 class="t01">支付方式</h4>
			<table class="payment_tab" id="ulPayment">
			    <asp:Repeater runat="server" ID="rptPaymethods"><ItemTemplate><tr>
			        <td<%# (Container.ItemIndex + 1) != PaymentItemCount ? " style='border-bottom:solid 1px #ddd;'" : string.Empty %>>
			            <input onclick="$j('hdnPaymentID').val(this.value);" id="paymethod_<%# Eval("ID") %>" name="paymethod" type="radio" value="<%# Eval("ID") %>" />
			            <label for="paymethod_<%# Eval("ID") %>"><%# Eval("Title") %></label>
			        </td>
			        <td<%# (Container.ItemIndex + 1) != PaymentItemCount ? " style='border-bottom:solid 1px #ddd;'" : string.Empty %>>
				        <div><%# Eval("ShortDesc") %></div>
				        <div><img src="<%# Eval("PhotoPath") %>" alt="<%# Eval("Title") %>" /></div>
			        </td>
			    </tr></ItemTemplate></asp:Repeater>
			</table>
			<h4 class="t01">发货方式</h4>
			<table class="payment_tab" id="ulDelivery">
			    <asp:Repeater runat="server" ID="rptDeliveries"><ItemTemplate><tr>
			        <td<%# (Container.ItemIndex + 1) != PaymentItemCount ? " style='border-bottom:solid 1px #ddd;'" : string.Empty %>>
			            <input onclick="$j('hdnDeliveryID').val(this.value);" id="delivery_<%# Eval("ID") %>" name="delivery" type="radio" value="<%# Eval("ID") %>" />
			            <label for="delivery_<%# Eval("ID") %>"><%# Eval("Title") %></label>
			        </td>
			        <td<%# (Container.ItemIndex + 1) != PaymentItemCount ? " style='border-bottom:solid 1px #ddd;'" : string.Empty %>>
			            ￥<%# ((decimal)Eval("Price")).ToString("f2") %>
			        </td>
			        <td<%# (Container.ItemIndex + 1) != PaymentItemCount ? " style='border-bottom:solid 1px #ddd;'" : string.Empty %>>
				        <div><%# Eval("ShortDesc") %></div>
				        <div><img src="<%# Eval("PhotoPath") %>" alt="<%# Eval("Title") %>" /></div>
			        </td>
			    </tr></ItemTemplate></asp:Repeater>
			</table>
			<p class="pt15 pb15">
				<asp:Button runat="server" ID="btnNext" OnClick="btnNext_Click" CssClass="b04" ToolTip="下一步，结算" />
				<asp:Button runat="server" ID="btnPre" OnClick="btnPre_Click" CssClass="b06 ml10" ToolTip="返回上一步" />
			</p>
		</div>
	</div>
</div>
<asp:HiddenField runat="server" ID="hdnDeliveryID" />
<asp:HiddenField runat="server" ID="hdnPaymentID" />
<!--Content:End-->
<div id="divCartMyAddr">
    <iframe frameborder="0" scrolling="no" src="###"></iframe>
</div>
<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</form></body>
</html>
<script type="text/javascript">
var __oran__payment_method_id=<%=  NSW.OCookie.Cart.PaymentMethodID %>;
var __oran__delivery_method_id=<%= NSW.OCookie.Cart.DeliveryMethodID %>;
$(".payment_tab:eq(0)").find("input[value="+__oran__payment_method_id+"]").attr("checked","checked");
$(".payment_tab:eq(1)").find("input[value="+__oran__delivery_method_id+"]").attr("checked","checked");
</script>