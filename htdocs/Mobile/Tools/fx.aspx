<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Mobile.MArticles.fx, qwt" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"
        name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>分享</title>
    <link href="/Mobile/css/skins.css" rel="stylesheet" type="text/css" />
    <link href="/Mobile/Css/common.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .shareWrap
        {
            padding: 0 20px 30px 20px;
        }
        
        .shareWrap .shareText
        {
            color: #666;
            font-size: 14px;
            padding-bottom: 10px;
        }
        
        .shareWrap ul li
        {
            float: left;
            width: 50%;
        }
        
        .shareWrap ul li div
        {
            margin-bottom: 10px;
            display: -moz-box;
            height: 38px;
            line-height: 38px;
            padding: 0 10px;
            vertical-align: top;
        }
        
        .shareWrap ul li .text
        {
            -moz-box-flex: 1;
            color: #000;
            display: block;
            height: 38px;
            overflow: hidden;
        }
        
        .shareWrap ul li i
        {
            display: inline-block;
            vertical-align: top;
        }
        
        .shareWrap ul li .weiboSina .icon
        {
            background-position: 0 0;
        }
        
        
        
        .shareWrap ul li .icon
        {
            background: url("/mobile/images/web/fengx.png") no-repeat;
            height: 32px;
            margin: 6px 10px 0 0;
            width: 32px;
            float: left;
        }
        .shareWrap ul li.weiboSina .icon
        {
            background-position: 0 0;
        }
        
        .shareWrap ul li.weiboQQ .icon
        {
            background-position: 0 -64px;
        }
        
        .shareWrap ul li.spaceQQ .icon
        {
            background-position: 0 -32px;
        }
        .shareWrap ul li.weiboWangyi .icon
        {
            background-position: 0 -96px;
        }
        .shareWrap ul li.weiboSohu .icon
        {
            background-position: 0 -128px;
        }
        
        .shareWrap ul li.friend .icon
        {
            background-position: 0 -160px;
        }
        
        .shareWrap ul li.renren .icon
        {
            background-position: 0 -192px;
        }
        
        .shareWrap ul li.kaixin .icon
        {
            background-position: 0 -224px;
        }
        
        .shareWrap ul li.douban .icon
        {
            background-position: 0 -256px;
        }
        .shareWrap ul li.baishequ .icon
        {
            background-position: 0 -288px;
        }
        .shareWrap ul li.tianya .icon
        {
            background-position: 0 -320px;
        }
        
        .shareWrap ul li.fanfou .icon
        {
            background-position: 0 -352px;
        }
        
        .shareWrap ul li.renjian .icon
        {
            background-position: 0 -384px;
        }
        
        .shareWrap ul li.taojianghu .icon
        {
            background-position: 0 -480px;
        }
        
        
        .shareWrap ul li.hexun .icon
        {
            background-position: 0 -544px;
        }
        
        .shareWrap ul li.diandian .icon
        {
            background-position: 0 -576px;
        }
        
        
        .shareWrap ul li.sinaQingbo .icon
        {
            background-position: 0 -608px;
        }
        .shareWrap ul li.weixin .icon
        {
            background-position: 0 -640px;
        }
    </style>
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
    <div>
        <%
            NVelocity.VelocityContext Context = NVEngine.NVTempHelp.GetVelocityContext();
        %>
        <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Header.html;M_Common/BackPreviousControl.html;M_Common/SearchControl.html")%>
        <!--内容-->
        <div class="shareWrap">
            <p class="shareText">
                请点击分享到相应平台</p>
            <ul>
                <a class="jiathis_button_tsina">
                    <li class="weiboSina">
                        <div>
                            <i class="icon"></i><i class="text">新浪微博</i></div>
                    </li>
                </a><a class="jiathis_button_tqq">
                    <li class="weiboQQ">
                        <div>
                            <i class="icon"></i><i class="text">腾讯微博</i></div>
                    </li>
                </a><a class="jiathis_button_weixin">
                    <li class="weixin">
                        <div>
                            <i class="icon"></i><i class="text">微信</i></div>
                    </li>
                </a><a class="jiathis_button_qzone">
                    <li class="spaceQQ">
                        <div>
                            <i class="icon"></i><i class="text">QQ空间</i></div>
                    </li>
                </a><a class="jiathis_button_xiaoyou">
                    <li class="friend">
                        <div>
                            <i class="icon"></i><i class="text">朋友网</i></div>
                    </li>
                </a><a class="jiathis_button_douban">
                    <li class="douban">
                        <div>
                            <i class="icon"></i><i class="text">豆瓣网</i></div>
                    </li>
                </a><a class="jiathis_button_taobao">
                    <li class="taojianghu">
                        <div>
                            <i class="icon"></i><i class="text">淘江湖</i></div>
                    </li>
                </a><a class="jiathis_button_diandian">
                    <li class="diandian">
                        <div>
                            <i class="icon"></i><i class="text">点点</i></div>
                    </li>
                </a>
            </ul>
            <p class="clear">
            </p>
        </div>
        <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Footer.html")%>
    </div>
    <script type="text/javascript" src="/Mobile/js/Jquery.js"></script>
    <script type="text/javascript" src="/Mobile/js/nsw_mobile.js"></script>
    <script type="text/javascript" src="/Mobile/js/Tools.js"></script>
    <script type="text/javascript">
        var jiathis_config = {
            url: '<%=string.IsNullOrEmpty(NSW.Mobile.MobileConfig.MSiteDomain) ? (string.IsNullOrEmpty(NSW.OConfig.Common.SiteDomain) ? Request.Url.Scheme + "://" + Request.Url.Authority : NSW.OConfig.Common.SiteDomain) : NSW.Mobile.MobileConfig.MSiteDomain%>/Mobile',
            shortUrl: false,
            hideMore: false
        }
    </script>
    <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
</body>
</html>
