<%@ page language="C#" autoeventwireup="true" inherits="Mobile_MHelp_BookMark, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>收藏为书签</title>
    <link href="/mobile/css/skins.css" rel="stylesheet" type="text/css" />
    <link href="/mobile/css/help.css" rel="stylesheet" type="text/css" />
    <link href="/mobile/css/common.css" rel="stylesheet" type="text/css" />

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
    <div class="wrap">
        <%
            NVelocity.VelocityContext Context = NVEngine.NVTempHelp.GetVelocityContext();
        %>
        <%=NVEngine.NVTempHelp.LoadNVTemp(Context,"M_Common/Header.html;M_Common/BackPreviousControl.html")%>
        <!--书签 开始-->
        <div class="bookmark">
            <p>
                <span style="color: #0099FF; font-weight: bold;">什么是手机书签？</span><br />
                手机书签是一种手机浏览网页的便捷上网方式，就像IE的收藏夹一样，只要将页面加为书签，下次手机上网时通过打开该书签，即可登陆您已保存为书签的页面。<br>
                <br />
                <span style="color: #0099FF; font-weight: bold;">怎样保存书签？</span><br />
                用手机打开需要保存为书签的页面后，按照对应手机进行以下操作，即可保存书签。<br />
                <br />
                <span style="color: #0099FF;">使用UCWEB浏览器</span><br>
                1.进入书签页面。可通过”菜单>打开>书签”进入书签管理页面，进行添加或编辑书签功能。<br />
                2.在书签管理页面中通过”菜单>导航>加入书签”进入新增书签编辑页面，在”标题”里填写书签的名称;或者直接按快捷键#号键+6后,直接编辑"标题保存当前页面为书签"。<br>
                <span style="color: #0099FF;">诺基亚</span><br>
                1.S40:依次选-功能表-服务(网络)-书签-操作-新书签-确定<br />
                2.S60:依次选-功能表-服务(网络)-选项-新增书签-存储(新增)<br />
                3.通用方法:依次选-选项-存为书签(添加书签)-确认<br />
                <span style="color: #0099FF;">iPhone</span><br>
                点击 中间置底“+”号 &gt; 添加书签 &gt; 点击右上角“存储”<br>
                <span style="color: #0099FF;">HTC</span><br>
                点击 menu键 &gt; 选择添加书签 &gt; 点击 添加<br>
                <span style="color: #0099FF;">摩托罗拉</span><br>
                1.摩托V系列:
                依次选-菜单-访问网络-选择网页设定-选择新条目-确认更改
                <br />
                2.摩托A系列:
                依次选-菜单-访问网络-选择书签-选择书签列表-选择新书签-确定
                <br />
                3.通用方法:
                依次选-菜单-网络-当前页-添加书签-保存<br>
                <span style="color: #0099FF;">三星</span><br>
                1.依次选-功能表-娱乐功能-WAP浏览器-收藏夹-无内容-确定<br />
                2.按#-书签-空-输入网址-储存<br>
                <span style="color: #0099FF;">索爱/NEC</span><br>
                依次选-移动梦网或浏览器-更多-书签-新书签(添加书签)-确定<br>
                <span style="color: #0099FF;">松下/三菱/飞利浦</span><br>
                依次选-菜单选项-访问网络-自定义连接-保存-设为书签-确定-保存<br>
                <span style="color: #0099FF;">其他品牌</span><br>
                点击 选项 &gt; 保存 &gt; 添加书签 &gt; 确定或保存<br>
                <br>
            </p>

        </div>
        <!--书签 结束  -->
        <%=NVEngine.NVTempHelp.LoadNVTemp(Context,"M_Common/Footer.html")%>
    </div>
</body>
<script src="/mobile/JS/Jquery.js"></script>
<script src="/mobile/JS/nsw_mobile.js"></script>
</html>
