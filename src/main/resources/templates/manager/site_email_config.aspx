<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.site_email_config, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title><%= ItemName %></title>
    <link href="skins/base/setting.css" rel="stylesheet" type="text/css" />
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
<CurrentPosition:CurrentPosition runat="server" ID="currentPosition"/>
<div class="col_main">
    <form id="form1" runat="server" onsubmit="top.refreshList=true">
        <ul class="nsw_smtp">
			<li>
                <label class="p_name f_fl">IP地址</label>
				<span class="clear_bd"><asp:textbox id="txtSmtpServer" MaxLength="20" runat="server" CssClass="per_inp clear_word"></asp:textbox><i class="clear_x"></i></span>
				<i class="redcolor redpoint">*</i>也可以填写邮件服务器的域名
            </li>
			<li>
                <label class="p_name f_fl">用户名</label>
				<span class="clear_bd"><asp:textbox id="txtSmtpUsername" validtype="email_" runat="server" CssClass="per_inp clear_word"></asp:textbox><i class="clear_x"></i></span>
				<i class="redcolor redpoint">*</i>
            </li>
			<li>
                <label class="p_name f_fl">密码</label>
				<span class="clear_bd"><asp:textbox id="txtSmtpPin" MaxLength="20" runat="server" CssClass="per_inp clear_word"></asp:textbox><i class="clear_x"></i></span>
				<i class="redcolor redpoint">*</i>
            </li>
			<li>
                <label class="p_name f_fl">端口号</label>
				<div class="smtp_radio  f_fl">
                    <radio_control:radio_control runat="server" ID="rdoDefPortYes" Text="默认端口" onclick="$('#txtSmptPort').hide();" />
                    <radio_control:radio_control runat="server" ID="rdoDefPortNo" Text="其他端口" onclick="$('#txtSmptPort').show();" />
                    <asp:textbox id="txtSmptPort" validtype="number" MaxLength="4" runat="server" CssClass="per_inp2 clear_word onlyNumber f_fr"></asp:textbox>
				</div>
			</li>
			<li>
                <label class="p_name f_fl">发送人</label>
				<span class="clear_bd"><asp:textbox id="txtDisplayName" MaxLength="40" runat="server" CssClass="per_inp clear_word"></asp:textbox><i class="clear_x"></i></span>
				<i class="redcolor redpoint">*</i>收邮件时显示的发送人
            </li>
			<li class="smtp_btn clearfix">
                <span class="e_btn1 f_csp f_fl  f_mr20">
                    <i class="save_icon"></i>
                    <asp:Button ID="Button1" runat="server" Text="保 存" onclick="btnSubmit_Click" />
                </span>
                <span class=" f_db f_fl f_csp  f_underline" onclick="$(this).hide().next('span').show();">测试此帐号是否正确</span>
                <span class="f_fl dn">
                    <span class="clear_bd f_fl p_inp1 ml10" style="width:200px;">
                        <asp:TextBox CssClass="com_input clear_word" MaxLength="64" ID="txtEmail" validtype="email_" runat="server" placeholder="请输入邮箱已便测试..."></asp:TextBox><i class="clear_x"></i>
                        <i class="clear_x"></i>
				    </span>
                    <span class=" f_db f_fl f_csp  f_underline ml10"><asp:LinkButton runat="server" onclick="btnSubmit_Test" OnClientClick="return vEmial();">立即发送测试</asp:LinkButton></span>
                </span>
            </li>
		</ul>
		<p class="attention1"><em class="att_ico"></em>说明：如果想增加用户体验度，间接提升销售业绩，请让您的网站使用邮件发送功能。订单状态发生变化自动通知客户、会员注册邮件回执与激活功能、用户在线留言回执与知会公司销售人员等邮件发送功能均需要使用此帐号进行邮件发送。</p>
    </form>
    <script type="text/javascript">
        function vEmial() {
            var value = $tv("txtEmail").trim();
            if (value == "") {
                _alert("请填写邮箱地址，方便测试！");
                return false;
            }
            var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            if (!myreg.test(value))
            {
                _alert('请输入有效的邮箱地址！');
                return false;
            }
            return true;
        }
    </script>
</div>
</body>
</html>