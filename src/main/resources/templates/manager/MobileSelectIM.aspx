<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.MobileSelectIM, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>一键生成手机网站首页</title>
    <meta name="keywords" content="营销型网站,营销型网站建设,深圳网站建设,牛商网,网站托管,网站建设公司" />
    <meta name="description" content="牛商网是深圳营销型网站建设公司,中国营销型网站创始者,营销型网站标准制定者,服务范围营销型网站建设,网站运营托管,网站外包,深圳网站建设等,咨询热线:4000-333-087" />
    <link href="/Mobile/Css/common.css" rel="stylesheet" type="text/css">
    <style>
        td {
            color: #666;
        }

        .pdl17 {
            padding-left: 17px;
            position: relative;
        }

        .pdr28 {
            padding-right: 28px;
            color: #2b6dc9;
        }

        .marl6 {
            margin-right: 6px;
        }

        .mabox {
            border: 1px solid #d7dfe1;
            text-align: center;
            margin: 10px;
        }

        .border {
            border-bottom: 1px solid #d7dfe1;
        }

        .bu {
            color: #f58220;
            padding-left: 24px;
        }

        .picimg {
            border: 1px solid #e5e5e5;
        }

        .prmax {
            position: relative;
            z-index: 1000;
        }

        .button {
            display: block;
            float: left;
            left: 50%;
            margin: 30px 0 0 -240px;
            position: relative;
        }

        .button {
            width: 180px;
            height: 30px;
            line-height: 30px;
            color: #fef4e9;
            background: #0086b6;
            background: -webkit-gradient(linear, left top, left bottom, from(#13b4ea), to(#0086b6));
            background: -moz-linear-gradient(top, #13b4ea, #0086b6);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#13b4ea', endColorstr='#0086b6');
            display: inline-block;
            outline: none;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            padding: .5em 2em .55em;
            text-shadow: 0 1px 1px rgba(0,0,0,.3);
            -webkit-border-radius: .3em;
            -moz-border-radius: .3em;
            border-radius: .3em;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
            box-shadow: 0 1px 2px rgba(0,0,0,.2);
        }

            .button:hover {
                text-decoration: none;
            }

            .button:active {
                position: relative;
                top: 1px;
            }

        .red {
            color: #f00;
            background: #f00;
            box-shadow: 0 0 5px #ddd;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#ff8da2), to(#f00));
            background-image: -webkit-linear-gradient(top, #ff8da2, #f00);
            background-image: -moz-linear-gradient(top, #ff8da2, #f00);
            background-image: -o-linear-gradient(top, #ff8da2, #f00);
            background-image: -ms-linear-gradient(top, #ff8da2, #f00);
            background-image: linear-gradient(top, #ff8da2, #f00);
        }

        .orange {
            color: #FF6100;
            background: #FF6100;
            box-shadow: 0 0 5px #ddd;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#fda975), to(#FF6100));
            background-image: -webkit-linear-gradient(top, #fda975, #FF6100);
            background-image: -moz-linear-gradient(top, #fda975, #FF6100);
            background-image: -o-linear-gradient(top, #fda975, #FF6100);
            background-image: -ms-linear-gradient(top, #fda975, #FF6100);
            background-image: linear-gradient(top, #fda975, #FF6100);
        }

        .yellow {
            color: #e9e103;
            background: #e9e103;
            box-shadow: 0 0 5px #ddd;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#fdfaa3), to(#e9e103));
            background-image: -webkit-linear-gradient(top, #fdfaa3, #e9e103);
            background-image: -moz-linear-gradient(top, #fdfaa3, #e9e103);
            background-image: -o-linear-gradient(top, #fdfaa3, #e9e103);
            background-image: -ms-linear-gradient(top, #fdfaa3, #e9e103);
            background-image: linear-gradient(top, #fdfaa3, #e9e103);
        }

        .green {
            color: #00ff00;
            background: #00ff00;
            box-shadow: 0 0 5px #ddd;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#c7ffc7), to(#00ff00));
            background-image: -webkit-linear-gradient(top, #c7ffc7, #00ff00);
            background-image: -moz-linear-gradient(top, #c7ffc7, #00ff00);
            background-image: -o-linear-gradient(top, #c7ffc7, #00ff00);
            background-image: -ms-linear-gradient(top, #c7ffc7, #00ff00);
            background-image: linear-gradient(top, #c7ffc7, #00ff00);
        }

        .cyan {
            color: #00ffff;
            background: #00ffff;
            box-shadow: 0 0 5px #00ffff;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#7dfdfd), to(#00ffff));
            background-image: -webkit-linear-gradient(top, #7dfdfd, #00ffff);
            background-image: -moz-linear-gradient(top, #7dfdfd, #00ffff);
            background-image: -o-linear-gradient(top, #7dfdfd, #00ffff);
            background-image: -ms-linear-gradient(top, #7dfdfd, #00ffff);
            background-image: linear-gradient(top, #7dfdfd, #00ffff);
        }

        .blue {
            color: #40c6ff;
            background: #40c6ff;
            box-shadow: 0 0 5px #40c6ff;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#87d9fc), to(#40c6ff));
            background-image: -webkit-linear-gradient(top, #87d9fc, #40c6ff);
            background-image: -moz-linear-gradient(top, #87d9fc, #40c6ff);
            background-image: -o-linear-gradient(top, #87d9fc, #40c6ff);
            background-image: -ms-linear-gradient(top, #87d9fc, #40c6ff);
            background-image: linear-gradient(top, #87d9fc, #40c6ff);
        }

        .purple {
            color: #9932CD;
            background: #9932CD;
            box-shadow: 0 0 5px #9932CD;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#d98eff), to(#9932CD));
            background-image: -webkit-linear-gradient(top, #d98eff, #9932CD);
            background-image: -moz-linear-gradient(top, #d98eff, #9932CD);
            background-image: -o-linear-gradient(top, #d98eff, #9932CD);
            background-image: -ms-linear-gradient(top, #d98eff, #9932CD);
            background-image: linear-gradient(top, #d98eff, #9932CD);
        }

        .pink {
            background: #d167c3;
            box-shadow: 0 0 5px #d167c3;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#ffb2f5), to(#d167c3));
            background-image: -webkit-linear-gradient(top, #ffb2f5, #d167c3);
            background-image: -moz-linear-gradient(top, #ffb2f5, #d167c3);
            background-image: -o-linear-gradient(top, #ffb2f5, #d167c3);
            background-image: -ms-linear-gradient(top, #ffb2f5, #d167c3);
            background-image: linear-gradient(top, #ffb2f5, #d167c3);
        }

        #boxgrid h3 {
            CLEAR: both;
            DISPLAY: block;
            FONT-WEIGHT: bolder;
            FONT-SIZE: 14px;
            WIDTH: 100%;
            COLOR: #666;
            HEIGHT: 45px;
        }

        .boxgrid {
            BACKGROUND: #e1e1e1;
            FLOAT: left;
            MARGIN: 8px;
            OVERFLOW: hidden;
            WIDTH: 200px;
            POSITION: relative;
            HEIGHT: 182px;
            border: 1px solid #ccc;
        }

            .boxgrid IMG {
                BORDER-TOP-WIDTH: 0px;
                BORDER-LEFT-WIDTH: 0px;
                LEFT: 0px;
                BORDER-BOTTOM-WIDTH: 0px;
                POSITION: absolute;
                TOP: 0px;
                BORDER-RIGHT-WIDTH: 0px;
            }

        .tagP3 {
            float: right;
            margin-right: 15px;
            margin-top: 12px;
            overflow: hidden;
        }

            .tagP3 .tag_link {
                background: url("/Mobile/images/web/link.png") no-repeat;
                display: block;
                float: left;
                height: 31px;
                margin-right: 12px;
                width: 31px;
            }

                .tagP3 .tag_link:hover {
                    background: url("/Mobile/images/web/link1.png") no-repeat;
                }

            .tagP3 .tag_big {
                background: url("/Mobile/images/web/big.png") no-repeat;
                display: block;
                float: left;
                height: 31px;
                margin-right: 9px;
                width: 31px;
            }

                .tagP3 .tag_big:hover {
                    background: url("/Mobile/images/web/big1.png") no-repeat;
                }

        .picbt {
            height: 55px;
            line-height: 55px;
        }

        #style_switch a {
            background: none repeat scroll 0 0 #FFFFFF;
            border: 1px solid #DDDDDD;
            float: left;
            height: 8px;
            line-height: 100px;
            overflow: hidden;
            width: 8px;
        }
        /*--------------------------*/
        .choose_1 {
            height: 30px;
            line-height: 30px;
            padding-top: 10px;
        }

            .choose_1 li {
                float: left;
                display: inline;
                margin: 0 15px 0 0;
            }

                .choose_1 li span {
                    display: block;
                    float: left;
                    width: 100px;
                    height: 25px;
                    line-height: 25px;
                    text-align: center;
                    cursor: pointer;
                    border-radius: 5px;
                    background: #b6b6b6;
                    position: relative;
                    background-image: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#bdbdbd));
                    background-image: -webkit-linear-gradient(top, #fff, #bdbdbd);
                    background-image: -moz-linear-gradient(top, #fff, #bdbdbd);
                    background-image: -o-linear-gradient(top, #fff, #bdbdbd);
                    background-image: -ms-linear-gradient(top, #fff, #bdbdbd);
                    background-image: linear-gradient(top, #fff, #bdbdbd);
                }

                    .choose_1 li span:hover {
                        top: 2px;
                    }

            .choose_1 .bg {
                color: #fff;
                font-size: 15px;
                font-weight: bold;
                background: #0c6ac2;
                top: 2px;
                background-image: -webkit-gradient(linear, left top, left bottom, from(#13b4ea), to(#0086b6));
                background-image: -webkit-linear-gradient(top, #13b4ea, #0086b6);
                background-image: -moz-linear-gradient(top, #13b4ea, #0086b6);
                background-image: -o-linear-gradient(top, #13b4ea, #0086b6);
                background-image: -ms-linear-gradient(top, #13b4ea, #0086b6);
                background-image: linear-gradient(top, #13b4ea, #0086b6);
            }

        .choose_2 .bg {
            color: #fff;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            border-radius: 3px;
            background: #0086b6;
            border: none;
            background-image: -webkit-gradient(linear, left top, left bottom, from(#13b4ea), to(#0086b6));
            background-image: -webkit-linear-gradient(top, #13b4ea, #0086b6);
            background-image: -moz-linear-gradient(top, #13b4ea, #0086b6);
            background-image: -o-linear-gradient(top, #13b4ea, #0086b6);
            background-image: -ms-linear-gradient(top, #13b4ea, #0086b6);
            background-image: linear-gradient(top, #13b4ea, #0086b6);
        }

        .choose_2 > td {
            width: 160px;
        }

        .choose_2 td table {
            cursor: pointer;
            width: 146px;
            border: 2px dashed #fff;
        }

            .choose_2 td table:hover {
                border: 2px dashed #ddd;
                border-radius: 5px;
            }

        .choose_2 .bg .word {
            color: #fff;
        }

        .choose_3 {
            display: block;
            height: 30px;
            width: 600px;
            padding-top: 10px;
            position: relative;
            z-index: 1000;
        }

            .choose_3 li {
                float: left;
            }

            .choose_3 span {
                display: block;
                width: 45px;
                height: 20px;
                cursor: pointer;
                border-radius: 8px;
                margin-right: 10px;
                margin-left: 5px;
                line-height: 100px;
                overflow: hidden;
                position: relative;
                z-index: 1000;
            }

                .choose_3 span i {
                    display: block;
                    display: none;
                    background-color: rgba(0,0,0,0.3);
                    background: #000;
                    filter: alpha(opacity=30);
                    background: #000;
                    filter: alpha(opacity=30);
                    -moz-opacity: 0.3;
                    -khtml-opacity: 0.3;
                    opacity: 0.3;
                    position: absolute;
                    width: 100%;
                    height: 100%;
                }

                .choose_3 span:hover {
                    top: 2px;
                }

                .choose_3 span.bg {
                    width: 50px;
                    height: 25px;
                    position: relative;
                    top: -4px;
                    border: 2px solid #ddd;
                }

            .choose_3 .bg.red, .choose_3 .bg.orange, .choose_3 .bg.yellow, .choose_3 .bg.green {
                border: 2px solid #fff;
            }

        .max_bg {
            width: 100%;
            height: 100%;
            background: #000;
            filter: alpha(opacity=80);
            -moz-opacity: 0.8;
            -khtml-opacity: 0.8;
            opacity: 0.8;
            position: absolute;
            z-index: 99;
            display: none;
            cursor: pointer;
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
    <div class="max_bg"></div>
    <table width="98%" height="289px;" class="mabox">
        <tr>
            <td width="25%" height="50" align="left" valign="middle" bgcolor="#eff7f9" class="border"></td>
            <td width="75%" align="left" valign="middle" class="border pdl17">
                <i class="bu">请在下面选择手机网站要使用的在线客服控件</i>
            </td>
        </tr>
        <tr>
            <td height="187" align="left" valign="middle" bgcolor="#eff7f9" class="border">选择在线客服：</td>
            <td height="187" align="left" valign="middle" class="border">
                <table width="45%" align="left">
                    <tr class="choose_2" id="IndexModelList">
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form id="Form1" runat="server">
        <a href="#" class="button">确认选择</a>
        <input id="ModelList" type="hidden" />
    </form>
    <script src="/js/Jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            //初始化显示客服控件列表
            InitIMList();
            //保存用户选择的在线客服控件
            $(".button").unbind("click").bind("click", function () {
                SaveIM();
            });
        });

        function ChangeStyle(src) {
            $(src).parent().parent().find("table").css('opacity', '1');
            $(src).parent().parent().find("table").removeClass('bg');
            $(src).addClass('bg').fadeOut;
            $(src).fadeOut().fadeIn();
            $("#ModelList").val($(src).attr("id"));
        }

        //初始化显示客服控件列表
        function InitIMList() {
            $.post("/Mobile/MAjax.ashx?action=GetIMList&t=" + Math.random(),
               function (rsp) {
                   var ModelHtml = "";
                   var models = $(rsp).find("Model");
                   for (var i = 0; i < models.length; i++) {
                       var jCmt = $(models[i]);
                       var ModelName = jCmt.find("IM").text();
                       var ModelImg = jCmt.find("IMImg").text();
                       var list = [];
                       list.push(["<td><table width='100%' onclick=\"ChangeStyle(this)\" id=" + ModelName + "><tr><td align='center' valign='middle'>",
                           "<div class='boxgrid slidedown' > <img class='cover' src='/Mobile/UserControls/IM/" + ModelImg + "' /><p class='picbt'>客服" + eval(i + 1) + "</p>"].join(''));
                       list.push(["</div> </td> </tr><tr><td align='center' valign='middle'><span  class='word'>客服" + eval(i + 1) + ""
                       , "</span></td> </tr></table> </td>"].join(''));
                       list = list.join('');
                       ModelHtml += list;
                   }
                   $("#IndexModelList").empty();
                   $("#IndexModelList").append(ModelHtml);
                   if ($(rsp).find("SelectIM").length > 0) {
                       $("table[id='" + $(rsp).find("SelectIM").text() + "']").parent().parent().find("table").css('opacity', '1');
                       $("table[id='" + $(rsp).find("SelectIM").text() + "']").parent().parent().find("table").removeClass('bg');
                       $("table[id='" + $(rsp).find("SelectIM").text() + "']").addClass('bg').fadeOut;
                       $("table[id='" + $(rsp).find("SelectIM").text() + "']").fadeOut().fadeIn();
                   }
                   $('.boxgrid.slidedown').hover(function () {
                       $(".cover", this).stop().animate({ top: '-120px' }, { queue: false, duration: 500 });
                   }, function () {
                       $(".cover", this).stop().animate({ top: '0px' }, { queue: false, duration: 500 });
                   });
               });
        }     
        ///保存用户选择的在线客服控件
        function SaveIM() {
            if ($("#ModelList").val() == "") {
                alert("请选择在线客服控件");
            } else {
                var WType = $("#ModelList").val();
                if (typeof WType == "" && typeof WType == "undefined") {
                    WType = "Kefu";
                }
                $.post("/Mobile/MAjax.ashx?action=SetSelectIM&t=" + Math.random(),
                    { WType: WType }, function (rsp) {
                        if ($(rsp).find("Error").length > 0) {
                            alert($(rsp).find("Error").text());
                        } else {
                            alert($(rsp).find("Success").text());
                        }
                    });
            }
        }

    </script>
</body>
</html>
