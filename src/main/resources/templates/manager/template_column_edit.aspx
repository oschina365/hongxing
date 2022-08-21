<%@ page language="C#" autoeventwireup="True" inherits="NSW.Web.Manager.template_column_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>
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
		</ul>
	</div>
    
	<div class="add_cont pad300 j_recordCon_c f_cb">
	    <!-- 帮助基本信息 -->
        <div class="cont1 settab_lh18">
            <div class="f_cb">
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

			<div class="f_cb f_mt25">
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
				<label class="add_label f_fl"><span class="f_pdl15">所在目录</span></label>
				<div class="add_r f_fl">
					<div class="f_cb add_sv">
						<span class="clear_bd f_fl p_inp1">
                            <asp:TextBox ID="txtType" runat="server" CssClass="com_input clear_word"></asp:TextBox>
                            <i class="clear_x"></i>
                        </span>
					</div>
				</div>
			</div>
<%--
            <div class="f_cb f_mt25">
			    <label class="add_label f_fl">类型</label>
			    <div class="add_r f_fl">
				    <div class="f_cb add_sv">
					    <span class="clear_bd s_selt f_fl pt43 f_mr15">
                            <asp:DropDownList ID="ddlType" CssClass="pass_faq" runat="server">
                                <asp:ListItem Value="product">产品</asp:ListItem>
                                <asp:ListItem Value="news">资讯</asp:ListItem>
                                <asp:ListItem Value="help">帮助</asp:ListItem>
                                <asp:ListItem Value="project">方案</asp:ListItem>
                                <asp:ListItem Value="agent">招商加盟</asp:ListItem>
                                <asp:ListItem Value="other">其他</asp:ListItem>
                            </asp:DropDownList>
						    <i class="revise_sub"></i>
					    </span>
				    </div>
			    </div>
		    </div>
--%>

<%--            
            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">是否为动态模版</span></label>
				<div class="add_r f_fl">
					<div class="nsw_check_box">
                        <span class="ck_box mt5">
                            <asp:CheckBox runat="server" ID="chkDynamicTemplate" Checked="true" CssClass="dn" />
                        </span>
                    </div>
				</div>
			</div>
--%>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">分类描述</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_typeset bord_gray">
                        <asp:TextBox runat="server" TextMode="MultiLine" CssClass="text_area tx1" ID="txtShortDesc"></asp:TextBox>
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
