<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.site_adv_config, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%= ItemName %></title>
    <link href="skins/base/news.css" rel="stylesheet" type="text/css" />
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
<form id="form2" runat="server" onsubmit="top.refreshList=true;">
<div class="col_main">
    <div class="add_tile_tab f_cb">
		<ul class="f_cb addtab_ul j_recordCon f_fl w25_">
			<li class="active li1"><span class="sp"><em class="zline1"></em><em class="zline2"></em>管理员控制面板设置</span></li>
			<li class="li6"><span class="sp"><em class="zline1"></em><em class="zline2"></em>其它设置</span></li>
		</ul>						
	</div>
	<div class="add_cont pad300 j_recordCon_c f_cb">
	    <!-- 管理员控制面板设置 -->
        <div class="cont1 settab_lh18">
			<div class="f_cb">
				<label class="add_label f_fl"><span class="f_pdl15">最大每页显示记录数</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtAdminMaxPageSize" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>
                
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">是否记录管理员操作日志</span></label>
				<div class="add_r f_fl">
					<radio_control:radio_control runat="server" GroupName="adminlog" ID="rdoAdminTakeLogYes" Text="是" />
                    <radio_control:radio_control runat="server" GroupName="adminlog" ID="rdoAdminTakeLogNo" Text="否" />
				</div>
			</div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">默认每页显示记录数</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtAdminDefaultPageSize" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber" ></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
            </div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">允许管理员自助找回密码</span></label>
				<div class="add_r f_fl">
					<radio_control:radio_control runat="server" GroupName="AdminFindPin" ID="rdoAdminFindPinYes" Text="是" />
                    <radio_control:radio_control runat="server" GroupName="AdminFindPin" ID="rdoAdminFindPinNo" Text="否" />
				</div>
			</div>
        </div>
        <!--管理员控制面板设置 end-->

        <div class="cont1 settab_lh18">

            <div class="f_cb">
				<label class="add_label f_fl"><span class="f_pdl15">站点域名</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtSiteDomain" validtype="alldomain" runat="server" CssClass="com_input clear_word onlyNumber" reginput="domain"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">是否启用后台路径配置</span></label>
				<div class="add_r f_fl">
					<radio_control:radio_control runat="server" GroupName="closed" ID="rdoOverrideYes" Text="是" />
                    <radio_control:radio_control runat="server" GroupName="closed" ID="rdoOverrideNo" Text="否" />
				</div>
			</div>

            <div class="f_cb f_mt25" runat="server" id="overridepath">
				<label class="add_label f_fl"><span class="f_pdl15">后台路径</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1">
                            <asp:TextBox ID="txtOverrideManagerPath" runat="server" CssClass="com_input clear_word" ></asp:TextBox>
                            <i class="clear_x"></i>
                        </span>
                        <asp:Button ID="Button4" Text="修 改" CssClass="msg_btn f_fl f_csp w70 tal ml10 msg_save" runat="server" onclick="Button1_Click"  />
					</div>
                    <i class="i_shortdesc">例如：Admin</i>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">URLReWrite扩展名</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtReWriteUrlExt" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">皮肤路径</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtSkin" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
                    <i class="i_shortdesc">相对路径，以 / 结束</i>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">通信密码（干扰串）</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtSignalCode" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
                    <i class="i_shortdesc">随意字符串，该字符串应在网站正式开始运营时修改好，正常运营过程中请勿随意修改，否则加密串将全部错误无效。</i>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">会话Cookie有效时间</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtCookForSession" runat="server" CssClass="com_input clear_word onlyNumber"></asp:TextBox><i class="clear_x"></i></span>
					</div>
                    <i class="i_shortdesc">辅助 cookie。设置为0表示不启用辅助 session。对于 session 不稳定的主机，必须开启 该辅助 cookie。</i>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">售后客服QQ1</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtkefuqq" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
                    <i class="i_shortdesc">如果后面添加联系人的话,格式:QQ$$姓名 如:88888888$$牛商网</i>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">售后客服QQ2</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtkefuqqs" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
                    <i class="i_shortdesc">如果后面添加联系人的话,格式:QQ$$姓名 如:88888888$$牛商网</i>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">售后客服电话号码</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtkefutel" validtype="tel" runat="server" CssClass="com_input clear_word onlyNumber" reginput="telinfo"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">频道首页静态页路径与更新时间</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_typeset bord_gray">
						<asp:TextBox ID="txtChannelHomepage" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
					</div>
				</div>
			</div>

            <div class="border_ f_mt20 f_mb10 dn">
                <i></i><span class="f_csp">会员同步API</span>
                <b></b>
            </div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">是否启用会员同步接口</span></label>
				<div class="add_r f_fl">
					<radio_control:radio_control runat="server" GroupName="EnableUserAPI" ID="rdoEnableUserAPIYes" Text="是" />
                    <radio_control:radio_control runat="server" GroupName="EnableUserAPI" ID="rdoEnableUserAPINo" Text="否" />
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">会员同步接口密钥</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtUserAPIKey" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">同步的网站系统地址</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_typeset bord_gray">
						<asp:TextBox ID="txtUserAPIUrls" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
					</div>
				</div>
			</div>

            <div class="border_ f_mt20 f_mb10 dn">
                <i></i><span class="f_csp">附件保存路径</span>
                <b></b>
            </div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">FCK用户文件路径</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtFCKeditor_UserFilesPath" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">资讯相关附件保存目录</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtUploadedFolderNews" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">产品相关附件保存目录</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtUploadedFolderProduct" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">其它相关附件保存目录</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtUploadedFolderOthers" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">后台系统相关附件保存目录</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtUploadedFolderSystem" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">会员头像附件保存目录</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtUploadedFolderAvatar" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">源文件保存目录</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtUploadedFolderSource" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="border_ f_mt20 f_mb10 dn">
                <i></i><span class="f_csp">系统错误报告</span>
                <b></b>
            </div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">是否发送错误报告</span></label>
				<div class="add_r f_fl">
                    <radio_control:radio_control runat="server" GroupName="SendErrorReport" ID="rdoSendErrorReportYes" Text="是" />
                    <radio_control:radio_control runat="server" GroupName="SendErrorReport" ID="rdoSendErrorReportNo" Text="否" />
				</div>
			</div>

            <div class="border_ f_mt20 f_mb10 dn">
                <i></i><span class="f_csp">报告类型</span>
                <b></b>
            </div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">是否发送错误报告</span></label>
				<div class="add_r f_fl set_selects">
                    <asp:DropDownList ID="ddlErrorReportType" runat="server">
                        <asp:ListItem Value="log">日志文件</asp:ListItem>
                        <asp:ListItem Value="mail">电子邮件通知</asp:ListItem>
                        <asp:ListItem Value="mailandlog">日志文件和电子邮件通知</asp:ListItem>
                    </asp:DropDownList>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">错误报告日志文件相对路径</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtErrorReportLog" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">报告收件人</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtErrorReportAddressee" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="border_ f_mt20 f_mb10 dn">
                <i></i><span class="f_csp">静态页模板及静态页保存路径</span>
                <b></b>
            </div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">招商加盟详细页前台模板路径</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtAgentTemplatePath" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

             <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">招商加盟详细页生成的静态页保存目录</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtAgentHtmlTargetPath" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">新闻详细页前台模板路径</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtNewsTemplatePath" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

             <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">新闻详细页生成的静态页保存目录</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtNewsHtmlTargetPath" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">帮助中心前台模板路径</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtHelpTemplatePath" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

             <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">帮助中心生成的静态页保存目录</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtHelpHtmlTargetPath" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">产品中心前台模板路径</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtProductTemplatePath" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

             <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">产品中心生成的静态页保存目录</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtProductHtmlTargetPath" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">通用网站地图模板路径</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtSiteMapTemplatePath" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

             <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">GOOGLE地图模板路径</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtSiteMapTemplateXMLPath" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">网站地图静态页存放目录</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtSiteMapHtmlTargetPath" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					</div>
				</div>
			</div>

        </div>

        <!--按钮-->
        <div class="f_cb f_mt25">
            <label class="add_label f_fl"><span class="f_pdl15"></span></label>
            <div class="add_r f_fl">
                <!-- 保存并返回 -->
			    <div class="view_btn f_mt30">
                    <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="Button2" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                </div>
            </div>
        </div>
	</div>
</div>
</form>
</body>
</html>