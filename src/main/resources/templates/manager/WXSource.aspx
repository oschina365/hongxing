<%@ page language="C#" autoeventwireup="True" enableeventvalidation="false" inherits="NSW.Web.Manager.WXSource, qwt" enableviewstate="true" enableviewstatemac="false" %>

<%@ Register Src="Inc/uc/XuanZe.ascx" TagName="XuanZe" TagPrefix="XuanZe" %>
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
<form id="form1" runat="server" onsubmit="top.refreshList=true">
    <div class="so_bread">
        <div class="nsw_bread_tit f_cb">
            <SpanCurrentPosition:SpanCurrentPosition ID="cur" runat="server"/>
            <div class="advanced_so f_fr form_search">
                <span class="clear_bd s_selt f_fl mr10 w140">
                    <asp:DropDownList ID="ddlColumnID" class="pass_faq pl5" AutoPostBack="true" runat="server" OnSelectedIndexChanged="initchange">
                        <asp:ListItem Text="图文消息素材" Value="mpnews" />
                        <asp:ListItem Text="图片文件素材" Value="image" />
                    </asp:DropDownList>
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
                <th >
                    素材名
                </th>
                <th>
                    预览
                </th>
                <th>
                    录入时间
                </th>
                <th>
                    过期时间
                </th>
                <th axis="[Enable]">
                    是否过期
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
                <td>
                    <a href="javascript:;" data-click="edit(event,'<%#Eval("ID") %>')">
                        <%#Eval("Title")%></a>
                </td>
                <td>
                    <%# GetMsg(Eval("mediaType").ToString(), Eval("id").ToString() , Eval("Content").ToString()) %>
                </td>
                <td>
                    <%#Eval("inputtime")%>
                </td>
                <td>
                    <%#Eval("OverdueTime")%>
                </td>
                <td>
                    <img  src='Skins/Blue/css/<%# Convert.ToDateTime(Eval("OverdueTime").ToString())>DateTime.Now ? "enable.gif' alt='可用'":"disable.gif' alt='禁用'" %>' />
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
                    <asp:LinkButton ID="LinkButton1" CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click2"><span>删除</span></asp:LinkButton>|
                    <span class="span_refresh">刷新</span>
                </li>
	        </ul>
	        <div class="nsw_pagination f_fr f_mr20 f_cb">
                <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	        </div>
        </div>
        <!-- 列表分页 结束 -->
    </div>

    <div id="newsTemp" runat="server" visible="false">
        <dl class="{$class$}">
            <dt><a href="{$PageUrl$}" title="{$Title$}"><img src="{$Img$}" title="{$Title$}" alt="{$Title$}"/></a></dt>
            <dd>{$Title$}</dd>
        </dl>
    </div>
    <div id="newTemp" runat="server" visible="false">
        <dl class="onepicbox">
            <dt class="newstitle">{$Title$}</dt>
            <dt><a href="{$PageUrl$}" title="{$Title$}"><img src="{$Img$}" title="{$Title$}" alt="{$Title$}"/></a></dt>
            <dd>{$ShortDesc$}</dd>
        </dl>
    </div>
</form>
</body>
</html>
