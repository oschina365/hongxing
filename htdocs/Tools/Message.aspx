<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Tools.Tools_Message, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
<title>通用消息提示页</title>
<style type="text/css">
.msg_li______ a { text-decoration:underline;}
</style>
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
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Content:Start-->
<div class="cart_content">
	<div class="cart_main">
		<dl class="pri_dl">
        	<dt><img src="<%= Icon %>" alt="<%= IconAltText %>" /></dt>
            <dd><h4><%= NSW.OConfig.GlobalConfig.SiteName %>消息提示</h4></dd>
            <dd>
                <%= SMessage %>
                <ul class="msg_li______">
				    <%= SAction %>
				</ul>
            </dd>
        </dl>
        <div class="clear"></div>
        <div class="dashed_line"></div>
        <div class="pri_zuy" runat="server" id="pDelayMsg">
        	<h4>此页面将在<strong id="delayNotify_2" style="color:Red"><%= Delay %></strong>秒钟后跳转到以下地址：</h4>
            <div><a href="<%= BtnHref %>"><%= NSW.OConfig.Common.SiteDomain %><%= BtnHref%></a></div>
        </div>
        <div class="bot_btn"><input type="button" class="b13" value="<%= BtnTitle %>" onclick="toDefaultHref('<%= BtnHref %>')" /> <input type="button" class="b13" value="返 回" onclick="history.back();" /></div>
    </div>	
</div>
<!--Content:End-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
</body>
</html>
<script type="text/javascript">

var Tools_Message_delay = <%= Delay %>;
var ________d;
(function(){

if (Tools_Message_delay > 0){
    ________d = setInterval(resetDelayNotify, 1000);
}
})();
function resetDelayNotify(){
    --Tools_Message_delay;
    $("#delayNotify_1").html(Tools_Message_delay.toString());
    $("#delayNotify_2").html(Tools_Message_delay.toString());
    if (Tools_Message_delay == 0){
        window.clearInterval(________d);
    }
}
function toDefaultHref(dftHref){
    if(dftHref.length>0){
       
        location.href=dftHref;
    }
}
</script>
