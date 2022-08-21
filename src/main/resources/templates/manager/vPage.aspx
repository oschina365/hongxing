<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.vPage, qwt" enableviewstate="false" enableviewstatemac="false" %>
<%@ Register Assembly="Oran.WebControl.IndexNavigator" Namespace="Oran.WebControl" TagPrefix="IndexNavi" %>
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
                    <option value="[Title]" selected="selected">标题名称</option>
                </select>
                <i class="revise_sub"></i>
            </span>
			<div class="search_so f_fl mr10">
				<input type="text" class="so_text clear_word f_fl" name="kwd" />
                <input type="hidden" name="type" value=""/>
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
<%--                <th width="10%">序号</th>--%>
                <th style="width: 100px"  axis="[Title]">微网页名称</th>
                <th style="width: 100px"  axis="[ShortDesc]">网页备注</th>        
                <th style="width: 100px"  axis="[Hits]">浏览量</th>
                <th style="width: 100px"  axis="[Enable]">状态</th>  
                <th width="15%">创建时间</th>
                <th width="10%" >微网页</th>
                <th width="10%" >二维码</th>
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
                <%--<td width="10%"><%#Container.ItemIndex + 1 + PageSize * (PageIndex - 1)%> </td>--%>
                <td width="16%"><a href="###" onclick="edit(event,<%#Eval("ID") %>)"><%#Eval("Title")%></a></td>
                <td width="16%"><%#Eval("ShortDesc").ToString().Split(new string[]{"$#$"},  StringSplitOptions.None)[0] %></td> 
                <td width="5%"><%#Eval("Hits")%></td> 
                <td class="tac"><div class="set_radios" oid="<%#Eval("ID") %>" fileColumn="Enable" typename=""><span><input type="radio" <%#(bool)Eval("Enable")?"checked=\"checked\"":""%>/><label></label></span></div></td>
                <td width="15%"><%# ((DateTime)Eval("InputTime")).ToString("yyyy-MM-dd HH:mm") %></td>
                <td width="10%"><%# "<a href='"+Eval("URL")+"' title='"+Eval("Title")+"' target='_blank'>查看</a>" %></td>
                <td class="nsw_cnt_area action_tx">
                    <p class="scl_d"><a href="##" onclick="Qrcode(this,'<%#NSW.Web.API.SysCommon.GetDomain() + Eval("URL") %>')"><span class="pro_view pro_qrcode"><i></i>二维码</span></a></p>
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
	        <div class="nsw_pagination f_fr f_mr20 f_cb">
                <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	        </div>
        </div>
        <!-- 列表分页 结束 -->
    </form>	
</div>
</body>
</html>
