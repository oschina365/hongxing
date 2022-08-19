<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.users, qwt" enableviewstate="false" enableviewstatemac="false" %>
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
<div class="so_bread">
    <div class="nsw_bread_tit f_cb">
        <SpanCurrentPosition:SpanCurrentPosition runat="server"/>
	    <div class="advanced_so f_fr form_search">
            <span class="clear_bd s_selt f_fl mr10 w140">
                <select id="ddlFields" class="pass_faq pl5">
                    <option value="[UserName]">用户名</option>
                    <option value="[ChnName]">姓名</option>
                    <option value="[UserEmail]">电子邮件</option>
                    <option value="[MPhone]">手机号码</option>
                </select>
                <i class="revise_sub"></i>
            </span>
			<div class="search_so f_fl mr10">
				<input type="text" class="so_text clear_word f_fl" name="kwd" />
				<input type="button" class="so_btn f_csp f_fl" onclick="SearchObjectByGet(this)" />
			</div>
            <span class="advan_btn f_fl f_csp">高级</span>	
		</div>
    </div>

    <div class="advan_posi design_posi form_search">
		<label class="com_name f_fl f_mr1">注册时间</label>
		<span class="f_cb controls_calendar f_fl">
            <input name="rts" type="text" class="com_input clear_word calendar_tx f_fl"/>
            <i class="calendar_icon f_fr f_csp"></i>
		</span>
        <label class="f_fl fm5 dlk lh28">至</label>
        <span class="f_cb controls_calendar f_fl">
            <input name="rte" type="text" class="com_input clear_word calendar_tx f_fl"/>
            <i class="calendar_icon f_fr f_csp"></i>
		</span>
		<label class="com_name f_fl f_mr1 f_ml2">邮箱/手机/用户名/姓名</label>
		<span class="clear_bd f_fl">
            <input type="hidden" name="field" value="[UserEmail]|[MPhone]|[UserName]|[ChnName]" />
		    <input class="com_input clear_word" type="text" placeholder="邮箱/手机/用户名/姓名" maxlength="20" name="kwd"/>
		    <i class="clear_x"></i>
		</span>
        <label class="com_name f_fl f_mr1 f_ml2">登录次数</label>
		<span class="f_cb clear_bd span_max_w50 f_fl">
            <input name="uls" type="text" class="com_input clear_word onlyNumber" validtype="number" maxlength="6"/>
            <i class="clear_x"></i>
		</span>
        <label class="f_fl fm5 dlk lh28">至</label>
        <span class="f_cb clear_bd span_max_w50 f_fl">
            <input name="ule" type="text" class="com_input clear_word onlyNumber" validtype="number" maxlength="6"/>
            <i class="clear_x"></i>
		</span>
        <ul class="f_fl f_cb circle_ul f_ml2">
			<span class="f_fl f_db e_radio radio" cur="z_select">
                <span class="dn"><input type="radio" name="active" value="1" /></span>
                <label>激活</label>
            </span>
            <span class="f_fl f_db e_radio radio" cur="z_select">
                <span class="dn"><input type="radio" name="active" value="0"/></span>
                <label>未激活</label>
            </span>
            <span class="f_fl f_db e_radio radio" cur="z_select">
                <span class="dn"><input type="radio" checked="checked" name="active" value="-1"/></span>
                <label>不限</label>
            </span>
		</ul>
		<input type="button" class="advan_so_btn f_csp f_fr" value="搜 索" onclick="SearchObjectByGet(this)" />
	</div>

</div>

<div class="col_main">
    <form id="Form1" runat="server">
        <!-- 列表区 开始 -->
        <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
            <tr id="tabHeader">
                <th style="width:50px" class="p"><span class="cho"></span></th>
<%--                <th style="width: 50px">
                    ID
                </th>--%>
                <th style="width: 100px" axis="[UserName]">
                    用户姓名
                </th>
                <th style="width: 60px" axis="[ChnName]">
                    真实姓名
                </th>
                        
                <th style="width: 60px" axis="[UserEmail]">
                    电子邮件
                </th>
                <th style="width: 120px" axis="[MPhone]">
                    手机号码
                </th>
                <th style="width: 80px" axis="[UserLogins]">
                    登录次数
                </th>
                <th style="width: 100px" axis="[LastIP]">
                    登录IP
                </th>
                <th style="width: 120px" axis="[LastLogin]">
                    上次登录时间
                </th>
                <%--表头:end--%>
                <th style="width: 50px" axis="[Enable]">
                    可用
                </th>
                <th style="width: 50px" axis="[Active]">
                    激活
                </th>
                <th style="width: 120px" axis="[InputTime]">
                    注册时间
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
<%--                <td class="tac">
                    <%#Eval( "ID")%>
                </td>--%>
                <td>
                    <a href="###" onclick="edit(event,<%#Eval("ID") %>)">
                        <%#Eval("UserName")%></a>
                </td>
                <td>
                    <%# Eval("ChnName") %>
                </td>
                                
                <td>
                    <a href="mailto:<%#Eval("UserEmail")%>">
                        <%#Eval("UserEmail")%></a>
                </td>
                <td>
                    <%#Eval("MPhone")%>
                </td>
                <td class="tac">
                    <%#Eval("UserLogins")%>
                </td>
                <td>
                    <%#Eval("LastIP")%>
                </td>
                <td>
                    <%#((DateTime)Eval("LastLogin")).ToString("yyyy-MM-dd HH:mm")%>
                </td>
                <%--列表字段:end--%>
                <td class="tac">
                    <div class="hd_input" oid="<%#Eval("ID") %>" typename="users" fileColumn="Enable">
                        <span class="p_show e_lowpoint <%#(bool)Eval("Enable")?" z_lowpoint ":""%> " cur="z_lowpoint"><input  class="hd" type="radio" <%#(bool)Eval("Enable")?"checked=\"checked\"":""%>/><label></label></span>
                    </div>
                <td class="tac">
                    <div class="hd_input" oid="<%#Eval("ID") %>" typename="users" fileColumn="Active">
                        <span class="p_show e_lowpoint <%#(bool)Eval("Active")?" z_lowpoint ":""%> " cur="z_lowpoint"><input  class="hd" type="radio" <%#(bool)Eval("Active")?"checked=\"checked\"":""%>/><label></label></span>
                    </div>
                </td>
                    <td><%# ((DateTime)Eval("InputTime")).ToString("yyyy-MM-dd HH:mm") %>
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
                    <asp:LinkButton ID="LinkButton1" CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click"><span>删除</span></asp:LinkButton>|
                    <span class="span_add" onclick="edit(event)">新建</span>|<span class="span_refresh">刷新</span>
                </li>
	        </ul>
	        <div class="nsw_pagination f_fr f_mr20 f_cb">
                <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	        </div>
        </div>
        <!-- 列表分页 结束 -->
    </form>	
</div>

</body>
</html>
