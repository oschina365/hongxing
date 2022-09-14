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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/layui/2.7.6/css/layui.css" integrity="sha512-SSF+OBDODWTSIqOivYBOyOKQ93PBDevipJEUEWtkUbTt4v34rmgPcCXcBMolxZIJcuobcdqmYJlonjUBEbOzNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="../../../static/admin/css/public.css" media="all" />
	<link rel="stylesheet" href="../../../static/admin/css/upload.css" media="all" />

</head>
<body class="childrenBody">

	<form class="layui-form" action="">
		<input type="hidden" id="categoryId" value="${category.id}"/>
		<div class="layui-form-item">
			<label class="layui-form-label">分类名称</label>
			<div class="layui-input-block">
				<input type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入分类名称" class="layui-input categoryName" value="${category.name}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">分类背景图</label>
			<div class="layui-input-block">
				<#--<div class="layui-upload-list thumbBox mag0 magt3">
					<img class="layui-upload-img thumbImg" src="${category.small_icon!category.banner}">
				</div>-->
				<button type="button" class="layui-btn layui-btn-normal" onclick="selectImage();">从图库选择</button>
				<div id="goodsImages">
					<div class="goodsImageList filled">
						<ul class="imagelist">
							<#if (category.small_icon?? && category.small_icon!='') || (category.banner?? && category.banner!='')>
								<li id="WU_FILE_${category.id!''}"
									class="preview-image-li cover-select">
									<p class="title"> <a type="button" class="layui-btn layui-btn-xs" onclick="deletePreviewImage(this,'${category.small_icon!category.banner}')">删除</a></p>
									<p class="imgWrap"><img src="${category.small_icon!category.banner}"></p>
									<p class="progress"><span></span></p>

								</li>
							</#if>
						</ul>
					</div>
				</div>

				<div id="uploader" class="wu-example" <#if ((category.small_icon?? && category.small_icon!='') || (category.banner?? && category.banner!=''))>style="display: none;" </#if>>
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
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">分类描述</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入分类描述，非必填" class="layui-textarea categoryDesc" name="desc">${category.desc!''}</textarea>
			</div>
		</div>
		<#if category.parent_id gt 0>
		<div class="layui-form-item">
			<label class="layui-form-label">父级分类</label>
			<div class="layui-input-block">
				<select  name="parent_id" class="parent_id" lay-filter="parent_id">
					<option value="0">无</option>
					<#if categorys??>
						<#list categorys as item>
							<#if item?? && item.id gt 0>
								<option value="${item.id}" <#if item.id==category.parent_id> selected="selected"</#if>>${item.name}</option>
							</#if>
						</#list>
					</#if>
				</select>
			</div>
		</div>
		</#if>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="addCategory">修改</button>
			</div>
		</div>
	</form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/layui/2.7.6/layui.js" integrity="sha512-mIKH3M2bRlIyhG4tBEbJ8dn8t8JFlNJU2NXlJePgpQ72CK4jAYsZyCGFcASRGtPBbcAQhz67KTkA1Jw6Kizk9g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="../../../static/admin/js/productCategoryEdit.js"></script>
	<script type="text/javascript" src="../../../static/admin/js/images.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
	<script src="https://cdn.bootcdn.net/ajax/libs/webuploader/0.1.1/webuploader.min.js"></script>
</body>
</html>