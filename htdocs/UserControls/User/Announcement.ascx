<%@ control language="C#" autoeventwireup="true" inherits="NSW.Web.UserControls.User.Announcement, qwt" enableviewstate="false" %>
<h4 class="t07"><a href="Announcement.aspx">会员公告</a></h4>
<div class="u_idx_news">
	<ul class="idx_ul">
		<asp:Repeater runat="server" ID="rpt"><ItemTemplate><li><span class="first"><a target="_blank" href="announcement.aspx#nsw_id_<%# Eval("ID") %>" title="<%# Eval("Title") %>"><%# Eval("Title") %></a></span><span class="last"><%# ((DateTime)Eval("ShowTime")).ToString("yyyy-MM-dd") %></span></li></ItemTemplate></asp:Repeater>
		<li runat="server" id="nodata" visible="false">暂无公告</li>
	</ul>
	<div class="ad_0"><%= NSW.BLL.Site.GetAdCodeByKeyName("user_index") %></div>
	<div class="clear"></div>
</div>