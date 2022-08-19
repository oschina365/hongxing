﻿<%@ page language="C#" autoeventwireup="True" enableeventvalidation="false" enableviewstate="true" maintainscrollpositiononpostback="true" inherits="NSW.Web.Manager.ImportedProjectColumnAttribute, qwt" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <title><%= ItemName %>（<%= OID > 0 ? "Object ID: " + OID : "新建对象" %>）</title>
    <link href="skins/base/editInterface.css" rel="stylesheet" type="text/css" />
    <link href="skins/base/products.css" rel="stylesheet" type="text/css" />
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
<form id="form1" runat="server">
    <div class="f_cb f_pdt20">
	    <label class="add_label f_fl">从分类</label>
	    <div class="add_r f_fl">
		    <div class="f_cb add_sv">
			    <span class="clear_bd s_selt f_fl pt43 f_mr15">
                    <asp:DropDownList ID="ddlColumns" CssClass="pass_faq" runat="server" onchange="$('#hdnSelectedColumn').val($(this).val());$('#btnColumn').click();"></asp:DropDownList>
                    <asp:HiddenField runat="server" ID="hdnSelectedColumn" />
                    <asp:Button runat="server" OnClick="ddlColumns_SelectedIndexChanged" ID="btnColumn" CssClass="dn" CausesValidation="false" />
				    <i class="revise_sub"></i>
			    </span>
		    </div>
	    </div>
    </div>
    <div class="f_cb f_mt25 f_pdb30">
	    <label class="add_label f_fl">导入到</label>
	    <div class="add_r f_fl">
		    <div class="colu_name f_lht27" id="cpmc"><%=QS("title") %></div>
		    <ul class="colu_list f_cb f_mt20" style="height:145px; display:block; overflow-y:auto; width:90%;">
                <asp:Repeater runat="server" ID="RptProjectColumnAttribute"><ItemTemplate>
                <li class="nsw_check_box">
                    <span class="ck_box mt5">
                        <input checked="checked" type="checkbox" name="ids" class="dn" value="<%#Eval("ID") %>" />
                    </span>
                    <label class="ck_text"><%#Eval("Title") %><%#GetTips(Eval("ShortDesc").ToString())%></label>
                </li>
                </ItemTemplate></asp:Repeater>
                <asp:Label runat="server" ID="lab"><li style="width:90%;">无可选属性，请选择其他分类....</li></asp:Label>
		    </ul>
		    <div class="f_mt15 f_lht27 f_cb nsw_check_box">
                <span class="ck_box mt5">
                    <asp:CheckBox runat="server" ID="isTongbu" CssClass="dn" />
                </span>
                <label class="ck_text">覆盖原有的方案属性（将抹除所有记录）</label>
            </div>
		    <div class="view_btn f_mt20">
                <span class="e_btn1 f_csp "><i class="sure_icon marg12_icon" style=" margin-left:12px;"></i><asp:Button ID="btnSave" runat="server" Text="确认导入" onclick="btnSubmit_Click" OnClientClick="return _ValidateForm(this);" /></span>
            </div>
	    </div>
    </div>
</form>
<script type="text/javascript">
    var _ValidateForm = function () {
        var cbx = $("li.nsw_check_box :checked");
        if (!cbx.length) {
            _alert("请选择产品属性！");
            return false;
        }
        return true;
    }
    $(function () {
        SetDraggableLi(".nsw_check_box", "*", "ck_box");
    })
</script>
</body>
</html>
