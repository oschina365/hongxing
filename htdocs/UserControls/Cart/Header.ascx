<%@ control language="C#" autoeventwireup="true" inherits="NSW.Web.UserControls.Cart.Header, qwt" enableviewstate="false" %>
<div class="cart_header">
	<a href="/"><img src="<%= NSW.OConfig.Common.Skin %>Img/Common/logo.gif" /></a>
    <div class="cart_top">
    	<div class="cart_nav">
        	<div class="cart_n_rt">
            <span runat="server" id="spUser">欢迎您<span style="font-weight:bold;"><%= NSW.OSession.Mem.Username %></span> :
            <a href="/user">会员中心</a>
            | <a href="/user/login.aspx?action=logout" class="a_2">退出</a></span>
            <span runat="server" id="spGuest"><span class="sp_1">游客</span> :
            <a href="/user/register.aspx">注册</a>
            | <a href="/user/login.aspx?return=1">登录</a></span>
            </div>
            <strong runat="server" id="srgCurrentTitle">网站首页</strong>
        </div>
    </div>
</div>