<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.site_other_config, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
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
 <form id="form1" runat="server" onsubmit="top.refreshList=true">
 <div class="col_main one_tab_1">

	    <div class="add_cont pad300 j_recordCon_c f_cb">
	        <!-- 帮助基本信息 -->
            <div class="cont1 settab_lh18">

                <div class="f_cb">
					<label class="add_label f_fl">启用验证码</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <radio_control:radio_control runat="server" ID="rdoEnableVerifyCodeYes" Text="是" />
                            <radio_control:radio_control runat="server" ID="rdoEnableVerifyCodeNo" Text="否" />
                        </div>
                        <i class="i_shortdesc">是否启用图形验证码，防止恶意提交数据，推荐开启</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">全局数据提交间隔时间</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtGlobalDataSubmittingInterval" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber"></asp:TextBox><i class="clear_x"></i></span>
					    </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">禁止访问本站的IP</label>
					<div class="add_r f_fl">
                         <div class="f_cb add_typeset bord_gray">
						    <asp:TextBox ID="txtForbiddenIP" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
					    </div>
                        <i class="i_shortdesc">当被用户的IP被列入后，访问网站前台任何页面都会被转向到消息提示页面。<br />每个IP（段）一行，支持通配符*，如 182.3.2.*</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">禁止提交数据的IP</label>
					<div class="add_r f_fl">
                         <div class="f_cb add_typeset bord_gray">
						    <asp:TextBox ID="txtForbiddenSubmitIP" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
					    </div>
                        <i class="i_shortdesc">当被用户的IP被列入后，用户在前台提交任何数据都将不允许。<br />每个IP（段）一行，支持通配符*，如 182.3.2.*</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">屏蔽词语</label>
					<div class="add_r f_fl">
                         <div class="f_cb add_typeset bord_gray">
						    <asp:TextBox ID="txtForbiddenWord" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
					    </div>
                        <i class="i_shortdesc">键值对，每对一行，比如：<br />你娘的||你**</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">举报类型</label>
					<div class="add_r f_fl">
                         <div class="f_cb add_typeset bord_gray">
						    <asp:TextBox ID="txtReportCategories" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
					    </div>
                        <i class="i_shortdesc">每个分类一行</i>
					</div>
				</div>

                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl">发送报告的电子邮件通知</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <radio_control:radio_control runat="server" ID="rdoSendingReportsMailNotifyToAdminYes" Text="是" />
                            <radio_control:radio_control runat="server" ID="rdoSendingReportsMailNotifyToAdminNo" Text="否" />
                        </div>
                        <i class="i_shortdesc">当有用户提交了报告后，发送一封邮件通知到指定电子邮箱地址。</i>
					</div>
				</div>

                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl">接收报告通知的电子邮箱地址</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtReceivingReportsMailAddress" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					    </div>
					</div>
				</div>

                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl">发送报告的手机短信通知</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <radio_control:radio_control runat="server" ID="rdoSendingReportsSMSToAdminYes" Text="是" />
                            <radio_control:radio_control runat="server" ID="rdoSendingReportsSMSToAdminNo" Text="否" />
					    </div>
                        <i class="i_shortdesc">当有用户提交了报告后，发送一条短信通知到指定手机号码。</i>
					</div>
				</div>

                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl">接收报告通知的手机号码（短信形式）</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtReceivingReportsSMSMobileNo" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					    </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">牛商学堂客户编号</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtCustomerNumber" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					    </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">牛商学堂用户名</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtxtuser" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					    </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">牛商学堂密码</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtxtpass" TextMode="Password" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					    </div>
					</div>
				</div>

                <div class="border_ f_mt20 f_mb10">
                    <i></i><span class="f_csp">其它配置</span>
                    <b></b>
                </div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">搜索列表页默认大小</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1 span_max_w50"><asp:TextBox ID="txtSearchingPageSizeDefault" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber"></asp:TextBox><i class="clear_x"></i></span>
					    </div>
					</div>
				</div>

                <div class="border_ f_mt20 f_mb10">
                    <i></i><span class="f_csp">其它</span>
                    <b></b>
                </div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">联系方式收集默认标题</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtCollectingUserInfoDefaultTitle" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					    </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">联系方式收集默认成功提交提示语</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtCollectingUserInfoDefaultSuccessMessage" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					    </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">联系方式收集输入框提示语</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtCollectingUserInfoInputTooltips" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
					    </div>
                        <i class="i_shortdesc">输入框格式标签 {$input_title$}，例如：想得到牛商网更多的支持吗？请留下{$input_title$}，方便我们更好为您服务。</i>
					</div>
				</div>


            </div>
            <!--其他信息 end-->

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