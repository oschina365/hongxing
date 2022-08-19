﻿<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.index_cs, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <title>建站平台登录</title>
    <link type="text/css" rel="stylesheet" href="skins/base/common.css" />
    <link type="text/css" rel="stylesheet" href="skins/default/default.css"/>
    <link type="text/css" rel="stylesheet" href="skins/base/login.css" />
    <script type="text/javascript" src="js/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="js/Common/Common.js"></script>
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
<div id="login_wrap">

    <div class="hd_login">
	    <div class="header">
		    <h2 class="login_logo"><img src="skins/img/login_logo.png" /></h2>
	    </div>
    </div>
    <div class="login_bg" id="middle">
	    <div class="content">
   	    <form id="form1" runat="server" defaultfocus="txtUserName" defaultbutton="btnLogin">
		    <span class="form_slogan"><img src="skins/img/welcome.gif"/></span>
            <span class="username"><asp:TextBox ID="txtUserName" runat="server" MaxLength="20" placeholder="Username" autocomplete="off" tips="用户名" _required="true" deltaX="40"></asp:TextBox></span>
            <span class="password"><asp:TextBox ID="txtUserPassword" runat="server" MaxLength="20" TextMode="Password" placeholder="Password" autocomplete='off'  tips="密码" _required="true" deltaX="40"></asp:TextBox></span>
		    <div class="ver_line"><asp:TextBox ID="txtValidCode" runat="server" MaxLength="4" autocomplete='off' class="ver_code" tips="验证码" _required="true" tipPosition="top"></asp:TextBox><span class="ver_img"><img id="Codes" src="/tools/YellowCode.aspx" onerror="this.src='/tools/YellowCode.aspx?'+new Date().getTime();"  onclick="this.src='/tools/YellowCode.aspx?'+new Date().getTime();"/></span><span class="ver_refresh" onclick="document.getElementById('Codes').src='/tools/YellowCode.aspx?'+new Date().getTime();">换一个</span></div>
		    <span class="log_tips" runat="server" id="message"></span>
		    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="登&nbsp;录" OnClientClick="return ValidateForm(this);" class="login_btn"/>
	    </form>
	    <div class="clear"></div>
	    </div>
    </div>
    <div class="login_ft">
	    <div class="footer login_foot">网址 http://www.nsw88.com Services@nsw88.com 服务热线： 400-333-087  Power By 深圳市牛商网络股份有限公司</div>
    </div>
</div>

<%--<div style="left: 1067.6px; top: 185px; display: block; color: rgb(0, 0, 0); border-color: rgb(204, 153, 51); background-color: rgb(255, 255, 204);" class="tooltip tooltip-right"><div class="tooltip-content">请输入用户名</div><div style="border-right-color: rgb(204, 153, 51);" class="tooltip-arrow-outer"></div><div style="border-right-color: rgb(255, 255, 204);" class="tooltip-arrow"></div--%>

</body>
<script type="text/javascript">
    var winWidth = 0;

    var winHeight = 0;

    function findDimensions() //函数：获取尺寸
    {
        //获取窗口宽度

        if (window.innerWidth)
        { winWidth = window.innerWidth; }
        else if ((document.body) && (document.body.clientWidth))
        { winWidth = document.body.clientWidth; }

        //获取窗口高度

        if (window.innerHeight)
        { winHeight = window.innerHeight; }
        else if ((document.body) && (document.body.clientHeight))
        { winHeight = document.body.clientHeight; }
        //通过深入Document内部对body进行检测，获取窗口大小

        if (document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth) {
            winHeight = document.documentElement.clientHeight;
        }
        document.getElementById("login_wrap").style.height = winHeight + "px";
    }

    findDimensions();

    //调用函数，获取数值

    window.onresize = findDimensions;
</script>
</html>
