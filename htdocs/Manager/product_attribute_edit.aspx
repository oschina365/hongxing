<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.product_attribute_edit, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title><%= ItemName %>（<%= OID > 0 ? "Object ID: " + OID : "新建对象" %>）</title>
    <link href="skins/base/products.css" rel="stylesheet" type="text/css"/>
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
    <form runat="server">
        <div class="attr_objbox">
            <div class="add_cont pad300 f_cb">
                <!-- 产品基本信息 -->
                <div class="cont1">
	                <div class="f_cb">
		                <label class="add_label f_fl"><span class="f_pdl15"><i class="red_point">*</i>属性名称</span></label>
		                <div class="add_r f_fl">
			                <div class="f_cb add_sv">
				                <span class="clear_bd f_fl p_inp3">
                                    <asp:TextBox CssClass="com_input clear_word" MaxLength="64" ID="txtTitle" runat="server"></asp:TextBox>
                                    <i class="clear_x"></i>
                                </span>
			                </div>
		                </div>
	                </div>

	                <div class="f_cb f_mt25">
		                <label class="add_label f_fl"><span class="f_pdl15">属性类型</span></label>
		                <div class="add_r f_fl">
			                <div id="attributetype" class="f_cb f_lht27 e_radio_box">
                                <radio_control:radio_control runat="server" ID="IsTextBox" Checked="true" Text="文本框"/>
                                <radio_control:radio_control runat="server" ID="IsTextarea" Text="多行文本框"/>
                                <radio_control:radio_control runat="server" ID="IsRadioButtonList" Text="单选框"/>
                                <radio_control:radio_control runat="server" ID="IsCheckBoxList" Text="多选框"/>
                                <radio_control:radio_control runat="server" ID="IsDropDownList" Text="下拉框"/>
			                </div>
                            <!-- 文本框 --> 
                            <div class="color_sidebox">
				                <i class="tri tri1"></i>
				                <div class="color_tx1">
					                <div class="color_tips1">简短描述</div>
                                    <asp:TextBox CssClass="color_area1" MaxLength="64" ID="txtShortDesc" runat="server" placeholder="请在此输入文字" TextMode="MultiLine"></asp:TextBox>
				                </div>
			                </div>

			                <!-- 单选框 -->			 				
		                    <div class="color_sidebox sidebox">
				                <i class="tri tri2"></i>
				                <ul class="color_box f_cb ">
                                    <asp:Repeater runat="server" ID="valuesRpt"><ItemTemplate>
                                    <li>
                                        <span>
                                            <input type="text" name="item" placeholder="填写选项" value="<%#Eval("Title") %>" class="clear_word_org item" />
                                            <input type="hidden" name="itemID" value="<%#Eval("ID") %>" />
                                            <em class="del_color"></em>
                                        </span>
                                    </li>
                                    </ItemTemplate></asp:Repeater>
				                    <li runat="server" id="li">
                                        <input type="text" placeholder="填写选项" class="clear_word_org item" />
                                        <input type="hidden" name="itemID" value="-1" />
                                        <em class="del_color"></em>
                                    </li>
                                    <li class="add_color"></li>	 
				                </ul>
                                <asp:HiddenField runat="server" ID="hdValue" Value="" />
			                </div>
		                </div>
	                </div>

                    <div class="f_cb f_mt25">
                        <label class="add_label f_fl"><span class="f_pdl15">属性标识</span></label>
                        <div class="add_r f_fl">
                            <div class="f_cb add_sv">
							    <span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="64" ID="txtPhotoName" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                                <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
						    </div>
                        </div>
                    </div>

                    <div class="f_cb f_mt25 dn">
                        <label class="add_label f_fl"><span class="f_pdl15">缩略图</span></label>
                        <div class="add_r f_fl">
                            <div class="f_cb add_sv">
						        <div class="f_fl f_csp upload_img Upload_Clik" input="hdPhotoPath" id="ThumbnailUpload" directory="Product"><span><em class="load_small"></em>点击上传</span></div>
                                <asp:HiddenField runat="server" ID="hdPhotoPath" />
                            </div>
                            <i class="i_shortdesc"></i>
					    </div>
                    </div>

                    <div class="f_cb f_mt25">
                        <label class="add_label f_fl"><span class="f_pdl15">排序</span></label>
					    <div class="add_r f_fl">
						    <div class="f_cb f_lht27">
                                <span class="clear_bd s_selt f_fl pt43 f_mr15 span_max_w50">
                                    <asp:DropDownList runat="server" CssClass="pass_faq" ID="ddlRanking"></asp:DropDownList>
                                    <i class="revise_sub"></i>
                                </span>
						    </div>
					    </div>
                    </div>

                    <div class="f_cb f_mt25">
                        <label class="add_label f_fl"><span class="f_pdl15">选项</span></label>
					    <div class="add_r f_fl">
						    <div class="nsw_check_box w80">
                                <span class="ck_box mt5">
                                    <asp:CheckBox runat="server" ID="chkIsCommend" CssClass="dn" />
                                </span>
                                <label class="ck_text">推荐</label>
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
                        <label class="add_label f_fl"><span class="f_pdl15">录入时间</span></label>
					    <div class="add_r f_fl">
                            <div class="f_cb controls_calendar">
                                <asp:TextBox CssClass="com_input clear_word calendar_tx f_fl" MaxLength="16" ID="txtInputTime" runat="server"></asp:TextBox><i class="calendar_icon f_fr f_csp"></i>
						    </div>
					    </div>
                    </div>

                </div>
            </div>
            <div class="f_cb f_mt25">
	            <label class="add_label f_fl"><span class="f_pdl15"></span></label>
	            <div class="add_r f_fl">
		            <!-- 保存并返回 -->
		            <div class="view_btn">
                        <asp:TextBox runat="server" ID="hdValueList" CssClass="dn"></asp:TextBox>
                        <asp:TextBox runat="server" ID="hdTxtValues" CssClass="dn"></asp:TextBox>
                        <span class="e_btn1 f_csp "><i class="insert_icon marg12_icon"></i><asp:Button ID="btnSave" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return _ValidateForm(this);" /></span>
<%--                        <span class="e_btn2 f_ml35 f_csp"><i class="reset_icon"></i><input type="reset" value="重 填" /></span>--%>
                    </div>
	            </div>
            </div>
        </div>
    </form>
</div>
<script src="js/other/attr_edit.js" type="text/javascript"></script>
</body>
</html>
