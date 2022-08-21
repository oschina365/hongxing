<%@ control language="C#" autoeventwireup="true" inherits="ManagerUserControl.CurrentPosition, qwt" enableviewstate="false" %>
<div class="nsw_bread_tit">
    <span class="nsw_add">当前位置：<a href="/<%=NSW.OConfig2.PrivateSet.OverrideManagerPath %>/home.aspx" target="_parent">后台首页</a><%=sb.ToString().TrimEnd(';').Replace(";", "&gt;")%></span>
    <%--<div class="bread_link"><a href="/" target="_blank">网站首页</a>|<a href="/help/" target="_blank">帮助</a></div>--%>
</div>