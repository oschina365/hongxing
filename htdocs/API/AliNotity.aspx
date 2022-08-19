<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.API.API_AliNotity, qwt" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
<!--Header:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Header:end-->
<!--Content:Start-->
<div class="cart_content">
	<div class="cart_main">
    	<div class="cart_crumbs">当前位置：<a href="/user/orderlist.aspx">我的订单</a> -> <a href="#">订单支付成功</a></div>
        <div class="pay_ok">
            <%=OHtml%>
		</div>
        <div class="bot_btn"><input type="button" class="b08" onclick="javascript:window.location='/user/orderlist.aspx'" /> <input type="button" class="b09" onclick="javascript:window.location='/'" /></div>
    </div>	
</div>
<!--Content:End-->
<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</body>
</html>
