<#include "common/layout.ftl"/>
<@html title_="武汉办公家具-办公桌椅-红鑫办公室家具定制厂家-办公家具-办公家具厂">
    <link href="/skins/default/animate.css" rel="stylesheet" type="text/css">
    <#include "common/pfb.ftl" />
    <#include "common/g_top.ftl"/>
    <div class="banan">
          <span class="content">
            <a class="cur" href=""></a>
            <a href=""></a>
            <a href=""></a>
          </span>
    </div>
    <div class="ban-ss">
        <div class="banan-t content">
            <p>
                <b>热门搜索词：</b>
                <a href="">武汉办公家具厂</a>
                <a href="">武汉办公家具</a>
                <a href="">办公家具品牌</a>
                <a href="">时尚办公家具</a>
                <a href="">办公家具定制</a>
            </p>
            <#include "common/category_list.ftl"/>
        </div>
    </div>
    <div class="g-one content">
        <h4><a href=""><img src="skins/default/img/index/one_03.jpg" alt=""/>
                <p>发展，源于对服务客户的忠诚，我们感恩每位客户</p></a></h4>
        <div class="one">
            <dl class="dl1">
                <dt><a href=""><span>实体+网络一体化</span></a></dt>
                <dd><p>
                        <span>自有汉口+光谷两大体验馆</span><span>网络和实体同步优惠价</span><span>24小时客服在线服务</span><span>网上预约免费上门设计</span>
                    </p><a
                            href=""><em>现在咨询</em></a></dd>
            </dl>
            <dl class="dl2">
                <dt><a href=""><span>精选案例</span></a></dt>
                <dd><p><span>超过1000家案例实拍图</span><span>上百种办公风格展示</span><span>体验潮流设计理念</span><span>确保样式新颖 质量可靠</span>
                    </p><a
                            href=""><em>点击查看</em></a></dd>
            </dl>
            <dl class="dl3">
                <dt><a href=""><span>自建工厂</span></a></dt>
                <dd><p>
                        <span>顶级生产设备和技术</span><span>稳定技术人员和管理团队</span><span>自产自销 价格低20%</span><span>自己配送及安装 缩减成本</span>
                    </p><a
                            href=""><em>工厂图册</em></a></dd>
            </dl>
            <dl class="dl4">
                <dt><a href=""><span>办公家具定制</span></a></dt>
                <dd><p><span>专业团队上门勘测</span><span>多空间风格选择</span><span>多款式自由搭配</span><span>个性空间量身定做</span></p><a
                            href=""><em>现在定制</em></a>
                </dd>
            </dl>
            <dl class="none dl5">
                <dt><a href=""><span>品质承诺</span></a></dt>
                <dd><p><span>政府采购供应商</span><span>板材健康环保</span><span>全球采购优质五金配件</span><span>24小时无忧售后</span></p><a
                            href=""><em>在线咨询</em></a></dd>
            </dl>
        </div>
    </div>
    <div class="g-gg2">
        <div class="gg2 content">
            <p>全国定制热线：<b>400-678-5198</b></p>
            <span>
            <a class="a1" href="http://p.qiao.baidu.com/cps/chat?siteId=3552126&amp;userId=2186107" title="立即咨询"
               target="_blank">立即咨询</a>
            <a class="a2" href="http://p.qiao.baidu.com/cps/chat?siteId=3552126&amp;userId=2186107"
               title="立即咨询" target="_blank">预约上门</a>
        </span>
        </div>
    </div>
    <div class="g-cpzx">
        <div class="cpzx content">
            <div class="cp-l">
                <h3>红鑫产品中心</h3>
                <div class="lcc">
                    <#if categorys??>
                        <#list categorys as category>
                            <#if category?? && category.id gt 0>
                                <#if !(category.name=='其它' || !(category.childs?? && (category.childs?size > 0)))>
                                    <h4><a href="/product/category/${category.id}">${category.name}</a></h4>
                                    <#if category.childs?? && (category.childs?size > 0) >
                                        <ul class="clearfix">
                                        <#list category.childs as child>
                                            <li><a href="/product/category/${child.id}">${child.name}</a></li>
                                        </#list>
                                        </ul>
                                    </#if>
                                </#if>
                            </#if>
                        </#list>
                    </#if>
                </div>
            </div>
            <div class="cp-r">
                <div class="r-t">
                    <ul>
                        <#if categorys??>
                            <#list categorys as category>
                                <#if category?? && category.id gt 0>
                                    <#if category.ident?? && category.ident=='other'>
                                        <#if category.childs?? && (category.childs?size > 0) >
                                            <ul class="clearfix otherProduct">
                                                <#list category.childs as child>
                                                    <li data-index="${child_index}" <#if child_index==0>class="cur" </#if>><a href="/product/category/${category.id}">${child.name}</a></li>
                                                </#list>
                                            </ul>
                                        </#if>
                                    </#if>
                                </#if>
                            </#list>
                        </#if>
                    </ul>
                    <em><a href="">更多>></a></em>
                </div>

                <#if otherChilds??>
                    <#list otherChilds as otherChild>
                        <#if (otherChild?? && otherChild.id gt 0) && (otherChild.products?? && (otherChild.products?size > 0))>
                            <div class="r-c pro_tab tabCat otherProductChildTabCat otherProductChild_${otherChild_index}" <#if otherChild_index==0>style="display: block;"<#else >style="display: none;"</#if>>
                                <#list otherChild.products as otherChildProduct>
                                    <dl style="${otherChildProduct_index}" <#if (otherChildProduct_index+1)%3 ==0>class="none" </#if>>
                                        <dt><a href="/product/${otherChildProduct.id}"><img src="${otherChildProduct.banner}" alt=""/></a></dt>
                                        <dd>
                                            <a href="/product/${otherChildProduct.id}"><b>${otherChildProduct.name}</b></a>
                                            <#if otherChildProduct.size??><p><span>产品尺寸：${otherChildProduct.size}</span></p></#if>
                                        </dd>
                                    </dl>
                                </#list>
                            </div>
                        </#if>
                    </#list>
                </#if>

                <div class="r-b">
                    <ul>
                        <li class="fl"><a href=""><img src="skins/default/img/index/cpp_31.jpg" alt=""/></a></li>
                        <li class="fr"><a href=""><img src="skins/default/img/index/cpp_33.jpg" alt=""/></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="g-anal content">
        <div class="an-t">
            <span><a href="">大家都喜欢的案例</a></span>
            <ul class="successArticle">
                <#if successArticles??>
                    <#list successArticles as successArticle>
                        <#if successArticle?? && successArticle.categoryId gt 0>
                            <#if successArticle.articles?? && (successArticle.articles?size > 0) >
                                <li data-index="${successArticle_index}" <#if successArticle_index==0>class="cur" </#if>><a href="">${successArticle.categoryName}</a></li>
                            </#if>
                        </#if>
                    </#list>
                </#if>
            </ul>
            <em><a href="">更多>></a></em>
        </div>
        <div class="an-c">
            <div class="c-l">
                <a href=""><img src="skins/default/img/index/two_13.jpg" alt=""/></a>
                <b><a class="le" href="">案例精选</a><a class="ri" href="">更多>></a></b>
                <ul>
                    <#if randomArticles??>
                        <#list randomArticles as randomArticle>
                            <#if randomArticle?? && randomArticle.id gt 0>
                                <li style="table-layout:fixed;word-break:keep-all;white-space:nowrap;overflow:hidden; text-overflow:ellipsis; "><a href="/article/${randomArticle.id}">${randomArticle.name}</a></li>
                            </#if>
                        </#list>
                    </#if>
                </ul>
            </div>
            <div class="c-r">
                    <#if successArticles??>
                        <#list successArticles as successArticle>
                            <#if successArticle?? && successArticle.categoryId gt 0>
                                <#if successArticle.articles?? && (successArticle.articles?size > 0) >
                                    <div class="c-r pro_tab tabCat successArticleTabCat successArticleChild_${successArticle_index}" <#if successArticle_index==0>style="display: block;"<#else >style="display: none;"</#if>>
                                        <ul>
                                            <#list successArticle.articles as successArticleItem>
                                                <li><a target="_blank" href="/article/${successArticleItem.articleId}"><img src="${successArticleItem.image!}" alt=""/><span>${successArticleItem.name}</span></a>
                                            </#list>
                                        </ul>
                                    </div>
                                </#if>
                            </#if>
                        </#list>
                    </#if>
                </ul>
            </div>
        </div>
        <div class="an-b">
            <ul>
                <li><a href=""><img src="skins/default/img/index/gmg_06.png" alt=""/><span><b>免费</b>上门量尺</span></a></li>
                <li><a href=""><img src="skins/default/img/index/gmg_09.png" alt=""/><span><b>免费</b>量身定制</span></a></li>
                <li><a href=""><img src="skins/default/img/index/gmg_11.png" alt=""/><span><b>免费</b>出3D效果图</span></a></li>
                <li><a href=""><img src="skins/default/img/index/gmg_13.png" alt=""/><span><b>免费</b>上门安装</span></a></li>
                <li class="none"><a href=""><img src="skins/default/img/index/gmg_15.png" alt=""/><span><b>免费</b>保修，终身维护</span></a></li>
            </ul>
        </div>
    </div>
    <div class="g-diz">
        <div class="diz content">
            <h4><a href="">汉口、光谷等四大精品体验馆 诚邀您的到来<span>真正的实物体验 让购买更加放心</span></a></h4>
            <div class="zc">
                <ul>
                    <li><a href=""><img src="skins/default/img/index/th_07.jpg"
                                        alt=""/><span><b>汉口体验馆</b>  027-83939586</span></a></li>
                    <li><a href=""><img src="skins/default/img/index/th_09.jpg"
                                        alt=""/><span><b>汉口体验馆</b>  027-83939586</span></a></li>
                    <li><a href=""><img src="skins/default/img/index/th_16.jpg"
                                        alt=""/><span><b>汉口体验馆</b>  027-83939586</span></a></li>
                    <li><a href=""><img src="skins/default/img/index/th_17.jpg"
                                        alt=""/><span><b>汉口体验馆</b>  027-83939586</span></a></li>
                </ul>
                <dl>
                    <dt><a href="/zyzt"><img src="skins/default/img/index/th_12.jpg" alt=""/></a></dt>
                    <dd><a href="/zyzt">点击获取体验馆详细地址</a></dd>
                </dl>
            </div>
        </div>
    </div>
    <div class="g-ys">
        <h4><a href=""><img src="skins/default/img/index/one_03.jpg" alt=""/>
                <p>选择红鑫的优势</p></a></h4>
        <div class="ys1">
            <dl class="content">
                <dt><span>01</span><em>公司优势</em></dt>
                <dd><p><span>17年</span>办公家具设计及生产经验</p>
                    <p>厂房总面积<span>50,000平方米</span>，稳定技术人员和管理团队</p>
                    <p>获得<span>ISO质量管理认证、健康安全认证、环境管理认证</span></p>
                    <p>获得<span>“湖北省名优产品”、“消费者信赖产品”、“湖北家具行业十大知名名牌”</span>等荣誉</p></dd>
            </dl>
        </div>
        <div class="ys2">
            <dl class="content">
                <dt><span>02</span><em>产品优势</em></dt>
                <dd><p>有<span>木制类、胶板屏风类、软体类、钢制类</span>四大类别办公家具</p>
                    <p>秉承人性化设计理念，<span>有现代风、传统风、古典实木</span>众多风格家具</p>
                    <p>引进国内顶级的面漆房和全环保的<span>除尘设备</span>和<span>UV生产</span>设备</p></dd>
            </dl>
        </div>
        <div class="ys3">
            <dl class="content">
                <dt><span>03</span><em>服务优势</em></dt>
                <dd><p>O2O<span>一站式体验</span>，免费上门量尺，<span>免费</span>出3D效果图，免费制作配套方案</p>
                    <p><span>一对一</span>对接服务</p>
                    <p><span>免费</span>上门安装，免费维修，终身维护</p>
                    <#--https://p.qiao.baidu.com/cps/chat?siteId=3552126&userId=2186107-->
                    <p>24小时无忧售后</p><a href=""><em>立即咨询</em></a></dd>
            </dl>
        </div>
    </div>
    <div class="g-ryzs">
        <div class="ryzs content">
            <h4><a href="">荣誉资质<p>选择红鑫的优势</p></a></h4>
            <div class="rys">
                <a class="le" href=""></a>
                <div class="ssf">
                    <ul>
                        <li><a href=""><img src="skins/default/img/index/ry_07.jpg" alt=""/><span>湖北省名优产品</span></a>
                        </li>
                        <li><a href=""><img src="skins/default/img/index/ry_07.jpg" alt=""/><span>湖北省名优产品</span></a>
                        </li>
                        <li><a href=""><img src="skins/default/img/index/ry_07.jpg" alt=""/><span>湖北省名优产品</span></a>
                        </li>
                        <li class="none"><a href=""><img src="skins/default/img/index/ry_07.jpg"
                                                         alt=""/><span>湖北省名优产品</span></a></li>
                    </ul>
                </div>
                <a class="ri" href=""></a>
            </div>
        </div>
    </div>
    <div class="g-zhh">
        <div class="zhh content">
            <h4><a href="">走进红鑫<span>尽心尽力尽责 认真做好每一天</span></a></h4>
            <div class="zhhx">
                <div class="hx-l">
                    <dl>
                        <dt><a href=""><img src="skins/default/img/index/zh_07.jpg" alt=""/></a></dt>
                        <dd><a href=""><b>武汉红鑫家俱有限公司</b></a>
                            <p>
                                武汉红鑫家俱有限公司成立于2003年，注册资金1050万，公司前身为武汉红鑫办公家具厂，红鑫是一家集开发、设计、生产、销售和服务于一体的专业化办公家具公司；定位于办公家具整体策划解决专家。系中国家具协会理事、湖北省家具协会理事、武汉市家具协会副会长单位</p>
                            <a href=""><em>查看详情>></em></a></dd>
                    </dl>
                    <div class="sxc">
                        <a class="le" href=""></a>
                        <div class="zhs">
                            <ul>
                                <li><a href=""><img src="skins/default/img/index/zh_11.jpg"
                                                    alt="武汉办公家具"/><span>工厂一</span></a></li>
                                <li><a href=""><img src="skins/default/img/index/zh_13.jpg"
                                                    alt="武汉办公家具厂"/><span>工厂二</span></a>
                                </li>
                                <li><a href=""><img src="skins/default/img/index/zh_15.jpg"
                                                    alt="武汉办公家具定制"/><span>工厂三</span></a>
                                </li>
                            </ul>
                        </div>
                        <a class="ri" href=""></a>
                    </div>
                </div>
                <div class="hx-r">
                    <ul>
                        <li class="cur"><a href="">新闻动态</a></li>
                        <li><a href="">办公家具常识</a></li>
                    </ul>
                    <div class="wd">
                        <dl>
                            <dt><a href="">武汉办公家具为什么选择红鑫？</a></dt>
                            <dd>武汉红鑫家具有限公司，是一家专业致力于研发、生产、销售为一体的现代办公家具生产厂家，我们提供....<a href="">【更多详情】</a></dd>
                        </dl>
                        <dl>
                            <dt><a href="">武汉办公家具为什么选择红鑫？</a></dt>
                            <dd>武汉红鑫家具有限公司，是一家专业致力于研发、生产、销售为一体的现代办公家具生产厂家，我们提供....<a href="">【更多详情】</a></dd>
                        </dl>
                        <dl>
                            <dt><a href="">武汉办公家具为什么选择红鑫？</a></dt>
                            <dd>武汉红鑫家具有限公司，是一家专业致力于研发、生产、销售为一体的现代办公家具生产厂家，我们提供....<a href="">【更多详情】</a></dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $('.otherProduct li').mouseover(function() {
            $('.otherProduct li').removeClass("cur");
            $(this).attr("class","cur")
            $(".otherProductChildTabCat").hide();
            $(".otherProductChild_"+$(this).data("index")).show();
        });

        $('.successArticle li').mouseover(function() {
            $('.successArticle li').removeClass("cur");
            $(this).attr("class","cur")
            $(".successArticleTabCat").hide();
            $(".successArticleChild_"+$(this).data("index")).show();
        });
    </script>
</@html>
