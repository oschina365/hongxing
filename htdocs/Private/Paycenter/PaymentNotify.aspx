<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Paycenter.PaymentNotify, qwt" enableviewstate="true" enableviewstatemac="false" %>

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
    <!--Header:Start-->
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
    <!--Header:end-->
    <!--Content:Start-->
    <div class="cart_content2">
        <div class="cart_main" style="border:0;">
            <div class="pb10">
                <CartLoc:CartLoc runat="server" ID="Loc_1" />
                <div class="cart_con">
                <h2 class="tc" runat="server" id="hPayInfo">
                </h2>
                <div class="f16" runat="server" id="divOrderSn">
                    订单编号：<strong class="corange">{$order_sn$}</strong></div>
                     <div class="f16 b_dashed pb5 mb10" runat="server" id="divAmount">
                    订单金额：<strong class="corange">￥{$amount$}</strong></div>
               <div class="f16" runat="server" id="divtime">
                    订单时间：<strong class="corange">{$time$}</strong></div>
                       <div class="f16" runat="server" id="divcontact">
                    姓名：<strong class="corange">{$contact$}</strong></div>
                      <div class="f16" runat="server" id="divtel">
                    电话：<strong class="corange">{$tel$}</strong></div>
                              <div class="f16" runat="server" id="divaddress">
                    地址：<strong class="corange">{$address$}</strong></div>
               
                <div runat="server" id="div_str" class="div_str" visible="false">
                    订购成功，稍后客服人员将与您核对地址</div>
                <div runat="server" id="divNotify" class="mb10 b_dashed pb10">
                    <h3 class="f14 mb5">
                     支付方式:  {$title$}</h3>
                   <%-- <div class="mb5">
                        {$short_desc$}</div>--%>
                   <%-- <div>
                        <img src="{$icon_path$}" alt="{$title$}" /></div>--%>
                </div>
                <div id="txtdiv" runat="server">
                    <input type="hidden" id="textid" value="{$textid$}" />
                </div>
                <div runat="server" id="divOrderStateNotify" class="tc mb10" visible="false">
                </div>
                <div runat="server" id="divBtn" class="tc">
                    <input value="{$value$}" type="button" type="button" class="{$class$}" title="{$title$}"
                        onclick="{$click$}" />
                </div>
                <div class="clear">
                </div>
            </div></div>
        </div>
    </div>
    <!--Content:End-->
    <!--Footer:Start-->
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
    <!--Footer:End-->
    <%= SbKQ99BillParaHtml.ToString() %>
</body>

<script type="text/javascript">
showDiv();

//        function goto()
//        {
//        window.location.href="/helps/contactus.html";
//        }
//        
//        function showDiv()
//        {
//            var id=$("#textid").val();
//            if(id==2){
//            $a("您的订单已成功！5秒钟之后跳转到帮助页面")
//             setTimeout( "goto()",5000); 
//            }

        }


</script>

</html>
