

<head>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/manager/skins/base/common.css" rel="stylesheet" type="text/css" />
    <link href="/manager/skins/default/default.css" rel="stylesheet" type="text/css" />
    <link href="/manager/skins/base/index.css" rel="stylesheet" type="text/css" />
    <meta name="description" />
    <meta name="keywords" />
    <title>${title_!'武汉红鑫家俱有限公司网站后台'}</title>
    <link href="/manager/skins/base/editInterface.css" rel="stylesheet" type="text/css" />
    <link href="/manager/skins/base/products.css" rel="stylesheet" type="text/css" />
    <link href="/manager/skins/base/dialog.css" rel="stylesheet" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/layui/2.7.6/layui.js" integrity="sha512-mIKH3M2bRlIyhG4tBEbJ8dn8t8JFlNJU2NXlJePgpQ72CK4jAYsZyCGFcASRGtPBbcAQhz67KTkA1Jw6Kizk9g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/layui/2.7.6/css/layui.css" integrity="sha512-SSF+OBDODWTSIqOivYBOyOKQ93PBDevipJEUEWtkUbTt4v34rmgPcCXcBMolxZIJcuobcdqmYJlonjUBEbOzNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- hongxin.com.cn/Mobile Baidu tongji analytics -->
    <script type="text/javascript">
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?25e431cff63a206eb286efd246de5f2d";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
        window.top.SetHeight = function () {
            var frmEditor = $("#frmEditor");
            var h = frmEditor.contents().find("body").height();
            h = parseInt(h);
            if (!isNaN(h) && h > 20) {
                var _h = $("div.col_side").height();
                if (h < _h) {
                    h = _h;
                }
                h = frmEditor.data("setheight") ? h : h + 20;
                frmEditor.height(h);
                frmEditor.data("setheight", true);
            } else {
                frmEditor.height(1500);
            }
        }

        function SaveURL(url) {
            alert(url)
            //var _href = url || (window.location + '');
        }
    </script>
    <script type="text/javascript" src="/manager/js/easyui/jquery.min.js"></script>
    <script src="/manager/js/common/common.js" type="text/javascript"></script>
    <#list css_ as css>
        <link key="index" href="${css}" rel="stylesheet" type="text/css">
    </#list>
</head>