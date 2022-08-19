﻿<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.WXMenu_config, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
        <div class="clear"></div>
    </div>
</div>
<div class="tips" style=" margin:5px;">
    <h2>提示</h2>
    <ul><li class="fRed">目前自定义菜单最多包括3个一级菜单，每个一级菜单最多包含5个二级菜单。一级菜单最多5个汉字，二级菜单最多7个汉字，多出来的部分将会以“...”代替。请注意，创建自定义菜单后，由于微信客户端缓存，需要24小时微信客户端才会展现出来。建议测试时可以尝试取消关注公众账号后再次关注，则可以看到创建后的效果。<br /></li></ul>
</div>
<div class="col_main">
    <!-- 列表区 开始 -->
    <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <th style="width:50px" class="p"><span class="cho"></span></th>
            <th axis="[Title]">
                标题
            </th>
            <th>
                上级菜单
            </th>
            <th>
                菜单类型
            </th>

            <th>
                链接地址[View]
            </th>
            <th>
                菜单Key值[Click]
            </th>
            <th axis="[Count]">
                点击数【占比】
            </th>
            <th axis="[Order]">
                排序
            </th>
            <th style="display: none;">
                菜单图标
            </th>
            <th axis="[Enable]">
                可用
            </th>
        </tr>
        <asp:Repeater ID="rptMain" runat="server" OnItemDataBound="rptContent_ItemDataBound"><ItemTemplate>
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
            <td>
                <a href="###" onclick="edit(event,'<%#Eval("ID") %>')"><%#Eval("Title")%></a>
            </td>
            <td>
                <%#GetColumnTilte(Eval("PID").ToString())%>
            </td>
            <td>
                <%#GetMenuType(Eval("Type").ToString())%>
            </td>
            <td>
                <%#Eval("URL")%>
            </td>
            <td>
                <%#Eval("Key")%>
            </td>
            <td>
                <%#GetCount(Eval("Count").ToString())%>
            </td>
            <td onclick="alterOrder(this,'<%# Eval("ID") %>','menu')">
                <%#Eval( "Order")%>
            </td>
            <td style="display: none;">
                <%#Eval("PictureURL")%>
            </td>
            <td class="tac"><div class="set_radios" oid="<%#Eval("ID") %>" fileColumn="Enable" typename=""><span><input type="radio" <%#Eval("Enable").ToString()=="1"?"checked=\"checked\"":""%>/><label></label></span></div></td>
        </tr>
        <asp:Repeater runat="server">
            <ItemTemplate>
                <tr>
                    <td class="td1">
                        <div class="nsw_check_box">
                            <span class="ck_box">
                                <span class="dn">
                                    <input type="checkbox" name="chkItem" value="<%#Eval("ID") %>"/>
                                </span>
                            </span>
                        </div>
                    </td>
                    <td>
                        <a href="###" onclick="edit(event,'<%#Eval("ID") %>')" style=" text-indent:20px; display:inline-block;"><%#Eval("Title")%></a>
                    </td>
                    <td>
                        <%#GetColumnTilte(Eval("PID").ToString())%>
                    </td>
                    <td>
                        <%#GetMenuType(Eval("Type").ToString())%>
                    </td>
                    <td>
                        <%#Eval("URL")%>
                    </td>
                    <td>
                        <%#Eval("Key")%>
                    </td>
                    <td>
                        <%#GetCount(Eval("Count").ToString())%>
                    </td>
                    <td onclick="alterOrder(this,'<%# Eval("ID") %>','menu')">
                        <%#Eval( "Order")%>
                    </td>
                    <td style="display: none;">
                        <%#Eval("PictureURL")%>
                    </td>
                    <td class="tac"><div class="set_radios" oid="<%#Eval("ID") %>" fileColumn="Enable" typename=""><span><input type="radio" <%#Eval("Enable").ToString()=="1"?"checked=\"checked\"":""%>/><label></label></span></div></td>
                </tr>
            </ItemTemplate></asp:Repeater>
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
                <asp:LinkButton ID="del" CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click2"><span>删除</span></asp:LinkButton>|
                <asp:LinkButton ID="update" runat="server" onclick="btnHeader_Click"><span>更新菜单</span></asp:LinkButton>|
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
