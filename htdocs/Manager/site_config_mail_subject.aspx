<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.site_config_mail_subject, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
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
<div class="col_main one_tab_1">
    <form id="form2" runat="server" onsubmit="top.refreshList=true;">
	    <div class="add_cont pad300 j_recordCon_c f_cb">
	        <!-- 帮助基本信息 -->
            <div class="cont1 settab_lh18">
				<div class="f_cb">
					<label class="add_label f_fl">新会员注册成功</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtRegisterNotifySubject" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>
                
                <div class="f_cb f_mt25">
					<label class="add_label f_fl">通过电子邮箱重设密码</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtResetPasswordByMailSubject" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">会员找回密码</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtFindingPinNotifySubject" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">资讯推荐</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtMailingNewsSubject" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">产品推荐</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtMailingProductSubject" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">邮件订阅</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtMailSubscriptionSubject" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">请求取消邮件订阅</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtConfirmCancelMailSubscriptionSubject" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">已取消邮件订阅</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtCancelMailSubscriptionSubject" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">订单已创建</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtOrderBuiltSubject" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">邀请注册</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtInitationRegisterSubject" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
                        <i class="i_shortdesc">包含标签：{$username$}邀请人用户名</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">返回邀请注册通知</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtReturnInitationRegisterSubject" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
                        <i class="i_shortdesc">包含标签：{$username$}邀请人用户名</i>
					</div>
				</div>
                
                <div class="f_cb f_mt25">
					<label class="add_label f_fl">留言的电子邮件通知（致管理员）</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtLeavewordMailNotifySubject" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
                        <i class="i_shortdesc">包含标签：{$contact$} 提交留言的联系人</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">留言的电子邮件通知（给发布者）</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtLeavewordMailNotifyToPosterSubject" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">订单生成邮件通知（致管理员）</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtOrderBuiltMailSubjectToAdmin" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
                        <i class="i_shortdesc">包含标签：{$order_no$} 订单号</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">订单已付款</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtOrderPaidSubject" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
                        <i class="i_shortdesc">包含标签：{$order_no$} 订单号</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">订单已发货</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtOrderDeliveried" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
                        <i class="i_shortdesc">包含标签：{$order_no$} 订单号</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">报告（致管理员）</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtReportsSubject" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>
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

    </form>
</div>
</body>
</html>