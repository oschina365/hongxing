<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Paycenter.Paycenter_EndingConfirm_ok, qwt" enableviewstate="true" enableviewstatemac="false" %>
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
			<div class="pay5 f14">
				<p class="b">恭喜您！您已成功提交确定收货。</p>
			</div>
			<p class="tc pt15 pb15">
				<input type="button" class="b08" onclick="javascript:window.location='/User/orderlist.aspx?type=p';" />
				<input type="button" class="b09 ml10" onclick="javascript:window.location='/';"/>
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