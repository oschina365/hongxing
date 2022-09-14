<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>文章列表--武汉红鑫家具后台管理系统</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="../../../static/admin/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="../../../static/admin/css/public.css" media="all" />
	<link rel="stylesheet" href="../../../static/admin/css/upload.css" media="all" />
</head>
<body class="childrenBody">
<form class="layui-form layui-row layui-col-space10">
	<input type="hidden" id = "productId" value="${product.id}"/>
	<input type="hidden" id = "sort" value="${product.sort}"/>
	<div class="layui-col-md8 layui-col-xs12">
		<div class="layui-row layui-col-space10">
			<div class="layui-col-md9 layui-col-xs7">
				<div class="layui-form-item magt3">
					<label class="layui-form-label">产品名称</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input productName" lay-verify="productName" placeholder="请输入产品名称" value="${product.name!''}">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">产品摘要</label>
					<div class="layui-input-block">
						<textarea placeholder="请输入产品摘要" class="layui-textarea productDesc">${product.desc!''}</textarea>
					</div>
				</div>
			</div>
			<div class="layui-col-md3 layui-col-xs5">
				<div class="layui-upload-list thumbBox mag0 magt3">
					<img class="layui-upload-img thumbImg" src="${product.banner!''}">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">产品主图</label>
			<div class="layui-input-block">
				<#--<div class="layui-upload-list thumbBox mag0 magt3">
					<img class="layui-upload-img thumbImg" src="${category.small_icon!category.banner}">
				</div>-->
				<button type="button" class="layui-btn layui-btn-normal" onclick="selectImage();">从图库选择</button>
				<div id="goodsImages">
					<div class="goodsImageList filled">
						<ul class="imagelist">
							<#if productImages??>
								<#list productImages as productImage>
									<li id="WU_FILE_${productImage.id!''}"
										class="preview-image-li cover-select">
										<p class="title"> <a type="button" class="layui-btn layui-btn-xs" onclick="deletePreviewImage(this,'${productImage.image}')">删除</a></p>
										<p class="imgWrap"><img src="${productImage.image}"></p>
										<p class="progress"><span></span></p>
									</li>
								</#list>
							</#if>
						</ul>
					</div>
				</div>

				<div id="uploader" class="wu-example" <#if productImages??>style="display: none;"</#if>>
					<div class="queueList">
						<div id="dndArea" class="placeholder" style="min-height: 200px!important;">
							<div id="filePicker"></div>
							<p>或将照片拖到这里(分类背景图仅可上传一张)</p>
						</div>
					</div>
					<div class="statusBar" style="display:none;">
						<div class="progress">
							<span class="text">0%</span>
							<span class="percentage"></span>
						</div>
						<div class="info"></div>
						<div class="btns">
							<div id="filePicker2"></div>
							<div class="uploadBtn">开始上传</div>
						</div>
					</div>
				</div>

			</div>
			<#--<label class="layui-form-label">分类背景图</label>
			<div class="layui-input-block">
				<ul class="layer-photos-demo" id="Images">
					<#if category.small_icon?? || category.banner??>
					</#if>
				</ul>
			</div>-->


		</div>

		<div class="layui-form-item magb0">
			<label class="layui-form-label">产品内容</label>
			<div class="layui-input-block">
				<textarea class="layui-textarea layui-hide product_content" id="product_content" name="content" lay-verify="content" id="product_content">${product.content!''}</textarea>
			</div>
		</div>
	</div>
	<div class="layui-col-md4 layui-col-xs12">
		<blockquote class="layui-elem-quote title"><i class="seraph icon-caidan"></i> 选择产品分类</blockquote>
		<div class="border category">
			<div class="">

			</div>
			<#--<div id="test3" class="demo-transfer"></div>-->
			<div id="demo1" class="xm-select-demo"></div>
		</div>
		<blockquote class="layui-elem-quote title magt10"><i class="layui-icon">&#xe609;</i> 发布</blockquote>
		<div class="border">
			<div class="layui-form-item productTop">
				<label class="layui-form-label"><i class="seraph icon-zhiding"></i> 置　顶</label>
				<div class="layui-input-block">
					<input type="checkbox" name="productTop" lay-skin="switch" lay-text="是|否">
				</div>
			</div>
			<div class="layui-form-item productTop">
				<label class="layui-form-label"><i class="seraph icon-zhiding"></i> 推 荐</label>
				<div class="layui-input-block">
					<input type="checkbox" name="productCream" lay-skin="switch" lay-text="是|否">
				</div>
			</div>
			<div class="layui-form-item productTop">
				<label class="layui-form-label"><i class="seraph icon-zhiding"></i> 精　华</label>
				<div class="layui-input-block">
					<input type="checkbox" name="productRecomm" lay-skin="switch" lay-text="是|否">
				</div>
			</div>
			<hr class="layui-bg-gray" />
			<div class="layui-right">
				<a class="layui-btn layui-btn-sm" lay-filter="addProduct" lay-submit><i class="layui-icon">&#xe609;</i>发布</a>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" src="../../../static/admin/js/xm-select.js"></script>
<script type="text/javascript" src="../../../static/admin/layui/layui.js"></script>
<script type="text/javascript" src="../../../static/admin/js/productEdit.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
	<script src="https://cdn.bootcdn.net/ajax/libs/webuploader/0.1.1/webuploader.min.js"></script>
</body>
</html>