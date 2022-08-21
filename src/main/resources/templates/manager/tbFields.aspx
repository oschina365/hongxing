<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.tbFields, qwt" enableviewstate="false" enableviewstatemac="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-cn" xml:lang="zh-cn">
<head id="Head1" runat="server">
<title><%= ItemName %></title>

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
        <SpanCurrentPosition:SpanCurrentPosition ID="cur" runat="server"/>
    </div>
</div>
<div class="col_main">
    <form id="Form2" runat="server">
        <!-- 列表区 开始 -->
        <table class="nsw_pro_list" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
            <tr id="tabHeader">
                <th style="width:50px" class="p"><span class="cho"></span></th>
<%--                <th style="width:50px">序号</th>--%>
                <th style="width:50px">标题</th>
                <th style="width:120px" axis="[ColumnName]">类型</th>
                <th style="width:50px" axis="[Enable]">初始文本</th>
                <th style="width:120px" axis="[InputTime]">必填</th>
                <th style="width:120px" axis="[InputTime]">长度</th>
                <th style="width:120px" axis="[InputTime]">是否可用</th>
                <th style="width:120px">后台列表显示</th>
                <th style="width:120px" axis="[InputTime]">排序</th>
<%--                <th style="width:120px" axis="[InputTime]">操作</th>--%>
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
                <%--<td class="tac"><%#Container.ItemIndex %></td>--%>
                <td><a href="tbFields_edit.aspx?OID=<%#Eval("OID") %>&ID=<%#Eval("ID") %>"><%#Eval("Title")%></a></td>
                <td class="tac"><%#Eval("Type")%></td>
                <td class="tac"><%#Eval("InitialText")%></td>
                <td class="tac"><%#(bool)Eval("IsRequired") ? "√" : "×"%></td>
                <td class="tac"><%#Eval("length")%></td>
                <td class="tac"><%#(bool)Eval("IsListShow") ? "√" : "×"%></td>
                <td class="tac"><%#(bool)Eval("IsEnable") ? "√" : "×"%></td>
                <td class="tac"><%#Eval("OrderID")%></td>
<%--                <td class="tac"><a href="javascript:;" class="sc" oid="<%#Eval("ID")%>" style=" font-size:18px;">×</a></td>--%>
            </tr>
            </ItemTemplate></asp:Repeater>
            <tr id="noItemYet" runat="server" visible="false"><td class="noItemYet" style=" text-align:center;" colspan="99">没有任何项目</td></tr>
        </table>
        <!-- 列表分页 开始 -->
        <div class="nsw_tools_bar f_cb">
	        <ul class="nsw_check_btns f_fl">
		        <li class="f_ml20">
                    <span class="sele_all"><input type="radio" class="dn" /><em class="e_word"></em>全选</span>|
                    <span class="sele_inverse">反选</span>
                </li>
		        <li class="f_ml20">
                    <asp:LinkButton ID="lnkBtnDel" CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click"><span>删除</span></asp:LinkButton>|
                    <span class="span_add"><a href="tbFields_edit.aspx?oid=<%=OID %>" target="frmEditor">新建</a></span>|<span class="span_refresh">刷新</span>|<a href="tbForms.aspx" target="frmEditor"><span class="span_return">返回</span></a>
                </li>
	        </ul>
        </div>
        <!-- 列表分页 结束 -->
    </form>	
</div>
</body>
</html>