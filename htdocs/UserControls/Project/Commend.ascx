<%@ control language="C#" autoeventwireup="true" inherits="NSW.Web.UserControls.Project.Commend, qwt" enableviewstate="false" %>
<div class="leib <%=CssName %>" id="lefttuijian">
    <h4 class="t05"><%=NSW.OConfig2.SMTP.ReName %><%=Title %></h4>
    <div class="t05_con">
	    <asp:Repeater runat="server" ID="rpt"><ItemTemplate><dl class="t05_con_dl">	                                                                 
		    <dt><a href="<%=NSW.OConfig.Common.SiteDomain%><%# Eval("PageUrl") %>" target="_blank"><img src="<%# Eval("PhotoPath") %>" alt="<%# Eval("Title") %>" /></a></dt>
		    <dd><a href="<%=NSW.OConfig.Common.SiteDomain%><%# Eval("PageUrl") %>" target="_blank"><%# Eval("Title") %></a></dd>
	    </dl></ItemTemplate></asp:Repeater>
	    <div class="clear"></div>
    </div>
</div>