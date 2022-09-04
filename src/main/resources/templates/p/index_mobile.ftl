<!DOCTYPE HTML>
<html>
<head>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-transform" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>${article.name} - 武汉办公家具|办公桌椅生产厂家厂商报价直销|办公家具定制厂家|武汉红鑫办公家具厂</title>
    <meta name="keywords" content="武汉办公家具,武汉办公桌椅,办公家具定制厂家,办公前台,办公室办公沙发,武汉办公家具公司,办公家具定制厂家," />
    <meta name="description" content="武汉办公家具，武汉红鑫办公家具20年品质沉淀，主营办公家具、保密文件柜定做、办公桌椅、武汉大小型会议桌椅厂家、档案密集柜报价、钢制铁皮文件柜厂家、储物柜、洽谈桌、武汉办公桌椅、办公前台、大班台等、武汉办公家具定制：400-678-5198" />
    <link key="skins" href="/res/css/mobile/skins.css" rel="stylesheet" type="text/css" />
    <link key="common" href="/res/css/mobile/common.css" rel="stylesheet" type="text/css" />
    <link rel="apple-touch-icon-precomposed" href="/mobile/images/common/touch-icon.png" />
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
<body id='Details_Page'>
<div>
    <header class="g-hd" id="top" name="top">
        <a href="/mobile/" name="logo" class="m-logo">
            <img src="/mobile/images/web/grey.gif" data-src="/res/images/logo/logo.gif" />
        </a>
        <p class="m-tel">办公家具整体配套大型生产厂家</p>
        <p class="m-menu">
            <a href="/mobile/">首页</a>
            <a href="/gcal">案例</a>
            <a href="/mobile/Mhelps/dzfw.html">定制</a>
            <a href="/gcsl.html">实力</a>
            <a href="/mobile/Mhelps/contactus.html">联系</a>
        </p>
    </header>
    <div class="g-hd-f">
        <p class="fixed">
            <a href="/mobile/">首页</a>
            <a href="/gcal">案例</a>
            <a href="/mobile/Mhelps/dzfw.html">定制</a>
            <a href="/gcsl.html">实力</a>
            <a href="/mobile/Mhelps/contactus.html">联系</a>
        </p>
    </div>
    <div class="g-back">
        <a href="javascript:history.go(-1);" class="u-bp f-fl"></a>
        <a href="/mobile/tools/ListNav.aspx?type=News" class="u-bl f-fr"></a>
        <a href="/mobile/" class="u-bh f-fr"></a>
    </div>
    <div class="g-se">
        <span class="u-bt"></span>
        <input type="button" class="u-in">
        <div class="m-ipt">
            <input type="text" class="u-key clear_word" id="se_key" value="请输入关键词">
        </div>
        <div class="clear"></div>
    </div>

    <link href="/res/css/mobile/news.css" rel="stylesheet" type="text/css" />
    <!--新闻详细页-->
    <div class="g-bd">
        <!--新闻导航-->
        <h3 class="m-btit">
            <a href="/mobile/">首页</a>
            <span></span>
            <a href="/jryxal.html" title="金融银行案例">金融银行案例</a>
        </h3>

        <div class="m-con">
            <!--新闻标题-->
            <div class="u-mtit f-tc">
                <h1 class="s-wc">${article.name}</h1>
                <p>2018-08-21 16:34:19&nbsp;</p>
            </div>
            <!--新闻内容-->
            <div id="content" class="m-mcon">
                ${article.content}
            </div>

            <!--关于手机的相关新闻-->
            <div class="m-about">
                <a href="#" class="s-wc">
                    <h2 class="m-tit z-spe">
                        <font>其它案例</font>
                    </h2>
                </a>
                <p class="list">
                    <#if articleRandoms??>
                        <#list articleRandoms as article>
                            <#if article?? && article.id gt 0>
                            <a target='_blank' href='/article/${article.id}' title='${article.name}'>${article.name}</a>
                            </#if>
                        </#list>
                    </#if>
                </p>
            </div>

            <!--推荐产品-->
            <div class="m-rec j-slide-np">
                <a href="#1" class="s-wc">
                    <h2 class="m-tit z-spe">
                        <span class="u-ico"></span>推荐产品
                    </h2>
                </a>
                <div class="m-con">
                    <div class="prev"></div>
                    <div class="m-nowr">
                        <div class="m-box">
                            <#if randomProducts??>
                                <#list randomProducts as randomProduct>
                                    <#if randomProduct?? && randomProduct.id gt 0>
                                        <#if (randomProduct_index+1)/2==0>
                                            <p>
                                        </#if>
                                        <a href='/product/${randomProduct.id}' title='${randomProduct.name}'>
                                            <img src='${randomProduct.thumbnail}' width='130' height='94' alt='${randomProduct.name}'
                                                 title='${randomProduct.name}'>${randomProduct.name}</a>
                                        <#if (randomProduct_index+1)/2==0>
                                            </p>
                                        </#if>
                                    </#if>
                                </#list>
                            </#if>
                        </div>
                    </div>
                    <div class="next"></div>
                </div>
            </div>
            <!--热点推荐-->
            <#--<div class="m-about">
                <h2 class="m-tit z-spe s-wc">热点推荐</h2>
                <p class="list">
                    <a href='/mobile/MArticles/lqyx.html' target='_blank'>乐其游戏办公家具配置案例</a>
                    <a href='/mobile/MArticles/ckxbgjjgca.html' target='_blank'>创客星办公家具工程案例</a>
                    <a href='/mobile/MArticles/smbgjjwsmy.html' target='_blank'>实木办公家具为什么要留伸缩缝</a>
                    <a href='/mobile/MArticles/xzbgjjdbdz.html' target='_blank'>选择办公家具的八点注意事项</a>
                    <a href='/mobile/MArticles/whbgjjdzhy.html' target='_blank'>武汉办公家具定制行业分析</a>
                </p>
            </div>-->
        </div>
    </div>
    <!--底部开始-->
    <footer class="g-ft">
        <p class="u-top">
            <a href="/mobile/">
						<span>
							<img src="/mobile/images/common/top1.gif" alt="返回首页">
						</span>返回首页
            </a>
            <a href="/mobile/sitemap.html" title="网站地图">
						<span>
							<img src="/mobile/images/common/top2.gif" alt="网站地图">
						</span>网站地图
            </a>
        </p>
        <p class="u-di">武汉红鑫家俱有限公司 版权所有</p>
        <p class="u-tel">咨询电话：<a href="tel:4006785198">400-678-5198</a>
        </p>
        <div class="social_nav5">
            <ul>
                <li class="cur">
                    <a>
                        <em></em>办公家具分类
                    </a>
                    <i>
                        <a href="/dbtxl.html">
									<span>
										<img src="/mobile/images/common/f_ico1.png">
									</span>大班台
                        </a>
                        <a href="/bgpfxl.html">
									<span>
										<img src="/mobile/images/common/f_ico2.png">
									</span>办公屏风
                        </a>
                        <a href="/hyzxl.html">
									<span>
										<img src="/mobile/images/common/f_ico3.png">
									</span>会议桌
                        </a>
                        <a href="/bgzxl.html">
									<span>
										<img src="/mobile/images/common/f_ico9.png">
									</span>办公桌
                        </a>
                        <a href="/bgyxl.html">
									<span>
										<img src="/mobile/images/common/f_ico4.png">
									</span>办公椅
                        </a>
                        <a href="/wjgxl.html">
									<span>
										<img src="/mobile/images/common/f_ico5.png">
									</span>文件柜
                        </a>
                        <a href="/sfcjxl.html">
									<span>
										<img src="/mobile/images/common/f_ico6.png">
									</span>沙发茶几
                        </a>
                        <a href="/bgqtxl.html">
									<span>
										<img src="/mobile/images/common/f_ico7.png">
									</span>办公前台
                        </a>
                        <a href="/ggdxl.html">
									<span>
										<img src="/mobile/images/common/f_ico8.png">
									</span>高隔断
                        </a>
                        <a href="/bgzsxl.html">
									<span>
										<img src="/mobile/images/common/f_ico10.png">
									</span>办公装饰
                        </a>
                    </i>
                </li>
                <li>
                    <a href="/zyzt">
                        <em></em>线下体验馆
                    </a>
                </li>
                <li>
                    <a href="http://p.qiao.baidu.com/cps/chat?siteId=3552126&userId=2186107">
                        <em></em>在线咨询
                    </a>
                </li>
                <li>
                    <a href="tel:4006785198">
                        <em></em>立即拨号
                    </a>
                </li>
            </ul>
        </div>
    </footer>
</div>
<script type="text/javascript" key="jquery" src="/mobile/js/Jquery.js"></script>
<script type="text/javascript" key="nsw_mobile" src="/mobile/js/Nsw_mobile.js"></script>
<script type="text/javascript" key="tools" src="/mobile/JS/Tools.js"></script>

<script>
    var _hmt = _hmt || []; (function() { var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?be518259b9bd320fa77e6e8ed06e09c7";
    var s = document.getElementsByTagName("script")[0]; s.parentNode.insertBefore(hm, s); })();
</script>
</body>
</html>
<script type="text/javascript">
    $(function (){
        GetCommentById("reply", 3,222, "news");
        SetPageCount('news',222,1,'whdhrdwlkj.html');
    });
</script>