<%@ control language="C#" autoeventwireup="true" inherits="NSW.Web.UserControls.Project.UserControls_Project_Columns, qwt" enableviewstate="false" %>
<div class="leib2">
    <div class="tit">
        <%= NSW.OConfig2.SMTP.ProjectCateInfo %></div>
    <div class="nr">
        <%=MyTool.GetProductProjectColumnHtml(NSW.Web.API.ColumnType.Project,SID) %>
    </div>
</div>
<script type="text/javascript">
    productSelectCurrentPosition("<%= SID %>");
</script>
