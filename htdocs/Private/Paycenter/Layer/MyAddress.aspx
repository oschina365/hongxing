<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Paycenter.Layer.User_MyAddress, qwt" enableviewstate="true" enableviewstatemac="false" %>
<%@ Register Assembly="OranChinaRegion" Namespace="Oran.WebControl" TagPrefix="chinaRegion" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>会员中心首页</title>
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
<div class="pop_addr">
<div class="bord">
<div class="cont">
<asp:Repeater runat="server" ID="rpt"><ItemTemplate><table>
    <tr>
        <td class="tr">收货人：</td>
        <td><span name="chnName"><%# Eval("ChnName") %></span></td>
    </tr>
    <tr>
        <td class="tr">详细地址：</td>
        <td>
            <span name="province"><%# Eval("Province") %></span>
            <span name="city"><%# Eval("City") %></span>
            <span name="address"><%# Eval("Address") %></span>
            <%# Eval("ZipCode").ToString().Length > 0 ? string.Format("[邮编：<span name='zipCode'>{0}</span>]", Eval("ZipCode")) : string.Empty %>
        </td>
    </tr>
    <tr>
        <td class="tr">详细电话：</td>
        <td><%# Eval(TEL_COLUMN_TITLE) %></td>
    </tr>
    <tr>
        <td class="tr">电子邮箱地址：</td>
        <td><span name="email"><%# Eval("Email") %></span></td>
    </tr>
    <tr>
        <td colspan="2"><input type="button" value="选择该地址" onclick="setMyAddr(this)" class="b34" /></td>
    </tr>
</table>
<%# (Container.ItemIndex + 1) != RepeaterItemCount ? "<div class=\"line\">dd</div>" : string.Empty %>
</ItemTemplate></asp:Repeater>
</div>
</div>
</div>
</body>
</html>