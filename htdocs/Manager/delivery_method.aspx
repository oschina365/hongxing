<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.delivery_method, qwt" enableviewstate="false" enableviewstatemac="false" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>后台菜单列表</title>
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
        <SpanCurrentPosition:SpanCurrentPosition ID="SpanCurrentPosition1" runat="server"/>
	    <div class="advanced_so f_fr form_search">
            <span class="clear_bd s_selt f_fl mr10 w130">
                <select id="Select1" class="pass_faq pl5">
                    <option value="[Title]">名 称</option>
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
    <form id="Form2" runat="server">
        <!-- 列表区 开始 -->
        <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
            <tr id="tabHeader">
                <th style="width:50px" class="p"><span class="cho"></span></th>
                <th style="width:250px" axis="[Title]">名称</th>
                <th axis="[Price]" style="width:50px">运费</th>
                <th style="width:50px">图标</th>
                <th style="width:100px">简要说明</th>
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
                <td><a href="###" onclick="edit(event,<%#Eval("ID") %>)"><%#Eval("Title")%></a></td>
                <td><%# ((decimal)Eval("Price")).ToString("f2") %> 元</td>
                <td class="tac"><img src='<%# Eval("PhotoPath") %>' alt="<%# Eval("PhotoName") %>" /></td>
                <td><%# Eval("ShortDesc") %></td>
                <td class="tac"><%#Eval( "OrderID")%></td>
                <td>
                    <div class="hd_input">
                        <span class="p_show e_lowpoint <%#(bool)Eval("Enable")?" z_lowpoint ":""%> " cur="z_lowpoint"><input  class="hd" type="radio" <%#(bool)Eval("Enable")?"checked=\"checked\"":""%>/><label></label></span>
                    </div>
                </td>
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
		        <li class="f_ml20">
                    <asp:LinkButton ID="LinkButton1" CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click"><span>删除</span></asp:LinkButton>|
                    <span class="span_refresh">刷新</span>
                </li>
	        </ul>
	        <div class="nsw_pagination f_fr f_mr20 f_cb">
                <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	        </div>
        </div>
        <!-- 列表分页 结束 -->
    </form>	
</div>

<%--<div id="body"><form id="form1" runat="server">
<div id="itemList">
<div class="loc"><div class="groupmenu" id="groupmenu"></div><a href="admin_welcome.aspx">后台首页</a> &raquo; <%= ItemName %></div>
<div class="tools">
    <ul>
        <li><a href="javascript:gotoListHome()"><img src="Skins/Blue/Img/i.p.recur.gif" alt="IMG" />刷新</a></li>
        <li><a href="###" onclick="newObject(event)"><img src="Skins/Blue/Img/i.p.writenew.gif" alt="IMG" />新建</a></li>
        <li><asp:LinkButton ID="lnkBtnDisable" CommandName="enable" runat="server" OnClientClick="if(sltedItemCnt<1){alert('未有选中项');return false;}if(confirm('确定启用选中项（共'+sltedItemCnt+'项）？')){loading();return true;}else return false;" onclick="LinkButton_Click"><img src="Skins/Blue/Img/enable.gif" alt="IMG" />启用</asp:LinkButton></li>
        <li><asp:LinkButton ID="lnkBtnEnable" CommandName="disable" runat="server" OnClientClick="if(sltedItemCnt<1){alert('未有选中项');return false;}if(confirm('确定禁用选中项（共'+sltedItemCnt+'项）？')){loading();return true;}else return false;" onclick="LinkButton_Click"><img src="Skins/Blue/Img/disable.gif" alt="IMG" />禁用</asp:LinkButton></li>
        <li><asp:LinkButton ID="lnkBtnDel" CommandName="del" runat="server" OnClientClick="if(sltedItemCnt<1){alert('未有选中项');return false;}if(confirm('确定删除选中项（共'+sltedItemCnt+'项）？')){loading();return true;}else return false;" onclick="LinkButton_Click"><img src="Skins/Blue/Img/i.p.trash.gif" alt="IMG" />删除</asp:LinkButton></li>
        <li><a href="javascript:void(0)" onclick="javascript:window.open('Inc/PrintingView.htm?container=PrintContent')"><img src="Skins/Blue/Img/i_print.gif" alt="IMG" />打印</a></li>
        <li><a href="javascript:Cancle()"><img src="Skins/Blue/Img/i.p.block.gif" alt="IMG" />取消</a></li>
    </ul>
    <div style="float:right" class="search"><asp:TextBox ID="txtKwd" runat="server" CssClass="txt"></asp:TextBox> <select id="ddlFields">
        
        <option value="[Title]">名称</option>
    </select> <a href="javascript:osearch()" class="btn_search">搜索</a></div>
</div>
<div class="headPageNavi"><div style="float:left">选择：<a href="javascript:checkAll(true)">全部</a> <a href="javascript:checkAll(false)">无</a> <a href="javascript:invertSelect('itemListTab','chkAll')">反选</a></div><div style="float:right" class="pageNavi" id="pagerTop"></div></div>
<div id="PrintContent" class="mainCon">
<table class="mainTab" id="itemListTab">
    <tr id="tabHeader">
        <th style="width:50px" class="p" onclick="$('input[name=chkAll]').click()"><input name="chkAll" type="checkbox" onclick="checkAll(this.checked);event.cancelBubble=true;" value="checkbox" /></th><th style="width:50px">ID</th>
        <th style="width:250px" axis="[Title]">名称</th>
        <th axis="[Price]">运费</th>
        <th>图标</th>
        <th>简要说明</th>
        <th style="width:50px" axis="[OrderID]">排序</th>
        <th style="width:50px" axis="[Enable]">可用</th>
        <th style="width:120px" axis="[InputTime]">录入时间</th>
    </tr>
    <asp:Repeater ID="rptMain" runat="server"><ItemTemplate>
    <tr>
        <td class="tac"><input name="chkItem" type="checkbox" value="<%#Eval("ID") %>" onclick="itemCheckbox_changed();event.cancelBubble=true" /></td><td><%#Eval( "ID")%></td>
        <td><a href="###" onclick="edit(event,<%#Eval("ID") %>)"><%#Eval("Title")%></a></td>
        <td><%# ((decimal)Eval("Price")).ToString("f2") %> 元</td>
        <td class="tac"><img src='<%# Eval("PhotoPath") %>' alt="<%# Eval("PhotoName") %>" /></td>
        <td><%# Eval("ShortDesc") %></td>
        <td class="tac"><%#Eval( "OrderID")%></td>
        <td class="tac"><img src='Skins/Blue/Img/<%# (bool)Eval("Enable") ? "enable.gif' alt='可用'":"disable.gif' alt='禁用'" %> /></td>
        <td><%# ((DateTime)Eval("InputTime")).ToString("yyyy-MM-dd HH:mm") %></td>
    </tr></ItemTemplate></asp:Repeater>
    <tr id="noItemYet" runat="server" visible="false"><td class="noItemYet" colspan="99">没有任何项目</td></tr>
</table>
</div>
<div class="headPageNavi"><div style="float:left">选择：<a href="javascript:checkAll(true)">全部</a> <a href="javascript:checkAll(false)">无</a> <a href="javascript:invertSelect('itemListTab','chkAll')">反选</a></div><div style="float:right" class="pageNavi" id="pagerBtm"><IndexNavi:IndexNavigator runat="server" ID="pagerMain" /></div></div>
</div>
</form></div>--%>
</body></html>