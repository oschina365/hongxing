<#include "common/layout.ftl"/>
<@html title_="武汉红鑫办公家具|武汉办公家具厂家|办公家具一站式采购定制" css_=["/skins/default/style.css"] >
    <#include "common/tianmao.ftl"/>
    <body>
        <#include "common/pfb.ftl" />
        <#include "common/g_top.ftl" />

        <div class="ban-ss">
            <div class="banan-t content">
                <p>
                    <b>热门搜索词：</b>
                    <a href="/product/" title="红鑫办公家具定制">红鑫办公家具定制</a>
                    <a href="/product/" title="保密文件柜钢制铁皮更衣档案储物密集柜厂家定做报价">保密文件柜钢制铁皮更衣档案储物密集柜厂家定做报价</a>
                    <a href="/product/" title="老板办公室桌椅沙发">老板办公室桌椅沙发</a>
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
        <div class="topadcs">
            <a class="fullad" href="/gcal" title="精彩设计,用心呈现" style="background:url('/res/images/banner1.jpg') no-repeat center top;"></a>
        </div>
        <div class="content">
            <div class="right">
                <div class="righttop"></div>
                <div class="right_main">
                    <div class="plc">
                        <span class="red_x">当前位置：</span>
                        <a href="/" title="首页">首页</a>
                        <#if parentCategoryId?? && parentCategoryName??>
                            &raquo; <a href="/gcal?id=${parentCategoryId}" title="${parentCategoryName}">${parentCategoryName}</a>
                            &raquo; <a href="/gcal?id=${currentCategoryId}" title="${currentCategoryName}">${currentCategoryName}</a>
                            <#elseif  currentCategoryId?? && currentCategoryName??>
                            &raquo; <a href="/gcal?id=${currentCategoryId}" title="${currentCategoryName}">${currentCategoryName}</a>
                            <#else>
                            &raquo; <a href="/gcal?id=88" title="成功案例">成功案例</a>
                        </#if>
                    </div>
                    <div class="news_con News_4 News_4_12">
                        <input type="hidden" id="currentCategoryId" value="${currentCategoryId!''}"/>
                        <div id="successArticleListDiv"></div>
                        <div class="clear"></div>
                        <div id="successArticlePage">
                        </div>
                    </div>
                </div>
                <div class="rightbot"></div>
            </div>
            <div class="left">
                <div class="leib2 leib2s">
                    <div class="tit">
                        成功案例
                    </div>
                    <div class="nr">
                        <ul>
                            <#if successArticleCategorys??>
                                <#list successArticleCategorys as successArticleCategory>
                                    <#if successArticleCategory?? && successArticleCategory.id gt 0>
                                        <li <#if currentCategoryId?? && currentCategoryId==successArticleCategory.id>class="cur"</#if>>
                                            <a href="/gcal?id=${successArticleCategory.id}" title="${successArticleCategory.name}">${successArticleCategory.name}</a>
                                        </li>
                                    </#if>
                                </#list>
                            </#if>
                        </ul>
                    </div>
                </div>

                <div class="leib2 leib2_news">
                    <div class="tit">
                        新闻资讯
                    </div>
                    <div class="nr">
                        <ul>
                            <#if newsArticleCategorys??>
                                <#list newsArticleCategorys as newsArticleCategory>
                                    <#if newsArticleCategory?? && newsArticleCategory.id gt 0>
                                        <li <#if currentCategoryId?? && currentCategoryId==newsArticleCategory.id>class="cur"</#if>>
                                            <a href="/gcal?id=${newsArticleCategory.id}" title="${newsArticleCategory.name}">${newsArticleCategory.name}</a>
                                        </li>
                                    </#if>
                                </#list>
                            </#if>
                        </ul>
                    </div>
                </div>

                <div class="leiblx">
                    <div class="tit">
                        联系红鑫家具
                    </div>
                    <div class="leftlx">
                        <div class="dianh">
                            <div class="dianhua">
                                咨询热线：<span>400-678-5198</span>
                            </div>
                            <p>座机：027-8393-9586 </p>
                            <p>手机：182-0718-0190</p>
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

        <script id="successArticleListTpl" type="text/html">
            {{#  if(d.list!=null&&d.list.length> 0){ }}
            {{#  layui.each(d.list, function(index, item){ }}
            {{# if(item){ }}
            <dl class="HZAL4 news_hover4">
                <dt>
                    <a href="/article/{{item.id}}" title="{{item.name}}" target="_blank">
                        <img src="{{item.banner}}" alt="{{item.name}}" title="{{item.name}}" />
                    </a>
                </dt>
                <dd>
                    <h4>
                        <a href="/article/{{item.id}}" title=" {{item.name}}  " target="_blank"> {{item.name}} </a>
                    </h4>
                    <p>{{item.desc}}</p>
                    <span>
                        <a href="/article/{{item.id}}" target="_blank" title="查看详情">查看详情 >></a>
                    </span>
                </dd>
            </dl>
            {{#} else { }}
            {{# }}}
            {{#  }); }}
            {{#} else { }}

            {{# }}}

        </script>
        <script type="text/javascript">
            layui.use(['form', 'layer', 'jquery', 'laypage', 'laytpl', 'util'], function () {
                var form = layui.form
                    , layer = parent.layer === undefined ? layui.layer : parent.layer
                    , laypage = layui.laypage, laytpl = layui.laytpl, $ = layui.jquery;

                dataList(1);

                /**
                 * 查询数据列表
                 * @param number
                 */
                function dataList(number) {
                    var currentCategoryId =$("#currentCategoryId").val();
                    $.ajax({
                        url: '/article/list',
                        method: 'get',
                        dataType: 'json',
                        data: {"categoryId":currentCategoryId,"page": number,"limit":6},
                        success: function (data) {
                            console.log(data);
                            if (data && data.code == 1) {
                                var listData = {"list": data.result.list};
                                var getTpl = successArticleListTpl.innerHTML, view = document.getElementById('successArticleListDiv');

                                laytpl(getTpl).render(listData, function (html) {
                                    view.innerHTML = html;
                                });
                                form.render();

                                if(data.result.count >0){
                                    if (number === 1) {
                                        //分页标签
                                        pageBar(data.result.count, 6);
                                    }
                                }

                            }
                        }
                    });
                }

                /**
                 * 数据分页
                 * @param count
                 * @param limit
                 */
                function pageBar(count, limit) {
                    //var themes = ['#ff0000', '#eb4310', '#3f9337', '#219167', '#239676', '#24998d', '#1f9baa', '#0080ff', '#3366cc', '#800080', '#a1488e', '#c71585', '#bd2158'];
                    var themes = ['#E70012'];
                    laypage.render({
                        elem: "successArticlePage",
                        limit: limit,
                        count: count,
                        first: '首页',
                        last: '尾页',
                        theme: themes[parseInt(Math.random() * themes.length)],
                        layout: ['prev', 'page', 'next'],
                        jump: function (obj, first) {
                            if (!first) {
                                $("#number").val(obj.curr);
                                dataList(obj.curr);
                            }
                        }
                    });
                }
            }).extend({
                fly: 'index'
            }).use('fly');

            if ($("div.right").height() > $('div.left')) {
                $("#righttuijian").hide().next("div.rightbot").hide();
            } else {
                $("#lefttuijian").hide();
            }
        </script>
    </body>
</@html>