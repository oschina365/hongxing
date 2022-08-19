<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.WXKeyword, qwt" enableviewstate="true" enableviewstatemac="false" %>
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
        <SpanCurrentPosition:SpanCurrentPosition ID="cur" runat="server"/>
	    <div class="advanced_so f_fr form_search">
            <span class="clear_bd s_selt f_fl mr10 w140">
                <asp:DropDownList ID="ddlColumnID" class="pass_faq pl5" AutoPostBack="true"  runat="server" OnSelectedIndexChanged="initchange"></asp:DropDownList>
                <i class="revise_sub"></i>
            </span>
		</div>
    </div>
</div>
<div class="col_main">
    <!-- 列表区 开始 -->
    <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
        <tr id="Tr1">
            <th style="width:50px" class="p"><span class="cho"></span></th>
            <th style="width: 120px">
                关键词精灵标记
            </th>
            <th style="width: 300px" axis="[Keys]">
                关键词
            </th>
            <th style="width: 80px" axis="[KeyType]">
                回复类型
            </th>
            <th style="width: 100px" axis="[IsGlobal]">
                是否模糊查询
            </th>
            <th style="width: 300px" axis="[Content]">
                回复内容
            </th>
            <th style="width: 70px" axis="[Hits]">
                触发次数
            </th>
            <th style="width: 70px" axis="[OrderID]">
                排序
            </th>
            <th style="width: 70px" axis="[Enable]">
                状态
            </th>
            <th axis="[InputTime]" style="width: 120px">
                录入时间
            </th>
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
            <td><a href="###" onclick="edit(event,<%#Eval("ID") %>)"><%#Eval("Title")%></a></td>
            <td>
                <%#Eval("Keys")%>
            </td>
            <td class="tac">
                <%#Eval("KeyType").ToString()=="1"?"文本":"图文"%>
            </td>
            <td class="tac">
                <%#Eval("IsGlobal").ToString() == "1" ? "是" : "否"%>
            </td>
            <td style="text-align: center;">
                <%#Eval("content").ToString().IndexOf("$#$") == -1 ? Eval("content") : "图文回复"%>
            </td>
            <td class="tac">
                <%#Eval("Hits")%>
            </td>
            <td class="tac">
                <%#Eval("OrderID")%>
            </td>
            <td class="tac">
                <%#Eval("Enable")%>
            </td>
            <td class="tac">
                <%# ( (DateTime)Eval("InputTime") ).ToString("yyyy-MM-dd HH:mm")%>
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
</form>	
</body>
</html>
