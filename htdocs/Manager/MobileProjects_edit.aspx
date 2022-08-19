<%@ page language="C#" autoeventwireup="True" enableeventvalidation="false" inherits="NSW.Web.Manager.MobileProjects_edit, qwt" enableviewstate="true" maintainscrollpositiononpostback="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%= ItemName %>（<%= OID > 0 ? "Object ID: " + OID : "新建对象" %>）</title>
    <link href="skins/base/news.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
        var PROD_ED_CURRENT_HIDDEN;
    </script>
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
			<li class="li1"><span class="sp"><em class="zline1"></em><em class="zline2"></em><i class="red_point">*</i>基本属性</span></li>
            <li class="li6"><span class="sp"><em class="zline1"></em><em class="zline2"></em>内页模板管理</span></li>
		</ul>						
	</div>
</div>
<form id="form1" runat="server" onsubmit="top.refreshList=true;">
<div class="add_cont pad300 j_recordCon_c f_cb">
    <!-- 方案基本信息 -->
    <div class="cont1">
	    <div class="f_cb">
		    <label class="add_label f_fl">当前方案标题</label>
		    <div class="add_r f_fl">
			    <div class="f_cb add_sv">
				    <span class="f_lht27 p_inp1 f_cof00">
                        <%=ProductTitle%></span>	
	            </div>			
	        </div>
	    </div>

	    <div class="f_cb f_mt25">
		    <label class="add_label f_fl">方案副标题</label>
		    <div class="add_r f_fl">
			    <div class="f_cb add_sv">
				    <span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word" MaxLength="64" ID="txtMobileTitle" runat="server"></asp:TextBox><i class="clear_x"></i></span>
                    <em class="inp_tips_gray pd010 f_lht27 f_fl f_ib_"></em>
			    </div>			
		    </div>
	    </div>
    
        <div class="f_cb f_mt25">
            <label class="add_label f_fl"><span class="f_pdl15">手机缩略图</span></label>
            <div class="add_r f_fl">
                <div class="colum_onload f_csp f_fl Upload_Clik" input="imgPhotoPath" id="ThumbnailUpload" directory="<%="/Mobile" + NSW.OConfig.Common.UploadedFolderProject%>">
                    <i class="colum_icon"></i>
                    <p class="f_tac f_lht27">点击上传</p>
                </div>
                <asp:HiddenField runat="server" ID="imgPhotoPath" />	
		    </div>
        </div>
    
	    <div class="f_cb f_mt25 dn">
		    <label class="add_label f_fl">手机详细页模板选择</label>
		    <div class="add_r f_fl">
			    <div class="f_cb add_sv">
				    <span class="clear_bd f_fl p_inp1"><asp:TextBox CssClass="com_input clear_word"  MaxLength="64" ID="drpMAgent" runat="server"></asp:TextBox><i class="clear_x"></i></span>
			    </div>			
		    </div>
	    </div>
    
	    <div class="f_cb f_mt25">
		    <label class="add_label f_fl">同步手机端的内容</label>
		    <div class="add_r f_fl">
			    <div class="f_cb add_sv">
				    <span class="f_fl f_db e_radio radio z_select" cur="z_select">同步PC版图文并茂<span class="dn"><input id="rdoCommentableYes_hdRadioButton" type="radio" name="rdoCommentableYes$hdRadioButton" value="TOPCImg"   onclick="initPC2MC(this,<%=OID %>,'tbProject')" /></span></span>
				    <span class="f_fl f_db e_radio radio f_ml10" cur="z_select">同步PC版纯文字<span class="dn"><input id="Radio1" type="radio" name="rdoCommentableYes$hdRadioButton" value="TOPCFont"  onclick="initPC2MC(this,<%=OID %>,'tbProject')" /></span></span>
				    <span class="f_fl f_db e_radio radio f_ml10" cur="z_select">自定义手机端详细内容<span class="dn"><input id="Radio2" type="radio" name="rdoCommentableYes$hdRadioButton" value="TOPCZi"  onclick="initPC2MC(this,<%=OID %>,'tbProject')" /></span></span>
			    </div>			
		    </div>
	    </div>

	    <div class="f_cb f_mt25">
		    <label class="add_label f_fl">同步手机端的内容</label>
		    <div class="add_r f_fl">
                <div style=" width:95%;">
                    <NSW:UEditor runat="server" ID="txtContent" Types="news"/>
                </div>	
		    </div>
        </div>
    </div>
    <div class="cont1 inpage_box f_dn">
        <div class="model_side model_list_normal ">
			<div class="model_tit"><span class="model_type f_fl"><i></i>模板选择</span></div>
			<div class="model_box">
                <iframe src="nvtemps.aspx?type=project&page=mobiledetailedpagetemps" frameborder="no" border="0" marginwidth="0" width="100%" height="100%" marginheight="0" scrolling="no" allowtransparency="yes" id="nvtemps" name="nvtemps"></iframe>
			</div>
            <asp:HiddenField runat="server" ID="hdDiretorie" Value="project01" />
            <asp:HiddenField runat="server" ID="hdPcDiretorie" />
		</div>
    </div>
    <div class="f_cb f_mt25">
        <label class="add_label f_fl"><span class="f_pdl15"></span></label>
        <div class="add_r f_fl">
            <!-- 保存并返回 -->
			<div class="view_btn f_mt30">
                <span class="e_btn1 f_csp fl"><i class="insert_icon"></i><asp:Button ID="btnSave" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
                <span class="e_btn1 f_ml35 f_csp fl" runat="server" id="btnDel"><i class="insert_icon"></i><asp:Button ID="Button2" CommandName="del" runat="server" Text="删 除" onclick="btnSubmit_Click" /></span>
            </div>
        </div>
    </div>
</div>
</form>
<script src="Inc/JS/Mobile.js"></script>
</body>
</html>