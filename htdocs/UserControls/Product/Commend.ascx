<%@ control language="C#" autoeventwireup="true" inherits="NSW.Web.UserControls.Product.Commend, qwt" enableviewstate="false" %>
<div class="leib<%=CssName %>" id="lefttuijian">
    <div class="tit"><%=NSW.OConfig2.SMTP.ReName %><%=Title %></div>
    <div class="t05_con">
        <asp:Repeater runat="server" ID="rpt">
            <ItemTemplate>
                <dl class="pd_t05_con_dl">
                    <dt><a href="<%=NSW.OConfig.Common.SiteDomain %><%# Eval("PageUrl") %>" target="_blank" title="<%# Eval("Title") %>"><img src="<%=NSW.OConfig.Common.SiteDomain %><%# Eval("PhotoPath") %>" alt="<%# Eval("Title") %>" title="<%# Eval("Title") %>" /></a></dt>
                    <dd><a href="<%# Eval("PageUrl") %>" target="_blank" title="<%# Eval("Title") %>"><%# Eval("Title") %></a></dd>
                </dl>
            </ItemTemplate>
        </asp:Repeater>
        <div class="clear"></div>
    </div>
    <div class="leftbot1"></div>
</div>
