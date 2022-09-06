<%@ page language="C#" autoeventwireup="true" inherits="NSW.Web.Manager.picture, qwt" enableviewstate="false" enableviewstatemac="false" %>
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
<div>
<div class="so_bread">
    <div class="nsw_bread_tit f_cb">
        <SpanCurrentPosition:SpanCurrentPosition ID="cur" runat="server"/>
	    <div class="advanced_so f_fr form_search">
             <span class="clear_bd s_selt f_fl mr10 w140" id="pictureColumn">
			    <select class="pass_faq" name="cid">
			        <%=NSW.Admin.Tools.AdminTools.FillColumnData("<option value='{sid}' oid='{id}'>{title}</option>", "Picture")%>
			    </select>
			    <i class="revise_sub"></i>
		    </span>
            <span class="clear_bd s_selt f_fl mr10 w140">
                <select id="ddlFields" class="pass_faq pl5">
                    <option value="[Title]">标题</option>
                    <option value="[SrcFilename]">原文件名称</option>
                    <option value="[Ext]">后缀</option>
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
    <div class="bd_main">
        <div class="bd_main_left">
            <form id="Form2" runat="server">
                <table class="nsw_pro_list pictures_list_table" id="nsw_list_table" cellpadding="0" cellspacing="0" width="100%">
                    <tr id="tabHeader">
                        <th style="width:50px" class="p"><span class="cho"></span></th>
                        <th axis="[Title]" style="width:100px">标题</th>
                        <th axis="[Path]" style="width:200px">预览</th>
                        <th axis="[ColumnID]" style="width:200px">分类</th>
                        <th axis="[Ext]" style="width:80px">后缀</th>
                        <th axis="[SrcFilename]" style="width:100px">原文件名</th>
                        <th axis="[ContentSize]" style="width:80px">大小</th>
                        <th axis="[Revision]" style="width:50px">版本</th>
                        <th axis="[InputTime]" style="width:120px">录入时间</th>
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
                        <td><span class="editor_warp" data-src='{"action":"alertTitle","editor":"input_editor","type":"picture","oid":"<%#Eval("ID") %>"}'><%#Eval("Title") %></span></td>
                        <td class="pimgsv">
                            <span class="shot_img f_fl insertimg_list_li">
                                <img src="<%#NSW.Web.API.SysCommon.IsNullOrEmpty(Eval("path").ToString(), "Skins/css/nopic.jpg")%>" oid="<%#Eval("ID") %>" onerror="onImgErrors(this);" />
                                <i class="v_edit"></i>
                                <i class="v_cat"></i>
                            </span>
                        </td>
                        <td>
                            <span class="editor_warp alertColumn" data-src='{"action":"alertColumn","editor":"select_editor","source":"#pictureColumn","type":"picture","value":"<%#Eval("ColumnID") %>","oid":"<%#Eval("id") %>"}'></span>
                        </td>
                        <td class="tac"><%# Eval("Ext")%></td>
                        <td class="tac"><%# Eval("SrcFilename")%></td>
                        <td class="tac"><%#MyTool.GetFileSize(Eval("ContentSize"))%></td>
                        <td class="tac"><%# Eval("Revision")%></td>
                        <td><%# ((DateTime)Eval("InputTime")).ToString("yyyy-MM-dd<br />HH:mm:ss") %></td>
                    </tr>
                    </ItemTemplate></asp:Repeater>
                    <tr id="noItemYet" runat="server" visible="false"><td class="noItemYet" style=" text-align:center;" colspan="99">没有任何项目</td></tr>
                </table>
                <div class="nsw_tools_bar f_cb">
	                <ul class="nsw_check_btns f_fl">
		                <li class="f_ml20">
                            <span class="sele_all"><input type="radio" class="dn" /><em class="e_word"></em>全选</span>|
                            <span class="sele_inverse">反选</span>
                        </li>
		                <li class="f_ml20">
                            <asp:LinkButton ID="LinkDel" CommandName="del" runat="server" OnClientClick="return BatchOperation();" onclick="LinkButton_Click"><span>删除</span>|</asp:LinkButton>
                            <span class="span_add editor_warp" data-src='{"editor":"AddImg"}'>添加</span>|<span class="span_refresh">刷新</span>|<span><asp:LinkButton ID="LinkCompress" CommandName="compress" runat="server" OnClientClick="return BatchOperation1('确定压缩选中项（共{count}项）？',this)" OnClick="LinkButton_Click"><input class="qt dn" name="qt" />批量压缩</asp:LinkButton></span>
                        </li>
	                </ul>
	                <div class="nsw_pagination f_fr f_mr20 f_cb">
                        <IndexNavi:IndexNavigator runat="server" ID="pagerMain" />
	                </div>
                </div>
            </form>
        </div>
    </div>
    <RightColumn:RightColumn IsShowAdd="false" runat="server" PostSum="" TabName="vw_picturecolumn" />
    <div class="clear"></div>
</div>
<script type="text/javascript">
    var toggleWatermark = <%=NSW.OConfig.GlobalConfig.Watermark.ToggleWatermark.ToString().ToLower() %>;
</script>
<script type="text/javascript" src="js/other/pictures.js"></script>
</body></html>