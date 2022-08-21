<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.delivery_method_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server"><title></title>
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
<div class="col_main">
	<div class="add_tile_tab f_cb">
		<ul class="f_cb addtab_ul j_recordCon f_fl">
			<li class="active li1"><span class="sp"><em class="zline1"></em><em class="zline2"></em><i class="red_point">*</i>基本属性</span></li>
			<li class="li6"><span class="sp"><em class="zline1"></em><em class="zline2"></em>公共属性</span></li>
		</ul>						
	</div>
    <form id="form2" runat="server" onsubmit="top.refreshList=true;">
	    <div class="add_cont pad300 j_recordCon_c f_cb">

	        <!-- 帮助基本信息 -->
            <div class="cont1">
				<div class="f_cb">
					<label class="add_label f_fl"><i class="red_point">*</i>名 称</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" ID="txtTitle" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
						</div>			
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><i class="red_point">*</i>运 费</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word" ID="txtPrice" runat="server"></asp:TextBox><i class="clear_x"></i></span>
						</div>			
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

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">简介录入</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_typeset bord_gray">
                            <asp:TextBox CssClass="text_area tx1" MaxLength="500" ID="txtShortDesc" runat="server" TextMode="MultiLine"></asp:TextBox>	
						</div>
					</div>
				</div>

                
			</div>
            <!-- 帮助基本信息 end-->

            <!--其他信息-->
			<div class="cont1 else_info f_dn">

               <div class="f_cb">
                    <label class="add_label f_fl"><span class="f_pdl15">排序</span></label>
					<div class="add_r f_fl">
						<div class="f_cb f_lht27" style=" width:120px;">
                            <span class="clear_bd s_selt f_fl pt43 f_mr15">
                                <asp:DropDownList runat="server" CssClass="pass_faq" ID="ddlRanking"></asp:DropDownList>
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
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="Button1" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                        <span class="e_btn1 f_ml35 f_csp fl" runat="server" id="Span1"><i class="insert_icon"></i><asp:Button ID="Button2" CommandName="del" runat="server" Text="删 除" onclick="btnSubmit_Click" /></span>
                    </div>
                </div>
            </div>

		</div>
    </form>
</div>

</body></html>
