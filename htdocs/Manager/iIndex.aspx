<%@ page language="C#" autoeventwireup="true" inherits="iIndex, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head runat="server">
<title></title>
<link href="skins/base/common.css" rel="stylesheet" type="text/css"/>
<link href="skins/default/default.css" rel="stylesheet" type="text/css"/>
<link href="skins/base/index.css" rel="stylesheet" type="text/css"/>
    <script src="js/easyui/jquery.min.js" type="text/javascript"></script>
<script src="js/common/Common.js" type="text/javascript"></script>
<!-- hongxin.com.cn/Mobile Baidu tongji analytics -->
<script>
var _hmt = _hmt || [];
(function() {
var hm = document.createElement("script");
hm.src = "https://hm.baidu.com/hm.js?25e431cff63a206eb286efd246de5f2d";
var s = document.getElementsByTagName("script")[0];
s.parentNode.insertBefore(hm, s);
})();
</script>
</head>
<body>
<!-- bread_title -->
<CurrentPosition:CurrentPosition ID="cur" runat="server"/>
<div class="col_main">
    <form id="form1" runat="server" onsubmit="top.refreshList=true">

		<div class="bord_gray">
			<div class="graybar_one f_cb">
				<div class="wel_name">欢迎登陆<span class="color_orange"><%=NSW.OConfig.GlobalConfig.SiteName%></span>网站后台</div>
				<span class="wel_revise" id="wel_revise">[ 修改 ]</span>
			</div>
			<div class="wel_info">
				<table cellspacing="" cellpadding="0" class="admin_table table_class1">
					<tr>
						<td class="td30"><label>姓   名</label><em class="clear_bd"><asp:TextBox CssClass="com_input admin_name" runat="server" ID="txtChnName"></asp:TextBox><i class="clear_x"></i></em></td>
						<td class="td30"><label>部   门</label><em class="clear_bd"><asp:TextBox CssClass="com_input admin_name" runat="server" ID="txtDepartment"></asp:TextBox><i class="clear_x"></i></em></td>
						<td class="td30">管理员角色：<%=OBJ.isSystem?"超级管理员":"普通管理员" %></td>
						<td class="td10"></td>
					</tr>
					<tr>
						<td class="td30"><label>手机号</label><em class="clear_bd"><asp:TextBox CssClass="com_input admin_name" runat="server" ID="txtMPhone"></asp:TextBox><i class="clear_x"></i></em></td>
						<td class="td30"><label>E-mail</label><em class="clear_bd"><asp:TextBox CssClass="com_input admin_name" runat="server" ID="txtUserEmail"></asp:TextBox><i class="clear_x"></i></em></td>
						<td class="td30"></td>
						<td class="td10"></td>
					</tr>
					<tr>
						<td colspan="4"></td>
					</tr>
					<tr>
						<td class="td30">登陆次数：<%=OBJ.UserLogins %>次</td>
						<td class="td30">登陆IP：<%=IP %></td>
						<td class="td30"></td>
						<td class="td10"></td>
					</tr>
					<tr>
						<td class="td30">上次登陆时间：<%=OBJ.LastLogin.ToString("yyyy-MM-dd HH:mm:ss")%></td>
						<td class="td30">上次登陆IP：<%=OBJ.LastIP %></td>
						<td class="td30"></td>
						<td class="td10"></td>
					</tr>

				</table>
				<em class="wel_line"></em>
				<div class="admin_btn"><div class="save_btn"><em class="mini_ico"></em><asp:Button ID="btnSave" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" /></div></div>	
			</div>

		</div>

		<div class="bord_gray f_mt25">
			<div class="graybar_one f_cb">
				<div class="wel_name">常用操作</div>
			</div>
			<div class="wel_info">

				<table cellspacing="" cellpadding="0" class="admin_table table_class1">
					<tr>
						<td class="td12">产品管理：</td>
						<td>
                            <a href="products_edit.aspx" target="frmEditor">添加产品</a><em class="cutline">|</em>
                            <a href="product_column_edit.aspx" target="frmEditor">添加分类</a>
                        </td>
					</tr>
					<tr>
						<td class="td12">内容管理：</td>
						<td>
                            <a href="news_edit.aspx" target="frmEditor">添加资讯文章</a><em class="cutline">|</em>
                            <a href="news_column_edit.aspx" target="frmEditor">添加资讯分类</a><em class="cutline">|</em>
                            <a href="helps_edit.aspx" target="frmEditor">添加帮助文档</a><em class="cutline">|</em>
                            <a href="help_column_edit.aspx" target="frmEditor">添加帮助分类</a>
                        </td>
					</tr>
					<tr>
						<td class="td12">搜索引擎优化：</td>
						<td>
                            <a href="sitepage.aspx" target="frmEditor">独立页面设置</a><em class="cutline">|</em>
                            <a href="keywords.aspx" target="frmEditor">关键词管理</a><em class="cutline">|</em>
                            <a href="sitemap.aspx" target="frmEditor">网站地图管理</a>
                        </td>
					</tr>
					<tr>
						<td class="td12">订单管理：</td>
						<td>
                            <a href="orders.aspx?type=1" target="frmEditor">最新订单</a><em class="cutline">|</em>
                            <a href="orders.aspx" target="frmEditor">订单列表</a>
                        </td>
					</tr>
					<tr>
						<td class="td12">工具管理：</td>
						<td>
                            <a href="ads_edit.aspx" target="frmEditor">添加广告</a><em class="cutline">|</em>
                            <a href="applys_edit.aspx" target="frmEditor">添加友情链接</a><em class="cutline">|</em>
                            <a href="pictures.aspx" target="frmEditor">上传图片</a><em class="cutline">|</em>
                            <a href="subsite_info.aspx" target="frmEditor">分站管理</a>
                        </td>
					</tr>
				</table>

			</div>

		</div>

		<div class="bord_gray f_mt25">
			<div class="graybar_one f_cb">
				<div class="wel_name">密码</div>
				<span class="wel_revise" id="pass_revise">[ 修改 ]</span>
			</div>
			<div class="wel_info">
						
				<table cellspacing="" cellpadding="0" class="admin_table table_class1 table_class2">
					<tr>
						<td class="td30"><label>新密码</label><em class="clear_bd"><asp:TextBox CssClass="com_input admin_name" runat="server" ID="txtUserPassword"></asp:TextBox><i class="clear_x"></i></em></td>
						<td class="td30"></td>
						<td class="td30"></td>
					</tr>
					<tr>
						<td class="td30"><label>密码保护问题</label><em class="clear_bd"><asp:TextBox CssClass="com_input admin_name" runat="server" ID="txtSecQus"></asp:TextBox><i class="clear_x"></i></em></td>
						<td class="td30 wel_faq">
                            <%--
                            <em class="clear_bd">
                                <select class="pass_faq" name="select_faq">
                                    <option>1</option>
                                    <option>2</option>
                                </select>
                                <i class="revise_sub"></i>
                            </em>
                            --%>
                        </td>
						<td class="td30"></td>
					</tr>
					<tr>
						<td class="td30"><label>答案</label><em class="clear_bd"><asp:TextBox ID="txtAnswer" runat="server" CssClass="com_input admin_name"></asp:TextBox><i class="clear_x"></i></em></td>
						<td class="td30"></td>
						<td class="td30"></td>
					</tr>
				</table>
				<div class="admin_btn"><div class="save_btn"><em class="mini_ico"></em><asp:Button ID="Button1" CommandName="return" runat="server" Text="保 存" onclick="btnSubmit_Click" /></div></div>
			</div>
		</div>

    </form>
</div>
<style type="text/css">
.admin_btn{ display:none;}
</style>
<script type="text/javascript">
    $(function () {
        $(".table_class1 a").click(function (event) {
            SaveURL();
        })
        $(".wel_revise").bind("click", function () {
            var admin_btn = $(this).parents("div.bord_gray").find("div.admin_btn");
            admin_btn.toggle();
        })
    })
</script>
</body>
</html>
