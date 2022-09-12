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
</head>
<body class="childrenBody">
<form class="layui-form layui-row layui-col-space10">
	<input type="hidden" id = "articleId" value="${article.id}"/>
	<input type="hidden" id = "sort" value="${article.sort}"/>
	<div class="layui-col-md8 layui-col-xs12">
		<div class="layui-row layui-col-space10">
			<div class="layui-col-md9 layui-col-xs7">
				<div class="layui-form-item magt3">
					<label class="layui-form-label">产品名称</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input articleName" lay-verify="articleName" placeholder="请输入产品名称" value="${article.name!''}">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">产品摘要</label>
					<div class="layui-input-block">
						<textarea placeholder="请输入产品摘要" class="layui-textarea articleDesc">${article.desc!''}</textarea>
					</div>
				</div>
			</div>
			<div class="layui-col-md3 layui-col-xs5">
				<div class="layui-upload-list thumbBox mag0 magt3">
					<img class="layui-upload-img thumbImg" src="${article.banner!''}">
				</div>
			</div>
		</div>
		<div class="layui-form-item magb0">
			<label class="layui-form-label">产品内容</label>
			<div class="layui-input-block">
				<textarea class="layui-textarea layui-hide article_content" id="article_content" name="content" lay-verify="content" id="article_content">${article.content!''}</textarea>
			</div>
		</div>
	</div>
	<div class="layui-col-md4 layui-col-xs12">
		<blockquote class="layui-elem-quote title"><i class="seraph icon-caidan"></i> 选择产品分类</blockquote>
		<div class="border category">
			<div class="">

			</div>
			<div id="test3" class="demo-transfer"></div>
		</div>
		<blockquote class="layui-elem-quote title magt10"><i class="layui-icon">&#xe609;</i> 发布</blockquote>
		<div class="border">
			<div class="layui-form-item articleTop">
				<label class="layui-form-label"><i class="seraph icon-zhiding"></i> 置　顶</label>
				<div class="layui-input-block">
					<input type="checkbox" name="articleTop" lay-skin="switch" lay-text="是|否">
				</div>
			</div>
			<div class="layui-form-item articleTop">
				<label class="layui-form-label"><i class="seraph icon-zhiding"></i> 推 荐</label>
				<div class="layui-input-block">
					<input type="checkbox" name="articleCream" lay-skin="switch" lay-text="是|否">
				</div>
			</div>
			<div class="layui-form-item articleTop">
				<label class="layui-form-label"><i class="seraph icon-zhiding"></i> 精　华</label>
				<div class="layui-input-block">
					<input type="checkbox" name="articleRecomm" lay-skin="switch" lay-text="是|否">
				</div>
			</div>
			<hr class="layui-bg-gray" />
			<div class="layui-right">
				<a class="layui-btn layui-btn-sm" lay-filter="addarticle" lay-submit><i class="layui-icon">&#xe609;</i>发布</a>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" src="../../../static/admin/js/xm-select.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/layui/2.7.6/layui.js" integrity="sha512-mIKH3M2bRlIyhG4tBEbJ8dn8t8JFlNJU2NXlJePgpQ72CK4jAYsZyCGFcASRGtPBbcAQhz67KTkA1Jw6Kizk9g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="../../../static/admin/js/articleEdit.js"></script>
</body>
</html>