<%@ page language="C#" autoeventwireup="True" enableeventvalidation="false" enableviewstate="true" maintainscrollpositiononpostback="true" inherits="NSW.Web.Manager.newsModification, qwt" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title><%= ItemName %></title>
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
<body style="width:700px;">
<form id="form1" runat="server" onsubmit="top.refreshList=true;">
    <div class="f_cb pad020 pro_fast_edit" style=" padding:0 0px 0 20px;">
	    <ul class="pro_fast f_cb">
            <li class="f_cb">
			    <label class="p_name padt5 f_fl">资讯标题</label>
			    <div class="seo_r f_fl">
				    <div class="f_cb">
                        <span class="clear_bd px305 f_fl">
                            <asp:TextBox CssClass="com_input clear_word EnterWords CreatePY" data-src='{"pyid":"txtFileName","type":"news"}' MaxLength="150" ID="txtTitle" runat="server" _required="true" tips="资讯标题"></asp:TextBox>
                            <i class="clear_x"></i>
                        </span>
                        <span class="f_fl f_lht27 inp_tips_gray pd010 f_ib f_ib_"></span>
                        <span class="pd010 f_lht27 f_fl">短标题</span>
                        <asp:TextBox CssClass="com_input clear_word e_input px90 f_fl" MaxLength="15" ID="txtShortTitle" runat="server"></asp:TextBox>
                    </div>
			    </div>
		    </li>
		    <li class="f_cb">
                <label class="p_name padt5 f_fl">静态页名称</label>
			    <div class="seo_r f_fl">
				    <div class="f_cb">
                        <span class="clear_bd px305">
                            <asp:TextBox CssClass="com_input clear_word" MaxLength="64" ID="txtFileName" runat="server" _required="true" tips="资讯标题"></asp:TextBox>
                            <asp:HiddenField runat="server" ID="hidFileName" />
                            <i class="clear_x"></i>
                        </span>
                        <a href="###" class="f_ml10 f_ib f_underline color_orange CheckFile">检查是否存在</a>
                    </div>
			    </div>
		    </li>
		    <li class="f_cb">
                <label class="p_name padt5 f_fl">所属分类</label>
			    <div class="seo_r f_fl">
				    <div class="f_cb add_sv">
					    <span class="clear_bd s_selt f_fl px321 f_mr15">
						    <asp:DropDownList ID="ddlColumns" CssClass="pass_faq" runat="server"></asp:DropDownList>
						    <i class="revise_sub"></i>
					    </span>
				    </div>
			    </div>
		    </li>
		    <li class="f_cb f_mt25">
			    <label class="p_name f_fl">网页标题<br /><span>(Title)</span></label>
			    <div class="seo_r f_fl">
				    <div class="f_cb">
                        <span class="clear_bd px305">
                            <asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="64" ID="txtPageTitle" runat="server"></asp:TextBox>
                            <i class="clear_x"></i>
                        </span>
                        <span class="inp_tips_gray pd010 f_ib f_ib_"></span>
				    </div>
			    </div>
		    </li>
		    <li class="f_cb f_mt25">
			    <label class="p_name f_fl">网页关键词<br /><span>(Keywords)</span></label>
			    <div class="seo_r f_fl">
				    <div class="f_cb">
                        <span class="clear_bd px305 px350">
                            <asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="100" ID="txtMetaKeyword" runat="server"></asp:TextBox>
                            <i class="clear_x"></i>
                        </span>
                        <span class="inp_tips_gray pd010 f_ib f_ib_"></span>
				    </div>
			    </div>
		    </li>
		    <li class="f_cb f_mt25">
			    <label class="p_name f_fl">网页描述<br /><span>(Description)</span></label>
			    <div class="seo_r f_fl">
				    <div class="f_cb">
                        <asp:TextBox CssClass="seo_descript EnterWords_Decreasing" MaxLength="200" ID="txtMetaDescription" runat="server" TextMode="MultiLine" Height="50" style=" resize:none; line-height:20px; padding-top:5px;" temp="{length}/{max_length} 字符"></asp:TextBox>
				    </div>
				    <div class="f_cb f_mt5 f_lht27"><span class="inp_tips_gray f_ib f_ib_"></span></div>
			    </div>
		    </li>
		    <li class="f_cb f_mt25">
			    <label class="p_name padt5 f_fl">关联标签</label>
			    <div class="seo_r f_fl">
				    <div class="f_cb add_sv">
					    <span class="clear_bd f_fl p_inp1 px350">
                            <asp:TextBox CssClass="com_input clear_word EnterWords" MaxLength="100" ID="txtTag" runat="server"></asp:TextBox>
                            <i class="clear_x"></i>
					    </span>
                        <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
                        <div class="selt_mark_btn  f_fl f_csp popUp" data-src='{"popup":"SelectTagPopUp","input":"txtTag"}'>选择标签</div>
				    </div>
			    </div>
		    </li>
	    </ul>
	    <div class="f_cb f_mb35">
	        <div class="seo_r f_fr">
		        <div class="view_btn f_mt10">
                    <span class="e_btn1 f_csp "><i class="sure_icon"></i><asp:Button ID="btnSave" CommandName="return" runat="server" Text="确 定" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                    <span class="e_btn2 f_ml35 f_csp"><i class="cancel_icon"></i>取 消</span>
                </div>
	        </div>
	    </div>
    </div>
</form>
</body>
</html>
