<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.site_seo_config, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title><%= ItemName %></title>
    <link href="skins/base/setting.css" rel="stylesheet" type="text/css" />
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
    <form id="form1" runat="server" onsubmit="top.refreshList=true">
        <div class="seo_guide ">
			<ul class="seo_cont f_cb">
                <li class="f_cb">
					<label class="p_name f_fl">网页标题后缀<br /><span></span></label>
					<div class="seo_r f_fl">
						<div class="f_cb"><radio_control:radio_control runat="server" GroupName="addtitlepostfix" ID="rdoAddTitlePostfixYes" Text="是" />
                        <radio_control:radio_control runat="server" GroupName="addtitlepostfix" ID="rdoAddTitlePostfixNo" Text="否" /></div>
					</div>
				</li> 
				<li class="f_cb">
					<label class="p_name f_fl">网页默认标题<br /><span>(Title)</span></label>
					<div class="seo_r f_fl">
						<div class="f_cb"><span class="clear_bd"><asp:textbox id="txtTitlePostfix" runat="server" CssClass="com_input clear_word EnterWords" MaxLength="64"></asp:textbox><i class="clear_x"></i></span><span class="inp_tips_gray pd010 f_ib f_ib_"></span><a href="http://www.nsw88.com/Article/chanpinluruseoxiangg_1.html" target="_blank" class="f_ml10 f_ib f_underline color_orange">不知道怎么填写？</a></div>
					</div>
				</li>
				<li class="f_cb f_mt25">
					<label class="p_name f_fl">网页关键词<br /><span>(Keywords)</span></label>
					<div class="seo_r f_fl">
						<div class="f_cb"><span class="clear_bd"><asp:textbox id="txtDftMetaKwd" runat="server" CssClass="com_input clear_word EnterWords" MaxLength="100"></asp:textbox><i class="clear_x"></i></span><span class="inp_tips_gray pd010 f_ib f_ib_"></span><a href="http://www.nsw88.com/Article/chanpinseoxiangguan-_1.html" target="_blank" class="f_ml10 f_ib f_underline color_orange">不知道怎么填写？</a></div>
					</div>
				</li>
				<li class="f_cb f_mt25">
					<label class="p_name f_fl">网页描述<br /><span>(Description)</span></label>
					<div class="seo_r f_fl">
						<div class="f_cb">
                            <asp:textbox id="txtDftMetaDesp" runat="server" CssClass="seo_descript EnterWords_Decreasing" TextMode="MultiLine" temp="你还可以输<span class='color_orange'>{surplus_length}</span>个字符" MaxLength="250" _maxlength="250"></asp:textbox>
						</div>
						<div class="f_cb f_mt5 f_lht27"><div class="f_fl f_mr10 f_ib_"></div><a href="http://www.nsw88.com/Article/chanpinluruSEOxiangg2_1.html" target="_blank" class="f_fl f_ml10 f_ib f_underline color_orange f_mr20">不知道怎么填写？</a></div>
					</div>
				</li>
			</ul>
            <div class="smtp_btn f_ml145 f_cb"><span class="e_btn1 f_csp f_fl  f_mr30"><i class="save_icon"></i><asp:Button ID="Button1" runat="server" Text="保 存" onclick="btnSubmit_Click" /></span></div>
		</div>
    </form>
</div>
</body>
</html>