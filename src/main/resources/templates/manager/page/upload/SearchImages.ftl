<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
	<head>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>
			图片搜索
		</title>
		<link href="/manager/skins/base/common.css" rel="stylesheet" type="text/css">
		<link href="/manager/skins/base/dialog.css" rel="stylesheet" type="text/css">
		<link href="/manager/skins/default/list.css" rel="stylesheet" type="text/css">
		<link href="/manager/skins/default/default.css" rel="stylesheet" type="text/css">
		<link href="/manager/skins/base/gallery.css" rel="stylesheet" type="text/css">
		<link href="/manager/skins/base/products.css" rel="stylesheet" type="text/css">
		<!-- hongxin.com.cn/Mobile Baidu tongji analytics -->
		<script src="https://hm.baidu.com/hm.js?25e431cff63a206eb286efd246de5f2d"></script>
		<script>
			var _hmt = _hmt || [];
			(function() {
				var hm = document.createElement("script");
				hm.src = "https://hm.baidu.com/hm.js?25e431cff63a206eb286efd246de5f2d";
				var s = document.getElementsByTagName("script")[0];
				s.parentNode.insertBefore(hm, s);
			})();
		</script>
		<script type="text/javascript" src="/manager/js/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="/manager/js/common/common.js"></script>
		<script type="text/javascript" src="/manager/js/common/list.js"></script>
	</head>
	<body style="height:400px;width:700px;margin:0 auto; overflow:hidden;" marginwidth="0" marginheight="0">
		<style type="text/css">
			div.album_select{ margin-top:10px;}
			div.viewlist{margin-top:10px;}
			div.view_area{ height:165px;}
			div.insertList{padding-top:18px;}
			div.padlr20{ padding:0 10px 29px 12px;padding-bottom:0;}

			.album_select li,.insertimg_list li{ height:88px;overflow:hidden;}
			.album_select li a,.insertimg_list li a{ height:68px;}
			.album_select li img,.insertimg_list li img{max-height:68px;}

			.md_hide{ height:95px;}
			div.view_area{ height:118px;}

			div.insertList{ padding-top:12px; margin-left:14px;}

			.md_prev, .md_next{ margin-top:32px;}
			.album_select li i.pro_view{ bottom:23px;}
			.album_select li{ display:inline-block;}
			ul.f_cb{ width:101%; margin-left:-3px; display:block; position:relative;}
			.album_select li p{ line-height:17px;}

			#infscr-loading div{line-height: 100px;text-align: center;width: 100px;display: inline-block; font-weight:bold; color:#f08300;}
		</style>
		<form name="form1" method="post" action="SearchImages.aspx" id="form1">
			<div>
				<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE0NTcxNjcyMDhkZCvtVHTwBjVf/ZMHbuuA92SNTiKa">
			</div>

			<div>

				<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="37057DC9">
				<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWDgKxzae9BgKB1b+2DAKmw6bqCwLL0oGECALL0vWHCALL0umHCAKlw6bqCwKgw6bqCwKnw6bqCwKiw6bqCwKjw4qPAwKkw868CQKmw868CQKiw868CS7ltaBuu9DzVmVuKlIc9VGPfZkX">
			</div>
			<div class="photo_block">
				<!-- 选择相册 -->
				<div class="loadbar f_cb f_ml20 form_search">
					<label class="f_fl f_mr25">请选择相册</label>
					<span class="clear_bd f_fl cho_album">
						<select name="parent_id" id="parentPhoneCategoryId" class="pass_faq">
								<option value="0" directory="hbrz">顶级父类</option>
                                <#if categorys??>
									<#list categorys as category>
										<#if category?? && category.id gt 0>
											<option value="${category.id}" directory="hbrz">${category.name}</option>
                                            <#if category.childs?? && (category.childs?size > 0) >
											<#list category.childs as child>
												<option value="${child.id}" directory="hbrz">└-${child.name}</option>
											</#list>
										</#if>
										</#if>
									</#list>
								</#if>
							</select>
						<i class="revise_sub"></i>
					</span>
					<label class="f_fl f_ml25 f_mr20">图片名称</label>
					<div class="search_so f_fl">
						<input class="so_text f_fl clear_word" name="kwd" type="text">
						<input type="hidden" name="ddlFields" value="[Title]">
						<input class="so_btn f_csp f_fl" type="button" onclick="SearchObjectByGet(this)">
					</div>
				</div>
				<!-- 选择相册 end-->
			</div>
			<div class="acc_cont_x padlr20 f_cb">
				<div class="album_select f_mt20" style="height:188px; overflow:hidden; overflow-y:visible;">
					<ul class="f_cb masonry" style="position: relative; height: 0px;">

						<li pictureid="7546" id="p_7546">
							<i class="v_select"></i>
							<i class="pro_view"></i>
							<a href="javascript:;">
								<img src="https://oscimg.oschina.net/oscnet/up-1gielgc43cd0iqa37ll0wgggqdbr11fh.jpg!/both/50x50?t=1608256709000" title="1">
							</a>
							<p>1</p>
						</li>

						<li pictureid="7545" id="p_7545">
							<i class="v_select"></i>
							<i class="pro_view"></i>
							<a href="javascript:;">
								<img src="http://www.hongxin.com.cn/uploadfiles/pictures/news/20220828140224_9497.jpg" title="20191009103243_4044">
							</a>
							<p>20191009103243_4044</p>
						</li>

						<li pictureid="7544" id="p_7544">
							<i class="v_select"></i>
							<i class="pro_view"></i>
							<a href="javascript:;">
								<img src="http://www.hongxin.com.cn/uploadfiles/pictures/news/20220828140157_7092.jpg" title="20191009103256_7082">
							</a>
							<p>20191009103256_7082</p>
						</li>

						<li pictureid="7543" id="p_7543">
							<i class="v_select"></i>
							<i class="pro_view"></i>
							<a href="javascript:;">
								<img src="http://www.hongxin.com.cn/uploadfiles/pictures/news/20220828135950_2109.jpg" title="IMG_8160">
							</a>
							<p>IMG_8160</p>
						</li>

						<li pictureid="7542" id="p_7542">
							<i class="v_select"></i>
							<i class="pro_view"></i>
							<a href="javascript:;">
								<img src="http://www.hongxin.com.cn/uploadfiles/pictures/news/20220828135948_6858.jpg" title="IMG_1572.HEIC">
							</a>
							<p>IMG_1572.HEIC</p>
						</li>

						<li pictureid="7541" id="p_7541">
							<i class="v_select"></i>
							<i class="pro_view"></i>
							<a href="javascript:;">
								<img src="http://www.hongxin.com.cn/uploadfiles/pictures/news/20220828135946_0406.jpg" title="IMG_1571.HEIC">
							</a>
							<p>IMG_1571.HEIC</p>
						</li>

						<li pictureid="7540" id="p_7540">
							<i class="v_select"></i>
							<i class="pro_view"></i>
							<a href="javascript:;">
								<img src="http://www.hongxin.com.cn/uploadfiles/pictures/product/20220821161329_5870.jpg" title="小巧女性版">
							</a>
							<p>小巧女性版</p>
						</li>

						<li pictureid="7539" id="p_7539">
							<i class="v_select"></i>
							<i class="pro_view"></i>
							<a href="javascript:;">
								<img src="http://www.hongxin.com.cn/uploadfiles/pictures/product/20220821154851_1524.jpg" title="灰色脚踏款">
							</a>
							<p>灰色脚踏款</p>
						</li>

						<li pictureid="7538" id="p_7538">
							<i class="v_select"></i>
							<i class="pro_view"></i>
							<a href="javascript:;">
								<img src="http://www.hongxin.com.cn/uploadfiles/pictures/product/20220821154850_9684.jpg" title="黑色脚踏款">
							</a>
							<p>黑色脚踏款</p>
						</li>

						<li pictureid="7537" id="p_7537">
							<i class="v_select"></i>
							<i class="pro_view"></i>
							<a href="javascript:;">
								<img src="http://www.hongxin.com.cn/uploadfiles/pictures/product/20220821154850_7534.jpg" title="常规款灰色">
							</a>
							<p>常规款灰色</p>
						</li>

						<li pictureid="7536" id="p_7536">
							<i class="v_select"></i>
							<i class="pro_view"></i>
							<a href="javascript:;">
								<img src="http://www.hongxin.com.cn/uploadfiles/pictures/product/20220821154850_6084.jpg" title="常规款黑色">
							</a>
							<p>常规款黑色</p>
						</li>

						<li pictureid="7535" id="p_7535">
							<i class="v_select"></i>
							<i class="pro_view"></i>
							<a href="javascript:;">
								<img src="http://www.hongxin.com.cn/uploadfiles/pictures/product/20220821154850_4584.jpg" title="6878">
							</a>
							<p>6878</p>
						</li>


					</ul>
				</div>

				<!-- 预览图列表 -->
				<div class="viewlist bord_gray f_mt20">
					<div class="view_tips">预览插入的图片（缩略图限<span id="max">1</span>张，样张图限6张）</div>
					<div class="view_area">
						<div class="insertList f_cb">
							<div class="md_prev f_fl f_csp" id="prev_01">
								<img src="/manager/skins/css/leftjt.gif">
							</div>
							<div class="md_hide f_fl">
								<div style="width:562px;height:auto;overflow:hidden;position: relative;">
									<ul class="insertimg_list f_cb ThumbnailImage" data-src="{&quot;width&quot;:&quot;112&quot;,&quot;show&quot;:&quot;5&quot;,&quot;prev&quot;:&quot;#prev_01&quot;,&quot;next&quot;:&quot;#next_01&quot;}" style="width:10000px;position:relative;left:0;top:0;"></ul>
								</div>
							</div>
							<div class="md_next f_fl f_csp" id="next_01">
								<img src="/manager/skins/css/rightjt.gif">
							</div>
						</div>
					</div>
				</div>
			</div>

			<script type="text/javascript">
				IsPostBack = false;
			</script>
		</form>

		<script src="/manager/js/easyui/jquery.infinitescroll.min.js" type="text/javascript"></script>
		<script src="/manager/js/easyui/jquery.masonry.min.js" type="text/javascript"></script>
		<script src="/manager/js/other/thumbnailImage.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function () {
				var $container = $('ul.f_cb:eq(0)');
				$container.imagesLoaded(function () {
					$container.masonry({
						itemSelector: '.item',
						columnWidth: 240
					});
				});

				$container.infinitescroll({
							navSelector: '#page-nav', //分页导航的选择器
							nextSelector: '#page-nav a', //下页连接的选择器
							itemSelector: '.album_select li', //你要检索的所有项目的选择器
							binder: $container.parent(),
							loading: {
								finishedMsg: '已经没有了', //结束显示信息
								img: 'http://i.imgur.com/6RMhx.gif', //loading图片
								msgText: "正在加载中"
							},
							pathParse: function (url, page) {
								url = url.replace(/(page=\d*)&*/i, "");
								var sp = "&";
								if (url.indexOf("?") == -1) {
									sp = "?";
								}
								return [url + sp + "page=", ""];
							}
						},
						//作为回调函数触发masonry
						function (newElements) {
							// 当加载时隐藏所有新项目
							var $newElems = $(newElements).css({ opacity: 0 });
							// 在添加到masonry布局之前保证图片载入
							$newElems.imagesLoaded(function () {
								// 现在可以显示所有的元素了
								$newElems.animate({ opacity: 1 });
								$container.masonry('appended', $newElems, true);
							});
						});
			});
		</script>

		<div id="page-nav">
			<a href="SearchImages.aspx"></a>
		</div>
		<script type="text/javascript">
			//点击图片展示效果
			var pictureEnlarge = function (src) {
				loadCss("/manager/skins/fancybox/jquery.fancybox.css", window.top.document);
				loadJs("/manager/js/easyui/jquery.fancybox.js", function () {
					try {
						var host = "http[s]?://(www.)?" + window.location.host;
						var reg = new RegExp("(" + host.replace(/\\/, '\\').replace(/\//, '\/') + ")", "ig");
						src = src.replace(reg, "");
					} catch (e) {
						console.log(e);
					}
					window.top.$.fancybox.open(
							[
								{
									href: src,
									title: src
								}
							], {
								_autoWidth: true,
								autoResize: false,
								autoSize: false
							}
					);
				}, window.top.document);
			}
			$(function () {
				var max = window.parent._MAX_ || 100;
				$("#max").text(max);
				var lis = $(".album_select li");
				if (max == 1) {
					$(document).on("click", ".album_select li", function (event) {
						if (event && event.target && event.target.tagName == "I" && $(event.target).hasClass("pro_view")) {
							pictureEnlarge($(this).find("img").attr("src"));
							return;
						}
						lis = $(".album_select li").filter(".zon").removeClass("zon");
						$(this).addClass("zon");
						$("ul.insertimg_list").empty();
						var li = $(this).clone();
						li.find("i").remove().end().append('<i class="pro_view"></i><i class="v_dele"></i>');
						$("ul.insertimg_list").append(li);
						li.attr("id", "n_" + li.attr("id"));
					})
				} else {
					$(document).on("click", ".album_select li", function (event) {
						if (event && event.target && event.target.tagName == "I" && $(event.target).hasClass("pro_view")) {
							pictureEnlarge($(this).find("img").attr("src"));
							return;
						}
						if ($(this).hasClass("zon")) {
							var pictureid = $(this).attr("pictureid");
							$("#n_p_" + pictureid).remove();
							$(this).removeClass("zon");
						} else {
							if ($("ul.insertimg_list li").length > max - 1) {
								_alert("缩略图限" + max + "张！", false);
								return;
							} else {
								$(this).addClass("zon");
								var li = $(this).clone();
								li.find("i").remove().end().append('<i class="pro_view"></i><i class="v_dele"></i>');
								$("ul.insertimg_list").append(li);
								li.attr("id", "n_" + li.attr("id"));

								SetDraggableLi(li);
							}
						}
					})
				}
				$(document).on("click", "i.v_dele", function (event) {
					event.stopPropagation();
					var li = $(this).parents("li");
					$("#p_" + li.attr("pictureid")).removeClass("zon");
					li.remove();
				})
				$(window.parent.document.body).find("#_count_").text("12");

				$(document).on("click", "ul.insertimg_list li i.pro_view", function (event) {
					event.stopPropagation();
					pictureEnlarge($(this).parent().find("img").attr("src"));
					return false;
				})
			})
			window._clear_ = function () {
				$("i.v_dele").click();
			}
		</script>

	</body>
</html>