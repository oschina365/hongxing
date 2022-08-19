<%@ control language="C#" autoeventwireup="true" inherits="NSW.Web.UserControls.Job.Columns, qwt" enableviewstate="false" %>
<div class="left">
    <div class="leib2">
        <div class="tit">
            企业招聘</div>
        <div class="nr">
            <asp:Repeater runat="server" ID="rpt">
                <HeaderTemplate>
                    <ul>
                </HeaderTemplate>
                <FooterTemplate>
                    </ul></FooterTemplate>
                <ItemTemplate>
                    <li>
                        <a href="<%=NSW.OConfig.Common.SiteDomain %><%# Eval("Url") %>" title="<%# Eval("Title") %>">
                            <%# Eval("Title") %></a></li>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <%=NSW.OConfig2.SMTP.leftLx %>
</div>
