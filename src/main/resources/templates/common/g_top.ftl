<div class="g-top">
	<div class="header">
		<div class="nav">
			<p class="fr">
				<a href="javascript:void(0);" onclick="javascript:addBookmark(this)" title="收藏本站">
					收藏网站
				</a>
				|
				<a href="/contact" target="_blank" title="联系红鑫">
					联系红鑫
				</a>
				|
				<a href="/sitemap" title="网站地图" target="_blank">
					网站地图
				</a>
			</p>
			您好，欢迎来到红鑫办公家具官网！
		</div>
		<div class="top">
			<div class="logo">
				<a href="/" title="武汉红鑫家俱有限公司">
					<img src="/res/images/logo/logo.jpg" alt="武汉办公家具" title="武汉办公家具" />
				</a>
			</div>
			<div class="zi1">
				办公家具整体配套大型生产厂家
				<p>
					5000㎡自营体验馆为您
					<span>
						省时省心更省钱！
					</span>
				</p>
			</div>
			<div class="tel">
				<p>
					<span>
						400-678-5198
					</span>
					<span>
						027-83939586
					</span>
				</p>
			</div>
			<div class="lb">
				<a href="http://p.qiao.baidu.com/cps/chat?siteId=3552126&userId=2186107" title="立即咨询免费领取1980元进店大礼包！" target="_blank">
					免费领取1980元进店大礼包！
				</a>
			</div>
		</div>
		<div class="menu">
			<ul class="ul_col">
				<li>
					<a class="tfs" href="/product">
						办公家具分类
					</a>
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
						$(".erji span").each(function(i) {
							$(".erji .span_" + i).mouseover(function() {
								$(this).addClass("cur").siblings("span").removeClass("cur");
								$(this).children(".sanji").show().parent().siblings("span").children(".sanji").hide();
							}).eq(0).trigger("mouseover");

							$(".sanji_" + i + " em a").mouseover(function() {
								var _index = $(this).parent().children("a").index(this);
								$(this).addClass("cur").siblings("a").removeClass("cur");
								$(this).parent().siblings("b").find("a").eq(_index).show().siblings("a").hide();
							}).eq(0).trigger("mouseover");
						});
					</script>
				</li>
			</ul>
			<ul>
				<li <#if currentUrl?? && currentUrl=='/'>
					class="cur"
				</#if>
				>
					<a href="/" title="红鑫首页">
						红鑫首页
					</a>
				</li>
				<li <#if currentUrl?? && currentUrl=='/gcal'>
					class="cur"
				</#if>
				>
					<a href="/gcal" title="工程案例">
						工程案例
					</a>
				</li>
				<li <#if currentUrl?? && currentUrl=='/dzfw'>
					class="cur"
				</#if>
				>
					<a href="/dzfw" title="办公家具定制">
						办公家具定制
					</a>
				</li>
				<li <#if currentUrl?? && currentUrl=='/zyzt'>
					class="cur"
				</#if>
				>
					<a href="/zyzt" title="直营展厅">
						直营展厅
					</a>
				</li>
				<li <#if currentUrl?? && currentUrl=='/ryzz'>
					class="cur"
				</#if>
				>
					<a href="/ryzz" title="资质荣誉">
						资质荣誉
					</a>
				</li>
				<li <#if currentUrl?? && currentUrl=='/about'>
					class="cur"
				</#if>
				>
					<a href="/about" title="关于红鑫">
						关于红鑫
					</a>
				</li>
				<li <#if currentUrl?? && currentUrl=='/contact'>
					class="cur"
				</#if>
				>
					<a href="/contact" title="联系我们">
						联系我们
					</a>
				</li>
			</ul>
		</div>
	</div>
</div>