<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.payment_method_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server"><title></title>
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
    <div class="add_tile_tab f_cb">
		<ul class="f_cb addtab_ul j_recordCon f_fl w75_">
			<a href="payment_method_edit.aspx?action=alipay"><li class="li1 <%= OAction == "alipay" ? " active" : string.Empty %>"><span class="sp"><em class="zline1"></em><em class="zline2"></em>支付宝</span></li></a>
            <%--<a href="payment_method_edit.aspx?action=99bill"><li class="li2 <%= OAction == "99bill" ? " active" : string.Empty %>"><span class="sp"><em class="zline1"></em><em class="zline2"></em>快 钱</span></li></a>--%>
            <a href="payment_method_edit.aspx?action=COD"><li class="li2 <%= OAction == "cod" ? " active" : string.Empty %>"><span class="sp"><em class="zline1"></em><em class="zline2"></em>货到付款</span></li></a>
			<a href="payment_method_edit.aspx?action=transfer"><li class="li6 <%= OAction == "transfer" ? " active" : string.Empty %>"><span class="sp"><em class="zline1"></em><em class="zline2"></em>转账汇款</span></li></a>
		</ul>
	</div>
    <form runat="server">
    <div class="add_cont pad300 j_recordCon_c f_cb">
	    <!-- 帮助基本信息 -->
        <div class="cont1">
            <div class="f_cb">
				<label class="add_label f_fl"><i class="red_point">*</i>名 称</label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1">
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="com_input clear_word"></asp:TextBox>
                            <i class="clear_x"></i>
                        </span>
					</div>
                    <asp:HiddenField runat="server" ID="hdnOID" />
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">图标名称</span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtPhotoName" runat="server"></asp:TextBox>
                        <i class="clear_x"></i>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">图 标</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<div class="f_fl f_csp upload_img Upload_Clik" input="hdThumbnail" id="ThumbnailUpload" directory="Product"><span><em class="load_small"></em>点击上传</span></div>
                        <asp:HiddenField runat="server" ID="hdThumbnail" />
                    </div>
                    <i class="i_shortdesc"></i>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">调用标签</span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtFlag" runat="server"></asp:TextBox>
                        <i class="clear_x"></i>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25" runat="server" id="trAccount">
				<label class="add_label f_fl"><span class="f_pdl15"><asp:Literal runat="server" ID="ltlAccount">支付宝账号</asp:Literal></span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
					    <div class="clear_bd f_fl p_inp1">
                            <asp:TextBox CssClass="com_input clear_word" ID="txtAccount" runat="server"></asp:TextBox>
                            <i class="clear_x"></i>
					    </div>
                    </div>
                    <i class="i_shortdesc"><asp:Literal runat="server" ID="ltlAlipayInfo">登录支付宝使用的账号</asp:Literal></i>
				</div>
			</div>

            <div class="f_cb f_mt25" runat="server" id="trSign">
				<label class="add_label f_fl"><span class="f_pdl15"><asp:Literal runat="server" ID="ltlSign">交易安全校验码（key）</asp:Literal></span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtPayKey" runat="server"></asp:TextBox>
                        <i class="clear_x"></i>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25" runat="server" id="trPayID">
				<label class="add_label f_fl"><span class="f_pdl15">合作者身份（partnerID）</span></label>
				<div class="add_r f_fl">
					<div class="clear_bd f_fl p_inp1">
                        <asp:TextBox CssClass="com_input clear_word" ID="txtPayID" runat="server"></asp:TextBox>
                        <i class="clear_x"></i>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25">
		        <label class="add_label f_fl"><span class="f_pdl15">简短描述</span></label>
		        <div class="add_r f_fl">
			        <div class="f_cb add_typeset bord_gray">
				        <asp:TextBox ID="txtShortDesc" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
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

        <!--按钮-->
        <div class="f_cb f_mt25">
            <label class="add_label f_fl"><span class="f_pdl15"></span></label>
            <div class="add_r f_fl">
                <!-- 保存并返回 -->
			    <div class="view_btn f_mt30">
                    <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                </div>
            </div>
        </div>
    </div>
    </form>
</div>
</body>
</html>
