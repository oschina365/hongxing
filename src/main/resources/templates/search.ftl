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
            <div class="right" style="float: none!important;width: 100%!important;">
                <div class="righttop"></div>
                <div class="right_main" style="float: none!important;width: 100%!important;">
                    <div class="plc" style="background: none;">
                        <span class="red_x">当前位置：</span>
                        <a href="/" title="首页">搜索</a>
                        <#if searchKey??>&raquo; ${searchKey}的搜索结果</#if>
                        <button type="button" style="float: right;color: #E70012;" class="layui-btn layui-btn-primary "><a href="/">返回首页</a></button>
                    </span>
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
        </div>
        <div class="clear"></div>

        <script id="successArticleListTpl" type="text/html">
            {{#  if(d.list!=null&&d.list.length> 0){ }}
            {{#  layui.each(d.list, function(index, item){ }}
            {{# if(item){ }}
            <dl class="HZAL4 news_hover4" style="width: 243px!important;">
                <dt>
                    <a href="{{item.url}}" title="{{item.name}}" target="_blank">
                        <img src="{{item.banner}}" alt="{{item.name}}" title="{{item.name}}" />
                    </a>
                </dt>
                <dd>
                    <h4>
                        <a href="{{item.url}}" title=" {{item.name}}  " target="_blank"> {{item.name}} </a>
                    </h4>
                    <p>{{item.desc}}</p>
                    <span>
                        <a href="{{item.url}}" target="_blank" title="查看详情">查看详情 >></a>
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
                        url: '/search/data',
                        method: 'get',
                        dataType: 'json',
                        data: {"key":"${searchKey!''}","categoryId":currentCategoryId,"page": number,"limit":8},
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
                                        pageBar(data.result.count, 8);
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