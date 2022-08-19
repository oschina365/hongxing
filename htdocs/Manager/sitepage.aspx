<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.SitePages, qwt" enableviewstate="false" enableviewstatemac="false" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title><%= ItemName %></title>
<!-- hongxin.com.cn/Mobile Baidu tongji analytics -->
<script>
var _hmt = _hmt || [];
(function() {
var hm = document.createElement("script");
hm.src = "https://hm.baidu.com/hm.js?25e431cff63a206eb286efd246de5f2d";
var s = document.getElementsByTagName("script")[0];
s.parentNode.insertBefore(hm, s);
})();
</script>
</head>
<body>
<form id="Form2" runat="server">
<div class="so_bread">
    <div class="nsw_bread_tit f_cb">
        <SpanCurrentPosition:SpanCurrentPosition runat="server"/>
	    <div class="advanced_so f_fr form_search">
            <span class="clear_bd s_selt f_fl w130">
                <asp:DropDownList ID="ddlColumnID" runat="server" class="pass_faq w140 pl5"></asp:DropDownList>
                <i class="revise_sub"></i>
            </span>
            <div class="search_so f_fl ml10 mr10">
				<input type="text" class="so_text clear_word f_fl" name="kwd"  />
				<input type="button" class="so_btn f_csp f_fl" onclick="SearchObjectByGet(this)" />
			</div>
		</div>
        <div class="clear"></div>
    </div>
</div>
<div class="col_main">
    <!-- 列表区 开始 -->
    <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
        <tr id="tabHeader">
            <th style="width:50px" class="p"><span class="cho"></span></th>
            <%--<th style="width:50px">序号</th>--%>
            <th axis="[Title]">静态网页标题名称</th>
            <th axis="[ColumnName]">所属分类</th>
            <th axis="[PageUrl]">网页地址</th>
            <th axis="[ShortDesc]">简短描述</th>
            <th style="width:120px" axis="[InputTime]">录入时间</th>
        </tr>
        <asp:Repeater ID="rptMain" runat="server"><ItemTemplate>
        <tr class="child_1">
            <td class="td1">
                <div class="nsw_check_box">
                    <span class="ck_box">
                        <span class="dn">
                            <input type="checkbox" name="chkItem" value="<%#Eval("ID") %>"/>
                        </span>
                    </span>
                </div>
            </td>
            <%--<td class="tac"><%#Container.ItemIndex + 1 + PageSize * (PageIndex - 1)%> </td>--%>
            <td><a href="###" onclick="edit(event,<%#Eval("ID") %>)" tips="Title：<%#NSW.Web.API.SysCommon.IsNullOrEmpty(Eval("PageTitle").ToString().Replace("\"",""),"无") %><br/><br/>KeyWord：<%#NSW.Web.API.SysCommon.IsNullOrEmpty(Eval("PageKeyword").ToString().Replace("\"",""),"无") %><br/><br/>Description：<%#NSW.Web.API.SysCommon.IsNullOrEmpty(Eval("PageDescription").ToString().Replace("\"",""),"无") %>"><%#Eval("Title")%></a></td>
            <td><%# Eval("ColumnName") %></td>
            <td><%#Eval("PageURL")%></td>
            <td class="tac"><%#Eval("ShortDesc")%></td>
            <td><%# ((DateTime)Eval("InputTime")).ToString("yyyy-MM-dd HH:mm") %></td>
        </tr>
        </ItemTemplate></asp:Repeater>
        <tr id="noItemYet" runat="server" visible="false"><td class="noItemYet" style=" text-align:center;" colspan="99">没有任何项目</td></tr>
    </table>
    <!-- 列表分页 开始 -->
    <div class="nsw_tools_bar f_cb">
	    <ul class="nsw_check_btns f_fl">
		    <li class="f_ml20">
                <span class="sele_all"><input type="radio" class="dn" /><em class="e_word"></em>全选</span>|
                <span class="sele_inverse">反选</span>
            </li>
		    <li class="f_ml20 list">
                <asp:LinkButton ID="LinkButton1" CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click"><span>删除</span></asp:LinkButton>|
                <span class="span_add" onclick="edit(event)">新建</span>|<span class="span_refresh">刷新</span>
            </li>
	    </ul>
        <div class="batch_act f_fl f_ml20">
            <span class="c_act ">更多操作<i class="tri_up f_fr"></i></span>
		    <ul class="batch_dropup">
                <li><a target="frmEditor" href="sitepage_column.aspx">SEO分类列表</a></li>
                <li><a target="frmEditor" href="sitepage_column_edit.aspx">SEO分类录入</a></li>
		    </ul>
	    </div>
	    <div class="nsw_pagination f_fr f_mr20 f_cb">
            <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	    </div>
    </div>
</div>
</form>	
    <script type="text/javascript">
     loadCss("skins/easyui/easyui.css");
     loadJs("js/easyui/jquery.easyui.min.js", function () { 
//        AddScript("easyui.min.js", "js/easyui/jquery.easyui.min.js");
//        AddStyle("easyui.css", "skins/easyui/easyui.css");
        $("[tips]").each(function () {
            var me = $(this);
            me.tooltip({
            position: 'top',
            content: me.attr("tips")||"",
            onShow: function () {
//                $(this).tooltip('tip').css({
//                    backgroundColor: '#666',
//                    borderColor: '#666'
//                });
            }
        });
    });
});
    </script>
</body>
</html>