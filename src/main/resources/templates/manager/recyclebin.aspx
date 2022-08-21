<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.recyclebin, qwt" enableviewstate="false" enableviewstatemac="false" %>
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
<body>

<div class="so_bread">
    <div class="nsw_bread_tit f_cb">
        <SpanCurrentPosition:SpanCurrentPosition runat="server"/>
	    <div class="advanced_so f_fr form_search">
            <span class="clear_bd s_selt f_fl pt43 f_mr15" style="width:110px;margin:0 5px 0 8px;">
                <select id="ddlFields" class="pass_faq" style=" width:125px;padding-left:5px;">
                    <option value="Title">标题</option>
					<option value="ShortDesc">简介</option>
                </select>
                <i class="revise_sub"></i>
            </span>
            <div class="search_so f_fl">
				<input type="text" class="so_text clear_word f_fl" name="kwd" />
				<input type="button" class="so_btn f_csp f_fl" onclick="SearchObjectByGet(this)" />
			</div>
			<span class="advan_btn f_fl f_csp">高级</span>	
		</div>
    </div>
	<div class="advan_posi design_posi form_search">
		<label class="com_name f_fl f_mr1">标题名称</label>
        <span class="clear_bd fast_in s_selt1 f_fl">
			<select class="pass_faq" name="columntype" id="ColumnTypes">
                <%
                foreach(System.Collections.Generic.KeyValuePair<string,string> kvp in ColumnTypes){%>
                <option value='<%=kvp.Key %>'><%=kvp.Value %></option>
                 <% } %>
			</select>
			<i class="revise_sub"></i>
		</span>
		<label class="com_name f_fl f_mr1 f_ml2">所属分类</label>
		<span class="clear_bd fast_in s_selt1 f_fl">
			<select class="pass_faq dn ProductColumns" name="productc">
			    <%=NSW.Admin.Tools.AdminTools.FillColumnData("<option value='{sid}' oid='{id}'>{title}</option>", NSW.Web.API.ColumnType.Product.ToString()) %>
			</select>
            <select class="pass_faq dn NewsColumns" name="newsc">
			    <%=NSW.Admin.Tools.AdminTools.FillColumnData("<option value='{sid}' oid='{id}'>{title}</option>", NSW.Web.API.ColumnType.News.ToString()) %>
			</select>
            <select class="pass_faq dn ProjectColumns" name="projectc">
			    <%=NSW.Admin.Tools.AdminTools.FillColumnData("<option value='{sid}' oid='{id}'>{title}</option>", NSW.Web.API.ColumnType.Project.ToString()) %>
			</select>
            <select class="pass_faq dn HelpColumns" name="helpc">
			    <%=NSW.Admin.Tools.AdminTools.FillColumnData("<option value='{sid}' oid='{id}'>{title}</option>", NSW.Web.API.ColumnType.Help.ToString()) %>
			</select>
            <select class="pass_faq dn AgentColumns" name="agentc">
			    <%=NSW.Admin.Tools.AdminTools.FillColumnData("<option value='{sid}' oid='{id}'>{title}</option>", NSW.Web.API.ColumnType.Agent.ToString()) %>
			</select>
			<i class="revise_sub"></i>
		</span>
		<%--<ul class="f_fl f_cb square_ul f_ml15">
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
		</ul>--%>
		<input type="button" class="advan_so_btn f_csp f_fr" value="搜 索" onclick="SearchObjectByGet(this)" />
    </div>
</div>
<div class="col_main">
    <form runat="server">
        <!-- 列表区 开始 -->
        <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
            <tr id="tabHeader">
                <th style="width:50px" class="p"><span class="cho"></span></th>
                <th axis="[Title]" style=" width:200px;">标题名称</th>
                <th axis="[ColumnType]" style=" width:200px;">类型</th>
                <th class="tcenter" style="width:120px"  axis="[ColumnName]">所属分类</th>
                <th style="width:120px" axis="[DeleteTime]" class="tcenter">删除时间</th>   
                <th style="width:120px" axis="[InputTime]" class="tcenter">录入时间</th>
                <th style="width:60px" >操作</th>
            </tr>
            <asp:Repeater ID="rptMain" runat="server"><ItemTemplate>
            <tr class="child_1">
                <td class="td1">
                    <div class="nsw_check_box">
                        <span class="ck_box">
                            <span class="dn">
                                <input type="checkbox" name="chkItem" value="<%#Eval("ColumnType")+"_"+Eval("ID") %>"/>
                            </span>
                        </span>
                    </div>
                </td>
                <td>
                    <span class="short_tit f_fl"><%#Eval("Title")%></span>
                </td>
                <td>
                    <%#ColumnTypes[Eval("ColumnType").ToString()]%>
                </td>
                <td>
                    <%#Eval("ColumnName") %>
                </td>
                <td>
                    <span><%#((DateTime)Eval("DeleteTime")).ToString("yyyy-MM-dd<br />HH:mm:ss")%></span>
                </td>
                <td>
                    <span><%#((DateTime)Eval("InputTime")).ToString("yyyy-MM-dd<br />HH:mm:ss")%></span>
                </td>
                <td class="nsw_cnt_area action_tx">
                    <a href='<%#Eval("PageURL") %>' title='<%#Eval("Title") %>' target='_blank'><span class="pro_view"><i></i>预览</span></a>
                    <span class="pro_dele editor_warp" data-src='{"action":"recyclebin&cmd=reduction","editor":"delete_editor","type":"<%#Eval("ColumnType").ToString().ToLower() %>","oid":"<%#Eval("ID") %>","tips":"确定还原该条"}'><i></i>还原</span>
                    <span class="pro_dele editor_warp" data-src='{"action":"recyclebin&cmd=completelyDelete","editor":"delete_editor","type":"<%#Eval("ColumnType").ToString().ToLower() %>","oid":"<%#Eval("ID") %>"}'><i></i>删除</span>
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
                    <asp:LinkButton CommandName="del" runat="server" OnClientClick="return confirm('确定全部清空？')" onclick="LinkButton_Click2"><span>全部清空</span></asp:LinkButton>
                </li>
	        </ul>
	        <div class="nsw_pagination f_fr f_mr20 f_cb">
                <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	        </div>
        </div>
    </form>	
</div>
<script type="text/javascript">
    $(function () {
        $("#ColumnTypes").change(function () {
            var value = $(this).val();
            $("select." + value + "Columns").show().siblings("select").hide();
        }).change();
    })
</script>
</body>
</html>