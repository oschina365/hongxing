<#include "../common/layout.ftl"/>
<@html title_="${article.name} - 武汉办公家具|武汉办公桌椅|办公家具定制|武汉红鑫办公家具厂"
css_=["/skins/default/style.css","/skins/default/template/news/news01/style.css"]>
<body>
<!-- 代码部分begin -->
<div id='cs_box'>

    <div class='cs_img'>
    </div>
    <div class='cs_btn'>红鑫家具旗舰店
        <li>
            <a href="https://hongxin.tmall.com/" target="_black">
                <img src="/res/images/tianmao.jpg" width="120" alt="">
            </a>
        </li>
    </div>

</div>
<!-- 代码部分end -->
</body>

<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?25e431cff63a206eb286efd246de5f2d";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?75bb93deea44a009bc2d215db2ef9865";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</head>
<body>
<#include "../common/pfb.ftl" />
<#include "../common/g_top.ftl" />

<div class="ban-ss">
    <div class="banan-t content">
        <p>
            <b>热门搜索词：</b>
            <a href="/product/" title="红鑫办公家具定制">红鑫办公家具定制</a>
            <a href="/product/" title="保密文件柜钢制铁皮更衣档案储物密集柜厂家定做报价">保密文件柜钢制铁皮更衣档案储物密集柜厂家定做报价</a>
            <a href="/product/" title="老板办公室桌椅沙发">老板办公室桌椅沙发</a>
        </p>
        <div class="banan-tr form">
            <input class="inp01s keypress" button="#sousuo" type="text" defvalue="请输入关键字……" id="seachkeywords">
            <a>
						<span>
							<select class="" id="select">
								<option value="">不限栏目</option>
								<option value="0001,0009">按用途分类</option>
								<option value="0001,0010">按行业分类</option>
								<option value="0001,0011">大班台系列</option>
								<option value="0001,0012">办公屏风系列</option>
								<option value="0001,0013">办公桌系列</option>
								<option value="0001,0014">会议桌系列</option>
								<option value="0001,0015">办公椅系列</option>
								<option value="0001,0016">文件柜系列</option>
								<option value="0001,0017">办公前台系列</option>
								<option value="0001,0018">沙发茶几系列</option>
								<option value="0001,0019">高隔断系列</option>
								<option value="0001,0020">办公装饰系列</option>
								<option value="0001,0076">其它</option>
							</select>
						</span>
            </a>

            <input class="inp02s" type="bottom" id="sousuo">
        </div>
    </div>
</div>
<script src="/js/select2css.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $('.ban-ss').before($('.topadcs'));
    });
</script>
<link href="/skins/default/animate.css" rel="stylesheet" type="text/css" />


<div class="topadcs">
    <a class="fullad" href="/gcal" title="精彩设计,用心呈现" style="background:url('/res/images/banner1.jpg') no-repeat center top;"></a>
</div>
<!--content:start-->
<div class="content">
    <div class="plc2 pro_curmbs">
        <span class="red_x">当前位置</span>：<a href="/" title="首页">首页</a>
        <#if parentCategoryId?? && parentCategoryName??>
            &raquo; <a href="/gcal?id=${parentCategoryId}" title="${parentCategoryName}">${parentCategoryName}</a>
            &raquo; <a href="/gcal?id=${currentCategoryId}" title="${currentCategoryName}">${currentCategoryName}</a>
        <#elseif  currentCategoryId?? && currentCategoryName??>
            &raquo; <a href="/gcal?id=${currentCategoryId}" title="${currentCategoryName}">${currentCategoryName}</a>
        </#if>
        &raquo; <a href="/article/${article.id}" title="${article.name}">${article.name}</a>
    </div>
    <div class="left2">
        <div class="left2_main">
            <div class="n_info_con" id="printableview">
                <h1>${article.name}</h1>
                <div class="info_con_tit">
                    <div class="info_con_tit">
                        <div class="n_tit">
                            <span class="fr" style="margin:0px;">
                                <a href="/gcal?id=${article.category_id}" title="返回列表" target="_blank">
                                    <img src="/skins/default/template/news/news01/img/common/article_btn.gif" alt="返回列表" />
                                </a>
                            </span>
                            <span>来源：红鑫</span>
                            <span class='m_qrinfo'>
										<a href="/Mobile/MArticles/hbsjtystgsg.html" title="查看手机网址">查看手机网址</a>
										<div class='m_qrcode'>
											<em>扫一扫!</em>
											<img src="http://nswcode.nsw88.com/?qc=8dd84307afe274a5&url=/Mobile/MArticles/hbsjtystgsg.html" alt="湖北省交通运输厅高速公路管理局采购办公家具，红鑫提供一站式解决" title="湖北省交通运输厅高速公路管理局采购办公家具，红鑫提供一站式解决" />
											<em>扫一扫!</em>
										</div>
									</span>
                            <span>浏览：<span id="cntrHits">-</span>
									</span>
                            <span>发布日期：${article.create_time}【<a href="javascript:;" onclick="ChangeFontSize(this,'16px')">大</a>
										<a class="cur" href="javascript:;" onclick="ChangeFontSize(this,'14px')">中</a>
										<a href="javascript:;" onclick="ChangeFontSize(this,'12px')">小</a>】
									</span>
                        </div>
                    </div>
                </div>
                <div id="cntrBody">
                    ${article.content}
                </div>
                <div class="clear"></div>
                <div class="gduo" id="gduo">
							<span>下一篇：<a title="${articlePrev.name}" href="/article/${articlePrev.id}">${articlePrev.name}</a>
							</span>
                    上一篇：<a title="${articleLast.name}" href="/article/${articleLast.id}">${articleLast.name}</a>
                </div>
            </div>

            <div class="n_info_con2">
                <h4 class="t04">
                    <b>“</b>推荐阅读<b>”</b>
                </h4>
                <div class="info_b">
                    <ul class="p_list_ul">
                        <#if articleRandoms??>
                            <#list articleRandoms as article>
                                <#if article?? && article.id gt 0>
                                    <li>
                                        <a href='/article/${article.id}' title='${article.name}'>${article.name}</a>
                                    </li>
                                </#if>
                            </#list>
                        </#if>
                    </ul>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <div class="info_key">
                    <span>【本文标签】：</span>
                    <a target='_blank' href="/Search/Index.aspx?kwd=%e6%ad%a6%e6%b1%89%e5%8a%9e%e5%85%ac%e5%ae%b6%e5%85%b7">武汉办公家具</a>
                    <a target='_blank' href="/Search/Index.aspx?kwd=%e6%ad%a6%e6%b1%89%e5%8a%9e%e5%85%ac%e6%a1%8c%e6%a4%85">武汉办公桌椅</a>
                    <a target='_blank' href="/Search/Index.aspx?kwd=%e5%8a%9e%e5%85%ac%e5%ae%b6%e5%85%b7%e5%ae%9a%e5%88%b6%e5%8e%82%e5%ae%b6">办公家具定制厂家</a>
                    <a target='_blank' href="/Search/Index.aspx?kwd=%e5%8a%9e%e5%85%ac%e5%89%8d%e5%8f%b0">办公前台</a>
                    <a target='_blank' href="/Search/Index.aspx?kwd=%e5%8a%9e%e5%85%ac%e5%ae%a4%e5%8a%9e%e5%85%ac%e6%b2%99%e5%8f%91">办公室办公沙发</a>
                    <a target='_blank' href="/Search/Index.aspx?kwd=%e6%ad%a6%e6%b1%89%e5%8a%9e%e5%85%ac%e5%ae%b6%e5%85%b7%e5%85%ac%e5%8f%b8">武汉办公家具公司</a>
                    <a target='_blank' href="/Search/Index.aspx?kwd=%e5%8a%9e%e5%85%ac%e5%ae%b6%e5%85%b7%e5%ae%9a%e5%88%b6%e5%8e%82%e5%ae%b6">办公家具定制厂家</a>
                    <a target='_blank' href="/Search/Index.aspx?kwd="></a>
                    <br />
                    <span>【责任编辑】：</span>红鑫<em></em>版权所有：<a href="/" target="_blank" title="/">http://www.hongxin.com.cn</a>转载请注明出处
                </div>
            </div>
        </div>
        <div class="left2bot"></div>
    </div>
    <div class="right2">
        <div class="right2_main">
            <#if articleLists??>
                <h4 class="t03 new_two">
                    <a target="_blank" href="/gcal?id=${article.category_id}" title="${article.category_name}">${article.category_name}</a>
                </h4>
                <ul class="n_rt_ul">
                    <#list articleLists as articleList>
                        <#if articleList?? && articleList.id gt 0>
                            <li>
                                <a href='/article/${articleList.id}' title='${articleList.name}'>${articleList.name}</a>
                            </li>
                        </#if>
                    </#list>
                </ul>
            </#if>
           <#-- <h4 class="t03 new_third">
                <a href="/news">最新资讯文章</a>
            </h4>-->
            <ul class="n_rt_ul" id="cntrLastArticle">
            </ul>
            <div class="leiblx">
                <div class="tit">
                    联系红鑫家具
                </div>
                <div class="leftlx">
                    <div class="dianh">
                        <div class="dianhua">
                            咨询热线：<span>400-678-5198</span>
                        </div>
                        <p>座机：027-61520188</p>
                        <p>手机：182-0718-0187</p>
                        <p>邮箱：hongxin@hongxin.com.cn</p>
                        <p>光谷展厅：武汉市洪山区光谷大道未来之光6号楼1-3楼
                        </p>
                        <p>汉口展厅：武汉市汉口北大道家具CBD五百亩工业园内红鑫家具
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>

<script type="text/javascript">
    newsLoad();
    $(document).ready(function () {
        $(".n_rt_ul").find("li:lt(3)").addClass("cur");
    });

    $(document).ready(function () {
        $(window).scroll(function (a) {
            var LastArticleHeight = $("#cntrLastArticle").height();
            var LastArticleoffsetTop = $("#cntrLastArticle").offset().top;
            if ($(this).scrollTop() > (LastArticleHeight + LastArticleoffsetTop)) {
                $(".leiblx").addClass("fixeds");
            } else {
                $(".leiblx").removeClass("fixeds");
            }
        }).scroll();
    });
</script>
<!--content:end-->
</body>
</@html>