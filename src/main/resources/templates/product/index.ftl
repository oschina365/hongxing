<#include "../common/layout.ftl"/>
<@html title_="${product.name} - 武汉办公家具|武汉办公桌椅|办公家具定制|武汉红鑫办公家具厂"
css_=["/skins/default/style.css"] >
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
            <a href="/" title="武汉办公家具专业定做定制厂家">武汉办公家具专业定做定制厂家</a>
            <a href="/" title="办公家具办公桌椅生产厂家厂商报价直销">办公家具办公桌椅生产厂家厂商报价直销</a>
            <a href="/sfcjxl.html" title="办公室办公沙发">办公室办公沙发</a>
            <a href="/sfcjxl.html" title="茶几">茶几</a>
            <a href="/hyzxl.html" title="办公会议桌椅大小型实木洽谈桌厂家">办公会议桌椅大小型实木洽谈桌厂家</a>
            <a href="/bgpfxl.html" title="办公屏风桌">办公屏风桌</a>
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
<script type="text/javascript">
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
    <a class="fullad" href="/product/" title="免费提供专属办公空间设计解决方案"
       style="background:url(/res/images/banner10.jpg) no-repeat center top;"></a>
</div>
<div class="content">
    <div class="rightl">
        <div class="righttop"></div>
        <div class="plc">
            <span class="red_x">当前位置：</span>
            <a href="/" title="首页">首页</a>
            <#if parentCategory?? && parentCategory.id gt 0>
                &raquo; <a href="/${parentCategory.id}" title="${parentCategory.name}">${parentCategory.name}</a>
            </#if>
            &raquo; <a href="/product/category/${product.categoryId}" title="${product.category_name}">${product.category_name}</a>
            &raquo; <a href="/product/${product.id}" title="${product.name}">${product.name}</a>
        </div>
        <div class="rightbot"></div>
        <div class="righttop"></div>
        <div class="pro_main">
            <div id="printableview">
                <div class="pleft">
                    <div class="mainbox">
                        <div class="maincont">
                            <div class="prodetailsinfo">
                                <div class="proviewbox">
                                    <div class="probigshow">
                                        <a class="jqzoom" title="${product.name}">
                                            <img src="${product.banner!}" alt="${product.name}" title="${product.name}"
                                                 onload="jqzooms(this)" onerror="jqzooms(this)" class="js_goods_image_url">
                                        </a>
                                    </div>
                                    <div class="div_prothumb">
                                        <div class="thumbporbox">
                                            <ul class="ul_prothumb" id="img_list">
												<#if productImages??>
													<#list productImages as productImage>
														<#if productImage?? && productImage.id gt 0>
															<li class="now">
																<a  title="${product.name}">
																	<img title="${product.name}" alt="${product.name}"
                                                                         longdesc="${productImage.image}" src="${productImage.image}" width="60">
																</a>
															</li>
														</#if>
													</#list>
												</#if>
                                            </ul>
                                        </div>
                                        <span class="span_prev span_prevb">prev</span>
                                        <span class="span_next span_nextb">next</span>
                                    </div>
                                    <div class="div_prolinks">
                                        <button id="a_enlarge" onclick="viewProductImages();">查看全部大图</button>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pright">
                    <div class="propar">
                        <h4 class="corange">${product.name}</h4>
                        <div class="cpc pd_attr">

                        </div>
                        <div class="cps pd_short">${product.desc}
                        </div>
                        <div class="pd_hotline">
                            <span>订购热线：</span>
                            <span class="font_hotline">400-678-5198</span>
                        </div>
                    </div>
                    <div class="propar" style="text-align: center; padding-top: 20px;">
                        <div class="proparp">
                            <a href="http://p.qiao.baidu.com/cps/chat?siteId=3552126&userId=2186107" title="立即咨询">
                                <img style="border: 0" src="/skins/default/img/buynowsmalls.gif" alt="立即咨询" />
                            </a>
                        </div>
                    </div>

                </div>
                <!--
                        <div class="clear"></div>
                        <div class="fenlei">
                            <div class="tit">
                                <a id="detail0" class="cur" onclick="switchExtendAttrTab('detail0',1)"><span>产品详情</span></a>
                                <div class="clear"></div>
                            </div>
                        </div>
        -->
                <div class="clear"></div>
                ${product.content}

                <div class="pro_key">
                    <a target='_blank' href="/search?key=%e6%ad%a6%e6%b1%89%e5%8a%9e%e5%85%ac%e5%ae%b6%e5%85%b7">武汉办公家具</a>
                    <a target='_blank' href="/search?key=%e6%ad%a6%e6%b1%89%e5%8a%9e%e5%85%ac%e6%a1%8c%e6%a4%85">武汉办公桌椅</a>
                    <a target='_blank' href="/search?key=%e5%8a%9e%e5%85%ac%e5%ae%b6%e5%85%b7%e5%ae%9a%e5%88%b6%e5%8e%82%e5%ae%b6">办公家具定制厂家</a>
                    <a target='_blank' href="/search?key=%e5%8a%9e%e5%85%ac%e5%89%8d%e5%8f%b0">办公前台</a>
                    <a target='_blank' href="/search?key=%e5%8a%9e%e5%85%ac%e5%ae%a4%e5%8a%9e%e5%85%ac%e6%b2%99%e5%8f%91">办公室办公沙发</a>
                    <a target='_blank' href="/search?key=%e6%ad%a6%e6%b1%89%e5%8a%9e%e5%85%ac%e5%ae%b6%e5%85%b7%e5%85%ac%e5%8f%b8">武汉办公家具公司</a>
                    <a target='_blank' href="/search?key=%e5%8a%9e%e5%85%ac%e5%ae%b6%e5%85%b7%e5%ae%9a%e5%88%b6%e5%8e%82%e5%ae%b6">办公家具定制厂家</a>
                    <a target='_blank' href="/search?key="></a>
                </div>
                <div class="online" id="tbForm1">
                    <h2 id="caigou">采购：<span>${product.name}</span>
                    </h2>
                    <ul class="clearfix">
                        <li class="li01">
									<span>
										<em class="red_x">*</em>联系人：
									</span>
                            <input type="text" id="txtContact" class="inp1" name="" />
                        </li>
                        <li class="li02">
									<span>
										<em class="red_x">*</em>手机：
									</span>
                            <input type="text" id="txtMobile" class="inp2" name="" />
                        </li>
                        <li class="li01">
                            <span>公司名称：</span>
                            <input type="text" id="txtCompName" class="inp7" name="" />
                        </li>
                        <li class="li03">
                            <span>邮箱：</span>
                            <input type="text" id="txtEmail" class="inp3" name="" />
                        </li>
                        <li style="display: none;" class="li03">
                            <span>电话：</span>
                            <input type="text" id="txtMobile" class="inp3" name="" />
                        </li>
                        <li style="display: none;" class="li03">
                            <span>地址：</span>
                            <input type="text" id="txtAddr" class="inp3" name="" />
                        </li>
                        <li class="li04">
									<span>
										<em class="red_x">*</em>采购意向：
									</span>
                            <textarea id="txtContent" class="inp4" rows="" cols="" name="" />
                            </textarea>
                        </li>
                        <li class="li05">
									<span>
										<em class="red_x">*</em>验证码：
									</span>
                            <input type="text" id="txtValidate" class="inp5" name="" />
							<img id="Codes" src="/captcha/?key=productDetail"
								 onerror="this.src='/captcha/?key=productDetail&codeTime='+new Date().getTime();"
								 onclick="this.src='/captcha/?key=productDetail&codeTime='+new Date().getTime();"/>
                        </li>
                        <li class="li06">
                            <input type="button" class="b15 btn1" onclick="submitOrder(this,287)" value="提 交" name="" />
                            <input type="button" value="重 填" onclick="emptyText('tbForm1')" class="b15 btn2" name="" />
                        </li>
                    </ul>
                </div>
            </div>

            <h4 class='t06 f14 mt8'>相关资讯</h4>
            <div class='info_b2'>
                <ul class='p_list_ul2'>
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
                <div class='clear'></div>
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
    <div class="clear"></div>
</div>
<!--content:end-->
<script type="text/javascript">
    if ($("div.leftr").height() - $("div.rightl").height() > 500) {
        $("#divHistoryRecommentCntr").hide();
    } else {
        $("#divHistoryRecommentCntr").show();
    }

    $(".proviewbox a").click(function(){
        viewProductImages();
    });

    function viewProductImages(){
        //图片层
        $.get('/product/images/${product.id}', function(json){
            layer.photos({
                photos: json //格式见API文档手册页
                ,anim: 1 //0-6的选择，指定弹出图片动画类型，默认随机
            });
        });
    }
</script>
</body>
</@html>