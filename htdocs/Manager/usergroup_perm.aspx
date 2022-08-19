<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.usergroup_perm, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>会员权限</title>
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
<form id="form1" runat="server">
    <div class="so_bread">
        <div class="nsw_bread_tit f_cb">
            <SpanCurrentPosition:SpanCurrentPosition ID="cur" runat="server"/>
        </div>
    </div>
    <div class="nsw_add_proclsify f_cb">
        <span class="e_btn1 f_csp f_fr ml20"><i class="save_icon"></i><asp:Button ID="btnSave" CommandName="return" runat="server" Text="更 新" OnClick="btnSave_Click"  /></span>
        <a href="usergroup.aspx" target="frmEditor">
            <span class="e_btn2 f_csp fl ml20">
                <i class="back_icon"></i>
                返 回
            </span>
        </a>
    </div>
    <div class="col_main">
        <!-- 列表区 开始 -->
        <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
            <tr id="tabHeader">
                <th style="width:50px" class="p"><span class="cho"></span></th>
                <th style="width:250px">名称</th>
                <th>简短描述</th>
                <th style="width:50px">可用</th>
                <th style="width:120px">录入时间</th>
            </tr>
            <asp:Repeater ID="rptMain" runat="server"><ItemTemplate>
            <tr class="child_1">
                <td class="td1">
                    <div class="nsw_check_box">
                        <span class="ck_box">
                            <span class="dn">
                                <input type="checkbox" name="chkItem" value="<%#Eval("ID") %>" <%#HoldedPermissions.Contains(","+Eval("ID")+",")?"checked='checked'":""%> />
                            </span>
                        </span>
                    </div>
                </td>
                <td><%#Eval( "Rename")%></td>
                <td><%#Eval( "ShortDesc")%></td>
                <td class="tac">
                    <div class="set_radios">
                        <span><input type="radio" <%#(bool)Eval("Enable")?"checked=\"checked\"":""%>/><label></label></span>
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
                    <span class="span_refresh">刷新</span>
                </li>
	        </ul>
	        <div class="nsw_pagination f_fr f_mr20 f_cb">
                <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	        </div>
        </div>
    </div>
</form>

</body>
</html>