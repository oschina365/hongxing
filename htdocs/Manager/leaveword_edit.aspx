<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.leaveword_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>
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
            <div class="cont1">
				<div class="f_cb">
					<label class="add_label f_fl"><i class="red_point">*</i>标题</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTitle" runat="server" CssClass="com_input clear_word EnterWords" MaxLength="64"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
						</div>			
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">联系人</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtContact" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>		
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">管理员回复</span></label>
					<div class="add_r f_fl">
                        <div class="f_cb add_typeset bord_gray">
                            <asp:TextBox CssClass="text_area tx1" MaxLength="500" ID="ddlCategories" runat="server" TextMode="MultiLine"></asp:TextBox>
						</div>
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">IP</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtIP" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>		
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">电子邮箱地址</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtEmail" validtype="email_" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>		
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">电话号码</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTel" validtype="tel" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>		
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">手机号码</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtMobile" validtype="mphone" runat="server" CssClass="com_input clear_word"></asp:TextBox><i class="clear_x"></i></span>
						</div>		
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">内容</span></label>
					<div class="add_r f_fl">
                        <div class="f_cb add_typeset bord_gray">
                            <asp:TextBox CssClass="text_area tx1" MaxLength="500" ID="txtContent" runat="server" TextMode="MultiLine"></asp:TextBox>
						</div>
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">排序</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <span class="clear_bd s_selt f_fl pt43 f_mr15" style=" width:50px;">
							    <asp:DropDownList ID="ddlRanking" CssClass="pass_faq" Width="50px" runat="server"></asp:DropDownList>
                                <i class="revise_sub"></i>
                            </span>
						</div>		
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">录入时间</span></label>
					<div class="add_r f_fl">
						<div class="f_cb controls_calendar">
                            <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtInputTime" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
						</div>	
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">是否可用</span></label>
					<div class="add_r f_fl">
						<div class="nsw_check_box">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="chkEnable" Checked="true" CssClass="dn" />
                            </span>
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
                        <span class="e_btn1 f_ml35 f_csp fl" runat="server" id="btnDel"><i class="insert_icon"></i><asp:Button CommandName="del" runat="server" Text="删 除" onclick="btnSubmit_Click" /></span>
                        <span class="e_btn2 f_ml35 f_csp fl"><i class="reset_icon"></i><input type="reset" value="重 填" /></span>
                    </div>
                </div>
            </div>

		</div>
    </form>
</div>

</body>
</html>
