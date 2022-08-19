<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Mobile.MProduct.ProDetail, qwt" enableviewstate="false" enableviewstatemac="false" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"
        name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>产品详细页</title>
    <meta name="keywords" content="营销型网站,营销型网站建设,深圳网站建设,牛商网,网站托管,网站建设公司" />
    <meta name="description" content="牛商网是深圳营销型网站建设公司,中国营销型网站创始者,营销型网站标准制定者,服务范围营销型网站建设,网站运营托管,网站外包,深圳网站建设等,咨询热线:4000-333-087" />
    <link href="/Mobile/css/skins.css" rel="stylesheet" type="text/css" />
    <link href="/Mobile/Css/product.css" rel="stylesheet" type="text/css" />
    <link href="/Mobile/Css/common.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        /* 首页加载图片样式  */
.loading{position:fixed;z-index:1000;width:100%;height:40px;display:none; top:50%; margin-top:-20px; text-align:center;}#circularG{position:absolute;left:50%;margin-left:-16px;width:32px;height:32px}.circularG{position:absolute;background-color:#DB1CDB;width:7px;height:7px;-moz-border-radius:5px;-moz-animation-name:bounce_circularG;-moz-animation-duration:0.64s;-moz-animation-iteration-count:infinite;-moz-animation-direction:linear;-webkit-border-radius:5px;-webkit-animation-name:bounce_circularG;-webkit-animation-duration:0.64s;-webkit-animation-iteration-count:infinite;-webkit-animation-direction:linear;-ms-border-radius:5px;-ms-animation-name:bounce_circularG;-ms-animation-duration:0.64s;-ms-animation-iteration-count:infinite;-ms-animation-direction:linear;border-radius:5px;animation-name:bounce_circularG;animation-duration:0.64s;animation-iteration-count:infinite;animation-direction:linear}#circularG_1{left:0;top:13px;-moz-animation-delay:0.8s;-webkit-animation-delay:0.8s;-ms-animation-delay:0.8s;animation-delay:0.8s}#circularG_2{left:3px;top:3px;-moz-animation-delay:0.72s;-webkit-animation-delay:0.72s;-ms-animation-delay:0.72s;animation-delay:0.72s}#circularG_3{top:0;left:13px;-moz-animation-delay:0.64s;-webkit-animation-delay:0.64s;-ms-animation-delay:0.64s;animation-delay:0.64s}#circularG_4{right:3px;top:3px;-moz-animation-delay:0.56s;-webkit-animation-delay:0.56s;-ms-animation-delay:0.56s;animation-delay:0.56s}#circularG_5{right:0;top:13px;-moz-animation-delay:0.48s;-webkit-animation-delay:0.48s;-ms-animation-delay:0.48s;animation-delay:0.48s}#circularG_6{right:3px;bottom:3px;-moz-animation-delay:0.4s;-webkit-animation-delay:0.4s;-ms-animation-delay:0.4s;animation-delay:0.4s}#circularG_7{left:13px;bottom:0;-moz-animation-delay:0.32s;-webkit-animation-delay:0.32s;-ms-animation-delay:0.32s;animation-delay:0.32s}#circularG_8{left:3px;bottom:3px;-moz-animation-delay:0.24s;-webkit-animation-delay:0.24s;-ms-animation-delay:0.24s;animation-delay:0.24s}@-moz-keyframes bounce_circularG{0%{-moz-transform:scale(1)}100%{-moz-transform:scale(.3)}}@-webkit-keyframes bounce_circularG{0%{-webkit-transform:scale(1)}100%{-webkit-transform:scale(.3)}}@-ms-keyframes bounce_circularG{0%{-ms-transform:scale(1)}100%{-ms-transform:scale(.3)}}@keyframes bounce_circularG{0%{transform:scale(1)}100%{transform:scale(.3)}}
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
   <%
        NVelocity.VelocityContext Context = NVEngine.NVTempHelp.GetVelocityContext();
    %>
    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Header.html;M_Common/BackPreviousControl.html?curtype=product;M_Common/SearchControl.html")%>
    <!--搜索结束-->
    <!--产品详细页-->
    <div class="g-bd">
        <div class="g-sbox">
            <ul class="m-cnt m-cnt2">
                <li name="tab1" id="aId0" onclick="tab('divId','aId',0,3,'z-on',0)">产品详情</li>
                <li name="tab2" id="aId1" onclick="tab('divId','aId',1,3,'z-on',1)">用户评论(<span id="AppendCount"></span>)</li>
                <li id="aId2" name="tab3" onclick="tab('divId','aId',2,3,'z-on',2)">我要下单</li>
            </ul>
            <div class="m-box tab-box">
                <div class="m-con m-con-5" id="divId0">
                    <div id="AppendContent"></div>
                    <!--分页-->
                    <div id="setPage" class="g-page g-page2 f-tc">
                        <a id="ToUp" curr="1" class="u-pup" href="javascript:void(0)">上一页</a> <i id="Count"
                            count="1"></i><a id="ToDown" class="u-pne" href="javascript:void(0)">下一页</a>
                    </div>
                </div>
                <div class="m-con" id="divId1">
                            <!--网友热评-->
                    <div class="m-com">
                        <h2 class="m-tit z-spe s-wc">网友热评</h2>
                        <div class="u-idet">
                            <textarea name="" id="txtComment" value="还可以输入140个字" class="clear_word">还可以输入140个字</textarea>
                            <div id="validate" class="red"></div>
                        </div>
                        <div class="u-btn">
                            <input class="z-mg u-co-bt" type="button" value="我要评论" name="" onclick="postComment(this,'<%= Id %>','product')">
                        </div>
                        <div class="u-relay" id="reply">
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="u-relay" id="CommentList">
                    </div>
                </div>
                <div class="m-con" id="divId2">
                    <div class="m-abpro1 ">
                        <div class="m-con">
                            <h5 class="xgmm">
                                姓名：</h5>
                            <p>
                                <input id="UserName" class="u-inna name clear_word" type="text" name="" value="请输入姓名"></p>
                            <h5 class="xgmm">
                                手机：</h5>
                            <p>
                                <input id="Phone" class="u-inna name clear_word" type="text" name="" value="请输入手机"></p>
                            <h5>
                                留言：</h5>
                            <p>
                                <textarea id="OrderInfo" class="ly u-inna clear_word" rows="" cols="" name="">还可以输入140个字</textarea></p>
                            <p id="ErrorInfo" class="red pl10">
                            </p>
                            <p class="show_more">
                                <input id="submitOrder" type="button" class="u-co-bt" value="提 交" name="" onclick='submitOrder("UserName","Phone","OrderInfo",<%=Id %>)'></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%=NVEngine.NVTempHelp.LoadNVTemp(Context, "M_Common/Footer.html")%>

</body>
<script type="text/javascript" src="/Mobile/js/Jquery.js"></script>
<script type="text/javascript" src="/Mobile/js/nsw_mobile.js"></script>
<script type="text/javascript" src="/Mobile/js/Tools.js"></script>
<script src="/Mobile/JS/ProDetailAjax.js" type="text/javascript"></script>
<script type="text/javascript">

    $(function () {

        var proId = getQueryString("Id");
        var ShowID = getQueryString("ShowID");
        if (proId != "undefined") {
            proId = parseInt(proId);
        } else {
            proId = 0;
        }

        if (ShowID != "undefined") {
            ShowID = parseInt(ShowID);
            if (ShowID > 3) {
                ShowID = 1;
            }
            $(".m-cnt2 li").removeClass("z-on");
            $("#divId0").hide();
            $("#divId1").hide();
            $("#divId2").hide();
            $("#divId" + ShowID - 1 + "").show();
            ShowID = ShowID - 1;
            switch (ShowID) {
                case 0:
                    $("#divId0").show();
                    $("#aId0").addClass("z-on");
                    break;
                case 1:
                    $("#divId1").show();
                    $("#aId1").addClass("z-on");
                    break;
                case 2:
                    $("#divId2").show();
                    $("#aId2").addClass("z-on");
                    break;
                default:
                    $("#divId0").show();
                    $("#aId0").addClass("z-on");
                    break;
            }
        }


        $("#ToUp").unbind("click").bind("click", function () {
            ToUpDown(proId, "Up");
        });
        $("#ToDown").unbind("click").bind("click", function () {
            ToUpDown(proId, "Down");
        });
        GetContentByProductId(proId);
        //获得产品评论的总数
        //GetCommentCountByProId(proId, "AppendCount");
        //GetCommentByProIdToDeatil(proId, 1, 3);

    });
</script>
</html>
