<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Paycenter.QuickOrderSuccessful, qwt" enableviewstate="true" enableviewstatemac="false" %>

<%@ Register TagPrefix="QuickOrderLoc" TagName="QuickOrderLoc" Src="~/UserControls/Cart/QuickOrderLoc.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>快速下单处理</title>
<link href="../Skins/Default/QuickOrder.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../JS/QuickOrder.js" ></script>
<script language="javascript" type="text/javascript" src="../JS/PagerView.js" ></script>
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

<!--主要内容开始-->
<div class="content">
	<div class="content_neir">
    	<div class="menu1">当前位置：<a href="#">首页</a>-><a href="#">产品中心</a>-><span><a href="#">快速下单</a></span></div>
        <div class="jind">
        	<ul>
        		<li class="hong"><img src="/Skins/Default/Img/QuickOrder/ico1.gif" />搜索合适产品</li>
            	<li class="hong"><img src="/Skins/Default/Img/QuickOrder/ico1.gif" />填写采购数量及要求</li>
           		<li class="hong"><img src="/Skins/Default/Img/QuickOrder/ico1.gif" />填写您的联系方式</li>
            	<li class="hong"><img src="/Skins/Default/Img/QuickOrder/ico1.gif" />订单确认</li>
           		<li class="nones hong"><img src="/Skins/Default/Img/QuickOrder/ico1.gif" />提交成功</li>
        	</ul>
        </div>
        
        <div class="miaos">为了加快双方的沟通效率和我方备货和发货速度，请在下面的产品筛选窗口查找您所需要的产品，同时在右方设置好产品采购的数量及要求，提交表单后，我方将会第一时间派专员与您取得联系。</div>
        
        <div class="chengg">
        	<div class="tijiao">订单提交成功</div>
            <h4>恭喜您！您的订单已经提交成功，系统已经发送了一封订单详细信息到您的</h4>
            <span>电子邮件(<%= Eamil %>),请注意查收！</span>
        </div>
        <div class="anniu">
        <a href="/user/orderlist.aspx"><img name="" type="image" src="/Skins/Default/Img/QuickOrder/btn8.gif"  class="an5"/></a>
        <a href="/"><img name="" type="image" src="/Skins/Default/Img/QuickOrder/btn9.gif"  class="an6"/></a>
        </div>
  </div>
  
  
</div>
<div class="clear"></div>
<!--主要内容结束-->

<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</form>


 
</body>
</html>

