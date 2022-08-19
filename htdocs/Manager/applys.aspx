<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.applys, qwt" enableviewstate="false" enableviewstatemac="false" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
    <title><%=ItemName %></title>
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
<div class="so_bread">
    <div class="nsw_bread_tit f_cb">
        <SpanCurrentPosition:SpanCurrentPosition runat="server"/>
	    <div class="advanced_so f_fr form_search">
			<div class="search_so f_fl">
                <input type="hidden" name="field" value="[Name]|[Content]" />
				<input type="text" class="so_text clear_word f_fl" name="kwd" />
				<input type="button" class="so_btn f_csp f_fl" onclick="SearchObjectByGet(this)" />
			</div>
		</div>
    </div>
</div>
<div class="col_main">
    <form id="Form2" runat="server">
        <!-- 列表区 开始 -->
        <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
            <tr id="tabHeader">
                <th style="width:50px" class="p"><span class="cho"></span></th>
<%--                <th style="width: 50px">
                    序号
                </th>
                <th style="width: 50px">
                    ID
                </th>--%>
                <th style="width: 140px" axis="[Name]">
                    网站名称
                </th>
                <th style="width: 100px" axis="[Url]">
                    连接地址
                </th>
                <th style="width: 100px" axis="[Type]">
                    连接类型
                </th>
                <th style="width: 100px" axis="[UserName]">
                    联系人
                </th>
                <th style="width: 100px" axis="[Phone]">
                    电话
                </th>
                <th style="width: 100px" axis="[Email]">
                    Email
                </th>
                <th style="width: 100px" axis="[QQ]">
                    QQ
                </th>
                <th style="width: 80px" axis="[State]">
                    状态
                </th>
                <th style="width: 120px" axis="[InputTime]">
                    录入时间
                </th>
            </tr>
            <asp:Repeater ID="rptMain" runat="server"><ItemTemplate>
            <tr class="child_1">
                <td class="td1">
                    <div class="nsw_check_box">
                        <span class="ck_box">
                            <span class="dn">
                                <input type="checkbox" name="chkItem" value="<%#Eval("ID") %>"/>
                            </span>
                        </span>
                    </div>
                </td>
<%--                <td class="tac">
                    <%#Container.ItemIndex + 1 + PageSize * (PageIndex - 1)%>
                </td>
                <td class="tac">
                    <%#Eval( "ID")%>
                </td>--%>
                <td>
                    <a href="###" onclick="edit(event,<%#Eval("ID") %>)">
                        <%#Eval("Name")%></a>
                </td>
                <td>
                    <a target="_blank" href="<%# Eval("Url") %>">
                        <%# Eval("Url") %></a>
                </td>
                <td>
                    <%# Eval("Type").ToString()=="0"?"文字连接":"图片连接"%>
                </td>
                <td class="tac">
                    <%#Eval("UserName")%>
                </td>
                <td class="tac">
                    <%#Eval("Phone")%>
                </td>
                <td class="tac">
                    <%#Eval("Email")%>
                </td>
                <td class="tac">
                    <%#Eval("QQ")%>
                </td>
                <td class="tac">
                    <%#Eval("State").ToString() == "0" ? "<font color='red'>禁用</font>" : "<font color='green'>采用</font>"%>
                </td>
                <td>
                    <%# ((DateTime)Eval("InputTime")).ToString("yyyy-MM-dd<br />HH:mm:ss") %>
                </td>
            </tr>
            </ItemTemplate></asp:Repeater>
            <tr id="noItemYet" runat="server" visible="false"><td class="noItemYet" style="text-align:center;" colspan="99">没有任何项目</td></tr>
        </table>
        <!-- 列表分页 开始 -->
        <div class="nsw_tools_bar f_cb">
	        <ul class="nsw_check_btns f_fl">
		        <li class="f_ml20">
                    <span class="sele_all"><input type="radio" class="dn" /><em class="e_word"></em>全选</span>|
                    <span class="sele_inverse">反选</span>
                </li>
		        <li class="f_ml20">
                    <asp:LinkButton CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click"><span>删除</span></asp:LinkButton>|
                    <span class="span_add" onclick="edit(event)">新建</span>|<span class="span_refresh">刷新</span>
                </li>
	        </ul>
	        <div class="nsw_pagination f_fr f_mr20 f_cb">
                <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	        </div>
        </div>
    </form>	
</div>

</body>
</html>
