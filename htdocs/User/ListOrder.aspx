<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.ListOrder, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>收藏夹分类管理</title>
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
<!--Header:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Header:End-->
<!--Content:Start-->
<div class="content">
	<div class="left">
		<UserActions:UserActions runat="server" ID="uc_UserActions_1" />
	</div>
	<div class="right">
	    <div class="u_right_main">
			<UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
			<p>
				<a href="javascript:void(0)" onclick="if(confirm('您确定要删除作品记录吗？'))delAgentOrder(this,'tbItems')" class="corange">删除我的定单</a>
				</p>
			<table border="1" cellspacing="1" bordercolor="#E0E0E0" class="l_25 tc mt10" style="width:100%;" id="tbItems">
				<tr class="b" bgcolor="#F9F9F9">
					<td><input type="checkbox" onclick="checkAll(this,'tbItems')" /></td>
					 <td>编号</td>
					<td>定单名称</td>
					<td>定单回复</td>
					<td>发货状态</td>
					<td>收货状态</td>
					<td>到货期限</td>
					<td>下单时间</td>
				</tr>
				<asp:Repeater ID="rpt" runat="server"><ItemTemplate><tr>
					<td><input name="item" type="checkbox" value="<%# Eval("ID") %>" /></td>
					<td><%# ((PageIndex - 1) * PageSize) +  Container.ItemIndex + 1 %></td>
					<td style="width:120px;"><%# Eval("Title")%></td>
					<td style="width:250px;"><%# Eval("FeedBack").ToString() == "" ? "暂无" : Eval("FeedBack")%></td>
					<td><%# int.Parse(Eval("PostState").ToString())==0?"未发货":"已发货"%></td>
					<td><%# int.Parse(Eval("ReceiveState").ToString()) == 0 ? "未收获" : "已收获"%></td>
					<td><%# ((DateTime)Eval("EndDate")).ToString("yy-MM-dd")%></td>
					<td><%# ((DateTime)Eval("InputTime")).ToString("yy-MM-dd")%></td>
				</tr></ItemTemplate></asp:Repeater>
			</table>
			<div runat="server" id="nodata" visible="false">暂无数据</div>
			<OranPager:OranPager runat="server" ID="pagerMain" CssClass="apage" />
		</div>
	</div>
	<div class="clear"></div>
</div>
<!--Content:End-->
<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</body>
</html>