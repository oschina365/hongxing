<%@ control language="C#" autoeventwireup="true" inherits="NSW.Web.UserControls.Common.LocL, qwt" enableviewstate="false" %>
<div class="plc">
    <span>当前位置：</span><a href="<%=NSW.OConfig.Common.SiteDomain %>/" title="首页">首页</a>
    <%
        foreach (System.Collections.Generic.KeyValuePair<string, string> dicPathCrumb in _dic)
        {
            string title = dicPathCrumb.Key;
            string url = dicPathCrumb.Value;
    %>
            <%=NVEngine.NVTempHelp.LocTemp %>
            <%if (string.IsNullOrEmpty(url)){%>
            <%=title %>
            <%}else{%>
            <a href="<%=url %>" title="<%=title %>"><%=title %></a>
            <%}%>
     <%}%>
</div>