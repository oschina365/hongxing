<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.admin_systemmenu_write, qwt" enableviewstate="true" enableviewstatemac="false" %>

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
<div class="col_main one_tab">
    <form id="form1" runat="server" onsubmit="top.refreshList=true;">
	    <div class="add_cont pad300 j_recordCon_c f_cb">

            <div class="cont1">
				<div class="f_cb">
					<label class="add_label f_fl"><i class="red_point">*</i>名称</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word" ID="txtTitle" runat="server"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>

				<div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">父菜单</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd s_selt f_fl pt43 click_op f_mr15">
                                <asp:DropDownList ID="ddlPrtMenu" CssClass="pass_faq" runat="server"></asp:DropDownList>
								<i class="revise_sub"></i>
							</span>
						</div>		
					</div>
				</div>
                
				<div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">菜单类型</span></label>
                    <div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <div class="set_cbs">
                                <asp:CheckBoxList runat="server" ID="cblProductModel" RepeatDirection="Horizontal" RepeatLayout="Flow" />
                            </div>
						</div>			
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">样式名称</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word" ID="txtCssClass" runat="server"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>
                
                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl"><span class="f_pdl15">缩略图名称</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word" ID="txtPhotoName" runat="server"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">链接</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv f_lht27">
                            <span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word" ID="txtHrefURL" runat="server"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">打开方式</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd s_selt f_fl pt43 click_op f_mr15">
                                <asp:DropDownList ID="ddlOpenMethod" CssClass="pass_faq" runat="server">
                                    <asp:ListItem Selected="True" Value="_self">本窗口</asp:ListItem>
                                    <asp:ListItem Value="_blank">新窗口</asp:ListItem>
                                </asp:DropDownList>
								<i class="revise_sub"></i>
							</span>
						</div>		
					</div>
				</div>

				<div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">描述</span></label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <div class="f_cb add_typeset bord_gray">
							    <asp:TextBox ID="txtShortDesc" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
						    </div>
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
                        <div class="f_cb add_sv">
						    <div class="f_cb controls_calendar">
                                <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtInputTime" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
						    </div>
                        </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">是否可用</span></label>
					<div class="add_r f_fl">
                        <div class="f_cb add_sv">
						    <div class="nsw_check_box">
                                <span class="ck_box mt5">
                                    <asp:CheckBox runat="server" ID="chkEnable" Checked="true" CssClass="dn" />
                                </span>
                            </div>
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
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="btnSave" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                    </div>
                </div>
            </div>

		</div>
    </form>
</div>

</body></html>
