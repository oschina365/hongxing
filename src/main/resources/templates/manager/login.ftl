<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="description" content=""/>
        <meta name="keywords" content=""/>
        <title>武汉红鑫办公家具后台管理系统</title>
        <link type="text/css" rel="stylesheet" href="/manager/skins/base/common.css"/>
        <link type="text/css" rel="stylesheet" href="/manager/skins/default/default.css"/>
        <link type="text/css" rel="stylesheet" href="/manager/skins/base/login.css"/>
        <script type="text/javascript" src="/manager/js/easyui/jquery.min.js"></script>
        <script src="/layui/layui.all.js"></script>
        <link rel="stylesheet" href="/layui/css/layui.css">
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
    </head>
    <body>
        <div id="login_wrap">

            <div class="hd_login">
                <div class="header">
                    <h2 class="login_logo"><img src="/uploadfiles/pictures/setting/20161024153605_3011.jpg"/></h2>
                </div>
            </div>
            <div class="login_bg" id="middle">
                <div class="content">
                    <form action="" target="nm_iframe" method="post">
                        <span class="form_slogan"><img src="/manager/skins/img/welcome.gif"/></span>
                        <span class="username">
                    <input id="name" runat="server" maxlength="20"
                           placeholder="请输入用户名" autocomplete="off" tips="用户名" deltaX="40"/>
                </span>
                        <span class="password">
                    <input id="pwd" runat="server" maxlength="20" type="password"
                           placeholder="请输入密码" autocomplete='off' deltaX="40"/>
                </span>
                        <div class="ver_line">
                            <input id="txtValidCode" runat="server" MaxLength="4" autocomplete='off' class="ver_code"
                                   type="text" tips="验证码" placeholder="请输入验证码"/>
                            <span class="ver_img">
                            <img id="Codes" src="/captcha/?key=managerCode"
                                 onerror="this.src='/captcha/?key=managerCode&codeTime='+new Date().getTime();"
                                 onclick="this.src='/captcha/?key=managerCode&codeTime='+new Date().getTime();"/>
                            </span>
                        </div>
                        <button onclick="login_check();" class="login_btn">登&nbsp;录</button>
                    </form>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>
    </body>
    <script type="text/javascript">
        var winWidth = 0, winHeight = 0;
        $(document).keydown(function (e) {
            if (e.keyCode == 13) {
                login_check();
            }
        });

        function findDimensions() //函数：获取尺寸
        {
            //获取窗口宽度
            if (window.innerWidth) {
                winWidth = window.innerWidth;
            } else if ((document.body) && (document.body.clientWidth)) {
                winWidth = document.body.clientWidth;
            }
            //获取窗口高度
            if (window.innerHeight) {
                winHeight = window.innerHeight;
            } else if ((document.body) && (document.body.clientHeight)) {
                winHeight = document.body.clientHeight;
            }
            //通过深入Document内部对body进行检测，获取窗口大小
            if (document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth) {
                winHeight = document.documentElement.clientHeight;
            }
            document.getElementById("login_wrap").style.height = winHeight + "px";
        }

        findDimensions();
        //调用函数，获取数值
        window.onresize = findDimensions;

        /**
         * 登录检查
         */
        function login_check() {
            layui.use('layer', function () {
                let name = $("#name").val();
                let pwd = $("#pwd").val();
                let txtValidCode = $("#txtValidCode").val();
                if (!name) {
                    layer.alert("请输入用户名", {icon: 5});
                } else if (!pwd) {
                    layer.msg("请输入密码", {icon: 5});
                } else if (!txtValidCode) {
                    layer.msg("请输入验证码", {icon: 5});
                } else {
                    $.ajax({
                        url: '/captcha/check',
                        type: 'post',
                        data: {'key': 'managerCode', 'value': txtValidCode},
                        dataType: 'json',
                        success: function (d) {
                            if (d.code == 1) {
                                $.ajax({
                                    url: '/login',
                                    type: 'post',
                                    data: {'username': name, 'password': pwd},
                                    dataType: 'json',
                                    success: function (d) {
                                        if (d.code == 1) {
                                            layer.msg(d.message ? d.message : "登录成功", {
                                                icon: 6,
                                                time: 1500
                                            }, function () {
                                                location.href = "/manager/index";
                                            });
                                        } else {
                                            layer.msg(d.message ? d.message : "登录失败", {icon: 5});
                                        }
                                    }
                                });
                            } else {
                                layer.msg(d.message ? d.message : "请填写正确的验证码", {icon: 5});
                            }
                        }
                    });
                }
            });
        }
    </script>
</html>
