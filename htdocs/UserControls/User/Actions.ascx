<%@ control language="C#" autoeventwireup="true" inherits="NSW.Web.UserControls.User.Actions, qwt" enableviewstate="false" %>
<div class="left">
	<div class="userleftnav">
		<h4>基本设置</h4>
		<ul>
			<li><a item_name="home" href="/user">会员中心首页</a></li>
			<li><a item_name="profile" href="userprofile.aspx">基本信息</a></li>
			<li><a item_name="password"  href="ChangePws.aspx">修改密码</a></li>
			
		</ul>
		 <div id="divAgent" runat="server" visible="false">
		    <h4>加盟商专区</h4>
		    <ul>
		        <li><a href="/Paycenter/QuickOrder.aspx">在线下单</a></li>
			   <li><a item_name="orders"  href="orderlist.aspx?type=p">我的订单</a></li>
		    </ul>
		</div> 
        <%--<h4>收藏夹</h4>
		<ul>
			<li><a item_name="fav_cat"  href="MyFavoritesColumn.aspx">收藏夹分类设置</a></li>
			<li><a item_name="fav"  href="MyFavorites.aspx">我的收藏夹</a></li>
			<li><a item_name="fav"  href="Mywishs.aspx">我的愿望夹</a></li>
			<li><a item_name="fav"  href="MyDownloads.aspx">我的下载中心</a></li>
		</ul>--%>
		<%--<h4>交易管理</h4>
		<ul>
			<li><a item_name="pay_d"  href="PayDirect.aspx">网上直接付款</a></li>
			<li><a href="/Paycenter/cart.aspx" target="_blank">购物车</a></li>
            <li><a href="/Paycenter/QuickOrder.aspx" target="_blank">批量下单</a></li>
			<li><a item_name="orders"  href="orderlist.aspx?type=p">我的订单</a></li>
			<li><a item_name="chit"  href="chit.aspx">我的优惠券</a></li>
			<li><a item_name="point"  href="PointLog.aspx">积分查询</a></li>
			<li><a item_name="addr"  href="MyAddress.aspx">收货地址</a></li>
		</ul>--%>
		<%--<h4>客户服务</h4>
		<ul>
			<li><a item_name="feedback"  href="faq.aspx">意见\建议</a></li>
		</ul>--%>
		<h4>其它</h4>
		<ul>
		    <li><a item_name="inv"  href="InviteUser.aspx">邀请朋友注册</a></li>
		    <li><a item_name="inv_log"  href="InviteUserList.aspx">邀请函发送日志</a></li> 
		    <li><a href="login.aspx?action=logout">退出</a></li>
		</ul>
	</div>
</div>
<script type="text/javascript">
    (function() {
        var currentPos = "<%= CurrentPosition %>";
        var jLis = $(".userleftnav").find("a");
        for (var i = 0; i < jLis.length; ++i) {
            if ($(jLis[i]).attr("item_name") == currentPos) {
                $(jLis[i]).addClass("cur");
            }
        }
    })();
</script>