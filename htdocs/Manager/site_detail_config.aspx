<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.site_detail_config, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title><%= ItemName %></title>
    <link href="skins/base/news.css" rel="stylesheet" type="text/css" />
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
<form id="form2" runat="server" onsubmit="top.refreshList=true;">
<%--
<script runat="server" type="text/C#">
    //赋值给前台之后
    protected void SetupObjectAfter() {
        txtOtherkf.Text = NSW.OConfig2.SMTP.OtherLinks;
    }
    //填充到对象、配置之后
    protected void FillObjectAfter()
    {
        NSW.OConfig2.SMTP.OtherLinks = txtOtherkf.Text.Trim();
    }
</script>
--%>
<div class="col_main one_tab_1">
	<div class="add_cont pad300 j_recordCon_c f_cb">
	    <!-- 管理员控制面板设置 -->
        <div class="cont1 settab_lh18">

            <div class="f_cb">
				<label class="add_label f_fl"><span class="f_pdl15">是否启用全站配置目录级</span></label>
				<div class="add_r f_fl">
                    <div class="f_cb add_sv">
					    <radio_control:radio_control ID="rdoIsDirYes" GroupName="IsDir" Text="是" runat="server"/>
                        <radio_control:radio_control ID="rdoIsDirNo" GroupName="IsDir" Text="否" runat="server"/>
                    </div>
                    <i class="i_shortdesc">用于对网站目录层次比较重视的网站,可加上此目录级如 http://www.nsw88.com/Case/cgal.html</i>
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
                <label class="add_label f_fl"><span class="f_pdl15">网站后台LOGO</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
                        <div class="f_fl f_csp upload_img Upload_Clik" id="managerLogoUpload" input="hdManagerLogo"><span><em class="load_small"></em>点击上传</span></div>
                        <asp:HiddenField runat="server" ID="hdManagerLogo" />
                    </div>
                    <i class="i_shortdesc">最好上传PNG图片,但是尺寸不要超过180*75</i>
				</div>
            </div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">上传缩略图文件大小</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd span_max_w50">
                        <asp:textbox id="txtSmallSize" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber"></asp:textbox>
                        <i class="clear_x"></i>
                    </span>
                    【单位：M兆（默认不超过1M）】
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">上传大图文件大小</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd span_max_w50">
                        <asp:textbox id="txtBigSize" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber"></asp:textbox>
                        <i class="clear_x"></i>
                    </span>
                    【单位：M兆（默认不超过2M）】
				</div>
			</div>

            <div class="f_cb f_mt25 dn">
				<label class="add_label f_fl"><span class="f_pdl15">编辑器上传图片文件大小</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd span_max_w50">
                        <asp:textbox id="txtEditSize" validtype="number" runat="server" CssClass="com_input clear_word onlyNumber"></asp:textbox>
                        <i class="clear_x"></i>
                    </span>
                    【单位：M兆（默认不超过2M）】
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">客服电话</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd f_fl p_inp1">
                        <asp:textbox id="txtFindPinServiceTel" runat="server" CssClass="com_input clear_word onlyNumber" reginput="telinfo"></asp:textbox>
                        <i class="clear_x"></i>
                    </span>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">客服QQ1</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd f_fl p_inp1">
                        <asp:textbox id="txtQQ1" validtype="qq" runat="server" CssClass="com_input clear_word onlyNumber"></asp:textbox>
                        <i class="clear_x"></i>
                    </span>
				</div>
			</div>

            <div class="f_cb f_mt25">
				<label class="add_label f_fl"><span class="f_pdl15">客服QQ2</span></label>
				<div class="add_r f_fl">
					<span class="clear_bd f_fl p_inp1">
                        <asp:textbox id="txtQQ2" validtype="qq" runat="server" CssClass="com_input clear_word onlyNumber"></asp:textbox>
                        <i class="clear_x"></i>
                    </span>
				</div>
			</div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">网站备案号</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
                        <span class="clear_bd f_fl p_inp1">
                            <asp:textbox id="txtBeiAn" runat="server" CssClass="com_input clear_word"></asp:textbox>
                            <i class="clear_x"></i>
                        </span>
                    </div>
                    <i class="i_shortdesc">如：粤ICP备09123656号</i>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">新浪微博</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
                        <span class="clear_bd f_fl p_inp1">
                            <asp:textbox id="txtSina" validtype="url_" runat="server" CssClass="com_input clear_word"></asp:textbox>
                            <i class="clear_x"></i>
                        </span>
                    </div>
                    <i class="i_shortdesc">必须写全。如：http://www.weibo.com/niushangwangniu</i>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">腾讯微博</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
                        <span class="clear_bd f_fl p_inp1">
                            <asp:textbox id="txtTX"  validtype="url_" runat="server" CssClass="com_input clear_word"></asp:textbox>
                            <i class="clear_x"></i>
                        </span>
                    </div>
                    <i class="i_shortdesc">必须写全。如：http://t.qq.com/nswyxwz</i>
				</div>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">网站面包屑导航前缀</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_sv">
                        <span class="clear_bd f_fl p_inp1">
                            <asp:textbox id="txtRename" runat="server" CssClass="com_input clear_word"></asp:textbox>
                            <i class="clear_x"></i>
                        </span>
                    </div>
                    <i class="i_shortdesc">如：牛商网</i>
				</div>
            </div>

             <div class="border_ f_mt20 f_mb10">
                <i></i><span class="f_csp">统计工具和客服工具的代码</span>
                <b></b>
            </div>

            <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">统计工具</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_typeset bord_gray">
						<asp:TextBox ID="txtOtherTongji" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
					</div>
                    <i class="i_shortdesc">百度统计，CNZZ，等JS代码</i>
				</div>
            </div>

             <div class="f_cb f_mt25">
                <label class="add_label f_fl"><span class="f_pdl15">客服工具</span></label>
                <div class="add_r f_fl">
                    <div class="f_cb add_typeset bord_gray">
						<asp:TextBox ID="txtOtherkf" runat="server" CssClass="text_area tx1" TextMode="MultiLine"></asp:TextBox>
					</div>
                    <i class="i_shortdesc">EC，等JS代码</i>
				</div>
            </div>
<%--
            <asp:HiddenField runat="server" ID="hdOtherConfig" />
            <asp:TextBox runat="server" ID="txtOther"></asp:TextBox>
--%>
        </div>
        <!--管理员控制面板设置 end-->

        <!--按钮-->
        <div class="f_cb f_mt25">
            <label class="add_label f_fl"><span class="f_pdl15"></span></label>
            <div class="add_r f_fl">
                <!-- 保存并返回 -->
			    <div class="view_btn f_mt30">
                    <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="Button2" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                </div>
            </div>
        </div>
	</div>
</div>

</form>
</body>
</html>