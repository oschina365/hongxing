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
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
	<div class="layui-form-item layui-row layui-col-xs12">
		<label class="layui-form-label">菜单名</label>
		<div class="layui-input-block">
			<input type="text" class="layui-input name" lay-verify="required" placeholder="请输入菜单名">
		</div>
	</div>
	<div class="layui-form-item layui-row layui-col-xs12">
		<label class="layui-form-label">样式icon</label>
		<div class="layui-input-block">
			<input type="text" class="layui-input icon" placeholder="请输入icon，如icon-text">
		</div>
	</div>
	<div class="layui-form-item layui-row layui-col-xs12">
		<label class="layui-form-label">链接</label>
		<div class="layui-input-block">
			<input type="text" class="layui-input url" lay-verify="required" placeholder="请输入链接">
		</div>
	</div>
	<div class="layui-row">
		<div class="magb15 layui-col-md4 layui-col-xs12">
			<label class="layui-form-label">父级菜单</label>
			<div class="layui-input-block">
				<select name="parentId" class="parentId" lay-filter="parentId">
					<option value="0">注册会员</option>
					<option value="1">中级会员</option>
					<option value="2">高级会员</option>
					<option value="3">钻石会员</option>
					<option value="4">超级会员</option>
				</select>
			</div>
		</div>
	</div>
	<div class="layui-form-item layui-row layui-col-xs12">
		<label class="layui-form-label">排序</label>
		<div class="layui-input-block">
			<input type="text" class="layui-input userEmail" placeholder="请输入排序值">
		</div>
	</div>
	<div class="layui-form-item layui-row layui-col-xs12">
		<div class="layui-input-block">
			<button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="addUser">立即添加</button>
			<button type="reset" class="layui-btn layui-btn-sm layui-btn-primary">取消</button>
		</div>
	</div>
</form>
<script type="text/javascript" src="../../../static/admin/layui/layui.js"></script>
<script type="text/javascript" src="../../../static/admin/js/menuAdd.js"></script>
</body>
</html>