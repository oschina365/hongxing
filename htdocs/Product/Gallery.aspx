<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Product.Gallery, qwt" enableviewstate="false" enableviewstatemac="false" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="shortcut icon" href="favicon.ico" >
<link rel="icon" href="animated_favicon.gif" type="image/gif" >
<link href="themes/default/style.css" rel="stylesheet" type="text/css" />
<style>
body{margin:0;}
</style>
<script type="text/javascript">
var close_window = '您是否关闭当前窗口';
</script>
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
<div id="Div1">
<embed src="/Component/pic-view.swf" quality="high" id="picview" flashvars="copyright=shopex&xml=<products name='<%= OBJ.Title %>' shopname='<%= NSW.OConfig.GlobalConfig.SiteName %>' water_mark_img_path='' water_mark_position='3' water_mark_alpha='0.5'>
<%= OHtml %>
</products>" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="100%" height="100%"></embed>

<script>
function windowClose()
{
    if(window.confirm(close_window))
    {
        window.close();
    }
}
</script>
</div>
</body>
</html>