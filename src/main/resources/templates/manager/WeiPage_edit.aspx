<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.WeiPage_edit, qwt" enableviewstate="false" enableviewstatemac="false" %>
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
    <form id="form2" runat="server" onsubmit="top.refreshList=true;">
        <div class="add_tile_tab f_cb">
		    <ul class="f_cb addtab_ul j_recordCon f_fl w25_">
			    <li><span class="sp"><em class="zline1"></em><em class="zline2"></em><i class="red_point">*</i>基本信息</span></li>
			    <li><span class="sp"><em class="zline1"></em><em class="zline2"></em>SEO搜索引擎设置</span></li>
		    </ul>
	    </div>

	    <div class="add_cont pad300 j_recordCon_c f_cb">

            <div class="cont1 else_info">
				<div class="f_cb">
					<label class="add_label f_fl"><i class="red_point">*</i>推广页名称</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox ID="txtTitle" runat="server" CssClass="com_input clear_word CreatePY" data-src='{"pyid":"txtFileName","type":"vpage"}'></asp:TextBox><i class="clear_x"></i></span>
						</div>
                        <i class="i_shortdesc">给自己新建的推广页起个名字，方便自己区分和查找。</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><i class="red_point">*</i>静态页名称</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="10" ID="txtFileName" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
                            <asp:HiddenField runat="server" ID="hidFileName" />
                            <div class="msg_btn f_fl f_csp GetPY">手动更新</div>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">生成静态页目录</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word" ID="txtDirectory" runat="server"></asp:TextBox><i class="clear_x"></i></span>
						</div>
                        <i class="i_shortdesc">不填写默认为：<asp:Label Text="/Spread/" runat="server" ID="lblDirectory" /></i>
					</div>
				</div>
                
                <div class="f_cb f_mt25">
					<label class="add_label f_fl">网站头部</label>
					<div class="add_r f_fl">
						<div class="f_cb add_sv ">
                            <div class="nsw_check_box">
                                <span class="ck_box mt5">
                                    <asp:CheckBox runat="server" ID="chkHead" Checked="true" CssClass="dn" />
                                </span>
                                <label class="ck_text">是否添加网站头部</label>
                            </div>
						</div>
                        <i class="i_shortdesc">默认是勾选状态，表示添加，不勾选表示制作的网页不添加手机网站头部。</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">网站底部</label>
					<div class="add_r f_fl">
                        <div class="nsw_check_box">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="chkBottom" Checked="true" CssClass="dn" />
                            </span>
                            <label class="ck_text">
                                是否添加网站底部
                            </label>
                        </div>
                        <i class="i_shortdesc">默认是勾选状态，表示添加，不勾选表示制作的网页不添加手机网站底部。</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">在线客服</label>
					<div class="add_r f_fl">
                        <div class="nsw_check_box">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="chkKefu" Checked="true" CssClass="dn" />
                            </span>
                            <label class="ck_text">
                                是否添加在线客服
                            </label>
                        </div>
                        <i class="i_shortdesc">默认是勾选状态，表示添加，不勾选表示制作的网页不添加手机网站底部的在线客服。</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">在线留言</label>
					<div class="add_r f_fl">
                        <div class="nsw_check_box">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="chkLiuYan" Checked="true" CssClass="dn" />
                            </span>
                            <label class="ck_text">
                                是否添加在线留言
                            </label>
                        </div>
                        <i class="i_shortdesc">默认是勾选状态，表示添加，不勾选表示制作的网页不添加.默认是添加在网页内容的底部。</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">备注</label>
					<div class="add_r f_fl">
						<div class="f_cb add_typeset bord_gray">
                            <asp:TextBox CssClass="text_area tx1" MaxLength="500" ID="txtShortDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
							<div class="add_short_tit add_typeset_tit f_cb"><span class="f_fl f_underline">自动排版</span></div>
						</div>
                        <i class="i_shortdesc">默认是勾选状态，表示添加，不勾选表示制作的网页不添加手机网站底部。</i>
					</div>
				</div>

                <div class="f_cb f_mt25">
					<label class="add_label f_fl">推广页内容</label>
					<div class="add_r f_fl">
						<div style="width:95%;">
                            <NSW:UEditor runat="server" ID="txtContent"  Directory="News"/>
                        </div>
					</div>
				</div>

            </div>

            <div class="cont1 seo_settab f_dn">
                <div class="f_cb dn">
					<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页核心关键字</span></label>
					<div class="add_r f_fl">
						<div class="f_cb">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="64" ID="txtTitleKeyword" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
						</div>		
					</div>
				</div>
                <div class="f_cb">
					<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页标题<br /><span>(Title)</span></span></label>
					<div class="add_r f_fl">
						<div class="f_cb">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="64" ID="txtPageTitle" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
						</div>		
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页关键词<br /><span>(Keywords)</span></span></label>
					<div class="add_r f_fl">
						<div class="f_cb">
							<span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="100" ID="txtMetaKeyword" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                            <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
						</div>		
					</div>
				</div>
                <div class="f_cb f_mt25">
					<label class="add_label f_fl"><span class="f_ldb f_pdl15">网页描述<br /><span>(Description)</span></span></label>
					<div class="add_r f_fl">
                        <div class="f_cb seo_area f_fl">
                            <asp:TextBox CssClass="seo_descript" MaxLength="150" ID="txtMetaDescription" runat="server" TextMode="MultiLine" style=" resize:none; line-height:20px; padding-top:5px;"></asp:TextBox>
							<div class="f_cb f_mt5 f_lht27 f_tar"><span class="inp_tips_gray f_ib"></span></div>
						</div>
					</div>
				</div>

                <div class="f_cb f_mt25">
                    <label class="add_label f_fl"><span class="f_ldb f_pdl15">排序</span></label>
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
