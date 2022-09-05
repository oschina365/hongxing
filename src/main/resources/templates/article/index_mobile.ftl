<#include "../mobile/common/layout.ftl"/>
<@html title_="${article.name} |武汉办公家具定制,办公室家具品牌,办公桌椅定制-红鑫家俱">
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
</@html>