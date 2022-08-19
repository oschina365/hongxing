<%@ page language="C#" autoeventwireup="True" enableeventvalidation="false" inherits="NSW.Web.Manager.MobileProduct_column_edit, qwt" enableviewstate="true" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%= ItemName %>（<%= OID > 0 ? "Object ID: " + OID : "新建对象" %>）</title>
    <link href="skins/base/news.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function limitStandardSize(obj, height)     //限制输入手机图片规格的大小
        {
            var basevalue = 150;
            basevalue = typeof height == "undefined" ? 150 : 200;
            var _zz = /^\d+$/;
            if (obj.value != "") {
                if (_zz.test(obj.value)) {
                    if (parseInt(obj.value) > basevalue || parseInt(obj.value) < 0) {
                        alert("请输入0到" + basevalue + "之间的数字");
                        setTimeout(function () {
                            obj.focus();
                        }, 0);
                        return false;
                    }
                } else {
                    alert("只能是整数");
                    setTimeout(function () {
                        obj.focus();
                    }, 0);
                    return false;
                }
            }
            return true;
        }
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
<form id="Form2" runat="server">
<div class="add_cont pad300 j_recordCon_c f_cb">
	<!-- 分类基本属性 -->
	<div class="cont1">
		<div class="f_cb">
			<label class="add_label f_fl">当前分类名称</label>
			<div class="add_r f_fl">
				<div class="f_cb add_sv">
					<span class="f_lht27 p_inp1">
                        <%=ColumnTitle%></span>		
				</div>				
			</div>
		</div>
		<div class="f_cb f_mt25">
			<label class="add_label f_fl">手机图片规格</label>
			<div class="add_r f_fl">	
				<div class="f_cb add_sv">
                    <span class="clear_bd span_max_w50 f_mr10"><asp:TextBox runat="server" onblur="return limitStandardSize(this)"  ID="txtWidth" CssClass="com_input clear_word gid"/><i class="clear_x"></i></span>X<span class="clear_bd span_max_w50 f_ml10"><asp:TextBox runat="server"  onblur="return limitStandardSize(this,'')"  ID="txtHeight" CssClass="com_input clear_word gid"/><i class="clear_x"></i></span>
                    <asp:HiddenField ID="txtWidth1" runat="server" />
                    <asp:HiddenField ID="txtHeight1" runat="server" />
			    </div>
			</div>
		</div>
        <div class="f_cb f_mt25 dn">
			<label class="add_label f_fl"><span class="f_pdl15">显示类型</span></label>
			<div class="add_r f_fl">
				<div class="f_cb add_sv wh_80">
                    <span class="clear_bd s_selt f_fl pt43 f_mr15">
                        <asp:DropDownList ID="ddlMShowDetail" CssClass="pass_faq" runat="server">
                            <asp:ListItem Value="1">缩略图+标题+简介(1行1列)</asp:ListItem>
                            <asp:ListItem Value="2">缩略图+标题+简介(1行2列)</asp:ListItem>
                        </asp:DropDownList>
                        <i class="revise_sub"></i>
					</span>
				</div>
			</div>
		</div>
                
	</div>
	<!-- 分类基本属性 end-->
    <div class="cont1 inpage_box f_dn">
        <div class="model_side model_list_normal ">
			<div class="model_tit"><span class="model_type f_fl"><i></i>模板选择</span></div>
			<div class="model_box">
                <iframe src="nvtemps.aspx?type=product&page=mobilenvtemps" frameborder="no" border="0" marginwidth="0" width="100%" height="100%" marginheight="0" scrolling="no" allowtransparency="yes" id="nvtemps" name="nvtemps"></iframe>
			</div>
            <asp:HiddenField runat="server" ID="hdDiretorie" Value="product01" />
            <asp:HiddenField runat="server" ID="hdPcDiretorie" />
		</div>
    </div>
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
