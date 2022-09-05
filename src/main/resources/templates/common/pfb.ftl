<div class="pfb">
    <div class="fb content">
        <ul class="fb_ul">
            <li>
                <a class="fb_a fb_a_f" href="/product">办公家具分类</a>|
                <div class="erji">
                    <#if topCategorys??>
                        <#list topCategorys as topCategory>
                            <#if topCategory?? && topCategory.id gt 0 && topCategory.small_icon??>
                                <span class="span_${topCategory_index}">
										<a class="sp_a" href="/product/category/${topCategory.id}" title="${topCategory.name}">
											<i><img src="${topCategory.small_icon!''}" /></i>${topCategory.name}
										</a>

										<div class="sanji sanji_1">
											<em>
												<#if topCategory.childs?? && (topCategory.childs?size > 0) >
                                                    <#list topCategory.childs as topCategoryChild>
                                                        <a class="cur" href="/product/category/${topCategoryChild.id}" title="${topCategoryChild.name}">
															<i>${topCategoryChild.name}</i>
														</a>
                                                    </#list>
                                                </#if>
											</em>
											<b>
												<#if topCategory.childs?? && (topCategory.childs?size > 0) >
                                                    <#list topCategory.childs as topCategoryChild>
                                                        <a style='display:block' href="/product/category/${topCategoryChild.id}" title="${topCategoryChild.name}">
															<img src="${topCategoryChild.banner}" alt="${topCategoryChild.name}" />
														</a>
                                                    </#list>
                                                </#if>
											</b>
										</div>
									</span>
                            </#if>
                        </#list>
                    </#if>
                </div>
                <script type="text/javascript">
                    $(".erji span").each(function (i) {
                        $(".erji .span_" + i).mouseover(function () {
                            $(this).addClass("cur").siblings("span").removeClass("cur");
                            $(this).children(".sanji").show().parent().siblings("span").children(".sanji").hide();
                        }).eq(0).trigger("mouseover");

                        $(".sanji_" + i + " em a").mouseover(function () {
                            var _index = $(this).parent().children("a").index(this);
                            $(this).addClass("cur").siblings("a").removeClass("cur");
                            $(this).parent().siblings("b").find("a").eq(_index).show().siblings("a").hide();
                        }).eq(0).trigger("mouseover");
                    });
                </script>

            </li>
            <li>
                <a class="fb_a" href="/">首页</a>|
            </li>
            <li>
                <a class="fb_a" href="/gcal">工程案例图</a>|
            </li>
            <li>
                <a class="ts fb_a" href="/zyzt">直营展厅</a>
            </li>
        </ul>
        <div class="fsr form">
            <input class="inp01s keypress" button="#sousuotow" type="text" defvalue="请输入热门关键词" id="seachkeywordstow">
            <input class="inp02s" type="bottom" id="sousuotow">
        </div>
        <em>400-678-5198</em>
    </div>
</div>