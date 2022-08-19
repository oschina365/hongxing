<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Paycenter.OrderConfirm, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register TagPrefix="SalePromotion" TagName="SalePromotion" Src="~/UserControls/Cart/SalePromotion.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>订单确认</title>
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
			<div class="lc4"></div>
			<h4 class="t01">收货人信息</h4>
			<table class="cart_tab_1" width="100%">
				<tr>
					<th width="18%" class="tr" align="right">收货人：</th>
					<td><%= NSW.OCookie.Cart.ShipTo.Consignee %></td>
				</tr>
				<tr>
					<th class="tr" align="right">收货地址：</th>
					<td colspan="3">
					    <%= NSW.OCookie.Cart.ShipTo.Province%>
					    <%= NSW.OCookie.Cart.ShipTo.City %>
					    <%= NSW.OCookie.Cart.ShipTo.Address %>
					    <%= NSW.OCookie.Cart.ShipTo.ZipCode.Length > 0 ? "<span>[邮编：" + NSW.OCookie.Cart.ShipTo.ZipCode + "]</span>" : string.Empty %>
					</td>
				</tr>
				<tr>
					<th class="tr" width="18%" align="right">联系电话：</th>
					<td colspan="3">
					    <%= NSW.OCookie.Cart.ShipTo.Tel.Length > 0 ? "<span class='mr10'>固定电话：" + NSW.OCookie.Cart.ShipTo.Tel + "</span>" : string.Empty %>
					    <%= NSW.OCookie.Cart.ShipTo.Mobile.Length > 0 ? "<span>手机号码：" + NSW.OCookie.Cart.ShipTo.Mobile + "</span>" : string.Empty%>
					</td>
				</tr>
				<tr>
					<th class="tr" width="18%" align="right">电子邮箱地址：</th>
					<td colspan="3"><%= NSW.OCookie.Cart.ShipTo.Email %></td>
				</tr>
			</table>
			<h4 class="t01">送货方式</h4>
			<div class="songhuo">
			    <%= NSW.OCookie.Cart.DeliveryMethodTitle %>
			    <img src="<%= NSW.OCookie.Cart.DeliveryMethodIcon %>" />
			</div>
			<h4 class="t01">付款方式</h4>
			<div class="zhifb">
			    <%= NSW.OCookie.Cart.PaymentMethodTitle %>
			    <img src="<%= NSW.OCookie.Cart.PaymentMethodIcon %>" />
			</div><a id="product_list"></a>
			<h4 class="t02">商品清单</h4>
			<table width="100%" border="1" bordercolor="#ECECEC" class="cart_tab_2" id="tbCartProducts">
				<tr class="b">
					<td align="center">序号</td>
					<td class="pl5">产品名称</td>
					<td align="center">产品类别</td>
					<td align="center">产品属性</td>
					<td align="center">结算价(￥)</td>
					<td align="center">数量(件)</td>
					<td align="center">小计(￥)</td>
				</tr>
				<asp:Repeater runat="server" ID="rpt"><ItemTemplate>
					<tr>
						<td align="center"><%# Container.ItemIndex + 1 %></td>
						<td  class="tit"><a href="<%# Eval("PageUrl") %>" target="_blank"><%# Eval("Title") %></a><%# (bool)Eval(SALE_PROMOTIN_COLUMN_TITLE) ? "<img style='margin-left:5px;' src='" + SkinPath + "img/sale_promotion.gif' title='加码销售' alt='加码销售' />" : string.Empty%>
						<br /><%#GetPIdListProducts(Eval(NSW.CartProductDetail.PIDLIST_TITLE).ToString())%>
						</td>
						<td class="tc"><%# Eval("ColumnName") %></td>
						<td class="tc"><%# Eval(NSW.CartProductDetail.ATTRIBUTES_TITLE)%></td>
						<td class="tc"><%# ((decimal)Eval(NSW.CartProductDetail.CLOSING_PRICE_COLUMN_TITLE)).ToString("f2") %></td>
						<td align="center"><%# Eval(NSW.CartProductDetail.QUANTITY_COLUMN_TITLE) %></td>
						<td class="tc"><%# ((decimal)Eval(NSW.CartProductDetail.SUBTOTAL_COLUMN_TITLE)).ToString("f2") %></td>
					</tr>
				</ItemTemplate></asp:Repeater>
			</table>
			<div class="jiesuan" runat="server" id="divAmount">
			    <p>
			        <span class="fr">订单应付总额：<strong class="f20 corange">￥{$amout$}</strong></span>
			    </p>
			    <p>金额明细：
			        <span class="mr10">产品总额：￥{$prod_amount$}</span>
			        <span class="mr10">配送费：￥{$delivery_fee$}</span>
			        <span>优惠券：{$card_denomination$}</span>
			    </p>
			</div>
			<div class="jiesuan">
			     <p><span class="b f20 corange" runat="server" id="spAttrNotice"></span></p>
			</div>
			<div class="jiesuan">
			    <p runat="server" id="pPoint" visible="true" class="pt5">需要消耗积分：<strong class="f14 corange">{$point$}点</strong></p>
			    <p runat="server" id="pReturnPoint" visible="true" class="b_dashed pb5">回馈积分：<strong class="f14 corange">{$return_point$}点</strong></p>
			</div>
			<SalePromotion:SalePromotion runat="server" id="uc_SalePromotion_1" />
		</div>
		<div class="bot_btn">
		    <asp:Button runat="server" ID="btnPre" OnClick="btnPre_Click" CssClass="b06 ml10" ToolTip="返回上一步" />
			<asp:Button runat="server" ID="btnNext" OnClick="btnNext_Click" CssClass="b04" ToolTip="确认提交订单" />
		</div>
		<p class="cart_tis">目前<%=NSW.OConfig.GlobalConfig.SiteName %>已经获得支付宝特约商家荣誉,请放心支付</p>
		<dl class="oder">
			<dt><img src="/Skins/Default/Img/alipay01.gif" alt="" title="" /></dt>
			<dd><a href="">支付宝使用说明</a></dd>
			<dd><a href="" title="">开通支付宝</a></dd>
		</dl>
		<div class="clear"></div>
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
    var _HasSalePromotion="<%= HasSalePromotion ? "true" : "false" %>";
    var _SalePromotionProductID="<%= SalePromotionProductID %>";
    var _SalePromotionProductTitle = "<%=SalePromotionProductTitle %>";
    function _addSalePromotionProduct(src, prodId,prodTitle) { 
        if(prodId!=_SalePromotionProductID&&_HasSalePromotion){
            var yesToDo = {title:"添加",toDo:function(){
                addToCart(src,prodId,1,false,"/Paycenter/OrderConfirm.aspx");
            }};
            var noToDo = {title:"取消",toDo:function(){
                hideConfirm();
            }};
            $confirm("您好，您的购物车里面已经包含一件加码销售产品，如要添加：<span class=\"u\">"
            +prodTitle+"</span>，必须把：<span class=\"u\">"+_SalePromotionProductTitle+"</span>下架，确定要更换此产品吗？",yesToDo, noToDo);
        }else if(prodId==_SalePromotionProductID){
            $a("您好，产品：<span class=\"u\">"+prodTitle+"</span>产品已经添加到您的购物车，请勿重复提交，请点击下一步进入产品支付环节，感谢您对我公司的支持！",2);
            return;
        }
    }
</script>