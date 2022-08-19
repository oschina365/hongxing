<%@ page language="C#" inherits="NSW.Web.Manager.Mune_config, qwt" enableviewstate="false" enableviewstatemac="false" %>
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
<style>
td a.td_ml1{ margin-left:5px;}
td a.td_ml2{ margin-left:10px;}
td a.td_ml3{ margin-left:20px;}
</style>
<form id="Form1" runat="server">
    <div class="so_bread">
        <div class="nsw_bread_tit f_cb">
            <SpanCurrentPosition:SpanCurrentPosition runat="server"/>
            <div class="advanced_so f_fr">
                <asp:Button Text="头部导航" runat="server" ID="btnHeader" CssClass="btn_2 fl mr10" onclick="btnHeader_Click"  OnClientClick="initMenuConfig(1)"/>
                <asp:Button Text="底部导航" runat="server" ID="btnFooter" CssClass="btn_2 fl mr10" onclick="btnFooter_Click" OnClientClick="initMenuConfig(2)"/>
            </div>
        </div>
    </div>
    <div class="dn">
        <select class="pass_faq" name="cid" style="padding-right:20px;">
            <option value="1" oid="1">头部导航</option>
            <%=NSW.Admin.Tools.AdminTools.FillColumnData("<option value=\"{oid}\" oid=\"{oid}\">{title}</option>", MuneTree01)%>
            <option value="2" oid="2">底部导航</option>
            <%=NSW.Admin.Tools.AdminTools.FillColumnData("<option value=\"{oid}\" oid=\"{oid}\">{title}</option>", MuneTree02)%>
	    </select>
    </div>
    <div class="col_main">
        <!-- 列表区 开始 -->
        <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
            <tr id="tabHeader">
                <th style="width:50px" class="p"><span class="cho"></span></th>
                <th axis="[Title]">标题</th>
                <th>副标题</th>
                <th>上级目录</th>
                <th>导航类型</th>
                <th>链接地址</th>
                <th>打开方式</th>
                <th>是否添加rel</th>
                <th axis="[OrderID]">排序</th>
                <th>样式名称</th>
                <th axis="[Enable]">可用</th>
            </tr>
            <asp:Repeater ID="rptMain" runat="server"><ItemTemplate>
            <tr class="child_1">
                <td class="td1">
                    <div class="nsw_check_box">
                        <span class="ck_box">
                            <span class="dn">
                                <input type="checkbox" name="chkItem" value="<%#Eval("OID") %>"/>
                            </span>
                        </span>
                    </div>
                </td>
                <td><a href="###" onclick="edit(event,'<%#Eval("OID") %>')" class="<%#Eval("_ClassName_") %>"><%#Eval("Title")%></a></td>
                <td><%#Eval("ReTitle")%></td>
                <td><%#GetColumnTilte(Eval("ParentID").ToString())%></td>
                <td><%#GetMenuType(Eval("MenuType").ToString())%></td>
                <td><span class="f_underline"><a href="<%#Eval("URL")%>" target="_blank"><%#Eval("URL")%></a></span></td>
                <td><%#Eval("Target")%></td>
                <td>
                    <div class="hd_input" oid="<%#Eval("OID") %>" typename="menu" fileColumn="IsRel">
                        <span class="p_show e_lowpoint <%#Eval("IsRel").ToString()=="1"?" z_lowpoint ":""%> " cur="z_lowpoint"><input  class="hd" type="radio" <%#Eval("IsRel").ToString()=="1"?"checked=\"checked\"":""%>/><label></label></span>
                    </div>
                </td>
                <td><span class="editor_warp" data-src='{"action":"alertOrder","dataType":"number","editor":"input_editor","type":"menu","oid":"<%#Eval("OID") %>"}'><%#Eval("Order")%></span></td>
                <td><%#Eval("CssName")%></td>
                <td>
                    <div class="hd_input" oid="<%#Eval("OID") %>" typename="menu" fileColumn="Enable">
                        <span class="p_show e_lowpoint <%#Eval("Enable").ToString()=="1"?" z_lowpoint ":""%> " cur="z_lowpoint"><input  class="hd" type="radio" <%#Eval("Enable").ToString()=="1"?"checked=\"checked\"":""%>/><label></label></span>
                    </div>
                </td>
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
                    <asp:LinkButton ID="LinkButton1" CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click2"><span>删除</span></asp:LinkButton>|
                    <span class="span_add" onclick="edit(event)">新建</span>|<span class="span_refresh">刷新</span>|<span class="popUp" data-src='{"popup":"BatchAddColumnPopUp","action":"BatchAddMune","title":"批量添加","type":"mune","etitle":"导航"}'>批量添加</span>
                </li>
	        </ul>
        </div>
    </div>
</form>
<script type="text/javascript">
    function initMenuConfig(type) {
        if (type == 1) {
            $.cookie("nswXpath", "{editmenu:'mune_config.aspx?tid=1',subtitle:'undefined'}");
        } else {
            $.cookie("nswXpath", "{editmenu:'mune_config.aspx?tid=2',subtitle:'undefined'}");
        }
    }
</script>
</body>
</html>