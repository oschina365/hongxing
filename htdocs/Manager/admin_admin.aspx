<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.admin_list, qwt" enableviewstate="false" enableviewstatemac="false" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>管理员管理</title>
    <link href="skins/base/superadmin.css" rel="stylesheet" type="text/css"/>
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
            <SpanCurrentPosition:SpanCurrentPosition ID="cur" runat="server"/>
			<div class="advanced_so f_fr form_search">
				<div class="search_so f_fl">
					<input type="text" class="so_text clear_word f_fl" name="kwd"/>
                    <input type="hidden" name="field" value="[username]" />
					<input type="button" class="so_btn f_csp f_fl"  onclick="SearchObjectByGet(this)" />
				</div>
				<span class="advan_btn f_fl f_csp">高级</span>	
			</div>
		</div>
	<div class="advan_posi design_posi form_search ">
        <label class="com_name f_fl f_mr1">姓名</label>
		<span class="clear_bd f_fl">
		    <input class="com_input clear_word" type="text" placeholder="请填写姓名" name="chnname" />
		    <i class="clear_x"></i>
		</span>
		<label class="com_name f_fl f_mr1 f_ml2">管理员角色</label>
		<span class="clear_bd fast_in s_selt1 f_fl" id="roleColumn">
			<select class="pass_faq" name="cid">
			    <option value='-1'>不限</option>
			    <option value='0'>普通管理员</option>
			    <option value='1'>系统管理员</option>
			</select>
			<i class="revise_sub"></i>
		</span>
        <label class="com_name f_fl f_mr1 f_ml2">登录次数</label>
		<span class="clear_bd f_fl xnclear_bd">
		    <input class="com_input bor1 wth1 clear_word onlyNumber" type="text" placeholder="" name="uls" />
		    <i class="clear_x clear_x0"></i>到
		    <input class="com_input bor1 wth1 clear_word onlyNumber" type="text" placeholder="" name="ule" />
		    <i class="clear_x clear_x1"></i>次
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
	</div>

	<!-- 快速录入 开始 -->
	<div class="nsw_add_proclsify f_cb">
        <form onsubmit="return false">
			<label class="com_name f_ml2">管理员快速添加</label>
			<span class="clear_bd th1"><input class="com_input clear_word" type="text" name="username" tips="管理员用户名" _required="true" maxLength="140" placeholder="请填写管理员名"  tipPosition="top" /><i class="clear_x"></i></span>
			<span class="clear_bd th1 f_ml2"><input class="com_input clear_word" type="text" name="password" tips="管理员密码" _required="true" maxLength="140" placeholder="请填写密码"  tipPosition="top"/><i class="clear_x"></i></span>
			<span class="clear_bd fast_in f_ml2 dn">
				<select class="pass_faq ">
				    <option>普通管理员</option>
				</select>
			<i class="revise_sub"></i>
			</span>
            <span class="role_addbtn f_ml2 f_csp ajaxSave" data-src='{"action":"BatchAddAdminUser"}' >添加</span>
<%--            <a href="role.html" class="role_link f_ml2">角色管理</a>--%>
        </form>
	</div>
	<!-- 快速录入 结束 -->

	<div class="col_main">
		<!-- content_index -->
					
		<!-- 头部工具栏 开始 -->
		<div class="nsw_tools_bar f_cb"> 
				<ul class="nsw_check_btns f_fl">
		            <li class="f_ml20">
                        <span class="sele_all"><input type="radio" class="dn" /><em class="e_word"></em>全选</span>|
                        <span class="sele_inverse">反选</span>
                    </li>
		            <li class="f_ml20">
                       <%=ENTAdmin.isSystem?" <span class=\"xAdminDelete\">删除</span>|":"" %><span class="span_refresh">刷新</span>
                    </li>
				</ul>
				<div class="page_item f_fr" id="pagercopys"></div>
			</div>
		<!-- 头部工具栏 结束 --> 
					
		<!-- 列表区 开始 -->
        <table  class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
            <tr id="tabHeader">
                <th style="width:50px" class="p"><span class="cho">选择</span></th>
                <th axis="[UserName]" style=" width:200px;">管理员名</th>      
                <th style="width:100px">姓名+部门+角色</th>
                <th style="width:100px">手机号码+电子邮件</th>
                <th style="width:50px" axis="[Enable]">可用</th>
                <th style="width:50px" axis="[UserLogins]">登录次数</th>
                <th style="width:120px" axis="[LastLogin]" class="tcenter">最后登录时间</th>
                <th style="width:120px" axis="[InputTime]" class="tcenter">创建时间</th>
                <th style="width:120px">操作</th>
                <th style="width:60px">删除</th>
            </tr>
            <asp:Repeater ID="rptMain" runat="server"> <ItemTemplate>
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

                <td><span><a href="#1"><%#Eval("UserName")+((bool)Eval("isSystem")?"(系统)":"")%></a>
                    <i class="e_edi e_edi1 e_more_edit popUp" data-src='{"oid":"<%#Eval("ID") %>","popup":"ModificationPopUp","height":"538","iframes":{"src":"adminModification.aspx","cssName":"","width":"660","height":"460"},"title":"管理员资料快速修改"}'></i></span></td>
                <td>
                    <span>
					<i class="f_cb f_db"><%#Eval( "UserName")%></i>
					<i class="f_cb f_db"><%#Eval("Department")%></i>
					<i class="f_cb f_db"><%#((bool)Eval("isSystem") ? "超级" : "普通")%>管理员</i>
                    </span>
                </td>
                <td><span>
						<i class="f_cb f_db"><%#Eval("MPhone")%></i>
						<i class="f_cb f_db"><%#Eval("UserEmail") %></i> </span>
                </td>
                <td>
                    <%--<div class="set_radios hd_input" >
                        <span  class="p_show e_lowpoint  <%#(bool)Eval("Enable")?" z_lowpoint ":""%> " cur="z_lowpoint"><input type="radio" <%#(bool)Eval("Enable")?"checked=\"checked\"":""%>/><label></label></span>
                    </div> --%>
                    <div class="hd_input" oid="<%#Eval("ID") %>" typename="admin" fileColumn="Enable">
                        <span class="p_show e_lowpoint <%#(bool)Eval("Enable")?" z_lowpoint ":""%> " cur="z_lowpoint"><input  class="hd" type="radio" <%#(bool)Eval("Enable")?"checked=\"checked\"":""%>/><label></label></span>
                    </div>  
                </td>
                <td><span><%#Eval( "UserLogins")%></span>
                </td>
                <td><span><%# MyTool.GetFomartDateTime(Eval("LastLogin").ToString(),2)%></span>
                </td>
                <td><span><%# MyTool.GetFomartDateTime(Eval("InputTime").ToString(), 2)%></span>
                </td>
                <td>
                    <%#!(bool)Eval("isSystem") && ENTAdmin.isSystem ? "<span ><a href='admin_permission.aspx?oid=" + Eval("ID") + "' >设置权限</a></span>" : ""%>
                </td>
                <td>
                    <%#!(bool)Eval("isSystem") && ENTAdmin.isSystem ? "<span class='admin_dele' oid='"+Eval("id")+"'></span>" : ""%>
                </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        </table>
		<!-- 列表区 结束 -->
		<!-- 列表分页 开始 -->
			<div class="nsw_tools_bar f_cb"> 
				<ul class="nsw_check_btns f_fl">
		            <li class="f_ml20">
                        <span class="sele_all"><input type="radio" class="dn" /><em class="e_word"></em>全选</span>|
                        <span class="sele_inverse">反选</span>
                    </li>
		            <li class="f_ml20">
                       <%=ENTAdmin.isSystem?" <span class=\"xAdminDelete\">删除</span>|":"" %><span class="span_refresh">刷新</span>
                    </li>
				</ul>
				<div class="page_item f_fr" id="pagermains"><IndexNavi:IndexNavigator runat="server" ID="pagerMain" /></div>
			</div>
		<!-- 列表分页 结束 -->  
	</div>
    <script type="text/javascript">
        var id = "";
        $(".xAdminDelete").unbind("click").bind("click", function () {
            var data = id||SerializeCheckID();
            if (data == "") { _alert("未有选中项"); return; }
            _PostAjax("deladmin", { "ids": data, "type": "admin" }, function (msg) {
                var data = _Json(msg);
                if (data.error) {
                    _alert(data.msg, true, function () {
                        $("span.span_refresh").click();
                    });
                } else {
                    _alert(data.msg);
                }
            });
        });
        $("span.admin_dele").bind("click", function () {
            id = $(this).attr("oid");
            $(".xAdminDelete").click();
            id = "";
        });
    </script>
</body>
</html>
