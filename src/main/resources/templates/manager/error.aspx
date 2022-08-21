<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.error_cs, qwt" validaterequest="false" enableviewstate="false" enableviewstatemac="false" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
<title>ERROR</title>
<style type="text/css">
*{color:#000;font-size:14px;background:#fff}
a{text-decoration:underline}
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
<body style="padding:0;margin:0"><div id="body"><form id="form1" runat="server"><div>
<div style="border-bottom:solid 1px #000;padding:10px;margin-bottom:2px;color:red;font-weight:bold">操作提示</div>
<div id="div1" style="padding:10px;line-height:180%;"><%= OMessage %>
<div>+ <a href="javascript:void(0)" onclick="history.back()" style="font-size:14px;" class="u">返回上一页</a></div>
</div>
<div style="border-top:solid 1px #000;padding:5px 10px;margin-bottom:2px"><a href="mailto:likecode@gmail.com" style="font-weight:bold">OranSite</a> Administrator Control Panel</div>
</div></form></div></body></html>
<script type="text/javascript">
    if (window.top != window.self && window.top.$ && window.top.frames["frmEditor"]&&"<%=QS("popid")%>"=="") {
        window.top.$("body,html").animate({ scrollTop: 110 }, 100);
    }
</script>