<#include "../common/layout.ftl"/>
<@html title_="武汉红鑫办公家具|武汉办公家具厂家|办公家具一站式采购定制" css_=["/skins/default/style.css"] >
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
                <#include "../common/category_list.ftl" />
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
                        &raquo; <a href="/product" title="产品中心">产品中心</a>
                        <#if parentCategory?? && parentCategory.id??>
                            &raquo; <a href="/product/category/${parentCategory.id}" title="${parentCategory.name}">${parentCategory.name}</a>
                            &raquo; <a href="/product/category/${currentCategory.id}" title="${currentCategory.name}">${currentCategory.name}</a>
                        <#elseif  currentCategory?? && currentCategory.id??>
                            &raquo; <a href="/product/category/${currentCategory.id}" title="${currentCategory.name}">${currentCategory.name}</a>
                        </#if>
                    </div>
                    <div class="news_con News_4 News_4_12">
                        <input type="hidden" id="currentCategoryId" value="${currentCategory.id!''}"/>
                        <div id="successProductListDiv"></div>
                        <div class="clear"></div>
                        <div id="successProductPage">
                        </div>
                    </div>
                </div>
                <div class="rightbot"></div>
            </div>
            <div class="leftr">
                <div class="cp-l">
                    <h3>红鑫产品中心</h3>
                    <div class="lcc">
                        <#if categorys??>
                            <#list categorys as category>
                                <#if category?? && category.id gt 0>
                                    <#if !(category.name=='其它' || !(category.childs?? && (category.childs?size > 0)))>
                                        <h4 <#if category.id==currentCategory.id>class="cur" </#if>><a href="/product/category/${category.id}">${category.name}</a></h4>
                                        <#if category.childs?? && (category.childs?size > 0) >
                                            <ul class="clearfix">
                                                <#list category.childs as child>
                                                    <li <#if child.id==currentCategory.id>class="cur" </#if>><a href="/product/category/${child.id}">${child.name}</a></li>
                                                </#list>
                                            </ul>
                                        </#if>
                                    </#if>
                                </#if>
                            </#list>
                        </#if>
                    </div>
                </div>
                <div id="divHistoryRecommentCntr"></div>
                <div id="divHistoryCntr" class="leib2" style="display: none;"></div>
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

        <script id="successArticleListTpl" type="text/html">
            {{#  if(d.list!=null&&d.list.length> 0){ }}
            {{#  layui.each(d.list, function(index, item){ }}
            {{# if(item){ }}
            <dl class="HZAL4 news_hover4">
                <dt>
                    <a href="/product/{{item.id}}" title="{{item.name}}" target="_blank">
                        <img src="{{item.thumbnail}}" alt="{{item.name}}" title="{{item.name}}" />
                    </a>
                </dt>
                <dd>
                    <h4>
                        <a href="/product/{{item.id}}" title=" {{item.name}}  " target="_blank"> {{item.name}} </a>
                    </h4>
                    <p>{{item.desc}}</p>
                    <span>
                        <a href="/product/{{item.id}}" target="_blank" title="查看详情">查看详情 >></a>
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
                        url: '/product/list/'+currentCategoryId,
                        method: 'get',
                        dataType: 'json',
                        data: {"categoryId":currentCategoryId,"page": number,"limit":12},
                        success: function (data) {
                            console.log(data);
                            if (data && data.code == 1) {
                                var listData = {"list": data.result.list};
                                var getTpl = successArticleListTpl.innerHTML, view = document.getElementById('successProductListDiv');

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
                        elem: "successProductPage",
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