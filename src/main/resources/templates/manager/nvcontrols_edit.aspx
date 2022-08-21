<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.nvcontrols_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>
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
					<label class="add_label f_fl"><i class="red_point">*</i>控件名称</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTitle" runat="server" CssClass="com_input clear_word" MaxLength="60"></asp:TextBox><i class="clear_x"></i></span>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><i class="red_point">*</i>控件标记</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtMark" runat="server" CssClass="com_input clear_word" MaxLength="60"></asp:TextBox><i class="clear_x"></i></span>
						</div>
                        <i class="i_shortdesc">模版里面使用#nvcontrols('控件标记')引用，控件标记可重复，当界面引用时，会调用同组标记控件</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">控件类型</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv set_selects">
							<asp:DropDownList runat="server" ID="ddlTemplateType">
                                <asp:ListItem Value="0">动态模版</asp:ListItem>
                                <asp:ListItem Value="1">静态模版</asp:ListItem>
                            </asp:DropDownList>
						</div>
                        <i class="i_shortdesc">有些界面可以使用$thisrow.sid类似的获取你想要的参数，不管是SQL语句里面还是详细内容</i>
					</div>
				</div>
                <script type="text/javascript">
                    $(function () {
                        $("#ddlTemplateType").change(function () {
                            var val = $(this).val();
                            $(this).parents("div.cont1").find("div.temp_").hide().filter("div.temp_" + val).show();
                        }).change();
                    })
                </script>
                <div class="f_cb f_mt25 temp_ temp_0">
					<label class="add_label f_fl">SQL语句</label>
					<div class="add_r f_fl">
						<div class="f_cb add_typeset bord_gray">
							<asp:TextBox ID="txtSQL" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
						</div>
                        <i class="i_shortdesc">非专业人士，请勿随便修改SQL，（数据标记:SQL，例如newsdata:select * from tbNews），多个以英文分号;隔开</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">控件图片</span></label>
                    <div class="add_r f_fl">
						<div class="f_fl f_csp upload_img Upload_Clik" input="hdThumbnail" id="ThumbnailUpload" directory="qt"><span><em class="load_small"></em>点击上传</span></div>
                        <asp:HiddenField runat="server" ID="hdThumbnail" />
					</div>
                </div>

                <div class="f_cb f_mt25 dn">
					<label class="add_label f_fl"><span class="f_pdl15">简短描述</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_typeset bord_gray">
							<asp:TextBox ID="txtShortDesc" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_pdl15">详细内容</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_typeset bord_gray temp_ temp_0">
							<asp:TextBox ID="txtContent" runat="server" CssClass="text_area tx1" TextMode="MultiLine" Height="400"></asp:TextBox>
						</div>
                        <div class="f_cb add_typeset temp_ temp_1">
                            <NSW:UEditor ID="txtContent01" runat="server"  SimpleMode="true" />
                        </div>
					</div>
				</div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_pdl15">排序</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
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
					    <div class="nsw_check_box">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="chkEnable" Checked="true" CssClass="dn" />
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
            </div>
            <!--其他信息 end-->

            <!--按钮-->
            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15"></span></label>
                <div class="add_r f_fl">
                    <!-- 保存并返回 -->
			        <div class="view_btn f_mt30">
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="Button1" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                        <span class="e_btn1 f_ml35 f_csp fl" runat="server" id="btnDel"><i class="insert_icon"></i><asp:Button ID="Button2" CommandName="del" runat="server" Text="删 除" onclick="btnSubmit_Click" /></span>
                        <span class="e_btn2 f_ml35 f_csp fl"><i class="reset_icon"></i><input type="reset" value="重 填" /></span>
                    </div>
                </div>
            </div>
		</div>
    </form>
</div>

</body>
</html>
