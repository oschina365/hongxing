<#include "common/layout.ftl"/>
<@html title_="在线留言,武汉办公家具,武汉办公家具厂家,办公桌椅,办公屏风,红鑫办公家具">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>
            在线留言,武汉办公家具,武汉办公家具厂家,办公桌椅,办公屏风,红鑫办公家具
        </title>
        <meta name="keywords" content="红鑫家具联系方式,红鑫家具联系电话,武汉办公家具,办公家具公司,办公家具网,红鑫办公家具" />
        <meta name="description"
              content="红鑫家具24小时服务热线：400-678-5198，主营：大班台,办公屏风,办公桌,会议桌,办公椅,电脑椅,文件柜,前台,沙发,茶几等产品。展厅地址：武汉市光谷大道未来之光6栋1-3楼" />
        <!-- hongxin.com.cn/Mobile Baidu tongji analytics -->
        <script>
            var _hmt = _hmt || [];
            (function () {
                var hm = document.createElement("script");
                hm.src = "https://hm.baidu.com/hm.js?25e431cff63a206eb286efd246de5f2d";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
        </script>
        <script type="text/javascript">
            SKIN_PATH = "/Skins/default/";
        </script>
        <link href="http://www.hongxin.com.cn/Skins/default/resetcommon.css" rel="stylesheet" type="text/css" />
        <link href="http://www.hongxin.com.cn/Skins/default/Style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="http://www.hongxin.com.cn/JS/NSW_JCIA.js"></script>
    </head>
    <body>
        <!--Header:Start-->
		<#include "common/pfb.ftl" />
		<#include "common/g_top.ftl" />

        <div class="ban-ss">
            <div class="banan-t content">
                <p>
                    <b>热门搜索词：</b>
                    <a href="/helps/aboutus.html" title="武汉红鑫家俱">武汉红鑫家俱</a>
                    <a href="/product/"
                       title="武汉红鑫办公家具">武汉红鑫办公家具</a>
                    <a
                            href="/helps/aboutus.html" title="武汉办公家具厂家">武汉办公家具厂家</a>
                </p>
                <#include "common/category_list.ftl"/>
            </div>
        </div>
        <script src="/JS/select2css.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                $('.ban-ss').before($('.topadcs'));
            });
        </script>
        <link href="/Skins/Default/animate.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            initCommonHeader();
            var MARK = "help";
            var SID = "0001";

            $(function () {
                $(".menu ul.ul_col li").hover(function () {
                    $(this).css("zIndex", "10000").children(".erji").show();
                    $(this).addClass("cur").siblings("li").removeClass("cur");
                }, function () {
                    $(this).children(".erji").hide();
                    $(this).removeClass("cur")
                });
            });

            $(function () {
                $(".pfb ul.fb_ul li").hover(function () {
                    $(this).css("zIndex", "10000").children(".erji").show();
                    $(this).addClass("cur").siblings("li").removeClass("cur");
                }, function () {
                    $(this).children(".erji").hide();
                    $(this).removeClass("cur")
                });
            });
        </script>
        <!--Header:End-->
        <!--Content:Start-->
        <div class="topadcs">
            <a class="fullad" href="/helps/aboutus.html" title="关于红鑫"
               style="background:url(/uploadfiles/pictures/others/20171215112810_8713.jpg) no-repeat center top;"></a>
        </div>
        <div class="content">
			<#include "common/a_nav.ftl" />
            <div class="clear"></div>
            <script type="text/javascript">
                $(".a_nav ul.clearfix li:last").addClass("cur");
                //二级导航
                $(function () {
                    $(".a_nav .erc").parent().hover(function () {
                        $(this).css("zIndex", "100").children(".erc").show();
                    }, function () {
                        $(this).css("zIndex", "0");
                        $(this).children(".erc").hide(300);
                    });
                });
            </script>

            <div class="plc">
                <span>当前位置：</span>
                <a href="/" title="首页">首页</a>
                &raquo;
                <a href="/help/" title="红鑫帮助中心">红鑫帮助中心</a>
                &raquo;
                在线留言

            </div>
            <div class="temp_on_inp">
                <div class="temp_on_con fr form" id="leaveword1">
                    <h3>在线留言<span>online message</span>
                    </h3>
                    <ul>
                        <li class="inp1">
                            <span>姓 名：</span>
                            <input type="text" value="" defvalue="" tips="姓名"
                                   required="true" name="contact" />*
                        </li>
                        <li>
                            <span>电 话：</span>
                            <input type="text" value="" defvalue="" tips="电话" name="tel"
                                   required="true" />*
                        </li>
                        <li class="inp2">
                            <span>邮 箱：</span>
                            <input type="text" value="" defvalue="" tips="邮箱"
                                   name="email" />
                        </li>
                        <li class="inp3">
                            <span>留 言：</span>
                            <textarea defvalue="" name="shortdesc" cols=""
                                      rows=""></textarea>
                        </li>
                        <li class="inp4">
                            <span>验证码：</span>
                            <input type="text" value="" defvalue="" tips="验证码"
                                   name="verificationCode" required="true" />*
                            <img id="Img1"   onerror="this.src='/captcha/?key=leaveword&codeTime='+new Date().getTime();"
                                 src="/captcha/?key=leaveword"
								 onclick="this.src='/captcha/?key=managerCode&codeTime='+new Date().getTime();"
                                 style="cursor: pointer;" alt="验证码" />
                        </li>
                        <li class="inp5">
                            <input type="button" class="onb1 submit" />
                            <input type="button" class="onb2 reset" />
                        </li>
                    </ul>
                </div>
            </div>
            <script type="text/javascript">
                $(function () {
                    loadJs("/js/Validation.js", function () {
                        new Validation("#leaveword1", "SendLeaveword", false, false, {title: "在线留言"});
                    });
                });
            </script>

        </div>
        <!--Content:End-->
        <!--Footer:Start-->
        <script type="text/javascript">
            $(".bot-t a:last").addClass("none");
        </script>

        <div id="roll" style="display: block;">
            <div title="回到顶部" id="roll_top"></div>
        </div>
        <!--[if IE 6]>
        <script src="/JS/DD_belatedPNG_0.0.8a.js" type="text/javascript"></script>
        <script type="text/javascript">
            DD_belatedPNG.fix('*');
        </script>
        <![endif]-->
        <script src="/JS/rollup.min.js" type="text/javascript"></script>

        <script type="text/javascript" src="http://p.qiao.baidu.com/cps/chat?siteId=3552126&userId=2186107"
                defer="defer"></script>
        <script type="text/javascript" src="http://lead.soperson.com/3552126/2186107.js" defer="defer"
                style="display:none;"></script>
        <script type="text/javascript" src="http://lead.soperson.com/3552126/2186107.js"></script>
        <script type="text/javascript" src="http://lead.soperson.com/3552126/2186107.js"></script>
        <!--Footer:End-->
    </body>
</@html>