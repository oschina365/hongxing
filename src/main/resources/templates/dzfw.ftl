<#include "common/layout.ftl"/>
<@html title_="武汉办公家具定制,办公室家具品牌,办公桌椅定制-红鑫家俱" css_=["/skins/default/style.css"] >
    <#include "common/tianmao.ftl"/>
    <body>
        <#include "common/pfb.ftl" />
        <#include "common/g_top.ftl" />

        <div class="ban-ss">
            <div class="banan-t content">
                <p>
                    <b>热门搜索词：</b>
                    <a href="/helps/aboutus.html" title="武汉红鑫家俱">武汉红鑫家俱</a>
                    <a href="/product/" title="武汉红鑫办公家具">武汉红鑫办公家具</a>
                    <a href="/helps/aboutus.html" title="武汉办公家具厂家">武汉办公家具厂家</a>
                </p>
                <#include "common/category_list.ftl" />
            </div>
        </div>
        <script src="/js/select2css.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                $('.ban-ss').before($('.topadcs'));
            });
        </script>
        <link href="/skins/default/animate.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            initCommonHeader();
            var MARK = "help";
            var SID = "0001,0009";

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
        <script type="text/javascript">
            var OBJ_TITLE = "定制服务";
            var OBJ_ID = "24";
            var SID = "0001,0009";
        </script>

        <div class="topadcs">
            <a class="fullad" href="/product/" title="五大免费,全行业独此一家" style="background:url('/res/images/banner2.jpg') no-repeat center top;"></a>
        </div>
        <!--content:start-->
        <div class="content">
            <#include "common/a_nav.ftl" />
            <div class="clear"></div>
            <div class="plc rows" style=" display:none">
                <span class="red_x">当前位置：</span>
                <a href="/" title="首页">首页</a> &raquo;
                <a href="helps/dzfw.html" title="定制服务">定制服务</a>
            </div>
            <div class="allcontent">
                <style>
                    .zs {
                        height: 112px;
                        background: #f7f7f7;
                        font-family: "Microsoft YaHei", serif;
                        overflow: hidden;
                    }

                    .zs h3 {
                        float: left;
                    }

                    .zs ul {
                        float: left;
                        margin-left: 10px;
                    }

                    .zs li {
                        float: left;
                    }

                    .zs li a {
                        display: block;
                        width: 165px;
                        height: 85px;
                        padding: 27px 0 0 28px;
                    }

                    .zs li em {
                        display: block;
                        float: left;
                    }

                    .zs li p {
                        float: left;
                        margin: 0;
                        margin-left: 8px;
                        font-size: 16px;
                        color: #131418;
                        padding-top: 10px;
                    }

                    .zs li p span {
                        display: block;
                        font: 15px "宋体";
                        color: #636363;
                        margin-top: 5px;
                    }

                    .zs li a:hover, .zs li .cur {
                        background: #dfdfdf;
                    }

                    /**/
                    .fs {
                        height: 753px;
                        background: url("/res/images/dzxq.jpg") no-repeat;
                        overflow: hidden;
                    }

                    .fs ul {
                        margin-left: 52px;
                        padding-top: 410px;
                        height: 230px;
                    }

                    .fs li {
                        float: left;
                        margin-right: 45px;
                        text-align: center;
                    }

                    .fs li a {
                        font-size: 16px;
                        color: #131418;
                    }

                    .fs li img {
                        display: block;
                        width: 143px;
                        height: 143px;
                    }

                    .fs h3 {
                        height: 87px;
                        background: url("/res/images/fsx.jpg") no-repeat;
                        font-weight: normal;
                    }

                    .fs h3 em {
                        display: block;
                        float: left;
                        margin-left: 70px;
                        font-size: 16px;
                        color: #131418;
                        line-height: 87px;
                    }

                    .fs h3 em span {
                        color: #e70012;
                        font-weight: bold;
                    }

                    .fs h3 p {
                        float: left;
                        width: 139px;
                        height: 31px;
                        background: url("/res/images/fsk.jpg") no-repeat;
                        font-size: 16px;
                        color: #ffffff;
                        text-align: center;
                        line-height: 31px;
                        margin-top: 28px;
                    }

                    /**/
                    .qs {
                        padding: 53px 32px 0 32px;
                        width: 938px;
                        margin: 0 auto;
                        height: 501px;
                        background: #f7f7f7;
                        font-family: "Microsoft YaHei";
                    }

                    .qs-l {
                        margin-top: 55px;
                        width: 405px;
                        padding: 65px 27px 0 27px;
                        height: 313px;
                        background: #fff;
                        position: relative;
                    }

                    .qs-l h4 {
                        position: absolute;
                        top: -55px;
                        left: 32px;
                    }

                    .qs-l p {
                        display: block;
                        height: 21px;
                        padding-bottom: 17px;
                        border-bottom: 1px solid #a59cad;
                        color: #444444;
                        font-size: 17px;
                        line-height: 21px;
                    }

                    .qs-l p i {
                        font-style: normal;
                        width: 26px;
                        height: 21px;
                        color: #fff;
                        background: #e70012;
                        display: inline-block;
                        text-align: center;
                        margin-left: 8px
                    }

                    .qs-l ul li {
                        margin-top: 12px;
                        color: #444444;
                        font-size: 15px;
                        line-height: 19px
                    }

                    .qs-l ul li i {
                        font-style: normal;
                        color: #e70012
                    }

                    .qs-l h5 {
                        position: absolute;
                        bottom: -34px;
                        left: 120px;
                        display: block;
                    }

                    .qs-l input {
                        background: url("/res/images/qs.png") no-repeat;
                        width: 215px;
                        height: 66px;
                        color: #fff;
                        text-align: center;
                        font-size: 30px;
                        border: none;
                        line-height: 40px;
                        letter-spacing: 4px;
                        font-family: "Microsoft YaHei";
                    }

                    .qs-r {
                        width: 435px;
                        height: 432px;
                        background: #fff;
                        position: relative;
                    }

                    .qs-r h4 {
                        height: 86px;
                        background: #e70012;
                        color: #fff;
                        font-weight: normal;
                        text-align: center;
                        font-size: 35px;
                        line-height: 86px;
                        margin-bottom: 42px
                    }

                    .qs-r ul li {
                        padding-left: 77px;
                        color: #3c3c3c;
                        font-size: 15px;
                        height: 27px;
                        margin-bottom: 14px;
                        line-height: 27px;
                        width: 350px;
                    }

                    .qs-r ul li span {
                        display: block;
                        width: 52px;
                        float: left;
                    }

                    .qs-r ul li input {
                        float: left;
                        width: 215px;
                        height: 25px;
                        padding: 0 5px;
                        border: 1px solid #d4d4d4;
                        line-height: 25px
                    }

                    .qs-r ul li.warp_3 {
                        padding-left: 77px;
                        color: #3c3c3c;
                        font-size: 15px;
                        height: 27px;
                        margin-bottom: 14px;
                        line-height: 27px;
                        width: 150px;
                        float: left;
                    }

                    .qs-r ul li.warp_3 input {
                        width: 84px;
                        padding: 0;
                        text-align: center;
                    }

                    .qs-r ul li.warp_7 {
                        padding-left: 77px;
                        color: #3c3c3c;
                        font-size: 15px;
                        height: 27px;
                        margin-bottom: 14px;
                        line-height: 27px;
                    }

                    .qs-r ul li.warp_7 span {
                        display: block;
                        width: 36px;
                        float: left;
                    }

                    .qs-r ul li.warp_7 input {
                        width: 84px;
                        padding: 0;
                        text-align: center;
                    }

                    .qs-r ul li label {
                        float: left;
                        padding: 0 12px;
                        font-size: 14px;
                        font-style: normal;
                    }

                    .qs-r ul li.warp_4 input {
                        width: 12px;
                        height: 12px;
                        padding: 0;
                        margin-top: 8px
                    }

                    .qs-r ul li.warp_4 label {
                        padding: 0 8px;
                        width: 70px;
                    }

                    .qs-r ul li.qs3 {
                        padding-left: 129px
                    }

                    .qs-r ul li.qs3 .inp1 {
                        width: 12px;
                        height: 12px;
                        padding: 0;
                        margin: 9px 9px 0 0
                    }

                    .qs-r ul li.qs3 input {
                        width: 60px;
                        padding: 0;
                        text-align: center;
                    }

                    .qs-r h5 {
                        position: absolute;
                        bottom: -34px;
                        left: 120px;
                        display: block;
                    }

                    .qs-r h5 input {
                        background: url("/res/images/qs.png") no-repeat;
                        width: 215px;
                        height: 66px;
                        color: #fff;
                        text-align: center;
                        font-size: 30px;
                        border: none;
                        line-height: 40px;
                        letter-spacing: 4px;
                        font-family: "Microsoft YaHei";
                    }

                    /**/
                    .pk {
                        padding-top: 80px;
                        height: 1070px;
                        font-family: "Microsoft YaHei";
                        font-family: "Microsoft YaHei";
                    }

                    .pk h2 {
                        text-align: center;
                        font-weight: normal;
                        height: 143px;
                        color: #131418;
                        font-size: 35px
                    }

                    .pk h2 span {
                        display: block;
                        font-size: 16px;
                        padding-top: 10px;
                    }

                    .pk h2 em {
                        font-style: normal;
                        color: #e70012
                    }

                    .pk-l {
                        width: 251px;
                        padding: 0 123px
                    }

                    .pk-l h1 {
                        text-align: center;
                    }

                    .pk-l h1 {
                        height: 80px
                    }

                    .pk-l ul li {
                        font-size: 0;
                        line-height: 0;
                        height: 267px;
                    }

                    .pk-l ul li img {
                        display: block;
                        margin-bottom: 8px;
                        border: 1px solid #e6e6f9;
                        width: 251px;
                        height: 195px
                    }

                    .pk-l ul li em {
                        float: left;
                        font-style: normal;
                        font-style: normal;
                        width: 55px;
                        height: 25px;
                        background: #e70012;
                        color: #fff;
                        font-size: 14px;
                        text-align: center;
                        line-height: 25px
                    }

                    .pk-l ul li span {
                        display: block;
                        width: 168px;
                        float: left;
                        padding-left: 8px;
                        color: #444444;
                        font-size: 13px;
                        line-height: 16px
                    }

                    .pk-l ul li.l1 {
                        height: 282px;
                    }

                    .pk-c {
                        position: relative;
                    }

                    .pk-k {
                        position: absolute;
                        top: -17px;
                        left: 410px;
                        background: url("/res/images/pk_03.jpg") no-repeat;
                        width: 184px;
                        height: 630px;
                        padding-top: 184px
                    }

                    .pk-k ul li {
                        text-align: center;
                        height: 268px;
                        color: #e70012;
                        font-size: 22px
                    }

                    /**/
                    .mf {
                        height: 127px;
                    }

                    /**/
                    .xz {
                        padding-top: 73px;
                        height: 532px;
                        font-family: "Microsoft YaHei";
                    }

                    .xz h2 {
                        text-align: center;
                        font-weight: normal;
                        height: 143px;
                        color: #131418;
                        font-size: 35px
                    }

                    .xz h2 span {
                        display: block;
                        font-size: 16px;
                        padding-top: 10px;
                    }

                    .xz h2 em {
                        font-style: normal;
                        color: #e70012
                    }

                    .xz p img {
                        width: 1000px;
                        height: 293px;
                    }

                    .xz p {
                        position: relative;
                    }

                    .xz p a {
                        position: absolute;
                        right: 8px;
                        bottom: -1px;
                        display: block;
                        text-align: center;
                        width: 195px;
                        height: 195px;
                        line-height: 194px;
                        color: #999;
                        font-family: 宋体;
                        letter-spacing: 1px;
                    }
                </style>
                <script type="text/javascript" src="/js/Time.js"></script>
                <div class="zs content">
                    <h3>
                        <img src="/res/images/zsz.jpg" alt="武汉办公家具定制" />
                    </h3>
                    <ul>
                        <li>
                            <a class="cur">
                                <em>
                                    <img src="/res/images/zs_03.png" alt="办公家具定制" />
                                </em>
                                <p>
                                    网上预约<span>免费量尺</span>
                                </p>
                            </a>
                        </li>
                        <li>
                            <a>
                                <em>
                                    <img src="/res/images/zs_03.png" alt="武汉办公家具定做" />
                                </em>
                                <p>
                                    上门量尺<span>设计方案</span>
                                </p>
                            </a>
                        </li>
                        <li>
                            <a>
                                <em>
                                    <img src="/res/images/zs_03.png" alt="定做武汉办公家具" />
                                </em>
                                <p>
                                    到店看方案<span>签订合同</span>
                                </p>
                            </a>
                        </li>
                        <li>
                            <a>
                                <em>
                                    <img src="/res/images/zs_03.png" alt="定制武汉办公家具" />
                                </em>
                                <p>
                                    产品配送<span>安装售后</span>
                                </p>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="fs content">
                    <ul>
                        <li>
                            <a>
                                <img src="/res/images/fst_03.png" alt="办公家具定制厂家" />企业接待台
                                <br />
                                定制</a>
                        </li>
                        <li>
                            <a>
                                <img src="/res/images/fst_05.png" alt="武汉办公室家具定制" />自定义办公区
                                <br />
                                定制</a>
                        </li>
                        <li>
                            <a>
                                <img src="/res/images/fst_07.png" alt="武汉办公桌椅定制" />个性洽谈区
                                <br />
                                定制</a>
                        </li>
                        <li>
                            <a>
                                <img src="/res/images/fst_09.png" alt="武汉办公桌定制" />多功能会议区
                                <br />
                                定制</a>
                        </li>
                        <li>
                            <a>
                                <img src="/res/images/fst_11.png" alt="武汉文件柜定制" />异形展示柜
                                <br />
                                定制</a>
                        </li>
                    </ul>
                    <h3>
                        <a href="javascript:void(0);" onclick="doyoo.util.openChat('g=');return false;"="" title="免费预约量尺
                        ">
                        <em>如果您的需求没有列出，不妨填下表格或打个电话<span>400-678-5198</span>，红鑫家具会给您惊喜！</em>
                        <p>
                            免费预约量尺
                        </p>
                        </a>
                    </h3>
                </div>
                <div class="qs content">
                    <div class="qs-l fl">
                        <h4>
                            <img src="/res/images/qsz.png" alt="武汉办公家具定制" />
                        </h4>
                        <p class="ps_time">
                            剩余时间：<i id="day_show">23</i> 天<i id="hour_show">12</i> 时<i id="minute_show">45</i> 分<i id="second_show">32</i> 秒
                        </p>
                        <ul>
                            <li>
                                1.马上报名，免交定金即可获得价值<i>1000元</i>上门测量设计服务；
                            </li>
                            <li>
                                2.申请体验卡即可送<i>200元代金劵</i>，直接抵扣货款；
                            </li>
                            <li>
                                3.签约即送<i>价值100</i>元礼品<i>（桌面皮垫和得力计算器）</i>
                            </li>
                            <li>
                                4.签约后，回传合同及工程案例实景图即可获总部直寄价值<i>680元</i>大礼包；
                            </li>
                            <li>
                                5.享受专车接送来展厅或报销的士费。
                            </li>
                        </ul>
                        <h5>
                            <a href="javascript:void(0);" onclick="doyoo.util.openChat('g=');return false;"="" title="
                            点击咨询">
                            <input value="点击咨询" type="button" />
                            </a>
                        </h5>
                    </div>
                    <div class="qs-r fr">
                        <h4>
                            体验卡免费申请
                        </h4>
                        <script type="text/javascript" src="/js/forms.js" oid="1"></script>
                    </div>
                </div>
                <div class="pk content">
                    <h2>
                        <em>为何选择</em>红鑫办公家具?<span>规模化工厂，持续经营17年</span>
                    </h2>
                    <div class="pk-c">
                        <div class="pk-l fl">
                            <h1>
                                <a>
                                    <img src="/res/images/pk_06.jpg" alt="武汉办公家具定制" />
                                </a>
                            </h1>
                            <ul>
                                <li class="l1">
                                    <img src="/res/images/pk_11.jpg" alt="武汉办公家具定做" />
                                    <em>优势一</em>
                                    <span>正规大型家具企业，通过ISO9001质量体系认证、14001环境管理体系认证、18001健康体系认证</span>
                                </li>
                                <li>
                                    <img src="/res/images/pk_21.jpg" alt="武汉办公室家具定制" />
                                    <em>优势二</em>
                                    <span>可开具正规机打普票和增值税发票</span>
                                </li>
                                <li>
                                    <img src="/res/images/pk_26.jpg" alt="办公家具定做" />
                                    <em>优势三</em>
                                    <span>自有大型办公家具展厅，先看实物在购买，售后有保障</span>
                                </li>
                            </ul>
                        </div>
                        <div class="pk-l fr">
                            <h1>
                                <a>
                                    <img src="/res/images/pk.jpg" alt="定制办公家具厂" />
                                </a>
                            </h1>
                            <ul>
                                <li class="l1">
                                    <img src="/res/images/pk_14.jpg" alt="办公家具定制厂家" />
                                    <em>缺点一</em>
                                    <span>规模小，产品质量和售后无保障</span>
                                </li>
                                <li>
                                    <img src="/res/images/pk_22.jpg" alt="办公家具定制公司" />
                                    <em>缺点二</em>
                                    <span>普通小型企业只能开具手写发票</span>
                                </li>
                                <li>
                                    <img src="/res/images/pk_25.jpg" alt="武汉办公家具厂家" />
                                    <em>缺点三</em>
                                    <span>小型卖场，随时可能转让，无售后</span>
                                </li>
                            </ul>
                        </div>
                        <div class="pk-k">
                            <ul>
                                <li>
                                    品质好
                                </li>
                                <li>
                                    服务全
                                </li>
                                <li>
                                    规模大
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="mf content">
                    <img src="/res/images/mf.jpg" alt="办公家具定制厂家" />
                </div>
                <div class="xz content">
                    <h2>
                        他们都选择了<em>红鑫</em>
                        <span>说不定您身边的朋友，也是红鑫家具的合作伙伴哦~</span>
                    </h2>
                    <p>
                        <img src="/res/images/xz_02.jpg" alt="武汉办公家具定制" />
                        <a class="gd2" href="/gcal" target="_blank">查看更多</a>
                    </p>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <script type="text/javascript">
            help
            Load();
        </script>
        <!--content:end-->
    </body>
</@html>