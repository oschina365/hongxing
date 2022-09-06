<#include "../mobile/common/layout.ftl"/>
<@html title_="${product.name} |武汉办公家具定制,办公室家具品牌,办公桌椅定制-红鑫家俱" css_=["/mobile/css/product.css"]>
	<div class="g-bd">
		<!--产品导航-->
		<h3 class="m-btit">
			<a href="/">首页</a>
			<span></span>
			<a href="/product/category/${product.category_id}" title="${product.category_name}">${product.category_name}</a>
		</h3>

		<div class="m-con">
			<!--产品标题-->
			<div class="u-mtit f-tc s-wc">
				<h1>${product.name}</h1>
			</div>
			<!--产品内容-->
			<div class="m-slicon">
				<div class="pro_gd j-slide-np">
					<div class="m-nowra">
						<div class="prev"></div>
						<div class="no_ov">
							<div class="m-box">
								<img src='${product.banner}' width="250" height="167" alt="${product.name}" title="${product.name}" />
							</div>
						</div>
						<div class="next"></div>
					</div>
				</div>
			</div>

			<div class="contactus"></div>

			<!--产品简介-->
			<div class="m-abpro">
				<h2 class="m-tit z-spe s-wc ">产品简介</h2>
				<div class="m-con">
					${product.desc}
				</div>
			</div>
			<!--产品详情-->
			<div class="m-abpro">
				<h2 class="m-tit z-spe s-wc">产品详情</h2>
				<div id="content" class="m-con">
					${product.content}
					<div class="clear"></div>
				</div>
			</div>

			<!--分享-->
			<div class="m-share">
				<div class="m-ico">
					<span>分享到：</span>
					<a href="http://www.jiathis.com/send/?webid=tsina&url=http%3a%2f%2fwww.hongxin.com.cn%2fMobile%2fmProducts%2fgjjbshyz.html&title=%e9%92%a2%e6%9e%b6%e8%84%9a%e6%9d%bf%e5%bc%8f%e4%bc%9a%e8%ae%ae%e6%a1%8c" class="u-ico-1"></a>
					<a href="http://ti.3g.qq.com/open/s?vt=5&aid=share&sbid=801389636&g_ut=3&msg=%e9%92%a2%e6%9e%b6%e8%84%9a%e6%9d%bf%e5%bc%8f%e4%bc%9a%e8%ae%ae%e6%a1%8chttp%3a%2f%2fwww.hongxin.com.cn%2fMobile%2fmProducts%2fgjjbshyz.html&return=http%3a%2f%2fwww.hongxin.com.cn%2fMobile%2fmProducts%2fgjjbshyz.html" class="u-ico-2"></a>
					<a href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=http%3a%2f%2fwww.hongxin.com.cn%2fMobile%2fmProducts%2fgjjbshyz.html&summary=%e9%92%a2%e6%9e%b6%e8%84%9a%e6%9d%bf%e5%bc%8f%e4%bc%9a%e8%ae%ae%e6%a1%8c&title=%e9%92%a2%e6%9e%b6%e8%84%9a%e6%9d%bf%e5%bc%8f%e4%bc%9a%e8%ae%ae%e6%a1%8c" class="u-ico-3"></a>
					<div class="clear"></div>
				</div>
			</div>
			<!--留言-->
			<div>
				<h2 class="m-tit s-wc z-spe">
					<span class="u-ico"></span>我要下单
				</h2>
				<ul class="leave">
					<li>
						<span>姓名</span>
						<div class="input_wrap">
							<input id="UserName" class="name clear_word" type="text" value="请输入姓名" name="">
						</div>
					</li>
					<li>
						<span>手机</span>
						<div class="input_wrap">
							<input id="Phone" class="name clear_word" type="text" value="请输入手机号" name="">
						</div>
					</li>
					<li>
						<span>留言</span>
						<div class="input_wrap">
							<textarea id="OrderInfo" name="" cols="" rows="" class="ly clear_word">请输入留言</textarea>
						</div>
					</li>
				</ul>
				<p id="ErrorInfo" class="red pl10"></p>
				<p class="show_more2">
					<input id="submitOrder" class="u-co-bt fr" type="button" value="提 交" name="" onclick='submitOrder("UserName","Phone","OrderInfo",52)'>
				</p>
			</div>
			<!--关于"手机"的相关产品-->
			<div class="m-rec j-slide-np">
				<a href="#" class="s-wc">
					<h2 class="m-tit z-spe">
						<font>关于“</font>
						<strong class="xg">会议桌系列,武汉办公家具,办公家具,办公家具定制</strong>
						<font>”的相关产品</font>
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
											<img src='${randomProduct.banner}' width='130' height='94' alt='${randomProduct.name}'
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
			<!--关于手机的相关新闻-->
			<div class="m-about">
				<h2 class="m-tit z-spe s-wc ">热点推荐</h2>
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
			<div class="clear"></div>
		</div>
	</div>

</@html>