<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.download_column, qwt" enableviewstate="false" enableviewstatemac="false" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>下载分类管理</title>
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
<div class="so_bread">
    <div class="nsw_bread_tit f_cb">
        <SpanCurrentPosition:SpanCurrentPosition ID="cur" runat="server"/>
	    <div class="advanced_so f_fr form_search">
            <span class="clear_bd s_selt f_fl mr10 w140">
                <select id="ddlFields" class="pass_faq pl5">
                    <option value="[Title]">标题名称</option>
                </select>
                <i class="revise_sub"></i>
            </span>
			<div class="search_so f_fl mr10">
				<input type="text" class="so_text clear_word f_fl" name="kwd" />
				<input type="button" class="so_btn f_csp f_fl" onclick="SearchObjectByGet(this)" />
			</div>
		</div>
    </div>
</div>
<div class="col_main">
    <form id="Form1" runat="server">
    <!-- 列表区 开始 -->
    <table class="nsw_pro_list grouping" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
        <tr id="tabHeader">
            <th style="width:50px" class="p"><span class="cho"></span></th>
            <th style="width:50px">ID</th>
            <!--表头-->
            <th style="width:250px">名称</th>
            <th>简短描述</th>
            <th style="width:50px" axis="[PostSum]">数量</th>
            <!--end 表头-->
            <th style="width:50px">排序</th>
            <th style="width:50px">可用</th>
            <th style="width:120px">录入时间</th>
            <th style="width:60px" >操作</th>
        </tr>
        <asp:Repeater ID="rptMain" runat="server"><ItemTemplate>
        <tr class="child_1 <%#Eval("ID").ToString().Equals("1")?" dn":"" %>" oid="<%#Eval("ID") %>" parentid="<%#Eval("ParentID") %>">
            <td class="td1">
                <div class="nsw_check_box">
                    <span class="ck_box">
                        <span class="dn">
                            <input type="checkbox" name="chkItem" value="<%#Eval("ID") %>"/>
                        </span>
                    </span>
                </div>
            </td>
            <td class="tac"><%#Eval( "ID")%></td>
            <td  class="rname"><a href="###" onclick="edit(event,<%#Eval("ID") %>)"><%#Eval("ReName")%></a></td>
            <td><%#Eval( "ShortDesc")%></td>
            <td class="tac"><%#Eval("PostSum")%></td>
            <td class="tac"><%#Eval( "OrderID")%></td>
            <td class="tac"><div class="hd_input" oid="<%#Eval("ID") %>" typename="" fileColumn="Enable"><span class="p_show e_lowpoint <%#(bool)Eval("Enable")?" z_lowpoint ":""%> " cur="z_lowpoint"><input  class="hd" type="radio" <%#(bool)Eval("Enable")?"checked=\"checked\"":""%>/><label></label></span></div></td>
            <td><%# ((DateTime)Eval("InputTime")).ToString("yyyy-MM-dd<br />HH:mm:ss") %></td>
            <td class="nsw_cnt_area action_tx <%#Eval("ID").ToString()=="1"?" f_noinfo":"" %>">
                <a href='<%#MyTool.GetColumnURL(Container,NSW.Web.API.ColumnType.Help) %>' title='<%#Eval("Title") %>' target='_blank'><span class="pro_view"><i></i>预览</span></a>
                <a href="##" onclick="<%#Eval("ID").ToString()=="1"?" ":"edit(event,"+Eval("ID")+",'action=copy')" %>"><span class="pro_copy"><i></i>复制</span></a>
                <span class="pro_dele editor_warp" data-src='{"action":"delete","editor":"delete_editor","type":"downloadcolumn","oid":"<%#Eval("ID") %>"}'><i></i>删除</span>
            </td>
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
		    <li class="f_ml20 column">
                <asp:LinkButton ID="LinkButton1" CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click"><span>删除</span></asp:LinkButton>|
                <span class="span_add" onclick="edit(event)">新建</span>|<span class="span_refresh">刷新</span>
            </li>
	    </ul>
	    <div class="nsw_pagination f_fr f_mr20 f_cb">
            <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	    </div>
    </div>
    </form>
    <!-- 列表分页 结束 -->
</div>
</body>
</html>