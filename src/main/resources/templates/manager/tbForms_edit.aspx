<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.tbForms_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%= ItemName %>（<%= OID > 0 ? "Object ID: " + OID : "新建对象" %>）</title>
    <link href="skins/base/news.css" rel="stylesheet" type="text/css"/>
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
					<label class="add_label f_fl"><i class="red_point">*</i>表单名称</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTitle" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">留言开启验证码</label>
					<div class="add_r f_fl">
						<div class="f_cb">
                            <radio_control:radio_control ID="rdoVerYes" Checked="true" runat="server" Text="开启" />
                            <radio_control:radio_control ID="rdoVerNo" runat="server" Text="关闭" />
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">留言间隔时间</label>
					<div class="add_r f_fl">
						<div class="f_cb">
                            <radio_control:radio_control ID="rdoTimesYes" runat="server" Text="限制" onclick="$('#spanTimes').show();" />
                            <radio_control:radio_control ID="rdoTimesNo" Checked="true" runat="server" Text="无限制" onclick="$('#spanTimes').val('').hide();"/>
                            <span class="clear_bd f_fl p_inp1 span_max_w30" id="spanTimes">
                                <asp:TextBox CssClass="com_input clear_word onlyNumber" MaxLength="2" ID="txtTimes" validtype="number" runat="server"></asp:TextBox>
                                <i class="clear_x"></i>
                            </span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl">短信知会用户</label>
					<div class="add_r f_fl">
						<div class="f_cb">
                            <radio_control:radio_control ID="rdoSmsNotificationUserYes" runat="server" Text="开启" />
                            <radio_control:radio_control ID="rdoSmsNotificationUserNo" Checked="true" runat="server" Text="不开启" />
                            <span class='show' show='isSmsNotificationUser_0'><a href="javascript:;" style="margin-left:10px;">设置短信话术</a></span>
                            <asp:HiddenField ID="HiddenEmailSurgery" runat="server" />
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl">邮件知会用户</label>
					<div class="add_r f_fl">
						<div class="f_cb">
                            <radio_control:radio_control ID="rdoEmailTOUserYes" runat="server" Text="开启" />
                            <radio_control:radio_control ID="rdoEmailTOUserNo" Checked="true" runat="server" Text="不开启" />
                            <span><a href="javascript:;" style="margin-left:10px;">设置短信话术</a></span>
                            <asp:HiddenField ID="HiddenField2" runat="server" />
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl">用户留言时知会我</label>
					<div class="add_r f_fl">
						<div class="f_cb">
                            <radio_control:radio_control ID="rdoNotifyMeYes" runat="server" Text="开启" />
                            <radio_control:radio_control ID="rdoNotifyMeNo" Checked="true" runat="server" Text="不开启" />
                            <span class='show' show='isNotifyMe_0'>
                                <a href="javascript:;" style="margin-left:10px;">设置号码</a>
                                <a href="javascript:;" style="margin-left:10px;">设置短信话术</a>
                            </span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl">短信知会我</label>
					<div class="add_r f_fl">
						<div class="f_cb">
                            <radio_control:radio_control ID="rdoSmsToMeYes" runat="server" Text="开启" />
                            <radio_control:radio_control ID="rdoSmsToMeNo" Checked="true" runat="server" Text="不开启" />
                            <span class='show' show='isSmsToMe_0'><a href="javascript:;" style="margin-left:10px;">设置邮箱</a><a href="javascript:;" style="margin-left:10px;">设置邮件话术</a></span>
						</div>
					</div>
				</div>

                
                <div class="f_cb f_mt25">
					<label class="add_label f_fl">邮件知会我</label>
					<div class="add_r f_fl">
						<div class="f_cb">
                            <radio_control:radio_control ID="rdoEmailToMeYes" Checked="true" runat="server" Text="开启" />
                            <radio_control:radio_control ID="rdoEmailToMeNo" runat="server" Text="不开启" />
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">审核后显示</label>
					<div class="add_r f_fl">
						<div class="f_cb">
                            <radio_control:radio_control ID="rdoShowYes" Checked="true" runat="server" Text="开启" />
                            <radio_control:radio_control ID="rdoShowNo" runat="server" Text="不开启" />
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">自定义模版</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_typeset bord_gray" style=" height:400px;">
						    <asp:TextBox ID="txtTemp" runat="server" CssClass="text_area tx1" TextMode="MultiLine" style=" line-height:14px;"></asp:TextBox>
					    </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">样式</label>
					<div class="add_r f_fl">
                        <div class="f_cb add_typeset bord_gray">
						    <asp:TextBox ID="txtCss" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
					    </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">排序</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv setcbs">
                            <span class="clear_bd s_selt f_fl pt43 f_mr15" style="width:50px;">
                                <asp:DropDownList runat="server" CssClass="pass_faq" Width="50" ID="ddlRanking"></asp:DropDownList>
                                <i class="revise_sub"></i>
                            </span>
						</div>			
					</div>
                </div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">是否可用</span></label>
					<div class="add_r f_fl">
						<div class="nsw_check_box add_sv">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="chkEnable" Checked="true" CssClass="dn" />
                            </span>
                        </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">录入时间</span></label>
					<div class="add_r f_fl">
						<div class="f_cb controls_calendar add_sv">
                            <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtInputTime" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
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
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                        <span class="e_btn2 f_ml35 f_csp fl dn"><i class="reset_icon"></i><input type="reset" value="重 填" /></span>
                    </div>
                </div>
            </div>
		</div>

    </form>
</div>

</body>

</html>
