﻿<%@ page language="C#" autoeventwireup="True" enableeventvalidation="false" enableviewstate="true" inherits="NSW.Web.Manager.Config_Watermark, qwt" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title><%=ItemName %></title>
    <link href="skins/base/gallery.css" rel="stylesheet" type="text/css"/>
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
<form runat="server">
<div class="dialog_content pad20">
	<div class="acce_tile_tab f_cb">
		<ul class="f_cb tab_ul f_fl">
			<li><em class="zline1"></em><em class="zline2"></em>文字水印</li>
            <li class="zon"><em class="zline1"></em><em class="zline2"></em>图片水印</li>
		</ul>						
	</div>
	<div class="acc_cont pad3025 bord_gray f_cb">
        <div class="cont001">
			<div class="water_markimg f_fl"><img src="skins/Img/mark_img.jpg" /></div>
			<div class="water_mark_set f_fr">
				<div class="f_cb f_lht27">
					<label class="com_name f_fl wth85">显示如下文字</label>
					<span class="clear_bd f_fl">
                        <asp:TextBox ID="txtTextWatermarkText" runat="server" CssClass="com_input clear_word wth240"></asp:TextBox>
					    <i class="clear_x"></i>
					</span>
				</div>

                <div class="f_cb f_lht27 f_mt20">
					<label class="com_name f_fl wth85">透明度</label>
					<div class="alpha_set wth195 f_fl" id="alpha_set"><span class="a_block" id="a_block"></span></div>
					<div class="alpha_numb f_fl f_ml20 f_fs2" id="alpha_numb"></div>
                    <asp:HiddenField ID="hdalpha" runat="server" Value="100" />
				</div>

                <div class="f_cb f_lht27 f_mt20">
					<label class="com_name f_fl wth85">显示位置</label>
					<div class="set_radios">
                        <asp:RadioButtonList ID="rbsDisplayPosition" runat="server" RepeatLayout="Flow">
                           <asp:ListItem Value="1">左上</asp:ListItem>
                           <asp:ListItem Value="5">右上</asp:ListItem>
                           <asp:ListItem Value="0">正中</asp:ListItem>
                           <asp:ListItem Value="2">左下</asp:ListItem>
                           <asp:ListItem Value="6" Selected="True">右下</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
				</div>

                <div class="f_cb f_lht27 f_mt20">
					<label class="com_name f_fl wth85">文字水印字体</label>
					<div class="set_selects">
                        <asp:DropDownList runat="server" ID="ddlFonts"></asp:DropDownList>
                    </div>
				</div>

                <div class="f_cb f_lht27 f_mt20">
					<label class="com_name f_fl wth85">文字颜色设置</label>
					<div style=" width:25px; display:inline-block; vertical-align:top;">
                        <asp:TextBox runat="server" ID="txtFontColor" class="color dn" Text="#000000"></asp:TextBox>
                    </div>
                    <label class="com_name ml10 f_vtop">字体大小（磅）</label>
                    <span class="clear_bd s_selt pt43 f_mr15 s_selt_0 w80">
                        <i class="revise_sub"></i>
                        <asp:DropDownList runat="server" ID="ddlFontSize" CssClass="pass_faq">
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>26</asp:ListItem>
                            <asp:ListItem>34</asp:ListItem>
                            <asp:ListItem>50</asp:ListItem>
                            <asp:ListItem>72</asp:ListItem>
                        </asp:DropDownList>
                    </span>
				</div>

                <div class="f_cb f_lht27 f_mt20 f_vtop">
					<label class="com_name f_fl wth85">添加字体阴影</label>
				    <div class="nsw_check_box">
                        <span class="ck_box mt5">
                            <asp:CheckBox runat="server" ID="cbxDrawFontShadow" Checked="false" CssClass="dn" />
                        </span>
                    </div>
                    <label class="com_name ml10 f_vtop">文字阴影颜色 </label>
					<div style=" width:25px; display:inline-block; vertical-align:top;">
                        <asp:TextBox runat="server" ID="txtFontShadowColor" class="color dn" Text="#000000"></asp:TextBox>
                    </div>
				</div>

				<div class="f_cb f_lht27 f_mt20">
					<label class="com_name f_fl wth85">设为默认水印</label>
                    <div class="nsw_check_box">
                        <span class="ck_box mt5">
                            <asp:CheckBox runat="server" ID="cbxWatermarkType" onclick="if(this.checked){$('#cbxWatermarkType1').attr('checked',false).parents('.ck_box').removeClass('z_select');}" Checked="false" CssClass="dn" />
                        </span>
                    </div>
                </div>

			</div>
		</div>
        <div class="cont002">
		    <div class="water_markimg f_fl"><img src="skins/Img/mark_img.jpg"></div>
			<div class="water_mark_set f_fr">
				<div class="f_cb f_lht27" id="img_warp">
					<label class="com_name f_fl wth85">图   片</label>
                    <asp:TextBox runat="server" ID="txtWatermarkImage" class="com_input wth185 e_input clear_word"></asp:TextBox>
					<span class="water_loadbtn f_mt5 f_csp Upload_Clik" input="txtWatermarkImage">上 传</span>
				</div>

				<div class="f_cb f_lht27 f_mt20">
					<label class="com_name f_fl wth85">透明度</label>
					<div class="alpha_set wth195 f_fl" id="alpha_set1"><span class="a_block" id="a_block1"></span></div>
					<div class="alpha_numb f_fl f_ml20 f_fs2" id="alpha_numb1"></div>
                    <asp:HiddenField ID="hdalpha1" runat="server" Value="100" />
				</div>
				<div class="f_cb f_lht27 f_mt20">
					<label class="com_name f_fl wth85">显示位置</label>
					<div class="set_radios">
                        <asp:RadioButtonList ID="rbsDisplayPosition1" runat="server" RepeatLayout="Flow">
                        <asp:ListItem Value="1">左上</asp:ListItem>
                           <asp:ListItem Value="5">右上</asp:ListItem>
                           <asp:ListItem Value="0">正中</asp:ListItem>
                           <asp:ListItem Value="2">左下</asp:ListItem>
                           <asp:ListItem Value="6" Selected="True">右下</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
				</div>

				<div class="f_cb f_lht27 f_mt20">
					<label class="com_name f_fl wth85">设为默认水印</label>
                    <div>
                        <div class="nsw_check_box">
                            <span class="ck_box mt5">
                                <asp:CheckBox runat="server" ID="cbxWatermarkType1" onclick="if(this.checked){$('#cbxWatermarkType').attr('checked',false).parents('.ck_box').removeClass('z_select');}" Checked="false" CssClass="dn" />
                            </span>
                        </div>
                    </div>
				</div>

			</div>
		</div>
    </div>
	<!-- 预览图列表 end-->
	<div class="view_btn f_tac f_mt30">
        <span class="e_btn1 f_csp "><i class="save_icon"></i><asp:Button ID="Button2" runat="server" Text="保 存" onclick="btnSubmit_Click" OnClientClick="return ValidateForm(this);" /></span>
        <span class="e_btn2 f_ml35 f_csp "><i class="viewCancle_icon"></i>取 消</span>
    </div>
</div>
</form>
<script src="js/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="js/common/edit.js" type="text/javascript"></script>
<script src="js/other/jpicker-1.1.6.min.js" type="text/javascript"></script>
<link href="skins/jpicker/jpicker-1.1.6.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    function setdraggable(index) {
        index = index || '';
        var alpha_set = $("#alpha_set" + index);
        var maxLeft = parseInt(alpha_set.width());
        if (!isNaN(maxLeft)) {
            maxLeft = maxLeft - 13;
        } else {
            maxLeft = 182;
        }
        var alpha_numb = $("#alpha_numb" + index);
        var hdalpha = $("#hdalpha" + index);
        $("#a_block" + index).draggable({
            containment: alpha_set,
            scroll: false,
            delay: 0,
            isDrag: true,
            axis: 'h',
            onStopDrag: function (e) {
                var me = $(this);
                me.css("top", "-3px");
                var left = parseInt(me.css("left"));
                if (isNaN(left) || left < 0) {
                    me.css("left", "0px");
                } else if (left > maxLeft) {
                    me.css("left", maxLeft + "px");
                }
                left = parseInt(me.css("left"));
                //alert(left);
                var bfb = Math.round(left / maxLeft * 100);
                alpha_numb.text(bfb + "%");
                hdalpha.val(bfb);
            }
        });
        if (hdalpha.val() == "") {
            hdalpha.val("100");
        }
        var left = parseInt(hdalpha.val()) / 100 * maxLeft;
        $("#a_block" + index).css("left", left);
        var bfb = Math.round(left / maxLeft * 100);
        alpha_numb.text(bfb + "%");
        hdalpha.val(bfb);
    }
    $(function () {
        var lis = $("ul.tab_ul li");
        var cons = $("div.acc_cont > div");
        lis.bind("click", function () {
            cons.hide().eq(lis.index($(this))).show();
            $(this).addClass("zon").siblings(".zon").removeClass("zon");
        }).eq(0).click();
        setdraggable();
        setdraggable(1);
    })
</script>

<script type="text/javascript">
    $(document).ready(
    function () {
        $('.color').jPicker(
        {
            window:
          {
              expandable: true
          }
        });
    });
</script>

</body>
</html>
