<#include "common/layout.ftl"/>
<@html title_="武汉红鑫家具联系方式：400-678-5198" css_=["/skins/default/style.css"] >
    <#include "common/tianmao.ftl"/>
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
                            href="/about" title="武汉办公家具厂家">武汉办公家具厂家</a>
                </p>
                <#include "common/category_list.ftl"/>
            </div>
        </div>
        <script src="/js/select2css.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                $('.ban-ss').before($('.topadcs'));
            });
        </script>
        <link href="/skins/default/animate.css" rel="stylesheet" type="text/css" />
        <!--Header:End-->
        <!--Content:Start-->
        <div class="topadcs">
            <a class="fullad" href="/about" title="关于红鑫"
               style="background:url(/res/images/banner5.jpg) no-repeat center top;"></a>
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
                            <input type="text" value="" defvalue="" tips="姓名" required="true" name="contact" />*
                        </li>
                        <li>
                            <span>电 话：</span>
                            <input type="text" value="" defvalue="" tips="电话" name="tel" required="true" />*
                        </li>
                        <li class="inp2">
                            <span>邮 箱：</span>
                            <input type="text" value="" defvalue="" tips="邮箱" name="email" />
                        </li>
                        <li class="inp3">
                            <span>留 言：</span>
                            <textarea defvalue="" name="shortdesc" cols="" rows=""></textarea>
                        </li>
                        <li class="inp4">
                            <span>验证码：</span>
                            <input type="text" value="" defvalue="" tips="验证码" name="verificationCode" required="true" />*
                            <img id="Img1"   onerror="this.src='/captcha/?key=leaveword&codeTime='+new Date().getTime();"
                                 src="/captcha/?key=leaveword"
                                 onclick="this.src='/captcha/?key=leaveword&codeTime='+new Date().getTime();"
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
    </body>
</@html>