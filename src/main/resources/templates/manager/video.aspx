<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.video, qwt" enableviewstate="false" enableviewstatemac="false" %>
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
			<div class="search_so f_fl">
				<input type="text" class="so_text clear_word f_fl" name="kwd" placeholder="关键词/标题/描述" />
                <input type="hidden" name="field" value="[KeyName]|[Title]|[ShortDesc]" />
				<input type="button" class="so_btn f_csp f_fl" onclick="SearchObjectByGet(this)"/>
			</div>
			<span class="advan_btn f_fl f_csp">高级</span>
		</div>
    </div>
</div>	
<div class="advan_posi design_posi form_search">
	<label class="com_name f_fl f_mr1">标题</label>
	<span class="clear_bd f_fl">
		<input class="com_input clear_word" type="text" placeholder="请输入关键词/标题/描述" name="kwd"/>
		<i class="clear_x"></i>
	</span>
    <input type="hidden" name="field" value="[KeyName]|[Title]|[ShortDesc]" />
	<label class="com_name f_fl f_mr1 f_ml2">所属分类</label>
	<span class="clear_bd fast_in s_selt1 f_fl">
        <select class="pass_faq" name="cid">
            <%=NSW.Admin.Tools.AdminTools.FillColumnData_("<option value='{id}'>{title}</option>","vw_videocolumn")%>
        </select>
		<i class="revise_sub"></i>
	</span>
	<ul class="f_fl f_cb circle_ul f_ml15">
        <span class="f_fl f_db e_radio radio" cur="z_select">
            <span class="dn"><input type="radio" checked="checked" name="enable" value="1" /></span>
            <label>显示</label>
        </span>
        <span class="f_fl f_db e_radio radio" cur="z_select">
            <span class="dn"><input type="radio"  name="enable" value="0"/></span>
            <label>隐藏</label>
        </span>
        <span class="f_fl f_db e_radio radio" cur="z_select">
            <span class="dn"><input type="radio"  name="enable" value="-1"/></span>
            <label>不限</label>
        </span>
	</ul>
	<input type="button" class="advan_so_btn f_csp f_fr" value="搜 索" onclick="SearchObjectByGet(this)" />
</div>
<div class="col_main">
    <div class="bd_main">
        <div class="bd_main_left">
            <!-- 列表区 开始 -->
            <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
                <tr id="tabHeader">
                    <th style="width:50px" class="p"><span class="cho"></span></th>
                    <th style="width:200px" axis="[Title]">标题名称</th>
                    <th style="width:100px" axis="[KeyName]">关键词</th>
                    <th style="width:100px" axis="[ShortDesc]">描述</th>        
                    <th style="width:100px" axis="[ColumnName]">所属分类</th>
                    <th style="width:100px" axis="[ShowMode]">显示模式</th>        
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
                    <td><%# Eval("KeyName") %></td>
                    <td><%# Eval("ShortDesc") %></td>       
                    <td><%# Eval("ColumnName") %></td>
                    <td><%# GetShowModeTitle( (int)Eval("ShowMode")) %></td>
                    <td class="tac"><div class="hd_input" oid="<%#Eval("ID") %>" typename="video" fileColumn="Enable">
                                <span class="p_show e_lowpoint <%#(bool)Eval("Enable")?" z_lowpoint ":""%> " cur="z_lowpoint"><input  class="hd" type="radio" <%#(bool)Eval("Enable")?"checked=\"checked\"":""%>/><label></label></span>
                            </div> </td>
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
                        <asp:LinkButton ID="lnkBtnDel" CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click"><span>删除</span></asp:LinkButton>|
                        <span class="span_add" onclick="edit(event)">新建</span>|<span class="span_refresh">刷新</span>
                    </li>
	            </ul>
	            <div class="nsw_pagination f_fr f_mr20 f_cb">
                    <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	            </div>
            </div>
        </div>
    </div>
    <RightColumn:RightColumn ID="RightColumn" runat="server" TabName="VW_VideoColumn" OrderBy="OrderID asc,ID asc" />
    <div class="clear"></div>
</div>
</form>

</body>
</html>