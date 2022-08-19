<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.FriendLink.Apply, qwt" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>友情链接</title>
    <meta name="keywords" content="友情链接" />
    <meta name="description" content="友情链接" />
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
<body class="flinkpage">
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
    <!-- /header -->
    <div class="topadcs">
        <%=NSW.Web.API.SysCommon.GetAdCodeByKeyNameM("firendlink","product_index")%>
    </div>
    <form id="form1" runat="server">
    <div class="content">
        <div class="sp-title" align="right">
            <ul>
                <li class="fr"><a href="Index.aspx" title="查看链接">查看链接</a></li>
                <li class="fl"><a href="apply.aspx" title="申请链接">申请链接</a></li>
            </ul>
        </div>
        <div class="formbox" align="left">
            <table cellspacing="1" cellpadding="3" width="100%" border="0" style="height: 300px;"
                id="tbForm">
                <tr>
                    <td align="center" height="25">
                        <font color='red'>*</font>网&nbsp;&nbsp;&nbsp;&nbsp; 址：
                    </td>
                    <td>
                        <input class="ipt-txt" ID="TxtURL" type="text" size="30" value="http://" name="TxtUrl"
                            maxlength="200" runat="server">
                    </td>
                </tr>
                <tr>
                    <td align="center" height="25">
                        <font color='red'>*</font>网站名称：
                    </td>
                    <td>
                        <input class="ipt-txt" id="TxtName" type="text" size="30" name="TxtName" runat="server"
                            maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td align="center" height="25">
                        链接类型：
                    </td>
                    <td>
                        <select id="TxtType" name="TxtType">
                            <option value="1" selected="true">文字链接</option>
                            <option value="2">图片链接</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="center" height="25">
                        网站Logo：
                    </td>
                    <td>
                        <input class="ipt-txt" id="TxtPhotoPath" type="text" size="30" name="TxtLogo" runat="server"
                            maxlength="200">
                        (110*40 gif或jpg)
                    </td>
                </tr>
                <tr>
                    <td align="center" height="25">
                        网站简况：
                    </td>
                    <td>
                        <textarea class="ipt-txt" id="TxtMsg" name="TxtMsg" rows="4" cols="40" runat="server"
                            max="400"></textarea>
                    </td>
                </tr>
                <tr>
                    <td align="center" height="25">
                        联系人姓名：
                    </td>
                    <td>
                        <input class="ipt-txt" id="TxtUserName" type="text" size="30" name="TxtUserName"
                            maxlength="50" runat="server">
                    </td>
                </tr>
                <tr>
                    <td align="center" height="25">
                        联系电话：
                    </td>
                    <td>
                        <input class="ipt-txt" id="TxtTel" type="text" size="30" name="TxtEmail2" maxlength="50"
                            runat="server">
                    </td>
                </tr>
                <tr>
                    <td align="center" height="25">
                        站长Email：
                    </td>
                    <td>
                        <input class="ipt-txt" id="TxtEmail" type="text" size="30" name="TxtEmail" runat="server"
                            maxlength="200">
                    </td>
                </tr>
                <tr>
                    <td align="center" height="25">
                        联系QQ：
                    </td>
                    <td>
                        <input class="ipt-txt" id="TxtQQ" type="text" size="30" maxlength="20" />
                    </td>
                </tr>
                <tr>
                    <td height="51">
                        &nbsp;
                    </td>
                    <td>
                        <input type="button" class="b13" value="保 存" onclick="AddApply(this)" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" class="b13" value="重 填" onclick="emptyText('tbForm')" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
    <%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
</body>
</html>
