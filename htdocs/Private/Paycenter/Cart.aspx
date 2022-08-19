<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Paycenter.Paycenter_ShoppingBag, qwt" enableviewstate="true" enableviewstatemac="false" %>
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
<body><form runat="server" id="form1">
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Content:Start-->
<div class="cart_content">
	<div class="cart_main">
		<div class="cart_con">
			<CartLoc:CartLoc runat="server" ID="Loc_1" />
			<div class="lc1"></div>
			<h4 class="t01">推荐产品</h4>
           <div class="cart_tab_4">
        	<ul>
        	    <asp:Repeater ID="rptRelevant" runat="server">
    	            <ItemTemplate>
                         <li<%# Container.ItemIndex == RelevantItemCounts ? " class=\"line\"" : "" %>><p><a target="_blank" href="<%# Eval("PageUrl") %>"><%# Container.ItemIndex + 1 %><%# Eval("Title") %></a></p>
            	          <span class="money">￥<%# Eval(CLOSING_PRICE_COLUMN_TITLE) %></span>
            	          <input type="button" class="b01" value="购买" onclick="addToCart(this,<%# Eval("ID") %>,1,true)" />
           	            </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
         </div>
			<p class="cart_b4_bot">以上是我们为您特别推荐的产品，这些产品或许对你们有帮助，您可以直接点击购买把产品加入到您的购物车。</p>
			<h4 class="t02">我的购物车</h4>
			<asp:Repeater runat="server" ID="rpt"><HeaderTemplate><table style="border:solid 1px #ECECEC;width:100%;" class="cart_tab_2">
				<tr class="b">
					<td align="center">序号</td>
					<td class="pl5">产品名称</td>
					<td align="center">产品类别</td>
					<td align="center">产品属性</td>
					<td align="center">市场价(￥)</td>
					<td align="center">结算价(￥)</td>
					<td align="center">数量(件)</td>
					<td align="center">小计(￥)</td>
					<td align="center">管理</td>
				</tr>
				<tbody id="tbCartProducts"></HeaderTemplate>
				<ItemTemplate>
				<%--产品列表:start--%>
					<tr>
						<td class="tc"><%# Container.ItemIndex + 1 %></td>
						<td style="text-align:left;"><a href="<%# Eval("PageUrl") %>" target="_blank"><%# Eval("Title") %></a><%# (bool)Eval(SALE_PROMOTIN_COLUMN_TITLE) ? "<img style='margin-left:5px;' src='" + SkinPath + "img/sale_promotion.gif' title='加码销售' alt='加码销售' />" : string.Empty%>
						<br /><%#GetPIdListProducts(Eval(NSW.CartProductDetail.PIDLIST_TITLE).ToString())%>
						</td>
						<td class="tc"><%# Eval("ColumnName") %></td>
						<td class="tc"><%# Eval(NSW.CartProductDetail.ATTRIBUTES_TITLE)%></td>
						<td class="tr"><%# ((decimal)Eval("Price")).ToString("f2") %></td>
						<td class="tr"><%# ((decimal)Eval(NSW.CartProductDetail.CLOSING_PRICE_COLUMN_TITLE)).ToString("f2") %></td>
						<td class="quantity_tr">
						    <input type="text" maxlength="5"<%# (bool)Eval(SALE_PROMOTIN_COLUMN_TITLE) ? " disabled=\"disabled\"" : string.Empty %> onkeyup="digiOnly(this);$(this).next().show()" value="<%# Eval(NSW.CartProductDetail.QUANTITY_COLUMN_TITLE) %>"  style="display:<%# Eval(NSW.CartProductDetail.PIDLIST_TITLE).ToString()==""?"":"none" %>" />
						    <a href="javascript:void(0)" onclick="changeQuantity(this,<%#Eval("ID")%>,'<%# Eval(NSW.CartProductDetail.ATTRIBUTES_TITLE) %>')">确定</a>
						</td>
						<td class="tr"><%# ((decimal)Eval(NSW.CartProductDetail.SUBTOTAL_COLUMN_TITLE)).ToString("f2") %></td>
						<td class="tc"><a href="javascript:void(0)" onclick="if(confirm('您确定不购买该产品吗？')){delCartProduct(this,<%# Eval("ID") %>,'<%# Eval(NSW.CartProductDetail.ATTRIBUTES_TITLE) %>');}" title="不购物该产品" class="corange u">删除</a></td>
					</tr>
				<%--产品列表:end--%>
				</ItemTemplate>
					<FooterTemplate>
				</tbody>
			</table></FooterTemplate></asp:Repeater>
			<p class="jiesuan">
			    <span>商品总金额：￥<span class="sp_2" runat="server" id="spOrderAmount"></span></span>
			    <span class="ml10 f12" runat="server" id="spSave">您共节约：￥<span class="b">{$save$}</span></span>
			</p>
			<p class="jiesuan">
			     <span class="b f20 corange" runat="server" id="spAttrNotice" visible="true"></span>
			</p>
			<p class="jiesuan" runat="server" id="cardInfo" visible="false">
			    优惠券面额：{$denomination$}元
			</p>
			<p class="jiesuan" runat="server" id="pConsumePoint" style="display:none">
			    <span>订单消耗积分：<span class="b corange">{$point$}</span> 点</span>
			    
			</p>
			<span class="ml10" runat="server" id="spConsumePointNotify" style="display:none">您的积分现在是 {$my_point$} 点，不足本次订单所需积分。</span>
			<p class="jiesuan" runat="server" id="pReturnPoint" style="display:none">
			    <span>订单付款后，回馈积分：<span class="b corange">{$point$}</span> 点</span>。
			</p>
			 <span class="ml10" runat="server" id="spReturnPointNotify">您未登录，<%--积分将无效，--%>请<a class="u" href="/user/register.aspx">注册</a>或<a class="u" href="/user/login.aspx">登录</a>。</span>
			<p class="bot_btn2">
			    <span class="fr">
			        <input type="button" class="b02" onclick="emptyCart(this)" title="清空购物车" />
				    <input type="button" class="b03 ml10" title="继续购物" onclick="location.href='/product'" />
			    </span>
			    <asp:Button runat="server" ID="btnNext" OnClick="btnNext_Click" CssClass="b04" ToolTip="下一步，结算" />
			</p>
		</div>
	</div>
</div>
<!--Content:End-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
</form></body>
</html>
<script type="text/javascript">
    altRow(0, "tbCartProducts", "", "bgF7F7F7");
</script>
