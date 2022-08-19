<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.friend_links, qwt" enableviewstate="false" enableviewstatemac="false" %>
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
<form id="Form1" runat="server">
<div class="so_bread">
    <div class="nsw_bread_tit f_cb">
        <SpanCurrentPosition:SpanCurrentPosition ID="cur" runat="server"/>
	    <div class="advanced_so f_fr form_search">
			<div class="search_so f_fl mr10">
				<input type="text" class="so_text clear_word f_fl" name="kwd" />
				<input type="button" class="so_btn f_csp f_fl" onclick="SearchObjectByGet(this)" />
			</div>
		</div>
    </div>
</div>

<div class="col_main">
    <div class="bd_main">
        <div class="bd_main_left">
            <!-- 列表区 开始 -->
            <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
                <tr id="tabHeader">
                    <th style="width:50px" class="p"><span class="cho"></span></th>
                    <%--<th style="width:50px">序号</th>
                    <th style="width:50px">ID</th>--%>
                    <th style="width:150px" axis="[Title]">标题名称</th>
                    <th axis="[Title]">超链接</th>
                    <%--<th style="width:100px"  axis="[ColumnName]">所属分类</th>--%>
                    <th style="width:50px" axis="[OrderID]">排序</th>
                    <th style="width:50px" axis="[Enable]">可用</th>
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
                    <%--<td class="tac"><%#Container.ItemIndex + 1 + PageSize * (PageIndex - 1)%> </td>
                    <td class="tac"><%#Eval( "ID")%></td>--%>
                    <td><a href="###" onclick="edit(event,<%#Eval("ID") %>)"><%#Eval("Title")%></a></td>
                    <td><%# Eval("URL") %></td>
                    <%--<td><%# Eval("ColumnName") %></td>--%>
                    <td><span class="editor_warp" data-src='{"action":"alertOrder","dataType":"number","editor":"input_editor","oid":"<%#Eval("ID") %>"}'><%#Eval("OrderID") %></span></td>
                    <td class="tac">
                        <div class="hd_input" oid="<%#Eval("ID") %>" typename="firendlink" fileColumn="Enable">
                                <span class="p_show e_lowpoint <%#(bool)Eval("Enable")?" z_lowpoint ":""%> " cur="z_lowpoint"><input  class="hd" type="radio" <%#(bool)Eval("Enable")?"checked=\"checked\"":""%>/><label></label></span>
                            </div></td>
                    <td><%# ((DateTime)Eval("InputTime")).ToString("yyyy-MM-dd<br />HH:mm:ss") %></td>
                </tr>
                </ItemTemplate></asp:Repeater>
                <tr id="noItemYet" runat="server" visible="false"><td class="noItemYet" style="text-align:center;" colspan="99">没有任何项目</td></tr>
            </table>
            <!-- 列表分页 开始 -->
            <div class="nsw_tools_bar f_cb">
	            <ul class="nsw_check_btns f_fl">
		            <li class="f_ml20">
                        <span class="sele_all"><input type="radio" class="dn" /><em class="e_word"></em>全选</span>|
                        <span class="sele_inverse">反选</span>
                    </li>
		            <li class="f_ml20">
                        <asp:LinkButton ID="LinkButton1" CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click"><span>删除</span></asp:LinkButton>|
                        <span class="span_add" onclick="edit(event)">新建</span>|<span class="span_refresh">刷新</span>
                    </li>
	            </ul>
	            <div class="nsw_pagination f_fr f_mr20 f_cb">
                    <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	            </div>
            </div>
            <!-- 列表分页 结束 -->
        </div>
    </div>
    <RightColumn:RightColumn ID="RightColumn" runat="server" TabName="VW_FriendLinkColumn" OrderBy="OrderID asc,ID asc" />
    <div class="clear"></div>
</div>
</form>
</body>
</html>