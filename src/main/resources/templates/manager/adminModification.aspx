<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.adminModification, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title><%=ItemName %></title>
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
<form runat="server">
<ul class="admin_ul f_cb">
	<li class="f_cb">
        <label class="p_name f_fl">管理员名</label>
        <span class="f_fl"><asp:Label ID="LabAdminName" runat="server"></asp:Label></span>
    </li>
</ul>				
<ul class="change_words">
	<li class="f_mb15 f_cb">
        <div class="nsw_check_box f_fl f_mr20">
            <span class="ck_box mt5">
                <asp:CheckBox runat="server" ID="chkChangePassword" CssClass="dn" onclick="if(this.checked){$('#mm').show();}else{$('#mm').hide();}"/>
            </span>
            <label class="ck_text">修改密码</label>
        </div>
        <span class="clear_bd f_fl dn" style="width:35%" id="mm">
            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="com_input clear_word" placeholder="请输入最新密码"></asp:TextBox>
            <i class="clear_x"></i>
        </span>
    </li>	
</ul>
<ul class="admin_ul f_cb">
	<li class="f_cb">
        <label class="p_name f_fl">姓名</label>
        <span class="clear_bd f_fl">
            <asp:TextBox runat="server" ID="txtChnName" CssClass="com_input clear_word" placeholder="请填写员工姓名，便于识别"></asp:TextBox>
            <i class="clear_x"></i>
        </span>
    </li>
	<li class="f_cb">
        <label class="p_name f_fl">所在部门</label>
        <span class="clear_bd f_fl">
            <asp:TextBox runat="server" ID="txtDepartment" CssClass="com_input clear_word" placeholder="请填写员工所在部门"></asp:TextBox>
            <i class="clear_x"></i>
        </span>
        <em class="remark_color f_fl f_ml35">方便识别员工岗位</em>
    </li>
	<li class="f_cb">
        <label class="p_name f_fl">手机号码</label>
        <span class="clear_bd f_fl">
            <asp:TextBox runat="server" ID="txtMPhone" validtype="mphone" CssClass="com_input clear_word" placeholder="请填写手机号码"></asp:TextBox>
            <i class="clear_x"></i>
        </span>
        <em class="remark_color f_fl f_ml35">方便与员工电话联系</em>
    </li>
	<li class="f_cb">
        <label class="p_name f_fl">电子邮件</label>
        <span class="clear_bd f_fl">
            <asp:TextBox runat="server" ID="txtUserEmail" validtype="email_" CssClass="com_input clear_word" placeholder="请填写电子邮件"></asp:TextBox>
            <i class="clear_x"></i>
        </span>
        <em class="remark_color f_fl f_ml35">方便与员工邮件联系</em>
    </li>
	<li class="f_mb15 f_cb">
        <label class="p_name f_fl"></label>
        <radio_control:radio_control runat="server" Checked="true" ID="radYes" CssName="f_fl f_db e_radio e_radio2 ad_disable" Text="可用" />
         <radio_control:radio_control runat="server" ID="radNo" CssName="f_fl f_db e_radio e_radio2 ad_disable" Text="禁用" />
    </li>
	<li class="smtp_btn f_cb">
		<label class="p_name f_fl"></label>
		<span class="e_btn1 f_csp f_fl">
		<i class="save_icon"></i><asp:Button ID="btnSave" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
	</li>
</ul>
</form>
</body>
</html>
