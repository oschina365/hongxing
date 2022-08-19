<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.job_column_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%= ItemName %>（<%= OID > 0 ? "Object ID: " + OID : "新建对象" %>）</title>
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
<link href="skins/base/news.css" rel="stylesheet" type="text/css"/>
<body>

<CurrentPosition:CurrentPosition runat="server" ID="currentPosition"/>
<div class="col_main">
    <form id="form2" runat="server" onsubmit="top.refreshList=true;">
    <div class="add_tile_tab f_cb">
		<ul class="f_cb addtab_ul j_recordCon f_fl w100">
			<li class="active li1"><span class="sp"><em class="zline1"></em><em class="zline2"></em><i class="red_point">*</i>基本属性</span></li>
            <li><span class="sp"><em class="zline1"></em><em class="zline2"></em>搜索引擎优化</span></li>
			<li class="li6"><span class="sp"><em class="zline1"></em><em class="zline2"></em>其它属性</span></li>
		</ul>
	</div>
    
	<div class="add_cont pad300 j_recordCon_c f_cb">
	    <!-- 帮助基本信息 -->
        <div class="cont1 settab_lh18">
            <div class="f_cb dn">
			    <label class="add_label f_fl"><i class="red_point">*</i>上级分类</label>
			    <div class="add_r f_fl">
				    <div class="f_cb add_sv">
					    <span class="clear_bd s_selt f_fl pt43 f_mr15">
                            <asp:DropDownList ID="ddlMenus" CssClass="pass_faq" runat="server"></asp:DropDownList>
						    <i class="revise_sub"></i>
					    </span>
				    </div>
			    </div>
		    </div>

			<div class="f_cb">
				<label class="add_label f_fl"><i class="red_point">*</i>分类名称</label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1">
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="com_input clear_word"></asp:TextBox>
                            <i class="clear_x"></i>
                        </span>
					</div>
				</div>
			</div>

            <div class="f_cb f_mt25">
			    <label class="add_label f_fl"><span class="f_pdl15">外部链接</span></label>
			    <div class="add_r f_fl">
				    <div class="f_cb add_sv f_lht27">
                        <radio_control:radio_control runat="server" ID="rurlNo" Checked="true" CssName="f_fl f_db e_radio e_radio2" onclick="initTabCut(0);$('#url_warp').hide().find('input').val('');" Text="不存在" />
					    <radio_control:radio_control runat="server" ID="rurlYes" CssName="f_fl f_db e_radio e_radio2" Text="存在" onclick="initTabCut(1);$('#url_warp').show()" />
                        <span class="clear_bd f_fl p_inp1" id="url_warp"><asp:TextBox ID="txtURL" validtype="url_" tipPosition="top" runat="server" CssClass="com_input clear_word" MaxLength="64"></asp:TextBox><i class="clear_x"></i></span>
				    </div>
			    </div>
		    </div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">分类描述</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_editor ">
                        <NSW:UEditor runat="server" ID="txtShortDesc" Height="200" />
				    </div>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">显示招聘<br />详细内容</span></label>
				<div class="add_r f_fl">
					<div class="nsw_check_box">
                        <span class="ck_box mt5">
                            <asp:CheckBox runat="server" ID="chkShowDetail" CssClass="dn" />
                        </span>
                    </div>
				</div>
			</div>

        </div>
        <!--其他信息 end-->

        <div class="cont1 seo_settab f_dn">
            <div class="f_cb dn">
				<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页核心关键字</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="64" ID="txtTitleKeyword" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                        <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
					</div>		
				</div>
			</div>
            <div class="f_cb">
				<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页标题<br /><span>(Title)</span></span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="64" ID="txtPageTitle" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                        <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
                        <a href="http://www.nsw88.com/Article/chanpinluruseoxiangg_1.html" target="_blank" class="f_ml10 f_ib f_underline color_orange f_lht27">不知道怎么填写？</a>
					</div>		
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页关键词<br /><span>(Keywords)</span></span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="100" ID="txtMetaKeyword" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                        <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
                        <a href="http://www.nsw88.com/Article/chanpinseoxiangguan-_1.html" target="_blank" class="f_ml10 f_ib f_underline color_orange f_lht27">不知道怎么填写？</a>
					</div>		
				</div>
			</div>
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页描述<br /><span>(Description)</span></span></label>
				<div class="add_r f_fl">
                    <div class="f_cb seo_area">
                        <asp:TextBox CssClass="seo_descript EnterWords_Decreasing" MaxLength="250" _maxlength="250" ID="txtMetaDescription" runat="server" TextMode="MultiLine" temp="你还可以输<span class='color_orange'>{surplus_length}</span>个字符"></asp:TextBox>
						<div class="f_cb f_mt5 f_lht27 f_tar"><span class="inp_tips_gray f_ib"></span></div>
					</div>
                    <div class="f_cb f_mt5 f_lht27"><div class="f_fl f_mr10 f_ib_"></div><a href="http://www.nsw88.com/Article/chanpinluruSEOxiangg2_1.html" target="_blank" class="f_fl f_ml10 f_ib f_underline color_orange f_mr20">不知道怎么填写？</a></div>
				</div>
			</div>
        </div>

        <div class="cont1">
           
            <div class="f_cb">
                <label class="add_label f_fl"><span class="f_pdl15">分类缩略图</span></label>
                <div class="add_r f_fl">
					<div class="f_fl f_csp upload_img Upload_Clik" input="hdPhoto" directory="qt"><span><em class="load_small"></em>点击上传</span></div>
                    <asp:HiddenField runat="server" ID="hdPhoto" />	
				</div>
            </div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">栏目默认Icon图片名称</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1 span_max_w50">
                            <asp:TextBox ID="txtPhotoName" runat="server" CssClass="com_input clear_word"></asp:TextBox>
                            <i class="clear_x"></i>
                        </span>
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
        <!--按钮-->
        <div class="f_cb f_mt25">
            <label class="add_label f_fl"><span class="f_pdl15"></span></label>
            <div class="add_r f_fl">
                <!-- 保存并返回 -->
			    <div class="view_btn f_mt30">
                    <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="Button1" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                    <span class="e_btn1 f_ml35 f_csp fl" runat="server" id="btnDel"><i class="insert_icon"></i><asp:Button ID="Button2" CommandName="del" runat="server" Text="删 除" onclick="btnSubmit_Click" /></span>
                </div>
            </div>
        </div>
	</div>
     </form>
</div>
</body>

</html>
