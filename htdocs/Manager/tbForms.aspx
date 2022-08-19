<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.tbForms, qwt" enableviewstate="false" enableviewstatemac="false" %>
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
	    <div class="advanced_so f_fr form_search">
            <span class="clear_bd s_selt f_fl mr10 w140">
                <select id="ddlFields" class="pass_faq pl5">
                    <option value="[Title]">表单名称</option>
                </select>
                <i class="revise_sub"></i>
            </span>
			<div class="search_so f_fl mr10">
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
                <%--<th style="width:50px">序号</th>
                <th style="width:50px">ID</th>--%>
                <th  axis="[ColumnName]">表单名称</th>
                <th class="tac" style="width:50px" axis="[Enable]">可用</th>
                <th class="tac" style="width:120px" axis="[InputTime]">录入时间</th>
                <th class="tac" style="width:350px" axis="[InputTime]">操作</th>
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
<%--                <td class="tac"><%#Container.ItemIndex+1 %></td>
                <td class="tac"><%#Eval( "ID")%></td>--%>
                <td><a href="###"  onclick="edit(event,<%#Eval("ID") %>)"><%#Eval("Title")%></a></td>
                <td class="tac"><%--<%#(bool)Eval("IsEnable") ? "显示" : "不显示"%>--%>
                    <div class="hd_input" oid="<%#Eval("ID") %>" typename="tbforms" fileColumn="IsEnable">
                        <span class="p_show e_lowpoint <%#(bool)Eval("IsEnable")?" z_lowpoint ":""%> " cur="z_lowpoint"><input  class="hd" type="radio" <%#(bool)Eval("IsEnable")?"checked=\"checked\"":""%>/><label></label></span>
                    </div>
                </td>
                <td class="tac"><%#DateTime.Parse(Eval("inputTime").ToString()).ToString("yyyy-MM-dd")%></td>
                <td class="tac">
<%--                    <a href="javascript:;" oid="<%#Eval("ID") %>" class="css" style=" font:20px; margin-right:10px;">Css样式</a>--%>
                    <a href="tbLeaveMessage.aspx?OID=<%#Eval("ID") %>" style=" font:20px; margin-right:10px;">查看留言</a>
                    <a href="tbFields.aspx?OID=<%#Eval("ID") %>" style=" font:20px; margin-right:10px;">修改字段</a>
                    <a target="_blank" href="PreviewForm.html?id=<%#Eval("ID") %>" style=" font:20px; margin-right:10px;" >预览</a>
                    <a href="#" style=" font:20px; margin-right:10px;" oid="<%#Eval("ID") %>" class="dm">获取代码</a>
                    <a href="/survey-<%#Eval("ID") %><%=NSW.OConfig.Common.ReWriteUrlExt %>" target="_blank" style=" font:20px; margin-right:10px;">问卷调查</a>
                </td>
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
                    <asp:LinkButton ID="LinkButton1" CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click"><span>删除</span></asp:LinkButton>|
                    <span class="span_add" onclick="edit(event)">新建</span>|<span class="span_refresh">刷新</span>
                </li>
	        </ul>
        </div>
        <!-- 列表分页 结束 -->
    </form>	
</div>
</body>
<script type="text/javascript">
    $(function () {
        //SetTalk99Value("dsadda");
        $("a.dm").click(function () {
            var me = $(this);
            if (!window.getJs) {
                loadJs("js/common/popup.js", function () {
                    window.getJs = GetTalk99Pop({ width: 600, height: 200 });
                    window.getJs.pop.find(".text_area").attr("style", "border:1px solid #dcdcdc;height: 110px;width: 96%;margin: 10px;resize: none;");
                    window.getJs.setValue('<script type="text/javascript" src="/js/forms.js" oid="' + me.attr("oid") + '"><\/script>');
                })
            } else {
                window.getJs.setValue('<script type="text/javascript" src="/js/forms.js" oid="' + me.attr("oid") + '"><\/script>');
            }
        });
    })
</script>
</html>