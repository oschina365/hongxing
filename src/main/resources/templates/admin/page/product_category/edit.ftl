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

	<form class="layui-form" action="">
		<input type="hidden" id="id" value="${category.id}"/>
		<div class="layui-form-item">
			<label class="layui-form-label">分类名称</label>
			<div class="layui-input-block">
				<input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入分类名称" class="layui-input" value="${category.name}">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">分类描述</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入分类描述，非必填" class="layui-textarea">${category.desc!''}</textarea>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">父级分类</label>
			<div class="layui-input-block">
				<select name="interest" lay-filter="aihao">
					<option value="0">无</option>
					<#if categorys??>
						<#list categorys as item>
							<#if item?? && item.id gt 0>
								<option value="${item.id}" <#if item.id==category.parent_id> selected</#if>>${item.name}</option>
							</#if>
						</#list>
					</#if>
				</select>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/layui/2.7.6/layui.js" integrity="sha512-mIKH3M2bRlIyhG4tBEbJ8dn8t8JFlNJU2NXlJePgpQ72CK4jAYsZyCGFcASRGtPBbcAQhz67KTkA1Jw6Kizk9g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="../../../static/admin/js/productCategoryEdit.js"></script>
</body>
</html>