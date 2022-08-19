<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Search.Search_Index, qwt" enableviewstate="false" enableviewstatemac="false" %>
<script type="text/C#" runat="server">
protected override void SearchProduct()
{
    PageSize = NSW.OConfig.GlobalConfig.SearchingPageSizeDefault;
    SqlOrder = NVTools.Tools.GetNotNull(NVTools.NTools.GetOther("orderby", TempPath,string.Empty), "[OType] ASC,[ShowTime] DESC, [OrderID] ASC ");
    ShowedFields = "*";
    string SelSID = Request.QueryString["SelSID"];
    string SelValue = Request.QueryString["SelValue"];
    TableName = "[VW_All]";

    if (!string.IsNullOrEmpty(SqlKeyword.Trim()))
    {
        if (!string.IsNullOrEmpty(SelSID))
        {
            SqlWhere = string.Format("OType=1 and sid like '%{1}%' and ( title like '%{0}%' or ShortDesc like '%{0}%')", SqlKeyword, SelSID);
        }
        else
        {
            SqlWhere = string.Format("(OType=1 or (OType=3 and sid like '0001,0012%' )) and (title like '%{0}%' or ShortDesc like '%{0}%')", SqlKeyword);
        }
    }
    else
    {
        if (!string.IsNullOrEmpty(SelSID))
        {
            SqlWhere = string.Format("OType=1 and sid like '%{0}%'", SelSID);
        }
        else
        {
            SqlWhere = string.Format("OType=1 or (OType=3 and  sid like '0001,0012%')");
        }
    }
    
    PK = "OID";
    DT = QueryTable();
    if (DT.Rows.Count > 0) {
        Hightlight();
    }

    context.Put("rows", DT.Rows);
    context.Put("pagesize", PageSize);
    if (!string.IsNullOrEmpty(SelSID))
    {
        context.Put("pageSplit", new NVEngine.Tools.PageSplit(RecordCountVariable, PageSize, PageIndex, "/search/?kwd=" + Context.Server.UrlEncode(SqlKeyword) + "&SelSID=" + SelSID + "&SelValue=" + SelValue + "&page={0}"));
    }
    else
    {
        context.Put("pageSplit", new NVEngine.Tools.PageSplit(RecordCountVariable, PageSize, PageIndex, "/search/?kwd=" + Context.Server.UrlEncode(SqlKeyword) + "&page={0}"));
    }

    BindRelevantSerach();
}
</script>
