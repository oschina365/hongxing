<#include "common/layout.ftl"/>
<@html title_="网站地图_武汉红鑫家俱有限公司">
    <div class="g-map">
        <h2 class="m-btit s-wc">站点地图</h2>
        <div class="m-con">
            <h3 class="main_tit">[红鑫家俱首页]</h3>
            <ul class="map_list">
                <a href="/" target="_blank">
                    <li>红鑫首页</li>
                </a>
                <a href="/cgal.html" target="_blank">
                    <li>工程案例</li>
                </a>
                <a href="/helps/dzfw.html" target="_blank">
                    <li>办公家具定制</li>
                </a>
                <a href="/xxtyg.html" target="_blank">
                    <li>自营体验馆</li>
                </a>
                <a href="/ryzz.html" target="_blank">
                    <li>资质荣誉</li>
                </a>
                <a href="/helps/aboutus.html" target="_blank">
                    <li>关于红鑫</li>
                </a>
                <a href="/helps/contactus.html" target="_blank">
                    <li>联系我们</li>
                </a>
            </ul>
            <h3 class="main_tit">[红鑫家俱产品中心]</h3>
            <ul class="map_list">
                <#if siteMapProductCategorys??>
                    <#list siteMapProductCategorys as siteMapProductCategory>
                        <#if siteMapProductCategory?? && siteMapProductCategory.id gt 0>
                            <a href="/product/category/${siteMapProductCategory.id}" target="_blank">
                                <li>${siteMapProductCategory.name}</li>
                            </a>
                        </#if>
                    </#list>
                </#if>
            </ul>
            <h3 class="main_tit">[红鑫家俱帮助中心]</h3>
            <ul class="map_list">
                <a href="/about" target="_blank">
                    <li>关于红鑫</li>
                </a>
                <a href="/dzfw" target="_blank">
                    <li>定制服务</li>
                </a>
                <a href="/ryzz" target="_blank">
                    <li>荣誉资质</li>
                </a>
                <a href="/xxtyg.html" target="_blank">
                    <li>自营体验馆</li>
                </a>
                <a href="/helps/contactus.html" target="_blank">
                    <li>联系我们</li>
                </a>
                <a href="/help/leaveword.aspx" target="_blank">
                    <li>在线留言</li>
                </a>
                <a href="/gcsl.html" target="_blank">
                    <li>工厂实力</li>
                </a>
            </ul>
            <h3 class="main_tit">[红鑫家俱资讯中心]</h3>
            <ul class="map_list">
                <#if siteMapArticleCategorys??>
                    <#list siteMapArticleCategorys as siteMapArticleCategory>
                        <#if siteMapArticleCategory?? && siteMapArticleCategory.id gt 0>
                            <a href="/gcal?id=${siteMapArticleCategory.id}" target="_blank">
                                <li>${siteMapArticleCategory.name}</li>
                            </a>
                        </#if>
                    </#list>
                </#if>
            </ul>
        </div>
    </div>
</@html>