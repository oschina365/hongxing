<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Private.Favorite, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title>无标题页</title>
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
<div class="fav">
    <h4>
        <a class="close3" href="javascript:void(0)" onclick="closeTopLayer('div_fav_cntr')"><img src="<%= SkinPath %>img/close3.gif" alt="关闭" /></a>
        收藏
    </h4>
    <table>
        <tr>
            <th>* 标题：</th>
            <td><input type="text" size="20" id="txtTitle" /></td>
        </tr>
        <tr>
            <th>* 分类：</th>
            <td><select id="ddlCats"><%= GetFavoriteColumnHtml() %></select></td>
        </tr>
        <tr>
            <th>&nbsp;</th>
            <td>
                <input type="button" class="b15" value="收藏" onclick="addFav(this,$qs('title'),$qs('url'),$j('ddlCats').val())" />
                <a href="/user/MyFavorites.aspx" target="_blank" class="u">收藏夹</a>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
<%= ScriptCode %>
<script type="text/javascript">
    $j("txtTitle").val($qs("title"));
</script>