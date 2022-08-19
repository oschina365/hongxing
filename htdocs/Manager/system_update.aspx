<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.system_update, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%= ItemName %></title>
    <link href="skins/base/news.css" rel="stylesheet" type="text/css"/>
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
form{text-align:center; padding:30px;}
.errmsg{font:22px/35px 'Microsoft Yahei';color:#f08300; display:block; width:100%; margin-bottom:20px;}
input{width:120px;height:35px;font: 18px/35px 'Microsoft Yahei';color:#FFF;border:1px solid #f08300;border-radius:5px;background:#f08300; cursor:pointer; display:inline-block;}
input:nth-child(2){ margin-left:20px;}
.select{ margin-bottom:30px;margin-left:50%;}
.select .e_radio { display:block; margin-left:-64px;}
</style>
<form runat="server">

    <div id="Updata" runat="server" style="margin-bottom:20px;">
        <div class="errmsg" id="errmsg" runat="server">暂时没有需要更新的....</div>
        <div id="temp" runat="server" visible="false">
            <span class="f_fl f_db e_radio radio" cur="z_select">{0}版本<span class="dn"><input type="radio" name="version" value="{0}" ></span></span>
            <div class="clear"></div>
            <div style=" display:block; width:100%; margin-left:-50%; text-align:left; margin-bottom:10px;">{1}</div>
        </div>
        <div id="select" runat="server" visible="false" class="select"><%=html %><div class="clear"></div></div>
        <div>
            <asp:Button runat="server" ID="btn" Visible="false" Text="更新" onclick="Btn_Click" />
        </div>
    </div>

    <div id="Reduction" runat="server" visible="false">
        <div id="reductionTemp" runat="server" visible="false">
            <span class="f_fl f_db e_radio radio" cur="z_select">{0}<span class="dn"><input type="radio" name="version" value="{1}" ></span></span>
        </div>
        <div id="select01" class="select"><%=reductionHtml%><div class="clear"></div></div>
        <div>
            <asp:Button runat="server" ID="Button1" Text="还原" onclick="Btn02_Click" />
        </div>
    </div>
</form>
<script type="text/javascript">
    $(function () {
        $("span.radio:eq(0)").click();
    })
</script>
</body>
</html>