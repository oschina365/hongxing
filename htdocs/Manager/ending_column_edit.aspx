﻿<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.ending_column_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>

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
    <div class="col_main">
        <div class="add_tile_tab f_cb">
		    <ul class="f_cb addtab_ul addtab_ul_column j_recordCon f_fl">
			    <li class="active li1"><span class="sp"><em class="zline1"></em><em class="zline2"></em><i class="red_point">*</i>基本属性</span></li>
			    <li><span class="sp"><em class="zline1"></em><em class="zline2"></em>其他属性</span></li>
		    </ul>						
	    </div>
    </div>
    <form id="form2" runat="server" onsubmit="top.refreshList=true;">
        <div class="add_cont pad300 j_recordCon_c f_cb">
	        <!-- 分类基本属性 -->
	        <div class="cont1">

		        <div class="f_cb">
			        <label class="add_label f_fl"><i class="red_point">*</i>标　题</label>
			        <div class="add_r f_fl">
				        <div class="f_cb add_sv">
					        <span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTitle" runat="server" CssClass="com_input clear_word EnterWords CreatePY" data-src='{"pyid":"txtFileName","type":"helpcolumn"}' MaxLength="64"></asp:TextBox><i class="clear_x"></i></span><em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
				        </div>				
			        </div>
		        </div>

		        <div class="f_cb f_mt25">
			        <label class="add_label f_fl"><span class="f_pdl15">简短描述</span></label>
			        <div class="add_r f_fl">
						<div class="f_cb add_typeset bord_gray">
                            <asp:TextBox CssClass="text_area tx1" MaxLength="500" ID="txtShortDesc" runat="server" TextMode="MultiLine"></asp:TextBox>	
						</div>
					</div>
		        </div>
							
		        <div class="f_cb f_mt25 dn">
			        <label class="add_label f_fl"><span class="f_pdl15 f_ldb f_lht18">前台列表头<br />部显示描述</span></label>
			        <div class="add_r f_fl">
                        <div>
				            <radio_control:radio_control runat="server" ID="rIsShowDescYes" CssName="f_fl f_db e_radio e_radio2" Text="显示" />
					        <radio_control:radio_control runat="server" ID="rIsShowDescNo" Checked="true" CssName="f_fl f_db e_radio e_radio2" Text="隐藏" />
                        </div>
			        </div>
		        </div>
	        </div>
		    <!-- 分类基本属性 end-->

            <!--其他属性-->
		    <div class="cont1 f_dn">
                
                <div class="f_cb">
                    <label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">排序</span></label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
                            <span class="clear_bd s_selt f_fl pt43 f_mr15" style=" width:50px;">
                                <asp:DropDownList runat="server" CssClass="pass_faq" Width="50" ID="ddlRanking"></asp:DropDownList>
                                <i class="revise_sub"></i>
                            </span>
						</div>			
					</div>
                </div>
				<div class="f_cb f_mt25">
					<label class="add_label padt5 f_fl"><span class="f_ldb f_pdl15">选项</span></label>
					<div class="add_r f_fl">
						<div class="nsw_check_box w80">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="chkIsCommend" CssClass="dn" />
                            </span>
                            <label class="ck_text">推荐</label>
                        </div>	
                        <div class="nsw_check_box w80">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="chkIsBest" CssClass="dn" />
                            </span>
                            <label class="ck_text">精华</label>
                        </div>	
                        <div class="nsw_check_box w80">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="chkIsTop" CssClass="dn" />
                            </span>
                            <label class="ck_text">置顶</label>
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
            <!--其他属性 end-->

            <!--按钮-->
            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15"></span></label>
                <div class="add_r f_fl">
                    <!-- 保存并返回 -->
			        <div class="view_btn f_mt30">
                        <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="btnSave" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);"/></span>
                        <span class="e_btn1 f_ml35 f_csp fl" runat="server" id="btnDel"><i class="insert_icon"></i><asp:Button ID="Button2" CommandName="del" runat="server" Text="删 除" onclick="btnSubmit_Click" /></span>
                    </div>
                </div>
            </div>
            <!--按钮 end-->
	    </div>
    </form>
</body>
</html>
