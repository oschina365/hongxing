<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.ProjectAttributeColumn, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
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
<style>
.color_sidebox{width:95%;}
</style>
<form id="Form1" runat="server">
    <div class="attr_objbox" style=" height:351px; overflow-y:auto;">
	    <div class="f_cb">
		    <label class="add_label f_fl"><span class="f_pdl15">属性名称</span></label>
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
                                <input type="hidden" name="itemID" value="<%#Eval("ID") %>"/>
                                <em class="del_color"></em>
                            </span>
                        </li>
                        </ItemTemplate></asp:Repeater>
				        <li runat="server" id="li">
                            <span>
                                <input type="text" placeholder="填写选项" class="clear_word_org item" />
                                <em class="del_color"></em>
                            </span>
                        </li>
                        <li class="add_color"></li>	 
				    </ul>
                    <asp:HiddenField runat="server" ID="hdValue" Value="" />
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
                <span class="e_btn2 f_ml35 f_csp "><i class="cancel_icon"></i>取 消</span>
            </div>
	    </div>
    </div>
</form>
<script src="js/other/attr_edit.js" type="text/javascript"></script>
</body>
</html>
