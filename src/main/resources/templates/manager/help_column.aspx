<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.help_columns, qwt" enableviewstate="false" enableviewstatemac="false" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title><%= ItemName %></title>
<link href="skins/base/news.css" rel="stylesheet" type="text/css">
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
<body class="column_list">
<div class="so_bread">
    <div class="nsw_bread_tit f_cb">
        <SpanCurrentPosition:SpanCurrentPosition runat="server" />
		<div class="advanced_so f_fr form_search">
			<div class="search_so f_fl">
				<input type="text" class="so_text clear_word f_fl" name="kwd" />
				<input type="hidden" name="field" value="[Title]|[ShortDesc]" />
                <input type="button" class="so_btn f_csp f_fl" onclick="SearchObjectByGet(this)"/>
			</div>
			<span class="advan_btn f_fl f_csp">高级</span>	
		</div>
	</div>
	<div class="advan_posi design_posi form_search">
		<label class="com_name f_fl f_mr1">标题名称</label>
		<span class="clear_bd f_fl">
		    <input class="com_input clear_word" type="text" placeholder="请填写分类名称" name="kwd"/>
		    <i class="clear_x"></i>
		</span>
		<label class="com_name f_fl f_mr1 f_ml2">所属分类</label>
		<span class="clear_bd fast_in s_selt1 f_fl">
            <select class="pass_faq" name="cid">
                <%=NSW.Admin.Tools.AdminTools.FillColumnData("<option value='{sid}' oid='{id}'>{title}</option>", NSW.Web.API.ColumnType.Help.ToString())%>
            </select>
			<i class="revise_sub"></i>
		</span>
		<ul class="f_fl f_cb square_ul f_ml15">
            <li class="f_mr10">
                <div class="nsw_check_box">
                    <span class="ck_box mt5">
                        <input type="checkbox" class="dn" name="iscommend" value="1"/>
                    </span>
                    <label class="ck_text">推荐</label>
                </div>
            </li>
			<li class="f_mr10">
                <div class="nsw_check_box">
                    <span class="ck_box mt5">
                        <input type="checkbox" class="dn" name="istop" value="1"/>
                    </span>
                    <label class="ck_text">置顶</label>
                </div>
            </li>
			<li class="f_mr10">
                <div class="nsw_check_box">
                    <span class="ck_box mt5">
                        <input type="checkbox" class="dn" name="isbest" value="1"/>
                    </span>
                    <label class="ck_text">精华</label>
                </div>
            </li>
		</ul>
		<ul class="f_fl f_cb circle_ul">
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
</div>

<!-- 快速录入 开始 -->
<div class="nsw_add_proclsify f_cb" style="padding-left:2%;">
    <form onsubmit="return false;"><label class="com_name f_fl" style="margin-right:1%;">所属分类</label>
	<span class="clear_bd fast_in f_fl">
		<select class="pass_faq" name="cid">
			<%=NSW.Admin.Tools.AdminTools.FillColumnData("<option value='{id}'>{title}</option>", NSW.Web.API.ColumnType.Help.ToString())%>
		</select>
		<i class="revise_sub"></i>
	</span>
	<label class="com_name f_ml10 f_fl">分类标题</label>
	<span class="clear_bd th1 f_fl"><input class="com_input clear_word" name="columns" type="text" maxLength="140" _required="true" tips="分类标题" placeholder="请填写分类名称"><i class="clear_x"></i></span>
    <span class="e_btn1 f_ml2 f_csp f_fl f_mr5 ajaxSave" data-src='{"action":"BatchAddColumn"}'><i class="save_icon"></i>保 存</span>
	<span class="role_addbtn f_ml2 f_csp f_fl popUp" data-src='{"popup":"BatchAddColumnPopUp","action":"BatchAddColumn","title":"批量添加帮助分类","type":"helpcolumn"}'>添加</span>
    <input type="hidden" name="typename" value="helpcolumn" /><input type="hidden" name="mode" value="single" /></form>
</div>
<!-- 快速录入 结束 -->

<div class="col_main">
    <form runat="server">
        <!-- 列表区 开始 -->
        <table class="nsw_pro_list grouping" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
            <tr id="tabHeader">
                <th style="width:50px" class="p"><span class="cho"></span></th>
                <th style="width:30px">ID</th>
                <th axis="[Title]" style=" width:200px;">帮助分类</th>  
                <th style="width:50px" axis="[isCommend]">推荐</th>     
                <th style="width:50px" axis="[isTop]">置顶</th>
                <th style="width:50px" axis="[isBest]">精华</th>
                <th style="width:50px" axis="[Enable]">可用</th>
                <th style="width:50px" axis="[Enable]">数量</th>
                <th style="width:50px" axis="[OrderID]">排序</th>
                <th style="width:50px" axis="[ShowType]">显示方式</th>
                <th style="width:120px" axis="[InputTime]" class="tcenter">录入时间</th>
                <th style="width:60px" >操作</th>
                <% if (NSW.Mobile.MobileConfig.MEnableMobile == "true"){ %>
                <th style="width:60px;">手机操作</th>
                <% } %>
            </tr>
            <asp:Repeater ID="rptMain" runat="server"><ItemTemplate>
            <tr class="child_1 <%#Eval("ID").ToString().Equals("1")?" dn":"" %>" oid="<%#Eval("ID") %>" parentid="<%#Eval("ParentID") %>">
                <td class="td1">
                    <%#Eval("ID").ToString() == "1" ? "" : "<div class=\"nsw_check_box\"><span class=\"ck_box\"><span class=\"dn\"><input type=\"checkbox\" name=\"chkItem\" value=\"" + Eval("ID") + "\"/></span></span></div>"%>
                </td>
                <td><%#Eval("ID") %></td>
                <td class="rname">
                    <span class="short_tit f_fl">
                        <%--<i class="tir4"></i>--%>
                        <a href="##" onclick="<%#Eval("ID").ToString()=="1"?" ":"edit(event,"+Eval("ID")+")" %>"><%#Eval("ReName")%></a>
                        <%--<i class="e_edi1 e_more_edit" onclick="<%#Eval("ID").ToString()=="1"?" ":"edit(event,"+Eval("ID")+")" %>"></i>--%>
                    </span>
                </td>
                <td>
                <div class="hd_input" oid="<%#Eval("ID") %>" typename="helpcolumn" fileColumn="isCommend">
                        <span class="p_show e_lowpoint <%#(bool)Eval("isCommend")?" z_lowpoint ":""%> " cur="z_lowpoint"><input  class="hd" type="radio" <%#(bool)Eval("isCommend")?"checked=\"checked\"":""%>/><label></label></span>
                    </div>  
                </td>
                <td>
                <div class="hd_input" oid="<%#Eval("ID") %>" typename="helpcolumn" fileColumn="isTop">
                        <span class="p_show e_lowpoint <%#(bool)Eval("isTop")?" z_lowpoint ":""%> " cur="z_lowpoint"><input  class="hd" type="radio" <%#(bool)Eval("isTop")?"checked=\"checked\"":""%>/><label></label></span>
                    </div>   
                </td>
                <td>
                <div class="hd_input" oid="<%#Eval("ID") %>" typename="helpcolumn" fileColumn="isBest">
                        <span class="p_show e_lowpoint <%#(bool)Eval("isBest")?" z_lowpoint ":""%> " cur="z_lowpoint"><input  class="hd" type="radio" <%#(bool)Eval("isBest")?"checked=\"checked\"":""%>/><label></label></span>
                    </div>    
                </td>
                <td>
                <div class="hd_input" oid="<%#Eval("ID") %>" typename="helpcolumn" fileColumn="Enable">
                        <span class="p_show e_lowpoint <%#(bool)Eval("Enable")?" z_lowpoint ":""%> " cur="z_lowpoint"><input  class="hd" type="radio" <%#(bool)Eval("Enable")?"checked=\"checked\"":""%>/><label></label></span>
                    </div>  
                </td>
                <td><%#Eval("PostSum")%></td>
                <td><span class="editor_warp" data-src='{"action":"alertOrder","dataType":"number","editor":"input_editor","type":"helpcolumn","oid":"<%#Eval("ID") %>"}'><%#Eval("OrderID") %></span></td>
                <td><span class="editor_warp alertColumn" data-src='{"action":"updateColumn","editor":"select_editor","source":"#showtypetemp","value":"<%#Eval("ShowType")%>","oid":"<%#Eval("id") %>","type":"helpcolumn"}'></span></td>
                <td>
                    <span><%#((DateTime)Eval("InputTime")).ToString("yyyy-MM-dd<br />HH:mm:ss")%></span>
                </td>
                <td class="nsw_cnt_area action_tx <%#Eval("ID").ToString()=="1"?" f_noinfo":"" %>">
                    <a href='<%#MyTool.GetColumnURL(Container,NSW.Web.API.ColumnType.Help) %>' title='<%#Eval("Title") %>' target='_blank'><span class="pro_view"><i></i>预览</span></a>
                    <a href="##" onclick="<%#Eval("ID").ToString()=="1"?" ":"edit(event,"+Eval("ID")+",'action=copy')" %>"><span class="pro_copy"><i></i>复制</span></a>
                    <span class="pro_dele editor_warp" data-src='{"action":"delete","editor":"delete_editor","type":"helpcolumn","oid":"<%#Eval("ID") %>"}'><i></i>删除</span>
                </td>
                <% if (NSW.Mobile.MobileConfig.MEnableMobile == "true"){ %>
                <td class="nsw_cnt_area action_tx">
                    <a href="##" onclick="EditMobile(event,<%#Eval("ID") %>)"><span class="pro_view pro_edit"><i></i>编辑</span></a>
                </td>
                <% } %>
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
                    <asp:LinkButton ID="lnkBtnDel" CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click"><span>删除</span></asp:LinkButton>|<span class="span_add" onclick="edit(event)">新建</span>|<span class="span_refresh">刷新</span>
                </li>
	        </ul>
	        <div class="batch_act f_fl f_ml20">
                <span class="c_act ">其他操作<i class="tri_up f_fr"></i></span>
		        <ul class="batch_dropup column">
			        <li><asp:LinkButton CommandName="disable" runat="server" OnClientClick="return BatchOperation('确定禁用选中项（共{count}项）？')" OnClick="LinkButton_Click">批量隐藏</asp:LinkButton></li>
			        <li><asp:LinkButton CommandName="commend" runat="server" OnClientClick="return BatchOperation('确定推荐选中项（共{count}项）？')" OnClick="LinkButton_Click">批量推荐</asp:LinkButton></li>
                    <li><asp:LinkButton CommandName="discommend" runat="server" OnClientClick="return BatchOperation('确定禁用选中项（共{count}项）推荐？')" OnClick="LinkButton_Click">批量取消推荐</asp:LinkButton></li>
                    <li><asp:LinkButton CommandName="top" runat="server" OnClientClick="return BatchOperation('确定置顶选中项（共{count}项）？')" OnClick="LinkButton_Click">批量置顶</asp:LinkButton></li>
                    <li><asp:LinkButton CommandName="distop" runat="server" OnClientClick="return BatchOperation('确定禁用选中项（共{count}项）置顶？')" OnClick="LinkButton_Click">批量取消置顶</asp:LinkButton></li>
                    <li><asp:LinkButton CommandName="best" runat="server" OnClientClick="return BatchOperation('确定精华选中项（共{count}项）？')" OnClick="LinkButton_Click">批量精华</asp:LinkButton></li>
                    <li><asp:LinkButton CommandName="disbest" runat="server" OnClientClick="return BatchOperation('确定禁用选中项（共{count}项）精华？')" OnClick="LinkButton_Click">批量取消精华</asp:LinkButton></li>
			        <li class="popUp" data-src='{"popup":"BatchAddColumnPopUp","action":"BatchAddColumn","title":"批量添加分类","type":"helpcolumn"}'>批量添加分类</li>
		        </ul>
	        </div>
	        <div class="nsw_pagination f_fr f_mr20 f_cb">
                <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	        </div>
        </div>
        <!-- 列表分页 结束 -->
    </form>	
</div>
<span class="clear_bd" style="padding-right:0;display:none;" id="showtypetemp">
    <select class="pass_faq">
        <option value="1">仅标题</option>
        <option value="2">标题+摘要</option>
        <option value="3">标题+缩略图</option>
        <option value="4">标题+缩略图+简介</option>
    </select>
    <i class="revise_sub"></i>
</span>
</body>
</html>