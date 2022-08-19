<%@ control language="C#" autoeventwireup="true" inherits="NSW.Web.UserControls.User.Header, qwt" enableviewstate="false" %>
<div class="header">
	<div class="logo2"><img src="<%= NSW.OConfig.Common.Skin %>Img/logo.gif" class="vam" /></div>
    <div class="u_top_rt">
    	<img src="<%= NSW.OConfig.Common.Skin %>Img/top_zfb.gif" class="zfb" />
        <div class="u_name">
        	<div class="first">欢迎你：<span><%= HeaderUsernameHtml%></span></div>
            <div><%= HeaderToolsHtml%></div>
        </div>
        <div class="u_next">
        	<div class="u_top_call"><img src="<%= NSW.OConfig.Common.Skin %>Img/ico31.gif" alt="" title=""/><span>热线：</span><%= NSW.OConfig.GlobalConfig.Product.SalesHotLine %></span></div>
            <div class="u_top_nav">
		    	<ul>
					<li><a href="/">首页</a></li>
				    <li><a href="/user/faq.aspx">在线留言</a></li>
				    <li><a href="#">客服中心</a></li>
				    <li><a href="/helps/contactus.html">联系我们</a></li>
				</ul>
		   </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div class="u_menu">
	<div><a href="/">网站首页</a> <a href="/product">产品中心</a> <a href="/news">资讯中心</a> <a href="/help">帮助中心</a> <a href="/helps/aboutus.html">关于我们</a> <a href="/helps/contactus.html">联系我们</a></div>
</div>