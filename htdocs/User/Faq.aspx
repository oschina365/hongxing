<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.User.User_Faq, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title>会员中心首页</title>
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
<body><form runat="server" id="form1">
<!--Header:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Header.html")%>
<!--Header:End-->
<!--Content:Start-->
<div class="content">
	<UserActions:UserActions runat="server" ID="uc_UserActions_1" />
	<div class="right">
	    <div class="u_right_main">
    	    <UserLoc:UserLoc runat="server" ID="uc_UserLoc_1" />
    	    <asp:Repeater runat="server" ID="rpt"><ItemTemplate><div class="u_faq">
			    <div class="wt">
				    <p><strong>您的意见：</strong><%# Eval("Title") %></p>
				    <p><%# Eval("ShortDesc") %></p>
			    </div>
			    <%# ((string)Eval("Answer")).Length > 0 ? "<div class='mt5 for c666 l_20'><p><strong>回答：</strong></p><p>" +Eval("Answer") + "</p></div>" : string.Empty %>
		    </div></ItemTemplate></asp:Repeater>
		    <div runat="server" id="nodata" visible="false">暂无数据</div>
            <OranPager:OranPager runat="server" ID="pagerMain" CssClass="apage" />
            <table class="faq_tab" id="tbForm">
			    <tr>
				    <td>建议标题：</td>
				    <td><input type="text" size="50" id="txtFdTitle" /></td>
			    </tr>
			    <tr>
				    <td class="vat">详细描述：</td>
				    <td><textarea cols="50" rows="8" id="txtFdShortDesc" max="1000" onkeyup="limitLength(this)"></textarea></td>
			    </tr>
			    <tr>
				    <td></td>
				    <td>请详细填写您的建议。(1000字节以内)</td>
			    </tr>
			    <tr>
				    <td></td>
				    <td>
				        <input type="button" class="b17" value="保 存" onclick="userFeedback(this)" />
					    <input type="button" class="b18" value="重 填" onclick="emptyText('tbForm')" />
				    </td>
			    </tr>
		    </table>
        </div>
	    <div class="clear"></div>
	</div>
	<div class="clear"></div>
</div>
<!--Content:End-->
<!--Footer:Start-->
<%=NVEngine.NVTempHelp.LoadNVTemp("Common/Footer.html")%>
<!--Footer:End-->
</form></body>
</html>