<%@ Page Language="C#" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Status = "404 Not Found";
    } 
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>页面没有找到</title>
    <style type="text/css">
        /*common*/
        .mb10 { margin-bottom:10px;}
        .ml10 { margin-left:10px;}
        .bg { background:#FFF;}
        em,i{ font-style:normal;}
        /*404页面*/
        .page{ background:url(/skins/default/Img/pagebg.jpg) no-repeat center -130px; overflow:hidden;}
        .page p{ float:right; padding-top:70px;}
        .content{ width:960px;margin:0 auto;}
        .search{ width:820px; float:right; padding-top:300px;}
        .page01{ width:567px; height:62px; background:url(/skins/default/Img/sr.jpg) no-repeat 0 0; border:none; float:left; margin-right:10px; font-size:38px; font-family:"Microsoft Yahei";padding:0px 10px}
        .page02{ width:210px; height:62px; background:url(/skins/default/Img/ss.jpg) no-repeat 0 0; border:none; float:left; cursor:pointer;}
        /*aspx*/
        .clearfix:after {content: ".";display: block;clear: both;visibility: hidden;line-height: 0;height: 0;}
        .clearfix {display: inline-block;}
        html[xmlns] .clearfix {display: block;}
        /**/
    </style>
    <link href="/css/reset.css" rel="stylesheet" type="text/css" />
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
<div class="page" id="page">
   <div class="content" >
      <p><a href="/" title="返回首页"><img src="/skins/default/Img/back.jpg" alt="返回首页" title="返回首页" /></a></p>
      <div class="search">
         <input type="text" value="" id="iptkeyword" class="page01" placeholder="请输入关键词进行搜索" />
         <input type="button" value="" id="btnsubmit" class="page02" />
      </div>   
   </div>
</div>
    <script type="text/javascript">
        var $$ = function (id) { return document.getElementById(id); };
        window.setTimeout(function () {
            window.location.href = "/";
        }, 8000);
        $$("btnsubmit").onclick = function () {
            window.location.href = "/Search/Index.aspx?objtype=product&kwd=" + $$("iptkeyword").value.replace(/^\s+|\s+$/g, "");
        };
        document.getElementById("page").style.height = document.documentElement.clientHeight + "px";
        document.documentElement.style.overflow = "hidden";
    </script>
</body>
</body>
</html>
